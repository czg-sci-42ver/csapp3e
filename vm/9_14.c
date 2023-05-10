/* $begin mmapcopy */
#include "../include/csapp.h"
#include <stdio.h>

/*
 * mmapcopy - uses mmap to copy file fd to stdout
 */
void mmapcopy(int fd, int size) {
  char *bufp; /* ptr to memory-mapped VM area */

  bufp = Mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, 0);
  printf("get: %s",bufp);
  printf("should be: %s","Hello, world!\n\n");
  if (strcmp(bufp,"Hello, world!\n\n")) {
    fprintf(stderr, "input string error");
  }else {
    *bufp='J';
    printf("%s",bufp);
  }
  return;
}

/* mmapcopy driver */
int main(int argc, char **argv) {
  struct stat stat;
  int fd;

  /* Check for required command-line argument */
  if (argc != 2) {
    printf("usage: %s <filename>\n", argv[0]);
    exit(0);
  }

  /* Copy the input argument to stdout */
  fd = Open(argv[1], O_RDWR, 0);
  fstat(fd, &stat);
  mmapcopy(fd, stat.st_size);
  exit(0);
}
/* $end mmapcopy */
