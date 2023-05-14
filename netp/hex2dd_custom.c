#include <netinet/in.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char **argv){
    if (argc !=2) {
        fprintf(stderr, "need hex param\n");
        exit(0);
    }
    uint32_t num_l=strtol (argv[1], (char **) NULL, 0x10);
    uint32_t num;
    sscanf(argv[1], "%x", &num);
    printf("%x %x %s\n",num_l,num,argv[1]);
    uint32_t net_addr=htonl(num);
    printf("%32x\n",net_addr);
    exit(0);
}