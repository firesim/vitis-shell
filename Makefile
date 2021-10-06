# Makefile to build Vitis based FireSim
#
# Assumptions:
#   Host must be x86
#   You have the Vitis 2020.2 + XRT tools installed

PROJECT_NAME := firesim

.PHONY: help

help::
	@echo "Makefile Usage:"
	@echo "  make xclbin DEVICE=<FPGA platform>"
	@echo "      Command to HW package"

ifndef XILINX_VITIS
	$(error XILINX_VITIS variable is not set, please set correctly and rerun)
endif

TARGET := hw

#   device2xsa - create a filesystem friendly name from device name
#   $(1) - full name of device
device2xsa = $(strip $(patsubst %.xpfm, % , $(shell basename $(DEVICE))))

XSA :=
ifneq ($(DEVICE), )
XSA := $(call device2xsa, $(DEVICE))
endif
TEMP_DIR := ./_x.$(TARGET).$(XSA)
BUILD_DIR := ./build_dir.$(TARGET).$(XSA)
LOG_DIR := ./$(TARGET).$(XSA).logs
REPORT_DIR := ./$(TARGET).$(XSA).reports
MSG_RULES := ./msg.mrf

BINARY_CONTAINER := $(BUILD_DIR)/$(PROJECT_NAME).xclbin
BINARY_CONTAINER_OBJ := $(TEMP_DIR)/$(PROJECT_NAME).xo

.PHONY: build
build: $(BINARY_CONTAINER)

.PHONY: xclbin
xclbin: build

# Building kernel (xclbin)
VPP := $(XILINX_VITIS)/bin/v++
VPP_FLAGS += -t $(TARGET) --platform $(DEVICE) --save-temps

$(BINARY_CONTAINER): $(BINARY_CONTAINER_OBJ)
	mkdir -p $(BUILD_DIR)
	$(VPP) $(VPP_FLAGS) -l $(VPP_LDFLAGS) --temp_dir $(TEMP_DIR) -o $(BUILD_DIR)/$(PROJECT_NAME).link.xclbin --message-rules $(MSG_RULES) --log_dir $(LOG_DIR) --report_dir $(REPORT_DIR) $+
	$(VPP) -p $(BUILD_DIR)/$(PROJECT_NAME).link.xclbin -t $(TARGET) --platform $(DEVICE) --package.out_dir $(PACKAGE_OUT) -o $(BINARY_CONTAINER) --message-rules $(MSG_RULES) --log_dir $(LOG_DIR) --report_dir $(REPORT_DIR)

# Package and create xo
VIVADO := $(XILINX_VIVADO)/bin/vivado
$(BINARY_CONTAINER_OBJ): scripts/package_kernel.tcl scripts/gen_xo.tcl vsrcs/*.sv
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
