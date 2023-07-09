/* jumptables.c -- program shows how jumptable is used to perform basic
 * calculator functions
 */
#include <stdio.h>
 
#define ADD 0
#define SUB 1
#define MUL 2
#define DIV 3
 
int add(int, int);
int sub(int, int);
int mul(int, int);
int divide(int, int);
 
int result;
/*jumptable declared and initialized */
int (*diff_oper[])(int, int) = {add, sub, mul, divide};

int main(void)
{
    int op1, op2;

    char operator;
 
    int state = 1;
    func0label: state = diff_oper[(ADD)](1, 2);
    printf("ADD of %d and %d is: %d\n", 1, 2, state);
 
    func1label: state = diff_oper[(SUB)](1, -1);
    printf("SUB of %d and %d is: %d\n", 1, -1, state);
    
    func2label: state = diff_oper[(MUL)](1, 1);
    printf("MUL of %d and %d is: %d\n", 1, 1, state);
    switch(state)
    {
        case 0:
            goto func0label;
        case 1:
            goto func1label;
        case 2:
            goto func2label;
    }
    puts("**Calculator Application**");
 
    state = diff_oper[(DIV)](1, 20);
    printf("DIV of %d and %d is: %d\n", 1, 20, state);
 
    return 0;
 
}

void func(){
}
 
int add(int a, int b)
{
    return a  + b;
}
 
int sub(int a, int b)
{
    return a - b;
}
 
int mul(int a, int b)
{
    return a * b;
}
 
int divide(int a, int b)
{
    return a / b;
}
