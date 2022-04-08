# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

+define+QUESTA_SIM

+libext+.v
+libext+.sv
+libext+.svh

-y ${CL_ROOT}/design
-y ${SH_LIB_DIR}
-y ${SH_INF_DIR}
-y ${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim

+incdir+${CL_ROOT}/../common/design
+incdir+${CL_ROOT}/design
+incdir+${CL_ROOT}/verif/sv
+incdir+${CL_ROOT}/verif/tests
+incdir+${SH_LIB_DIR}
+incdir+${SH_INF_DIR}
+incdir+${HDK_COMMON_DIR}/verif/include
+incdir+${CL_ROOT}/design/axi_crossbar_0
+incdir+${SH_LIB_DIR}/../ip/cl_axi_interconnect/ipshared/7e3a/hdl
+incdir+${HDK_COMMON_DIR}/verif/models/fpga
+incdir+${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim
+incdir+${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/src_register_slice/hdl

-f ${HDK_COMMON_DIR}/verif/tb/filelists/tb.${SIMULATOR}.f
${TEST_NAME}

${SH_LIB_DIR}/bram_2rw.sv
${SH_LIB_DIR}/flop_fifo.sv

${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_xbar_0/sim/cl_axi_interconnect_xbar_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_s00_regslice_0/sim/cl_axi_interconnect_s00_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_s01_regslice_0/sim/cl_axi_interconnect_s01_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_m00_regslice_0/sim/cl_axi_interconnect_m00_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_m01_regslice_0/sim/cl_axi_interconnect_m01_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_m02_regslice_0/sim/cl_axi_interconnect_m02_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ip/cl_axi_interconnect_m03_regslice_0/sim/cl_axi_interconnect_m03_regslice_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/sim/cl_axi_interconnect.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/dest_register_slice/hdl/axi_register_slice_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/simulation/fifo_generator_vlog_beh.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/axi_clock_converter_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/fifo_generator_v13_2_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/sim/axi_clock_converter_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/dest_register_slice/sim/dest_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/src_register_slice/sim/src_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice/sim/axi_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/sim/axi_register_slice_light.v

+define+DISABLE_VJTAG_DEBUG
${CL_ROOT}/design/axil_slave.sv
${CL_ROOT}/design/cl_dram_dma_defines.vh
${CL_ROOT}/design/cl_tst_scrb.sv
${CL_ROOT}/design/cl_tst.sv
${CL_ROOT}/design/cl_int_tst.sv
${CL_ROOT}/design/cl_dram_dma_pkg.sv
${CL_ROOT}/design/cl_dma_pcis_slv.sv
${CL_ROOT}/design/cl_pcim_mstr.sv
${CL_ROOT}/design/cl_ila.sv
${CL_ROOT}/design/cl_vio.sv
${CL_ROOT}/design/cl_int_slv.sv
${CL_ROOT}/design/cl_ocl_slv.sv
${CL_ROOT}/design/cl_sda_slv.sv
${CL_ROOT}/design/cl_dram_dma_axi_mstr.sv
${CL_ROOT}/design/cl_dram_dma.sv
