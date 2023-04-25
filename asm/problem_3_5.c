#include <stdint.h>
typedef unsigned __int128 uint128_t;
void decode1(long *xp, long *yp, long *zp)
{
long x = *xp;
long y = *yp;
long z = *zp;
*yp = x;
*zp = y;
*xp = z;
}
void store_uprod(uint128_t *dest, uint64_t x, uint64_t y) {
*dest = x * (uint128_t) y;
}
int main(){}

// p229
long scale(long x, long y, long z) {
long t = x + 4 * y + 12 * z; 
return t;
}
