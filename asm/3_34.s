	.file	"3_34.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.globl	test_mul_args
	.type	test_mul_args, @function
test_mul_args:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# arg1, arg1
	movl	%esi, -8(%rbp)	# arg2, arg2
	movl	%edx, -12(%rbp)	# arg3, arg3
	movl	%ecx, -16(%rbp)	# arg4, arg4
	movl	%r8d, -20(%rbp)	# arg5, arg5
	movl	%r9d, -24(%rbp)	# arg6, arg6
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	-4(%rbp), %edx	# arg1, tmp91
	movl	-8(%rbp), %eax	# arg2, tmp92
	addl	%eax, %edx	# tmp92, _1
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	-12(%rbp), %eax	# arg3, tmp93
	addl	%eax, %edx	# tmp93, _2
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	-16(%rbp), %eax	# arg4, tmp94
	addl	%eax, %edx	# tmp94, _3
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	-20(%rbp), %eax	# arg5, tmp95
	addl	%eax, %edx	# tmp95, _4
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	-24(%rbp), %eax	# arg6, tmp96
	addl	%eax, %edx	# tmp96, _5
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	16(%rbp), %eax	# arg7, tmp97
	addl	%eax, %edx	# tmp97, _6
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	24(%rbp), %eax	# arg8, tmp98
	addl	%eax, %edx	# tmp98, _7
# 3_34.c:5:     return arg1+arg2+arg3+arg4+arg5+arg6+arg7+arg8+arg9;
	movl	32(%rbp), %eax	# arg9, tmp99
	addl	%edx, %eax	# _7, _17
# 3_34.c:6: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	test_mul_args, .-test_mul_args
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movl	%edi, -68(%rbp)	# argc, argc
	movq	%rsi, -80(%rbp)	# argv, argv
# 3_34.c:8: int main(int argc, char *argv[]){
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp99
	movq	%rax, -8(%rbp)	# tmp99, D.2934
	xorl	%eax, %eax	# tmp99
# 3_34.c:10:     for (int i=0; i<9; i++) {
	movl	$0, -52(%rbp)	#, i
# 3_34.c:10:     for (int i=0; i<9; i++) {
	jmp	.L4	#
.L5:
# 3_34.c:11:         test[i]=i;
	movl	-52(%rbp), %eax	# i, tmp95
	cltq
	movl	-52(%rbp), %edx	# i, tmp96
	movl	%edx, -48(%rbp,%rax,4)	# tmp96, test[i_11]
# 3_34.c:10:     for (int i=0; i<9; i++) {
	addl	$1, -52(%rbp)	#, i
.L4:
# 3_34.c:10:     for (int i=0; i<9; i++) {
	cmpl	$8, -52(%rbp)	#, i
	jle	.L5	#,
# 3_34.c:13:     printf("%d",test_mul_args(test[0],test[1],test[2],test[3],test[4],test[5],test[6],test[7],test[8]));
	movl	-16(%rbp), %r9d	# test[8], _1
	movl	-20(%rbp), %r8d	# test[7], _2
	movl	-24(%rbp), %edi	# test[6], _3
	movl	-28(%rbp), %r11d	# test[5], _4
	movl	-32(%rbp), %r10d	# test[4], _5
	movl	-36(%rbp), %ecx	# test[3], _6
	movl	-40(%rbp), %edx	# test[2], _7
	movl	-44(%rbp), %esi	# test[1], _8
	movl	-48(%rbp), %eax	# test[0], _9
	pushq	%r9	# _1
	pushq	%r8	# _2
	pushq	%rdi	# _3
	movl	%r11d, %r9d	# _4,
	movl	%r10d, %r8d	# _5,
	movl	%eax, %edi	# _9,
	call	test_mul_args	#
	addq	$24, %rsp	#,
	movl	%eax, %esi	# _10,
	leaq	.LC0(%rip), %rax	#, tmp97
	movq	%rax, %rdi	# tmp97,
	movl	$0, %eax	#,
	call	printf@PLT	#
	movl	$0, %eax	#, _18
# 3_34.c:14: }
	movq	-8(%rbp), %rdx	# D.2934, tmp100
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp100
	je	.L7	#,
	call	__stack_chk_fail@PLT	#
.L7:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
