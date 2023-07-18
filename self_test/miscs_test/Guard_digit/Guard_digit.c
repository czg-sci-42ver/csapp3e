#include <stdio.h>
int main(){
   double a;
   int i;

   a = 0.20000; 
   a += 0.10000; 
   a -= 0.30000;
   printf("i=%d, a=%f\n", i, a);

   for (i = 0; a < 1.0; i++) 
   {
       a += a;
	   printf("i=%d, a=%f\n", i, a);
   }	
   printf("i=%d, a=%f\n", i, a);

   return 0;
}
