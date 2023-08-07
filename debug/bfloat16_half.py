"""
Tips for programming:
1. use ``:=`` to assign value in `if` see https://peps.python.org/pep-0572/
2. lambda as anonymous functions https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions
"""

"""
test gdb xmm0,etc encoding
from https://stackoverflow.com/questions/1425493/convert-hex-to-binary
format:
use '0' fill and '>' align https://docs.python.org/3/library/string.html#grammar-token-format-spec-fill refered by https://peps.python.org/pep-0498/
"""


import math

import copy
import sys
import re
def my_double(annotate_str, hex_num, bits, exp_size):
    my_hexdata = f'{hex_num:0>{bits}b}'
    sign = int(my_hexdata[0], 2)
    exp = int(my_hexdata[1:exp_size+1], 2)
    frac = int(my_hexdata[exp_size+1:bits], 2) / \
        2**my_hexdata[exp_size+1:bits].__len__()
    double_num = (-1)**(sign)*(1+frac)*2**(exp-(2**(exp_size-1)-1))
    print(annotate_str, double_num)
    # exp_bin=bin(int(my_hexdata[1:11],2))
    # frac_bin=bin(int(my_hexdata[exp_size+1:63],2))
    # print(sign,exp_bin,frac,int(frac_bin,2),int(frac_bin,2)-1023)

    # print(type(bin(int(my_hexdata, scale))[0:2]),bin(int(my_hexdata, scale))[2:].zfill(num_of_bits))
    # binary_string=
my_double("float", 0x10e02214, 32, 8)
my_double("float->double in gcc", 0x4003be76c0000000, 64, 11)
my_double("float->double in gcc", 0x3ffccccccccccccd, 64, 11)
my_double("float->double in gcc", 0x4040000000000000, 64, 11)
my_double("half-precision", 0xbe76, 16, 5)
my_double("bfloat16", 0xbe76, 16, 8)
"""
COD riscv 2nd 3.12 1
"""
my_double("binary32", 0b00000001010010110010100000100011, 32, 8)

"""
COD 3.11 guard digit
Also see /mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/Guard_digit scripts.
https://stackoverflow.com/questions/76709959/is-there-one-way-to-alleviate-roundoff-errors/76712236#comment135245352_76712236
https://en.wikipedia.org/wiki/Extended_precision#x86_extended_precision_format

set precision
https://stackoverflow.com/questions/40808511/doing-accurate-floating-point-division-in-python-3
https://www.digitalocean.com/community/tutorials/python-decimal-division-round-precision

[/mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/Guard_digit]$ nopie_gcc Guard_digit_changed.c -std=c99 -mfpmath=sse -o Guard_digit_changed.o -pedantic -O0 -g
$ gdb ./Guard_digit_changed.o -ex "start" -ex "br *main+127" -ex "c" -ex "x/12g 0x402030"
!0x00000000004011b5  main+127 fld    TBYTE PTR [rip+0xea5]        # 0x402060
 0x00000000004011bb  main+133 fstp   TBYTE PTR [rbp-0x10]
 0x00000000004011be  main+136 fld    TBYTE PTR [rbp-0x10]
 0x00000000004011c1  main+139 fld    TBYTE PTR [rip+0xea9]        # 0x402070
...
0x402030:       0xccccccccccccd000      0x3ffc
0x402040:       0xccccccccccccd000      0x3ffb
0x402050:       0x9999999999999800      0x3ffd
0x402060:       0xcccccccccccccccd      0x3ffc
0x402070:       0xcccccccccccccccd      0x3ffb
0x402080:       0x999999999999999a      0x3ffd
"""
bits = 80
import decimal 
decimal.getcontext().prec = 100
def parse_long_double(annotate_str, hex_num, bits, exp_size):
    print('------------------',annotate_str,'----------------')
    my_bin = f'{hex_num:0>{bits}b}'
    print("long double ",hex(hex_num)," to ",my_bin)
    sign = int(my_bin[0])
    print("sign: ",sign)
    exp = my_bin[1:exp_size+1]
    if exp == '1'*15 or exp == '0'*15:
        exit("maybe need to change the calculation process")
    print("exp len: ",len(exp))
    exp_int = int(exp,2)
    exp_bias = exp_int-16383
    print("exponent: ",exp," int: ",exp_int," after minus 16383: ",exp_bias)
    integer = int(my_bin[exp_size+1])
    print("integer part: ",integer)
    frac = decimal.Decimal(int(my_bin[exp_size+1+1:bits], 2)) / decimal.Decimal(2**63)
    # print("frac: ",float(frac))
    
    # frac_str = '{0:30f}'.format(int(my_bin[exp_size+1+1:bits], 2) / (2**63))
    # print("frac_str ", frac_str)
    # frac = float(frac_str)
    
    m = integer+frac
    print("frac: ",my_bin[exp_size+1+1:])
    print("m: ",m)
    result = m*decimal.Decimal(2**(exp_bias)*(-1)**(sign))
    # print("num: {0:.80f}".format(m*decimal.Decimal(2**(exp_bias)*(-1)**(sign))))
    print("num: ",result)
    print('------------------','end of ',annotate_str,'----------------')
    return result
def parse_long_hex(str_1,str_2) -> tuple[int,str]:
    num_str = str_1+str_2.replace('0x', '')
    return int(num_str,0),num_str
hex_num,num_str=parse_long_hex('0x3ffc','0xcccccccccccccccd')
result_1 =parse_long_double(num_str,hex_num,bits,15)
hex_num,num_str=parse_long_hex('0x3ffb','0xcccccccccccccccd')
result_2 =parse_long_double(num_str,hex_num,bits,15)
hex_num,num_str=parse_long_hex('0x3ffd','0x999999999999999a')
result_3 =parse_long_double(num_str,hex_num,bits,15)
if (result_1+result_2!=result_3):
    print("the answer not equals, so equation in C is approximation","\n"+"-"*70)

"""
test imul instruction
see https://peps.python.org/pep-3101/ & https://peps.python.org/pep-0498/#format-specifiers
"""
hex_size = 64*2/4
imul = 0x555555557dd8*0x7fffffffdf84
imul_low = imul & ((1 << 64)-1)
imul_high = (imul & (((1 << 64)-1) << 64)) >> 64
# print(hex_size)
print(f'{imul:0>{int(hex_size)}x} \nimul_high:{imul_high:0>16x} high_mask:{((1 << 64)-1)<<64:x}\nimul_low:{imul_low:16x} low_mask:{(1 << 64)-1:x}')
"""
problem 6.13
"""


def my_cache(annotate_str, hex_num, bits, total_bits, tag_size, set_size):
    my_hexdata = f'{hex_num:0>{total_bits}b}'
    tag_start = total_bits-bits
    tag_end = tag_start+tag_size
    set_end = tag_end+set_size
    tag = hex(int(my_hexdata[tag_start:tag_end], 2))
    # print("tag: ",tag,my_hexdata[tag_start:tag_end])
    set_cus = hex(int(my_hexdata[tag_end:set_end], 2))
    block = hex(int(my_hexdata[set_end:total_bits], 2))
    print(annotate_str, ' origin: ', my_hexdata, "tag: ",
          tag, ' set: ', set_cus, " block:", block)


my_cache("cache", 0x0D53, 13, 16, 8, 3)
my_cache("cache", 0x0CB4, 13, 16, 8, 3)
my_cache("cache", 0x0A31, 13, 16, 8, 3)
"""
6.29
"""
my_cache("cache", 0x834, 12, 12, 8, 2)
my_cache("cache", 0x836, 12, 12, 8, 2)
my_cache("cache", 0xFFD, 12, 12, 8, 2)
# my_cache("cache",0x834,12,13,9,2)
"""
6.31
"""
my_cache("cache", 0x071A, 13, 16, 8, 3)
my_cache("cache", 0x16E8, 13, 16, 8, 3)
"""
p859
"""
my_cache("cache", 0x354, 12, 12, 6, 4)
"""
problem 6.16,6.27
"""


def my_cache_decode(annotate_str, set_index, tags: list, bits, tag_size, set_size):
    for tag in tags:
        print(annotate_str, "0x"+str(tag)+": ", end='\t')
        tag_str = f'{int(str(tag),16):0>{tag_size}b}'
        set_str = f'{set_index:0>{set_size}b}'
        for block in range(4):
            block_str = f'{block:0>{2}b}'
            total_str = tag_str+set_str+block_str
            total_hex_str = f'{int(total_str,2):0>{4}x}'
            print(total_hex_str, end='\t')
        print()


my_cache_decode("decode ", 1, [45, 38], 13, 8, 3)
my_cache_decode("decode ", 6, [91], 13, 8, 3)
"""
problem 6.33
"""
my_cache_decode("decode ", 2, ['BC', 'B6'], 13, 8, 3)
"""
Problem 9.4
"""


def binstr_2_hex(bin_str: str):
    return hex(int(bin_str, 2))


class my_vir:
    def __init__(self, hex_num, vpo_size, total_size, valid_size, tlbt_size, log: bool):
        self.x = hex_num
        self.bin = f'{self.x:0>{total_size}b}'
        vpn_start = total_size-valid_size
        self.start_redundant = self.bin[0:vpn_start]
        vpnend = total_size-vpo_size
        if log:
            print("vpn_size: ", vpnend-vpn_start)
        self.vpn_bin = self.bin[vpn_start:vpnend]
        self.vpn = binstr_2_hex(self.vpn_bin)
        self.vpo_bin = self.bin[vpnend:total_size]
        self.vpo = binstr_2_hex(self.vpo_bin)
        tlbt_end = vpn_start+tlbt_size
        tlbi_size = vpnend-tlbt_end
        self.tlbt = binstr_2_hex(self.bin[vpn_start:tlbt_end])
        self.tlbi = binstr_2_hex(self.bin[tlbt_end:tlbt_end+tlbi_size])

    def virtual_addr_decode_vpn_o(self):
        print('vpn: ', self.vpn, "vpo: ", self.vpo, "")

    def virtual_addr_decode_tlbt_i(self):
        print("tlbt: ", self.tlbt, "tlbi: ", self.tlbi)

    def virtual_addr_bin(self):
        print("bin: ", self.bin, "\nredundant: ", self.start_redundant,
              "vpn_bin: ", self.vpn_bin, "vpo_bin: ", self.vpo_bin)

    def ppn_to_phyaddr(self, ppn: int, ppn_valid_size, ppn_size, ct_size, ci_size, phyaddr_size, debug: bool):
        """
        int should be hex
        """
        self.ppo_bin = self.vpo_bin
        ppn_bin = f'{int(ppn):0>{ppn_size}b}'
        self.ppn_bin = ppn_bin[ppn_size-ppn_valid_size:len(ppn_bin)]
        self.phy_addr = self.ppn_bin+self.ppo_bin
        self.ct = binstr_2_hex(self.phy_addr[0:ct_size])
        ci_end = ct_size+ci_size
        self.ci = binstr_2_hex(self.phy_addr[ct_size:ci_end])
        self.co = binstr_2_hex(self.phy_addr[ci_end:phyaddr_size])
        print("phy_addr: ", self.phy_addr, "ct: ",
              self.ct, "ci: ", self.ci, "co: ", self.co)
        if debug:
            print("str(ppn) ", str(ppn), " ", str(ppn).encode())
            print("int(str(ppn),16) ", int(ppn), "ppn_bin_orig: ",
                  ppn_bin, "ppn_bin: ", self.ppn_bin)
            print("self.phy_addr[ci_end:phyaddr_size] ",
                  self.phy_addr[ci_end:phyaddr_size])


vir1 = my_vir(0x03d7, 6, 16, 14, 6, True)
vir1.virtual_addr_bin()
vir1.virtual_addr_decode_vpn_o()
vir1.virtual_addr_decode_tlbt_i()
vir1.ppn_to_phyaddr(0x0d, 6, 8, 6, 4, 12, False)
"""
9.11
"""
vir1 = my_vir(0x027c, 6, 16, 14, 6, True)
vir1.virtual_addr_bin()
vir1.virtual_addr_decode_vpn_o()
vir1.virtual_addr_decode_tlbt_i()
vir1.ppn_to_phyaddr(0x17, 6, 8, 6, 4, 12, False)
"""
9.12,13
"""
vir1 = my_vir(0x03a9, 6, 16, 14, 6, True)
vir1.virtual_addr_bin()
vir1.virtual_addr_decode_vpn_o()
vir1.virtual_addr_decode_tlbt_i()
vir1.ppn_to_phyaddr(0x11, 6, 8, 6, 4, 12, False)
vir1 = my_vir(0x0040, 6, 16, 14, 6, True)
vir1.virtual_addr_bin()
vir1.virtual_addr_decode_vpn_o()
vir1.virtual_addr_decode_tlbt_i()
# vir1.ppn_to_phyaddr(0x11,6,8,6,4,12,False)
"""
11.1
"""


class Net:
    def __init__(self) -> None:
        pass


net = Net()


def dot2hex(dot_addrs: list[str]):
    for dot_addr in dot_addrs:
        bytes = dot_addr.split('.')
        hex_addr = '0x'
        for byte in bytes:
            hex_addr += f'{int(byte):0>2x}'
        print(dot_addr, ':', hex_addr)


def hex2dot(hex_nums: list[int]):
    """
    should be hex str
    """
    for hex in hex_nums:
        hex_str = f'0x{hex:0>8x}'
        hex_str_no_prefix = hex_str[2:]
        byte_addr = ''
        for index in range(4):
            start = index*2
            byte_addr += str(int(hex_str_no_prefix[start:start+2], 16))
            if index != 3:
                byte_addr += '.'
        print(hex_str, ': '+byte_addr)


dot2hex(['107.212.122.205', '64.12.149.13', '107.212.96.29'])
hex2dot([0x00000080, 0xFFFFFF00, 0x0A010140])
"""
12.34
"""
begin = -177168
print("check 12.34")
find = False
for item in range(16):
    thread_arg_begin = begin+item*11072
    return_mat_begin = begin+item*11072+10752
    return_mat_end = return_mat_begin+320
    if thread_arg_begin < -198720 < return_mat_end:
        find = True
        print(thread_arg_begin, return_mat_end)
print("find:", find)
"""
miscs
"""
MISC = False
if MISC:
    print("size ", (len("0xc007ec92")-2)*4)
    print("byte size ", len("0008000000000000")/2)
    print("byte size ", len("000d000d000d")/2)
    print("byte size ", len("0c0200000000000000")/2)
    import math
    print("factorial 14!", math.factorial(14),
          ": equal to 87178291200", 87178291200 == math.factorial(14))


"""
COD begin
"""

"""
crc
"""


def crc_remainder(input_bitstring, polynomial_bitstring, initial_filler):
    """Calculate the CRC remainder of a string of bits using a chosen polynomial.
    initial_filler should be '1' or '0'.
    """
    polynomial_bitstring = polynomial_bitstring.lstrip('0')
    len_input = len(input_bitstring)
    initial_padding = (len(polynomial_bitstring) - 1) * initial_filler
    input_padded_array = list(input_bitstring + initial_padding)
    while '1' in input_padded_array[:len_input]:
        cur_shift = input_padded_array.index('1')
        for i in range(len(polynomial_bitstring)):
            input_padded_array[cur_shift + i] \
                = str(int(polynomial_bitstring[i] != input_padded_array[cur_shift + i]))  # XOR
    return ''.join(input_padded_array)[len_input:]


def crc_check(input_bitstring, polynomial_bitstring, check_value):
    """Calculate the CRC check of a string of bits using a chosen polynomial."""
    polynomial_bitstring = polynomial_bitstring.lstrip('0')
    len_input = len(input_bitstring)
    initial_padding = check_value
    input_padded_array = list(input_bitstring + initial_padding)
    while '1' in input_padded_array[:len_input]:
        cur_shift = input_padded_array.index('1')
        for i in range(len(polynomial_bitstring)):
            input_padded_array[cur_shift + i] \
                = str(int(polynomial_bitstring[i] != input_padded_array[cur_shift + i]))
    return ('1' not in ''.join(input_padded_array)[len_input:])


print(crc_remainder('11010011101100', '1011', '0'),
      crc_check('11010011101100', '1011', '100'))

"""
cachegrind calculation
"""
str_type = type('1')


def checktype(obj):
    return bool(obj) and all(type(elem) is str_type for elem in obj)


def modify_data(*datas) -> list:
    datas_struct = []
    for data in datas:
        print(type(data))
        if type(data) is str_type:
            print(data)
            data_no_comma = float(data.replace(",", ""))
            datas_struct.append(data_no_comma)
        # should be list[str]
        elif checktype(data):
            data_list = []
            for sub_data in data:
                print("sub_data", sub_data)
                data_no_comma = float(sub_data.replace(",", ""))
                data_list.append(data_no_comma)
            datas_struct.append(data_list)
        else:
            sys.exit("data type error")
    return datas_struct


datas = modify_data("11,954,347,744", "191,374,279",
                    "1,142,397", "1,144,662", "191,376,642")
print(datas[2]/datas[0], datas[1]/datas[0])
print(datas[3]/datas[4])

"""
perf list 
`0x20043048F` in 'PPR_Family_19h_Model_01h_Rev_B1_Vol1.pdf' meaning
"""
# https://stackoverflow.com/questions/3252528/converting-a-number-to-binary-with-a-fixed-length
perf_event_reg_str = ('{0:036b}'.format(0x20043078F))
str_reverse = perf_event_reg_str[::-1]
# https://stackoverflow.com/questions/509211/how-slicing-in-python-works
split_hex = [perf_event_reg_str[i:i+4] for i in range(0, len(perf_event_reg_str), 4)]
print("origin hex: ", perf_event_reg_str)
print("each hex (rightest is LSB): ", split_hex)
print("CntMask: ", perf_event_reg_str[::-1][24:(31+1)][::-1])
print("16~23bit (rightest is 16bit): ", perf_event_reg_str[::-1][16:(23+1)][::-1])
"""
perf `l2_request_g2.group1` meaning

$ sudo su root -c "target_dir=/home/czg;cd;echo ${target_dir};perf stat -a -e l2_request_g1.group2,l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\
,l2_request_g1.ls_rd_blk_c_s,l2_request_g1.cacheable_ic_read\
,l2_request_g1.change_to_x,l2_request_g1.prefetch_l2_cmd\
,l2_request_g1.l2_hw_pf,l2_request_g1.all_no_prefetch\
,l2_request_g2.group1 \
${target_dir}/matrix-matrix-multiply/build/src/dgemm;"
...
 Performance counter stats for 'system wide':

           461,856      l2_request_g1.group2                                                    (59.68%)
     4,980,837,610      l2_request_g1.rd_blk_l                                                  (59.20%)
        15,748,030      l2_request_g1.rd_blk_x                                                  (59.28%)
        13,974,857      l2_request_g1.ls_rd_blk_c_s                                             (59.50%)
       139,082,686      l2_request_g1.cacheable_ic_read                                         (59.97%)
           851,311      l2_request_g1.change_to_x                                               (60.32%)
                 0      l2_request_g1.prefetch_l2_cmd                                           (60.50%)
     1,706,260,182      l2_request_g1.l2_hw_pf                                                  (60.69%)
     5,091,787,060      l2_request_g1.all_no_prefetch                                           (60.57%)
     6,066,716,533      l2_request_g2.group1                                                    (60.29%)

see https://github.com/torvalds/linux/blob/master/tools/perf/pmu-events/arch/x86/amdzen2/cache.json

"""
datas_l2_request = ["4,980,837,610",
                    "15,748,030", "13,974,857", "139,082,686", "851,311", "0", "1,706,260,182", "461,856"]
datas_l2_request.reverse()
all_no_prefetch = "5,091,787,060"
[datas_l2_request, all_no_prefetch] = modify_data(
    datas_l2_request, all_no_prefetch)
group_2_misc = datas_l2_request[0]
print([datas_l2_request, group_2_misc, all_no_prefetch])

bin_str = bin(0xf9)[2:][::-1]
print("all_no_prefetch is 0xf9, bin: ", bin_str)
# https://stackoverflow.com/questions/3873361/finding-multiple-occurrences-of-a-string-within-a-string-in-python
for m in re.finditer('0', bin_str):
    print('0 found', m.start(), "so should track: 0x" +
          '{0:02d}'.format(2**(int(m.start()))))
sum_bin_str_one = 0
for m in re.finditer('1', bin_str):
    to_add = datas_l2_request[m.start()]
    print("add ", to_add)
    sum_bin_str_one = sum_bin_str_one + to_add
if sum_bin_str_one == all_no_prefetch:
    print("0xf9 corresponds to sum of bits")
else:
    print("Not sum. 0xf9: ", all_no_prefetch,
          ", while mask sum: ", sum_bin_str_one)

if bin_str[0] == "1":
    print("notice group1 include group2 miscs")
group_1 = "6,066,716,533"
[l2_hw_pf, prefetch_l2_cmd] = datas_l2_request[1:3]

# sum_events_data = sum(perf_datas[i] for i in range(0, len(perf_datas), 1) if i>=l2_hw_pf_index)
sum_events_data = all_no_prefetch-group_2_misc+l2_hw_pf+prefetch_l2_cmd

if (group_1 == sum_events_data):
    print("equal sum")
else:
    print("sum: ", sum_events_data, "while group1 misc:", group_1)

"""
`ls_hw_pf_dc_fill.ls_mabresp_lcl_dram/ls_mabresp_lcl_cache/ls_mabresp_lcl_l2` comparison 

use command to get data. https://linuxhint.com/print-columns-awk/
TODO how to use something like `${i+1}` in other script language with `awk`
$ awk 'BEGIN { events=23;start_index=events-9;print start_index;begin_str_index=events+2;print begin_str_index;}{quote_str=$begin_str_index;printf("\"%s\":[ ",quote_str);for (i = start_index; i < start_index+5; ++i) {printf("%s, ",$i)};print "],"}' /mnt/ubuntu/home/czg/csapp3e/debug/sample_num_prefetch.report 
14
25
"":[ 7678, 4680, 7700, 0, 0, ],
"":[ 7667, 4474, 7688, 0, 0, ],
"dgemm_basic":[ 3922, 2891, 3912, 0, 0, ],
"dgemm_avx256":[ 1054, 562, 1042, 0, 0, ],
"dgemm_unrolled_avx256":[ 317, 145, 282, 0, 0, ],
"dgemm_basic_blocked":[ 2250, 782, 2206, 0, 0, ],
"dgemm_blocked_avx256":[ 122, 31, 157, 0, 0, ],
"""
dgemm_ls_hw_pf_dc_fill_dict = {
    "dgemm_basic": [3922, 2891, 3912, 0, 0, ],
    "dgemm_avx256": [1054, 562, 1042, 0, 0, ],
    "dgemm_unrolled_avx256": [317, 145, 282, 0, 0, ],
    "dgemm_basic_blocked": [2250, 782, 2206, 0, 0, ],
    "dgemm_blocked_avx256": [122, 31, 157, 0, 0, ],
}
print(dgemm_ls_hw_pf_dc_fill_dict["dgemm_basic"])
dgemm_ls_hw_pf_dc_fill_dict = {k: [
    float(v_elem) for v_elem in v] for k, v in dgemm_ls_hw_pf_dc_fill_dict.items()}
dgemm_ls_hw_pf_dc_fill_dict_cp = copy.deepcopy(dgemm_ls_hw_pf_dc_fill_dict)
# https://stackoverflow.com/questions/23896199/loop-for-inside-lambda


def print_key_value(dict): return [print(
    key, '->', value) for key, value in dict.items()]


print_key_value(dgemm_ls_hw_pf_dc_fill_dict)
# from decimal import getcontext # https://docs.python.org/3/library/decimal.html
# getcontext().prec = 2
suffix_str = "_normalized"
for key, value in zip(dgemm_ls_hw_pf_dc_fill_dict.keys(), dgemm_ls_hw_pf_dc_fill_dict.values()):
    add_key = key+suffix_str
    add_value = [round(i/value[1], 2) for i in value]
    dgemm_ls_hw_pf_dc_fill_dict_cp[add_key] = add_value
print("after changed")
print_key_value(dgemm_ls_hw_pf_dc_fill_dict_cp)

compare_index = 1
compare_event_strs = ["local CCX", "dram", "local L2"]
base_compare = {key: round(value[compare_index]/dgemm_ls_hw_pf_dc_fill_dict["dgemm_basic"]
                                      [compare_index], 2) for key, value in dgemm_ls_hw_pf_dc_fill_dict.items()}
print("compare base", compare_event_strs[compare_index])
print_key_value(base_compare)

"""
level-index arithmetic in https://stackoverflow.com/questions/29157639/what-are-the-benefits-of-symmetric-level-index-arithmetic-alternative-to-floati and B-4

level_index better use wikipedia $\varphi$ version
"""
def level_index(l:int,f:float,rX:int):
    x=l+f
    if x >= 0 and x<1:
        return x
    if l==1:
        return math.exp(f)*rX
        # return decimal.Decimal(math.exp(f)*rX)
    elif l<0:
        exit("l error")
    else:
        return math.exp(level_index(l-1,f,rX=rX))
        # return decimal.Decimal(math.exp(level_index(l-1,f,rX=rX)))
def sX(X):
    return X>0
def rX(X):
    if X!=0:
        return (abs(X)-abs(1/X))>0
    else:
        """
        0^0 = 1, so should return 1
        """
        return 1
target_X = 10**100
print(level_index(4,0.5268756157751,rX=rX(target_X))*sX(target_X))
decimal.getcontext().prec = 500
def psi(X:float):
    if 0<=X and 1>X:
        return X
    else:
        """
        still has error after using high precision...
        """
        return 1+decimal.Decimal(psi(decimal.Decimal(math.log(X,math.e))))
def max_X_X_reciprocal(X:float):
    # reciprocal = 1/X
    # if X>reciprocal:
    #     return X
    # else:
    #     return reciprocal
    return abs(X)**rX(X)
print(psi(max_X_X_reciprocal(target_X)))

def test_level_index_print(X:float):
    target_x = psi(max_X_X_reciprocal(X))
    target_l = math.floor(target_x)
    target_f = target_x - target_l
    # print(str(X)+": "+str(target_x)+"; X="+str(level_index(target_l,target_f,1)))
    level_index_num = level_index(target_l,target_f,1)
    print(str(X)+": "+str(target_x)+"; X="+str(level_index_num)+"; error: ",X-level_index_num)
# zero_x = psi(max_X_X_reciprocal(0))
# print(0,": x=",zero_x,"; X= ",level_index(math.floor(zero_x),zero_x-math.floor(zero_x),1))
# one_x = psi(max_X_X_reciprocal(1))
# one_l = math.floor(zero_x)
# print(1,": x=",one_x,"; X= ",level_index(one_l,one_x-one_l,1))
print(str(0))
test_level_index_print(0)
test_level_index_print(1)
test_level_index_print(10**100)

# print(level_index(231,0.25850929940458))

"""
SD(signed digit) radix-8 
"""
def partial_product(Multiplicand,partial_Multiplier):
    print(bin(Multiplicand*partial_Multiplier))
def arbitrary_len_signed_num(input:int):
    """
    input like 0b1010
    """
    str_input = "{0:b}".format(input)
    # print("input: ",str_input)
    num_len = len(str_input)
    return int(str_input[1:],2)-int(str_input[0],2)*2**(num_len-1)
# 21 bits
Multiplicand = 0b111100010010110111001
Multiplier = 0b100011010100110100111
result_bits = 31+6+3+1
# https://stackoverflow.com/questions/32413109/using-variables-in-the-format-function-in-python
print("Multiplicand: ",arbitrary_len_signed_num(Multiplicand))
print("mul result:","{0:0{1}b}".format(arbitrary_len_signed_num(Multiplicand)*arbitrary_len_signed_num(Multiplier),result_bits))
def Radix_8(Quartet_value:str):
    """
    input like 0101
    """
    str_len=len(str)
    if str_len !=4:
        exit("len error")
    msb_num = (-1)**Quartet_value[0]*(2**(str_len-1))
    no_sign_num = int(Quartet_value,2) & int('1'*(str_len-1),2)
    intermediate_num = no_sign_num >> 1
    lsb_num = int(Quartet_value[str_len-1],2)
    return msb_num+intermediate_num+lsb_num
Multiplier_append_zero = int("{0:b}".format(Multiplicand)+'0',2)

# partial_product(Multiplicand=Multiplicand)