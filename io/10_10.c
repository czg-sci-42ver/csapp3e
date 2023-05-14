/* $begin cpfile */
#include "../include/csapp.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int n;
  rio_t rio;
  char buf[MAXLINE];
  int file=0;
  if (argc==2) {
    file=Open(argv[1], O_RDONLY , 0);
    Dup2(file, STDIN_FILENO );
  }else if (argc>2) {
    exit(0);
  }

  Rio_readinitb(&rio, STDIN_FILENO);
  while ((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0)
    Rio_writen(STDOUT_FILENO, buf, n);
  /* $end cpfile */
  exit(0);
  /* $begin cpfile */
}
/* $end cpfile */
