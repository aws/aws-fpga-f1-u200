// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

  // PCIe Slave (sda) Interface from SH to CL
  assign cl_sda_awready              =   1'b0;

  assign cl_sda_wready               =   1'b0;

  assign cl_sda_bvalid               =   1'b0;
  assign cl_sda_bresp[1:0]           =   2'b0;

  assign cl_sda_arready              =   1'b0;

  assign cl_sda_rvalid               =   1'b0;
  assign cl_sda_rdata[31:0]          =  32'b0;
  assign cl_sda_rresp[1:0]           =   2'b0;
