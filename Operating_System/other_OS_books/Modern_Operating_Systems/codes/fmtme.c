/*
https://seclists.org/bugtraq/2000/Sep/214
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
  char buf[100];
  int x;
  if(argc != 2)
    exit(1);
  x = 1;
  snprintf(buf, sizeof(buf), argv[1]);
  buf[sizeof(buf) - 1] = 0;
  printf("buffer (%ld): %s\n", strlen(buf), buf);
  printf("x is %d/%#x (@ %p)\n", x, x, &x);
  return 0;
}
