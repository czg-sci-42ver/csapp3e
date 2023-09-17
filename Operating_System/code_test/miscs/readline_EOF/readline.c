#include <unistd.h>
#include <stdio.h>
ssize_t readline(int fd, void *buf, size_t maxlen) {
    char c;
    char *bufp = buf;
    int n;
    for (n = 0; n < maxlen - 1; n++) { // leave room at end for '\0'
	int rc;
        if ((rc = read(fd, &c, 1)) == 1) {
            printf("get %c\n",c);
            *bufp++ = c;
            if (c == '\n')
                break;
        } else if (rc == 0) {
            /*
            1. https://stackoverflow.com/a/9806812/21294350 directly return when EOF
            2. EOF with flush https://stackoverflow.com/a/1516177/21294350
            3. `stty -a` -> "eof = ^D"
            */
            if (n == 0){
                printf("EOF\n");
                fflush(stdout);
                return 0; /* EOF, no data read */
            }
            else{
                printf("n:%d\n",n);
                break;    /* EOF, some data was read */
            }
        } else
            return -1;    /* error */
    }
    *bufp = '\0';
    printf("get data num:%d\n",n);
    return n;
}
int main(){
    char buf[1024];
    readline(STDIN_FILENO,buf,1024);
}

