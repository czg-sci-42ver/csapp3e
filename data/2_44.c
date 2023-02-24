/* $begin show-bytes */
#include <stdio.h>
/* $end show-bytes */
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc == 3) {
    int x = strtol(argv[1], NULL, 0);
    int y = strtol(argv[2], NULL, 0);
    unsigned ux = x;
    unsigned uy = y;
    printf("%d %d %d \n",ux*uy,x*y,x*y==ux*uy);
    printf("%d %d %d\n",ux+uy,x+y,x+y==ux+uy); /*cast*/
    printf("%d %d %d %d",ux,uy,x,y);
  }
}