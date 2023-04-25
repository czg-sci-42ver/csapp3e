	.file	"problem_3_5.c"
	.text
	.globl	decode1
	.type	decode1, @function
decode1:
.LFB0:
	.cfi_startproc
	movq	(%rdi), %r8
	movq	(%rsi), %rcx
	movq	(%rdx), %rax
	movq	%r8, (%rsi)
	movq	%rcx, (%rdx)
	movq	%rax, (%rdi)
	#self test
	## fig 3.11
	leaq (%rdx,%rdx,2), %rax
	## pro 3.9
	sarq %cl, %rax
	sarq %ecx, %rax
	## pro 3.11
	xorq %rcx,%rcx
	movq $0,%rcx
	#end
	ret
	.cfi_endproc
.LFE0:
	.size	decode1, .-decode1
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	scale
	.type	scale, @function
#arith3:
#orq %rsi, %rdx
#sarq $9, %rdx
#notq %rdx
#movq %rdx, %bax
#subq %rsi, %rbx
#ret
scale:
.LFB2:
	.cfi_startproc
	leaq	(%rdi,%rsi,4), %rax
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rax,%rdx,4), %rax
	ret
	.cfi_endproc
.LFE2:
	.size	scale, .-scale
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
