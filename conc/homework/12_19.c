/*
 * Readers-writers solution with weak reader priority
 * From Courtois et al, CACM, 1971.
 */
#include "csapp.h"

/* $begin reader1 */
/* Global variables */
int readcnt,writecnt,writecnt_two;    /* Initially = 0 */
sem_t mutex, w, w_reach_one,wr; /* Both initially = 1 */

void reader(void) {
  while (1) {
    P(&mutex);
    readcnt++;
    if (readcnt == 1) /* First in */
      P(&w);
    V(&mutex);

    /* Critical section */
    /* Reading happens  */

    P(&mutex);
    readcnt--;
    if (readcnt == 0){ /* Last out */
      V(&w);
      // P(&wr);
      if (writecnt_two == 1) { /* buggy */
        V(&w_reach_one);
      }
      // V(&wr);
    } 
      
    V(&mutex);
  }
}
/* $end reader1 */

/* $begin writer1 */

/*
buggy
*/
void writer(void) {
  while (1) {
    P(&wr);
    writecnt++;
    if (writecnt == 2) {
      /*
      ignore this line: block if have 2 or above writers

      should take whether reader exist in account instead of writer count first.
      */
      writecnt_two = 1;
      P(&w_reach_one);
      V(&wr);
      goto wr_2;
    }
    V(&wr);
    wr_2: P(&w);

    /* Critical section */
    /* Writing happens  */

    V(&w);
    P(&wr);
    writecnt--;
    V(&wr);
  }
}
/* $end writer1 */

int main(){}
