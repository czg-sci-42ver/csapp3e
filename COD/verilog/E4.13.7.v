`include "E4.13.6.v"
module RISCVCPU (
    clock
);
  parameter LD = 7'b000_0011, SD = 7'b001_0011, BEQ = 7'b010_0011, ALUop = 7'b110_0011;
  input clock;

  reg [2 : 0] state;
  wire [1 : 0] ALUOp, ALUSrcB;
  wire [6 : 0] opcode;
  /*
  these are Microcodes ,p1426
  */
  wire MemtoReg , MemRead , MemWrite , IorD , RegWrite , IRWrite ,PCWrite , PCWriteCond , ALUSrcA , PCSource , MemoryOp ;
  // Create an instance of the RISC-V datapat h, the inputs are the contro l signals : opcode is on l y output
  Datapath RISCVDP (
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
  );
  initial begin
    state = 1;
  end  // start the state machine i n state 1
  // These are the definit i ons of the control s i gnals
  assign MemoryOp = (opcode == LD) || (opcode == SD);  // a memory operation
  /*
  see https://ece.uwaterloo.ca/~cgebotys/NEW/ECE222/4.Processor.pdf p5 ALUOp encoding
  */
  assign ALUOp = ((state === 1) || (state == 2) || ((state == 3) && MemoryOp)) ? 2'b00 :// add
((state== 3) && (opcode== BEQ)) ? 2'b01 : 2'b10 ; // subtract or use function code
  /*
  MemtoReg:
  if true, then write MOR, which will be 0 if MemRead is false.
  it is only true when ld,sd,beq at state 4.
  
  beq:
  IorD is 1 at state 3.
  `3: state <= (opcode == BEQ) ? 1 : 4;` so will never go to state 4
  based on `PCWriteCond` (see the following comment), it will change `PCSource`

  ignore the following: 
  will write to at state 5.
  MemRead at state 4: false -> MemOut change to 0 -> MOR to 0
  */
  assign MemtoReg = ((state == 4) && (opcode == ALUop)) ? 0 : 1;
  assign MemRead = (state == 1) || ((state == 4) && (opcode == LD));
  assign MemWrite = (state == 4) && (opcode == SD);
  /*
  0 is for instruction.
  */
  assign IorD = (state == 1) ? 0 : 1;
  /*
  `(state === 4) && (opcode == ALUop)` functions like forwarding, also because of `4: state <= (opcode == LD) ? 5 : 1;`
  */
  assign RegWrite = (state == 5) || ((state === 4) && (opcode == ALUop));
  assign IRWrite = (state === 1);
  /*
  TODO : 
  1. see p1402,1428: `PCWriteCond` should be dependent on ALU output 
  1.1 modify PCWrite and PCWriteCond
  above can based on p678,686 figure
  */
  assign PCWrite = (state == 1);
  assign PCWriteCond = (state == 3) && (opcode == BEQ);
  /*
  false -> fetch PC
  */
  assign ALUSrcA = ((state == 1) || (state == 2)) ? 0 : 1;
  /*
  2'b01: 4-> calculate PC+4 (state 1/3)
  2'b11: offset -> used in branch `beq`, calculate branch addr (maybe unused,so may be redundantly calculated.)
  notice this is calculated in state 2 instead of 3 to maximize ALU usage.
  2'b10: imm -> calculate ld,sd addr
  */
  assign ALUSrcB =((state== 1) || ((state== 3) && (opcode=== BEQ)))?
2'b01 :(state == 2)? 2'b11 :((state== 3) && MemoryOp) ? 2'b10: 2'b00 ;// memory operation or other
  /*
  TODO: modify with `PCWrite` 
  */
  assign PCSource = (state == 1) ? 0 : 1;
  // Here is t he state machine, which only has to sequence states
  always @(posedge clock) begin  // al l st ate updates on a posit i ve clock edge
    case (state)
      1: state <= 2;  // unconditional next state
      2: state <= 3;  // unconditional next state
      3: state <= (opcode == BEQ) ? 1 : 4;  // branch go back else next state
      4: state <= (opcode == LD) ? 5 : 1;  // R-type and SO finish
      5: state <= 1;  // go back
    endcase
  end
endmodule
