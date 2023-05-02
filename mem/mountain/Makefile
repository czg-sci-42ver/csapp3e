CC = gcc
# http://jdebp.info/FGA/predefined-macros-processor.html or https://stackoverflow.com/questions/152016/detecting-cpu-architecture-compile-time
# CFLAGS = -Wall -O3 -D__i386__	
# CFLAGS = -Wall -O3 -D__x86_64__
# CFLAGS = -Wall -O3 -D__amd64__
# https://wiki.gentoo.org/wiki/Safe_CFLAGS#Ryzen_.28Zen_family.29
CFLAGS = -Wall -O3 -march=znver2 -pipe

mountain: mountain.c fcyc2.c clock.c
	$(CC) $(CFLAGS) -o mountain mountain.c fcyc2.c clock.c 

clean:
	rm -f mountain *.o *~


