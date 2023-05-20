#include <fcntl.h>
#include <stdio.h>

#include "csapp.h"

char *tfgets(char *s, int size, FILE *stream) {
  int fd = fileno(stream);
  int flags = fcntl(fd, F_GETFL, 0);
  fcntl(fd, F_SETFL, flags | O_NONBLOCK);
  fd_set set, ready;
  FD_SET(fd, &set);

  ready = set;
  struct timeval t = {.tv_sec = 5};
  char *readptr = s;
  char *readend = s + size - 1;
  while (1) {
    ready = set;
    // On linux, select returns the remaining time in t.
    int nready = Select(fd + 1, &ready, NULL, NULL, &t);
    if (!nready) {
      fcntl(fd, F_SETFL, flags);
      return NULL;
    }
    for (; readptr < readend; readptr++) {
      switch (read(fd, readptr, 1)) {
        case 1:
          printf("%p\npos: %ld\n", readptr, ftell(stream));
          if (*readptr == '\n') {
            readptr++;
            goto break_out;
          }
          break;
        case 0:
          goto break_out;
        default:
          printf("EAGAIN\n");
          if (errno == EAGAIN) goto break_outer;
          unix_error("Read error!");
      }
    }
  break_outer:; /*infinite loop*/
  }
break_out:
  *readptr = '\0';
  fcntl(fd, F_SETFL, flags);
  return s;
}