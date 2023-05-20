// ##############################################################
#include <sys/timerfd.h>

#include "csapp.h"

// char *tfgets(char *s, int size, FILE *stream);

char *tfgets(char *s, int size, FILE *stream) {
  fd_set read_set, ready_set;

  struct itimerspec value;
  int timerfd = timerfd_create(CLOCK_MONOTONIC, TFD_CLOEXEC | TFD_NONBLOCK);
  value.it_interval.tv_sec = 5;
  value.it_interval.tv_nsec = 0;
  value.it_value.tv_sec = 5;
  value.it_value.tv_nsec = 0;
  timerfd_settime(timerfd, 0, &value, NULL);

  FD_ZERO(&read_set);
  FD_SET(STDIN_FILENO, &read_set);
  FD_SET(timerfd, &read_set);
  ready_set = read_set;

  while (1) {
    Select(timerfd + 1, &ready_set, NULL, NULL, NULL);

    if (FD_ISSET(timerfd, &ready_set)) return NULL;

    if (FD_ISSET(STDIN_FILENO, &ready_set)) {
      fgets(s, size, stream);
      return s;
    }
  }
}