	.file	"3_8_5.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O3
	.text
	.p2align 4
	.globl	var_prod_ele
	.type	var_prod_ele, @function
var_prod_ele:
.LFB22:
	.cfi_startproc
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	testq	%rdi, %rdi	# n
	jle	.L4	#,
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	imulq	%rdi, %rcx	# n, tmp104
	leaq	0(,%rdi,4), %r9	#, _43
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	xorl	%eax, %eax	# j
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	leaq	(%rsi,%rcx,4), %r10	#, _6
	leaq	(%rdx,%r8,4), %rcx	#, ivtmp.21
# 3_8_5.c:6:   int result = 0;
	xorl	%esi, %esi	# <retval>
	.p2align 4,,10
	.p2align 3
.L3:
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	movl	(%r10,%rax,4), %edx	# MEM[(int *)_6 + _38 * 4], MEM[(int *)_6 + _38 * 4]
	imull	(%rcx), %edx	# MEM[(int *)_37], tmp107
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	addq	$1, %rax	#, j
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	addq	%r9, %rcx	# _43, ivtmp.21
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	addl	%edx, %esi	# tmp107, <retval>
# 3_8_5.c:8:   for (j = 0; j < n; j++) result += A[i][j] * B[j][k];
	cmpq	%rax, %rdi	# j, n
	jne	.L3	#,
# 3_8_5.c:11: }
	movl	%esi, %eax	# <retval>,
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
# 3_8_5.c:6:   int result = 0;
	xorl	%esi, %esi	# <retval>
# 3_8_5.c:11: }
	movl	%esi, %eax	# <retval>,
	ret	
	.cfi_endproc
.LFE22:
	.size	var_prod_ele, .-var_prod_ele
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
# 3_8_5.c:15: }
	xorl	%eax, %eax	#
	ret	
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (GNU) 42.2.5 20230206"
	.section	.note.GNU-stack,"",@progbits
