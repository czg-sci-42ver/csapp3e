// from linux source code
#include <errno.h>
#include "pthreadP.h"
#include <shlib-compat.h>
#include <stap-probe.h>
int
___pthread_mutex_destroy (pthread_mutex_t *mutex)
{
  LIBC_PROBE (mutex_destroy, 1, mutex);
  /* See concurrency notes regarding __kind in struct __pthread_mutex_s
     in sysdeps/nptl/bits/thread-shared-types.h.  */
  if ((atomic_load_relaxed (&(mutex->__data.__kind))
       & PTHREAD_MUTEX_ROBUST_NORMAL_NP) == 0
      && mutex->__data.__nusers != 0)
    return EBUSY;
  /* Set to an invalid value.  Relaxed MO is enough as it is undefined behavior
     if the mutex is used after it has been destroyed.  But you can reinitialize
     it with pthread_mutex_init.  */
  atomic_store_relaxed (&(mutex->__data.__kind), -1);
  return 0;
}
