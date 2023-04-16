	.file	"check_cet_supported.c"
	.text
	.globl	cpu_supports_cet_shadow_stack
	.type	cpu_supports_cet_shadow_stack, @function
cpu_supports_cet_shadow_stack:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$7, %eax
	movl	$0, %edx
	movl	%edx, %ecx
#APP
# 7 "check_cet_supported.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -24(%rbp)
	movl	%esi, -20(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%edx, -12(%rbp)
	movl	-16(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	cpu_supports_cet_shadow_stack, .-cpu_supports_cet_shadow_stack
	.globl	cpu_supports_cet_ibt
	.type	cpu_supports_cet_ibt, @function
cpu_supports_cet_ibt:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$7, %eax
	movl	$0, %edx
	movl	%edx, %ecx
#APP
# 13 "check_cet_supported.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -24(%rbp)
	movl	%esi, -20(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%edx, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$1048576, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	cpu_supports_cet_ibt, .-cpu_supports_cet_ibt
	.section	.rodata
	.align 8
.LC0:
	.string	"test Caller-saved registers %d %d %d "
.LC1:
	.string	"CET Shadow Stack is supported"
.LC2:
	.string	"CET IBT is supported"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	cpu_supports_cet_shadow_stack@PLT
	testl	%eax, %eax
	je	.L6
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L6:
	movl	$0, %eax
	call	cpu_supports_cet_ibt@PLT
	testl	%eax, %eax
	je	.L7
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L7:
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
