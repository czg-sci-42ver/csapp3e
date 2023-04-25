// Build with: gcc -m32 -no-pie -g -o plt plt.c

typedef char src_t ;
typedef int dest_t;

//3
//typedef unsigned char src_t ;
//typedef long dest_t;

//4
//typedef int src_t ;
//typedef char dest_t;

int main() {
	src_t *sp;
	dest_t *dp;
	src_t test_src=-1;
	//src_t test_src=1;
	dest_t test_dest=3;
	//3
	//dest_t test_dest=1<<63;
	sp=&test_src;
	dp=&test_dest;
}
