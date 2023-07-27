	.file	"_mm256_set1_epi8.cpp"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6625:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE6625:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
