// https://stackoverflow.com/a/6577896/21294350

#include <stdio.h>
#include <stdint.h>

static inline void clflush(volatile void *p)
{
    asm volatile ("clflush (%0)" :: "r"(p));
}

static inline uint64_t rdtsc()
{
    unsigned long a, d;
    asm volatile ("rdtsc" : "=a" (a), "=d" (d));
    return a | ((uint64_t)d << 32);
}

volatile int i;

/*
 * `inline void` with `gcc -std=gnu89` by https://blahg.josefsipek.net/?p=529 or adding `extern ...` by https://gcc.gnu.org/onlinedocs/gcc/Inline.html#Inline
 * */
// extern inline void test();
static inline void
test()
{
    uint64_t start, end;
    volatile int j;

    start = rdtsc();
    j = i;
    end = rdtsc();
    printf("took %lu ticks\n", end - start);
}
/*
 * or just define after inline by https://stackoverflow.com/a/16245669/21294350 
 * */
// void test();

int
main(int ac, char **av)
{
    test();
    test();
    printf("flush: ");
    clflush(&i);
    test();
    test();
    test();
    return 0;
}
