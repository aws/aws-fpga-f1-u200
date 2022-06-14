vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_22
vlib questa_lib/msim/xil_defaultlib

vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 questa_lib/msim/axi_register_slice_v2_1_22
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../ipstatic/ipshared/ec67/hdl" \
"../../../ipstatic/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22 -64 "+incdir+../../../ipstatic/ipshared/ec67/hdl" \
"../../../ipstatic/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic/ipshared/ec67/hdl" \
"../../../../ip.gen/sources_1/ip/cl_axi_interconnect_m00_regslice_0/sim/cl_axi_interconnect_m00_regslice_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

