#
# makefile
#
IVERILOG = iverilog
SRCS = $(wildcard *.v)
PROGS = $(patsubst %.v,%.o,$(SRCS))
#PROGS_TEST = $(patsubst %.c,%.test,$(SRCS))
#LIBFILE = ./lib/random.c

all: $(PROGS)
	#(cd floats; make)

%.o: %.v
	$(IVERILOG) -o $@ $<

.PHONY : clean
clean:
	#(cd floats; make clean)
	find . -type f -executable -print0 | xargs -0 rm -f --

