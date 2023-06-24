//simulated memory
`include "E5_12_5_8_mod.sv"
import cache_def::*;

`timescale 1ns / 1ns

class rand_cl;
  rand bit [127:0] v;
endclass

module sim_mem (
    input bit clk,
    input mem_req_type req,
    output mem_data_type data
);
  default clocking cb1 @(posedge clk);
  endclocking

  /*
  '`timescale 1ns' , 'initial forever #2 clk = ~clk;'
  so 400ns to get data.
  */
  localparam MEM_DELAY = 100;

  // bit [127:0] mem[*];
  bit [127:0] mem[bit [31 : 0]];
  rand_cl rand_data = new();

  always @(posedge clk) begin
    data.ready = '0;
    $display("mem.exists(req.addr):%0b with addr:%0x; mem:%0p", mem.exists(req.addr), req.addr,
             mem);


    if (req.valid) begin
      $display("%t: [Memory] %s @ addr=%x with data=%x", $time, (req.rw) ? "Write" : "Read",
               req.addr, (req.rw) ? req.data : mem[req.addr]);
      ##MEM_DELAY;

      $display("after MEM_DELAY req.addr:%0x", req.addr);
      /* verilator lint_off WIDTHTRUNC */
      /*
      put the assignment of `mem[req.addr]` after DELAY to make every addr can be checked existence 
      Otherwise, req.addr may change after the delay because it is wire (`assign`).
      */
      if (!mem.exists(req.addr)) begin  //random initialize DRAM data on-demand 
        // rand_data.v = {$urandom(0),$urandom(1),$urandom(2),$urandom(3)};
        /* verilator lint_off IGNOREDRETURN */
        rand_data.randomize();
        $display("random data: %0x", rand_data.v);
        mem[req.addr] = rand_data.v;
        // $display("mem changed to: %0b", mem[req.addr]);
        // mem[req.addr] = {128{1'b1}};
        $display("mem changed to: %0p", mem);
      end

      if (req.rw) begin
        $display("before WB(write back), mem: %0p", mem);
        mem[req.addr] = req.data;
        $display(
            "after WB(write back), write data:%0x, after the change,mem addr -> %0x;\nmem become: %0p",
            req.data, mem[req.addr], mem);
      end else begin
        $display("read mem data:%0x", mem[req.addr]);
        data.data = mem[req.addr];
      end

      $display("%t: [Memory] request finished", $time);
      data.ready = '1;
    end
  end
endmodule


module test_main;
  bit clk;
  localparam CLK_SIZE = 2;
  initial forever #(CLK_SIZE) clk = ~clk;

  mem_req_type    mem_req;
  mem_data_type   mem_data;
  cpu_req_type    cpu_req;
  cpu_result_type cpu_res;

  bit             rst;

  default clocking cb2 @(posedge clk);
  endclocking

  //simulated CPU
  initial begin
    $dumpfile("vcd/testbench_mod.vcd");
    // must have this
    $dumpvars(10, test_main);
    rst = '0;
    ##5;
    rst = '1;
    ##10;
    rst = '0;

    cpu_req = '{default: 0};

    //note that: The CPU needs to reset all cache tags in a real ASIC implementation
    //In this testbench, all tags are automatically initialized to 0 because the use of the systemverilog bit data type
    //For an FPGA implementation, all RAMs are initialized to be 0 by default.

    //read clean miss (allocate)                
    $timeformat(-9, 3, "ns", 10);

    cpu_req.rw          = '0;
    cpu_req.addr[13:4]  = 2;  //index 2
    cpu_req.addr[31:14] = 'h1234;
    cpu_req.valid       = '1;
    $display("%t: [CPU] read addr=%x", $time, cpu_req.addr);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] get data=%x", $time, cpu_res.data);
    cpu_req.valid = '0;
    ##5;

    //read hit clean line
    /*
    index unchanged
    */
    cpu_req.addr[3:0] = 8;
    cpu_req.valid = '1;
    $display("%t: [CPU] read addr=%x", $time, cpu_req.addr);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] get data=%x", $time, cpu_res.data);
    cpu_req.valid = '0;
    ##5;

    //write hit clean line (cache line is dirty afterwards)
    // hit (i.e. valid)
    cpu_req.rw = '1;
    cpu_req.addr[3:0] = 'ha;
    cpu_req.data = 32'hdeadbeef;
    cpu_req.valid = '1;
    $display("%t: [CPU] write addr=%x with data=%x", $time, cpu_req.addr, cpu_req.data);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] write done", $time);
    cpu_req.valid = '0;
    ##5;

    //write conflict miss (write back then allocate, cache line dirty)
    cpu_req.addr[31:14] = 'h4321;
    cpu_req.data = 32'hcafebeef;
    cpu_req.valid = '1;
    $display("%t: [CPU] write addr=%x with data=%x", $time, cpu_req.addr, cpu_req.data);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] write done", $time);
    cpu_req.valid = '0;
    ##5;

    //read hit dirty line
    cpu_req.rw = '0;
    cpu_req.addr[3:0] = '0;
    cpu_req.valid = '1;
    $display("%t: [CPU] read addr=%x", $time, cpu_req.addr);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] get data=%x", $time, cpu_res.data);
    cpu_req.valid = '0;
    ##5;

    //read conflict miss dirty line (write back then allocate, cache line is clean)  
    cpu_req.addr[31:14] = 'h5678;
    cpu_req.addr[3:0] = 4;
    cpu_req.valid = '1;
    $display("%t: [CPU] read addr=%x", $time, cpu_req.addr);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] get data=%x", $time, cpu_res.data);
    cpu_req.valid = '0;
    ##5;

    //write miss clean line (cache line is dirty afterwards)
    /*
    tag not match (valid=0) & not dirty -> allocate 
    */
    cpu_req.rw = '1;
    // index different -> must miss (then clean).
    cpu_req.addr[13:4] = 8;  //index 8
    cpu_req.addr[31:14] = 'habcd;
    cpu_req.data = 32'habcdbeef;
    cpu_req.valid = '1;
    $display("%t: [CPU] write addr=%x with data=%x", $time, cpu_req.addr, cpu_req.data);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] write done", $time);
    cpu_req.valid = '0;
    ##5;

    //write hit dirty line but not conflict (cache line is dirty afterwards)
    // hit (i.e. valid)
    cpu_req.addr[3:0] = 'b1100;
    cpu_req.data = 32'hbeefdead;
    cpu_req.valid = '1;
    $display("%t: [CPU] write addr=%x with data=%x", $time, cpu_req.addr, cpu_req.data);
    wait (cpu_res.ready == '1);
    $display("%t: [CPU] write done", $time);
    cpu_req.valid = '0;
    // delay CLK_SIZE(2)*2*5=20 timeunits
    ##5;

    $finish();
  end
  //simulated CPU end

  dm_cache_fsm dm_cache_inst (.*);
  sim_mem dram_inst (
      .*,
      .req (mem_req),
      .data(mem_data)
  );
endmodule
