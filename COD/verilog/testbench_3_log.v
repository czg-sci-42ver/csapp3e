`include "E4.13.3_orig.v"
module top;
  // function [31:0] sd(input [11:0] offset, input [0:4] rs2, rs1);
  //   // see https://www.chipverify.com/verilog/verilog-concatenation wire[2:0] ...
  //   // input [11:0] offset,[5:0] rs2, rs1; // this is wrong
  //   begin
  //     sd = {offset[11:5], rs2, rs1, 3'b11, offset[4:0], 7'b0100011};
  //   end
  // endfunction

  // function [31:0] ld(input [11:0] offset, input [0:4] rs1, rd);
  //   begin
  //     ld = {offset, rs1, 3'b11, rd, 7'b0000011};
  //   end
  // endfunction

  // function [31:0] init_instr(input [31:0] index, input [11:0] offset);
  //   begin
  //     if (index % 2 == 1) begin
  //       /*
  //       // store x[31] to M[((x[1]=?)+offset=offset)]
  //       // rs1 = `rd` of load
  //       */
  //       init_instr = sd(offset, {`SD_LOAD_REG}, {5{1'b1}});
  //     end else begin
  //       offset = offset + 4;
  //       // load from ((x[0]=0)+offset=offset) -> x[1]
  //       // rd = 1
  //       init_instr = ld({offset}, {5{1'b0}}, {5'b1});
  //     end
  //   end
  // endfunction

  // reg clock;
  // reg [`RUN_TIME_CNT_BITS:0] cnt;
  // // same as risc-v format
  // reg [11:0] offset;
  // always #(`CYCLE_TIME) clock = ~clock;

  // initial begin
  //   $dumpfile("vcd/log_3_testbench.vcd");
  //   // must have this
  //   $dumpvars(1);
  //   clock = 0;
  //   offset = 0;
  //   cnt = 0;
  //   i = 0;
  //   $display("sd rs2:%b", `SD_LOAD_REG);
  //   for (i = 0; i < `INSTR_SIZE; i = i + 1) begin
  //     DMemory[i] = i;
  //     // store first to make load show value
  //     IMemory[i] = init_instr(i, offset);
  //     if (i % 2 == 1) $display("sd instr rs2:%b", IMemory[i][24:20]);
  //   end
  //   // important
  //   #((`RUN_TIME) * 2) $finish;
  // end

  // RISCVCPU cpu_inst(clock);
endmodule
