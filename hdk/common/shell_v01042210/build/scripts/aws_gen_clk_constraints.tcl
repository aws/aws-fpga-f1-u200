# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0


# Clock Group A
switch $clock_recipe_a {
    "A0" {
        set clk_main_a0_period        8
        set clk_main_a0_half_period   4
        set clk_extra_a1_period      16
        set clk_extra_a1_half_period  8
        set clk_extra_a2_period       5.333
        set clk_extra_a2_half_period  2.667
        set clk_extra_a3_period       4
        set clk_extra_a3_half_period  2
    }
    "A1" {
        set clk_main_a0_period        4
        set clk_main_a0_half_period   2
        set clk_extra_a1_period       8
        set clk_extra_a1_half_period  4
        set clk_extra_a2_period       2.667
        set clk_extra_a2_half_period  1.333
        set clk_extra_a3_period       2
        set clk_extra_a3_half_period  1
    }
    "A2" {
        set clk_main_a0_period        64
        set clk_main_a0_half_period   32
        set clk_extra_a1_period      128
        set clk_extra_a1_half_period  64
        set clk_extra_a2_period        8
        set clk_extra_a2_half_period   4
        set clk_extra_a3_period       16
        set clk_extra_a3_half_period   8
    }
    default {
        puts "$clock_recipe_a is NOT a valid clock_recipe_a."
    }
}

# Clock Group B
switch $clock_recipe_b {
    "B0" {
        set clk_extra_b0_period       4
        set clk_extra_b0_half_period  2
        set clk_extra_b1_period       8
        set clk_extra_b1_half_period  4
    }
    "B1" {
        set clk_extra_b0_period       8
        set clk_extra_b0_half_period  4
        set clk_extra_b1_period      16
        set clk_extra_b1_half_period  8
    }
    "B2" {
        set clk_extra_b0_period       2.222
        set clk_extra_b0_half_period  1.111
        set clk_extra_b1_period       4.444
        set clk_extra_b1_half_period  2.222
    }
    "B3" {
        set clk_extra_b0_period       4
        set clk_extra_b0_half_period  2
        set clk_extra_b1_period      16
        set clk_extra_b1_half_period  8
    }
    "B4" {
        set clk_extra_b0_period       3.333
        set clk_extra_b0_half_period  1.667
        set clk_extra_b1_period      13.333
        set clk_extra_b1_half_period  6.667
    }
    "B5" {
        set clk_extra_b0_period       2.5
        set clk_extra_b0_half_period  1.25
        set clk_extra_b1_period      10
        set clk_extra_b1_half_period  5
    }
    default {
        puts "$clock_recipe_b is NOT a valid clock_recipe_b."
    }
}

# Clock Group C
switch $clock_recipe_c {
    "C0" {
        set clk_extra_c0_period       3.333
        set clk_extra_c0_half_period  1.667
        set clk_extra_c1_period       2.5
        set clk_extra_c1_half_period  1.25
    }
    "C1" {
        set clk_extra_c0_period       6.667
        set clk_extra_c0_half_period  3.333
        set clk_extra_c1_period       5
        set clk_extra_c1_half_period  2.5
    }
    "C2" {
        set clk_extra_c0_period      13.333
        set clk_extra_c0_half_period  6.667
        set clk_extra_c1_period      10
        set clk_extra_c1_half_period  5
    }
    "C3" {
        set clk_extra_c0_period       5
        set clk_extra_c0_half_period  2.5
        set clk_extra_c1_period       3.75
        set clk_extra_c1_half_period  1.875
    }
    default {
        puts "$clock_recipe_c is NOT a valid clock_recipe_c."
    }
}

# Write out CL clocks constraints

if { [file exists $CL_DIR/build/constraints/cl_clocks_aws.xdc] } {
        puts "Deleting old CL clocks constraints file since it will be replaced.";
        file delete -force $CL_DIR/build/constraints/cl_clocks_aws.xdc
}
set clocks_file [open "$CL_DIR/build/constraints/cl_clocks_aws.xdc" w]

puts $clocks_file "#-------------------------------------------------------------------------"
puts $clocks_file "# Do not edit this file! It is auto-generated from $argv0."
puts $clocks_file "#-------------------------------------------------------------------------"

puts $clocks_file "# Group A Clocks"
puts $clocks_file "create_clock -period $clk_main_a0_period  -name clk_main_a0 -waveform {0.000 $clk_main_a0_half_period}  \[get_ports clk_main_a0\]"
puts $clocks_file "create_clock -period $clk_extra_a1_period -name clk_extra_a1 -waveform {0.000 $clk_extra_a1_half_period} \[get_ports clk_extra_a1\]"
puts $clocks_file "create_clock -period $clk_extra_a2_period -name clk_extra_a2 -waveform {0.000 $clk_extra_a2_half_period} \[get_ports clk_extra_a2\]"
puts $clocks_file "create_clock -period $clk_extra_a3_period -name clk_extra_a3 -waveform {0.000 $clk_extra_a3_half_period} \[get_ports clk_extra_a3\]\n"

puts $clocks_file "# Group B Clocks"
puts $clocks_file "create_clock -period $clk_extra_b0_period -name clk_extra_b0 -waveform {0.000 $clk_extra_b0_half_period} \[get_ports clk_extra_b0\]"
puts $clocks_file "create_clock -period $clk_extra_b1_period -name clk_extra_b1 -waveform {0.000 $clk_extra_b1_half_period} \[get_ports clk_extra_b1\]\n"

puts $clocks_file "# Group C Clocks"
puts $clocks_file "create_clock -period $clk_extra_c0_period -name clk_extra_c0 -waveform {0.000 $clk_extra_c0_half_period} \[get_ports clk_extra_c0\]"
puts $clocks_file "create_clock -period $clk_extra_c1_period -name clk_extra_c1 -waveform {0.000 $clk_extra_c1_half_period} \[get_ports clk_extra_c1\]"

close $clocks_file


