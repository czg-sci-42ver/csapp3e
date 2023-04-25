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
	#mod
	subq %rsi, %rbx
	## fig 3.12
	imulq %rcx
	## p236
	#movxlq 0xffffffff,%rdi
	movl $0x2,%esi
	movl $0xffffffff,%edi
	movswq %di,%rdi
	### set address 
	push %rdx
	sub $0x8,%rsp
	movq %rsp,%rcx
	sub $0x8,%rsp
	movq %rsp,%rdx

	movq %rdx, %r8 #Copy qp
	movq %rdi, %rax #Move x to lower 8 bytes of dividend
	cqto #Sign-extend to upper 8 bytes of dividend to use `idivq`
	idivq %rsi #Divide by y
	movq %rax, (%r8) #Store quotient at qp
	movq %rdx, (%rcx)
	## pro 3.12
	#movxlq 0xffffffff,%rdi
	movl $0x45,%esi
	xor %rdi,%rdi
	notq %rdi
	### set address 
	push %rdx
	sub $0x8,%rsp
	movq %rsp,%rcx
	sub $0x8,%rsp
	movq %rsp,%rdx

	movq %rdx, %r8 #Copy qp
	movq %rdi, %rax #Move x to lower 8 bytes of dividend
	xor %rdx,%rdx
	divq %rsi #Divide by y
	movq %rax, (%r8) #Store quotient at qp
	movq %rdx, (%rcx)
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
