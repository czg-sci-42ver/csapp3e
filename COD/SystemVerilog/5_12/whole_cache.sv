// imitate https://github.com/ejrh/cpu/blob/master/rtl/sim/main.v
`include "E5_12_5_8.sv"
`include "param.vh"
module main;
  timeunit 1ns; timeprecision 1ns;
  bit clk;
  int cnt = 0;
  reg [31:0] target_addr = '0;
  reg [31:0] target_data = '0;
  cpu_req_type new_cpu_req;
  cpu_req_type cpu_req_list_instance[CPU_REQ_SIZE:0];
  //   cpu_req_list cpu_req_list_instance;
  mem_data_type new_mem_data, mem_data_list[CPU_REQ_SIZE];
  mem_req_type output_mem_req;
  cpu_result_type output_cpu_res;

  initial begin
    for (int i = 0; i < CPU_REQ_SIZE; i++) begin
      mem_data_list[i] = '{data: target_data * 2, ready: '1};
      if (i % 2 == 0) begin
        cpu_req_list_instance[i] = '{addr: target_addr, data: target_data, rw: '1, valid: '1};
      end else
        cpu_req_list_instance[i] = '{addr: target_addr, data: target_data, rw: '0, valid: '1};
      target_addr = target_addr + 1;
      target_data = target_data + 1;
    end
    $dumpfile("whole.vcd");
    // must have this
    $dumpvars(10, main);
  end
  initial
    #(FINISH_TIME) begin
      $dumpflush;
      $finish;
    end


  always #(CYCLE) clk = !clk;
  always_ff @(posedge (clk)) begin
    $display("-----,new_cpu_req: %0b; new_mem_data:%0b ;cnt: %0b", new_cpu_req, new_mem_data, cnt);
    if (cnt % STATE_SIZE == 0) begin
      assign new_cpu_req = cpu_req_list_instance[cnt/STATE_SIZE];
      assign new_mem_data = mem_data_list[cnt/STATE_SIZE];
    end
    cnt = cnt + 1;
  end

  /*
  TODO realize mem_data.ready using Snoop
  */

  dm_cache_fsm cache_fsm (
      .clk(clk),
      .rst(0),
      .cpu_req(new_cpu_req),
      .mem_data(new_mem_data),
      .mem_req(output_mem_req),
      .cpu_res(output_cpu_res)
  );
endmodule
