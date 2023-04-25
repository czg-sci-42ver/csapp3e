cel2fahr:
vmulsd .LC2(%rip), %xmm0, %xmm0 #Multiply by 1.8
vaddsd .LC3(%rip), %xmm0, %xmm0 #Add 32.0
ret
.LC2:
.long 3435973837 #Low-order 4 bytes of 1.8
.long 1073532108 #High-order 4 bytes of 1.8
.LC3:
.long 0 #Low-order 4 bytes of 32.0
.long 1077936128 #High-order 4 bytes of 32.0
