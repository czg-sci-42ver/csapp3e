#define OP / /* Unknown operator */
#include <stdio.h>

short arith(short x) {
return x OP 16;
}
void main(){
	printf("%d",arith(-17));	
}
