/*
from https://nixhacker.com/getting-processor-info-using-cpuid/
*/
#include<stdio.h>
#define RESERVED_BITS (31-28+1)
// https://stackoverflow.com/questions/111928/is-there-a-printf-converter-to-print-in-binary-format print bin in C
static int binaryNum[32];
void decToBinary(int n)
{
    // counter for binary array
    int i = 0;
    while (n > 0) {

        // storing remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
}
int outputEax(){
    printf("-------Signature(EAX register):-------");
    // printf("\nStepping ID:%d%d%d%d",binaryNum[3],binaryNum[2],binaryNum[1],binaryNum[0]);
    // printf("\nModel:%d%d%d%d",binaryNum[7],binaryNum[6],binaryNum[5],binaryNum[4]);
    // printf("\nFamily ID:%d%d%d%d",binaryNum[11],binaryNum[10],binaryNum[9],binaryNum[8]);
    // printf("\nProcessor Type:%d%d",binaryNum[13],binaryNum[12]);
    // printf("\nExtended Model ID:%d%d%d%d",binaryNum[19],binaryNum[18],binaryNum[17],binaryNum[16]);
    // printf("\nExtended Family ID:%d%d%d%d%d%d%d%d",binaryNum[27],binaryNum[26],binaryNum[25],binaryNum[24],binaryNum[23],binaryNum[22],binaryNum[21],binaryNum[20]);
    // printf("\nfamily:%d%d%d%d%d%d%d",);
    printf("\n");
    return 0;
}
int outputEax_shift(unsigned int* ptr){
    // see https://www.amd.com/system/files/TechDocs/56323-PUB_1.01.pdf and https://en.wikichip.org/wiki/amd/cpuid
    // so 4800h is https://en.wikichip.org/wiki/Family_23_Model_96 and https://en.wikichip.org/wiki/amd/cores/renoir
    /*
    $ gcc cpuid.c -o cpuid;./cpuid
    extended family: 008
    family: 00f
    extended model: 006
    model: 000
    
    model is 60h
    */
    printf("extended family: %02x\n",((*ptr)<<RESERVED_BITS)>>(32-8));
    printf("family: %03x\n",((*ptr)<<(31-11))>>(32-4));
    printf("extended model: %03x\n",((*ptr)<<(31-19))>>(32-4));
    printf("model: %03x\n",((*ptr)<<(31-7))>>(32-4));
    printf("rax: %08x\n",((*ptr)));
    return 0;
}
int main(){
    // use logical shift https://stackoverflow.com/questions/7622/are-the-shift-operators-arithmetic-or-logical-in-c
	unsigned int a[3];
	//__asm__("mov $0x0, %eax\n\t");
	__asm__("mov $0x1, %eax\n\t");
	__asm__("cpuid\n\t");
    // https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html#index-r-in-constraint here allow save to register if a in register (normally not except that maybe O3 optimize this small array).
	__asm__("mov %%eax, %0\n\t":"=r" (a[0]));
    decToBinary(a[0]);
	//__asm__("mov %%ebx, %0\n\t":"=r" (a[0]));
	//__asm__("mov %%edx, %0\n\t":"=r" (a[1]));
	//__asm__("mov %%ecx, %0\n\t":"=r" (a[2]));
	// printf ("%s\n", &a);
    // outputEax();
    outputEax_shift(&a[0]);
}
