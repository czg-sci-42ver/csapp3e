#include <stdio.h>
#include <stdlib.h>
#define N 16
typedef int fix_matrix[N][N];
int fix_set_diag_opt(fix_matrix A, int val){
    int index=0;
    int *Aptr = &A[0][0];
    do {
        *(Aptr+index)=val;
        index+=17; // wrong
    }while (index<1088/4);
    return index;
}

int main(int argc, char *argv[]){
    
}
