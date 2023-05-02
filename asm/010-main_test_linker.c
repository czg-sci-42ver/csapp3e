/* $begin 010-multmain-c */
#include <stdio.h>

int test_g;
static int test_s;
void multstore(long, long, long *);

int main() {
    long d;
	float test;
	test_g=2;
	test_s=4;
	test=2.468;
    printf("2 * 3 --> %ld\ntest: %f\n", d,test);
    multstore(2, 3, &d);
    printf("2 * 3 --> %ld\n", d);
    printf("2 * 3 --> %ld\n", d);
    return 0;
}

long mult2(long a, long b) {
    long s = a * b;
    return s;
 }

int f()
{
static int x = 0; 
return x;
}

int g()
{
static int x = 1; 
return x;
}

/* $end 010-multmain-c */

