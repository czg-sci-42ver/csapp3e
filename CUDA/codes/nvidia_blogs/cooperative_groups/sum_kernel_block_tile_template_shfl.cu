// https://developer.nvidia.com/blog/cooperative-groups/

/*
other references:
ref_1: https://developer.nvidia.com/blog/even-easier-introduction-cuda/
*/
#include <algorithm>
#include <cooperative_groups.h>
#include <stdio.h>
using namespace cooperative_groups;

template <int tile_sz>
__device__ int reduce_sum_tile_shfl(thread_block_tile<tile_sz> g, int val)
{
    // Each iteration halves the number of active threads
    // Each thread adds its partial sum[i] to sum[lane+i]
    for (int i = g.size() / 2; i > 0; i /= 2) {
        val += g.shfl_down(val, i);
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

template<int tile_sz>
__global__ void sum_kernel_tile_shfl(int *sum, int *input, int n)
{
    int my_sum = thread_sum(input, n);

    auto tile = tiled_partition<tile_sz>(this_thread_block());
    int tile_sum = reduce_sum_tile_shfl<tile_sz>(tile, my_sum);

    if (tile.thread_rank() == 0) atomicAdd(sum, tile_sum);
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

  sum_kernel_tile_shfl<32><<<nBlocks, blockSize, sharedBytes>>>(sum, data, n);
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
