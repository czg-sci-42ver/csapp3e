/*
 * echo - read and echo text lines until client closes connection
 */
/* $begin echo */
#include "../include/csapp.h"

void echo(int connfd) {
  int n;
  char buf[MAXLINE];
  rio_t rio;

  Rio_readinitb(&rio, connfd);
  /*
  misunderstand what the question ask
  */
  if ((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {
    printf("server received %d bytes\n", n);
    Rio_writen(connfd, buf, n);
  }
}
/* $end echo */
