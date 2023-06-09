module R1SCVCPU (clock) :
// I nstruction opcodes
parameter LO= 7 ' b000_0011, SD= 7' b010_0011 , BEO = 7 ' b110_0011 , NOP
32 ' h0000_0013 , ALUop = 7' b001_0011 ;
in put clock :
reg [63 :0] PC , Regs[0 :31]. IDEXA . IDEXB . EXMEMB . EXMEMALUOut .
MEMWBValue ;
reg [31 :0] IMemory[0 : 1023] , DMemory[0 :1023] , II separate memor i es
IF I DIR . I DEXIR . EXMEMIR . MEMWBIR : // pipeline registers
wire [4:0] IF IDrs l, IFIDrs2 , IDEXrsl, IDEXrs2 . EXMEMrd , MEMWBrd ; //
Access register fields
wire [6:0J IDEXop . EXMEMop . MEMWBop : // Access opcodes
wire [63 :0J Ai n . Bin : // the ALU i nputs
// decl are the bypass si gna l s
wire bypassAfromM EM. bypassAfromALUin WB.
bypassBfromMEM. bypassBfromALUin WB.
bypassAfrom LDin WB. bypassBfromLDinWB:
assignassignassignass i gnassignassignassignass i gnassignIFIDrsl1F1Drs2IDEXop
IDEXrs l
IDEXrs2
EXMEMop
EXMEMrd
MEMWBopMEMWB rd= IFIDI R[19 :15] :
= IFIOIR[24 :20] :
IDEXIR[6 :0J;
IDEXIR[19 :15] ;
IDEXIR[24 : 20] ;
EXMEMIR[6 :0J ;
EXMEMI R[ll : 7] ;
= MEMWBIR[6 :0] :
= MEMWB I R[ll :7] :
// The bypass to in put A fro m t he MEM stage for an ALU operation
ass i gn bypassAfromMEM = (IDEXrsl = EXMEMrd) && ( I DEXrs l != 0) &&
( EXMEMop = ALUop) ;
// The bypass to i nput B fro m t he MEM stage for an ALU operation
assign bypassBfromMEM = (I DEXrs2 = EXMEMrd) && ( I DEXrs2 != 0) &&
(EXMEMop == ALUop) :
// The bypass to i nput A fro m t he WB stage for an ALU ope r ation
assign bypassAfromALU i nWB = (IOEXrsl = MEMWBrd) && (IDEXrsl != OJ &&
(MEMWBop = ALUop) ;
// The bypass to i nput B from the WB stage for an ALU operati on
assign bypassBfromALUin\~B = (IDEXrs2 = MEMWBrd) && (IDEXrs2 != 0) &&
(MEMWBop == ALUop) ;
// The bypass t o in put A fro m t he WB stage for an LO operati on
assign bypassAfromLDi nWB = (IDEXrsl == MEM~rd) && ( l OEXrsl != 0) &&
(MEMWBop = LO) ;
// The bypass to in put B fro m t he WB stage for an LD operati on
assign bypass Bfro mLDinWB = ( I DEXrs2 = MEMWBrd) && ( ID EXrs2 != 0) &&
( MEMWBop == LO) ;
// The A input to t he ALU is bypassed fro m MEM if t here i s a bypass
there .
// Otherwise fro m WB if the re i s a bypass the re , and otherwise comes
from the !DEX register
assign Ain = bypassAfromMEM? EXMEMALUOut :
(bypassAfromALUinWB I I bypassAfromLDinWB) ? MEMWBValue
IDEXA :
// The B input to the ALU i s bypassed from MEM if t here is a bypass
t here .
// Otherwise fro m WB i f there is a bypass there . and otherwise comes
from t he IDEX register
661
assignIDEXB ;
Bin
bypassBfromM EM? EXMEMALUOut :
(bypassBfromALUinWB I I bypassBfromLDinWB) ? MEMWBValue :
i nteger i; // used to initialize registers
i nitial
begin
PC= O;
IFIDIR = NOP ; IDEXIR = NOP ; EXMEMIR = NOP ; MEMWBIR = NOP ; // put NOPs
in pipe l ine registers
for ( i=O; i<=3l ; i =i+l) Regs[i] = i; // in itialize registers -- just so
they aren ' t cares
end
// Remember that ALL these act i ons happen every pipe stage and with the
use of<= t hey happen in parallel !
al ways @(posedge cl ock)
begin
// first instruction in the pipeline is being fetched
// Fetch & increment PC
IFIDIR <= IMemory[PC >> 2] ;
PC<= PC+ 4;
// second instruction in pipe l ine is fetching registe r s
IDEXA <= Regs[IFIDrsl] ; IDEXB <= Regs[IFIDrs2] ; // get two registers
IDEXIR <= IFIDIR; // pass along IR -- can happen anywhere , s i nce t his
affects next stage only!
// th i rd instruction i s doing address calculat i on or ALU operation
if (IDEXop == LO)
EXMEMALUOut <= IDEXA + ( (53(IDEXIR[31]}) , IDEXIR[30 : 20]) ;
else if (IDEXop = SD)
EXMEMA LU Out <= IDEXA + (153(IDEXIR [31 J lf . IDEXIR[30 : 25J .
IDEXIR[ll : 7]} ;
else i f (IDEXop = ALUop)
case (IDEXIR[31:25]) // case for the various R-type instructions
0: EXMEMALUOut <= Ain + Bin ; // add operation
default : ; // other R- type operations : subt ract , SLT , etc .
endcase
EXMEMIR <= IDEXIR ; EXMEMB <= IDEXB ; // pass along the IR & B register
II Mem stage of pipeli ne
if (EXMEMop = ALUop) MEMWBValue <= EXMEMALUOut ; // pass along ALU
result
else if (EXMEMop = LO) MEMWBValue <= DMemory[EXMEMALUOut >> 2] ;
else i f (EXMEMop = SD) DMemory[EXMEMALUOut >> 2] <= EXMEMB ; //store
MEMWBIR <= EXMEMIR ; // pass along IR
// WB stage
if (((MEMWBop == LO) I I (MEMWBop == ALUop)) && (MEMWBrd != 0)) //
update registers if load/ALU operation and destination not 0
Regs[MEMWBrd] <= MEMWBVa l ue ;
end
endmodu l e