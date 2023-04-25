# test
	movq	-24(%rbp), %rdi
	#sometimes weird fail,but above works...
	#movq	-16(%rbp),%rdx
	
	#weird the before lea work,the latter fail char_int
	leaq    -0x1c(%rbp), %rsi
	#leaq    -40(%rbp), %rdx
	
	#book answer char_int
	movsbl (%rdi), %eax
	movl %eax, (%rsi)
	#self
	#movb (%rdi), %al
	## movsbl dest should be reg https://www.felixcloutier.com/x86/movsx:movsxd
	#movsbl %al,(%rdx)

	##3
	#movzbl (%rdi), %eax
	#movq %rax, (%rdx)

	##4
	#movl (%rdi), %eax
	## this works
	#movb (%rdi), %al
	#movb %al, (%rsi)
# end
