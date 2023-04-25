#include <stdio.h>
#include <stdlib.h>

struct ACE {
short v;
struct ACE *p;
};

short test(struct ACE *ptr){
    int res=1;
    if (ptr!=0) {
        res*= ptr->v;
        ptr=ptr->p;
    }
    return res;
}

int main(int argc, char *argv[]) {
  
}
