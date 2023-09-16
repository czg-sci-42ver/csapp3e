#include <unistd.h>
#include <stdio.h>
static volatile int retry_connect=0;
int main(){
  unsigned long int cnt=100000;
  while (cnt--){
    /*
    lfence is enough.
    */
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    retry_connect++; // load and store
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    fprintf(stdout, "child pid: %d retry: %d\n",getpid(),retry_connect); // load retry_connect and store to stdout
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
    // fflush(stdout);
    // asm volatile("lfence":::"memory"); // Prevent CPU reordering
  }
}
