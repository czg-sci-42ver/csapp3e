I didn't do the homework because
1. I have done all exercises in the csapp which from [teachyourselfcs](https://teachyourselfcs.com/#operating-systems) it is enough.
   1. I focus on the software instead of hardware, so csapp may be enough by what teachyourselfcs says.
2. I read this book only to complement csapp, so no need for redundant exercises
3. I have read projects and labs in [CS61C](#cs61c-from-learn_self) which has much overlap with examples or exercises from COD and csapp.
   1. TODO csapp labs may be better.
# miscs
- [mingw-w64](https://stackoverflow.com/a/25582293/21294350)
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
    - [rasterizer](https://computergraphics.stackexchange.com/questions/4062/why-do-gpus-still-have-rasterizers#comment5403_4062) says why is is not programmable -> fixed-function.
    - [zcull](https://en.wikipedia.org/wiki/Z-buffering)
      > In the end, the z-buffer will allow correct reproduction of the usual depth perception: a close object *hides* one further away. This is called z-culling.
- pixel [vs](https://stackoverflow.com/a/45373885/21294350) fragment
- [Supersampling](https://en.wikipedia.org/wiki/Supersampling) and Multisampling
  See [this](https://mynameismjp.wordpress.com/2012/10/24/msaa-overview/) from [this](https://hero.handmade.network/forums/code-discussion/t/973-difference_between_supersampling_and_multisampling#5500)
  - Oversampling
    > Oversampling is the process of sampling a signal at some rate that’s *higher* than our intended final output, and then *reconstructing* and resampling the signal again at the output sample rate.
  - [MSAA](https://en.wikipedia.org/wiki/Multisample_anti-aliasing)
    > we can observe that aliasing of triangle visibility function (AKA geometric aliasing) only occurs at the *edges* of rasterized triangles.
    > Where MSAA begins to differ from supersampling is when the pixel shader is executed. In the standard MSAA case, the pixel shader is *not executed for each* subsample.
  - [Also](https://forum.beyond3d.com/threads/dumb-question-msaa-vs-ssaa-what-is-the-big-differences.18849/#post-451925)
  - B-77 [related](https://en.wikipedia.org/wiki/Spatial_anti-aliasing#Super_sampling_/_full-scene_anti-aliasing) with FSAA (full-scene anti-aliasing)
- GDDR3 [vs](https://superuser.com/a/860811/1658455) DDR3
  > Graphics cards *move a lot of data around* and its needs aren’t the same as that of the processor. Because of this, graphics cards need memory that is much *faster* than what the processor actually needs. GDDR3 fulfills this need but at a much higher cost.
  > The main reason why GDDR3 is much faster is its ability to do a read and a write *within the same cycle*.
- SGEMM is included in [BLAS3](https://www.netlib.org/blas/#_level_3)
- FIGURE B.7.3,4 -> ["Figure 6"](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2008/EECS-2008-49.pdf)
- in-place FFT: [codes](https://developer.apple.com/documentation/accelerate/fast_fourier_transforms/in-place_functions_for_1d_real_fft), [description](https://dspguru.com/dsp/faqs/fft/)
- [FSB](https://www.cpu-upgrade.com/mb-MSI/G31M3-F_(FSB_1600).html)
#### CUBLAS
- SGEMM -> [`cublasGemmEx`](https://docs.nvidia.com/cuda/cublas/index.html#cublasgemmex)
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
- > although this has improved in the latest Penryn CPU family with its *faster 4-bit divider*.
  See [intel_SOM] p916 Or the referenced [one][intel_SOM_248966_016] from [this](https://en.wikichip.org/wiki/File:intel-ref-248966-016.pdf?page=7) by [COD_RISCV_2nd_A_appendix] B-70.
  - Also see p964
    > Radix-1024 floating point divider
- > the *limitations in register capacity* lead to many MOV instructions
  implies GPU is the load/store architecture.
### B.9
- Fallacy
  - 1
    - > address memory independently. 
      independent page table, which is also said in one nvidia blog.
    - Also see [asm_doc] "GPU_CPU_thread_diff" and "SIMD_VS_SIMT".
    - > Execution is more efficient if individual thread load/store memory accesses can be *coalesced* into block accesses, as well. However, thisis *not strictly necessary*.
      This is also said in one nvidia blog.
  - 2
    - > so the Moore’s law rate can clearly be *exceeded* by *spending more* for larger chips with more transistors.
    - > The most challenging rate limiter appears to be the memory system, but *competitive innovation* is advancing that rapidly too.
      maybe see [asm_doc] NVLink
    - "data compression" -> video.
  - 3
    - TODO [pros-and-cons-of-hlsl-vs-glsl-vs-cg](https://gamedev.stackexchange.com/questions/4234/what-are-the-pros-and-cons-of-hlsl-vs-glsl-vs-cg)
      mainly depends on the platforms, the cards, OpenGL/Direct3D compatibility, etc.
    - TODO what is the true differences between the Turing machine and the Push down automata.
      [definition_1](https://chortle.ccsu.edu/StructuredC/Chap01/struct01_5.html)
      > The mathematical model for a Turing machine includes an *unlimited* amount of memory and *no limit* on how long a computation can take (as long as it finishes in a finite amount of time.)
      maybe means it can *simulate* one unlimited resource machine.
      Also [this](https://qr.ae/pyxWGO)
      > The turning Machine has Infinite tape length and storage, PDA has *limited(stack)*.
      
      [This](https://shaunak-mahajan19.medium.com/pushdown-automata-vs-turing-machine-fa1607ddcfef#:~:text=Pushdown%20Automata%20is%20not%20Deterministic,position%20on%20the%20infinite%20tape.)
      > A Pushdown Automata can access *only top of the stack* as it works on the Last In First Out(LIFO) concept where as the Turing Machine can access *any position on the infinite tape*.
      See the [example](https://en.wikipedia.org/wiki/Turing_machine#%22State%22_diagrams)
      - diff Pushdown Automata vs the finite-state machine.
        plus the *stack*.
    - TODO "indexed arithmetic representation (lookup tables for colors)"
      [lookup tables for colors](https://developer.nvidia.com/gpugems/gpugems2/part-iii-high-quality-rendering/chapter-24-using-lookup-tables-accelerate-color)
- Pitfall
  Maybe wrong on some conditions (TODO maybe this is the differences between pitfalls and fallacies)
  > So, the pitfall is that for the “just use more threads” strategy to work for covering latency, you have to have enough threads, and the threads have to be well-behaved *in terms of locality* of memory access.
  - 2
    - > the concurrent operations of copy-in, copy-out and computation
      > This model is useful for any data stream that can be processed *as it arrives.*
      TODO this is similar to one pattern of the CPU.
#### radix-16 divider
it may be more easier for the later radix-16 multipler.
- [ATKINS_radix] from the [pattent](https://patentimages.storage.googleapis.com/cf/af/6f/2c6e86d325192f/US5023827.pdf) by googling "radix-16 divider quotient selection".
  - from "RANGE RESTRICTIONS", it is similar to the common radix-10 division in [14_High_RadixDividers] p6.
    - [14_High_RadixDividers] is from "radix divisor example" [google image](https://www.google.com/search?newwindow=1&q=radix+divisor+example&tbm=isch&source=univ&fir=ZAn1L4h0J60__M%252CV_DphMSS0WSqgM%252C_%253BHMS8VTWGEJaEgM%252CRlvp52rv7K8o_M%252C_%253B1k3xfPNgs2pmOM%252CDexzdsejYBHYKM%252C_%253B6BJoW9ovp9v8vM%252ChPIaNBvTkj0WKM%252C_%253BpbXpAvm3H7mruM%252C24ps1mm5NwPo5M%252C_%253BrxT1DG6eunSP8M%252CfcTkPN4X7OeqCM%252C_%253BA5q1MICoZPNT8M%252C4QcJAYr1jvLtAM%252C_%253BGacV6zW3ymDymM%252CrqxP3R1fKGnVRM%252C_%253BxTjohTXl3vrHoM%252C4QcJAYr1jvLtAM%252C_%253BgKNkABuLSgi0IM%252ChPIaNBvTkj0WKM%252C_&usg=AI4_-kRHHLUpfke5Kje1eAdjnK2gelxn9Q&sa=X&ved=2ahUKEwjD-t2sldGAAxWqg_0HHfT2Ag8Q7Al6BAgfEEU&biw=1231&bih=641&dpr=1.5) and then [this](https://www.researchgate.net/figure/Examples-of-high-radix-division-with-integer-and-fractional-operands_fig1_262836257)
    But here take negative quotient in account. Compare p8 and p12 in [14_High_RadixDividers] where the latter has negative x-axis value.
    - Also [see](https://www.jucs.org/jucs_1_1/high_radix_division_with/Fenwick_P.html)
    - From p17 in [14_High_RadixDividers], although $p_0$ is dividend, but it may need to be converted to at the **same radix point** with the divisor.
    - TODO here $k$ may be $\frac{1}{2}$ because radix-4 table the max absolute is 2 which is 
      $\frac{1}{2}*4$.
### B.10
- [multitexturing](http://what-when-how.com/opengl-programming-guide/multitexturing-texture-mapping-opengl-programming/)
- unified processor GPU definition
  > *unified* processor GPU in 2005, allowing vertex and pixel shaders to *execute on the same* processor.
- B-78 
  - says about what the vertex shader and many other shaders do.
  - > ... Combined with a pixel shader workload that is usually compute-limited,
    says reasons of divergence between the CPU and GPU development.
  - TODO more about fixed-function stages.
- ~~TODO how realized~~ maybe by running other threads when some are stalled.
  > higher operating frequency than standard-cell methodologies had allowed
  [standard-cell methodologies](https://en.wikipedia.org/wiki/Standard_cell#:~:text=Standard%2Dcell%20methodology%20is%20an,(dielectric%20has%20been%20removed).) means encapsulation.
- > this favored designing one processor
  because then the clock is unified.
- [clipping](https://stackoverflow.com/questions/6243411/clipping-polygon-against-rectangle) to a rectangle shape
- [speed binning](https://en.wikipedia.org/wiki/Product_binning) and packaging
- > applications  using task parallelism must be rewritten frequently
  because tasks are more difficult to be [independent](https://en.wikipedia.org/wiki/Task_parallelism).
  > task parallelism is distinguished by running many *different tasks* at the same time on the *same data*.[1] A *common* type of task parallelism is *pipelining*, which consists of moving a single set of data through a series of separate tasks where each task can execute *independently* of the others.
  B-81
  >encourages the use of many-fold data parallelism and thread parallelism, which *readily* scales to thousands of parallel  threads  on  many  processors. 
- "fine-grained and coarse-grained parallelism" See [asm_doc] GPU_fine_grained.
## C
- microprogram
  - See [this](https://www.geeksforgeeks.org/computer-organization-hardwired-vs-micro-programmed-control-unit/) figures
    - TODO [Vertical Micro-programmed](https://www.geeksforgeeks.org/difference-between-horizontal-and-vertical-micro-programmed-control-unit/)
      > It allows a low degree of parallelism i.e., the degree of parallelism is *either 0 or 1*.
- "FIGURE C.2.2" is based on "FIGURE C.2.1" where the ~~opcode~~ "Funct field" must be *valid*.
  - a
    - The 1st line should be `X 1`.
  - > a signal and its complement as inputs to an AND gate to *generate 0*.
    This constant 0 functions like one latch which will keep the state 0.
- > For example, the encoding 11 for ALUOp always generates a don’t care in the output.
  because the `11` is not one valid ALUOp code. See [asm_doc] "truth_table_hardware".
  > it may not completely describe the logic function.
  So has the above statement where not take the *invalid conditions* in account.
- FIGURE C.2.4
  - here `X` can be *anything*, so `sw` can get `RegDst` by AND of all NOT inputs.
### C.3. This has been almost learnt in the before verilog code.
- `state9` may mean "start".
- "logical sum" -> OR.
- See [asm_doc] "A-15" 
  where row -> AND gate input. 
  column -> AND gate output.
  > each row corresponds to *one of the $2^n$ unique input* combinations, and a set of *columns indicates which outputs* are active for that input combination
- "deal with these exceptions and interrupts opcodes in Section 4.9."
  See "FIGURE 4.67".
### C.4
- 692 vs 4.3 K
  because the latter has one factor $2^{10}$
- here designing opcodes by choosing shared set bit location in "related opcodes".
  > in choosing the opcodes, the architect can provide additional opportunities by choosing *related opcodes* for instructions that are likely to *share states* in the control.
- > can *replace the two* truth table entries that test whether the input is lw or sw by a *single test on this bit*;
  means same as
  > This renumbering allows us to combine the two truth table entries in part (o) of Figure C.3.4 and replace them with a single entry, eliminating one term in the control unit
  here "eliminating one term" only applies to PLA because ROM always depends on the state *bit number* instead of state nums.
- FIGURE C.4.6
  [microcode](https://en.wikipedia.org/wiki/Microcode) corresponds to uop
  and "microprogram counter" stores state number,
  "microcode memory" defines how the state are converted to the next state. (i.e. similar to "instructions for the datapath.")
### C.5
- `IR` is the instruction register.
- From FIGURE e4.5.6, "write result into IR (and the MDR)." may be wrong.
- From "FIGURE C.5.1", the microcode functions as one *medium* to the lower hardware implementation.
  > This process is essentially the same as the process of translating an *assembly* language program into machine instructions: the *fields* of the assembly language or microprogram instruction are translated
- These two sentences say about what to do when *default*.
  > Control lines that are not set, which correspond to actions, are 0 by default. Multiplexor control lines are set to 0 if the output matters. 
  > If a multiplexor control line is not explicitly set, its output is a don’t care and is not used.
- [Microinstruction](https://www.tutorialspoint.com/what-is-the-format-of-microinstruction-in-computer-architecture) format is similar to assembly.
  And different architecture counterparts are different.
  See [this](https://www.ecs.csun.edu/~cputnam/Comp546/Stallings-Appendices/20-Microprogrammed.pdf) p36 for Horizontal or Vertical format differences, p41,44 for more differences  <a id="Horizontal_Vertical_format"></a>
- > first write the *complete microprogram* in a *symbolic notation* and then measure *how* control lines are *set* in each microinstruction.
  ~~dynamic circuit with variable "control line" field.~~
  Different "microprogram" has different circuits.
- C-31 
  - "encoding" store 3 bits instead of 8.
    > if *no more than one* of eight lines is set *simultaneously* in the *same* microinstruction, then this subset of control lines can be encoded into a 3-bit field
    > control lines may be encoded together if they are *only occasionally set in the same* microinstruction; *two* microinstructions instead of one are then required when *both* must be set.
    Here two because the *decoder* can only select one control line.
  - format field
    - disables "any combination of operations" in one microinstruction.
      So [above](#Horizontal_Vertical_format) [also](https://www.geeksforgeeks.org/difference-between-horizontal-and-vertical-micro-programmed-control-unit/)
      - Also see [program example](https://inst.eecs.berkeley.edu/~cs150/fa05/CLD_Supplement/chapter12/chapter12.doc5.html)
      - "maximally encoded" -> cause less bits -> vertical
- C-32
  - choices between different implementations.
## D
- > with large amounts of microcode, which made *single chip and pipelined implementations* more challenging
  because microcode are constant to be saved in the chip and pipeline ~~needs to split instruction instead of ~~ is controlled by the microcode and microcode defines the pipeline complexity.
- See [asm_doc] "ISA_virtualization".
### D.2
#### general
- [SP vs LR](https://stackoverflow.com/a/8236974/21294350)
- [Global Pointer Register](https://www.intel.com/content/www/us/en/docs/programmable/683282/current/global-pointer-register.html) -> global data.
- [jump register](https://stackoverflow.com/a/32305904/21294350) is chosen manually.
- > destination and two source fields are sometimes scrambled
  i.e. replaced by constant or others.
- > extended opcode field (or function field) and immediate field sometimes overlap or are identical.
  This means [field overlap](https://stackoverflow.com/questions/39427092/risc-v-immediate-encoding-variants) instead of field overlap in one specific instruction.
  > maximize overlap with the other formats andwith each other.
- [delay slot](https://en.wikipedia.org/wiki/Delay_slot#Load_delay_slot) related with delayed branches is to function as *stall*.
  Also [see](https://stackoverflow.com/a/59044726/21294350)
- > the hardware need not go through the *register read pipeline* stage for return jumps.
  Only *general-purpose registers* are considered in the register read pipeline.
- "FIGURE D.25" says "FIGURE D.3" `B,H,W,D` meaning.
- [Saturation arithmetic](https://en.wikipedia.org/wiki/Saturation_arithmetic#Modern_use) make overflow not cycle. See [asm_doc] "modular_overflow".
  > aturation causes significantly less distortion to the sound than *wrap-around*
  The *cycle back* in modular arithmetic -> wrap-around.
  Also see D-27
  > Saturation means that when a calculation overflows the result is set to the *largest* positive number or most negative number, rather than a *modulo* calculation as in two’s complement arithmetic.
- FIGURE D.26
  - ["Bit insert"](https://developer.arm.com/documentation/ddi0596/2020-12/SIMD-FP-Instructions/BIT--Bitwise-Insert-if-True-) is similar to the predicated instructions.
  - TODO 
    - green highlights.
      Most of them are similar to CUDA PTX or intrinsic functions.
    - [`splat`](https://reviews.llvm.org/D45683)
- FIGURE D.29
  - TODO [DEC Floating-point](https://stackoverflow.com/questions/64760137/how-to-display-dec-floating-point-format-given-32-bits-in-ieee-standard)
#### ARM
- D-5 PC [relation](https://developer.arm.com/documentation/dui0473/m/overview-of-the-arm-architecture/general-purpose-registers) with GPR
  >  the ability to write the PC as a GPR
  - it also says
    > The C and C++ compilers always use SP as the stack pointer. Use of SP as a general purpose register is *discouraged*.
    > When using the --*use_frame_pointer* option with armcc, do *not* use R11 as a general-purpose register.
- newer [armv9](https://en.wikipedia.org/wiki/ARM_architecture_family#Armv9) and [detailed](https://www.arm.com/company/news/2021/03/arms-answer-to-the-future-of-ai-armv9-architecture) highlighting SVE2 (ML,DSP) and "Confidential Compute Architecture".
- FIGURE D.7
  - ARM
    - > Exclusive operations: three register fields
      i.e. 4 registers with [XOR](https://developer.arm.com/documentation/ddi0602/2021-12/SIMD-FP-Instructions/EOR3--Three-way-Exclusive-OR-).
    - [Logical immediates](https://kddnewton.com/2022/08/11/aarch64-bitmask-immediates.html#bitmask-immediates)
- ["reverse bytes"](https://developer.arm.com/documentation/dui0802/b/A32-and-T32-Instructions/REV--REV16--REVSH--and-RBIT) order.
  - [Special data processing](https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/Thumb-Instruction-Set-Encoding/16-bit-Thumb-instruction-encoding/Special-data-instructions-and-branch-and-exchange?lang=en)
- [load pair](https://developer.arm.com/documentation/den0024/a/The-A64-instruction-set/Memory-access-instructions/Non-temporal-load-and-store-pair) need `dsb nshld` where `nshld` may counterpart of `ld` with [`nshst`](https://developer.arm.com/documentation/dui0489/c/arm-and-thumb-instructions/miscellaneous-instructions/dmb--dsb--and-isb#id4692266_contents) to avoid reorder of the memory order.
  - [application](https://stackoverflow.com/a/54131812/21294350)
  - From [this][ARMv8_ISA_doc] `data2 = Mem[address+dbytes, dbytes, AccType_VECSTREAM];` they are adjacent pairs.
    Also [see compiler doc][ARM_compiler]
- TODO ST meaning in [`TST`](https://developer.arm.com/documentation/dui0068/b/ARM-Instruction-Reference/Conditional-execution).
- [why](https://stackoverflow.com/a/22169950/21294350) conditional execution is dropped.
  > redicated execution of instructions does *not offer sufficient benefit*
  only small subset keeps "conditional execution".
  > This set has been shown to be beneficial in situations where conditional branches *predict poorly*, or are otherwise inefficient.
  > Trading Conditional Execution for *More Registers*
- FIGURE D.22
  - [`ADR`](https://developer.arm.com/documentation/ddi0596/2021-12/SVE-Instructions/ADR--Compute-vector-address-?lang=en)
    From `Elem[result, e, esize] = addr + (offset * mbytes);`, it is similar to Scaled-index addressing
    `for e = 0 to elements-1` implies vector.
  - TODO why define Bit field clear shifted [`BIC`](https://developer.arm.com/documentation/ddi0597/2023-06/Base-Instructions/BIC--BICS--register---Bitwise-Bit-Clear--register--)
  - Signed bit field move [`SBFIZ`](https://devblogs.microsoft.com/oldnewthing/20220803-00/?p=106941)
  - [`CBNZ`](https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/CBNZ--Compare-and-Branch-on-Nonzero-?lang=en) provides one *hint* "indicating this is not a call or return."
- TODO 
  - [Adjacent add](https://stackoverflow.com/a/39421552/21294350)
  - [Dot product add](https://community.arm.com/arm-community-blogs/b/tools-software-ides-blog/posts/exploring-the-arm-dot-product-instructions) 
    [`SDOT`](https://developer.arm.com/documentation/ddi0596/2020-12/SIMD-FP-Instructions/SDOT--vector---Dot-Product-signed-arithmetic--vector--)
  - How [`SASX`](https://developer.arm.com/documentation/ddi0597/2020-12/Base-Instructions/SASX--Signed-Add-and-Subtract-with-Exchange-) used in real applications. (See 'Operation').
- [`FCMLA`](https://developer.arm.com/documentation/ddi0596/2020-12/SIMD-FP-Instructions/FCMLA--Floating-point-Complex-Multiply-Accumulate-) seems only take regular "Argand diagram" of "the second source register" in account, i.e. "0, 90, 180, or 270 degrees.".
#### POWER
- [bit field manipulation](https://devblogs.microsoft.com/oldnewthing/20210609-00/?p=105293)
- POWER [vector](https://www.princeton.edu/~rblee/ELE572Papers/AltivecPerm.pdf) operations
- TODO why POWER has no [atomic](https://stackoverflow.com/questions/61356289/atomic-operations-in-power-other-than-ll-sc) from FIGURE D.9.
- [summary overflow](https://devblogs.microsoft.com/oldnewthing/20180807-00/?p=99435#:~:text=The%20summary%20overflow%20bit%20accumulates,the%20carry%20bit%20in%20xer%20.) can be used as one overflow.
  > This lets you perform a *series* of arithmetic operations and then test a single bit at the end to see if an overflow occurred anywhere *along the way*.
  - it also says "condition registers" `cr#` which can be manipulated by `crand`, etc.
- whether Count Register decrements depends on the implementation.
  [`bc`](https://math-atlas.sourceforge.net/devel/assembly/ppc_isa.pdf) instruction -> decrement.
  while [`bctrl`](https://stackoverflow.com/a/40010609/21294350) not.
  > The counter register is often used for loops (hence the name) but *is also* very useful for *indirect branches*.
  Also see D-24.
  > Tests of the value of the count register in a branch instruction will *automatically decrement* the count register.
  > *Either register* can hold a target address of a conditional branch
- [`BPERMD`](https://www.ibm.com/docs/en/xl-fortran-linux/16.1.1?topic=extension-bpermdmask-source) just *select* bits.
  > If byte i of MASK is less than 64, the permuted bit i is *set to the bit of source* *specified* by byte i of MASK;
- [`DRAN`][POWER3_doc_2]
- [`CMPB`][POWER3_doc_1]
- "Branch Target Address register" -> Link Register by [this](https://www.ibm.com/docs/en/aix/7.1?topic=processor-branch-instructions).
- TODO [branch history rolling buffer](https://www.ibm.com/docs/ssw_aix_71/p_bostechref/pm_enable_bhrb.html)
- `BCCTR` and [`BCLR`](https://www.ibm.com/docs/en/aix/7.2?topic=set-bclr-bcr-branch-conditional-link-register-instruction)
#### MIPS
- MIPS usage is [smaller](https://stackoverflow.com/a/2653951/21294350)
- `LDL` see [MIPS_doc] p262
- TODO read [MIPS_doc] Table 3.4 and Table 3.5 for op in `CACHE`.
- See FIGURE D.3 for indexed addressing mode.
- [`Q15`](https://dsp.stackexchange.com/a/10707) meaning from [this](https://dsp.stackexchange.com/questions/66513/q-format-doubts#comment134966_66513)
- [Hi-Lo register](https://devblogs.microsoft.com/oldnewthing/20180404-00/?p=98435) (from [this](https://stackoverflow.com/a/2320233/21294350)) is similar to how x86 solves with higher bit-width data.
#### SPARC
- FIGURE D.12
  - > sets the condition codes using r0 as the destination.
    See [this](https://stackoverflow.com/a/19130966/21294350) which is same as risc-v reasons
    > R0 is hard-wired to a value of zero, and can be used as the target register for any instruction whose result is to be *discarded*.
- ["circular buffer"](https://en.wikipedia.org/wiki/Circular_buffer) implies (Also see the [figure](https://en.wikipedia.org/wiki/Register_window))
  > The *knee* of the cost-performance curve seems to be six to eight banks
  because of the bank number limit.
  Also see the [figure](http://mercury.pr.erau.edu/~siewerts/cs332/code/PLP_3e_CD/data/chapters/8c_rgwin.pdf).
- from [SPARC_doc] p245, `SAVE` and `RESTORE` are just similar to `ret` in x86 where the former changes one specific register and the latter changes the `rsp` stack pointer register.
- "register renaming" (See [asm_doc] "Register_renaming") make efficient usage of logical registers, then
  > The danger of register windows is that the *larger number of registers* could slow down the clock rate
  may probably not happen.
- See [SPARC_doc] Table 22 for different instructions.
- ["multi-word arithmetic" p9](https://www.cs.princeton.edu/courses/archive/spr03/cs217/lectures/Branching.pdf)
- ["tagged data type"](https://pages.cs.wisc.edu/~fischer/cs701.f05/sparc.htm#:~:text=SPARC%20supports%20integer%20data%20types,indicate%20the%20type%20of%20object.)
  > tagged word format in which the *2 least significant* bits serve as flags to indicate the type of object.
- ["paired data like LISP" by `pairlis`](https://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node153.html)
#### RISC-V
- FIGURE D.12
  - from risc-v [beq](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#beq)
    the compare and branch are synthesized -> "Number of condition code bits" none.
    - "Basic compare instructions" `FCMP` [riscv_spec] 71
    - only compare -> FIGURE D.10 [`slti`](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#slti).
- > has specified that the “P” extension will support packed integer SIMD *using the floating point registers*
  From the new [riscv_spec] p121, it has been dropped.
#### cadence (Tensilica) Xtensa
- > Tensilica is the only other major architecture in use today employs them
  This means Xtensa architecture. [See](https://www.cadence.com/content/dam/cadence-www/global/en_US/documents/tools/ip/tensilica-ip/isa-summary.pdf)
#### Multimedia
#### 8086
- Opcode I/O -> I/O address [in the opcode](https://csiflabs.cs.ucdavis.edu/~ssdavis/50/8086%20Opcodes.pdf).
### D.3
- > Intel 8086 architecture was announced as an assembly language
  This means [8086](https://www.geeksforgeeks.org/architecture-of-8086/) must be programmed by assembly but not the high-level language.
  > especially for novice programmers who may not be familiar with the *assembly language programming required* for the 8086 microprocessor.
- [real addressing mode](https://www.eeeguide.com/real-addressing-mode-of-80286/) still uses Memory segmentation.
  See "FIGURE D.32".
- > MMX uses the registers comprising the *floating-point stack* and hence there is no new *state* for operating systems to *save*.
  > but it also gives the compiler a different target for floating-point operations *than the unique stack architecture.*
  This means MMX or later SSE,SSE2 not need `st0`, etc. (See [asm_doc] "fp_stack").
  Also see [this](https://www.cs.utexas.edu/users/moore/acl2/manuals/current/manual/index-seo.php/X86ISA____MMX-REGISTERS-READS-AND-WRITES#:~:text=The%20MMX%20state%20consists%20of,see%20Figure%2012%2D1).)
  > not to the relative locations of the registers in the *floating-point register stack* (ST0 through ST7).
- [Extra data segment](https://www.geeksforgeeks.org/memory-segmentation-8086-microprocessor/)
- [long mode](https://wiki.osdev.org/Setting_Up_Long_Mode)
  >  What we are interested in is simply the 64-bit mode as this mode provides a lot of *new features* such as: registers being extended to 64-bit (rax, rcx, rdx, rbx, rsp, rbp, rip, etc.) and the introduction of *eight new general-purpose* registers (r8 - r15) ...
- [FPR](https://github.com/avast/retdec/wiki/x86-FPU-semantic-model) in x86 is `st`
- FIGURE D.30 shows original meaning of each register if not general-purpose (general-purpose starting from 80386).
  This is same as [osdev_x86_reg].
- [FP status register](https://wiki.osdev.org/FPU)
  > The current "top" register index is *stored* in the FPU Status Register, and is *updated automatically* by the FPU
  Also see [intel_64] p206
- [addressing modes](https://www.geeksforgeeks.org/addressing-modes-8086-microprocessor/)
  Also see D-34,35
  1. Absolute -> Immediate mode
  2. Indexed mode -> index + immediate.
  3. Based with scaled indexed. See [this](https://www.plantation-productions.com/Webster/www.artofasm.com/DOS/ch04/CH04-3.html#HEADING3-49) -> [intel_64] Table 2-3 "SIB Byte"
    Or [c-jump](http://www.c-jump.com/CIS77/CPU/x86/X77_0110_scaled_indexed.htm)
  Above also implied in [intel_64] Table 2-1, etc.
- FIGURE D.32
  - ["Protected mode"](https://en.wikipedia.org/wiki/Protected_mode) -> protected *virtual address* mode
  - in the new machine, [long mode](https://stackoverflow.com/a/57436126/21294350) is always used
    From [this](https://wiki.osdev.org/Setting_Up_Long_Mode#x86_or_x86-64), long mode is supported by `0x80000020 > 0x80000001`.
    ```asm
    $ sudo cpuid
    80000000 00000000:  80000020  ...  68747541 Auth  444d4163 cAMD  69746e65 enti
    ```
  - > Note that a “flat” 80×86 address space comes simply by *loading the same value in all the segment* registers
    This is how the modern CPU does. See [asm_doc] "flat_memory_model".
- D-37
  - FIGURE D.33 is still the legacy mode.
    - `callf`/`call ptr16:16`, etc., will [push](http://www.fysnet.net/isegcall.htm) the *CS* register.
      This is also shown in the [operation](https://www.felixcloutier.com/x86/call#operation) <a id="call_ptr"></a>
      - This also explains
        > two 16-bit quantities follow the opcode in 16-bit mode
        by `ptr16:16` -> `DEST[31:16]`. (`ptr16:32` also works.)
      And [limited](https://stackoverflow.com/a/54610439/21294350) addressing modes
  - > lock the bus so as to perform a semaphore
    [`LOCK`](https://stackoverflow.com/a/8891781/21294350)
    > *exclusive* ownership of the appropriate cache line
  - [`REP`](https://www.felixcloutier.com/x86/rep:repe:repz:repne:repnz) See [asm_doc] "rep_x86_prefix".
    > intended to be paired with a byte move instruction to move *a variable number of bytes*
    See [intel_64] p1775 `REP MOVS`
  - [Segment Override](https://www.includehelp.com/embedded-system/segment-override-prefix-8086-microprocessor.aspx) Prefix
    See more in [intel_64] p526 and [this](http://ece-research.unm.edu/jimp/310/slides/assem5.html)
    > override the *default* segment.
  - > override the default address size.
    See [asm_doc] "x86_addr_prefix".
  - integer [diff](https://qr.ae/pyDmrE) decimal
    Also see the [Taxonomy](https://peterjamesthomas.com/maths-science/a-brief-taxonomy-of-numbers/) from [this](https://qr.ae/pyDm2R)
- FIGURE D.34
  - [`LES`](https://www.felixcloutier.com/x86/lds:les:lfs:lgs:lss) -> "Load ES:r16" is similar to [this](#call_ptr)
    ```asm
    SS := SegmentDescriptor([SRC]);
    ...
    DEST := Offset(SRC);
    ```
  - [`RCL` ](https://www.felixcloutier.com/x86/rcl:rcr:rol:ror)
    > The RCL instruction *shifts the CF flag into the least-significant* bit and shifts the most-significant bit into the CF flag.
    ```asm
    tempCF := MSB(DEST);
    DEST := (DEST ∗ 2) + CF;
    CF := tempCF;
    ```
  - From [this](https://stackoverflow.com/q/27804852/21294350), `MOVS` is almost never used with other registers or memory.
    > usually the operation size is encoded as an instruction suffix,
    Also can guess it from the [opcode identity](https://www.felixcloutier.com/x86/movs:movsb:movsw:movsd:movsq)
    - `LODS` is similar but uses [different registers](https://www.felixcloutier.com/x86/lods:lodsb:lodsw:lodsd:lodsq).
- FIGURE D.35
  View this before "D-38".
  - [`FLD`](https://www.felixcloutier.com/x86/fld#description) will 
    > it is automatically *converted to the double extended-precision* floating-point format before being pushed on the stack.
    - CW control word. See [intel_64] p211. 
      - [exception mask](https://developer.arm.com/documentation/100701/0200/Special-purpose-mask-registers)
        > The exception mask registers *disable* the handling of exceptions
        This can also be [guessed](https://www.felixcloutier.com/x86/finit:fninit#description) by
        > The FINIT instruction checks for and handles any *pending unmasked* floating-point exceptions
  - [`FADD`](https://www.felixcloutier.com/x86/fadd:faddp:fiadd)
    > the processor marks the ST(0) register as empty and *increments the stack pointer* (TOP) by 1
    This implies the book
    > below the top of the stack
    because "the top of the stack" is always the *minimal* value.
  - [`FCMP`](https://www.felixcloutier.com/x86/fcom:fcomp:fcompp)
    default `ST(0)` and `ST(1)`.
  - Compared with [pineiro2005], intel adds `FPATAN`, but drops something like "square root".
  - branch. See [intel_64] p224,209.
    - ["C0, C3, and C1"](https://www.felixcloutier.com/x86/fprem) may be to store the sticky bit, etc.
    - `0x4500` in Table 8-8 implies `#IS` by Table 8-1.
      ```python
      for index,ele in enumerate(bin(0x4500)):
        if ele == '1':
          print(15-(index-2),ele)
      15 1
      11 1
      9 1
      ```
    - See [intel_64] Figure 8-5
  - > Numbers are automatically *converted* to the internal 80-bit format on a load and converted back to the appropriate size on a store
    See `FLD` and `FST` [doc](https://www.felixcloutier.com/x86/fld) by searching "converted".
  - > called real by Intel.
    See [this](https://www.intel.com/content/www/us/en/standards/floating-point-case-study.html)
    > *approximate* real numbers using floating-point arithmetic
  - > send the result to the integer CPU
    in the old CPU, the FPU is outside of the CPU.
- FIGURE D.36
  See [intel_64] p525.
  - From [intel_64] p538, 528, etc., "Opcode ext" can be at many locations.
    - Based on [Operand Encoding](https://www.felixcloutier.com/x86/mov#instruction-operand-encoding) and [detailed](http://www.c-jump.com/CIS77/CPU/x86/X77_0060_mod_reg_r_m_byte.htm) infos of each field meaning of the "MODR/M"
      Also see [this](https://www.scs.stanford.edu/05au-cs240c/lab/i386/s17_02.htm) and [intel_64] p527.
      `MOD` -> mode.
      `R/M` means either Register or Memory based on mod.
      `Reg/Opcode` means (See [intel_64] p528)
      > may be used as an opcode exten-sion.
- FIGURE D.37
  View [intel_64] Table B-15 and p2866 Table B-1.
  - here `JE` is more general to mean `JCC`.
  - ["MOV d/w"](https://www.felixcloutier.com/x86/mov) only applies when not using segment register (i.e. opcode from `88` to `8B`).
    - TODO "OI" with imme seems not to have memory as the destination.
  - See [intel_64] "Table 3-1"
    `PUSH  Reg` uses the [`50+rw`](https://www.felixcloutier.com/x86/push), etc., format.
  - TODO `Reg` in [`ADD Reg w`](https://www.felixcloutier.com/x86/add)
    - here `w` means from `04` to `05`.
  - TODO `r-r` meaning
    - `SHL v/w` means `D0` -> `D2` -> `D3`.
- FIGURE D.38
  View [intel_64] p530 Table 2-2 and 
  - See [intel_64] Table B-1 for *w* bit.
  - ~~TODO~~ "¦" meaning
    "mod ¦3" mean mod not equals 3 by viewing "Table 2-2".
  - ~~`SS` in "Table 2-3" may imply "none" -> `ESP`.~~
  - FIGURE D.39
    - > Register indirect using ESP comes from Scale = 0, Index = 4, and Base = 4
      -> `11100100` which has "none" index where `SS` means the scale field.
- escape opcode See [intel_64] p2835
  for example, Table A-7 defines the reg/opcode extension like [`FMUL`](https://www.felixcloutier.com/x86/fmul:fmulp:fimul) -> `D8 /1`
  - > decide whether the operand is a 32- or 64-bit real or a 16- or 32-bit integer
    See p2857 Table A-13
    > do not access memory to decide whether the stack should be popped
    see [intel_64] p2861 `FIST` and `FISTP`
    TODO "whether the top of stack or a lower register should get the result."
- > cannot *separate the restrictions on registers* from the encoding of the *addressing* modes in the 80 × 86
  TODO how ARM separate.
  This cause 
  > *orthogonal  is  not  a  term  found  in  the  Intel*  architectural  dictionary.
  - And also caused by
    > High floating-point performance is a larger challenge in this architecture.
    and [the following](#fp_stack_cons)
- > cover the “second” operand
  because the 2rd can have imme while the 1st can't.
- > does not include addressing modes used by branches or control instructions.
  because they are probably using *labels*.
- > The instruction count is *surprisingly close to DLX* for many integer programs, as you would expect a *load-store* instruction set architecture like DLX to execute more instructions than a register-memory architecture like the 80x86. The *floating-point programs always have higher counts* for the 80 × 86, presumably *due to the lack of floating-point registers* and the use of a stack architecture.
  So RISC architecture may use less instructions than CISC. <a id="fp_stack_cons"></a>
  > The 80 × 86 performs about *two to four times as many data accesses as DLX* for floating-point programs, and 1.25 times as many for integer programs.
  x86 access more maybe due to not many registers to save the data.
- [DLX](https://en.wikipedia.org/wiki/DLX)
- > dynamic instruction set measurements
  may mean [depending on the compiler](https://www.cs.ucf.edu/~dcm/Teaching/CDA5106-Fall2015/Appendices/appendix_a.pdf) technology.
  > weighed by the number of times that event occurs *during execution of the measured program.*
### D.4
- "compatibility with highly optimizing compilers" -> a large number of registers.
  - "simple instructions" -> less hazards, then "high performance via *pipelining*" and "ease of hardware implementation".
- `movc3` see [vax_doc] p334.
- From "FIGURE D.50"
  - deferred can be nested.
  - "Indexed (scaled)" and "Autoincrement" helps the loop implementation.
  - See [vax_doc] chapter 5.
- > doesn’t know where its operands come from
  See [vax_doc] p69 where the address is put in one register, so "doesn’t know".
- > show the VAX *destination* operand on the *left* and the source operands on the right, just as we show MIPS code
  However, [vax_doc] p212 puts the dest in the end.
- TODO
  > absolute is autoincrement deferred
  From D-34, absolute is displacement, then what is the relation?
- FIGURE D.51
  - See [vax_doc] p195 and p56 for "Addressing Mode Formats".
  - > Order is not important in fixed-length instructions like MIPS
    because this format is fixed, so every operand can always be got from the 32-bit instruction.
    For the variable-size instruction, assembler needs to know the start and the end of the instruction.
  - > specifies the register number as well as the mode
    relations with mode, See [vax_doc] p56.
    So `c` in `c2` implies word (i.e. 2 bytes).
- > 30,000 versions of integer add
  $10*10^3$ where `10` in $10^3$ means 10 addressing modes in FIGURE D.50.
- > The stack pointer, sp, is just like the stack pointer in MIPS; it points to the top of the stack.
  > The frame pointer, fp, points to the base of the *local variables* of the procedure that are kept in memory

  So `fp`,`sp` is similar to `rsp`,`rbp` in x86.
- TODO `l` in `beql` meaning.
- `aobleq` is just `for(i=...;i<limit;i++)`
  See [vax_doc] p250.
- FIGURE D.52
  - `case_` See [vax_doc] 261
    ```asm
    TABIND: .WORD 4
    ...
      CASEB TABIND,R4,R5
    ...
    TAB: .WORD 1$-TAB
    5$: .ASCII /AT 5/
    ```
    > The destination selected in the example is at location 5$:
    From [vax_doc] p27, `$` is to define the symbol.
    TODO `1$-TAB` meaning.
  - From [vax_doc] p269
    `callg` may not use the stack to store args.
  - "D, F, G, and H formats" See [vax_doc] p182.
  - From [vax_doc] p324, `C` in `C[d]` not means `tbladdr.ab`.
    ```asm
    PTABLE: .FLOAT 0.25 ; C2
            .FLOAT 0.5 ; C1
            .FLOAT 1.0 ; C0
    ```
    - TODO maybe due to the [Endianness](https://en.wikipedia.org/wiki/Endianness).
      > VAX floating point stores little-endian 16-bit words in *big-endian* order.
      But [this](https://stackoverflow.com/questions/1330231/byte-order-of-dec-vax-vs-ia-32) says "little-endian".
- D-59 shows the "indexed addressing" for accessing the array.
- > The calls instruction expects a *16-bit mask* at the beginning of the procedure to determine which registers are saved
  See [vax_doc] p36,38,101,271 for usage like `.ENTRY CALC,^M<R2,R3,R7>` and `calls`.
  - > calls saves this mask *on the stack* to allow the return instruction (ret) to restore the proper registers.
    [vax_doc] p271
    > A *longword containing* the saved low 2 bits of the SP in bits 31:30, a 1 in bit 29, a zero in bit 28, the low 12 bits of the *procedure entry mask in bits 27:16*, and the processor status word (PSW) in bits 15:0 with T cleared is *pushed on the stack.*
    > The *procedure entry mask* is scanned from *bit 11 to bit 0*, and the contents of registers whose numbers correspond to *set bits* in the mask are *pushed* on the stack. 
    So only use 12 registers (general purpose) instead of 16. See [vax_doc] p30 for the reason.
  - "The procedure entry mask" in [vax_doc] p271 indicates:
    > but the *callee sets the call mask* to indicate what should be saved.
  - Since `calls`
    > A longword containing the saved low 2 bits of the SP in bits 31:30 ... A *longword zero is pushed* on the stack. The *FP is replaced by the SP*.
    So `ret` needs "plus 4"
    > The stack pointer (SP) is *replaced by the frame pointer (FP) plus 4*. A longword containing stack alignment bits in bits 31:30, a CALLS/CALLG flag in bit 29, the low 12 bits of the procedure entry mask in bits 27:16, and a saved processor status word (PSW) in bits 15:0 is popped from the stack and saved in a temporary.
    But not the book
    > ret sets the stack pointer from the current frame pointer
    - Notice this `ret` has internal restore of stack which is different from the x86. <a id="VAX_ret"></a>
      This is similar to "Restoring registers" in "FIGURE D.54".
- > follows a convention of treating registers *r0 and r1 as temporaries* that are not saved across a procedure call, so the VMS C compiler does *include registers r0 and r1* in the register saving mask. 
  But [vax_doc] p272
  > R0 and R1 are always available for function return values and are *never saved* in the entry mask.
- > v and n, are found in the stack in locations 4(ap) and 8(ap),
  TODO maybe same as the C convention the 1st parameter is the function pointer.
- > Normal use is to push the arglist onto the stack in *reverse order prior to* the CALLS.
  TODO then why D-63
  ```asm
  swap(v, j) ;
  ...
  pushl (r5) ; first swap parameter is v
  pushl r4 ; second swap parameter is j
  ```
- TODO reread D-64 after reading D.5 .
- > the segmented address space of the 8086 causes *major problems* for both programmers and compiler writers.
  based on [this](https://softwareengineering.stackexchange.com/a/100088)
  1. From [this](https://softwareengineering.stackexchange.com/questions/100047/why-not-segmentation#comment877686_100088)
    > Practically all C code ever written *expects a flat* address space. It is convenient to be able to look at a pointer and just see its address, *not have to go dig into the segment base*, assuming that is even possible
  2. > However.. x86 is a bit limited. It has only *4 "free" data segment registers*; *reloading* them is rather *expensive*, and it is possible to simultaneously access only 8192 segments.
  3. > Now, with 64-bit mode segmentation is *described as "legacy"* and hardware limit checks are done only in *limited circumstances*. IMHO, a BIG mistake. Actually I don't blame Intel, I mostly *blame developers*, the majority of which thought that segmentation was *"too complicated" and longed for flat address space*.
    So the developer and OS drops the segmentation for its complexity but not for its internal flaws. (Also see [this](https://softwareengineering.stackexchange.com/questions/100047/why-not-segmentation#comment782556_100088))
  - TODO relation between "4 protection rings" and segmentation.
- From [this](https://tcm.computerhistory.org/ComputerTimeline/Chap42_vax11-780_CS2.pdf)
  > The most distinctivefeature of VAX-11 is the extension of the virtual address from 16bits as provided on the PDP-11 to 32 bits.
  So 
  > provides  a  virtual  address of about *4.3 gigabytes* which
- > conflicts with the current emphasis on easy decoding
  because VAX instruction *byte number* may be very high.
- > the opcode is independent of the addressing modes ... even the *number of unique operands*
  i.e. 2/3 suffix of the opcode like in `movc3`.
#### VAX diffs from x86
1. The former not uses the floating stack.
2. addressing mode is *separate* from the opcodes. (making the instruction length maybe longer)
  Also see D-64
  > The biggest VAX advantages are in register saving and restoring and *indexed addressing*.
1. ~~"FIGURE D.50" addressing mode more friendly to *loops*.~~ (x86 can use LOOP prefix)
2. has many instructions corresponding to small procedures like `polyf`,`insque`,`case_`, etc., in FIGURE D.52 .
3. has "memory-to-memory move" from D-59.
4. see [above](#VAX_ret) 
  Also see "FIGURE D.56" where the `call` and `ret` also apply to x86.
#### VAX diffs from MIPS
1. See D-55
  > uses r1 for both the destination and a source, taking just 24 bits
1. 
#### VAX
- doc [1](https://rbur004.github.io/MacVAX/MacVAX.html)
#### MIPS
- FIGURE D.54
  - Notice the [order](https://stackoverflow.com/q/54136371/21294350) of `lw` and `sw`.
- [visual instruction](https://www3.ntu.edu.sg/home/smitha/fyp_gerald/sltInstruction.html)
### D.5
TODO reread all green highlighted words with the corresponding context.
- 370-XA [vs](http://www.beagle-ears.com/lars/engineer/comphist/ibm360.htm) 370
  > addresses were extended from 24 bits to 31 bits
- [ISA](http://www.simotime.com/asmins01.htm#BCTR)
- [RX format](https://www.ibm.com/docs/en/zos/2.1.0?topic=instructions-rx-format) ~~-> "Based with scaled indexed and displacement" in D-34~~ here just sum up without multiply.
  Also see [`BAL`](http://www.simotime.com/asmins01.htm#BAL)
  - ~~TODO~~ how [RS format](https://www.ibm.com/docs/en/zos/2.1.0?topic=instructions-rs-format) is used.
    See [`BXH`](http://www.simotime.com/asmins01.htm#BXH)
  - ["SI format"](https://www.ibm.com/docs/en/zos/2.1.0?topic=instructions-si-format) can be guessed from the above -> jump to "base+displacement" based on the "immediate" IF using branch.
    See [`XI`](http://www.simotime.com/asmins01.htm#XI)
  - See `AP` and `CLC` for different length formats with "SS format".
    - TODO [`CP`](http://www.simotime.com/asmins01.htm#CP) is "arithmetic comparison" which *may* compare the whole number instead of comparing string which only compares the substring like " logical" ones if there are differences.
- [`IC`][IBM_370_ISA] just replace one part of the register while `STC` store at one address.
  - TODO how [`EX`](http://www.simotime.com/asmins01.htm#EX) "modified".
- maybe `AH` and [`AL`](http://www.simotime.com/asmins01.htm#AL) diff based on how they change the condition codes. (i.e. what "logical" means)
- TODO 
  - [`SLA`](http://www.simotime.com/asmins01.htm#SLA) diff `SLDA`
  - [`TR`](http://www.simotime.com/asmins01.htm#TR): "The address is calculated from x2+d2" means b2+d2?
### D.6
- See [CAAQA] M.4 instead of L.4
- [accumulator-based computers](https://srimanthtenneti.medium.com/accumulator-based-cpu-design-ec07171f3e9a#:~:text=Accumulator%20Based%20CPUs,as%20one%20of%20the%20inputs.) only has one output port.
- [Drum memory](https://en.wikipedia.org/wiki/Drum_memory)
  > It could be considered the *precursor to the hard disk drive* (HDD), but in the form of a drum (cylinder) rather than a flat disk.
- intel FPU stack can be thought as the ["stack architecture"](http://fpgacpu.ca/stack/index.html#:~:text=By%20%22stack%20architecture%22%2C%20I,faster%20access%20than%20register%20files.).
  > These stacks typically make only their *top-most or top two* elements accessible, granting faster access than register files.
- Imperative programming vs [declarative programming](https://en.wikipedia.org/wiki/Declarative_programming)
  where the former "describing its control flow" while the latter doesn't.
  > that expresses the logic of a computation without describing its control flow.
  > Common declarative languages include those of *database query languages*
- [activation record](https://www.geeksforgeeks.org/access-links-and-control-links/) just like local stack.
- > The stack architecture yielded good code density,
  > added *hardware-managed* activation records
  [because](https://electronics.stackexchange.com/a/4124/341985) somewhat like
  > Code density also affects performance; if your loops are *longer* because the code is *not dense*
- > frequency-encoded instruction formats
  [means](https://dl.acm.org/doi/pdf/10.1145/359361.359454)
  > carefully optimized depends primarily upon its *projected frequency of usage*
  i.e. optimized based on the usage frequency.
- > the VAX designers tried to optimize code size
  See [COD_RISCV_2nd_A_appendix] D-51
  > *three lengths* of addresses for displacement addressing: 8-bit, 16-bit, and 32-bit
  >  The second difference is that to reduce code size the add instruction *specifies the number* of unique operands; 
- > Bhandarkar and Clark [1991] gave a quantitative analysis of the disadvan-tages of the VAX versus a RISC computer
  See [COD_RISCV_2nd_A_appendix] D-66 FIGURE D.57.
  > Hennessy published an explanation of the RISC performance advan-tage and traced its roots to *a substantially lower CPI*—under 2 for a RISC processor and over 10 for a VAX-11/780 (though not with identical workloads)
- [ECL](https://ethw.org/Rise_and_Fall_of_Minicomputers) minicomputer
  TODO see TTL
  - ECL [inverter](https://www.allaboutcircuits.com/technical-articles/the-basics-of-emitter-coupled-logic-ECL-inverter-buffer/) example
    here emitter voltage $V_{Q1}$ is *shared*,
    then differences between two [$V_{GE}/V_{IN}$](https://www.electronics-tutorials.ws/power/insulated-gate-bipolar-transistor.html) controls the different behaviors.
- From [CAAQA] p1367, the 2 authors of [COD_RISCV_2nd_A_appendix] is *MIPS and RISC-I architects*.
- TODO based on the verilog design, see VII. in [this](https://www.computer.org/csdl/journal/tc/1984/12/01676395/13rRUyuego1)
- p1369 at least from "orthogonal" -> "efficient instruction encoding".
- > translate from CISC to RISC inter-nally
  RISC i.e. uop in x86.
  > overcome by the enormous volume and the ability to dedicate IC processing lines specifically to this product. 
  enormous volume ->  sufficient revenue -> dedicate IC processing lines *specifically*
- [this](https://courses.cs.washington.edu/courses/csep548/06au/readings/ia-64.pdf) says x86 relations with RISC.
  > This approach is more efficient than a hardware-managed register file because *a compiler can tell* when the program no longer needs the contents of a specific register. 
  > The 32 static registers (r0 to r31) are managed in much the *same* way as registers in a standard *RISC* architecture
  So needs push and pop registers to stack when calling procedures. 
# Computer Graphics books
- [this](https://www.reddit.com/r/C_Programming/comments/lbkb9h/comment/glv0ruc/?utm_source=share&utm_medium=web2x&context=3) vs "[11]" referenced in [pineiro2005]
# logic design book
- "Computer Arithmetic: Algorithms and Hardware Designs" from [14_High_RadixDividers]
  Also C-20
  > the references for books on logic design, see Appendix A.
# [learn_self]
> Study all nine subjects below, in *roughly the presented order*, using either the suggested textbook or video lecture series, but *ideally both*. Aim for *100-200 hours* of study of each topic, then *revisit favorites throughout your career*
- Programming
  - > but also to those who missed beneficial concepts and *programming models* while first learning to code.
  - > We recommend working through at least the *first three* chapters of SICP and doing the exercises
  - > Why? Because SICP is unique in its ability—at least potentially—to *alter your fundamental beliefs* about computers and programming. Not everybody will experience this.
  - > this guide is NOT designed for those who are entirely new to programming.
  - [reddit](https://www.reddit.com/r/learnprogramming/wiki/faq/#wiki_getting_started)
    - [courses](http://www.infocobuild.com/education/audio-video-courses/computer-science/computer-science.html)
    - [projects](https://github.com/practical-tutorials/project-based-learning#cc)
      [Also](https://www.reddit.com/r/learnprogramming/wiki/faq/#wiki_where_can_i_find_practice_exercises_and_project_ideas.3F)
    - [inspiration](https://www.reddit.com/r/learnprogramming/wiki/faq/#wiki_i_can.27t_come_up_with_any_cool_new_ideas_for_a_project._am_i_simply_lacking_in_creativity.3F_how_do_other_programmers_become_inspired.3F)
      > if you're interested in politics you could try analyzing voting pools and trends, if you're interested in music you could try writing a digital soundboard
      > Or, perhaps try googling "home automation tutorial" for more *physical solutions*.
    - [github collection](https://github.com/collections)
    - self-learning
      - [1](https://matt.might.net/articles/what-cs-majors-should-know/) which contains the book list.
      - [2](https://functionalcs.github.io/curriculum/#org0806978) similar to above
- Computer Architecture
  - TODO The Elements of Computing Systems
    But it uses HDL.
    > In particular, two very important concepts in modern computer architectures are pipelining and memory hierarchy, but both are mostly absent from the text.
  - Reread COD with [CS61C](https://cs61c.org/su23/)
- How does this compare to Open Source Society or freeCodeCamp curricula?
  - It doesn't recommend [OSSU](https://github.com/ossu/computer-science)
  > We strove to limit our list of courses to those which you really should know as a software engineer, *irrespective of your specialty*, and to help you understand why each course is included. In the subsequent years, the OSS guide has *improved*, but we still think that this one provides a clearer, more cohesive path.
- How strict is the suggested sequencing?
  > Realistically, all of these subjects have a significant amount of *overlap*
  > learning math first would help you analyze and understand your algorithms in greater depth, but learning algorithms first would provide greater motivation and context for discrete math. Ideally, you’d *revisit both* of these topics *many times throughout* your career.
  > The most significant “pre-requisites” in our opinion are: computer architecture before *operating systems* or databases, and networking and operating systems before *distributed systems*.
- Who is the target audience for this guide?
  > but most people tend to benefit from having some *professional experience before diving* too deep into *CS theory*. For instance, we notice that students love learning about database systems if they have already worked with databases professionally, or about computer networking if they’ve worked on a web project or two.
- What about AI/graphics/pet-topic-X?
  > We’ve tried to limit our list to computer science topics that we feel every practicing software engineer should know, irrespective of specialty or industry, but *with a focus on systems*.
  > Subsequently, you’ll be in a much better position to *pick up textbooks or papers* and learn the core concepts *without much guidance*.
- database
  - [CS186](https://cs186berkeley.net/resources/)
  - Also [see](https://blog.bradfieldcs.com/how-to-learn-about-database-systems-40c7432f471d#.5rjlp4fqq) from [this](https://ozwrites.com/)
## compiler
- [dragon book](https://www.eecg.toronto.edu/~jzhu/csc467/csc467.html)
## [whether to take one master degree](https://ozwrites.com/masters/)
- > The best technical recruiter I know personally is Aline Lerner, who now runs interviewing.io.
  > If you actually are *passionate about programming*, I would urge you not to do that. Although you will look more legit on paper, many startups are catching on to *how useless an MS degree can be*.
  > Overall, the industry is at least striving to move beyond credentialism, and to assess engineers *on their merit*
  > Recruiting for *entry-level roles is quite different*.
  > If you’re primarily interested in a university’s capacity to teach you industry-relevant computer science, you may be *disappointed* to realize that US universities spend a lot of their organizational energy on *other things.*
  
  - > But if you’re undertaking a master’s program to make you better at your job, and your job is *not “research computer science”*, then you may be in the *wrong* place.
    > In short, master’s degrees in CS are not highly regarded by industry, are too *long* and *expensive*, cover too much *irrelevant* material from too much of a *research orientation*, provide *too little student feedback* (particularly at massive scale like Georgia Tech’s OMSCS) but get away with all this due to artificially inflated demand.
    > Well, it should be highly regarded by industry, *short* and affordable, cover *only the topics* that are relevant to *practicing* software engineers, and offer a lot of opportunities for feedback on *actual programming problems.*
    
    So if your purpose is to research, then maybe useful to read a master's degree. <a id="research_master"></a>

  > Unfortunately, much of *tertiary education* can be characterized as *vocalizing slides into the void*. Most MOOCs are just recordings of those vocalizations, designed to be *replayed asynchronously into the void at 2x speed.*
  > The best CS programs strive to keep *class sizes relatively low*, *incorporate labs and challenging projects*, and have instructors give feedback. *Unfortunately*, most self-taught engineers—particularly those on a budget—are more likely to end up in a program like *Georgia Tech’s OMSCS*, where they work through a series of Udacity courses alongside 2,000 others, with *feedback coming entirely from teaching assistants*.
  > The most common review of these programs is “*you get what you put into it*”. But if you’re essentially self-teaching, what is the point?
  > “As a student, I survived and prospered despite a lecture setting, but *only by reading text material repeatedly* and integrating this with *tackling homework challenges*. I now realize this was essentially autodidactical, my instructor’s role chiefly being to provide a *schedule*, expectations, *homework feedback, and evaluation via exams*. My subsequent decades teaching thousands of students suggests that few students will very successfully self-teach in this way.”

  - > I have no doubt that the overwhelming majority of these students certainly *do have an earnest intention* to learn computer science and complete their degrees. But there’s no denying that F-1 student visas (which also allow for 12 months of “practical training” after graduation) are more attainable, sadly, than other visa classes for many potential software engineers.
  
    mainly learning in the university to acquire the F-1 visa?

  > Unfortunately, to the extent that schools can survive based on these ulterior sources of demand, they can get away with *not delivering* the product that *bona fide students are seeking.*
### [Aline Lerner's blog](https://blog.alinelerner.com/how-different-is-a-b-s-in-computer-science-from-a-m-s-in-computer-science-when-it-comes-to-recruiting/)
- > With perhaps the exception of the combined BS/MS programs from *top schools* (which tend to have *stringent undergrad performance criteria*), though, I’d be surprised if separating this stuff out *made too much of a difference*.
  > Stanford’s admissions bar for an MS CS degree is *significantly lower* than their undergrad admissions bar. Schools like CMU do things like open a satellite Silicon Valley campus where they offer an MS in “Information Systems Management” (which to naive hiring managers sounds impressive until they interview a few people with this degree) and *rake in all the moneys*.
  > A lot of MS courses I’ve seen on people’s resumes seem to involve taking some machine learning toolkit and using it *out-of-the-box* on some data set. Is this interesting? It can be. Does it show that you know how to make hard, unexpected design decisions or write code that’s *not brittle? Probably not*.
  
  - > if you already have an undergrad CS degree, employers may wonder why you chose to go back to school rather than working (unless you’re *going into academia*, which is an entirely different animal and out of scope here).
  
    Same as the [above](#research_master)

  - > A possible line of reasoning might be, “Hey, if this person were really good, he’d be working already *instead of waiting out the recession* or whatever.”
  
    :)
  - > Also, if you’re a foreign student looking to turn your MS into *a work visa*, this could be a good option as well (though you’ll want to *distinguish yourself somehow from all the other* foreign students trying to do the same thing).
    same as above "F-1 visa".
  - > Until the market catches up, an MS will probably get you an extra 10K in your base salary. However, keep in mind that you’ve just taken 2 years out of your life and *paid some amount of money* (how much you pay depends on whether you can TA while studying)
    TA -> teaching assistant.
    > Instead of going back to school, take a few months to build something really cool. Teach yourself things. Take Udacity and Coursera classes and potentially use their *career placement services*. *Work with a recruiter* whose recommendation will help you get a first round interview *even if you don’t have a pedigree*. Once you start working, raises you get will quickly make the initial 10K boost pretty insignificant (especially given *the opportunity cost* and potential tuition expenses).
  - > So, to answer the question: BS *>>>* MS (if they’re from the same school, assuming you have to choose one or the other)
# cs61c from [learn_self]
Most of labs are redundant after doing the csapp exercises.
[2020](https://github.com/PKUFlyingPig/CS61C-summer20)
## projects
- TODO 1 [game](https://cs61c.org/su23/projects/proj1/)
- 2 is mainly to write the [assembly codes](https://cs61c.org/su23/projects/proj2/part-b/)
- 3 is just not using verilog to implement one cpu. This can be ignored if having learnt the verilog version.
  But the 3 is more detailed about every instructions.
  - [This](https://cs61c.org/su23/projects/proj3/testing/) is similar to how use gtkwave and verilog `printf` to debug.
- [multiplexer](https://inst.eecs.berkeley.edu/~cs61c/resources/blocks.pdf) and Subtractor with carry-propagate adder which is also said in [COD_RISCV_2nd_A_appendix].
  This is from [this](https://cs61c.org/su23/resources/)
## labs
- 5,6 is to draw the circuits which has been included in the [COD_RISCV_2nd_A_appendix] verilog codes.
- 8
  - [`critical`](https://cs61c.org/su23/labs/lab08/#critical)
- TODO 9 [OpenMPI](https://cs61c.org/su23/labs/lab09/)

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
[ATKINS_radix]:../references/papers/radix_divisor/ATKINS_radix.pdf
[14_High_RadixDividers]:../references/papers/radix_divisor/14-High-RadixDividers.pdf

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

[intel_SOM]:../references/x64_ISA_manual_intel/intel_Software-Optimization-Manual.pdf
[intel_SOM_248966_016]:../references/x64_ISA_manual_intel/intel-ref-248966-016.pdf
[intel_64]:../references/x64_ISA_manual_intel/intel_64.pdf

[asm_doc]:../asm/README.md

[learn_self]:https://teachyourselfcs.com/

<!-- riscv -->
[riscv_spec]:../references/other_resources/RISC-V/riscv-spec-20191213.pdf
[riscv_privileged]:../references/other_resources/RISC-V/riscv-privileged-20211203.pdf
[riscv_V_ext]:../references/other_resources/RISC-V/riscv-v-spec-1.0-rc2.pdf

<!-- MIPS -->
[MIPS_doc]:../references/other_resources/COD/MIPS/MIPS_Architecture_MIPS64_InstructionSet_AFP_P_MD00087_06.05.pdf

[SPARC_doc]:../references/other_resources/COD/SPARC/SPARC_document.pdf

<!-- ARM -->
[ARMv8_ISA_doc]:https://developer.arm.com/documentation/ddi0596/2021-12/SIMD-FP-Instructions/LDNP--SIMD-FP---Load-Pair-of-SIMD-FP-registers--with-Non-temporal-hint-?lang=en
[ARM_compiler]:https://developer.arm.com/documentation/dui0801/h/A64-Data-Transfer-Instructions/LDNP

<!-- POWER3 -->
[POWER3_doc_1]:https://www.ibm.com/docs/en/xl-fortran-linux/16.1.1?topic=extension-bpermdmask-source
[POWER3_doc_2]:https://www.ibm.com/docs/en/aix/7.2?topic=d-drand48-erand48-jrand48-lcong48-lrand48-mrand48-nrand48-seed48-srand48-subroutine
<!-- osdev -->
[osdev_x86_reg]:https://wiki.osdev.org/CPU_Registers_x86-64

[vax_doc]:../references/other_resources/COD/VAX/vax.pdf
[IBM_370_ISA]:http://www.simotime.com/asmins01.htm#IC
[IBM_370_ISA_example]:http://www.simotime.com/simoi370.htm#I@AL
[IBM_full_docs]:https://www.ibm.com/docs/en/zvm/7.3?topic=instructions-system370-io

[CAAQA]:../references/other_resources/CAAQA/Computer_Architecture_Sixth_Edition_A_Qu.pdf