// Build with: gcc -m32 -no-pie -g -o plt plt.c
#include <stdio.h>

int main() {
	int *null_ptr = NULL;
	void *void_ptr;
	printf("%p %p",null_ptr,void_ptr);
}
