// inspired by gcc with 64bit support
#include <stdio.h>
typedef struct test_lock{
  int ticket;
} lock_struct;
// #define USE_ASM

int main(){
  int test=0;
  #ifndef USE_ASM
  int myturn = __atomic_fetch_add(&test, 1, __ATOMIC_SEQ_CST);
  #else
  int myturn;
  lock_struct lock={0};
  #ifdef USE_XADD
  asm("mov 1,%0\n\t"
      "lock xadd %0,%1"
      :"+r" (myturn), "+m" (lock.ticket)
      );
  #else
  asm("mov %1,%0\n\t"
      "incw %1"
      :"+r" (myturn), "+m" (lock.ticket)
      );
  #endif
  #endif
  // printf("%d %d\n",myturn,lock.ticket);
  return myturn;
}
