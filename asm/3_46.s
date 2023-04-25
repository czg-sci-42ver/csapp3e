	.file	"3_45.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movl	%edi, -84(%rbp)	# argc, argc
	movq	%rsi, -96(%rbp)	# argv, argv
# 3_45.c:14: int main(int argc, char *argv[]) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	movq	%rax, -8(%rbp)	# tmp89, D.2926
	xorl	%eax, %eax	# tmp89
# 3_45.c:15:   int test_int = 1;
	movl	$1, -68(%rbp)	#, test_int
# 3_45.c:16:   char test_char = 1;
	movb	$1, -69(%rbp)	#, test_char
# 3_45.c:17:   struct rec test = { &test_int,1,1,1,1,1,1, &test_char};
	leaq	-68(%rbp), %rax	#, tmp84
	movq	%rax, -64(%rbp)	# tmp84, test.a
	movss	.LC0(%rip), %xmm0	#, tmp85
	movss	%xmm0, -56(%rbp)	# tmp85, test.b
	movb	$1, -52(%rbp)	#, test.c
	movw	$1, -50(%rbp)	#, test.d
	movq	$1, -48(%rbp)	#, test.e
	movsd	.LC1(%rip), %xmm0	#, tmp86
	movsd	%xmm0, -40(%rbp)	# tmp86, test.f
	movl	$1, -32(%rbp)	#, test.g
	##add
	##end
	leaq	-69(%rbp), %rax	#, tmp87
	movq	%rax, -24(%rbp)	# tmp87, test.h
	movl	$0, %eax	#, _15
# 3_45.c:18: }
	movq	-8(%rbp), %rdx	# D.2926, tmp90
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1065353216
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
