vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../ip.gen/sources_1/ip/ila_vio_counter/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/ila_vio_counter/sim/ila_vio_counter.v" \


vlog -work xil_defaultlib \
"glbl.v"

