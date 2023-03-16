#include <stdio.h>
unsigned replace_byte (unsigned x, int i, unsigned char b);
int main(){

}
unsigned replace_byte(unsigned x, int i, unsigned char b){
    return x & (unsigned)b<<(i*8);
}