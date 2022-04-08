// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

`ifndef CL_DRAM_DMA_DEFINES
`define CL_DRAM_DMA_DEFINES

//Put module name of the CL design here.  This is used to instantiate in top.sv
`define CL_NAME cl_dram_dma

//Highly recommeneded.  For lib FIFO block, uses less async reset (take advantage of
// FPGA flop init capability).  This will help with routing resources.
`define FPGA_LESS_RST

`define SH_SDA
//uncomment below to make SH and CL async
`define SH_CL_ASYNC

// Uncomment to disable Virtual JTAG
//`define DISABLE_VJTAG_DEBUG

// AXI Master Block Registers
`define CL_DRAM_DMA_AXI_MSTR_CCR_ADDR   32'h0000_0000
`define CL_DRAM_DMA_AXI_MSTR_CAHR_ADDR  32'h0000_0004
`define CL_DRAM_DMA_AXI_MSTR_CALR_ADDR  32'h0000_0008
`define CL_DRAM_DMA_AXI_MSTR_CWDR_ADDR  32'h0000_000C
`define CL_DRAM_DMA_AXI_MSTR_CRDR_ADDR  32'h0000_0010

// Defining local macros that will instantiate the desired DDR controllers in
// the CL.
`ifndef DDR_A_ABSENT
  `define DDR_A_PRESENT 1
`else
  `define DDR_A_PRESENT 0
`endif

`ifndef DDR_B_ABSENT
  `define DDR_B_PRESENT 1
`else
  `define DDR_B_PRESENT 0
`endif

`ifndef DDR_D_ABSENT
  `define DDR_D_PRESENT 1
`else
  `define DDR_D_PRESENT 0
`endif

`endif

