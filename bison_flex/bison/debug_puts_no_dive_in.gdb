# this where 'text' got outputed -> `printf("%s\n",test_str);` in 'snazzle.tab.c'
br *yyparse+2068
# catch when the 'stdout->_IO_write_end' was changed
watch *(char*)stdout->_IO_write_end!='!'
disable 2
c
# # enable 2
awd stdout->_IO_write_end
disable 3
# rc
we stdout->_IO_write_ptr
we stdout->_IO_write_base
# # because puts call write syscall
# br write
# c
we stdout->_IO_buf_end
we stdout->_IO_read_ptr
# br _IO_new_file_overflow
# rc
we stdout->_flags
we stdout->_mode
# # f->_flags & _IO_NO_WRITES -> 0
# p f->_flags & 0x0008
# # f->_flags & _IO_CURRENTLY_PUTTING != 0
# p f->_flags & 0x0800
# # #define _IO_in_backup(fp) ((fp)->_flags & _IO_IN_BACKUP) -> 0
# p f->_flags & 0x0100
# # f->_flags & (_IO_LINE_BUF | _IO_UNBUFFERED)
# # https://stackoverflow.com/questions/61842165/how-to-check-the-buffer-type-of-an-output-stream
# p f->_flags & (0x0002|0x0200)