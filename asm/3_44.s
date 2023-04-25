	.file	"3_44.c"
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
	subq	$64, %rsp	#,
	movl	%edi, -52(%rbp)	# argc, argc
	movq	%rsi, -64(%rbp)	# argv, argv
# 3_44.c:6: int main(int argc, char *argv[]) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp87
	movq	%rax, -8(%rbp)	# tmp87, D.2922
	xorl	%eax, %eax	# tmp87
# 3_44.c:7:   int test_int =1;
	movl	$1, -36(%rbp)	#, test_int
# 3_44.c:8:   short test_short =1;
	movw	$1, -38(%rbp)	#, test_short
# 3_44.c:9:   struct P1 test={1,2,&test_int,&test_short};
	movw	$1, -32(%rbp)	#, test.i
	movl	$2, -28(%rbp)	#, test.c
	leaq	-36(%rbp), %rax	#, tmp84
	movq	%rax, -24(%rbp)	# tmp84, test.j
	leaq	-38(%rbp), %rax	#, tmp85
	movq	%rax, -16(%rbp)	# tmp85, test.d
	movl	$0, %eax	#, _11
# 3_44.c:10: }
	movq	-8(%rbp), %rdx	# D.2922, tmp88
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp88
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
