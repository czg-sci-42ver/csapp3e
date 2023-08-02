#include <cooperative_groups.h>
#include <stdio.h>
using namespace cooperative_groups;
__device__ int atomicAggInc(int *ctr) {
  auto g = coalesced_threads();
  int warp_res;
  if(g.thread_rank() == 0){
    printf("old: %d\n",*ctr);
    warp_res = atomicAdd(ctr, g.size());
    printf("assign: %d %d\n",warp_res,*ctr);
  }
  return g.shfl(warp_res, 0) + g.thread_rank();
}

#define NPER_THREAD 4
#define BS 8
__global__ 
void filter_shared_k(int *dst, int *nres, const int* src, int n) {
  __shared__ int l_n;
  /*
  TODO what does NPER_THREAD * BS do?
  */
  int i = blockIdx.x * (NPER_THREAD * BS) + threadIdx.x;

  for (int iter = 0; iter < NPER_THREAD; iter++) {
    // zero the counter
    if (threadIdx.x == 0)
      l_n = 0;
    __syncthreads();

    // get the value, evaluate the predicate, and
    // increment the counter if needed
    int d, pos;

    if(i < n) {
      d = src[i];
      if(d > 0)
        pos = atomicAdd(&l_n, 1);
    }
    __syncthreads();

    // leader increments the global counter
    if(threadIdx.x == 0)
      l_n = atomicAdd(nres, l_n);
    __syncthreads();

    // threads with true predicates write their elements
    if(i < n && d > 0) {
      pos += l_n; // increment local pos by global counter
      dst[pos] = d;
    }
    __syncthreads();

    i += BS;
  }
}
int main() {
  // int warp_size = 32;
  int grid_size = 8;
  int block_size = NPER_THREAD * BS;
  int n = grid_size*block_size;
  int *dst,*nres;
  int *src;
  int sharedBytes = block_size * sizeof(int);

  cudaMallocManaged(&dst,block_size*sizeof(int));
  cudaMallocManaged(&nres,sizeof(int));
  cudaMallocManaged(&src,n*sizeof(int));

  cudaMemset(nres, 0, sizeof(int));
  cudaMemset(src, 1, n*sizeof(int));
  cudaMemset(dst, 0, block_size*sizeof(int));
  filter_shared_k<<<grid_size,block_size,sharedBytes>>>(dst,nres,src,n);
  cudaDeviceSynchronize();
}
