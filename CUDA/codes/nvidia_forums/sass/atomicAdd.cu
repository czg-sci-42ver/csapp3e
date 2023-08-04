// https://forums.developer.nvidia.com/t/question-about-atomic-add-sass/62444
__global__ void Test(double* biubiu)
{
    double x = 1.23;
    atomicAdd(biubiu, x);
}
int main(){
}
