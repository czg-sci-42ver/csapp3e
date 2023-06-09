module RISCVCPU (clock) :
// Instruction opcodes
parameter LO= 7' b000_0011 . SD= 7' b010_0011 . BED= 7' bll0_0011, NOP=
32'h0000_0013, ALUop = 7 ' b001_00 11:
input clock :
reg [63 :0J PC , Regs[0 :31] , IOEXA, IDEXB. EXMEMB, EXMEMALUOut ,
MEMWBValue ;
reg [31 : 0] IMemory[0 :1023] . OMemory[0 : 1023]. // separate memories
IFIDIR. IDEXIR. EXMEMIR, MEMWBJR ; // pipeline registers
wire [4 :0J IFIDrsl. IFIDrs2 . IDEXrsl. IDEXrs2. EXMEMrd, MEMWBrd; //
Access register fields
wire [6 :0J IDEXop , EXMEMop, M EMWBop : // Access opcodes
wire [63 : 0J Ain . Bin : // the ALU inputs
II dec l are the bypass signals
wire bypassAfromMEM . bypassAfromALUinWB .
bypassBfromMEM . bypassBfromALUinWB .
bypassAfromLDinWB . bypassBfromLOinWB :
wire stall ; II stall signal
assignassignassignassignassignassignassignassignassignIFIDrsl
IFIDrs2
IDEXop
IDEXrsl
IDEXrs2
EXMEMop
EXMEMrd
MEMWBop
MEMWBrd=I FIDIR[l9 : 15] :
IFIDIR[24 : 20];
IDEXIR[6 : 0J :
IDEX1R[19 :15] ;
IDEXIR[24 :20] :
EXMEMIR[6 :0J;
EXMEMIR[ll : 7] :
MEMWBIR[6 : 0J :
M[MWBIR[ll : 7];
// The bypass to input A from the MEM stage for an ALU operation
assign bypassAfromMEM = CIOEXrsl = EXMEMrd) && (JDEXrsl != 0) &&
(EXMEMop = ALUop) :
II The bypass to input B from the MEM stage for an ALU operation
assign bypassBfromMEM = (IDEXrs2 == EXMEMrd) && (IDEXrs2 != 0) &&
(EXMEMop = ALUop) :
II The bypass to input A from the WB stage for an ALU operation
assign bypassAfromA LUinWB = ( IDEXrsl = MEM~JBrd) && (IDEXrsl != 0) &&
(MEMWBop = ALUop) ;
// The bypass to input B from the WB stage for an ALU operat i on
assign bypassBfromALUinWB = ( IOEXrs2 = MEMWBrd) && (IDEXrs2 != 0) &&
(MEMWBop = ALUop) :
// The bypass to input A from the WB stage for an LO operation
assign bypassAfromLDinWB = (IDEXrsl == MEMWBrd) && (IOEXrsl != 0) &&
(MEMWBop == LO):
// The bypass to input B from the WB stage for an LO operation
assign bypassBfromLDin~JB = (IOEXrs2 == MEM(✓ Brd) && (lDEXrs2 != 0) &&
(MEMWBop = LD) ;
// The A input to the ALU is bypassed fro m MEM if there is a bypass
there.
// Otherwise from WB if there is a bypass there . and otherwise comes
from the lOEX register
assign Ain = bypassAfromMEM? EXMEMALUOut :
(bypassAfromALUinWB I I bypassAfromLDinWB) ? MEMWBValue
IDEXA ;
// The B input to the ALU is bypassed fro m MEM if there is a bypass
there.
// Otherwise from WB if there is a bypass there. and otherwise comes
from the 1DEX register
assign Bin= bypassBfromMEM? EXMEMA LUOut :
(bypassBfromALUinWB JI bypassBfromLDinWB) ? MEMl~BValue:
IDEXB :
664
// The signal for detecting a stall based on the use of a result from
LW
assign stall = (MEMWBop = LO) && ( // source instruction i s a load
(((!DEXop = LD) 11 (IDEXop = SD)) && (lDEXrsl
MEMWBrd)) I I // sta l l for address ca l c
((IDEXop = ALUop) && ((IDEXrsl = MEMWBr·d) 11
(IDEXrs2 = MEMWBrd)))) ; // ALU use
integer i ; // used to initialize registers
initial
begin
PC= O;
IFIDIR = NOP; IDE XIR = NOP; EXMEM IR = NOP ; MEMWBIR = NOP ; // put NOPs
in pipeline registers
for ( i =O ;i<=3l ; i=i+l) Regs[ i] = i; // initialize registers--just so
they aren't cares
end
// Remember that ALL these actions happen every pipe stage and with the
use of <= t hey happen in parallel!
always @(posedge clock)
begin
if (-stal 1)
begin// the first three pipeline stages stall i f there is a load
hazard
// first instruction in the pipeline is being fetched
// Fetch & increment PC
IFIDIR <= IMemory[PC >> 2] ;
PC <= PC + 4 ;
// second instruction in pipeline i s fetching registers
IDEXA <= Regs[IFIDrsl]; IDEXB <= Regs[IFIDrs2] ; // get two
registers
IDEXIR <= IFIDIR; // pass along IR· -can happen anywhere , since th i s
affects next stage on l y!
// t hird instruction is doing address calculation or ALU operation
if (IDEXop = LO)
EXMEMALUOut <= IDEXA + {l53{IDEXIR[31Jll , IDEXIR[30 :20]1 :
else if (IDEXop = SD)
EXMEMA LUOut <= IDEXA + {153{IDEXIR[31])1 . ICEXIR[30 : 25] ,
IDEXTR[ll : 7] I ;
else if (IDEXop = ALUop)
case (IDEXIR[31 :25]) // case for the various ~type instructions
0: EXMEMA LUOut <= Ain + Bin ; // add operation
default : ; // other R·type operations : subtract . SLT . etc .
endcase
EXMEMIR <= IDEXIR : EXMEMB <= IDEXB ; // pass al ong the IR & B
register
end
else EXMEMIR <= NOP; // Freeze first three stages of pipeline ; inject
a nop into the EX output
// Mem stage of pipeline
if (EXMEMop = ALUop) MEMWBValue <= EXMEMALUOut; II pass along ALU
result
else if (EXMEMop = LO) MEMWBValue <= DMemory[EXMEMALUOut >> 2] ;
else i f (EXMEMop = SO) OMemory[EXMEMALUOut >> 2] <= EXMEMB ; //store
MEMWBIR <= EXMEMIR ; // pass along IR
// WB stage
if ( ( ( MEMWBop =
 LO) 11 ( MEMWBop = ALUop)) && ( MEMWB rd != 0)) / /
upd ate registers if load/ALU operat i on and destination not 0
Regs[MEMWBrd] <= MEMWBValue :
end
endmodule