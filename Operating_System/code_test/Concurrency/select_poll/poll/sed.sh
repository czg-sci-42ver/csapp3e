#! /bin/bash
file=$1
echo "mod file $file"
sed -i -e 's/^main/int main/i' $file
sed -i -e '3i\#include <unistd.h>\n#include <sys/select.h>\n#include <string.h>' $file
