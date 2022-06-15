vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ila_vio_counter/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/ila_vio_counter/sim/ila_vio_counter.v" \


vlog -work xil_defaultlib \
"glbl.v"

