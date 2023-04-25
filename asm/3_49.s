	.file	"3_49.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx5124fmaps -mtune=generic -march=x86-64 -O
	.text
	.globl	vframe
	.type	vframe, @function
vframe:
.LFB22:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, %rcx	# tmp109, n
# 3_49.c:4: long vframe(long n, long idx, long *q) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp112
	movq	%rax, -8(%rbp)	# tmp112, D.3920
	xorl	%eax, %eax	# tmp112
# 3_49.c:6: 	long *p[n];
	leaq	15(,%rdi,8), %rax	#, tmp94
	andq	$-16, %rax	#, tmp98
	subq	%rax, %rsp	# tmp98,
	leaq	7(%rsp), %rdi	#, tmp100
	movq	%rdi, %rax	# tmp100, tmp101
	shrq	$3, %rax	#, tmp101
	andq	$-8, %rdi	#, tmp102
# 3_49.c:7: 	p[0] = &i;
	leaq	-16(%rbp), %r8	#, tmp103
	movq	%r8, 0(,%rax,8)	# tmp103, (*p.5_12)[0]
# 3_49.c:8: 	for (i = 1; i < n; i++)
	movq	$1, -16(%rbp)	#, i
# 3_49.c:8: 	for (i = 1; i < n; i++)
	cmpq	$1, %rcx	#, n
	jle	.L2	#,
	movl	$1, %eax	#, ivtmp.18
.L3:
# 3_49.c:9: 		p[i] = q;
	movq	%rdx, (%rdi,%rax,8)	# q, MEM[(long int * *)p.5_12 + ivtmp.18_4 * 8]
# 3_49.c:8: 	for (i = 1; i < n; i++)
	addq	$1, %rax	#, ivtmp.18
	cmpq	%rax, %rcx	# ivtmp.18, n
	jne	.L3	#,
	movq	%rcx, -16(%rbp)	# n, i
.L2:
# 3_49.c:10: 	return *p[idx];
	movq	(%rdi,%rsi,8), %rax	# (*p.5_12)[idx_15(D)], (*p.5_12)[idx_15(D)]
	movq	(%rax), %rax	# *_5, <retval>
# 3_49.c:11: }
	movq	-8(%rbp), %rdx	# D.3920, tmp113
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp113
	jne	.L7	#,
	leave	
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE22:
	.size	vframe, .-vframe
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
# 3_49.c:14: }
	movl	$0, %eax	#,
	ret	
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
