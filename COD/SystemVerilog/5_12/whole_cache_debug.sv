// imitate https://github.com/ejrh/cpu/blob/master/rtl/sim/main.v
// `include "E5_12_5_8.sv"
// `include "param.vh"
module main;
  initial begin
    for (int i = 0; i < 1; i++) begin
      target_addr = 32'b0;
      target_data = 32'b0;
      cpu_req_list_instance[0]='{addr:target_addr,data:target_data,valid:'1,rw:'0};
    end
  end

  // always #(CYCLE) clk = !clk;
  // always_ff @(posedge (clk)) begin
  //   $display("-----");
  //   assign new_cpu_req = cpu_req_list_instance[cnt];
  //   assign new_mem_data = mem_data_list[cnt];
  //   cnt++;
  // end

  // dm_cache_fsm cache_fsm (
  //     .clk(clk),
  //     .rst(0),
  //     .cpu_req(new_cpu_req),
  //     .mem_data(new_mem_data),
  //     .mem_req(output_mem_req),
  //     .cpu_res(output_cpu_res)
  // );
endmodule
