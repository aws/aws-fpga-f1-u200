vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xsdbm_v3_0_0
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lut_buffer_v2_0_0

vmap xsdbm_v3_0_0 modelsim_lib/msim/xsdbm_v3_0_0
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lut_buffer_v2_0_0 modelsim_lib/msim/lut_buffer_v2_0_0

vlog -work xsdbm_v3_0_0 -64 -incr "+incdir+../../../ipstatic/hdl/verilog" "+incdir+../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog" \
"../../../ipstatic/hdl/xsdbm_v3_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic/hdl/verilog" "+incdir+../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/sim/bd_a493_xsdbm_0.v" \

vlog -work lut_buffer_v2_0_0 -64 -incr "+incdir+../../../ipstatic/hdl/verilog" "+incdir+../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog" \
"../../../ipstatic/hdl/lut_buffer_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic/hdl/verilog" "+incdir+../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog" \
"../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_1/sim/bd_a493_lut_buffer_0.v" \
"../../../../ip.gen/sources_1/ip/cl_debug_bridge/bd_0/sim/bd_a493.v" \
"../../../../ip.gen/sources_1/ip/cl_debug_bridge/sim/cl_debug_bridge.v" \

vlog -work xil_defaultlib \
"glbl.v"

