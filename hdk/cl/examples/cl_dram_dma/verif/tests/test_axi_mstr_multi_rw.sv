// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

module test_axi_mstr_multi_rw();

   import tb_type_defines_pkg::*;

    int            error_count;
    int            timeout_count;
    int            fail;
    logic [3:0]    status;

    // AXI Master Command Register Addresses
    localparam AXI_MSTR_CCR_ADDR   = 32'h0000_0500;
    localparam AXI_MSTR_CAHR_ADDR  = 32'h0000_0504;
    localparam AXI_MSTR_CALR_ADDR  = 32'h0000_0508;
    localparam AXI_MSTR_CWDR_ADDR  = 32'h0000_050C;
    localparam AXI_MSTR_CRDR_ADDR  = 32'h0000_0510;

    localparam DDRA_HI_ADDR = 32'h0000_0001;
    localparam DDRA_LO_ADDR = 32'hA021_F700;
    localparam DDRA_DATA    = 32'hA5A6_0000;

    localparam DDRB_HI_ADDR = 32'h0000_0004;
    localparam DDRB_LO_ADDR = 32'h529C_8400;
    localparam DDRB_DATA    = 32'h1B80_C948;

    localparam DDRC_HI_ADDR = 32'h0000_0008;
    localparam DDRC_LO_ADDR = 32'h2078_BC00;
    localparam DDRC_DATA    = 32'h8BD1_8801;

    localparam DDRD_HI_ADDR = 32'h0000_000C;
    localparam DDRD_LO_ADDR = 32'hD016_7700;
    localparam DDRD_DATA    = 32'hCA02_183D;


    initial begin

       logic [63:0] host_memory_buffer_address;


       tb.power_up(.clk_recipe_a(ClockRecipe::A1),
                   .clk_recipe_b(ClockRecipe::B0),
                   .clk_recipe_c(ClockRecipe::C0));

       tb.nsec_delay(1000);
       tb.poke_stat(.addr(8'h0c), .ddr_idx(0), .data(32'h0000_0000));
       tb.poke_stat(.addr(8'h0c), .ddr_idx(1), .data(32'h0000_0000));
       tb.poke_stat(.addr(8'h0c), .ddr_idx(2), .data(32'h0000_0000));

       // de-select the ATG hardware

       tb.poke_ocl(.addr(64'h130), .data(0));
       tb.poke_ocl(.addr(64'h230), .data(0));
       tb.poke_ocl(.addr(64'h330), .data(0));
       tb.poke_ocl(.addr(64'h430), .data(0));

       // allow memory to initialize
       tb.nsec_delay(27000);

       // issuing flr
       tb.issue_flr();

       $display("[%t] : starting H2C DMA channels ", $realtime);



       // ------------------------------------
       // DDR A
       // ------------------------------------
       $display("[%t] : ******* DDR A *******", $realtime);
for (int i = 0; i <= 12; i=i+4) begin //{
       // Set AXI Master Command Registers
       // addr = 0x1_a021f700, Write
       $display("[%t] : Setting DDRA Command Registers ", $realtime);// addr = 0x1_a021f700
       tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRA_HI_ADDR));  // Set High Address -- DDR A
       tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRA_LO_ADDR + i));  // Set Low  Address
       tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRA_DATA | i));     // Set Write Data
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR),  .data(32'h0000_0001)); // Issue Write Command

       // Wait for write command to complete
       $display("[%t] : Waiting for DDRA write command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRA write command completed.  ", $realtime);
	 $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
   #40ns;
end // for (int i = 0; i <= 12; i=i+4) //}

for (int i = 0; i <= 12; i=i+4) begin //{
        tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRA_HI_ADDR));  // Set High Address -- DDR A
        tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRA_LO_ADDR + i));  // Set Low  Address
        tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRA_DATA | i));     // Set Write Data

       // Issue read transaction
       $display("[%t] : Issuing DDRA read command.  ", $realtime);
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR), .data(32'h0000_0005)); // Issue Read Command

       // Wait for read command to complete
       $display("[%t] : Waiting for DDRA read command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRA read command completed.  ", $realtime);

	 #40ns;
        $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );

       $display("[%t] : Comparing DDRA write and read data.  ", $realtime);
       $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
       if (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0] !== tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0]) begin
         $error("[%t] : *** ERROR *** Data mismatch, addr:0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0] );
         error_count++;
       end
end //}

       // ------------------------------------
       // DDR B
       // ------------------------------------
       $display("[%t] : ******* DDR B *******", $realtime);
for (int i = 0; i <= 12; i=i+4) begin //{
       // Set AXI Master Command Registers
       // addr = 0x1_a021f700, Write
       $display("[%t] : Setting DDRA Command Registers ", $realtime);// addr = 0x1_a021f700
       tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRB_HI_ADDR));  // Set High Address -- DDR A
       tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRB_LO_ADDR + i));  // Set Low  Address
       tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRB_DATA | i));     // Set Write Data
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR),  .data(32'h0000_0001)); // Issue Write Command

       // Wait for write command to complete
       $display("[%t] : Waiting for DDRB write command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRB write command completed.  ", $realtime);
	 $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
   #40ns;
end // for (int i = 0; i <= 12; i=i+4) //}

for (int i = 0; i <= 12; i=i+4) begin //{
        tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRB_HI_ADDR));  // Set High Address -- DDR A
        tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRB_LO_ADDR + i));  // Set Low  Address
        tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRB_DATA | i));     // Set Write Data

       // Issue read transaction
       $display("[%t] : Issuing DDRB read command.  ", $realtime);
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR), .data(32'h0000_0005)); // Issue Read Command

       // Wait for read command to complete
       $display("[%t] : Waiting for DDRB read command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRB read command completed.  ", $realtime);

	 #40ns;
        $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );

       $display("[%t] : Comparing DDRB write and read data.  ", $realtime);
       $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
       if (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0] !== tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0]) begin
         $error("[%t] : *** ERROR *** Data mismatch, addr:0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0] );
         error_count++;
       end
end //}

       // ------------------------------------
       // DDR C
       // ------------------------------------
       $display("[%t] : ******* DDR B *******", $realtime);
for (int i = 0; i <= 12; i=i+4) begin //{
       // Set AXI Master Command Registers
       // addr = 0x1_a021f700, Write
       $display("[%t] : Setting DDRA Command Registers ", $realtime);// addr = 0x1_a021f700
       tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRC_HI_ADDR));  // Set High Address -- DDR A
       tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRC_LO_ADDR + i));  // Set Low  Address
       tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRC_DATA | i));     // Set Write Data
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR),  .data(32'h0000_0001)); // Issue Write Command

       // Wait for write command to complete
       $display("[%t] : Waiting for DDRC write command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRC write command completed.  ", $realtime);
	 $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
   #40ns;
end // for (int i = 0; i <= 12; i=i+4) //}

for (int i = 0; i <= 12; i=i+4) begin //{
        tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRC_HI_ADDR));  // Set High Address -- DDR A
        tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRC_LO_ADDR + i));  // Set Low  Address
        tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRC_DATA | i));     // Set Write Data

       // Issue read transaction
       $display("[%t] : Issuing DDRC read command.  ", $realtime);
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR), .data(32'h0000_0005)); // Issue Read Command

       // Wait for read command to complete
       $display("[%t] : Waiting for DDRC read command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRC read command completed.  ", $realtime);

	 #40ns;
        $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );

       $display("[%t] : Comparing DDRC write and read data.  ", $realtime);
       $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
       if (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0] !== tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0]) begin
         $error("[%t] : *** ERROR *** Data mismatch, addr:0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0] );
         error_count++;
       end
end //}


       // ------------------------------------
       // DDR D
       // ------------------------------------
       $display("[%t] : ******* DDR B *******", $realtime);
for (int i = 0; i <= 12; i=i+4) begin //{
       // Set AXI Master Command Registers
       // addr = 0x1_a021f700, Write
       $display("[%t] : Setting DDRA Command Registers ", $realtime);// addr = 0x1_a021f700
       tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRD_HI_ADDR));  // Set High Address -- DDR A
       tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRD_LO_ADDR + i));  // Set Low  Address
       tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRD_DATA | i));     // Set Write Data
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR),  .data(32'h0000_0001)); // Issue Write Command

       // Wait for write command to complete
       $display("[%t] : Waiting for DDRD write command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRD write command completed.  ", $realtime);
	 $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
   #40ns;
end // for (int i = 0; i <= 12; i=i+4) //}

for (int i = 0; i <= 12; i=i+4) begin //{
        tb.poke_ocl(.addr(AXI_MSTR_CAHR_ADDR), .data(DDRD_HI_ADDR));  // Set High Address -- DDR A
        tb.poke_ocl(.addr(AXI_MSTR_CALR_ADDR), .data(DDRD_LO_ADDR + i));  // Set Low  Address
        tb.poke_ocl(.addr(AXI_MSTR_CWDR_ADDR), .data(DDRD_DATA | i));     // Set Write Data

       // Issue read transaction
       $display("[%t] : Issuing DDRD read command.  ", $realtime);
       tb.poke_ocl(.addr(AXI_MSTR_CCR_ADDR), .data(32'h0000_0005)); // Issue Read Command

       // Wait for read command to complete
       $display("[%t] : Waiting for DDRD read command to complete.  ", $realtime);
       do begin
          #10ns;
       end while (!tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_done_q);
       $display("[%t] : DDRD read command completed.  ", $realtime);

	 #40ns;
        $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );

       $display("[%t] : Comparing DDRD write and read data.  ", $realtime);
       $display("[%t] : addr: 0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q),
                                   (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q) );
       if (tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0] !== tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0]) begin
         $error("[%t] : *** ERROR *** Data mismatch, addr:0x%0h_%0h write data is: 0x%h read data is: 0x%h",
                        $realtime, tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_hi_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_addr_lo_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_wr_data_q[31:0],
                                   tb.card.fpga.CL.CL_DRAM_DMA_AXI_MSTR.cmd_rd_data_q[31:0] );
         error_count++;
       end
end //}

       // Power down
       #500ns;
       tb.power_down();

       //---------------------------
       // Report pass/fail status
       //---------------------------
       $display("[%t] : Checking total error count...", $realtime);
       if (error_count > 0) begin
         fail = 1;
       end
       $display("[%t] : Detected %3d errors during this test", $realtime, error_count);

       if (fail || (tb.chk_prot_err_stat())) begin
         $error("[%t] : TEST_FAILED", $realtime);
       end else begin
         $display("[%t] : TEST_PASSED", $realtime);
       end

       $finish;
    end // initial begin

endmodule // test_dram_dma

