#include <stdio.h>
#include <stdlib.h>

long decode2(long x, long y, long z);
long decode2(long x, long y, long z){
	return (((z-y)>>63)<<63)|(x*y);
}

int main(int argc, char *argv[]) {
}
