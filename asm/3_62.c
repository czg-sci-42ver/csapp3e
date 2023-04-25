#include <stdio.h>
#include <stdlib.h>

typedef enum { MODE_A, MODE_B, MODE_C, MODE_D, MODE_E } mode_tt;
long switch3(long *p1, long *p2, mode_tt action) {
  long result = 0;
  /*lack break; */
  switch (action) {
    case MODE_A:
		result=*p2;
		*p2=*p1;
    case MODE_B:
		result=*p1;
		/* addq */
		*p1=*p2;
    case MODE_C:
		*p1=59;
		result=*p2;
    case MODE_D:
		*p1=*p2;
		result=27;
    case MODE_E:
		result=27;
    default:
		result=12;
  }
  return result;
}

int main(int argc, char *argv[]) {}
