#include <stdio.h>
#include <sys/time.h>

#include "csapp.h"

sigjmp_buf buf;
#define BIG_SIZE 1024
void handler() {}

char *tfgets(char *s, int size, FILE *stream) {
  struct itimerval newTimer;
  struct itimerval oldTimer;
  char *result = Malloc(BIG_SIZE * sizeof(char));

  newTimer.it_value.tv_sec = 1;
  newTimer.it_value.tv_usec = 0;

  newTimer.it_interval.tv_sec = 4;
  newTimer.it_interval.tv_usec = 0;

  Signal(SIGCHLD, handler);
  if (Fork() == 0) {
    if (!sigsetjmp(buf, 1)) {
      setitimer(ITIMER_REAL, &newTimer, &oldTimer);
    } else {
    }
    // result fgets(s, size, stream);
  }
}