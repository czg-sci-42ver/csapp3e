#include <stdio.h>

int main()
{
	_Decimal32 a;
	unsigned int i;

	//a = 0.2; 
	//a += 0.1; 
	//a -= 0.3;

	//for (i = 0; a < 1.0; i++) 
	//	a += a;

	//printf("i=%d, a=%Lf %a\n", i, a,a);

	//fflush(stdout);

	a = 0.2df; 
	a += 0.1df; 
	a -= 0.3df;

	for (i = 0; a < 1.0df; i++) 
		a += a;

	printf("i=%d, a=%Lf\n", i, a);

	return 0;
}
