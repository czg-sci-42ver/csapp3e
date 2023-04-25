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
	movb	$-1, -29(%rbp)
	movl	$3, -28(%rbp)
	leaq	-29(%rbp), %rax
	movq	%rax, -24(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -16(%rbp)
# test
	movq	-24(%rbp), %rdi
	#sometimes weird fail,but above works...
	#movq	-16(%rbp),%rdx
	
	#weird the before lea work,the latter fail char_int
	leaq    -0x1c(%rbp), %rsi
	#leaq    -40(%rbp), %rdx
	
	#book answer char_int
	movsbl (%rdi), %eax
	movl %eax, (%rsi)
	#self
	#movb (%rdi), %al
	## movsbl dest should be reg https://www.felixcloutier.com/x86/movsx:movsxd
	#movsbl %al,(%rdx)

	##3
	#movzbl (%rdi), %eax
	#movq %rax, (%rdx)

	##4
	#movl (%rdi), %eax
	## this works
	#movb (%rdi), %al
	#movb %al, (%rsi)
# end
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
