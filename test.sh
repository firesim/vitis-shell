#!/bin/bash

echo "Running test out of $PWD"

BIN_DIR=$PWD/../output/vitis/FireSim-FireSimNoMemPortConfig-F90MHz_BaseVitisConfig
XCL_DIR=/scratch/abejgonza/vitis-work/firesim-vitis/build_dir.hw_emu.xilinx_u250_gen3x16_xdma_3_1_202020_1
FSIM_VITIS_DIR=/scratch/abejgonza/vitis-work/firesim-vitis

# copy the emconfig.json  to the area where the bin is
cp -rf $FSIM_VITIS_DIR/_x.hw_emu.xilinx_u250_gen3x16_xdma_3_1_202020_1/emconfig.json $BIN_DIR/emconfig.json

# create debug file (only if -g enabled)
echo "[Emulation]" > $BIN_DIR/xrt.ini
#echo "debug_mode=none" >> $BIN_DIR/xrt.ini # no waves
echo "debug_mode=batch" >> $BIN_DIR/xrt.ini # wave dump at end
#echo "debug_mode=gui" >> $BIN_DIR/xrt.ini # wave dump throughout

XCL_EMULATION_MODE=hw_emu $BIN_DIR/FireSim-vitis \
    +permissive \
        +macaddr0=00:00:00:00:00:02 \
        +blkdev-in-mem0=128 \
        +linklatency0=6405 \
        +netbw0=100 \
        +shmemportname0=0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 \
        +niclog0=niclog0 \
        +blkdev-log0=blkdev-log0 \
        +fesvr-step-size=128 \
        +netburst0=8 \
        +device_index=0 \
        +binary_file=$XCL_DIR/firesim.xclbin \
    +permissive-off \
    +prog0=/scratch/abejgonza/chipyard-work/chipyard/tests/helloWorld.riscv </dev/null

echo "Wow this passed."
exit 0
