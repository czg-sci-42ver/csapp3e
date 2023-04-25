	.file	"p344.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx5124fmaps -mtune=generic -march=x86-64 -O3
	.text
	.p2align 4
	.globl	find_range
	.type	find_range, @function
find_range:
.LFB22:
	.cfi_startproc
# p344.c:8: 	if (x < 0)
	vxorps	%xmm1, %xmm1, %xmm1	# tmp85
	xorl	%eax, %eax	# <retval>
	vcomiss	%xmm0, %xmm1	# x, tmp85
	ja	.L1	#,
	vcomiss	%xmm1, %xmm0	# tmp85, x
	jp	.L9	#,
	je	.L3	#,
# p344.c:12: 	else if (x > 0)
	movl	$2, %eax	#, <retval>
	ja	.L1	#,
.L9:
	movl	$3, %eax	#, <retval>
.L1:
# p344.c:17: }
	ret	
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$1, %eax	#, <retval>
	ret	
	.cfi_endproc
.LFE22:
	.size	find_range, .-find_range
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
# p344.c:20: }
	xorl	%eax, %eax	#
	ret	
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
