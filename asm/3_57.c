#include <stdio.h>
#include <stdlib.h>

double funct3(int *ap, double b, long c, float *dp);
double funct3(int *ap, double b, long c, float *dp){
	float d=(float)*dp;
	double a=(double)*ap;
	if (b>a) {
		d*=(float)c;
		b=(double)d;
	}else {
		d+=d;
		b=(float)c;
		b+=d;
	}
	return (double)b;
}

int main(int argc, char *argv[]) {
}
