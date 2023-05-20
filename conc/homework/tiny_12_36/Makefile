CC = gcc
CFLAGS = -O2 -Wall -I . -g

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different.
LIB = -lpthread

# https://stackoverflow.com/questions/55500865/how-to-append-lists-in-makefile-using-loops
#SRCS = $(wildcard tiny[_a-zA-Z]*.c)
#SRCS += tiny.c
# https://stackoverflow.com/questions/65518363/how-to-append-to-a-list-of-variables-in-a-makefile
SRCS = $(shell ls | grep -e 'tiny[_a-zA-Z]*.c')
PROGS = $(patsubst %.c,%,$(SRCS))
$(info prog $(PROGS) $(SRCS) $(LIB))

all: cgi $(PROGS) csapp.o format

tiny: tiny.c csapp.o
	$(CC) $(CFLAGS) -o tiny tiny.c csapp.o $(LIB)

#tiny_mod: tiny_mod.c csapp.o
#	$(CC) $(CFLAGS) -o tiny_mod tiny_mod.c csapp.o $(LIB)

%: %.c
	$(CC) $(CFLAGS) -o $@ $< csapp.o $(LIB)

csapp.o: csapp.c
	$(CC) $(CFLAGS) -c csapp.c

cgi:
	(cd cgi-bin; make)

clean:
	rm -f *.o tiny *~
	(cd cgi-bin; make clean)
format:
	(clang-format -i *.c --style=Google)
