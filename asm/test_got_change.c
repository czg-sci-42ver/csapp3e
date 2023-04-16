// Build with: gcc -m32 -no-pie -g -o plt plt.c

#include <stdio.h>
#include <stdlib.h>
extern void *_GLOBAL_OFFSET_TABLE_;

int main(int argc, char **argv) {
  puts("Hello world!");
  puts("Hello world!");
  exit(0);
}
