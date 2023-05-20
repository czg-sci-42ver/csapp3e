#include "csapp.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/select.h>
#include <unistd.h>

fd_set read_set;

void handler(){
    printf("remove alarm in handler\n");
    Alarm(0);
    printf("no input\n");
    exit(0);
}

char *tfgets(char *s, int size, FILE *stream){
    Alarm(5);
    int maxfd=2;
    FD_ZERO(&read_set);
    FD_SET(STDIN_FILENO,&read_set);
    Signal(SIGALRM, handler);
    while (1) {
        Select(maxfd+1, &read_set, NULL, NULL, NULL);
        if(FD_ISSET(STDIN_FILENO, &read_set)){
            printf("remove alarm in tfgets\n");
            Alarm(0);
            return fgets(s, size, stream);
        }
    }
}