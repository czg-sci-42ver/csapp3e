/* $begin show-bytes */
#include <stdint.h>
#include <stdio.h>
/* $end show-bytes */
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <math.h>

// https://www.h-schmidt.net/FloatConverter/IEEE754.html
int main(int argc, char *argv[]) {
  int32_t x= pow(2, 31)-1;
  printf("%f %d %d %.3e %f\n",(float)x,(int)(float)x,INT32_MAX,FLT_MAX,pow(2, 31)-1);
  double d = 1e40;
  printf("%f %f %d %e %e",(float)d,(double)(float)d,-INFINITY>0,pow(2, 127)-1-d,pow(2, 127)-1e20);
}

