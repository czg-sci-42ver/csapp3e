	.file	"problem_3_4.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$1, -26(%rbp)
	movb	$1, -25(%rbp)
	leaq	-26(%rbp), %rax
	movq	%rax, -24(%rbp)
	leaq	-25(%rbp), %rax
	movq	%rax, -16(%rbp)
	#self_add
	#leaq	-24(%rbp),%rdi
	#leaq	-16(%rbp),%rsi
	movq	-24(%rbp),%rdi
	movq	-16(%rbp),%rsi

	#end
	movq (%rdi), %rax
	movq %rax, (%rsi)
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
