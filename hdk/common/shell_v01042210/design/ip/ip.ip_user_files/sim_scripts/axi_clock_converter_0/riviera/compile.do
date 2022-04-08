vlib work
vlib riviera

vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_clock_converter_v2_1_21
vlib riviera/xil_defaultlib

vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_clock_converter_v2_1_21 riviera/axi_clock_converter_v2_1_21
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_21  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../../ip.gen/sources_1/ip/axi_clock_converter_0/sim/axi_clock_converter_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

