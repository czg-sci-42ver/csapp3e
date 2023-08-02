// https://stackoverflow.com/q/76497234/21294350
#include <cuda.h>
#include <cstdio>
#include <cuda/semaphore>
#include <cuda/atomic>

__device__ uint32_t something_very_slow(uint32_t x) {
  for (uint32_t i = 0; i / 1e7 < 1; ++i) {
    x *= 13;
    x += 1;
    x %= 123456789;
  }
  return x;
}

__device__ cuda::binary_semaphore<cuda::thread_scope_block> lock{1};
__device__ cuda::atomic<uint32_t, cuda::thread_scope_block> mask{0};
__device__ cuda::atomic<uint32_t, cuda::thread_scope_block> clobber{0};

__global__ void starvation_libcudacxx() {
  lock.acquire();
  printf("start thread %d\n", threadIdx.x);
  bool cont = false;
  printf("step thread %d\n", threadIdx.x);
  lock.release();
  printf("release lock\n");
  clobber.fetch_add(something_very_slow(clobber.load()) + threadIdx.x,cuda::memory_order_seq_cst);
  cont = mask.fetch_add(threadIdx.x) == 0;
  printf("done: %d\n", clobber.load());
}

__global__ void starvation_legacy() {
  __shared__ uint32_t lock, mask, clobber;
  if (threadIdx.x == 0) {
    lock = mask = clobber = 0;
  }
  __syncthreads();
  while (atomicCAS(&lock, 0, 1) == 1) {
  }
  printf("starvation_legacy start thread %d\n", threadIdx.x);
  bool cont = false;
  do {
    printf("starvation_legacy step thread %d\n", threadIdx.x);
    atomicExch(&lock, 0);
    atomicAdd(&clobber, something_very_slow(atomicAdd(&clobber, 0)) + threadIdx.x);
    cont = atomicAdd(&mask, threadIdx.x) == 0;
    while (atomicCAS(&lock, 0, 1) == 1) {
    }
  } while (cont);
  printf("done: %d\n", atomicAdd(&clobber, 0));
  atomicExch(&lock, 0);
}

int main() {
  while (1) {
    starvation_libcudacxx<<<1, 2>>>();
  }
}
