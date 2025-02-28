	.file	"test_return_struct.c"
	.text
.Ltext0:
	.file 0 "/mnt/ubuntu/home/hervey/csapp3e/self_test/C12" "test_return_struct.c"
	.globl	test1
	.type	test1, @function
test1:
.LVL0:
.LFB0:
	.file 1 "test_return_struct.c"
	.loc 1 10 1 view -0
	.cfi_startproc
	.loc 1 10 1 is_stmt 0 view .LVU1
	movq	%rdi, %rax
	.loc 1 11 3 is_stmt 1 view .LVU2
	.loc 1 11 19 is_stmt 0 view .LVU3
	movabsq	$1099511627776, %rcx
	movq	%rcx, -40(%rsp)
	movabsq	$2199023255552, %rsi
	movq	%rsi, -32(%rsp)
	movabsq	$3298534883328, %rdx
	movq	%rdx, -24(%rsp)
	.loc 1 12 3 is_stmt 1 view .LVU4
	.loc 1 12 10 is_stmt 0 view .LVU5
	movdqa	-40(%rsp), %xmm0
	movups	%xmm0, (%rdi)
	movq	%rdx, 16(%rdi)
	.loc 1 13 1 view .LVU6
	ret
	.cfi_endproc
.LFE0:
	.size	test1, .-test1
	.globl	test2
	.type	test2, @function
test2:
.LFB1:
	.loc 1 17 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 18 3 view .LVU8
	.loc 1 19 1 is_stmt 0 view .LVU9
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	test2, .-test2
	.globl	test3
	.type	test3, @function
test3:
.LFB2:
	.loc 1 23 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 24 3 view .LVU11
.LVL1:
	.loc 1 25 3 view .LVU12
	.loc 1 26 3 view .LVU13
	.loc 1 26 10 is_stmt 0 view .LVU14
	fldz
	.loc 1 27 1 view .LVU15
	ret
	.cfi_endproc
.LFE2:
	.size	test3, .-test3
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB14:
	.loc 1 30 11 is_stmt 1 view -0
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 30 11 is_stmt 0 view .LVU17
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 31 2 is_stmt 1 view .LVU18
	.loc 1 32 2 view .LVU19
	.loc 1 33 2 view .LVU20
	.loc 1 33 20 is_stmt 0 view .LVU21
	movq	%rsp, %rdi
	call	test1
.LVL2:
	.loc 1 34 2 is_stmt 1 view .LVU22
	movq	(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.LVL3:
	.loc 1 35 1 is_stmt 0 view .LVU23
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	movl	$0, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.LVL4:
	.cfi_endproc
.LFE14:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1fa
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF14
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0xa
	.long	.LASF15
	.byte	0x18
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.long	0x5a
	.uleb128 0x2
	.string	"m1"
	.byte	0x3
	.long	0x5a
	.byte	0
	.uleb128 0x2
	.string	"m2"
	.byte	0x4
	.long	0x5a
	.byte	0x8
	.uleb128 0x2
	.string	"m3"
	.byte	0x5
	.long	0x5a
	.byte	0x10
	.byte	0
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0xc
	.long	0x99
	.uleb128 0xd
	.long	.LASF16
	.byte	0x2
	.value	0x164
	.byte	0xc
	.long	0x8b
	.long	0xbd
	.uleb128 0xe
	.long	0xbd
	.uleb128 0xf
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0xa0
	.uleb128 0x11
	.long	.LASF17
	.byte	0x1
	.byte	0x1e
	.byte	0x5
	.long	0x8b
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x14f
	.uleb128 0x4
	.string	"a"
	.byte	0x1f
	.byte	0xe
	.long	0x14f
	.uleb128 0x4
	.string	"b"
	.byte	0x20
	.byte	0xc
	.long	0x5a
	.uleb128 0x5
	.string	"c"
	.byte	0x21
	.byte	0x12
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.quad	.LVL2
	.long	0x1c7
	.long	0x11b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.quad	.LVL3
	.long	0xa5
	.long	0x141
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.quad	.LVL4
	.long	0x1f4
	.byte	0
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF12
	.byte	0x16
	.long	0x14f
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a9
	.uleb128 0x8
	.string	"a"
	.byte	0x18
	.long	0x14f
	.byte	0x10
	.long	0x5c28f5c3
	.long	0xc8f5c28f
	.long	0x4000
	.long	0
	.uleb128 0x8
	.string	"b"
	.byte	0x19
	.long	0x14f
	.byte	0x10
	.long	0xae147ae1
	.long	0xc47ae147
	.long	0x4001
	.long	0
	.byte	0
	.uleb128 0x13
	.long	.LASF18
	.byte	0x1
	.byte	0x10
	.byte	0x1
	.long	0x5a
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF13
	.byte	0x9
	.long	0x2e
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f4
	.uleb128 0x5
	.string	"o"
	.byte	0xb
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x14
	.long	.LASF19
	.long	.LASF19
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"long long int"
.LASF6:
	.string	"short unsigned int"
.LASF4:
	.string	"unsigned int"
.LASF14:
	.string	"GNU C17 12.2.1 20230201 -mtune=generic -march=x86-64 -g -Og"
.LASF15:
	.string	"object_t"
.LASF10:
	.string	"char"
.LASF5:
	.string	"unsigned char"
.LASF17:
	.string	"main"
.LASF9:
	.string	"long int"
.LASF3:
	.string	"long unsigned int"
.LASF13:
	.string	"test1"
.LASF18:
	.string	"test2"
.LASF12:
	.string	"test3"
.LASF16:
	.string	"printf"
.LASF19:
	.string	"__stack_chk_fail"
.LASF11:
	.string	"long double"
.LASF8:
	.string	"short int"
.LASF7:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/mnt/ubuntu/home/hervey/csapp3e/self_test/C12"
.LASF0:
	.string	"test_return_struct.c"
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
