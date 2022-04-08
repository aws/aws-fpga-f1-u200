// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

//-------------------------------------------------------------------------------
// Description: This test is a heartbeat check and checks the global counters values 
// before and after a poke & peek operation on CL register. 
//-------------------------------------------------------------------------------- 
module test_gl_cntr();

import tb_type_defines_pkg::*;
`include "cl_common_defines.vh" // CL Defines with register addresses

   // AXI ID
   parameter [5:0] AXI_ID = 6'h0;

   logic [31:0] rdata;
   logic [63:0] glcntr0;
   logic [63:0] glcntr1;

   initial begin
      tb.power_up();
      
      tb.set_virtual_dip_switch(.dip(0));
      
      glcntr0 = tb.get_global_counter_0();
      glcntr1 = tb.get_global_counter_1();
      
      $display ("Global counter 0 value before poke is 0x%x \n", glcntr0);
      $display ("Global counter 1 value before poke is 0x%x \n", glcntr1);

// write to cl register. when read back we should see byte swap on this register.
      tb.poke(.addr(`HELLO_WORLD_REG_ADDR), .data(32'hDEAD_BEEF), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL)); // write register
      
      glcntr0 = tb.get_global_counter_0();
      glcntr1 = tb.get_global_counter_1();
      
      $display ("Global counter 0 value after poke is 0x%x \n", glcntr0);
      $display ("Global counter 1 value after poke is 0x%x \n", glcntr1); 
      
      glcntr0 = tb.get_global_counter_0();
      glcntr1 = tb.get_global_counter_1();

      $display ("Global counter 0 value before peek is 0x%x \n", glcntr0);
      $display ("Global counter 1 value before peek is 0x%x \n", glcntr1);

      tb.peek(.addr(`HELLO_WORLD_REG_ADDR), .data(rdata), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL));         // start read & write
      $display ("Reading 0x%x from address 0x%x", rdata, `HELLO_WORLD_REG_ADDR);
      
      if (rdata == 32'hEFBE_ADDE) // Check for byte swap in register read
        $display ("TEST PASSED");
      else
        $error ("TEST FAILED");

      glcntr0 = tb.get_global_counter_0();
      glcntr1 = tb.get_global_counter_1();
      
      $display ("Global counter 0 value after peek is 0x%x \n", glcntr0);
      $display ("Global counter 1 value after peek is 0x%x \n", glcntr1);

      
      $finish;
   end // initial begin
endmodule // test_gl_cntr
