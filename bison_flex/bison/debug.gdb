# this where 'text' got outputed -> `printf("%s\n",test_str);` in 'snazzle.tab.c'
br *yyparse+2068
# catch when the 'stdout->_IO_write_end' was changed
watch *(char*)stdout->_IO_write_end!='!'
disable 2
c
enable 2
awd stdout->_IO_write_end
rc
we stdout->_IO_write_ptr
we stdout->_IO_write_base
