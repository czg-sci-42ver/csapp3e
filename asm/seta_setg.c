// Build with: gcc -m32 -no-pie -g -o plt plt.c
#include <stdio.h>

typedef double src_t ;
typedef float dest_t;

//typedef unsigned int src_t ;
//typedef int dest_t;

//3
//typedef unsigned char src_t ;
//typedef long dest_t;

//4
//typedef int src_t ;
//typedef char dest_t;

int main() {
	src_t test_src=-1;
	dest_t test_dest=-1;
	long sub;
	src_t test_src_1=1<<31;
	if(test_src_1+test_src>(1l<<32)){
		putchar(1);
	}
	sub = -2-(-1);
	sub = -2-(unsigned int)(-1);
	if(sub<-1){
		putchar(1);
	}
	if(test_src>=(unsigned int)-1){
		//test_src=2;
		printf("1");
	}
	if(test_dest>-1){
		test_dest=2;
	}
}
