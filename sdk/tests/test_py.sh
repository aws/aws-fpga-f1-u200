#!/bin/bash

# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0
cd $SDK_DIR/apps/byte_swapper
flask run --host=0.0.0.0 > flask_server.log 2>&1 &
echo "CHILDPID $!"
cat flask_server.log
