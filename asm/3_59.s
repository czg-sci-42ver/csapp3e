store_prod:
movq %rdx, %rax ;
cqto ;rdx=0
movq %rsi, %rcx
sarq $63, %rcx ;x sign 0xff.. / 0x0 
imulq %rax, %rcx ; +/- y
imulq %rsi, %rdx ; x*y
addq %rdx, %rcx ;
mulq %rsi ;x*y
addq %rcx, %rdx ;
movq %rax, (%rdi)
movq %rdx, 8(%rdi)
ret
