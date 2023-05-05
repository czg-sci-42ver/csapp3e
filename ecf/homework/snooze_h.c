#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

#include "csapp.h"
unsigned int to_sleep;
unsigned int cur_sleep;
unsigned int wakeup(unsigned int secs) {
  unsigned int rc = sleep(secs);
  return rc;
}
void sigint_handler(int sig) /* SIGINT handler */
{
  printf("Slept for %d of %d", cur_sleep, to_sleep);
  exit(0);
}
int main() {
  to_sleep = 5;
  if (signal(SIGINT, sigint_handler) == SIG_ERR)
      unix_error("signal error");
  //   pause();
  cur_sleep = wakeup(to_sleep);
  return 0;
}
