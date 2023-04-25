#include <stdio.h>
#include <stdlib.h>

struct P1 { short i; int c; int *j; short *d; };
struct P4 { char w[16]; char *c[2];};
struct P5 { struct P4 a[2]; struct P1 t ;};

int main(int argc, char *argv[]) {
  int test_int =1;
  short test_short =1;
  struct P1 test={1,2,&test_int,&test_short};
}
