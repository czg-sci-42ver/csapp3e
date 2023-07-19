/*
 * https://stackoverflow.com/a/4826873/21294350
 */
#include <stdlib.h>
#include <stdio.h>

int main()
{
	char* float_num_str = "0x1.91eb86";
	char** float_int_ptr = (char**)malloc(sizeof(char*));
	*float_int_ptr = (char*)malloc(20*sizeof(char));
	/*
	 * float_int_ptr will be changed in `strtod`
	 * So deep copy it to cp_ptr and free the cp_ptr (here `cp_ptr` is `float_num_str_cp`)
	 */
	char* float_num_str_cp = *float_int_ptr;
	/*https://www.tutorialspoint.com/c_standard_library/c_function_strtod.htm*/
	double float_num = strtod(float_num_str,float_int_ptr);
	printf("%f\n",float_num);
	free(float_num_str_cp);
	free(float_int_ptr);
}
