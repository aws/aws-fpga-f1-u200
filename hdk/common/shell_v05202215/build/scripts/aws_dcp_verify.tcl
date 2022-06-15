# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# ################################################
# Emulate AWS Bitstream Generation
# ################################################
puts "AWS FPGA: Emulate AWS bitstream generation"

# Make temp dir for bitstream
file mkdir $CL_DIR/build/${timestamp}_aws_verify_temp_dir

# Verify the Developer DCP is compatible with SH_BB. 
pr_verify -full_check $CL_DIR/build/checkpoints/to_aws/${timestamp}.SH_CL_routed.dcp $HDK_SHELL_DIR/build/checkpoints/from_aws/SH_CL_BB_routed.dcp

open_checkpoint $CL_DIR/build/checkpoints/to_aws/${timestamp}.SH_CL_routed.dcp

write_bitstream -force -bin_file $CL_DIR/build/${timestamp}_aws_verify_temp_dir/${timestamp}.SH_CL_final.bit

# Clean-up temp dir for bitstream
file delete -force $CL_DIR/build/${timestamp}_aws_verify_temp_dir

close_design


