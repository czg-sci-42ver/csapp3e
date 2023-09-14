// https://stackoverflow.com/a/68506235/21294350
#include <stddef.h>
#include <stdio.h>
#include <sys/time.h>
#include <sys/select.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv) {
    int ready;
    struct timeval *pto;
    fd_set readfds, writefds;
    char buf[1024];
    int bytes;
    int fd = 0; // stdin

    pto = NULL;
    FD_ZERO(&readfds);
    FD_ZERO(&writefds);
    FD_SET(fd, &readfds);

    int flags = fcntl(fd, F_GETFL, 0);
    fcntl(fd, F_SETFL, flags | O_NONBLOCK);

    while (1) { 
        ready = select(1, &readfds, &writefds, NULL, pto);

        if (ready == -1) {
            printf("got -1\n");
            return 1;
        }

        printf("ready = %d\n", ready);

        bytes = read(fd, buf, 1024);
        if (bytes == 0) {
            printf("all done\n");
            return 0;
        } else if (bytes > 0) {
            buf[bytes] = '\0';
            printf("read: %s\n", buf);
        } else {
            printf("got an error\n");
        }
    }
}
