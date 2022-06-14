// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0



typedef struct {
   logic [63:0] addr;
   logic [7:0]  len;
   logic [2:0]  size;
   logic [15:0]  id;
   logic [1:0]  resp;
   logic        last;
} AXI_Command;
   
typedef struct {
   logic [511:0] data;
   logic [63:0]  strb;
   logic [15:0]   id;
   logic         last;
} AXI_Data;

