#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
typedef struct { int a; int b; } myarg_t;
typedef struct { int x; int y; } myret_t;
// void *mythread(void *arg) {
// 	myret_t *rvals = Malloc(sizeof(myret_t));
// 	rvals->x = 1;
// 	rvals->y = 2;
// 	return (void *) rvals;
// }
void *mythread(void *arg) {
	myarg_t *args = (myarg_t *) arg;
	printf("%d %d\n", args->a, args->b);
	myret_t oops; // ALLOCATED ON STACK: BAD!
	oops.x = 1;
	oops.y = 2;
	return (void *) &oops;
}
int main(int argc, char *argv[]) {
	pthread_t p;
	myret_t *rvals;
	myarg_t args = { 10, 20 };
	pthread_create(&p, NULL, mythread, &args);
	pthread_join(p, (void **) &rvals);
	printf("returned %d %d\n", rvals->x, rvals->y);
	free(rvals);
	return 0;
}
