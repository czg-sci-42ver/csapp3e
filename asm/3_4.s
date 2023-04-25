	.file	"problem_3_4.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
# problem_3_4.c:14: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp87
	movq	%rax, -8(%rbp)	# tmp87, D.1990
	xorl	%eax, %eax	# tmp87
# problem_3_4.c:17: 	src_t test_src=-1;
	movb	$-1, -29(%rbp)	#, test_src
# problem_3_4.c:19: 	dest_t test_dest=3;
	movl	$3, -28(%rbp)	#, test_dest
# problem_3_4.c:22: 	sp=&test_src;
	leaq	-29(%rbp), %rax	#, tmp84
	movq	%rax, -24(%rbp)	# tmp84, sp
# problem_3_4.c:23: 	dp=&test_dest;
	leaq	-28(%rbp), %rax	#, tmp85
	movq	%rax, -16(%rbp)	# tmp85, dp
	movl	$0, %eax	#, _8
# problem_3_4.c:24: }
	movq	-8(%rbp), %rdx	# D.1990, tmp88
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp88
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
