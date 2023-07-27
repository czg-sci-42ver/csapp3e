#! /bin/bash
################
# run . ../sed_no_ocr.sh E4.13.4_orig.v E4.13.4_orig_bk.v; 
# although this format not appropriate for vscode extension "SystemVerilog and Verilog Formatter" to format
################
file=$1
cp $2 $file
diff $2 $file
echo "mod file $file"
# https://www.gnu.org/software/sed/manual/html_node/Joining-lines.html
sed -i -r -e '/\/\/$/ {N; s/\n//g};p' $file
################
# the "[^pIw\(0dei]" is to keep the '\n' while removing some absolute lines '\n'; This is less stricter filter.
# then 
# first charaters of words to remove '\n': t,f,L,i(in/insert),u,h,n,r,a(affects/a nop/)
################
# not use 'in|ins' which will include 'initial'
sed -i -r -e '/\/\/.*/ {N; s/\n([^pIw\/a\(i0deMR])/\1/g ;s/\n(in |insert|affects|equal|a )/ \1/g};p' $file
# https://superuser.com/a/1249834/1658455
echo -e "sed -r -e '/\/\/.*/ {N; s/\\\n([^pIw\/a\(i0deMR])/\1/g ;s/\\\n(reg)/ \1/p};p' $file"
##############
# here 3 lines:
# (IDEXrs2 == MEMWBrd)))); // ALU use
# // Signal for a taken branch: instruction is BEQ and registers are
# equal
# will become 2 lines first if with '/\/\/.*/'; then str "equal" can't be related with original 2nd line.
##############
sed -i -r -e '/\/\/ Signal.*/ {N; s/\n(equal)/ \1/};p' $file
##############
# similar to above
# // second instruction in pipeline is fetching registers
# IDEXA <= Regs[IFIDrs1]; IDEXB <= Regs[IFIDrs2]; // get two
# registers
# the 2rd still be combined into 1st line
##############
sed -i -r -e '/\/\/ get.*/ {N; s/\n(r)/ \1/};p' $file
sed -i -r -e '/\/\/ pass.*/ {N; s/\n(r)/ \1/};p' $file
concatenation(){
    echo "concatenation" $1 $2
    echo "sed -i -r -e 's/($1) ($2)/\1\2/;p' $file"
    sed -i -r -e 's/($1) ($2)/\1\2/;p' $file
    # echo "sed -r -e 's/($1) ($2)/\1\2/g' $3"
    # sed -r -e 's/($1) ($2)/\1\2/g' $3
}
# not use `. ../sed_no_ocr.sh E4.13.4_orig.v E4.13.4_orig_bk.v` which weirdly not runs the `concatenation` right.
# 
concatenation "bypas" "sAfromALUinWB"
sed -i -r -e 's/(bypas) (sAfromALUinWB)/\1\2/;p' E4.13.4_orig.v
concatenation "IDEX" "rs2"
sed -i -r -e 's/(IDEX) (rs2)/\1\2/;p' E4.13.4_orig.v

sed -i -r -e 's/(MEM) (WBrd)/\1\2/;p' E4.13.4_orig.v
# sed -i -r -e 's/(.*)(\/\/.*)/\1\n\2/;p' E4.13.4_orig.v