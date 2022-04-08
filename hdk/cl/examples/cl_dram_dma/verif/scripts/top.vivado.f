# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

--define VIVADO_SIM

--sourcelibext .v
--sourcelibext .sv
--sourcelibext .svh

--sourcelibdir ${CL_ROOT}/design
--sourcelibdir ${SH_LIB_DIR}
--sourcelibdir ${SH_INF_DIR}
--sourcelibdir ${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim

--include ${CL_ROOT}/../common/design
--include ${CL_ROOT}/design
--include ${CL_ROOT}/verif/sv

--include ${SH_LIB_DIR}
--include ${SH_INF_DIR}
--include ${HDK_COMMON_DIR}/verif/include
--include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/sim
--include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/cl_debug_bridge/bd_0/ip/ip_0/hdl/verilog
--include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice/hdl
--include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/hdl
--include ${CL_ROOT}/design/axi_crossbar_0
--include ${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/bd/cl_axi_interconnect/ipshared/7e3a/hdl
--include ${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim

-f ${HDK_COMMON_DIR}/verif/tb/filelists/tb.${SIMULATOR}.f
${TEST_NAME}

${CL_ROOT}/design/cl_dram_dma_defines.vh
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/sim/axi_clock_converter_0.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/dest_register_slice/sim/dest_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/src_register_slice/sim/src_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice/sim/axi_register_slice.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_register_slice_light/sim/axi_register_slice_light.v
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
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/axi_clock_converter_v2_1_vl_rfs.v
${HDK_SHELL_DESIGN_DIR}/ip/ip.gen/sources_1/ip/axi_clock_converter_0/hdl/fifo_generator_v13_2_rfs.v


${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_bi_delay.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_db_delay_model.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_db_dly_dir.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_dir_detect.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_rcd_model.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_rank.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_dimm.sv
${HDK_COMMON_DIR}/verif/models/ddr4_rdimm_wrapper/ddr4_rdimm_wrapper.sv
${SH_LIB_DIR}/bram_2rw.sv
${SH_LIB_DIR}/flop_fifo.sv
${SH_LIB_DIR}/lib_pipe.sv
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/mgt_gen_axl.sv
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/ccf_ctl.v
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/mgt_acc_axl.sv
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/sync.v
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/flop_ccf.sv
${HDK_SHELL_DESIGN_DIR}/sh_ddr/sim/sh_ddr.sv


--define DISABLE_VJTAG_DEBUG
${CL_ROOT}/design/axil_slave.sv
${CL_ROOT}/design/mem_scrb.sv
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
