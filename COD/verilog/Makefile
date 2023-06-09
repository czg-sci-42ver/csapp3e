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
	# echo to make status success if '! test' fails
	(! test -d build && echo "mkdir build" && mkdir build;echo)
	$(IVERILOG) -o build/$@ $<

.PHONY : clean
clean:
	#(cd floats; make clean)
	find . -type f -executable -print0 | xargs -0 rm -f --

