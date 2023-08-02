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
__global__ void filter_k(int *dst,int *nres, const int *src, int n) {
  int i = threadIdx.x + blockIdx.x * blockDim.x;
  extern __shared__ int temp[];
  if(i >= n)
    return;
  if(src[i] > 0){
    temp[i] = atomicAggInc(nres);
    dst[temp[i]] = src[i];
    printf("%dth thread nres: %d\n",i,temp[i]);
  }
}
int main() {
  int warp_size = 32;
  int n = warp_size << 3;
  int block_size = 32;
  int grid_size = (n + block_size -1)/block_size;
  int *dst,*nres;
  int *src;
  int sharedBytes = block_size * sizeof(int);

  cudaMallocManaged(&dst,block_size*sizeof(int));
  cudaMallocManaged(&nres,sizeof(int));
  cudaMallocManaged(&src,n*sizeof(int));

  cudaMemset(nres, 0, sizeof(int));
  cudaMemset(src, 1, n*sizeof(int));
  cudaMemset(dst, 0, block_size*sizeof(int));
  filter_k<<<grid_size,block_size,sharedBytes>>>(dst,nres,src,n);
  cudaDeviceSynchronize();
}
