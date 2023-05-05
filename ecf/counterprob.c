/* $begin counterprob */
#include "csapp.h"

int counter = 0;
static volatile int status = 1;
void handler(int sig) {
  status = 0;
  counter++;
  // sleep(1); /* Do some work in the handler */
  status = 1;
  return;
}

int main() {
  int i;

  Signal(SIGUSR2, handler);

  if (Fork() == 0) { /* Child */
    for (i = 0; i < 5; i++) {
      Kill(getppid(), SIGUSR2);
      // sleep(1);
      // Kill(getppid(), SIGKILL);
      printf("sent SIGUSR2 to parent\n");
      while (!status) {
      };
    }
    exit(0);
  }

  Wait(NULL);  // here no race condition because the parent always wait for
               // child, so must run after child.
  printf("counter=%d\n", counter);
  exit(0);
}
/* $end counterprob */
