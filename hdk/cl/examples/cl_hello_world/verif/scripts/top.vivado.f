# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

-define VIVADO_SIM

-sourcelibext .v
-sourcelibext .sv
-sourcelibext .svh

-sourcelibdir ${CL_ROOT}/../common/design
-sourcelibdir ${CL_ROOT}/design
-sourcelibdir ${CL_ROOT}/verif/sv
-sourcelibdir ${SH_LIB_DIR}
-sourcelibdir ${SH_INF_DIR}
-sourcelibdir ${SH_SH_DIR}
-sourcelibdir ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/hdl
-sourcelibdir ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/sim

-include ${CL_ROOT}/../common/design
-include ${CL_ROOT}/verif/sv
-include ${SH_LIB_DIR}
-include ${SH_INF_DIR}
-include ${SH_SH_DIR}
-include ${HDK_COMMON_DIR}/verif/include
-include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/sim
-include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog
-include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice/hdl
-include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/hdl

${CL_ROOT}/../common/design/cl_common_defines.vh
${CL_ROOT}/design/cl_hello_world_defines.vh
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/ila_vio_counter/sim/ila_vio_counter.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/ila_0/sim/ila_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/sim/bd_a493.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/sim/bd_a493_xsdbm_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/xsdbm_v3_0_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/ltlib_v1_0_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_1/sim/bd_a493_lut_buffer_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_1/hdl/lut_buffer_v2_0_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/hdl/bd_a493_wrapper.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/sim/cl_debug_bridge.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/vio_0/sim/vio_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/sim/axi_register_slice_light.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice/sim/axi_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/hdl/axi_register_slice_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/hdl/axi_infrastructure_v1_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/axi_clock_converter_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/fifo_generator_v13_2_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/sim/axi_clock_converter_0.v
${CL_ROOT}/design/cl_hello_world.sv

-f ${HDK_COMMON_DIR}/verif/tb/filelists/tb.${SIMULATOR}.f

${TEST_NAME}
