// Build with: gcc -m32 -no-pie -g -o plt plt.c
#include <stdio.h>

typedef double src_t ;
typedef float dest_t;

int main() {
	src_t test_src=-1.23942;
	dest_t test_dest=-2.123814;
	if(test_src<test_dest){
		putchar(41);
	}
}
