# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# Set Clock Group properties based on specified recipe
# Clock Group A
set CLK_MODULE_PATH STATIC_SHELL_I/SHELL_I/CLK_MODULE_I

if {[string compare $clock_recipe_a "A1"] == 0} {
  set_property CLKFBOUT_MULT_F    6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE      1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F   6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE    12 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT2_DIVIDE     4 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT3_DIVIDE     3 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_a "A2"] == 0} {
  set_property CLKFBOUT_MULT_F    6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE      1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  96 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE    96 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT2_DIVIDE    12 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT3_DIVIDE    24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} else { #A0
  set_property CLKFBOUT_MULT_F    6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE      1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  12 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE    24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT2_DIVIDE     8 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT3_DIVIDE     6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
}

# Clock Group B
if {[string compare $clock_recipe_b "B1"] == 0} {
  set_property CLKFBOUT_MULT_F   5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F 10 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE   20 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_b "B2"] == 0} {
  set_property CLKFBOUT_MULT_F  18 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  2 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE    4 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_b "B3"] == 0} {
  set_property CLKFBOUT_MULT_F   5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE   20 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_b "B4"] == 0} {
  set_property CLKFBOUT_MULT_F  24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  4 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE   16 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_b "B5"] == 0} {
  set_property CLKFBOUT_MULT_F  24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  3 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE   12 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} else { #B0
  set_property CLKFBOUT_MULT_F   5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property DIVCLK_DIVIDE     1 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT0_DIVIDE_F  5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
  set_property CLKOUT1_DIVIDE   10 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_B/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
}

# Clock Group C
if {[string compare $clock_recipe_c "C1"] == 0} {
   set_property CLKFBOUT_MULT_F  24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT0_DIVIDE_F  8 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT1_DIVIDE    6 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_c "C2"] == 0} {
   set_property CLKFBOUT_MULT_F  24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT0_DIVIDE_F 16 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT1_DIVIDE   12 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} elseif {[string compare $clock_recipe_c "C3"] == 0} {
   set_property CLKFBOUT_MULT_F  16 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT0_DIVIDE_F  4 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT1_DIVIDE    3 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
} else { #C0
   set_property CLKFBOUT_MULT_F  24 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property DIVCLK_DIVIDE     5 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT0_DIVIDE_F  4 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
   set_property CLKOUT1_DIVIDE    3 [get_cells $CLK_MODULE_PATH/CLK_WIZARD_C/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst]
}
