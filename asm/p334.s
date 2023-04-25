	.file	"p317.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	gets
	.type	gets, @function
gets:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# s, s
# p317.c:7:   char *dest = s;
	movq	-24(%rbp), %rax	# s, tmp87
	movq	%rax, -8(%rbp)	# tmp87, dest
# p317.c:9:   while ((c = getchar()) != '\n' && c != EOF) {
	jmp	.L2	#
.L4:
# p317.c:10:     *dest++ = c;
	movq	-8(%rbp), %rax	# dest, dest.0_1
	leaq	1(%rax), %rdx	#, tmp88
	movq	%rdx, -8(%rbp)	# tmp88, dest
# p317.c:10:     *dest++ = c;
	movl	-12(%rbp), %edx	# c, tmp89
	movb	%dl, (%rax)	# _2, *dest.0_1
# p317.c:11:     printf("%d\n",c);
	movl	-12(%rbp), %eax	# c, tmp90
	movl	%eax, %esi	# tmp90,
	leaq	.LC0(%rip), %rax	#, tmp91
	movq	%rax, %rdi	# tmp91,
	movl	$0, %eax	#,
	call	printf@PLT	#
.L2:
# p317.c:9:   while ((c = getchar()) != '\n' && c != EOF) {
	call	getchar@PLT	#
	movl	%eax, -12(%rbp)	# tmp92, c
# p317.c:9:   while ((c = getchar()) != '\n' && c != EOF) {
	cmpl	$10, -12(%rbp)	#, c
	je	.L3	#,
# p317.c:9:   while ((c = getchar()) != '\n' && c != EOF) {
	cmpl	$-1, -12(%rbp)	#, c
	jne	.L4	#,
.L3:
# p317.c:13:   if (c == EOF && dest == s) /* No characters read */
	cmpl	$-1, -12(%rbp)	#, c
	jne	.L5	#,
# p317.c:13:   if (c == EOF && dest == s) /* No characters read */
	movq	-8(%rbp), %rax	# dest, tmp93
	cmpq	-24(%rbp), %rax	# s, tmp93
	jne	.L5	#,
# p317.c:14:     return NULL;
	movl	$0, %eax	#, _5
	jmp	.L6	#
.L5:
# p317.c:15:   *dest++ = '\0'; /* Terminate string */
	movq	-8(%rbp), %rax	# dest, dest.1_3
	leaq	1(%rax), %rdx	#, tmp94
	movq	%rdx, -8(%rbp)	# tmp94, dest
# p317.c:15:   *dest++ = '\0'; /* Terminate string */
	movb	$0, (%rax)	#, *dest.1_3
# p317.c:16:   return s;
	movq	-24(%rbp), %rax	# s, _5
.L6:
# p317.c:17: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	gets, .-gets
	.globl	echo
	.type	echo, @function
echo:
.LFB1:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# p317.c:19: void echo() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp84
	movq	%rax, -8(%rbp)	# tmp84, D.2407
	xorl	%eax, %eax	# tmp84
# p317.c:21:   gets(buf);
	leaq	-16(%rbp), %rax	#, tmp82
	movq	%rax, %rdi	# tmp82,
	call	gets	#
# p317.c:22:   puts(buf);
	leaq	-16(%rbp), %rax	#, tmp83
	movq	%rax, %rdi	# tmp83,
	call	puts@PLT	#
# p317.c:23: }
	nop	
	movq	-8(%rbp), %rax	# D.2407, tmp85
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp85
	je	.L8	#,
	call	__stack_chk_fail@PLT	#
.L8:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	echo, .-echo
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# p317.c:25:     echo();
	##add
	subq $0xf,%rsp
	movq $0xfedcbabaefcdabba,%rax
	movq %rax,(%rsp)
	vmovsd (%rsp), %xmm0
	vunpcklps %xmm0, %xmm0, %xmm0 #Replicate first vector element
	vcvtps2pd %xmm0, %xmm0
	##endu
	movl	$0, %eax	#,
	movl	$0, %eax	#, _3
# p317.c:26: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
