#
# Copyright (C) 2020 Xilinx, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

set path_to_hdl "./vsrcs"
set path_to_packaged "./packaged_kernel_${suffix}"
set path_to_tmp_project "./tmp_kernel_pack_${suffix}"

create_project -force kernel_pack $path_to_tmp_project
add_files -norecurse [glob $path_to_hdl/*.v $path_to_hdl/*.sv]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project -root_dir $path_to_packaged -vendor xilinx.com -library RTLKernel -taxonomy /KernelIP -import_files -set_current false
ipx::unload_core $path_to_packaged/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $path_to_packaged $path_to_packaged/component.xml

set core [ipx::current_core]

set_property core_revision 2 $core
foreach up [ipx::get_user_parameters] {
    ipx::remove_user_parameter [get_property NAME $up] $core
}

ipx::associate_bus_interfaces -busif ddr_0 -clock ap_clk $core
ipx::associate_bus_interfaces -busif ddr_1 -clock ap_clk $core
ipx::associate_bus_interfaces -busif ddr_2 -clock ap_clk $core
ipx::associate_bus_interfaces -busif ddr_3 -clock ap_clk $core
ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk $core
ipx::associate_bus_interfaces -busif pcie_dma -clock ap_clk $core

ipx::infer_bus_interface ap_clk_2 xilinx.com:signal:clock_rtl:1.0 $core
ipx::infer_bus_interface ap_rst_n_2 xilinx.com:signal:reset_rtl:1.0 $core

# Specify the freq_hz parameter
set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk"]
set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
# Set desired frequency
set_property value 250000000 $clkbifparam
# set value_resolve_type 'user' if the frequency can vary.
#set_property value_resolve_type user $clkbifparam
# set value_resolve_type 'immediate' if the frequency cannot change.
set_property value_resolve_type immediate $clkbifparam

# Specify the freq_hz parameter
set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk_2"]
set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
# Set desired frequency
# TODO: Have FireSim TCL set this
set_property value 250000000 $clkbifparam
# set value_resolve_type 'user' if the frequency can vary.
#set_property value_resolve_type user $clkbifparam
# set value_resolve_type 'immediate' if the frequency cannot change.
set_property value_resolve_type immediate $clkbifparam

# Add FireSim IP
create_ip -name axi_clock_converter -vendor xilinx.com -library ip -version 2.1 -module_name axi_clock_converter_s_axi_control
set_property -dict [list \
    CONFIG.ADDR_WIDTH {25} \
    CONFIG.DATA_WIDTH {32} \
    CONFIG.ID_WIDTH {12} \
    CONFIG.AWUSER_WIDTH {1} \
    CONFIG.ARUSER_WIDTH {1} \
    CONFIG.RUSER_WIDTH {1} \
    CONFIG.WUSER_WIDTH {1} \
    CONFIG.BUSER_WIDTH {1} \
] [get_ips axi_clock_converter_s_axi_control]

create_ip -name axi_clock_converter -vendor xilinx.com -library ip -version 2.1 -module_name axi_clock_converter_pcie_dma
set_property -dict [list \
    CONFIG.ADDR_WIDTH {64} \
    CONFIG.DATA_WIDTH {512} \
    CONFIG.ID_WIDTH {6} \
    CONFIG.AWUSER_WIDTH {1} \
    CONFIG.ARUSER_WIDTH {1} \
    CONFIG.RUSER_WIDTH {1} \
    CONFIG.WUSER_WIDTH {1} \
    CONFIG.BUSER_WIDTH {1} \
] [get_ips axi_clock_converter_pcie_dma]

create_ip -name axi_clock_converter -vendor xilinx.com -library ip -version 2.1 -module_name axi_clock_converter_ddr
set_property -dict [list \
    CONFIG.ADDR_WIDTH {64} \
    CONFIG.DATA_WIDTH {64} \
    CONFIG.ID_WIDTH {16} \
    CONFIG.AWUSER_WIDTH {0} \
    CONFIG.ARUSER_WIDTH {0} \
    CONFIG.RUSER_WIDTH {0} \
    CONFIG.WUSER_WIDTH {0} \
    CONFIG.BUSER_WIDTH {0} \
] [get_ips axi_clock_converter_ddr]

set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
set_property sdx_kernel true $core
set_property sdx_kernel_type rtl $core
set_property supported_families { } $core
set_property auto_family_support_level level_2 $core
ipx::create_xgui_files $core
ipx::update_checksums $core
ipx::check_integrity -kernel $core
ipx::save_core $core
close_project -delete
