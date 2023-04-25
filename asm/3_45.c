#include <stdio.h>
#include <stdlib.h>
struct rec {
  int *a;
  float b;
  char c;
  short d;
  long e;
  double f;
  int g;
  char *h;
} ;

int main(int argc, char *argv[]) {
  int test_int = 1;
  char test_char = 1;
  struct rec test = { &test_int,1,1,1,1,1,1, &test_char};
}
