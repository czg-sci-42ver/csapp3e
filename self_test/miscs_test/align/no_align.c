//add 5 to each element of the int array.
void add5(int a[20]);
int main(){
	int test[20] = {0};
	add5(test);
	return 0;
}
//__attribute__((optimize("align-functions=16")))
void add5(int a[20]) {
	int i = 19;
	for(; i > 0; i--) {
		a[i] += 5;
	}
}
