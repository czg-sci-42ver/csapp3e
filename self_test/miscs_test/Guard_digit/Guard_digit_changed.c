#include <stdio.h>

int main()
{
    long double a;
    unsigned int i;

    a = 0.2; 
    a += 0.1; 
    a -= 0.3;

    for (i = 0; a < 1.0; i++) 
        a += a;

    printf("i=%d, a=%Lf\n", i, a);

    fflush(stdout);

    a = 0.2L; 
    a += 0.1L; 
    a -= 0.3L;

    for (i = 0; a < 1.0; i++) 
        a += a;

    printf("i=%d, a=%Lf\n", i, a);

    return 0;
}
