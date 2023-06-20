#! /bin/bash
file=$1
echo "mod file $file"
sed -i -e 's/J/]/i' $file
sed -i -e 's/\(req\) , /\1./' $file
sed -i -r -e 's/(res)[ ]?,[ ]?/\1./' $file
# https://stackoverflow.com/questions/2777579/how-can-i-output-only-captured-groups-with-sed
sed -i -r -e 's/(_) (req)/\1\2/' $file
sed -i -r -e 's/(req) ,([a-zA-Z])/\1.\2/' $file
sed -i -r -e 's/\/ \*/\/\*/' $file
sed -i -r -e "s/' 0/'0/" $file
sed -i -r -e "s/w r/wr/" $file
change_comma(){
	sed -i -r -e "s/$1 , /$1./" $file
}
sed -i -r -e "s/read , /read./" $file
change_comma "write"
change_comma "data"
#change_comma ""
sed -i -r -e "s/'[ ]?l/'1/" $file
sed -i -r -e "s/_ ([a-zA-Z])/_\1/" $file
sed -i -r -e "s/· /'/" $file
sed -i -r -e "s/([a-zA-Z]) _([a-zA-Z])/\1_\2/" $file

#sed -i -r -e "s/(\d)' /\1'/" E5_12_5.sv
