/* $begin cpfile */
#include "../include/csapp.h"

#define MAXBUFFER 10
int main(int argc, char **argv) {
  int n;
  rio_t rio;
  char buf[MAXBUFFER];

  Rio_readinitb(&rio, STDIN_FILENO);
  // while ((n = Rio_readnb(&rio, buf, MAXBUFFER)) != 0)
  while ((n = Rio_readn(STDIN_FILENO, buf, MAXBUFFER)) != 0)
    Rio_writen(STDOUT_FILENO, buf, n);
  /* $end cpfile */
  exit(0);
  /* $begin cpfile */
}
/* $end cpfile */
