CC = gcc
CFLAGS = -O2 -Wall -I .

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different.
LIB = -lpthread
SRCS = $(wildcard tiny[_a-zA-Z]*.c)
PROGS = $(patsubst %.c,%,$(SRCS))

all: cgi $(PROGS) csapp.o

#tiny: tiny.c csapp.o
#	$(CC) $(CFLAGS) -o tiny tiny.c csapp.o $(LIB)
#
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

