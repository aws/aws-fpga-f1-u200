vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ila_vio_counter/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/ila_vio_counter/sim/ila_vio_counter.v" \


vlog -work xil_defaultlib \
"glbl.v"

