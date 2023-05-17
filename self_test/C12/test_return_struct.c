struct object_t
{
  long long m1;
  long long m2;
  long long m3;
};

struct object_t
test1(void)
{
  struct object_t o = {1LL<<40, 2LL<<40, 3LL<<40};
  return o;
}

long long
test2(void)
{
  return 0LL;
}

long double
test3(void)
{
  long double a=3.14L;
  long double b=6.14L;
  return 0.0L;
}

#include <stdio.h>
int main(){
	long double a=test3();
	long long b=test2();
	struct object_t c=test1();
	printf("%lld\n",c.m1);
}
