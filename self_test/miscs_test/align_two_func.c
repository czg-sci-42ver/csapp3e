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
#pragma GCC push_options
#pragma GCC optimize ("align-functions=16")
void add5(int a[20]) {
	int i = 19;
	for(; i > 0; i--) {
		a[i] += 5;
	}
}
#pragma GCC pop_options