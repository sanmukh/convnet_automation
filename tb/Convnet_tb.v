// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.2
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================

 `timescale 1ns/1ps


`define AUTOTB_DUT      ConvNet_Arch
`define AUTOTB_DUT_INST AESL_inst_ConvNet_Arch
//`define AUTOTB_TOP      apatb_ConvNet_Arch_top
`define AUTOTB_TOP      Convnet_tb
`define AUTOTB_LAT_RESULT_FILE "ConvNet_Arch.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "ConvNet_Arch.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_ConvNet_Arch_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_TRANSACTION_NUM  1
`define AUTOTB_CLOCK_PERIOD 10.000000
`define LENGTH_in_image 2500
`define LENGTH_out_image 2500

`define	AESL_MEM_in_image AESL_automem_in_image
`define	AESL_MEM_INST_in_image mem_inst_in_image
`define	AESL_MEM_out_image AESL_automem_out_image
`define	AESL_MEM_INST_out_image mem_inst_out_image
`define AUTOTB_TVIN_in_image  "../tv/cdatafile/c.ConvNet_Arch.autotvin_in_image.dat"
`define AUTOTB_TVIN_out_image  "../tv/cdatafile/c.ConvNet_Arch.autotvin_out_image.dat"
`define AUTOTB_TVIN_in_image_out_wrapc  "../tv/rtldatafile/rtl.ConvNet_Arch.autotvin_in_image.dat"
`define AUTOTB_TVIN_out_image_out_wrapc  "../tv/rtldatafile/rtl.ConvNet_Arch.autotvin_out_image.dat"
`define AUTOTB_TVOUT_out_image  "../tv/cdatafile/c.ConvNet_Arch.autotvout_out_image.dat"
`define AUTOTB_TVOUT_out_image_out_wrapc  "../tv/rtldatafile/rtl.ConvNet_Arch.autotvout_out_image.dat"

module `AUTOTB_TOP;
task read_token;
    input integer fp;
    output reg [167 : 0] token;
    reg [7:0] c;
    reg intoken;
    reg done;
    begin
        token = "";
        intoken = 0;
        done = 0;
        while (!done) begin
            c = $fgetc(fp);
            if (c == 8'hff) begin   // EOF
                done = 1;
            end
            else if (c == " " || c == "\011" || c == "\012" || c == "\015") begin   // blank
                if (intoken) begin
                    done = 1;
                end
            end
            else begin              // valid character
                intoken = 1;
                token = (token << 8) | c;
            end
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
reg [31 : 0] AESL_mLatCnterIn [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterIn_addr;
reg [31 : 0] AESL_mLatCnterOut [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterOut_addr ;
reg [31 : 0] AESL_clk_counter ;
wire ap_clk;
wire ap_rst;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [11 : 0] in_image_address0;
wire  in_image_ce0;
wire [31 : 0] in_image_q0;
wire [11 : 0] out_image_address0;
wire  out_image_ce0;
wire  out_image_we0;
wire [31 : 0] out_image_d0;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

`AUTOTB_DUT `AUTOTB_DUT_INST(
.ap_clk(ap_clk),
.ap_rst(ap_rst),
.ap_start(ap_start),
.ap_done(ap_done),
.ap_idle(ap_idle),
.ap_ready(ap_ready),
.in_image_address0(in_image_address0),
.in_image_ce0(in_image_ce0),
.in_image_q0(in_image_q0),
.out_image_address0(out_image_address0),
.out_image_ce0(out_image_ce0),
.out_image_we0(out_image_we0),
.out_image_d0(out_image_d0)
);

// Assignment for control signal
  assign ap_clk = AESL_clock;
  assign ap_rst = AESL_reset;
  assign ap_rst_n = ~AESL_reset;
  assign AESL_reset = rst;
  assign ap_start = AESL_start;
  assign AESL_start = start;
  assign AESL_done = ap_done;
  assign AESL_idle = ap_idle;
  assign AESL_ready = ap_ready;
  assign AESL_ce = ce;
  assign AESL_continue = continue;
//------------------------arrayin_image Instantiation--------------

// The input and output of arrayin_image
wire    arrayin_image_ce0, arrayin_image_ce1;
wire	arrayin_image_we0, arrayin_image_we1;
wire    [11 : 0]	arrayin_image_address0, arrayin_image_address1;
wire	[31 : 0]	arrayin_image_din0, arrayin_image_din1;
wire    [31 : 0]	arrayin_image_dout0, arrayin_image_dout1;
wire	arrayin_image_ready;
wire	arrayin_image_done;

`AESL_MEM_in_image `AESL_MEM_INST_in_image(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayin_image_ce0),
    .we0        (arrayin_image_we0),
    .address0   (arrayin_image_address0),
    .din0       (arrayin_image_din0),
    .dout0      (arrayin_image_dout0),
    .ce1        (arrayin_image_ce1),
    .we1        (arrayin_image_we1),
    .address1   (arrayin_image_address1),
    .din1       (arrayin_image_din1),
    .dout1      (arrayin_image_dout1),
    .ready	  (arrayin_image_ready),
    .done	(arrayin_image_done)
);

// Assignment between dut and arrayin_image
assign arrayin_image_address0 = in_image_address0;
assign arrayin_image_ce0 = in_image_ce0;
assign in_image_q0 = arrayin_image_dout0;
assign arrayin_image_we0 = 0;
assign arrayin_image_din0 = 0;
assign arrayin_image_we1 = 0;
assign arrayin_image_din1 = 0;
assign arrayin_image_ready=	ready;
assign arrayin_image_done = 0;


//------------------------arrayout_image Instantiation--------------

// The input and output of arrayout_image
wire    arrayout_image_ce0, arrayout_image_ce1;
wire	arrayout_image_we0, arrayout_image_we1;
wire    [11 : 0]	arrayout_image_address0, arrayout_image_address1;
wire	[31 : 0]	arrayout_image_din0, arrayout_image_din1;
wire    [31 : 0]	arrayout_image_dout0, arrayout_image_dout1;
wire	arrayout_image_ready;
wire	arrayout_image_done;

`AESL_MEM_out_image `AESL_MEM_INST_out_image(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayout_image_ce0),
    .we0        (arrayout_image_we0),
    .address0   (arrayout_image_address0),
    .din0       (arrayout_image_din0),
    .dout0      (arrayout_image_dout0),
    .ce1        (arrayout_image_ce1),
    .we1        (arrayout_image_we1),
    .address1   (arrayout_image_address1),
    .din1       (arrayout_image_din1),
    .dout1      (arrayout_image_dout1),
    .ready	  (arrayout_image_ready),
    .done	(arrayout_image_done)
);

// Assignment between dut and arrayout_image
assign arrayout_image_address0 = out_image_address0;
assign arrayout_image_ce0 = out_image_ce0;
assign arrayout_image_we0 = out_image_we0;
assign arrayout_image_din0 = out_image_d0;
assign arrayout_image_we1 = 0;
assign arrayout_image_din1 = 0;
assign arrayout_image_ready= ready_initial | arrayout_image_done;
assign arrayout_image_done =	AESL_done_delay;


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_ready_cnt_proc
    ready_cnt = 0;
    wait(AESL_reset === 0);
    while(ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        ready_cnt = ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_done_cnt_proc
    done_cnt = 0;
    wait(AESL_reset === 0);
    while(done_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_done !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        done_cnt = done_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
    @(posedge AESL_clock);
    # 0.4;
    $finish;
end

initial fork
    AESL_clock = 0;
    forever #(`AUTOTB_CLOCK_PERIOD/2) AESL_clock = ~AESL_clock;
join

initial begin : initial_process
    integer rand;
    rst = 1;
    # 100;
	  repeat(3) @(posedge AESL_clock);
    rst = 0;
end

initial begin : start_process
  integer rand;
  start = 0;
  ce = 1;
    wait(AESL_reset === 0);
  @(posedge AESL_clock);
  start <= 1;
  while(ready_cnt != `AUTOTB_TRANSACTION_NUM + 1) begin
      @(posedge AESL_clock);
      if(AESL_ready == 1) begin
          start <= 0;
          start <= 1;
      end
  end
  start <= 0;
end

always @(AESL_done)
begin
    continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == `AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt != `AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
// Write "[[[runtime]]]" and "[[[/runtime]]]" for output-only transactor 
initial begin : write_output_transactor_out_image_runtime_process
    integer fp;
    fp = $fopen(`AUTOTB_TVOUT_out_image_out_wrapc, "w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_out_image_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait(done_cnt == `AUTOTB_TRANSACTION_NUM)
	  repeat(2) @(posedge AESL_clock);
    # 0.2;
    fp = $fopen(`AUTOTB_TVOUT_out_image_out_wrapc, "a");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_out_image_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
    begin
        AESL_clk_counter <= 0;
    end 
    else begin
        AESL_clk_counter = AESL_clk_counter + 1;
    end    
end

always @ (posedge AESL_clock or posedge AESL_reset) begin
    if(AESL_reset)
    begin
        AESL_mLatCnterOut_addr = 0;
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter + 1;
    end
    else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter;
        AESL_mLatCnterOut_addr = AESL_mLatCnterOut_addr + 1;
    end
end

always @ (posedge AESL_clock or posedge AESL_reset) begin
    if(AESL_reset)
    begin
        AESL_mLatCnterIn_addr = 0;
    end
    else begin
        if (AESL_start && AESL_mLatCnterIn_addr == 0) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
        if (AESL_ready && AESL_mLatCnterIn_addr < `AUTOTB_TRANSACTION_NUM + 1 ) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
    end
end

initial begin : performance_check
    integer transaction_counter;
    integer i;
    integer fp;

    integer latthistime;
    integer lattotal;
    integer latmax;
    integer latmin;


    integer thrthistime;
    integer thrtotal;
    integer thrmax;
    integer thrmin;

    integer lataver;
    integer thraver;
    reg [31 : 0] lat_array [0 : `AUTOTB_TRANSACTION_NUM];
    reg [31 : 0] thr_array [0 : `AUTOTB_TRANSACTION_NUM];

    i = 0;
    lattotal = 0;
    latmax = 0;
    latmin = 32'h 7fffffff;
    lataver = 0;

    thrtotal = 0;
    thrmax = 0;
    thrmin = 32'h 7fffffff;
    thraver = 0;

    
    @(negedge AESL_clock); 
    @(negedge AESL_reset); 
    while (done_cnt != `AUTOTB_TRANSACTION_NUM) begin
            @(posedge AESL_clock);
    end
    #0.001

    if (AESL_mLatCnterIn_addr == 1 || AESL_mLatCnterIn_addr == 0 ) begin
        latmax  = 0;
        latmin  = 0;
        lataver = 0;
        thrmax  = 0;
        thrmin  = 0;
        thraver = 0;
        lat_array[0] = 0;
        thr_array[0] = 0;
    end
    else if (AESL_mLatCnterOut_addr == 1 || AESL_mLatCnterOut_addr == 0 ) begin
        latmax  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        latmin  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        lataver = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        thrmax  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thrmin  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thraver = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        lat_array[0] = lataver;
        thr_array[0] = thraver;
    end
    else begin
//LATENCY
    for (i = 0;i < AESL_mLatCnterOut_addr ; i = i + 1) begin
        latthistime = AESL_mLatCnterOut[i] - AESL_mLatCnterIn[i] ;
        if ( i > 0 ) begin
            latthistime = (latthistime - 1 < 0) ? 0 : (latthistime - 1);
        end
        lattotal = lattotal + latthistime;
        lat_array[i] = latthistime;
        if (latthistime > latmax) latmax = latthistime;
        if (latthistime < latmin) latmin = latthistime;
    end
//II
    for (i = 0;i < AESL_mLatCnterIn_addr - 1; i = i + 1) begin
        thrthistime = AESL_mLatCnterIn[i + 1] - AESL_mLatCnterIn[i];
        if ( i == 0 ) begin
            thrthistime = thrthistime + 1;
        end
        thrtotal = thrtotal + thrthistime;
        thr_array[i] = thrthistime;
        if (thrthistime > thrmax) thrmax = thrthistime;
        if (thrthistime < thrmin) thrmin = thrthistime;
    end    
    
    thr_array[AESL_mLatCnterIn_addr - 1] = 0;
    lataver = lattotal / ( AESL_mLatCnterOut_addr);
    thraver = thrtotal / ( AESL_mLatCnterIn_addr - 1 );
    end

	fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");
    
	$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax );
	$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin );
	$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver );
	$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", thrmax );
	$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", thrmin );
	$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", thraver );
	$fclose(fp);
	  fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");
    $fdisplay (fp,"%20s%16s%16s","","latency","interval");
    for (i = 0; i < AESL_mLatCnterOut_addr; i = i + 1) begin
        $fdisplay (fp,"transaction%8d:%16d%16d",i , lat_array[i], thr_array[i]);
    end

	$fclose(fp);
end
endmodule
