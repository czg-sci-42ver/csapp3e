// https://developer.nvidia.com/blog/cooperative-groups/

/*
other references:
ref_1: https://developer.nvidia.com/blog/even-easier-introduction-cuda/
*/
#include <algorithm>
#include <cooperative_groups.h>
#include <stdio.h>
using namespace cooperative_groups;
__device__ int reduce_sum(thread_group g, int *temp, int val) {
  int lane = g.thread_rank();

  // Each iteration halves the number of active threads
  // Each thread adds its partial sum[i] to sum[lane+i]
  for (int i = g.size() / 2; i > 0; i /= 2) {
    temp[lane] = val;
    g.sync(); // wait for all threads to store
    if (lane < i)
      val += temp[lane + i];
    g.sync(); // wait for all threads to load
  }
  return val; // note: only thread 0 will return full sum
}
__device__ int thread_sum(int *input, int n) {
  int sum = 0;
// printf("%d; %d\n",blockIdx.x * blockDim.x + threadIdx.x,blockDim.x *
// gridDim.x);
#if __CUDA_ARCH__ >= 200
// std::cout << blockIdx.x * blockDim.x + threadIdx.x << "; " << blockDim.x *
// gridDim.x << std::endl; printf("%d; %d\n",blockIdx.x * blockDim.x +
// threadIdx.x,blockDim.x * gridDim.x);
#endif

  /*
  `i += blockDim.x * gridDim.x` -> grid-stride loop in ref_1

  2. here maybe manually selected to make the whole sum in sum_kernel_block is n
  only calculate n/4 sums.
  */
  for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n / 4;
       i += blockDim.x * gridDim.x) // only calculate once
  {
    // if (i>=n/4)
    // 	printf("calculate more");
    int4 in = ((int4 *)input)[i];
    sum += in.x + in.y + in.z + in.w;
  }
  return sum;
}

__global__ void sum_kernel_block(int *sum, int *input, int n) {
  int my_sum = thread_sum(input, n);
  // printf("my_sum: %d\n",my_sum);

  extern __shared__ int temp[];
  auto g = this_thread_block();
  int block_sum = reduce_sum(g, temp, my_sum);

  // only add once the current thread block sum
  if (g.thread_rank() == 0)
    atomicAdd(sum, block_sum);

  thread_group tile32 = tiled_partition(this_thread_block(), 32);
  /*
  1. here thread_group only corresponds to the thread related one by "the threads of rank 0 in each tile4 group"
  in https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html?highlight=cg#tiled-partition
  */
  thread_group tile4 = tiled_partition(tile32, 4);
  if (tile4.thread_rank() == 0)
    printf("Hello from tile4 rank 0: %d\n", this_thread_block().thread_rank());
}

int main() {
  // int n = 1<<24;
  int n = 256 * (1 << 3);
  int blockSize = 256;
  int nBlocks = (n + blockSize - 1) / blockSize;
  int sharedBytes = blockSize * sizeof(int);

  int *sum, *data;
  cudaMallocManaged(&sum, sizeof(int));
  cudaMallocManaged(&data, n * sizeof(int));
  std::fill_n(data, n, 1); // initialize data
  cudaMemset(sum, 0, sizeof(int));

  sum_kernel_block<<<nBlocks, blockSize, sharedBytes>>>(sum, data, n);
  /*
  see ../C_Programming_Guide/Broadcast

  Also see
  https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#concurrent-execution-between-host-and-device
  return control to the host thread before the device completes the requested
  task

  also see ref_1
  */
  cudaDeviceSynchronize();
  printf("equal: %d, sum= %d\n", *sum == n, *sum);
  // ref_1
  cudaFree(sum);
  cudaFree(data);
  return 0;
}
