#
# makefile
#
CC = gcc
CFLAGS = -m64 -pthread -I ../../include ../../src/csapp.c
SRCS = $(wildcard *.c)
TFGETS_SRCS = $(wildcard tfgets*.c)
PROGS = $(patsubst %.c,%,$(SRCS))
TFGETS_PROGS = $(patsubst %.c,%,$(TFGETS_SRCS))
PROGS_TEST = $(patsubst %.c,%.test,$(SRCS))

all: $(PROGS) tiny

12_22: echo_12_22.o 12_22.o
	$(CC) $(CFLAGS) -o $@ $?
# https://unix.stackexchange.com/questions/665571/how-do-i-ignore-a-file-using-makefile-wildcard
echo_12_22:
	: do nothing for $@
tfgets%: tfgets%.c
	$(CC) $(CFLAGS) -o $@ $< ../tfgets-main.c 
%.o: %.c
	$(CC) $(CFLAGS) -c $@ $< 
%: %.c
	$(CC) $(CFLAGS) -o $@ $< 

test:
	(cd cgi-bin; make test)

.PHONY : clean
clean:
	(cd cgi-bin; make clean)
	find . -type f -executable -print0 | xargs -0 rm -f --
# https://stackoverflow.com/questions/589276/how-can-i-use-bash-syntax-in-makefile-targets
#tiny: SHELL:=/bin/bash
tiny:
	for i in $$(find . -name tiny*);do cd $$i;make --always-make;done
