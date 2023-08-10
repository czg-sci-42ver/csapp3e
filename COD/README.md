# appendix
## B
### CUDA
- Texture Operations
  - [See](https://en.wikipedia.org/wiki/Texture_mapping#Texture_filtering)
    > trilinear *interpolation between mipmaps* are two commonly used alternatives which reduce *aliasing or jaggies*.
    "trilinear interpolation fraction." may make the mipmap more suitable for current size without [jaggies](https://en.wikipedia.org/wiki/Jaggies).
- > The floating-point addition and multiplication arithmetic hardware is fully *pipelined*, and latency is optimized to balance delay and area.
  - [fully pipelined](https://en.wikipedia.org/wiki/Instruction_pipelining#Number_of_steps) meaning 
  - "area" is because multi level adders (See [pineiro2005] diagram and [COD_RISCV_2nd_A_appendix] different carry adders with mutli-bits parallel).
- TODO "conversions between different floating-point and integer formats" circuit.
- FIGURE B.6.2
  codes [related](https://www.kdab.com/fma-woes/)
  Notice the **color** which relates related operations.
  - TODO Multiplier Array
  - Inversion
    - because use IEEE binary64 format, the sign bit is separate from the significand
      So it needs inversion. See [2012_03_bfpfma] 3.3.2
    - It is the opposite operation of the Complementer.
      > The result is *conditionally recomplemented*, so as to return a result in *sign-magnitude* form
  - Alignment shifter does right shift of `A`
    Notice it is different from [HAN_DISSERTATION]
    see [2012_03_bfpfma] Figure 3-6
    - (a)
      here takes the *rounding* into account implicitly
      See p35 BxC affects only the calculation of the sticky bit.
      So when exponent differences bigger than 56 which is *beyond the binary64 Significand range* with the implicit bit (the 1 before the binary dot) plus the guard, round and sticky bit, the smaller bits beyond 56 are all dropped.

      here $52+4+52*2+1=161$ where 52 are Significand size, 4 is the multipler's [whole number](https://www.onlinemathlearning.com/mixed-numbers-explain.html), the guard and round bits.
    - (b)
      here to keep the multipler result *not rounded* before adding. So keep their 106 bits.
      From "Figure 3-8", when $d<105$, the `A` will not be added at all. Obviously, here the 55 MSB is nothing.
      - TODO [this](https://electronics.stackexchange.com/q/676878/341985) conflicts with [floatingpoint_fused_multiplyadd]
        > The 55 most-significant bits of the aligned A are *concatenated* at the output of the CSA to obtain the 161-bit sum.
        View the codes.
    - "Normalizer" does the opposite (left shift) to make the *implicit one* shows in the result.
      - TODO "Figure 3-1" how LZA functions. See [hokenek1990_LZA] (what does LZA calculate).
        > Many methods have been proposed in [3] so far to handle the *one-bit error of the LZA* logic.
        - From the "Figure 3-9", it is obvious "LZD" just outputs the leading one location where 0 means the first MSB.
          And the `P` is concatenated by two binary to output from 0~3 which is also obvious.
        - here "Sticky" is not complemented because its function is to track the ones shifted off.
          See [sticky_bit]
  - Rounder removes the precision kept in "Carry Propagate Adder". It is same as [COD_RISCV_2nd_A_appendix] FIGURE 3.15 and p218 "Step 4".
  - [Multiplier Array](https://www.geeksforgeeks.org/array-multiplier-in-digital-logic/) will probably be replaced by the improved "CSA Tree" shown in [2012_03_bfpfma] (i.e. "Wallace reduction tree." in [Radix_8_Multiplier]).
  - From "Figure 1.2.1" by [Charles_FMA] and [COD_RISCV_2nd_A_appendix] "FIGURE 3.14", "Post-Normalize" is needed.
#### SD (this continues from [this](../asm/README.md) "SD (signed digit)")
- from the Abstract
    > Moreover, the use of an enhanced minimax approximation which, through an *iterative* process, takes into account the effect of *rounding* the polynomial coefficients to a finite size allows for a further reduction in the *size of the look-up tables* to be used, making our method very suitable for the implementation of an *elementary* function generator in state-of-the-art DSPs or graphics processing units

    "enhanced" -> iterative to choose the best rounding for all $C_{0,1,2}$
    - > Our focus is the approximation of reciprocal, square root, square root reciprocal, exponentials, logarithms, trigonometric functions, powering (with a fixed exponent p), *or special functions*
- [pineiro2005]
  - from [this](https://stackoverflow.com/a/72420441/21294350)
    "The perspective divide" of "homogeneous coordinate w" is not one must although "But the division always happens.".
    > The *precision* of this reciprocal operation must be as close as possible to the *working precision* of the attributes being interpolated to guarantee correct results.
- fused multiply add in [IEEE_754]
  - p33 ["preferred exponent"](https://mathworld.wolfram.com/Floating-PointPreferredExponent.html) to keep the [ulp](https://mathworld.wolfram.com/Floating-PointQuantum.html).
  - TODO 
    - ["dot products"](https://www-pequan.lip6.fr/~graillat/papers/posterRNC7.pdf) with FMA and the condition number.
    - ["exactly rounded division"](https://stackoverflow.com/a/65445072/21294350) by FMA
### B.7
- [Tesla_ARCHITECTURE]
  - viewport/clip/setup/raster/zcull
    - [viewport transformation](https://www.geeksforgeeks.org/window-to-viewport-transformation-in-computer-graphics-with-implementation/) is just scale and coordinate transformation.
      - standard [view frustum](https://en.wikipedia.org/wiki/Viewing_frustum#:~:text=The%20view%20frustum%20is%20typically,typically%20used%20in%20computer%20graphics.)
      - [clip planes](https://reference.wolfram.com/language/ref/ClipPlanes.html) 3rd example.
        Also [codes](https://prideout.net/clip-planes)
    - setup
      - [edge equation](http://groups.csail.mit.edu/graphics/classes/6.837/F98/Lecture7/triangles.html)
    - [zcull](https://en.wikipedia.org/wiki/Z-buffering)
      > In the end, the z-buffer will allow correct reproduction of the usual depth perception: a close object *hides* one further away. This is called z-culling.
- pixel [vs](https://stackoverflow.com/a/45373885/21294350) fragment
- Supersampling and Multisampling
  See [this](https://mynameismjp.wordpress.com/2012/10/24/msaa-overview/) from [this](https://hero.handmade.network/forums/code-discussion/t/973-difference_between_supersampling_and_multisampling#5500)
  - Oversampling
    > Oversampling is the process of sampling a signal at some rate that’s *higher* than our intended final output, and then *reconstructing* and resampling the signal again at the output sample rate.
  - [MSAA](https://en.wikipedia.org/wiki/Multisample_anti-aliasing)
    > we can observe that aliasing of triangle visibility function (AKA geometric aliasing) only occurs at the *edges* of rasterized triangles.
    > Where MSAA begins to differ from supersampling is when the pixel shader is executed. In the standard MSAA case, the pixel shader is *not executed for each* subsample.
  - [Also](https://forum.beyond3d.com/threads/dumb-question-msaa-vs-ssaa-what-is-the-big-differences.18849/#post-451925)
- GDDR3 [vs](https://superuser.com/a/860811/1658455) DDR3
  > Graphics cards *move a lot of data around* and its needs aren’t the same as that of the processor. Because of this, graphics cards need memory that is much *faster* than what the processor actually needs. GDDR3 fulfills this need but at a much higher cost.
- SGEMM is included in [BLAS3](https://www.netlib.org/blas/#_level_3)
- FIGURE B.7.3,4 -> ["Figure 6"](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2008/EECS-2008-49.pdf)
- in-place FFT: [codes](https://developer.apple.com/documentation/accelerate/fast_fourier_transforms/in-place_functions_for_1d_real_fft), [description](https://dspguru.com/dsp/faqs/fft/)
- [FSB](https://www.cpu-upgrade.com/mb-MSI/G31M3-F_(FSB_1600).html)
### B.8
- TODO [conjugate gradient](https://en.wikipedia.org/wiki/Conjugate_gradient_method#Derivation_as_a_direct_method)
- ["unstructured sparsity (aka random sparsity) patterns"](https://towardsdatascience.com/speeding-up-deep-learning-inference-via-unstructured-sparsity-c87e3137cebc)
- "matrix reordering" by [decomposition](https://www.mathworks.com/help/matlab/math/sparse-matrix-reordering.html)
  similar to [register blocking](https://bebop.cs.berkeley.edu/pubs/nishtala2007-cb-spmv.pdf)
  >  Cache blocking differs from register blocking in that cache blocking reorders memory accesses to increase temporal locality, whereas register blocking *compresses the data structure* to reduce memory traffic
- Figure B.8.5
  - `cache[threadIdx.x] = x[row];` where `row = block_begin + threadIdx.x;`
    needs `blocksize>x_size` to make `if( j>=block_begin && j<block_end )` more frequently occuring, then sharing.
  - > when the matrix has been reordered, the rows using x[i] will be rows *near row i*.
    [(reverse Cuthill-McKee Reordering)](https://www.mathworks.com/help/matlab/math/sparse-matrix-reordering.html#sparsity-5)
  - "representative matrices derived from 3D surface meshes"
    maybe just [coordinates](https://stackoverflow.com/a/19430532/21294350) by using the matrix.
- optimization by [williams2007_multicore_spmv]
  - TLB Blocking
    > heuristically limit the num-ber of source vector *cache lines* touched in a cache block by the number of *unique pages* touched by the source vector.
    This is also said in one nvidia blog to avoid page refreshing.
- TODO ["Laplacian matrices derived from 3D triangulated surface meshes"](https://people.eecs.berkeley.edu/~jrs/meshpapers/Sorkine.pdf)
- See [Associative](https://en.wikipedia.org/wiki/Associative_property) right-side card figure which doesn't care about the order.
  > because addition is associative, we are free to *change the order* in which elements are added together.
- FIGURE B.8.7 
  - just use that any number can be expressed by binary. See FIGURE B.8.8 colored line.
- FIGURE B.8.9 just [cuda_reduction]
- > Details on more *efficient* implementation techniques and the extension of this *per-block procedure* to multiblock arrays are provided by Sengupta et al. [2007].

  [ScanPrimitives]
  The complexity is $2\sum_{i=1}^{\log_2 n-1}n*2^{-i}=2n*(1-2^{-(\log_2 n-1)})=2n-4$, so $\mathcal{O}(n)$
  
  Better see [Ble93] FIGURE 1.4 b. then $2\sum_{i=1}^{\log_2 n}n*2^{-i}=2n-2$.
  - Here reduce calculate two blocks, then 1st step of downsweep swap the first block $11$
    result to the second, causing the sum.
    - here reduce is similar to above [cuda_reduction] (i.e. calculate the block sum.)
      See [parprefix] referenced by "[HSO07]" in [hillis_DATA_PARALLEL]
      >  In the reduce phase we traverse the tree from leaves *to root* computing *partial sums* at internal nodes of the tree
    - down-sweep
      > using the partial sums to build *the scan in place* on the array
  - "FIGURE B.8.8" $\sum_{i=1}^{\log_2 n}(n-2^{i-1})$
    the inefficiency is that it doesn't use the accumulation where the 1st step has been $(n-1)$ additions to calculate too many small original numbers.
  - [Segmented scan](https://en.wikipedia.org/wiki/Segmented_scan) is similar to predicate but this predicate controls one *range* instead of one indexed value.
- This means write to one `arr[grid_size]`.
  > One strategy to do this would be to have each block write its partial sum into *a second array* and then launch the *reduction* kernel again,
- [data shuffling](https://www.talend.com/blog/data-privacy-shuffling-masking-part-1/#:~:text=the%20second%20part.-,Data%20Shuffling,e.g.%20a%20set%20of%20columns).) just *mix* up to get the new data.
- FIGURE B.8.11
  - `+F_total` in `values[T_before-1 + F_total]` implies `0` on the left.
    
    `-T_before` in `values[i - T_before]` means moving `1` to the right. (here `i` is from the original index, no needs to `-1`).
  - > double-buffer double-buffer the array of values rather than doing the partitioning in place

    [gpusort_ipdps09]
    just use the global memory to calculate all *count* data with "p × 2b histogram table" and then use the "sorted data tile" (i.e. data stored in the original array, more specially correspond to `x_i` in the FIGURE) to save data to the array (i.e. `values[]`).
  - Barnes-Hut Algorithm
    > The Barnes-Hut algorithm is a clever scheme for *grouping* together bodies that are *sufficiently nearby*
    > To determine if a node is sufficiently far away, compute the quotient s / d, where s is the *width* of the *region* represented by the internal node, and d is the *distance* between the body and the node’s *center-of-mass*.

    View the step 4 where
    > Now s/d = 25/66.9 < θ.

    TODO why [$\mathcal{O}(n\log n)$](https://en.wikipedia.org/wiki/Barnes%E2%80%93Hut_simulation).
  - TODO [Ewald summation](https://en.wikipedia.org/wiki/Ewald_summation)
- FIGURE B.8.14
  - The 2rd `__syncthreads()` is to synchronize *between* loops.
    >  ensure that new values are *not loaded into shared memory* prior to all threads
  - From gpugems3
    > We therefore increase the number of active threads by using *multiple threads on each row* of a body's force calculation. If the additional threads are *part of the same thread block*, then the number of memory requests increases,
    > so we *split each row into q segments*, keeping p x q $\le$ 256.
    
    Notice: The codes needs to change and from [this](http://users.wfu.edu/choss/CUDA/docs/Lecture%205.pdf) p15, *multiple* `threadIdx.y`s may correspond to one *same* `threadIdx.x`, then `float4 myBody = body[i];` and `shPosition[threadIdx.x] = body[j+threadIdx.x];` or others related with `threadIdx.x` may be calculated duplicately. While it still amortizes the overheads due to the *full thread usage*. 
    ```c++
    for (k = 0; k < p; k++) { // Inner loop accesses p positions
    acc = body_body_interaction(acc, myBody, shPosition[k]);
    }
    /*
    change to
    */
    q = blockDim.y;
    /*
    this syntax may be wrong. it needs to be in the shared mem.
    Here needs $blockDim.y \mod 0 mod q$. otherwise see COD/csapp before codes about how to do cache blocking.
    */
    float3 acc[i][q](0.0f, 0.0f, 0.0f);
    ...
    {
      for (k = 0; k < p; k+=blockDim.y) { // Inner loop accesses p positions
      acc[q] = body_body_interaction(acc[q], myBody, shPosition[k+q]);
      }
      __syncthreads();
    }
    if (threadIdx.y==0)
      accel[i]= sumup(acc);
    ```
    > done, the q partial results can be collected and summed to compute the final result.
- CUDA-for-CPU compiler is [not supported](https://stackoverflow.com/a/21946786/21294350) on new CUDA.
- TODO [4-bit Divider](https://digitalsystemdesign.in/signed-array-divider/)
  - [full subtractor](https://www.geeksforgeeks.org/full-subtractor-in-digital-logic/) similar to full adder, here with borrow.
- `(RSQRT*)` in x86 error [$1.5 ∗ 2^{−12}$](https://www.felixcloutier.com/x86/rsqrtps)
  while in cuda, error is [0/1 ulp](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#id125) (i.e. $2^{-52}*2^{exponent}$ for IEEE binary64 )
#### CUBLAS
- SGEMM -> [`cublasGemmEx`](https://docs.nvidia.com/cuda/cublas/index.html#cublasgemmex)
# Computer Graphics books
- [this](https://www.reddit.com/r/C_Programming/comments/lbkb9h/comment/glv0ruc/?utm_source=share&utm_medium=web2x&context=3) vs "[11]" referenced in [pineiro2005]

---

<!-- SD -->
[booth1951]:../references/papers/SD_Radix_Multiplier/booth1951.pdf
[Generalized_Multibit_Recoding]:../references/papers/SD_Radix_Multiplier/Generalized_Multibit_Recoding.pdf
[Digital_Computer_Arithmetic]:../references/papers/SD_Radix_Multiplier/Digital_Computer_Arithmetic.pdf
[pineiro2005]:../CUDA/doc/papers/pineiro2005.pdf
[Radix_8_Multiplier]:../references/papers/SD_Radix_Multiplier/A_Radix-8_Multiplier_Unit_Design_for_Specific_Purp.pdf
[fast_hybrid_multiplier]:../references/papers/SD_Radix_Multiplier/a-fast-hybrid-multiplier-combining-booth-and-wallacedadda-algori.pdf
[partially_rounded]:../references/papers/partially-rounded-smallorder-approximations-for-accurate-hardwar.pdf

[COD_RISCV_2nd_A_appendix]:../references/other_resources/COD/COD_RISCV_2nd_A_appendix.pdf

[IEEE_754]:../references/IEEE/ieee-standard-for-floatingpoint-arithmetic.pdf

[sticky_bit]:https://stackoverflow.com/a/76858612/21294350

<!-- paper -->
[Tesla_ARCHITECTURE]:../CUDA/doc/papers/lindholm08_tesla.pdf
[williams2007_multicore_spmv]:../CUDA/doc/papers/williams2007-multicore-spmv.pdf
[hillis_DATA_PARALLEL]:../CUDA/doc/papers/hillis-steele-data-parallel-algorithms.pdf
[gpusort_ipdps09]:../CUDA/doc/papers/gpusort-ipdps09.pdf
[Ble93]:../CUDA/doc/papers/Ble93.pdf
[ScanPrimitives]:../CUDA/doc/papers/ScanPrimitives.pdf

<!-- FMA -->
[2012_03_bfpfma]:../references/papers/2012_03_bfpfma.pdf
[floatingpoint_fused_multiplyadd]:../references/papers/floatingpoint_fused_multiplyadd.pdf
[Charles_FMA]:../references/papers/Charles_FMA.pdf
[HAN_DISSERTATION]:../references/papers/HAN-DISSERTATION.pdf
[hokenek1990_LZA]:../references/papers/hokenek1990_LZA.pdf

<!-- nvidia blog -->
[cuda_reduction]:https://developer.nvidia.com/blog/faster-parallel-reductions-kepler/

<!-- cuda -->
[parprefix]:../CUDA/doc/papers/parprefix.pdf