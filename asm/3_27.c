#include <stdio.h>
#include <stdlib.h>
/*here assume 1,1,2...*/
unsigned long fibonacci(unsigned int n){
    unsigned long result=1;
    unsigned long first=result,second=result;
    if(n<=2)
        goto done;
    /* this is jm for factorial...
    loop:
        result*=n;
        n--;
    done:
        if (n!=1)
            goto loop;
        return result;
    */
    loop:
        result=first+second;
        first=second;
        second=result;
        n--;
        if(n<=2)
            goto done;
        goto loop;
    done:
        return result;
}
int main(int argc, char *argv[]){
    if (argc==2) {
        printf("%ld\n",fibonacci(strtoul(argv[1], NULL, 10)));
    }
}