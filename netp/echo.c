/*
 * echo - read and echo text lines until client closes connection
 */
/* $begin echo */
#include "../include/csapp.h"
#include <string.h>

void echo(int connfd) {
  size_t n;
  char buf[MAXLINE];
  rio_t rio;

  Rio_readinitb(&rio, connfd);
  /*
  connfd(rio->fd) -> buf // may drop some bytes
  buf -> connfd
  */
  while ((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {  // line:netp:echo:eof
    /*
    must transmit with `\n` ending because client use `Rio_readlineb`
    */
    printf("server received %d bytes strlen: %ld\n ", (int)n,strlen(buf));
    Rio_writen(connfd, buf, n);
  }
}
/* $end echo */
