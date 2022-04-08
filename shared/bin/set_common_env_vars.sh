# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

info_msg "Setting up environment variables"

# Make sure that AWS_FPGA_REPO_DIR is set to the location of this script.
if [[ ":$AWS_FPGA_REPO_DIR" == ':' ]]; then
  debug_msg "AWS_FPGA_REPO_DIR not set so setting to $script_dir"
  export AWS_FPGA_REPO_DIR=$script_dir
elif [[ $AWS_FPGA_REPO_DIR != $script_dir ]]; then
  info_msg "Changing AWS_FPGA_REPO_DIR from $AWS_FPGA_REPO_DIR to $script_dir"
  export AWS_FPGA_REPO_DIR=$script_dir
else
  debug_msg "AWS_FPGA_REPO_DIR=$AWS_FPGA_REPO_DIR"
fi

# HDK
# Clear environment variables
unset HDK_DIR
unset HDK_COMMON_DIR
unset HDK_SHELL_DIR
unset HDK_SHELL_DESIGN_DIR

export -f allow_non_root
export -f allow_others

if  allow_non_root || allow_others ; then
	export AWS_FPGA_SDK_GROUP=${AWS_FPGA_SDK_GROUP:-"fpgauser"}
	export SDK_NON_ROOT_USER=$(whoami)
  info_msg "Allowing group ${AWS_FPGA_SDK_GROUP} access to FPGA management tools and resources"
fi


export HDK_DIR=$AWS_FPGA_REPO_DIR/hdk

# The next variable should not be modified and should always point to the /common directory under HDK_DIR
export HDK_COMMON_DIR=$HDK_DIR/common

# Point to the latest version of AWS shell
export HDK_SHELL_DIR=$(readlink -f $HDK_COMMON_DIR/shell_stable)

# Set the common shell design dir
export HDK_SHELL_DESIGN_DIR=$HDK_SHELL_DIR/design

# SDK
unset SDK_DIR

export SDK_DIR=$AWS_FPGA_REPO_DIR/sdk

# SDACCEL
# Setup Location of SDACCEL_DIR
export SDACCEL_DIR=$AWS_FPGA_REPO_DIR/SDAccel
#  Vitis
# Setup Location of VITIS_DIR
export VITIS_DIR=$AWS_FPGA_REPO_DIR/Vitis

# PYTHONPATH
# Update PYTHONPATH with libraries used for unit testing
python_lib=$AWS_FPGA_REPO_DIR/shared/lib
PYTHONPATH=$python_lib:$PYTHONPATH
export PYTHONPATH

# PATH Changes

export PATH=$(echo $PATH | sed -e 's/\(^\|:\)[^:]\+\/shared\/bin\/scripts\(:\|$\)/:/g; s/^://; s/:$//')
PATH=$AWS_FPGA_REPO_DIR/shared/bin/scripts:$PATH

# Enable xilinx licensing
export XILINX_ENABLE_AWS_WHITELIST=095707098027
