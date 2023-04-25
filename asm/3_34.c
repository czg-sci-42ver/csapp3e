#include <stdio.h>
#include <stdlib.h>

int test_mul_args(int arg1,int arg2,int arg3,int arg4,int arg5,int arg6,int arg7,int arg8,int arg9){
    return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
}

int main(int argc, char *argv[]){
    int test[9];
    char a = EOF;
    for (int i=0; i<9; i++) {
        test[i]=i;
    }
    printf("%d",test_mul_args(test[0],test[1],test[2],test[3],test[4],test[5],test[6],test[7],test[8]));
}
