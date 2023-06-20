`include "E5_12_1_2.sv"
import cache_def::*;
/*cache ; data memory , single port , 1024 blocks*/

/* verilator lint_off MULTITOP */
module dm_cache_data (
    input bit clk,
    input cache_req_type data_req,  //data request/command , e , g, RW , valid
    input cache_data_type data_write,  //write port (128-bit line)
    output cache_data_type data_read
);  //read port
  timeunit 1ns; timeprecision 1ps;
  cache_data_type data_mem[0 : 1023];
  initial begin
    for (int i = 0; i < 1024; i++) data_mem[i] = '0;
  end
  assign data_read = data_mem[data_req.index];
  always_ff @(posedge (clk)) begin
    if (data_req.we) data_mem[data_req.index] <= data_write;
  end
endmodule
/*cache ; tag memory , s i ngle port , 1024 bl ocks*/
module dm_cache_tag (
    input bit clk,  //wr i te clock
    input cache_req_type tag_req,  //tag request/command , e , g, RW, valid
    input cache_tag_type tag_write,  //write port
    output cache_tag_type tag_read
);  //read port
  timeunit 1ns; timeprecision 1ps;
  cache_tag_type tag_mem[0:1023];
  initial begin
    for (int i = 0; i < 1024; i++) tag_mem[i] = '0;
  end
  assign tag_read = tag_mem[tag_req.index];
  always_ff @(posedge (clk)) begin
    /*not check valid when write*/
    if (tag_req.we) tag_mem[tag_req.index] <= tag_write;
  end
endmodule
