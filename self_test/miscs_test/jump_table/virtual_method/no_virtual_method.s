	.file	"no_virtual_method.cpp"
# GNU C++17 (GCC) version 13.1.1 20230429 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 13.1.1 20230429, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.26-GMP

# warning: MPFR header version 4.2.0 differs from library version 4.2.0-p9.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -C -mtune=generic -march=x86-64
	.text
	.section	.rodata
.LC0:
	.string	"Destroying base"
	.section	.text._ZN4BaseD2Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.align 2
	.weak	_ZN4BaseD2Ev
	.type	_ZN4BaseD2Ev, @function
_ZN4BaseD2Ev:
.LFB1982:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1982
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# no_virtual_method.cpp:7:   {
	leaq	16+_ZTV4Base(%rip), %rdx	#, _1
	movq	-8(%rbp), %rax	# this, tmp84
	movq	%rdx, (%rax)	# _1, this_4(D)->_vptr.Base
# no_virtual_method.cpp:8:     std::cout << "Destroying base" << std::endl;
	leaq	.LC0(%rip), %rax	#, tmp85
	movq	%rax, %rsi	# tmp85,
	leaq	_ZSt4cout(%rip), %rax	#, tmp86
	movq	%rax, %rdi	# tmp86,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# no_virtual_method.cpp:8:     std::cout << "Destroying base" << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp88
	movq	%rdx, %rsi	# tmp87,
	movq	%rax, %rdi	# _2,
	call	_ZNSolsEPFRSoS_E@PLT	#
# no_virtual_method.cpp:9:   }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1982:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZN4BaseD2Ev,"aG",@progbits,_ZN4BaseD5Ev,comdat
.LLSDA1982:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1982-.LLSDACSB1982
.LLSDACSB1982:
.LLSDACSE1982:
	.section	.text._ZN4BaseD2Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.size	_ZN4BaseD2Ev, .-_ZN4BaseD2Ev
	.weak	_ZN4BaseD1Ev
	.set	_ZN4BaseD1Ev,_ZN4BaseD2Ev
	.section	.text._ZN4BaseD0Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.align 2
	.weak	_ZN4BaseD0Ev
	.type	_ZN4BaseD0Ev, @function
_ZN4BaseD0Ev:
.LFB1984:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# no_virtual_method.cpp:9:   }
	movq	-8(%rbp), %rax	# this, tmp82
	movq	%rax, %rdi	# tmp82,
	call	_ZN4BaseD1Ev	#
# no_virtual_method.cpp:9:   }
	movq	-8(%rbp), %rax	# this, tmp83
	movl	$8, %esi	#,
	movq	%rax, %rdi	# tmp83,
	call	_ZdlPvm@PLT	#
# no_virtual_method.cpp:9:   }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1984:
	.size	_ZN4BaseD0Ev, .-_ZN4BaseD0Ev
	.section	.text._ZN4BaseC2Ev,"axG",@progbits,_ZN4BaseC5Ev,comdat
	.align 2
	.weak	_ZN4BaseC2Ev
	.type	_ZN4BaseC2Ev, @function
_ZN4BaseC2Ev:
.LFB1987:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
# no_virtual_method.cpp:3: class Base
	leaq	16+_ZTV4Base(%rip), %rdx	#, _1
	movq	-8(%rbp), %rax	# this, tmp83
	movq	%rdx, (%rax)	# _1, this_3(D)->_vptr.Base
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1987:
	.size	_ZN4BaseC2Ev, .-_ZN4BaseC2Ev
	.weak	_ZN4BaseC1Ev
	.set	_ZN4BaseC1Ev,_ZN4BaseC2Ev
	.section	.text._ZN7DerivedC2Ei,"axG",@progbits,_ZN7DerivedC5Ei,comdat
	.align 2
	.weak	_ZN7DerivedC2Ei
	.type	_ZN7DerivedC2Ei, @function
_ZN7DerivedC2Ei:
.LFB1989:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1989
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)	# this, this
	movl	%esi, -28(%rbp)	# number, number
# no_virtual_method.cpp:16:   {
	movq	-24(%rbp), %rax	# this, _1
	movq	%rax, %rdi	# _1,
	call	_ZN4BaseC2Ev	#
# no_virtual_method.cpp:16:   {
	leaq	16+_ZTV7Derived(%rip), %rdx	#, _2
	movq	-24(%rbp), %rax	# this, tmp89
	movq	%rdx, (%rax)	# _2, this_5(D)->D.49609._vptr.Base
# no_virtual_method.cpp:17:     some_resource_ = new int(number);
	movl	$4, %edi	#,
.LEHB0:
	call	_Znwm@PLT	#
.LEHE0:
# no_virtual_method.cpp:17:     some_resource_ = new int(number);
	movl	-28(%rbp), %edx	# number, tmp91
	movl	%edx, (%rax)	# tmp91, MEM[(int *)_11]
# no_virtual_method.cpp:17:     some_resource_ = new int(number);
	movq	-24(%rbp), %rdx	# this, tmp92
	movq	%rax, 8(%rdx)	# _10, this_5(D)->some_resource_
# no_virtual_method.cpp:18:   }
	jmp	.L7	#
.L6:
	movq	%rax, %rbx	#, tmp93
	movq	-24(%rbp), %rax	# this, _3
	movq	%rax, %rdi	# _3,
	call	_ZN4BaseD2Ev	#
	movq	%rbx, %rax	# tmp93, D.53848
	movq	%rax, %rdi	# D.53848,
.LEHB1:
	call	_Unwind_Resume@PLT	#
.LEHE1:
.L7:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1989:
	.section	.gcc_except_table._ZN7DerivedC2Ei,"aG",@progbits,_ZN7DerivedC5Ei,comdat
.LLSDA1989:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1989-.LLSDACSB1989
.LLSDACSB1989:
	.uleb128 .LEHB0-.LFB1989
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L6-.LFB1989
	.uleb128 0
	.uleb128 .LEHB1-.LFB1989
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1989:
	.section	.text._ZN7DerivedC2Ei,"axG",@progbits,_ZN7DerivedC5Ei,comdat
	.size	_ZN7DerivedC2Ei, .-_ZN7DerivedC2Ei
	.weak	_ZN7DerivedC1Ei
	.set	_ZN7DerivedC1Ei,_ZN7DerivedC2Ei
	.section	.rodata
.LC1:
	.string	"Destroying derived"
	.section	.text._ZN7DerivedD2Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.align 2
	.weak	_ZN7DerivedD2Ev
	.type	_ZN7DerivedD2Ev, @function
_ZN7DerivedD2Ev:
.LFB1992:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1992
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# no_virtual_method.cpp:21:   {
	leaq	16+_ZTV7Derived(%rip), %rdx	#, _1
	movq	-8(%rbp), %rax	# this, tmp86
	movq	%rdx, (%rax)	# _1, this_6(D)->D.49609._vptr.Base
# no_virtual_method.cpp:22:     std::cout << "Destroying derived" << std::endl;
	leaq	.LC1(%rip), %rax	#, tmp87
	movq	%rax, %rsi	# tmp87,
	leaq	_ZSt4cout(%rip), %rax	#, tmp88
	movq	%rax, %rdi	# tmp88,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# no_virtual_method.cpp:22:     std::cout << "Destroying derived" << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp90
	movq	%rdx, %rsi	# tmp89,
	movq	%rax, %rdi	# _2,
	call	_ZNSolsEPFRSoS_E@PLT	#
# no_virtual_method.cpp:23:     delete some_resource_;
	movq	-8(%rbp), %rax	# this, tmp91
	movq	8(%rax), %rax	# this_6(D)->some_resource_, _11
# no_virtual_method.cpp:23:     delete some_resource_;
	testq	%rax, %rax	# _11
	je	.L9	#,
# no_virtual_method.cpp:23:     delete some_resource_;
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _11,
	call	_ZdlPvm@PLT	#
.L9:
# no_virtual_method.cpp:24:   }
	movq	-8(%rbp), %rax	# this, _3
	movq	%rax, %rdi	# _3,
	call	_ZN4BaseD2Ev	#
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1992:
	.section	.gcc_except_table._ZN7DerivedD2Ev,"aG",@progbits,_ZN7DerivedD5Ev,comdat
.LLSDA1992:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1992-.LLSDACSB1992
.LLSDACSB1992:
.LLSDACSE1992:
	.section	.text._ZN7DerivedD2Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.size	_ZN7DerivedD2Ev, .-_ZN7DerivedD2Ev
	.weak	_ZN7DerivedD1Ev
	.set	_ZN7DerivedD1Ev,_ZN7DerivedD2Ev
	.section	.text._ZN7DerivedD0Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.align 2
	.weak	_ZN7DerivedD0Ev
	.type	_ZN7DerivedD0Ev, @function
_ZN7DerivedD0Ev:
.LFB1994:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# no_virtual_method.cpp:24:   }
	movq	-8(%rbp), %rax	# this, tmp82
	movq	%rax, %rdi	# tmp82,
	call	_ZN7DerivedD1Ev	#
# no_virtual_method.cpp:24:   }
	movq	-8(%rbp), %rax	# this, tmp83
	movl	$16, %esi	#,
	movq	%rax, %rdi	# tmp83,
	call	_ZdlPvm@PLT	#
# no_virtual_method.cpp:24:   }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1994:
	.size	_ZN7DerivedD0Ev, .-_ZN7DerivedD0Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB1995:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1995
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
# no_virtual_method.cpp:32:   Base* p = new Derived(5);
	movl	$16, %edi	#,
.LEHB2:
	call	_Znwm@PLT	#
.LEHE2:
	movq	%rax, %rbx	# tmp92, _7
# no_virtual_method.cpp:32:   Base* p = new Derived(5);
	movl	$1, %r13d	#, _9
	movl	$5, %esi	#,
	movq	%rbx, %rdi	# _7,
.LEHB3:
	call	_ZN7DerivedC1Ei	#
.LEHE3:
# no_virtual_method.cpp:32:   Base* p = new Derived(5);
	movq	%rbx, -40(%rbp)	# _7, p
# no_virtual_method.cpp:33:   delete p;
	movq	-40(%rbp), %rax	# p, p.0_13
# no_virtual_method.cpp:33:   delete p;
	testq	%rax, %rax	# p.0_13
	je	.L12	#,
# no_virtual_method.cpp:33:   delete p;
	movq	(%rax), %rdx	# p.0_13->_vptr.Base, _1
	addq	$8, %rdx	#, _2
	movq	(%rdx), %rdx	# *_2, _3
	movq	%rax, %rdi	# p.0_13,
	call	*%rdx	# _3
.L12:
# no_virtual_method.cpp:34: }
	movl	$0, %eax	#, _15
	jmp	.L17	#
.L16:
# no_virtual_method.cpp:32:   Base* p = new Derived(5);
	movq	%rax, %r12	#, tmp94
	testb	%r13b, %r13b	# _9
	je	.L15	#,
# no_virtual_method.cpp:32:   Base* p = new Derived(5);
	movl	$16, %esi	#,
	movq	%rbx, %rdi	# _7,
	call	_ZdlPvm@PLT	#
.L15:
	movq	%r12, %rax	# tmp94, D.53850
	movq	%rax, %rdi	# D.53850,
.LEHB4:
	call	_Unwind_Resume@PLT	#
.LEHE4:
.L17:
# no_virtual_method.cpp:34: }
	addq	$24, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1995:
	.section	.gcc_except_table,"a",@progbits
.LLSDA1995:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1995-.LLSDACSB1995
.LLSDACSB1995:
	.uleb128 .LEHB2-.LFB1995
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB1995
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L16-.LFB1995
	.uleb128 0
	.uleb128 .LEHB4-.LFB1995
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE1995:
	.text
	.size	main, .-main
	.weak	_ZTV7Derived
	.section	.data.rel.ro.local._ZTV7Derived,"awG",@progbits,_ZTV7Derived,comdat
	.align 8
	.type	_ZTV7Derived, @object
	.size	_ZTV7Derived, 32
_ZTV7Derived:
	.quad	0
	.quad	_ZTI7Derived
	.quad	_ZN7DerivedD1Ev
	.quad	_ZN7DerivedD0Ev
	.weak	_ZTV4Base
	.section	.data.rel.ro.local._ZTV4Base,"awG",@progbits,_ZTV4Base,comdat
	.align 8
	.type	_ZTV4Base, @object
	.size	_ZTV4Base, 32
_ZTV4Base:
	.quad	0
	.quad	_ZTI4Base
	.quad	_ZN4BaseD1Ev
	.quad	_ZN4BaseD0Ev
	.weak	_ZTI7Derived
	.section	.data.rel.ro._ZTI7Derived,"awG",@progbits,_ZTI7Derived,comdat
	.align 8
	.type	_ZTI7Derived, @object
	.size	_ZTI7Derived, 24
_ZTI7Derived:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
# <anonymous>:
	.quad	_ZTS7Derived
# <anonymous>:
	.quad	_ZTI4Base
	.weak	_ZTS7Derived
	.section	.rodata._ZTS7Derived,"aG",@progbits,_ZTS7Derived,comdat
	.align 8
	.type	_ZTS7Derived, @object
	.size	_ZTS7Derived, 9
_ZTS7Derived:
	.string	"7Derived"
	.weak	_ZTI4Base
	.section	.data.rel.ro._ZTI4Base,"awG",@progbits,_ZTI4Base,comdat
	.align 8
	.type	_ZTI4Base, @object
	.size	_ZTI4Base, 16
_ZTI4Base:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
# <anonymous>:
	.quad	_ZTS4Base
	.weak	_ZTS4Base
	.section	.rodata._ZTS4Base,"aG",@progbits,_ZTS4Base,comdat
	.type	_ZTS4Base, @object
	.size	_ZTS4Base, 6
_ZTS4Base:
	.string	"4Base"
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
