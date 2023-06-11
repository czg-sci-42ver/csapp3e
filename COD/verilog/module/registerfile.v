module registerfile (
    Read1,
    Read2,
    WriteReg,
    WriteData,
    RegWrite,
    Data1,
    Data2,
    clock
);
  input [5:0] Read1, Read2, WriteReg;  // the reg i ster numbers to read or write
  input [63 : 0] WriteData;  // data to write
  input RegWrite,  // the wr i te control
  clock;  // the cl ock to trigger write
  output [63 : 0] Data1, Data2;  // the register values read
  reg  [63 : 0] RF[31 : 0];  // 32 registers each 32 bits long

  // reg  [  63:0] A;
  // wire [63 : 0] b;
  // always @(posedge clock) A <= b;

  assign Data1 = RF[Read1];
  assign Data2 = RF[Read2];
  always begin
    // write the register wit h new value if Regwrite is high
    @(posedge clock) if (RegWrite) RF[WriteReg] <= WriteData;
  end
endmodule
