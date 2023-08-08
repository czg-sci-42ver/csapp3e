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
  Notice the **color** which relates related operations.
  - TODO Multiplier Array
  - Inversion
    - because use IEEE binary64 format, the sign bit is separate from the significand
      So it needs inversion. See [2012_03_bfpfma] 3.3.2
    - It is the opposite operation of the Complementer.
      > The result is *conditionally recomplemented*, so as to return a result in *sign-magnitude* form
  - Alignment shifter does right shift of `A`
    see [2012_03_bfpfma] Figure 3-6
    - (a)
      here takes the *rounding* into account implicitly
      See p35 BxC affects only the calculation of the sticky bit.
      So when exponent differences bigger than 56 which is *beyond the binary64 Significand range* with the implicit bit (the 1 before the binary dot) plus the guard, round and sticky bit, the smaller bits beyond 56 are all dropped.

      here $52+4+52*2+1=161$ where 52 are Significand size, 4 is the multipler's [whole number](https://www.onlinemathlearning.com/mixed-numbers-explain.html), the guard and round bits.
    - (b)
      here to keep the multipler result *not rounded* before adding. So keep their 106 bits.
      From "Figure 3-8", when $d<105$, the `A` will not be added at all. Obviously, here the 55 MSB is nothing.
    - "Normalizer" does the opposite (left shift) to make the *implicit one* shows in the result.
      - TODO "Figure 3-1" how LZA functions.
        > Many methods have been proposed in [3] so far to handle the *one-bit error of the LZA* logic.
        - From the "Figure 3-9", it is obvious "LZD" just outputs the leading one location where 0 means the first MSB.
          And the `P` is concatenated by two binary to output from 0~3 which is also obvious.
        - here "Sticky" is not complemented because its function is to track the ones shifted off.
          See [sticky_bit]
  - Rounder removes the precision kept in "Carry Propagate Adder". It is same as [COD_RISCV_2nd_A_appendix] FIGURE 3.15 and p218 "Step 4".
  - [Multiplier Array](https://www.geeksforgeeks.org/array-multiplier-in-digital-logic/) will probably be replaced by the improved "CSA Tree" shown in [2012_03_bfpfma] (i.e. "Wallace reduction tree." in [Radix_8_Multiplier]).
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
# Computer Graphics books
- [this](https://www.reddit.com/r/C_Programming/comments/lbkb9h/comment/glv0ruc/?utm_source=share&utm_medium=web2x&context=3)
---

<!-- SD -->
[booth1951]:../references/papers/SD_Radix_Multiplier/booth1951.pdf
[Generalized_Multibit_Recoding]:../references/papers/SD_Radix_Multiplier/Generalized_Multibit_Recoding.pdf
[Digital_Computer_Arithmetic]:../references/papers/SD_Radix_Multiplier/Digital_Computer_Arithmetic.pdf
[pineiro2005]:../references/papers/pineiro2005.pdf
[Radix_8_Multiplier]:../references/papers/SD_Radix_Multiplier/A_Radix-8_Multiplier_Unit_Design_for_Specific_Purp.pdf
[fast_hybrid_multiplier]:../references/papers/SD_Radix_Multiplier/a-fast-hybrid-multiplier-combining-booth-and-wallacedadda-algori.pdf
[partially_rounded]:../references/papers/partially-rounded-smallorder-approximations-for-accurate-hardwar.pdf

[COD_RISCV_2nd_A_appendix]:../references/other_resources/COD/COD_RISCV_2nd_A_appendix.pdf

[IEEE_754]:../references/IEEE/ieee-standard-for-floatingpoint-arithmetic.pdf

[sticky_bit]:https://stackoverflow.com/a/76858612/21294350
[2012_03_bfpfma]:../references/papers/2012_03_bfpfma.pdf