module RISCVCPU (clock);
// Instruction opcodes
parameter LW = 7'b000_0011, SW = 7'b010_0011, BEQ = 7'b110_0011, NOP =
32'h0000_0013, ALUop = 7'b001_0011;
input clock;
reg [31:0] PC, Regs[0:31], IDEXA, IDEXB, EXMEMB, EXMEMALUOut,
MEMWBValue;
reg [31:0] IMemory[0:1023], DMemory[0:1023], // separate memories
IFIDIR, IDEXIR, EXMEMIR, MEMWBIR; // pipeline registers
wire [4:0] IFIDrs1, IFIDrs2, IDEXrs1, IDEXrs2, EXMEMrd, MEMWBrd; //
Access register fields
wire [6:0] IFIDop, IDEXop, EXMEMop, MEMWBop; // Access opcodes
wire [31:0] Ain, Bin; // the ALU inputs
// declare the bypass signals
wire bypassAfromMEM, bypassAfromALUinWB,
bypassBfromMEM, bypassBfromALUinWB,
bypassAfromLDinWB, bypassBfromLDinWB;
wire stall; // stall signal
wire takebranch;
assign IFIDop
 = IFIDIR[6:0];
assign IFIDrs1
 = IFIDIR[19:15];
assign IFIDrs2
 = IFIDIR[24:20];
assign IDEXop
 = IDEXIR[6:0];
assign IDEXrs1
 = IDEXIR[19:15];
assign IDEXrs2
 = IDEXIR[24:20];
assign EXMEMop
 = EXMEMIR[6:0];
assign EXMEMrd
 = EXMEMIR[11:7];
assign MEMWBop
 = MEMWBIR[6:0];
assign MEMWBrd
 = MEMWBIR[11:7];
// The bypass to input A from the MEM stage for an ALU operation
assign bypassAfromMEM = (IDEXrs1 == EXMEMrd) && (IDEXrs1 != 0) &&
(EXMEMop == ALUop);
// The bypass to input B from the MEM stage for an ALU operation
assign bypassBfromMEM = (IDEXrs2 == EXMEMrd) && (IDEXrs2 != 0) &&
(EXMEMop == ALUop);
// The bypass to input A from the WB stage for an ALU operation
assign bypas sAfromALUinWB = (IDEXrs1 == MEMWBrd) && (IDEXrs1 != 0) &&
(MEMWBop == ALUop);
// The bypass to input B from the WB stage for an ALU operation
assign bypassBfromALUinWB = (IDEXrs2 == MEMWBrd) && (IDEXrs2 != 0) &&
(MEMWBop == ALUop);
// The bypass to input A from the WB stage for an LW operation
assign bypassAfromLDinWB = (IDEXrs1 == MEMWBrd) && (IDEXrs1 != 0) &&
(MEMWBop == LW);
// The bypass to input B from the WB stage for an LW operation
assign bypassBfromLDinWB = (IDEXrs2 == MEMWBrd) && (IDEX rs2 != 0) &&
(MEMWBop == LW);
// The A input to the ALU is bypassed from MEM if there is a bypass
there,
// Otherwise from WB if there is a bypass there, and otherwise comes
from the IDEX register
assign Ain = bypassAfromMEM ? EXMEMALUOut :
(bypassAfromALUinWB || bypassAfromLDinWB) ? MEMWBValue :
IDEXA;
// The B input to the ALU is bypassed from MEM if there is a bypass
there,
// Otherwise from WB if there is a bypass there, and otherwise comes
from the IDEX register
assign Bin = bypassBfromMEM ? EXMEMALUOut :
(bypassBfromALUinWB || bypassBfromLDinWB) ? MEMWBValue:
IDEXB;
// The signal for detecting a stall based on the use of a result from
LW
assign stall = (MEMWBop == LW) && ( // source instruction is a load
(((IDEXop == LW) || (IDEXop == SW)) && (IDEXrs1 ==
MEMWBrd)) || // stall for address calc
((IDEXop == ALUop) && ((IDEXrs1 == MEMWBrd) ||
(IDEXrs2 == MEMWBrd)))); // ALU use
// Signal for a taken branch: instruction is BEQ and registers are
equal
assign takebranch = (IFIDop == BEQ) && (Regs[IFIDrs1] ==
Regs[IFIDrs2]);
integer i; // used to initialize registers
initial
begin
PC = 0;
IFIDIR = NOP; IDEXIR = NOP; EXMEMIR = NOP; MEMWBIR = NOP; // put NOPs
in pipeline registers
for (i=0;i<=31;i=i+1) Regs[i] = i; // initialize registers--just so
they aren't cares
end
// Remember that ALL these actions happen every pipe stage and with the
use of <= they happen in parallel!
always @(posedge clock)
begin
if (~stall)
begin // the first three pipeline stages stall if there is a load
hazard
if (~takebranch)
begin // first instruction in the pipeline is being fetched
normally
IFIDIR <= IMemory[PC >> 2];
PC <= PC + 4;
end
else
begin // a taken branch is in ID; instruction in IF is wrong;
insert a NOP and reset the PC
IFIDIR <= NOP;
PC <= PC + {{52{IFIDIR[31]}}, IFIDIR[7], IFIDIR[30:25],
IFIDIR[11:8], 1'b0};
end
// second instruction in pipeline is fetching registers
IDEXA <= Regs[IFIDrs1]; IDEXB <= Regs[IFIDrs2]; // get two
registers
IDEXIR <= IFIDIR; // pass along IR--can happen anywhere, since this
affects next stage only!
// third instruction is doing addre ss calculation or ALU operation
if (IDEXop == LW)
EXMEMALUOut <= IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30:20]};
else if (IDEXop == SW)
EXMEMALUOut <= IDEXA + {{53{IDEXIR[31]}}, IDEXIR[30:25],
IDEXIR[11:7]};
else if (IDEXop == ALUop)
case (IDEXIR[31:25]) // case for the various R-type instructions
0: EXMEMALUOut <= Ain + Bin; // add operation
default: ; // other R-type operations: subtract, SLT, etc.
endcase
EXMEMIR <= IDEXIR; EXMEMB <= IDEXB; // pass along the IR & B
register
end
else EXMEMIR <= NOP; // Freeze first three stages of pipeline; inject
a nop into the EX output
// Mem stage of pipeline
if (EXMEMop == ALUop) MEMWBValue <= EXMEMALUOut; // pass along ALU
result
else if (EXMEMop == LW) MEMWBValue <= DMemory[EXMEMALUOut >> 2];
else if (EXMEMop == SW) DMemory[EXMEMALUOut >> 2] <= EXMEMB; //store
MEMWBIR <= EXMEMIR; // pass along IR
// WB stage
if (((MEMWBop == LW) || (MEMWBop == ALUop)) && (MEM WBrd != 0)) //
update registers if load/ALU operation and destination not 0
Regs[MEMWBrd] <= MEMWBValue;
end
endmodule