#!/bin/bash

# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# TODO
# Check if /build and /design directories exist, abort
# Check if $HDK_COMMON_DIR exist

cp -rL $HDK_SHELL_DIR/new_cl_template/build .
cp -r  $HDK_SHELL_DIR/new_cl_template/design .
