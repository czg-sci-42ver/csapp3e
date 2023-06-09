`define LOG 1
`define ld(offset, rs1, rd) {``offset,``rs1,3'b11,``rd,7'b0000011}
// r:5 bit,offset:12 bit
// `define sd(offset, rs2, rs1) {7'b``offset>>5,``rs2,``rs1,3'b11,5'b``offset%(1'b1<<5),7'b0100011}
`define sd(offset, rs2, rs1) {``offset[11:5],``rs2,``rs1,3'b11,``offset[4:0],7'b0100011}
// notice use () with INSTR_SIZE to ensure << first
`define INSTR_SIZE 1<<`RUN_TIME_CNT_BITS
`define MEM_SIZE 1023
// here is a little redundant because only check store in riseedge run loop 'posedge clock'
`define RUN_TIME_CNT_BITS 4
`define RUN_TIME 1<<`RUN_TIME_CNT_BITS
`define sd_const(offset, rs2,
                 rs1) {``offset/(1'b1<<5),``rs2,``rs1,3'b11,``offset%(1'b1<<5),7'b0100011}
// `define CYCLE_TIME 1<<(`RUN_TIME_CNT_BITS-4)

// rs2 of sd
`define SD_LOAD_REG 5'd30
`define SD_RS1 5'd1
`define IF_CNT 2
`define STALL_EXMEM

// `define CYCLE_TIME 0.25
// `timescale 1s / 50ms

`define CYCLE_TIME 1
`timescale 1s / 1s

module RISCVCPU;
  // function automatic [31:0] sd(input [11:0] offset, [5:0] rs2, [5:0] rs1);
  //   sd = {offset[11:5], rs2, rs1, 3'b11, offset[4:0], 7'b0100011};
  // endfunction
  function [31:0] sd(input [11:0] offset, input [0:4] rs2, rs1);
    // see https://www.chipverify.com/verilog/verilog-concatenation wire[2:0] ...
    // input [11:0] offset,[5:0] rs2, rs1; // this is wrong
    begin
      sd = {offset[11:5], rs2, rs1, 3'b11, offset[4:0], 7'b0100011};
      $display("in sd func, rs2:%0b, last element:%0b,rs1:%0b,sd:%0b", rs2, rs2[0], rs1, sd);
    end
  endfunction
  integer target;
  // contain 31+11+1 bit return {intsr+offset}
  function [43:0] init_instr_offset_union(input [31:0] index, input [11:0] offset);

    // $display("index: %0b",index);
    /*
      unresolved vpi name lookup: v0x5567b2b32a10_0
      unresolved functor reference: v0x5567b2b32a10_0
      compile_cleanup: 2 unresolved items
      */
    // unable to use `init_instr_offset_union[24:20]`
    // $display("sd instr rs2:%0b", init_instr_offset_union[24:20]);
`ifdef SD_LD
    begin
      if (index % `IF_CNT == 0) begin
        /*
        // store x[31] to M[((x[1]=?)+offset=offset)]
        // rs1 = `rd` of load
        */
        init_instr_offset_union = {sd(offset, {`SD_LOAD_REG}, {`SD_RS1}), offset};
        $display("sd instr offset: %b", offset);
      end else if (index % `IF_CNT == 1) begin
        // load from ((x[0]=0)+offset=offset) -> x[1]
        // rd = 1
        init_instr_offset_union = {`ld({offset}, {`SD_RS1}, {`SD_RS1}), offset};
        $display("ld instr offset: %b,init_instr_offset_union:%b should include instr :%b", offset,
                 init_instr_offset_union, `ld({offset}, {`SD_RS1}, {`SD_RS1}));
        /*
        notice offset must increase each 2 `if` run. 
        */
        offset = offset + 4;
        // $dumpvars(0,DMemory[0]);
        // $monitor("monitor mem: %0b",DMemory[target]);
      end else begin
        init_instr_offset_union = {NOP, offset};
      end
    end
`else
    begin
      if (index % `IF_CNT == 0) begin
        offset = offset + 4;
        $display("offset increase to %b",offset);
      end
      if (index % `IF_CNT == 0) begin
        // load from ((x[0]=0)+offset=offset) -> x[1]
        // rd = 1
        init_instr_offset_union = {`ld({offset}, {`SD_RS1}, {`SD_RS1}), offset};
        $display("ld instr offset: %b,init_instr_offset_union:%b should include instr :%b", offset,
                 init_instr_offset_union, `ld({offset}, {`SD_RS1}, {`SD_RS1}));
        // $dumpvars(0,DMemory[0]);
        // $monitor("monitor mem: %0b",DMemory[target]);
      end else if (index % `IF_CNT == 1) begin
        /*
          // store x[31] to M[((x[1]=?)+offset=offset)]
          // rs1 = `rd` of load
          */
        init_instr_offset_union = {sd(offset, {`SD_LOAD_REG}, {`SD_RS1}), offset};
        $display("sd instr offset: %b", offset);
      end else begin
        init_instr_offset_union = {NOP, offset};
      end
    end
`endif
  endfunction

  // Instruct i on opcodes
  parameter LD= 7'b000_0011 , SD= 7'b010_0011 , BEO = 7'b110_0011 , NOP= 32'h0000_0013 , ALUop = 7'b001_0011 ;
  // input clock;
  reg [63 : 0] PC, Regs[0 : 31], IDEXA, IDEXB, EXMEMB, EXMEMALUOut, MEMWBValue;
  // reg [63 : 0] PC, Regs[0 : 31], EXMEMB, EXMEMALUOut, MEMWBValue;
  reg [31 : 0]
      IMemory[0 : `MEM_SIZE],
      DMemory[0 : `MEM_SIZE],  // separate memori es
      IFIDIR,
      IDEXIR,
      EXMEMIR,
      MEMWBIR;  // pi pe l ine reg i sters
  wire [4:0] IFIDrsl, IFIDrs2, MEMWBrd, IDEXrs1, IDEXrs2, EXMEMrd;  // Access register fiel ds
  wire [6 : 0] IDEXop, EXMEMop, MEMWBop, IFIDop;  // Access opcodes
  wire [63 : 0] Ain, Bin;  // the ALU inputs
  wire [63:0] IDEXA_forward, IDEXB_forward , WB_fw;
  // decl are the bypass si gna l s
  wire bypassAfromMEM,bypassBfromMEM,  bypassAfromALUinWB,bypassBfromALUinWB, bypassAfromLDinWB,bypassBfromLDinWB;
  wire stall;  // stall signal

  /*
  debug variables
  */
  wire [63 : 0] Regs_rs1_w, Regs_rs2_w, Reg_1, Reg_30;
  wire [11:0] offset_ld, offset_sd;
  wire [63:0] target_addr_ld, target_addr_sd, target_addr_ld_fromIR,offset_EXMEM_sd;
  wire EXMEMIS_LD, EXMEMIS_SD;
  wire [31:0] DMem_0;
  assign Regs_rs1_w = Regs[`SD_RS1];
  assign Regs_rs2_w = Regs[`SD_LOAD_REG];
  assign offset_ld = IFIDIR[31:20];
  assign offset_sd = {IFIDIR[31:25], IFIDIR[11:7]};
  /*
  notice IMemory index should be target_addr_ld >> 2
  */
  // assign target_addr_ld = offset_ld + Regs_rs1_w;
  assign offset_EXMEM_sd = {{53{IDEXIR[31]}}, IDEXIR[30 : 25], IDEXIR[11 : 7]};
  assign target_addr_ld_fromIR = IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30 : 20]};
  assign target_addr_sd = IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30 : 25], IDEXIR[11 : 7]};
  assign EXMEMIS_LD = EXMEMop == LD;
  assign EXMEMIS_SD = EXMEMop == SD;
  assign DMem_0 = DMemory[0];
  assign Reg_1 = Regs[1];
  assign Reg_30 = Regs[30];
  /*
  debug init end
  */

  // These assignments define fie l ds from the pipel ine registers
  assign IFIDop = IFIDIR[6 : 0];
  assign IFIDrsl = IFIDIR[19:15];  // rsl field
  assign IFIDrs2 = IFIDIR[24 : 20];  // rs2 field
  assign IDEXop = IDEXIR[6 : 0];
  assign IDEXrs1 = IDEXIR[19:15];
  assign IDEXrs2 = IDEXIR[24:20];
  // the opcode
  assign EXMEMop = EXMEMIR[6 : 0];
  assign EXMEMrs1 = EXMEMIR[19:15];
  assign EXMEMrs2 = EXMEMIR[24:20];
  assign EXMEMrd = EXMEMIR[11:7];
  // the opcode
  assign MEMWBop = MEMWBIR[6 : 0];
  assign MEMWBrs1 = MEMWBIR[19:15];
  assign MEMWBrs2 = MEMWBIR[24:20];
  // the opcode
  assign MEMWBrd = MEMWBIR[11 : 7];  // rd field
  // Inputs to the ALU come di rectly from the ID/EX pipeline registers
  // assign Ain = IDEXA;
  // assign Bin = IDEXB;

  // The bypass to in put A fro m t he MEM stage for an ALU operation
  assign bypassAfromMEM = (IDEXrs1 == EXMEMrd) && (IDEXrs1 !== 0) && (EXMEMop == ALUop);
  // The bypass to i nput B fro m t he MEM stage for an ALU operation
  assign bypassBfromMEM = (IDEXrs2 == EXMEMrd) && (IDEXrs2 != 0) && (EXMEMop == ALUop);
  // The bypass to i nput A fro m t he WB stage for an ALU ope r ation
  assign bypassAfromALUinWB = (IDEXrs1 == MEMWBrd) && (IDEXrs1 != 0) && (MEMWBop == ALUop);
  // The bypass to i nput B from the WB stage for an ALU operati on
  assign bypassBfromALUinWB = (IDEXrs2 == MEMWBrd) && (IDEXrs2 != 0) && (MEMWBop == ALUop);
  // The bypass t o in put A fro m t he WB stage for an LD operati on
  assign bypassAfromLDinWB = (IDEXrs1 == MEMWBrd) && (IDEXrs1 != 0) && (MEMWBop == LD);
  // The bypass to in put B fro m t he WB stage for an LD operati on
  assign bypassBfromLDinWB = (IDEXrs2 == MEMWBrd) && (IDEXrs2 != 0) && (MEMWBop == LD);
  // The A input to t he ALU is bypassed fro m MEM if t here i s a bypass there .
  // Otherwise fro m WB if the re i s a bypass the re , and otherwise comes from the !DEX register

  assign Ain = bypassAfromMEM ? EXMEMALUOut : (bypassAfromALUinWB || bypassAfromLDinWB) ? MEMWBValue: IDEXA;
  // The B input to the ALU i s bypassed from MEM if t here is a bypass t here .
  // Otherwise fro m WB i f there is a bypass there . and otherwise comes from t he IDEX register IDEXB ;
  assign Bin = bypassBfromMEM? EXMEMALUOut : (bypassBfromALUinWB || bypassBfromLDinWB) ? MEMWBValue : IDEXB;

  /*
  forward mem
  */
  // assign bypassMemfromWB = 
  // assign IDEXA_forward = stall ? MEMWBValue : IDEXA;
  // assign IDEXB_forward = stall ? MEMWBValue : IDEXB;
  assign WB_fw = ((EXMEMop == ALUop)&&EXMEMIR[31 : 25]==0) ? (Ain + Bin) : (EXMEMop == LD) ? (Ain + {{53{EXMEMIR[31]}}, EXMEMIR[30 : 20]}): (EXMEMop == SD) ? (Ain + {{53{EXMEMIR[31]}}, EXMEMIR[30 : 25], EXMEMIR[11 : 7]}): EXMEMALUOut;

  // The signal for detecting a stall based on the use of a result from LW
  /*
  line 1: i.e. write from mem to reg rd
  meanwhile
  line 2,3: i.e. mem addr use reg rd or alu use reg rd
  */

  // always @((MEMWBop == LD) && (  // source instruction i s a load, 
  //     (((IDEXop == LD) || (IDEXop == SD)) && (IDEXrs1 == MEMWBrd)) ||  // stall for address calc
  //     ((IDEXop == ALUop) && ((IDEXrs1 == MEMWBrd) || (IDEXrs2 == MEMWBrd)))))
  //     $display("",MEMWBop == LD,IDEXrs1 == MEMWBrd)

`ifdef STALL_EXMEM
  assign stall = (MEMWBop == LD) && (  // source instruction i s a load, 
      (((EXMEMop == LD) || (EXMEMop == SD)) && (EXMEMrs1 == MEMWBrd)) ||  // stall for address calc
      ((EXMEMop == ALUop) && ((EXMEMrs1 == MEMWBrd) || (EXMEMrs2 == MEMWBrd))));  // ALU use
`else
  assign stall = (MEMWBop == LD) && (  // source instruction i s a load, 
      (((IDEXop == LD) || (IDEXop == SD)) && (IDEXrs1 == MEMWBrd)) ||  // stall for address calc
      ((IDEXop == ALUop) && ((IDEXrs1 == MEMWBrd) || (IDEXrs2 == MEMWBrd))));  // ALU use
`endif
  integer i;  // used to initialize registers

  initial begin
    PC = 0;
    IFIDIR = NOP;
    IDEXIR = NOP;
    EXMEMIR = NOP;
    MEMWBIR = NOP;  // put NOPs in pipeline registers
    for (i = 0; i <= 31; i = i + 1)
    /*
    here *8 to make load influence at once (because 1>>2=0 has no influence to sd and ld)
    */
      Regs[i] = i*8;  // initialize reg i sters -- ]ust so they aren ' t cares
  end

  // default 1 bit
  reg clock;
  reg [`RUN_TIME_CNT_BITS:0] cnt;
  // same as risc-v format
  reg [11:0] offset;
  always #(`CYCLE_TIME) clock = ~clock;
  // reg [31 : 0] INSTR_ARRAY[0:(`INSTR_SIZE)-1];

  // just tmp value
  // reg[31:0] i;
  initial begin
    $dumpfile("vcd/log_3_mfEXMEM.vcd");
    // must have this
    $dumpvars(0, RISCVCPU);
    // reg [63 : 0] \Regs_[1] = Regs[1];
    // $dumpvars(0,\Regs_[1]);
    clock = 0;
    offset = 0;
    cnt = 0;
    i = 0;
    $display("sd rs2:%0b", `SD_LOAD_REG);
    // IMemory[9] = 32'b00000000000110000000010010100011;
    // $display("in sd, i value: %0d, offset %0b IMemory[i] %0b, should store %0b", 0, 9, IMemory[9],32'b00000000000110000000010010100011);
    for (i = 0; i < `INSTR_SIZE; i = i + 1) begin
      DMemory[i] = i;
      // store first to make load show value
      {IMemory[i], offset} = init_instr_offset_union(i, offset);
      if (i % 2 == 1) $display("sd instr rs2:%0b", IMemory[i][24:20]);
      $display("%0dth IMemory :%0b,offset:%b", i, IMemory[i], offset);
    end
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

  always @(Regs[1], Regs[30]) begin
    $display("Regs[1] %0b Regs[30] %0b", Regs[1], Regs[30]);
  end

  always @(EXMEMop) begin
    // $display("EXMEMop change, EXMEMIR %0b cnt %0d EXMEMop: %0b %0d",EXMEMIR,cnt,EXMEMop,EXMEMop==EXMEMIR[6 : 0]);
    $display("EXMEMop change:%0b ==SD:%0d, == NOP(opcode):%0d", EXMEMop, EXMEMop == SD,
             EXMEMop == NOP[6:0]);
  end
  // always @(EXMEMALUOut) begin
  //   $display("EXMEMALUOut change, EXMEMALUOut %0b cnt %0d %0b %0d %0b",EXMEMALUOut,cnt,EXMEMop,EXMEMop==EXMEMIR[6 : 0],EXMEMIR[6 : 0]);Reg_1
  // end
  // always @(IDEXop) begin
  //   $display("new IDEXop: %0b",IDEXop);
  // end
  integer stall_cnt=0;
  always @(posedge clock) begin
    if ( (~stall) && (stall_cnt != 1)) begin
      stall_cnt = 0;
      $display("run new cycle %0t,load %0dth instruction with opcode %0b",
               $realtime / (`CYCLE_TIME), PC >> 2, IMemory[PC>>2][6:0]);
      // $printtimescale(RISCVCPU);

      // first instruction i n the pipeli ne is being fetched
      // Fetch & increment PC
      IFIDIR <= IMemory[PC>>2];

      /*
    all have one cycle delay
    */
      $display("IFIDIR opcode: %0b", IFIDIR[6:0]);
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
    end else begin
      $display("stall once, stall_cnt %b",stall_cnt);
      stall_cnt = stall_cnt+1;
      EXMEMIR <= NOP;  // Freeze first three stages of pipeline ; inject a nop into the EX output
    end
    // Mem stage of pipeline
    $display("EXMEMIR opcode: %0b", EXMEMIR[6:0]);
    if (EXMEMop == ALUop) MEMWBValue <= WB_fw;  // pass along ALU result
    /*
    EXMEMALUOut >> 2,because one address store 1byte,so 32bit(4 bytes) is mutiple of 4(1<<2)
    */
    else if (EXMEMop == LD) begin
      MEMWBValue <= DMemory[WB_fw>>2];
      $display("EXMEMALUOut:%0b load from %0dth mem value %0b, imm:%0b", EXMEMALUOut,
               EXMEMALUOut >> 2, DMemory[EXMEMALUOut>>2], {IDEXIR[30 : 25], IDEXIR[11 : 7]});
      $display("last loaded value %0b, equal to last stored: %0d", DMemory[(EXMEMALUOut>>2)-1],
               DMemory[(EXMEMALUOut>>2)-1] == Regs[`SD_LOAD_REG]);
    end else if (EXMEMop == SD) begin
      $display("WB_fw:%b, stall_cnt: %b",WB_fw,stall_cnt);
      DMemory[WB_fw>>2] <= EXMEMB;  //store
      $display("IFIDrs2:%0d", IFIDrs2);
      $display("finish store, cnt: %0d,cycle: %0d,EXMEMB %0b store to %0dth mem,EXMEMALUOut: %0b",
               cnt, $time / (`CYCLE_TIME), EXMEMB, WB_fw >> 2, EXMEMALUOut);
      $display("last stored mem %0dth mem: %0b, equal to source %0dth reg:%0d ",
               (EXMEMALUOut >> 2) - 1, DMemory[(EXMEMALUOut>>2)-1], `SD_LOAD_REG,
               DMemory[(EXMEMALUOut>>2)-1] == Regs[`SD_LOAD_REG]);
      // for (i = 0; i < cnt / 2; i = i + 1) begin
      //   $display("EXMEMALUOut: %0b, %0dth mem: %0b", EXMEMALUOut, i, DMemory[i]);
      // end
    end
    MEMWBIR <= EXMEMIR;  // pass along IR
    // WB stage
    if (((MEMWBop == LD) || (MEMWBop == ALUop)) && (MEMWBrd != 0)) // update registers if load/ALU operation and destination not 0
    begin
      Regs[MEMWBrd] <= MEMWBValue;
    end
    cnt++;
  end
endmodule
