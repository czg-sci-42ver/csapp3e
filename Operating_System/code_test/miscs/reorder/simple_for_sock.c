#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <string.h>
#include <netinet/in.h>
static volatile int retry_connect=0;
#define SOCKET_PORT 8080
int main(){
  int socket_flags = SOCK_STREAM|SOCK_NONBLOCK;
  struct sockaddr_in addr;
  int sfd = socket(AF_INET, socket_flags, 0);
  memset(&addr, 0, sizeof(addr));
  addr.sin_family = AF_INET;
  addr.sin_port = htons(SOCKET_PORT);
  // printf("%dconverted to %d\n",SOCKET_PORT,addr.sin_port);
  addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
  while (connect(sfd, (struct sockaddr *)&addr, sizeof(addr))!=0){
    /*
    lfence is enough.
    */
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    retry_connect++; // load and store
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    fprintf(stdout, "thread tid: %d retry: %d\n",gettid(),retry_connect); // load retry_connect and store to stdout
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    // fflush(stdout);
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    if (retry_connect>200000) {
      break;
    }
  }
}
