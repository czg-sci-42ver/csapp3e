	.text
	.file	"seta_setg.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$-1, -8(%rbp)
	movl	$-1, -12(%rbp)
	movl	$-2147483648, -28(%rbp)         # imm = 0x80000000
	movl	-28(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, %eax
                                        # kill: def $rax killed $eax
	movabsq	$4294967296, %rcx               # imm = 0x100000000
	cmpq	%rcx, %rax
	jle	.LBB0_2
# %bb.1:
	movl	$1, %edi
	callq	putchar@PLT
.LBB0_2:
	movq	$-1, -24(%rbp)
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movq	%rax, -24(%rbp)
	cmpq	$-1, -24(%rbp)
	jge	.LBB0_4
# %bb.3:
	movl	$1, %edi
	callq	putchar@PLT
.LBB0_4:
	cmpl	$-1, -8(%rbp)
	jb	.LBB0_6
# %bb.5:
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_6:
	cmpl	$-1, -12(%rbp)
	jle	.LBB0_8
# %bb.7:
	movl	$2, -12(%rbp)
.LBB0_8:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"1"
	.size	.L.str, 2

	.ident	"clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym putchar
	.addrsig_sym printf
