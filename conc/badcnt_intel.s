	.file	"badcnt.c"
	.intel_syntax noprefix
	.text
	.globl	thread
	.type	thread, @function
thread:
.LFB27:
	.cfi_startproc
	mov	rcx, QWORD PTR [rdi]
	test	rcx, rcx
	jle	.L2
	mov	edx, 0
.L3:
	mov	rax, QWORD PTR cnt[rip]
	add	rax, 1
	mov	QWORD PTR cnt[rip], rax
	add	rdx, 1
	cmp	rcx, rdx
	jne	.L3
.L2:
	mov	eax, 0
	ret
	.cfi_endproc
.LFE27:
	.size	thread, .-thread
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"usage: %s <niters>\n"
.LC1:
	.string	"BOOM! cnt=%ld\n"
.LC2:
	.string	"OK cnt=%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 40
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	cmp	edi, 2
	je	.L6
	mov	rsi, QWORD PTR [rsi]
	lea	rdi, .LC0[rip]
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
.L6:
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	cdqe
	mov	QWORD PTR [rsp], rax
	mov	rbp, rsp
	lea	rdi, 8[rsp]
	mov	rcx, rbp
	lea	rbx, thread[rip]
	mov	rdx, rbx
	mov	esi, 0
	call	Pthread_create@PLT
	lea	rdi, 16[rsp]
	mov	rcx, rbp
	mov	rdx, rbx
	mov	esi, 0
	call	Pthread_create@PLT
	mov	esi, 0
	mov	rdi, QWORD PTR 8[rsp]
	call	Pthread_join@PLT
	mov	esi, 0
	mov	rdi, QWORD PTR 16[rsp]
	call	Pthread_join@PLT
	mov	rdx, QWORD PTR cnt[rip]
	mov	rax, QWORD PTR [rsp]
	add	rax, rax
	cmp	rax, rdx
	je	.L7
	mov	rsi, QWORD PTR cnt[rip]
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
.L8:
	mov	edi, 0
	call	exit@PLT
.L7:
	mov	rsi, QWORD PTR cnt[rip]
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L8
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.globl	cnt
	.bss
	.align 8
	.type	cnt, @object
	.size	cnt, 8
cnt:
	.zero	8
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
