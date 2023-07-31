#include <math.h>
#include <stdio.h>
#include <stdlib.h>
void saxpy_serial(int n, float alpha, float *x, float *y)
{
for(int i = 0; i<n; ++i)
y[i] = alpha*x[i] + y[i];
}
// Invoke serial SAXPY kernel

int main(void)
{
	long long int N = 1ll<<63;
	float *x, *y, *d_x, *d_y;
	x = (float*)malloc(N*sizeof(float));
	y = (float*)malloc(N*sizeof(float));
	for (int i = 0; i < N; i++) {
		x[i] = 1.0f;
		y[i] = 2.0f;
	}
	// Perform SAXPY on 1M elements
	saxpy_serial(N, 2.0, x, y);
	float maxError = 0.0f;
	float diff = 0;
	for (int i = 0; i < N; i++){
		diff = fabsf(y[i]-4.0f);
		maxError = maxError>diff?maxError:diff;
	}
	printf("Max error: %f\n", maxError);
	free(x);
	free(y);
}
