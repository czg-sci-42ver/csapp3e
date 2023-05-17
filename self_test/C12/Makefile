CFLAGS = -g -Wall -Og
LDLIBS = -lm
SRCS = $(wildcard *.c)
PROGS = $(patsubst %.c,%,$(SRCS))
PROG_NO_LINKS = $(patsubst %.c,%.o,$(SRCS))
PROG_ASM = $(patsubst %.c,%.s,$(SRCS))
all: $(PROGS) $(PROG_NO_LINKS) $(PROG_ASM) 
%: %.c
	$(CC) $(CFLAGS) -o $@ $< 
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< 
%.s: %.c
	$(CC) $(CFLAGS) -S -o $@ $< 
