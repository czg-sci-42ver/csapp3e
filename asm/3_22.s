	.file	"seta_setg_float.c"
# GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O0
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# seta_setg_float.c:8: 	src_t test_src=-1.23942;
	#movsd	.LC0(%rip), %xmm0	#, tmp85
	#movsd	%xmm0, -8(%rbp)	# tmp85, test_src
# se#ta_setg_float.c:9: 	dest_t test_dest=-2.123814;
	#movss	.LC1(%rip), %xmm0	#, tmp86
	#movss	%xmm0, -12(%rbp)	# tmp86, test_dest
	fact_do:
	movl $14, %edi
	movl $1, %esi #Set result = 1
	.L2: 
	movl %esi,%ecx
	imulq %rdi, %rsi #Compute result *= n
	movl $0,%edx
	movl %esi,%eax
	divl %edi ## test overflow according to the book
	#movq $14,%rsi
	#movq $14,%rdi
	#divq %rdi,%rsi
	cmpl %ecx,%eax
	jne .L3
	subq $1, %rdi #Decrement n
	cmpq $1, %rdi #Compare n:1
	jg .L2 
	.L3:
	nop
	jmp .L2
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	283124244
	.long	-1074539350
	.align 4
.LC1:
	.long	-1073222510
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
