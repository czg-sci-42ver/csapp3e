/*non complete*/
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

#include "csapp.h"

struct thread_arg {
  sem_t* mutex;
  char* s;
  int size;
  FILE* stream;
  char* result;
};
void* thread(void* arg);

void* thread(void* arg) {
  Pthread_detach(Pthread_self());
  struct thread_arg tmp_arg = *(struct thread_arg*)arg;
  P(tmp_arg.mutex);
  tmp_arg.result = fgets(tmp_arg.s, tmp_arg.size, tmp_arg.stream);
  V(tmp_arg.mutex);
}

char* tfgets(char* s, int size, FILE* stream) {
  pthread_t tid;
  sem_t mutex;
  char* result = Malloc(1024);
  Sem_init(&mutex, 0, 1);
  struct thread_arg thread_arg = {&mutex, s, size, stream, result};

  Pthread_create(&tid, NULL, thread, &thread_arg);
  Alarm(5);

  return fgets(s, size, stream);
}