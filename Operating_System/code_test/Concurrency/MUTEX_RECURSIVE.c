/*
 * https://en.wikipedia.org/wiki/Reentrant_mutex#Motivation
 * https://stackoverflow.com/q/50138578/21294350
 */
#include <pthread.h>
#include <stdio.h>
pthread_mutex_t m;
pthread_mutexattr_t ma;

// void* exec_th(void* arg) {
//     printf("THREAD %p before LOCK\n", pthread_self());
// 
//     //second mutex lock
//     pthread_mutex_lock(&m);
//     printf("THREAD %p after LOCK\n", pthread_self());
// 
//     pthread_mutex_unlock(&m);
//     printf("THREAD %p after UNLOCK\n", pthread_self());
// 
//     return (void*)0;
// }
int result=-1;
int mul_acq_mutex(int num){
	pthread_mutex_lock(&m);
    /*
    1. Here not take negative number in account.
    And obviously the simples recursion overhead may excess the computation cost.
    2. here `result` may be redundant.
    It is just for representation of `PTHREAD_MUTEX_RECURSIVE` with the global variable `result`.
    */
	if (num>1)
	{
        result = num*mul_acq_mutex(num-1);
		pthread_mutex_unlock(&m);
		return result;
	}
    result=1;
	pthread_mutex_unlock(&m);
	return result;
}

int main() {
    pthread_mutexattr_init(&ma);
    #ifdef MUTEX_DEFAULT
    pthread_mutexattr_settype(&ma, PTHREAD_MUTEX_DEFAULT);
    #else
    pthread_mutexattr_settype(&ma, PTHREAD_MUTEX_RECURSIVE);
    #endif
    pthread_mutex_init(&m, &ma);

    // first mutex lock
    pthread_mutex_lock(&m);

    // create a thread that will call the same mutex
    // pthread_t t;
    // pthread_create(&t, NULL, exec_th, NULL);
	int result = mul_acq_mutex(10);
	printf("%d\n",result);

    // sleep(1); //just to see the console

    pthread_mutex_unlock(&m);
}
