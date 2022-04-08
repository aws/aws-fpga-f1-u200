vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_22
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_21
vlib questa_lib/msim/axi_crossbar_v2_1_23
vlib questa_lib/msim/xil_defaultlib

vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 questa_lib/msim/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 questa_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 questa_lib/msim/axi_crossbar_v2_1_23
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23 -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/ec67/hdl" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_xbar_0/sim/cl_axi_interconnect_xbar_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_s00_regslice_0/sim/cl_axi_interconnect_s00_regslice_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_s01_regslice_0/sim/cl_axi_interconnect_s01_regslice_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_m00_regslice_0/sim/cl_axi_interconnect_m00_regslice_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_m01_regslice_0/sim/cl_axi_interconnect_m01_regslice_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_m02_regslice_0/sim/cl_axi_interconnect_m02_regslice_0.v" \
"../../../bd/cl_axi_interconnect/ip/cl_axi_interconnect_m03_regslice_0/sim/cl_axi_interconnect_m03_regslice_0.v" \
"../../../bd/cl_axi_interconnect/sim/cl_axi_interconnect.v" \

vlog -work xil_defaultlib \
"glbl.v"

