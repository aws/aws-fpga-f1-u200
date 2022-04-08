# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

##################################################
### Tcl Procs and Params
##################################################
####Set params to disable OREG_B* in URAM for synthesis and physical synthesis
if {$uram_option != 2} {
  set_param synth.elaboration.rodinMoreOptions {rt::set_parameter disableOregPackingUram true}
  set_param physynth.ultraRAMOptOutput false
}

####Enable support of clocking from one RP to another (SH-->CL)
set_param hd.supportClockNetCrossDiffReconfigurablePartitions 1 

# Maintain DONT TOUCH functionality for 2020.2 onwards
if {[string match *2020.2* [version -short]] || [string match *2021.* [version -short]]} {set_param project.replaceDontTouchWithKeepHierarchySoft false}
