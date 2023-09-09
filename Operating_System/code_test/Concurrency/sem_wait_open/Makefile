SRCS = $(wildcard *.c)
PROGS = $(patsubst %.c,%.out,$(SRCS))
CC = gcc
CFLAGS = -m64 -pthread -g
all: ${PROGS}

%.out: %.c
	$(CC) $(CFLAGS) -o $@ $<
