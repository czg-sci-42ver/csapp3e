/*
   a star, and may wrap over lines */
// two slashes work too (and may be preferred)
#include <math.h>
#include <stdio.h>
// main returns an integer
int main(int argc, char *argv[]) {
	/* printf is our output function;
	   by default, writes to standard out */
	/* printf returns an integer, but we ignore that */
	// printf("hello, world\nargv[1]:%s\nargv[2]:%s\nargcv[1] 1st char:%c",argv[1],argv[2],*(argv[1]));
	printf("hello, world\nargv[1]:%s\nargv[2]:%s\n",argv[1],argv[2]);
	printf("%f\n",sin(1));
	/* return 0 to indicate all went well */
	return(0);
}
