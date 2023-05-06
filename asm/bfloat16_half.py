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
problem 6.13
"""
def my_cache(annotate_str,hex_num,bits,total_bits,tag_size,set_size):
    my_hexdata = f'{hex_num:0>{total_bits}b}'
    tag_start=total_bits-bits
    tag_end=tag_start+tag_size
    set_end=tag_end+set_size
    tag=hex(int(my_hexdata[tag_start:tag_end],2))
    # print("tag: ",tag,my_hexdata[tag_start:tag_end])
    set_cus=hex(int(my_hexdata[tag_end:set_end],2))
    block=hex(int(my_hexdata[set_end:total_bits],2))
    print(annotate_str,' origin: ',my_hexdata,"tag: ",tag,' set: ',set_cus," block:",block)
my_cache("cache",0x0D53,13,16,8,3)
my_cache("cache",0x0CB4,13,16,8,3)
my_cache("cache",0x0A31,13,16,8,3)
"""
6.29
"""
my_cache("cache",0x834,12,12,8,2)
my_cache("cache",0x836,12,12,8,2)
my_cache("cache",0xFFD,12,12,8,2)
# my_cache("cache",0x834,12,13,9,2)
"""
6.31
"""
my_cache("cache",0x071A,13,16,8,3)
my_cache("cache",0x16E8,13,16,8,3)
"""
p859
"""
my_cache("cache",0x354,12,12,6,4)
"""
problem 6.16,6.27
"""
def my_cache_decode(annotate_str,set_index,tags:list,bits,tag_size,set_size):
    for tag in tags:
        print(annotate_str,"0x"+str(tag)+": ",end='\t')
        tag_str=f'{int(str(tag),16):0>{tag_size}b}'
        set_str=f'{set_index:0>{set_size}b}'
        for block in range(4):
            block_str=f'{block:0>{2}b}'
            total_str=tag_str+set_str+block_str
            total_hex_str=f'{int(total_str,2):0>{4}x}'
            print(total_hex_str, end = '\t')
        print()
my_cache_decode("decode ",1,[45,38],13,8,3)
my_cache_decode("decode ",6,[91],13,8,3)
"""
problem 6.33
"""
my_cache_decode("decode ",2,['BC','B6'],13,8,3)
"""
Problem 9.4
"""
def binstr_2_hex(bin_str:str):
    return hex(int(bin_str,2))
class my_vir:
    def __init__(self,hex_num,vpo_size,total_size,valid_size,tlbt_size,log: bool):
        self.x=hex_num
        self.bin=f'{self.x:0>{total_size}b}'
        vpn_start=total_size-valid_size
        self.start_redundant=self.bin[0:vpn_start]
        vpnend=total_size-vpo_size
        if log:
            print("vpn_size: ",vpnend-vpn_start)
        self.vpn_bin=self.bin[vpn_start:vpnend]
        self.vpn=binstr_2_hex(self.vpn_bin)
        self.vpo_bin=self.bin[vpnend:total_size]
        self.vpo=binstr_2_hex(self.vpo_bin)
        tlbt_end=vpn_start+tlbt_size
        tlbi_size=vpnend-tlbt_end
        self.tlbt=binstr_2_hex(self.bin[vpn_start:tlbt_end])
        self.tlbi=binstr_2_hex(self.bin[tlbt_end:tlbt_end+tlbi_size])
    def virtual_addr_decode_vpn_o(self):
        print('vpn: ',self.vpn,"vpo: ",self.vpo,"")
    def virtual_addr_decode_tlbt_i(self):
        print("tlbt: ",self.tlbt,"tlbi: ",self.tlbi)
    def virtual_addr_bin(self):
        print("bin: ",self.bin,"\nredundant: ",self.start_redundant,"vpn_bin: ",self.vpn_bin,"vpo_bin: ",self.vpo_bin)
    def ppn_to_phyaddr(self,ppn: int,ppn_valid_size,ppn_size,ct_size,ci_size,phyaddr_size,debug:bool):
        """
        int should be hex
        """
        self.ppo_bin=self.vpo_bin
        ppn_bin=f'{int(ppn):0>{ppn_size}b}'
        self.ppn_bin=ppn_bin[ppn_size-ppn_valid_size:len(ppn_bin)]
        self.phy_addr=self.ppn_bin+self.ppo_bin
        self.ct=binstr_2_hex(self.phy_addr[0:ct_size])
        ci_end=ct_size+ci_size
        self.ci=binstr_2_hex(self.phy_addr[ct_size:ci_end])
        self.co=binstr_2_hex(self.phy_addr[ci_end:phyaddr_size])
        print("phy_addr: ",self.phy_addr,"ct: ",self.ct,"ci: ",self.ci,"co: ",self.co)
        if debug:
            print("int(str(ppn),16) ",int(ppn),"ppn_bin_orig: ",ppn_bin,"ppn_bin: ",self.ppn_bin)
            print("self.phy_addr[ci_end:phyaddr_size] ",self.phy_addr[ci_end:phyaddr_size])

vir1=my_vir(0x03d7,6,16,14,6,True)
vir1.virtual_addr_bin()
vir1.virtual_addr_decode_vpn_o()
vir1.virtual_addr_decode_tlbt_i()
vir1.ppn_to_phyaddr(0x0d,6,8,6,4,12,False)
"""
miscs
"""
MISC=False
if MISC:
    print("size ",(len("0xc007ec92")-2)*4)
    print("byte size ",len("0008000000000000")/2)
    print("byte size ",len("000d000d000d")/2)
    print("byte size ",len("0c0200000000000000")/2)
    import math
    print("factorial 14!",math.factorial(14),": equal to 87178291200",87178291200==math.factorial(14))