vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_4
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lmb_v10_v3_0_11
vlib activehdl/lmb_bram_if_cntlr_v4_0_19
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/iomodule_v3_1_6

vmap xpm activehdl/xpm
vmap microblaze_v11_0_4 activehdl/microblaze_v11_0_4
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_11 activehdl/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 activehdl/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap iomodule_v3_1_6 activehdl/iomodule_v3_1_6

vlog -work xpm  -sv2k12 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"/tools/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/tools/xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_4 -93 \
"../../../ipstatic/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_0/sim/bd_d2ea_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_1/sim/bd_d2ea_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_11 -93 \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_2/sim/bd_d2ea_ilmb_0.vhd" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_3/sim/bd_d2ea_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19 -93 \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_4/sim/bd_d2ea_dlmb_cntlr_0.vhd" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_5/sim/bd_d2ea_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_6/sim/bd_d2ea_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_7/sim/bd_d2ea_second_dlmb_cntlr_0.vhd" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_8/sim/bd_d2ea_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_9/sim/bd_d2ea_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_6 -93 \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/ip/ip_10/sim/bd_d2ea_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/bd_0/sim/bd_d2ea.v" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_0/sim/ddr4_core_d_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/map" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top" "+incdir+../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/phy/ddr4_core_d_phy_ddr4.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/ip_1/rtl/ip_top/ddr4_core_d_phy.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top/ddr4_core_d_ddr4.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top/ddr4_core_d_ddr4_mem_intfc.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/cal/ddr4_core_d_ddr4_cal_riu.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/rtl/ip_top/ddr4_core_d.sv" \
"../../../../ip.gen/sources_1/ip/ddr4_core_d/tb/microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

