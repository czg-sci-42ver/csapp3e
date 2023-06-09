module RISCVCPU (clock) ;
II Instruct i on opcodes
parameter LO= 7 ' b000_0011 , SD= 7 ' b010_0011 , BEO = 7 ' bll0_0011 . NOP
32 ' h0000_0013 , ALUop = 7 'b001_0011 ;
input clock :
reg [63 :0J PC . Regs[0 : 31] , IDEXA, IDEXB , EXMEMB , EXMEMALUOut .
MEMWBValue ;
reg [31 : 0J IMemory[0 : 1023] , DMemory[0 :1023] . II separate memori es
I FIDIR , IDEX I R, EXMEMlR , MEMWBIR ; II pi pe l ine reg i sters
wire [4: 0J IFIDrsl , IFIDrs2 , MEMWBrd; // Access register fiel ds
wire [6 : 0] IDEXop . EXMEMop, MEMW Bop : // Access opcodes
wire [63 :0J Ain , Bin : // the ALU inputs
II These assignments define fie l ds from the pipel ine registers
assign IFIDrsl
 IFIDIR[l9:15]; // rsl field
assign I FIDrs2 = IFIDIR[24 : 20] : // rs2 field
assign IDEXop = 1DEXIR[6 : 0] ;
 // the opcode
assign EXMEMop = EXME MI R[6 : 0J;
 // the opcode
assign MEMWBop = MEMWBIR[6 : 0] ;
 // the opcode
assign MEMWBrd = MEMWBIR[ll :7] ; // rd field
// Inputs to the ALU come di rectly from the ID/EX pipeline registers
assign Ain = IDEXA;
assign Bin = IDEXB ;
integer i ; // used to initialize registers
initia l
begin
PC= O;
IFIDIR = NOP ; IDEXIR = NOP ; EXMEMIR = NOP ; MEMWBIR = NOP; // put NOPs
in pipeline registers
for (i =O; i<=3l ;i=i+l ) Regs[i] = i ; // initialize reg i sters -- just so
they aren ' t cares
end
// Remember that ALL these actions happen every pipe stage and with the
use of<= they happen in parallel!
always @(posedge cl ock)
begin
// first instruction i n the pipeli ne is being fetched
// Fetch & increment PC
IFIOIR <= IMemory [PC >> 2] ;
PC<= PC+ 4 ;
// second instruction in pipeline is fetching reg i sters
IDEXA <= Regs [I FIDrsl] ; IDEXB <= Regs[lFIDrs2] ; // get two registers
IDEXIR <= I FID I R; // pass along IR--can happen anywhere , since this
aff ects next stage on l y!
// third instruction is doing address calculation or ALU operation
if (IDEXop = LO)
EXMEMALUOut <= IDEXA + ((53{IDEXIR[31JJJ. IDEX1R[30 : 20]) ;
else if (IDEXop = SD)
EXMEMALUOut <= IDEXA + {1531IDEXIR[31 J}I . IDEXIR [30 : 25 ].
IDEXIR[ll :7] I ;
else if (IDEXop = ALUop)
case (IDEXIR[31 :25J) // case for the various R- type instructions
0: EXMEMALUOut <= Ain + Bin ; // add operation
658
default : ; // other R-type operations : subtract . SLT, etc .
endcase
EXMEMIR <= lDEXIR ; EXMEMB <= IDEXB ; // pass along the IR & B register
// Mem stage of pipeline
if (EXMEMop == ALUop) MEMWBValue <= EXMEMALUOut; // pass along ALU
result
else if (EXMEMop = LO) MEMWBValue <= DMemory[EXMEMALUOut >> 2] :
else if (EXMEMop == SD) DMemory[EXMEMALUOut >> 2] <= EXMEMB ; //store
MEMWBIR <= EXMEMIR; // pass along IR
// WB stage
if (((MEMWBop = LO) I I (MEMWBop = ALUop)) && (MEMWBrd != 0)) //
update registers if load/ALU operation and destination not 0
Regs[MEMWBrd] <= MEMWBValue;
end
endmodule