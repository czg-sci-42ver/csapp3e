module Mult4to1 (
    In1,
    In2,
    In3,
    In4,
    Sel,
    Out
);
  input [63 : 0] In1, In2, In3, In4;  // f our 64 - bit i nputs
  input [1 : 0] Sel;  //selector signa l
  output reg [63 : 0] Out;  //6 4- bit outp ut
  always @(In1, In2, In3, In4, Sel)
    case (Sel)  // a 4 - >1 multiplexor
      0: Out <= In1;
      1: Out <= In2;
      2: Out <= In3;
      default: Out <= In4;
    endcase
endmodule

module Mult2to1 (
    In1,
    In2,
    Sel,
    Out
);
  input [63 : 0] In1, In2;  // f our 64 - bit i nputs
  input Sel;  //selector signa l
  output reg [63 : 0] Out;  //6 4- bit outp ut
  always @(In1, In2, Sel)
    case (Sel)  // a 4 - >1 multiplexor
      0: Out <= In1;
      default: Out <= In2;
    endcase
endmodule
