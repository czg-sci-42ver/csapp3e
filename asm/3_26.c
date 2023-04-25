#include <stdio.h>
#include <stdlib.h>
short test_one(unsigned short x) {
  short val = 0;
  printf("%d\n",x);
  while (x) {
    val ^= x;
    x >>= 1;
  }
//   this is from ../references/csapp_zlib.pdf; github csapp global has wrong codes
  return val & 0x1;
}
// also see https://stackoverflow.com/questions/70036663/is-there-a-way-to-do-a-parity-check-using-bit-shifting-and-without-using-xor-of answer 1->2 'iParity += number & 1;' or https://stackoverflow.com/questions/49763042/how-to-calculate-parity-using-xor -> git@github.com:czg-sci-42ver/CSAPP-3e-Solutions.git 'odd_ones.c' ; TODO:https://gist.github.com/killuhwhale/4b6e58472fc3c176ca41154f59e041c1
int main(int argc, char *argv[]) {
  if (argc == 2) {
    printf("%d", test_one(strtoul(argv[1], NULL, 16)));
  }
}
