	.file	"3_48.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.globl	len
	.type	len, @function
len:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
# 3_48.c:5: 	return strlen(s);
	movq	-8(%rbp), %rax	# s, tmp85
	movq	%rax, %rdi	# tmp85,
	call	strlen@PLT	#
# 3_48.c:6: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	len, .-len
	.section	.rodata
.LC0:
	.string	"%ld"
	.text
	.globl	iptoa
	.type	iptoa, @function
iptoa:
.LFB7:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# s, s
	movq	%rsi, -32(%rbp)	# p, p
# 3_48.c:8: 	long val = *p;
	movq	-32(%rbp), %rax	# p, tmp82
	movq	(%rax), %rax	# *p_2(D), tmp83
	movq	%rax, -8(%rbp)	# tmp83, val
# 3_48.c:9: 	sprintf(s, "%ld", val);
	movq	-8(%rbp), %rdx	# val, tmp84
	movq	-24(%rbp), %rax	# s, tmp85
	leaq	.LC0(%rip), %rcx	#, tmp86
	movq	%rcx, %rsi	# tmp86,
	movq	%rax, %rdi	# tmp85,
	movl	$0, %eax	#,
	call	sprintf@PLT	#
# 3_48.c:10: }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	iptoa, .-iptoa
	.globl	intlen
	.type	intlen, @function
intlen:
.LFB8:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# x, x
# 3_48.c:11: int intlen(long x) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	movq	%rax, -8(%rbp)	# tmp89, D.2937
	xorl	%eax, %eax	# tmp89
# 3_48.c:14: 	v = x;
	movq	-40(%rbp), %rax	# x, tmp84
	movq	%rax, -32(%rbp)	# tmp84, v
# 3_48.c:15: 	iptoa(buf, &v);
	leaq	-32(%rbp), %rdx	#, tmp85
	leaq	-20(%rbp), %rax	#, tmp86
	movq	%rdx, %rsi	# tmp85,
	movq	%rax, %rdi	# tmp86,
	call	iptoa	#
# 3_48.c:16: 	return len(buf);
	leaq	-20(%rbp), %rax	#, tmp87
	movq	%rax, %rdi	# tmp87,
	call	len	#
# 3_48.c:17: }
	movq	-8(%rbp), %rdx	# D.2937, tmp90
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	je	.L6	#,
	call	__stack_chk_fail@PLT	#
.L6:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	intlen, .-intlen
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# argc, argc
	movq	%rsi, -16(%rbp)	# argv, argv
	movl	$0, %eax	#, _1
# 3_48.c:20: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
