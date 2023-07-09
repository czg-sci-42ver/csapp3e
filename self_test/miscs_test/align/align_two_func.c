//add 5 to each element of the int array.
void add5(int a[20]);
// __attribute__((optimize("align-functions=32")))
int main(){
	int test[20] = {0};
	add5(test);
	add5(test);
	__asm__( /* Assembly function body */
"  nop \n"
// "  nop \n"
  );
	return 0;
}
// https://stackoverflow.com/questions/1912833/c-function-alignment-in-gcc ; https://gcc.gnu.org/onlinedocs/gcc-4.7.0/gcc/Function-Attributes.html#:~:text=The%20optimize%20attribute%20is%20used,to%20be%20an%20optimization%20level.
#pragma GCC push_options
#pragma GCC optimize ("align-functions=16")
void add5(int a[20]) {
	int i = 19;
	for(; i > 0; i--) {
		a[i] += 5;
	}
}
#pragma GCC pop_options