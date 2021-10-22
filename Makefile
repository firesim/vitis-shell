# Makefile to build Vitis based FireSim
#
# Assumptions:
#   Host must be x86
#   You have the Vitis 2020.2 + XRT tools installed

PROJECT_NAME := firesim

.PHONY: help
help::
	@echo "make xclbin or clean or cleanall"

ifndef XILINX_VITIS
	$(error XILINX_VITIS variable is not set, please set correctly and rerun)
endif

# also supports "hw"
TARGET ?= hw_emu
# current support on firesim1
DEVICE ?= xilinx_u250_gen3x16_xdma_3_1_202020_1

#   device2xsa - create a filesystem friendly name from device name
#   $(1) - full name of device
device2xsa = $(strip $(patsubst %.xpfm, % , $(shell basename $(DEVICE))))

XSA := $(call device2xsa, $(DEVICE))
TEMP_DIR := ./_x.$(TARGET).$(XSA)
BUILD_DIR := ./build_dir.$(TARGET).$(XSA)
LOG_DIR := ./$(TARGET).$(XSA).logs
REPORT_DIR := ./$(TARGET).$(XSA).reports
MSG_RULES := ./msg.mrf

BINARY_CONTAINER := $(BUILD_DIR)/$(PROJECT_NAME).xclbin
BINARY_CONTAINER_OBJ := $(TEMP_DIR)/$(PROJECT_NAME).xo
BINARY_CONTAINER_LINK_OBJ := $(TEMP_DIR)/$(PROJECT_NAME).link.xclbin

.PHONY: build
build: $(BINARY_CONTAINER) emconfig

.PHONY: xclbin
xclbin: build

emconfig: $(TEMP_DIR)/emconfig.json
$(TEMP_DIR)/emconfig.json:
	emconfigutil --platform $(DEVICE) --od $(TEMP_DIR)

PACKAGE_OUT = ./package.$(TARGET)

# Building kernel (xclbin)
VPP := $(XILINX_VITIS)/bin/v++
VPP_TARGET_PLATFORM += -t $(TARGET) --platform $(DEVICE)
VPP_OTHER_FLAGS += --save-temps --report_level 2 -g
VPP_DEFINES = -DVIVADO_SIM=1 -DRANDOMIZE_MEM_INIT=1 -DRANDOMIZE_REG_INIT=1 -DRANDOMIZE_GARBAGE_ASSIGN=1 -DRANDOMIZE_INVALID_ASSIGN=1 -DPRINTF_COND=1'b1 -DSTOP_COND=1'b1
VPP_MSG_FLAGS = --message-rules $(MSG_RULES) --log_dir $(LOG_DIR) --report_dir $(REPORT_DIR)
PROFILE := no
ifeq ($(PROFILE), yes)
	VPP_LDFLAGS += --profile.data all:all:all
endif
DEBUG := no
ifeq ($(DEBUG), yes)
	VPP_LDFLAGS += --debug.list_ports
endif

# link and package the xclbin
$(BINARY_CONTAINER_LINK_OBJ): $(BINARY_CONTAINER_OBJ)
	mkdir -p $(TEMP_DIR)
	$(VPP) $(VPP_TARGET_PLATFORM) $(VPP_OTHER_FLAGS) $(VPP_DEFINES) $(VPP_MSG_FLAGS) --link \
		$(VPP_LDFLAGS) \
		--temp_dir $(TEMP_DIR) \
		-o $@ \
		$+

$(BINARY_CONTAINER): $(BINARY_CONTAINER_LINK_OBJ)
	mkdir -p $(BUILD_DIR)
	$(VPP) $(VPP_TARGET_PLATFORM) $(VPP_DEFINES) $(VPP_MSG_FLAGS) --package \
		--temp_dir $(TEMP_DIR) \
		--package.out_dir $(PACKAGE_OUT) \
		-o $@ \
		$+

# Package and create xo
VIVADO := $(XILINX_VIVADO)/bin/vivado
$(BINARY_CONTAINER_OBJ): scripts/package_kernel.tcl scripts/gen_xo.tcl vsrcs/*.sv vsrcs/*.v
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $@ $(PROJECT_NAME) $(TARGET) $(DEVICE) $(XSA)

.PHONY: clean
clean:
	rm -rf profile_* TempConfig system_estimate.xtxt *.rpt *.csv
	rm -rf src/*.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb

.PHONY: cleanall
cleanall: clean
	rm -rf build_dir* sd_card*
	rm -rf package.* .ipcache
	rm -rf _x* *xclbin.run_summary qemu-memory-_* emulation _vimage pl* start_simulation.sh *.xclbin
	rm -rf ./tmp_kernel_pack* ./packaged_kernel*
	rm -rf *.logs *.reports
