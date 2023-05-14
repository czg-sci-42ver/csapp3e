#include <stdio.h>

#define fastdword(a)   (uint) __builtin_bswap32( (uint)a)

typedef unsigned int uint;
int main(){
    uint* test;

    printf("%d",fastdword(0xff));
}