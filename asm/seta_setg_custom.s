	.file	"seta_setg.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$-1, -16(%rbp)
	movl	$-1, -12(%rbp)
	movq	$-1, -8(%rbp)
	movl	$4294967295, %eax
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	#add
	movl $2,%eax
	movq $-1,%rdx
	#sub $-0xfff,%eax
	sub $-1,%eax
	## test setg setb diff
	setg %cl
	sub $2,%rdx
	setb %cl
	## test $of
	movl $2,%eax
	#shlb $6,%al ## aboove `shlb $6,%al` will set of, so change one method
	movb $0x80,%al
	sub $1,%al ## `sub $1,%ax` would not set $of; and %al would

	movw $0x1,%ax
	pushw %ax
	subw $2,(%rsp) ## set CF no OF

	movw $0x7fff,%ax
	pushw %ax
	subw $0xffff,(%rsp) ## would always seen as -1, not unsigned... 0xfffff obviouly no use to generate overflow; 0x7fff-0xffff=0x7fff+1=0x8000 would set CF and OF
	#sub $0x80,%ax
	## test unsigned addition overflow.(should same with above subtraction)
	#end
	jge	.L2
	movl	$1, %edi
	call	putchar@PLT
.L2:
	cmpl	$-1, -16(%rbp)
	jne	.L3
	movl	$49, %edi
	call	putchar@PLT
.L3:
	cmpl	$0, -12(%rbp)
	js	.L4
	movl	$2, -12(%rbp)
.L4:
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
