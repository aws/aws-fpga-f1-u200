// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

module tb();

   parameter NUM_HMC = 4;
   parameter NUM_PCIE = 1;
   parameter NUM_GTY = 4;
   parameter NUM_I2C = 2;
   parameter NUM_POWER = 4;


   
   logic [31:0]         sv_host_memory[*];
   logic                use_c_host_memory = 1'b0;
   
`ifdef VCS
initial begin
   if (!$test$plusargs("NO_WAVES")) begin
      $vcdpluson;
      $vcdplusmemon;
   end
end
`endif

`include "sh_dpi_tasks.svh"
   
   card card();
   
endmodule // tb

`ifdef XILINX_SIMULATOR
  module short(in1, in1);
    inout in1;
  endmodule
`endif

