`define LOG 1
`define ld(offset, rs1, rd) {``offset,``rs1,3'b11,``rd,7'b0000011}
// r:5 bit,offset:12 bit
// `define sd(offset, rs2, rs1) {7'b``offset>>5,``rs2,``rs1,3'b11,5'b``offset%(1'b1<<5),7'b0100011}
`define sd(offset, rs2, rs1) {``offset[11:5],``rs2,``rs1,3'b11,``offset[4:0],7'b0100011}
// notice use () with INSTR_SIZE to ensure << first
`define INSTR_SIZE 1<<`RUN_TIME_CNT_BITS
`define MEM_SIZE 1023
// here is a little redundant because only check store in riseedge run loop 'posedge clock'
`define RUN_TIME_CNT_BITS 8
`define RUN_TIME 1<<`RUN_TIME_CNT_BITS
`define sd_const(offset, rs2,
                 rs1) {``offset/(1'b1<<5),``rs2,``rs1,3'b11,``offset%(1'b1<<5),7'b0100011}
`define CYCLE_TIME 1<<(`RUN_TIME_CNT_BITS-4)
`define SD_LOAD_REG 5'd30
`timescale 1s / 1s

module RISCVCPU;
  // function automatic [31:0] sd(input [11:0] offset, [5:0] rs2, [5:0] rs1);
  //   sd = {offset[11:5], rs2, rs1, 3'b11, offset[4:0], 7'b0100011};
  // endfunction
  function [31:0] sd(input [11:0] offset,input [0:4] rs2, rs1);
    // see https://www.chipverify.com/verilog/verilog-concatenation wire[2:0] ...
    // input [11:0] offset,[5:0] rs2, rs1; // this is wrong
    begin
      $display("in sd func, rs2:%b, last element:%b",rs2,rs2[0]);
      sd = {offset[11:5], rs2, rs1, 3'b11, offset[4:0], 7'b0100011};
    end
  endfunction
  // $display("");

  // Instruct i on opcodes
  parameter LD= 7'b000_0011 , SD= 7'b010_0011 , BEO = 7'b110_0011 , NOP= 32'h0000_0013 , ALUop = 7'b001_0011 ;
  // input clock;
  reg [63 : 0] PC, Regs[0 : 31], IDEXA, IDEXB, EXMEMB, EXMEMALUOut, MEMWBValue;
  reg [31 : 0]
      IMemory[0 : `MEM_SIZE],
      DMemory[0 : `MEM_SIZE],  // separate memori es
      IFIDIR,
      IDEXIR,
      EXMEMIR,
      MEMWBIR;  // pi pe l ine reg i sters
  wire [4:0] IFIDrsl, IFIDrs2, MEMWBrd;  // Access register fiel ds
  wire [6 : 0] IDEXop, EXMEMop, MEMWBop;  // Access opcodes
  wire [63 : 0] Ain, Bin;  // the ALU inputs
  // These assignments define fie l ds from the pipel ine registers
  assign IFIDrsl = IFIDIR[19:15];  // rsl field
  assign IFIDrs2 = IFIDIR[24 : 20];  // rs2 field
  assign IDEXop = IDEXIR[6 : 0];
  // the opcode
  assign EXMEMop = EXMEMIR[6 : 0];
  // the opcode
  assign MEMWBop = MEMWBIR[6 : 0];
  // the opcode
  assign MEMWBrd = MEMWBIR[11 : 7];  // rd field
  // Inputs to the ALU come di rectly from the ID/EX pipeline registers
  assign Ain = IDEXA;
  assign Bin = IDEXB;
  integer i;  // used to initialize registers
  initial begin
    PC = 0;
    IFIDIR = NOP;
    IDEXIR = NOP;
    EXMEMIR = NOP;
    MEMWBIR = NOP;  // put NOPs in pipeline registers
    for (i = 0; i <= 31; i = i + 1)
      Regs[i] = i;  // initialize reg i sters -- ]ust so they aren ' t cares
  end

  // default 1 bit
  reg clock;
  reg [`RUN_TIME_CNT_BITS:0] cnt;
  // same as risc-v format
  reg [11:0] offset;
  always #(`CYCLE_TIME) clock = ~clock;
  // reg [31 : 0] INSTR_ARRAY[0:(`INSTR_SIZE)-1];
  initial begin
    $dumpfile("log.vcd");
    // must have this
    $dumpvars(1);
    clock = 0;
    offset = 0;
    cnt = 0;
    $display("sd rs2:%b",`SD_LOAD_REG);
    // IMemory[9] = 32'b00000000000110000000010010100011;
    // $display("in sd, i value: %0d, offset %b IMemory[i] %b, should store %b", 0, 9, IMemory[9],32'b00000000000110000000010010100011);
    for (i = 0; i < `INSTR_SIZE; i = i + 1) begin
      DMemory[i] = i;
      // store first to make load show value
      if (i % 2 == 1) begin
        // IMemory[i] =`sd(offset,{5{1'b0}},{5{1'b0}});
        // store x[31] to M[((x[0]=0)+offset=offset)]
        IMemory[i] = sd(offset, {`SD_LOAD_REG}, {5{1'b0}});
        $display("sd instr rs2:%b",IMemory[i][24:20]);
        // $display("in sd, i value: %0d, offset %b IMemory[i] %b, should store %b", i, offset, IMemory[i],sd(offset, {5{1'b0}}, {5{1'b0}}));
      end else begin
        /*
        here load and store address are same.
        */
        offset = offset + 4;
        // load from ((x[0]=0)+offset=offset) -> x[1]
        IMemory[i] = `ld({offset}, {5{1'b0}}, {5'b1});
        // $fdisplay("value: %d",{{offset},{5{1'b0}},{5{1'b0}}});
        // $display("ld value: %0d %b %b should store %b", i, offset, IMemory[i],`ld({offset}, {5{1'b0}}, {5{1'b0}}));
      end
    end
    // for (i = 0; i < `INSTR_SIZE; i = i + 1) IMemory[i] =`sd({12{1'b0}},{5{1'b0}},{5{1'b0}});
    // for (i = 0; i < `INSTR_SIZE; i = i + 1) IMemory[i] ={{12{1'b0}},{5{1'b0}},3'b11,{5{1'b0}},7'b11};

    // important
    #((`RUN_TIME) * 2) $finish;
  end
  initial begin
    ;
  end

  // Remember that A11 these actions happen every pipe stage and with the use of<= they happen in para1Iel!
  // always @(negedge clock)begin
  //   EXMEMIR = INSTR_ARRAY[cnt];
  // end

  always @(EXMEMop) begin
    // $display("EXMEMop change, EXMEMIR %b cnt %d EXMEMop: %b %d",EXMEMIR,cnt,EXMEMop,EXMEMop==EXMEMIR[6 : 0]);
    $display("EXMEMop change:%b ==SD:%d, == NOP(opcode):%d", EXMEMop, EXMEMop == SD,
             EXMEMop == NOP[6:0]);
  end
  // always @(EXMEMALUOut) begin
  //   $display("EXMEMALUOut change, EXMEMALUOut %b cnt %d %b %d %b",EXMEMALUOut,cnt,EXMEMop,EXMEMop==EXMEMIR[6 : 0],EXMEMIR[6 : 0]);
  // end
  // always @(IDEXop) begin
  //   $display("new IDEXop: %b",IDEXop);
  // end

  always @(posedge clock) begin
    $display("run new cycle %t,load %dth instruction with opcode %b", $realtime / (`CYCLE_TIME),
             PC >> 2, IMemory[PC>>2][6:0]);
    // $printtimescale(RISCVCPU);

    // first instruction i n the pipeli ne is being fetched
    // Fetch & increment PC
    IFIDIR <= IMemory[PC>>2];

    /*
    all have one cycle delay
    */
    $display("IFIDIR opcode: %b", IFIDIR[6:0]);
    PC <= PC + 4;
    // second instruction in pipeline is fetching reg i sters
    IDEXA <= Regs[IFIDrsl];
    IDEXB <= Regs[IFIDrs2];  // get two registers
    IDEXIR <= IFIDIR; // pass along IR--can happen anywhere , since this aff ects next stage on l y!
    // third instruction is doing address calculation or ALU operation

    /*
    LD SD: EXMEMALUOut -> target address
    */
    if (IDEXop == LD) EXMEMALUOut <= IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30 : 20]};
    else if (IDEXop == SD)
      EXMEMALUOut <= IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30 : 25], IDEXIR[11 : 7]};
    else if (IDEXop == ALUop)
      case (IDEXIR[31 : 25])  // case for the various R- type instructions
        0: EXMEMALUOut <= Ain + Bin;  // add operation 658
        default: ;  // other R-type operations : subtract , SLT, etc ,
      endcase
    EXMEMIR <= IDEXIR;
    EXMEMB  <= IDEXB;  // pass along the IR & B register
    // Mem stage of pipeline
    $display("EXMEMIR opcode: %b", EXMEMIR[6:0]);
    if (EXMEMop == ALUop) MEMWBValue <= EXMEMALUOut;  // pass along ALU result
    /*
    EXMEMALUOut >> 2,because one address store 1byte,so 32bit(4 bytes) is mutiple of 4(1<<2)
    */
    else if (EXMEMop == LD) begin
      MEMWBValue <= DMemory[EXMEMALUOut>>2];
      $display("load from %dth mem value %b, imm:%b", EXMEMALUOut >> 2, DMemory[EXMEMALUOut>>2], {
               IDEXIR[30 : 25], IDEXIR[11 : 7]});
      $display("last loaded value %b, equal to last stored: %d", DMemory[(EXMEMALUOut>>2)-1],DMemory[(EXMEMALUOut>>2)-1]==Regs[`SD_LOAD_REG]);
    end else if (EXMEMop == SD) begin
      DMemory[EXMEMALUOut>>2] <= EXMEMB;  //store
      $display("IFIDrs2:%d",IFIDrs2);
      $display("finish store, cnt: %d,cycle: %d,store to %dth mem,EXMEMALUOut: %0b", cnt,
               $time / (`CYCLE_TIME), EXMEMALUOut >> 2, EXMEMALUOut);
      $display("last stored mem %dth mem: %0b, equal to source %dth reg:%d ",
               (EXMEMALUOut >> 2) - 1, DMemory[(EXMEMALUOut>>2)-1],`SD_LOAD_REG,DMemory[(EXMEMALUOut>>2)-1]==Regs[`SD_LOAD_REG]);
      // for (i = 0; i < cnt / 2; i = i + 1) begin
      //   $display("EXMEMALUOut: %b, %dth mem: %b", EXMEMALUOut, i, DMemory[i]);
      // end
    end
    MEMWBIR <= EXMEMIR;  // pass along IR
    // WB stage
    if (((MEMWBop == LD) || (MEMWBop == ALUop)) && (MEMWBrd != 0)) // update registers if load/ALU operation and destination not 0
      Regs[MEMWBrd] <= MEMWBValue;
    cnt++;
  end
endmodule
