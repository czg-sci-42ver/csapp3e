/* $begin counterprob */
#include <bits/types/sigset_t.h>
#include <stddef.h>
#include <sys/wait.h>

#include "csapp.h"

int counter = 0;

void handler(int sig) {
  counter++;
  sleep(1); /* Do some work in the handler */
  // pause();
  return;
}

int main() {
  int i;

  Signal(SIGUSR2, handler);
  sigset_t mask,prev;
  Sigemptyset(&mask);
  Sigaddset(&mask, SIGUSR2);

  if (Fork() == 0) { /* Child */
    for (i = 0; i < 5; i++) {
      Kill(getppid(), SIGUSR2);
      printf("sent SIGUSR2 to parent\n");
    }
    exit(0);
  }

  //   Wait(NULL);
  while (waitpid(-1, NULL, 0) > 0) {
    while (1) {
        sigsuspend(&prev);
    }
    printf("wait for all childs end");
  }
  printf("counter=%d\n", counter);
  exit(0);
}
/* $end counterprob */
