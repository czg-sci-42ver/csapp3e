/* gcc 10_1.c -o 10_1.o -I../include/ ../src/csapp.c */
#include "csapp.h"

int main()
{
	int fd1, fd2;


	fd1 = Open("foo.txt", O_WRONLY, 0);
	Close(fd1);
	fd2 = Open("baz.txt", O_RDONLY, 0);
	printf("fd2 = %d\n", fd2);
	exit(0);
}
