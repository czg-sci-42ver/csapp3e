start
br *main+13
#we *p
# https://sourceware.org/gdb/onlinedocs/gdb/Convenience-Vars.html
set var $ptr_uninit = p
we $ptr_uninit
until *main+23
set var $ptr=$rax
#set var $vptr=(void*)((void*)$rax[0])
we $ptr
until *main+40
si
we (void*)(this[0])
until *Derived::Derived+28
until *Derived::Derived+40
disassemble
disassemble *main+45
fin
si
until *main+58
#d-- $rip
disassemble /r *(long*)((void*)p[0]+0x8)

# weird this won't watch data at the addr ; https://stackoverflow.com/a/31202563/21294350
#awatch *(long*)$ptr_uninit

#x/100x $rip
#br +1
#c
#x/100x p

