// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0


//Put module name of the CL design here.  This is used to instantiate in top.sv
`define CL_NAME cl_template

//Highly recommeneded.  For lib FIFO block, uses less async reset (take advantage of
// FPGA flop init capability).  This will help with routing resources.
`define FPGA_LESS_RST

//Must have this define or will get syntax errors.  Curretly XDMA not supported.
`define NO_XDMA
