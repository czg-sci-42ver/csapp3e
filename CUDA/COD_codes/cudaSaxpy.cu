// https://student.cs.uwaterloo.ca/~cs450/w18/public/cudaSaxpy.pdf
/*
TODO more general https://developer.nvidia.com/blog/six-ways-saxpy/
*/

#include <stdio.h>
// #include <math.h>
// #include <stdlib.h>
/*
differences __device__,etc. https://stackoverflow.com/a/39448797/21294350
*/
__global__
void saxpy(int n, float a, float *x, float *y)
{
	// http://users.wfu.edu/choss/CUDA/docs/Lecture%205.pdf p8 blockDim here is 256
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	if (i < n) y[i] = a*x[i] + y[i];
}
__host__ int main(void)
{
	// not too large

	// long long int N = 2147483647l+1;
	// long long int N = 2147483647l/(1<<3);
	// long long int N = 2147483647-255; // out of memory

	/*
	1. some value may be placed on cache and registers because this exceeds 
	"Total amount of global memory:                 3725 MBytes (3906076672 bytes)". in 
	`/opt/cuda/extras/demo_suite/deviceQuery` from https://linuxconfig.org/how-to-get-cuda-cores-count-on-linux
	2. check by `/opt/cuda/extras/compute-sanitizer/compute-sanitizer --tool memcheck cudaSaxpy.o`
	not use old CUDA-MEMCHECK https://stackoverflow.com/a/75973968/21294350
	*/
	// long long int N = 488259584l/2+1;
	long long int N = 488259584l/4;
	// long long int N = 488259584l;
	printf("%lld\n%d\n",N,2147483647/(1<<3));
	// long long int N = 256*256;
	float *x, *y, *d_x, *d_y;
	x = (float*)malloc(N*sizeof(float));
	y = (float*)malloc(N*sizeof(float));
	cudaMalloc(&d_x, N*sizeof(float));
	cudaMalloc(&d_y, N*sizeof(float));
	for (int i = 0; i < N; i++) {
		x[i] = 1.0f;
		y[i] = 2.0f;
	}
	cudaMemcpy(d_x, x, N*sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_y, y, N*sizeof(float), cudaMemcpyHostToDevice);
	// Perform SAXPY on 1M elements
	saxpy<<<(N+255)/256, 256>>>(N, 2.0f, d_x, d_y);
	cudaMemcpy(y, d_y, N*sizeof(float), cudaMemcpyDeviceToHost);
	float maxError = 0.0f;
	for (int i = 0; i < N; i++){
		/*
		1. here can't recognize `max` in stdlib in clang https://stackoverflow.com/a/4234022/21294350
		2. directly inline max defined in https://docs.nvidia.com/cuda/cuda-math-api/group__CUDA__MATH__INT.html
		3. similar to what this https://stackoverflow.com/a/54144675/21294350 says, 
		Candidate function not viable: call to __device__ function from __host__ function
		*/
		maxError = fmaxf(maxError, abs(y[i]-4.0f));
		// maxError = max(maxError, abs(y[i]-4.0f));
	}
	printf("Max error: %f\n", maxError);
	cudaFree(d_x);
	cudaFree(d_y);
	free(x);
	free(y);
}
