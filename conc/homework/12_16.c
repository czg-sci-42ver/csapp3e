/*
 * hello.c - Pthreads "hello, world" program
 */
/* $begin hello */
#include "csapp.h"
#include <stdlib.h>
void *thread(void *vargp);  // line:conc:hello:prototype

int main(int argc,char **argv)  // line:conc:hello:main
{
  if (argc!=2) {
    exit(0);
  }
  int thread_num = atoi(argv[1]); 
  pthread_t tid[thread_num];                             // line:conc:hello:tid
  int i;
  for (i=0; i<thread_num; i++) {
    Pthread_create(&tid[i], NULL, thread, NULL);  // line:conc:hello:create
  }
  for (i=0; i<thread_num; i++) {
    Pthread_join(tid[i], NULL);                   // line:conc:hello:join
  }
  exit(0);                                   // line:conc:hello:exit
}

void *thread(void *vargp) /* thread routine */  // line:conc:hello:beginthread
{
  printf("Hello, world!\n");
  return NULL;  // line:conc:hello:return
}  // line:conc:hello:endthread
/* $end hello */
