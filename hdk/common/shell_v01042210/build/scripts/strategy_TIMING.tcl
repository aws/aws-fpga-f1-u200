# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

source $HDK_SHELL_DIR/build/scripts/params.tcl
source $HDK_SHELL_DIR/build/scripts/uram_options.tcl

set synth_options "-no_lc -shreg_min_size 5 -fsm_extraction one_hot -resource_sharing off $synth_uram_option"
set synth_directive "default"

#Set psip to 1 to enable Physical Synthesis in Placer
set psip 0

set link 1

set opt 1
set opt_options    ""
set opt_directive  "Explore"
set opt_preHookTcl  "$HDK_SHELL_DIR/build/scripts/check_uram.tcl"
set opt_postHookTcl "$HDK_SHELL_DIR/build/scripts/apply_debug_constraints.tcl"

set place 1
set place_options    ""
set place_directive  "ExtraNetDelay_high"
set place_preHookTcl ""
set place_postHookTcl ""

set phys_opt 1
set phys_options     ""
set phys_directive   ""
set phys_directive   "AggressiveExplore"
set phys_preHookTcl  ""
set phys_postHookTcl ""

set route 1
set route_options    "-tns_cleanup"
set route_directive  "Explore"
set route_preHookTcl ""
set route_postHookTcl ""

set route_phys_opt 1
set post_phys_options     ""
set post_phys_directive   "AggressiveExplore"
set post_phys_preHookTcl  ""
set post_phys_postHookTcl ""
