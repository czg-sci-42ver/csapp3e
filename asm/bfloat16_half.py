"""
test gdb xmm0,etc encoding
from https://stackoverflow.com/questions/1425493/convert-hex-to-binary
format:
use '0' fill and '>' align https://docs.python.org/3/library/string.html#grammar-token-format-spec-fill refered by https://peps.python.org/pep-0498/
"""
def my_double(annotate_str,hex_num,bits,exp_size):
    
    my_hexdata = f'{hex_num:0>{bits}b}'
    sign=int(my_hexdata[0],2)
    exp=int(my_hexdata[1:exp_size+1],2)
    frac=int(my_hexdata[exp_size+1:bits],2)/2**my_hexdata[exp_size+1:bits].__len__()
    double_num = (-1)**(sign)*(1+frac)*2**(exp-(2**(exp_size-1)-1))
    print(annotate_str,double_num)
    # exp_bin=bin(int(my_hexdata[1:11],2))
    # frac_bin=bin(int(my_hexdata[exp_size+1:63],2))
    # print(sign,exp_bin,frac,int(frac_bin,2),int(frac_bin,2)-1023)

    # print(type(bin(int(my_hexdata, scale))[0:2]),bin(int(my_hexdata, scale))[2:].zfill(num_of_bits))
    # binary_string=
my_double("float",0x10e02214,32,8)
my_double("float->double in gcc",0x4003be76c0000000,64,11)
my_double("float->double in gcc",0x3ffccccccccccccd,64,11)
my_double("float->double in gcc",0x4040000000000000,64,11)
my_double("half-precision",0xbe76,16,5)
my_double("bfloat16",0xbe76,16,8)
"""
test imul instruction
see https://peps.python.org/pep-3101/ & https://peps.python.org/pep-0498/#format-specifiers
"""
hex_size=64*2/4
imul=0x555555557dd8*0x7fffffffdf84
imul_low=imul&((1 << 64)-1)
imul_high=(imul&(((1 << 64)-1)<<64))>>64
# print(hex_size)
print(f'{imul:0>{int(hex_size)}x} \nimul_high:{imul_high:0>16x} high_mask:{((1 << 64)-1)<<64:x}\nimul_low:{imul_low:16x} low_mask:{(1 << 64)-1:x}')
"""
miscs
"""
print("size ",(len("0xc007ec92")-2)*4)
print("byte size ",len("0008000000000000")/2)
print("byte size ",len("000d000d000d")/2)
print("byte size ",len("0c0200000000000000")/2)
import math
print("factorial 14!",math.factorial(14),": equal to 87178291200",87178291200==math.factorial(14))