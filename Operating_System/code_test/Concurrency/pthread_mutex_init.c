#include <stdio.h>
#include <pthread.h>
static pthread_once_t foo_once = PTHREAD_ONCE_INIT;
static pthread_mutex_t foo_mutex;

void foo_init()
{
	pthread_mutex_init(&foo_mutex, NULL);
}

void foo()
{
	pthread_once(&foo_once, foo_init);
	pthread_mutex_lock(&foo_mutex);
	/* Do work. */
	printf("test");
	pthread_mutex_unlock(&foo_mutex);
}
int main(){
	foo();
	return 0;
}
