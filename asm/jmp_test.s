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
	movsd	.LC0(%rip), %xmm0	#, tmp85
	movsd	%xmm0, -8(%rbp)	# tmp85, test_src
# seta_setg_float.c:9: 	dest_t test_dest=-2.123814;
	movss	.LC1(%rip), %xmm0	#, tmp86
	movss	%xmm0, -12(%rbp)	# tmp86, test_dest
	## add
	jmp *%rax
	vcvtsi2ss %edi, %xmm1, %xmm2
	vmulsd %xmm0, %xmm1, %xmm0 #Multiply a by x
	vcvtsi2sd %edi, %xmm1, %xmm1 #Convert i to double
	vdivsd %xmm1, %xmm2, %xmm2
	## end
# seta_setg_float.c:10: 	if(test_src<test_dest){
	pxor	%xmm0, %xmm0	# _1
	cvtss2sd	-12(%rbp), %xmm0	# test_dest, _1
# seta_setg_float.c:10: 	if(test_src<test_dest){
	comisd	-8(%rbp), %xmm0	# test_src, _1
	jbe	.L2	#,
# seta_setg_float.c:11: 		putchar(41);
	movl	$41, %edi	#,
	call	putchar@PLT	#
.L2:
	movl	$0, %eax	#, _7
# seta_setg_float.c:13: }
	leave	
	.cfi_def_cfa 7, 8
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
