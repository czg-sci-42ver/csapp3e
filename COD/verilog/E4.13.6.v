module Datapath (
    ALUOp,
    MemtoReg,
    MemRead,
    MemWrite,
    IorD,
    RegWrite,
    IRWrite,
    PCWrite,
    PCWriteCond,
    ALUSrcA,
    ALUSrcB,
    PCSource,
    opcode,
    clock
);  // the contro l i nputs+ clock
  parameter LD = 7'b000_0011, SD = 7'b010_0011;
  input [1 : 0] ALUOp, ALUSrcB;  // 2· bit control signals
  input MemtoReg, MemRead , MemWrite , IorD, RegWrite , IRWrite , PCWrite , PCWriteCond ,ALUSrcA , PCSource , clock ; // l · bit control signa l s
  output [6 : 0] opcode;  // opcode is needed as an output by control

  reg [63 : 0] PC, MOR, ALUOut, ImmGen;  // CPU state+ some temporaries
  reg [31 : 0] Memory[0:1023], IR;  // CPU state+ some temporaries
  wire [63 : 0] A, B, SignExtendOffset, PCOffset, ALUResultOut , PCValue ,JumpAddr , Writedata , ALUAin,ALUBin , MemOut ; // these are s i gnals derived from registers
  wire [3 : 0] ALUCtl;  // the ALU control lines
  wire Zero;  // the Zero out signal from the ALU
  initial PC = O;  //start the PC at 0
  //Combinational signals used in the datapath
  // Read using word address with either ALUOut or PC as the address source
  assign MemOut = MemRead ? Memory[(IorD?ALUOut : PC)>>2] : O;
  assign opcode = IR[6:0];  // opcode shortcut
  // Get the write reg i ster data either from the ALUOut or from the MOR
  assign Writedata = MemtoReg ? MOR : ALUOut;
  // Generate i mmediate, should never use `64'b0`
  assign ImmGen = (opcode== LD)? {{53{IR[31]}}, IR[30 : 20]} : (opcode== SD) ? {{53{IDEXIR[31]}}, IDEXIR[30 : 25], IDEXIR[11 : 7]}: 64'b0 ;
  // Generate pc offset for branches
  assign PCOffset = {{52{IR[31]}}, IR[7], IR[30 : 25], IR[11 : 8], 1'b0};
  // The A input to the ALU is either the rs register or the PC
  assign ALUAin = ALUSrcA ? A : PC;  // ALU input is PC or A
  // Creates an instance of the ALU control unit (see the module defined in Figure A.5.16
  // Input ALUOp is control ·unit set and used to describe the instruction cl ass as i n Chapter 4
  // Input IR[31 :25] is the function code fie l d for an ALU instruction
  // Output ALUCtl are Lhe actual ALU control bits as in Chapter 4
  ALUControl alucontroller (
      ALUOp,
      IR[31 : 25],
      ALUCtl
  );  // ALU control unit
  // Creates a 2- to · l multiplexor used to select the source of the next PC
  // Inputs are ALUResultOut (the incremented PC ) , ALUOut (the branch address)
  // PCSource is the selector input and PCValue is the multiplexor output
  /*
  p1173
  here in state 1,ALUResultOut is directly calculated as `PC+4`
  in state 3,
  */
  Mult2to1 PCdatasrc (
      ALUResultOut,
      ALUOut,
      PCSource,
      PCValue
  );
  // Creates a 4-to·l multiplexor used to select the 8 input of the ALU
  // Inputs are register 8 , constant 4 , generated i mmed i ate , PC offset
  // ALUSrcB is the select or input
  // ALUBin is the multiplexor output
  Mult4to1 ALUBinput (
      B,
      64'd4,
      ImmGen,
      PCOffset,
      ALUSrcB,
      ALUBin
  );
  // Creates a RISC·V ALU
  // Inputs are ALUCtl (the ALU control), ALU va l ue inputs (ALUAin, ALUBin)
  // Outputs are ALUResultOut (the 64-bit output ) and Zero (zero detection output)
  /*
  p1174
  */
  RISCVALU ALU (
      ALUCtl,
      ALUAin,
      ALUBin,
      ALUResultOut,
      Zero
  );  // the ALU
  // Creates a RISC-V register file
  // Inputs are the rsl and rs2 fields of the IR used to specify which registers to read ,
  // Writereg (the write register number), Writedata (the data to be written),
  // RegWrite (indicates a write) , the clock
  // Outputs are A and B, the registers read
  /*
  p1227
  */
  registerfile regs (
      IR[19 : 15],
      IR[24:20],
      IR[11 : 7],
      Writedata,
      RegWrite,
      A,
      B,
      clock
  );  // Register file
  // The clock-tr ig gered actions of the datapath
  always @(posedge clock) begin
    if (MemWrite) Memory[ALUOut>>2] <= B;  // Write memory--must be a store
    ALUOut <= ALUResultOut;  // Save the ALU result for use on a later cl ock cycle
    if (IRWrite) IR <= MemOut;  // Write the IR if an instruct i on fetch
    MOR <= MemOut;  // Always save the memory read value
    // The PC is written both conditiona11y (contro11ed by PCWrite) and unconditiona11y
    /*
    TODO: update workflows related wtih `PCWrite` and `PCWriteCond`
    */
  end
endmodule
