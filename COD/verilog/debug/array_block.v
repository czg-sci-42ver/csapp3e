// debug E4.13.1_log.v
`define sd(offset, rs2, rs1) {``offset[11:5],``rs2,``rs1,3'b11,``offset[4:0],7'b0100011}
`define sd_const(offset, rs2, rs1) {``offset/(1'b1<<5),``rs2,``rs1,3'b11,``offset%(1'b1<<5),7'b0100011}
`define SIZE0 1'b1<<1'b5
module moduleName;
    initial begin
        // it is in SystemVerilog.
        $display("begin");
    end
    reg [31 : 0] EXMEMIR_ARRAY[0:16];
    reg [31:0] SIZE0 = 1'b1<<5;
    initial begin
        EXMEMIR_ARRAY[9] = 32'b00000000000110000000010010100011;
        $display("in sd, i value: %0d, offset %b EXMEMIR_ARRAY[i] %b, should store %b", 1, 9, EXMEMIR_ARRAY[9],{12'd9/(1'b1<<5),5'b1,5'b1,3'b11,12'd9%(SIZE0),7'b0100011});
        $display("sd: %b",`sd_const((12'd9),{5{1'b0}}, {5{1'b0}}));
    end
endmodule