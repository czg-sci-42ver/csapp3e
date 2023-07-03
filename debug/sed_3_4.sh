s/\(leaq\t-32(%rbp), \)%rax/\1%rdx/g
#s/\(leaq\t-\)32\((%rbp), \)%rax/\140\2%rdx\n\t\132\2%rdx/g
