#
# makefile
#
CC = gcc
CFLAGS = -m64 -pthread -I ../../include ../../src/csapp.c
SRCS = $(wildcard *.c)
PROGS = $(patsubst %.c,%,$(SRCS))
PROGS_TEST = $(patsubst %.c,%.test,$(SRCS))

all: $(PROGS) 

%: %.c
	$(CC) $(CFLAGS) -o $@ $< 

test:
	(cd cgi-bin; make test)

.PHONY : clean
clean:
	(cd cgi-bin; make clean)
	find . -type f -executable -print0 | xargs -0 rm -f --
