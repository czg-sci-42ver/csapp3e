#define EXPR_INNER 1.3333f
#define EXPR_OUTER 2.3333f
#define llong long long int
#define N_PREHEAT 10
#define N_UNROLL 20

__global__ void single_loop(int* limits, float* out,
		llong* timer) {


	int tid = blockDim.x * blockIdx.x + threadIdx.x;

	int M = limits[threadIdx.x];

	float sum = out[tid];


#pragma unroll

	for (int k = 0; k < N_PREHEAT; k++)

		for (int i = 0; i < M; i++) {

			sum += EXPR_INNER;

		}


	__syncthreads();

	llong start = clock64();


#pragma unroll

	for (int k = 0; k < N_UNROLL; ++k)

		for (int i = 0; i < M; i++) {

			sum += EXPR_INNER;

		}


	llong stop = clock64();

	__syncthreads();


	out[tid] = sum;

	timer[2 * tid] = start;

	timer[2 * tid + 1] = stop;

}
int main(){
	return 0;
}
