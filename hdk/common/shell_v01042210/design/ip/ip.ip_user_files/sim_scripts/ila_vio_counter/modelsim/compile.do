vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../ip.gen/sources_1/ip/ila_vio_counter/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/ila_vio_counter/sim/ila_vio_counter.v" \


vlog -work xil_defaultlib \
"glbl.v"

