# miscs
- hwo to [post](https://stackoverflow.com/help/minimal-reproducible-example) question
- stackoverflow image [size](https://meta.stackoverflow.com/questions/253403/how-to-reduce-image-size-on-stack-overflow) based on imgur.
- the following `''` is assumed as *quote* of link contents.
- vscode sign in with [kwallet](https://github.com/microsoft/vscode/issues/104319) fails
# NOT DO
- Not to pay too much attention to the definitions of memory consistency models. But pay more attention to whether it runs correctly.
  - TODO read [riscv_spec] p163 and [related codes](https://github.com/litmus-tests/litmus-tests-riscv) on how implemented.
- Not to learn how to set output location, just use `mv`.
# csapp [global-ed errata](https://github.com/yangwenbo99/csapp-global-errata/blob/master/chapter_3.md) or this [official](https://csapp.cs.cmu.edu/3e/errata.html)(notice this 3e errata) (weird with [http](http://csapp.cs.cmu.edu/3e/errata.html), the page rendered finer)
- I learned csapp mainly based on [global_ed][csapp_global] and use [csapp_global_cropped] in saladict to better view more contents based on [this](https://github.com/abarker/pdfCropMargins). Because global has some errors, I also use [this][csapp_us_masteringengineering] as one auxiliary resource.
  - In `okular`, just use 'View->Trim view->Trim Margins' to avoid margin. But the toc link will go to the incorret location.
- TODO reread csapp with errata...
- or use zlib version or this [plain-scaned US. edition](http://54.186.36.238/Computer%20Systems%20-%20A%20Programmer%27s%20Perspective%203rd%20ed.%20%282015%29.pdf)([this](../references/csapp/csapp_scaned.pdf) is same as this [libgen link_1](https://libgen.is/book/index.php?md5=33DC73067D7512A7D970CEC5FE8870DB))
  - zlib is also same as this [libgen link_2](https://libgen.is/book/index.php?md5=AEED4FC7DE8437DDD3980C3BD5BA4D50) and it seems to be pearson electronic version referenced ~~in~~ not same as vitalsource doc in this csapp ~~blogger~~ [blogspot](http://csappbook.blogspot.com/2018/06/electronic-versions-of-csapp.html). See [masteringengineering](https://masteringengineering.com/site/login.html)
- better use [U.S. version](https://www.quora.com/Why-arent-Pearson-International-Edition-books-allowed-to-be-bought-in-the-U-S-and-Canada)... (Also see [this ycombinator comment](https://news.ycombinator.com/item?id=22287045) and [learning cs by self](https://teachyourselfcs.com/) highlighting two books 'focus on just two books' in the comment's [parent](https://news.ycombinator.com/item?id=22286340))
- US. edition [see this color-scanned version](https://libgen.is/book/index.php?md5=72762223B79864A233D62CE7B2E95FB1) stored 'csapp_color_scaned.pdf'
  - the above 71MB is same as this [330MB one](https://libgen.is/book/index.php?md5=A665E0B6F83F9FE49120BE27F3A85902) which is from [this](https://forum.freemdict.com/t/topic/11216)
  - Notice: better use [libgen.li](https://libgen.li/edition.php?id=138033662) instead of libgen.is
- Also see [**cs107**](https://web.stanford.edu/class/cs107/resources/callgrind) and its customized csapp book
## download used by [libgen](https://libgen.is/book/index.php?md5=A665E0B6F83F9FE49120BE27F3A85902)
### eumle (i.e. ed2k)
- aria2c [not support](https://github.com/aria2/aria2/issues/986#issuecomment-325183535) ed2k
  - [also see](https://github.com/aria2/aria2/issues/986#issuecomment-515765973) ed2k has been only used by Thunder(迅雷) P2SP
    - 迅雷速度 [原因](https://github.com/aria2/aria2/issues/986#issuecomment-761749908)
  - see '自然这些就消亡了。' (if you can understand chinese. *Ignore* the other weird quarrel words)
#### miscs
- open port by ufw or just not using ufw (not recommended)
- 国内[emule服务器](https://forum.emule-project.net/index.php?showtopic=133839)基本用不了
- github almost has no [amule configs](https://wiki.amule.org/wiki/Amule.conf_file)
#### **low id** [may be not](https://forum.emule-project.net/index.php?showtopic=48127) the router problem.
- the [port fowarding](http://wiki.amule.org/wiki/Firewall#Routers) used by [amule](http://wiki.amule.org/wiki/Get_HighID#Opening_the_ports) is same as [端口映射](https://hsk.oray.com/news/8851.html)(这里 端口转发 '路由器的10000端口' 其实指的就是 端口映射里的 功能)
  - see [emule official](http://www.emule-project.net/home/perl/help.cgi?l=1&rm=show_topic&topic_id=669)
  - notice: emule is not [cross-platform](http://www.emule-project.net/home/perl/help.cgi?l=1&rm=show_topic&topic_id=669) officially, but `amule` can function same.
  - How to configure: see [this tutorial video](https://www.youtube.com/watch?v=ISEnJix2Gho). (The following has no order relation)
    1. filter [list](http://upd.emule-security.org/ipfilter.zip) in [emule-security](https://www.emule-security.org) 无法导入 
    2. p2p download the ubuntu iso fast by 1Mb/s after some time. But downloading some not popular files may be too slow to begin. Just limited by p2p.
       1. Can search file in `emule`. This is one good feature.
    3. configure in [**tp-link**](https://resource.tp-link.com.cn/pc/docCenter/showDoc?source=search&id=1655112584878540).
    4. Server [List](https://forum.emule-project.net/index.php?showtopic=130625)  
    5. turn off the [firewall](https://support.microsoft.com/en-us/windows/turn-microsoft-defender-firewall-on-or-off-ec0844f7-aebd-0583-67fe-601ecf5d774f)  
    6. [kad](https://kelseyc18.github.io/kademlia_vis/basics/2/) ( i.e. p2p users list ) can be got from [nodes file](http://www.nodes-dat.com)  
    7. `telnet` check tcp while [`nc`](https://serverfault.com/questions/395342/telnet-counterpart-for-udp) check udp  
    8. [port forwarding](http://www.emule-project.net/home/perl/help.cgi?l=1&rm=show_topic&topic_id=669)  is same as [虚拟服务器](https://resource.tp-link.com.cn/pc/docCenter/showDoc?source=search&id=1655112584878540) in tplink (I used the tplink at my home, and I asked the JD Customer Service for- the above help).
    9.  [**test**](https://www.emule-project.com/home/perl/general.cgi?rm=porttest&tcpport=8067&udpport=16905&lang=1033&l=1&obf=1&clienthash=1935FB3FA00E795668A4B180747E6FA7) always 'tcp failed' even when I has turned the firewall off ,configured the proxy in `emule/amule` and used the first [server](https://www.emule-security.org/serverlist/). telnet test of the router connection works: `telnet 192.168.1.2 8099`
        1.  check [Wan ip](https://resource.tp-link.com.cn/pc/docCenter/showDoc?id=1655112544705438)
        2.  it should because my router don't have one *public ip*. Obviously, I use `192.168.1...` ....
    10. [VeryCD](https://zh.wikipedia.org/zh-cn/VeryCD) has been invalid for long time.
    11. open port in [windows](https://www.tomshardware.com/news/how-to-open-firewall-ports-in-windows-10,36451.html)
### magnet
- check valid (libgen seems to offer all invalid megnet link, at least in csapp). [Also this Q&A](https://stackoverflow.com/questions/72660337/verify-magnet-link-in-python-using-regular-expressions). In the above Q&A, `[a-z0-9]{32}` implies hash must be 32 characters but it is [not a must](https://en.wikipedia.org/wiki/Magnet_URI_scheme#Format)
- [download tool](https://superuser.com/questions/1334218/how-can-i-download-magnet-links-through-the-command-line-with-rtorrent-on-linux)
# TODO
- `.-multstore` meaning
- [ROP](https://tc.gts3.org/cs6265/tut/tut06-01-rop.html)
  - [endbr64](https://stackoverflow.com/questions/56905811/what-does-the-endbr64-instruction-actually-do) with `endbr64` <a id="rop"></a>
- `pwndbg` '<>' label in 'DISASM' meaning (in doc / code)
```bash
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x401040<printf@plt>      jmp    qwordptr[rip+0x2fc2]          <printf@got[plt]>
 
 ►0x401046<printf@plt+6>    push   1
  0x40104b<printf@plt+11>   jmp    0x401020                      <0x401020>
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> x $rip+0x2fc2
0x404008 <printf@got.plt>:      0x00401046
pwndbg> got
GOT protection: Partial RELRO | GOT functions: 2
[0x404000] __stack_chk_fail@GLIBC_2.4 -> 0x401036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
[0x404008] printf@GLIBC_2.2.5 -> 0x401046 (printf@plt+6) ◂— push 1
```
- [segment descriptor](https://www.felixcloutier.com/x86/push.html) / [this](https://stackoverflow.com/questions/51322139/what-does-the-d-flag-in-the-code-segment-descriptor-do-for-x86-64-instructions)
  - in [pdf p3095](../references/intel_64.pdf) 
  - [unable](https://stackoverflow.com/questions/28263624/can-i-print-the-gdtr-and-gdt-descriptor-under-gdb) to view (GDTR, LDTR, IDTR, and TR) reg, same with segment descriptor in GDT, also [CR](https://stackoverflow.com/questions/7415515/how-to-access-the-control-registers-cr0-cr2-cr3-from-a-program-getting-segmenta) reg like CR0 except in ring 0 (kerenel code) 
    - [workaround](https://forum.osdev.org/viewtopic.php?f=1&t=25968) in emulator like qemu
  - but [this](https://wiki.osdev.org/Global_Descriptor_Table#Segment_Descriptor) says to ignore Segment Descriptor ‘In 64-bit mode’.
- `GOT` more [specific](http://www.infosecwriters.com/text_resources/pdf/GOT_Hijack.pdf) than '## 8' below.
- [DIY](https://www.righto.com/2016/06/y-combinators-xerox-alto-restoring.html) old computer
## [intel reference](../references/x64_ISA_manual/intel_64.pdf)
- p597 `Op/En` in 'Opcode Column in the Instruction Summary Table (Instructions without VEX Prefix)'
- p529 ModR/M table
- 533 REX meaning
## [crackme](https://reverseengineering.stackexchange.com/questions/15774/crack-me-material) from [this](http://archive.hack.lu/2015/radare2-workshop-slides.pdf)
- [book](https://github.com/mikesiko/PracticalMalwareAnalysis-Labs) or [r2libc](https://cheese-hub.github.io/secure-coding/05-ret2libc/index.html)
## ret2 series
- [plt](https://ir0nstone.gitbook.io/notes/types/stack/aslr/plt_and_got) , this blog also tells what to do if got has nothing, [see](#rela)
### miscs
- [1](https://sharkmoos.medium.com/binary-exploitation-exploiting-ret2libc-328eefb0421b)
## blogs
- [1](https://reverseengineering.stackexchange.com/questions/1992/what-is-plt-got)
- [elf](https://stackoverflow.com/questions/43048932/why-does-the-plt-exist-in-addition-to-the-got-instead-of-just-using-the-got) and shared library
## weird problems
- [1 (Viewed 10 times when 23/4/17)](https://stackoverflow.com/questions/76033107/why-same-instruction-have-different-result-with-same-input-elags-regs-etc)
## miscs
- how to avoid gcc omit substraction or not generate weird 'cmp,jcc' pair
```c++
$ cat seta_setg.c
// Build with: gcc -m32 -no-pie -g -o plt plt.c
#include <stdio.h>

typedef unsigned int src_t ;
typedef int dest_t;

//3
//typedef unsigned char src_t ;
//typedef long dest_t;

//4
//typedef int src_t ;
//typedef char dest_t;

int main() {
        src_t test_src=-1;
        dest_t test_dest=-1;
        long sub;
        sub = -2-(-1);
        sub = -2-(unsigned int)(-1);
        if(sub<-1){
                putchar(1);
        }
        if(test_src>=(unsigned int)-1){
                //test_src=2;
                printf("1");
        }
        if(test_dest>-1){
                test_dest=2;
        }
}

// https://stackoverflow.com/questions/38552116/how-to-remove-noise-from-gcc-clang-assembly-output
$ gcc  seta_setg.c -S seta_setg.s -fno-asynchronous-unwind-tables
$ cat seta_setg.s                                                                           
        .file   "seta_setg.c"
        .text
        .globl  main
        .type   main, @function
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $16, %rsp
        movl    $-1, -16(%rbp)
        movl    $-1, -12(%rbp)
        movq    $-1, -8(%rbp)
        // here omit '-2-(unsigned int)(-1)'
        movl    $4294967295, %eax
        movq    %rax, -8(%rbp)
        cmpq    $-1, -8(%rbp)
        jge     .L2
        movl    $1, %edi
        call    putchar@PLT
.L2:
        cmpl    $-1, -16(%rbp)
        // weird jne, I use >= in .c
        jne     .L3
        movl    $49, %edi
        call    putchar@PLT
.L3:
        cmpl    $0, -12(%rbp)
        js      .L4
        movl    $2, -12(%rbp)
.L4:
        movl    $0, %eax
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (GNU) 12.2.1 20230201"
        .section        .note.GNU-stack,"",@progbits
```
### [debug](http://www.ece.uah.edu/~milenka/docs/milenkovic_WDDD02.pdf) BPT(branch predictor table)
## computer basics
- stack always [multiple of eight](https://stackoverflow.com/questions/66816732/memory-allocation-in-the-power-of-two-vs-multiple-of-eight)
# resources
## categories
- [registers](https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture) [or](https://wiki.osdev.org/CPU_Registers_x86-64) 
- [online opcode](https://www.felixcloutier.com/x86/push.html) or [pdf p615](../references/intel_64.pdf) or [this](http://ref.x86asm.net/coder64.html)
- how to [interpret](https://stackoverflow.com/questions/28664856/how-to-interpret-x86-opcode-map) opcode
- gdb [rc tutorial](https://sourceware.org/gdb/onlinedocs/gdb/Process-Record-and-Replay.html) or [target](https://sourceware.org/gdb/onlinedocs/gdb/Target-Commands.html#Target-Commands) in [this](https://sourceware.org/gdb/onlinedocs/gdb/index.html#SEC_Contents)
  - [this is out-dated](https://sourceware.org/gdb/wiki/ProcessRecord)
- [wiki](https://stackoverflow.com/tags/sse/info) in stackoverflow
## miscs
- `as` used by `gcc` assembly code comment [definition](https://sourceware.org/binutils/docs/as/index.html#SEC_Contents), also [see](https://stackoverflow.com/questions/24787769/what-are-lfb-lbb-lbe-lvl-loc-in-the-compiler-generated-assembly-code) [source](https://github.com/gcc-mirror/gcc/blob/releases/gcc-4.8.2/gcc/dwarf2out.c) code
  - [`L..`](https://slowstarter80.github.io/gcc/labels_in_assembly_code/) like [`.LFB0`](https://sourceware.org/binutils/docs/as/Symbol-Names.html)
- [.cfi_def_cfa_offset](https://sourceware.org/binutils/docs/as/CFI-directives.html#g_t_002ecfi_005fdef_005fcfa_005foffset-offset)
- [pushq](https://stackoverflow.com/questions/48251829/whats-the-difference-between-push-and-pushq-in-att-assembly)
  - [opcode p96 & 327](../references/amd64.pdf)
- [r/m](https://cs.fit.edu/~mmahoney/cse3101/nasmdocb.html) from [this](https://stackoverflow.com/questions/22445347/how-do-i-interpret-this-instruction)
- [CS.D](https://stackoverflow.com/questions/11970750/rex-prefix-decoding-for-intel-x64-arch)
- callee and caller saved [regs](https://stackoverflow.com/questions/9268586/what-are-callee-and-caller-saved-registers)
- [N.E.](https://stackoverflow.com/questions/71753270/intel-reference-specification-questions#comment126817567_71753270) in [pdf p605](../references/intel_64.pdf) means x86 instruction **not encodable** in 64-bit OS.(po)
- [IA-32e](https://news.ycombinator.com/item?id=22280184)
- [RTLD](https://nxmnpg.lemoda.net/1/rtld) -> RTLD_GLOBAL
- [fs:[0x18]](https://rvsec0n.wordpress.com/2019/09/13/routines-utilizing-tebs-and-pebs/)
- [_rtld_global_ro](https://comp.os.linux.development.apps.narkive.com/sVzevUx4/rtld-global-ro-glibc-private) related with ld,'ro' maybe 'readonly' 
- [fast code](http://www.c-jump.com/CIS77/ASM/Instructions/I77_0080_fast_code.htm)
- [_ITM_deregisterTMCloneTable](https://gcc.gnu.org/onlinedocs/gcc-7.1.0/libitm/The-libitm-ABI.html) [seems](https://gcc.gnu.org/onlinedocs/libitm/Enabling-libitm.html#Enabling-libitm) used in c++ not c
  - [Transactional Memory](https://www.ibm.com/docs/en/xffbg/121.141?topic=fortran-transactional-memory)
```bash
# https://stackoverflow.com/questions/6045809/link-error-undefined-reference-to-gxx-personality-v0-and-g
$ gcc -fPIE -no-pie -fgnu-tm test_got.c -o test_got -lstdc++
# or g++ https://stackoverflow.com/questions/329059/what-is-gxx-personality-v0-for
$ g++ -fPIE -no-pie -fgnu-tm test_got.c -o test_got
```
  - [TODO](https://stackoverflow.com/questions/41274482/why-does-register-tm-clones-and-deregister-tm-clones-reference-an-address-past-t)
- [paddr](https://reverseengineering.stackexchange.com/questions/19782/what-does-paddr-baddr-laddr-haddr-and-hvaddr-refer-to)
- why segment reg <a id="segment"></a> [not](https://stackoverflow.com/questions/21165678/why-64-bit-mode-long-mode-doesnt-use-segment-registers) used in 64, because 'When your normal addressing modes with normal 64-bit registers can already address vastly more memory than your computer can contain...', 
  - kw: 'larger addressable memory space than the 16-bit addresses could reach', 'an address **above** the (65536 byte) 16-bit address space.', '**add** the instruction specified address to the appropriate (or specified) "segment register"'
    - 'something like 40-bits to 48-bits of physical memory','would ever imagine reaching.', 'have a great many purposes, which segment registers do not', 'doubled the number of [truly] general purpose registers when they designed their 64-bit x86_64 CPUs'
  - more detailed [pdf p78](../references/intel_64.pdf) and register [definition](https://wiki.osdev.org/Segmentation)
    - module [pdf p162](../references/intel_64.pdf) [also](https://github.com/LordNoteworthy/cpu-internals/blob/master/README.md)
    - so code segment [not default](https://stackoverflow.com/questions/49994919/assembly-instruction-and-an-extra-2e-prefix-before-its-opcode/49995022#comment87006918_49995022) Intuitively
      - above `CS segment override` may be not needed because call [default 'code segment'](https://www.felixcloutier.com/x86/jmp) use CS
      - also [see 'always modify all segment registers except CS (the code segment selector).'](https://en.wikipedia.org/wiki/X86_memory_segmentation#Practices)
        - here also says about `ES` segment register usage 'extra segment specified by the segment selector held in the ES register.'
- compare [binary](https://superuser.com/questions/125376/how-do-i-compare-binary-files-in-linux)
### cpu specific
- my cpu 4800h doesn‘t [support](https://gist.github.com/kohnakagawa/fb77904fcc44fc5652ef6d338c35a718) 'CET'， so `ENDBR64` does [nothing](https://vstinner.readthedocs.io/assembly_x86.html), see [pdf p413 INDIRECT BRANCH TRACKING](../references/intel_64.pdf)
  - from [this](https://stackoverflow.com/questions/56905811/what-does-the-endbr64-instruction-actually-do), some keywords are ‘control flow violations’， ‘WAIT_FOR_ENDBRANCH’， ‘state machine’
  > from [this](https://en.wikipedia.org/wiki/Return-oriented_programming) , [above](#rop) maybe related with return address overwriting， so related with instructions like `jmp` -> related with `ENDBR64`.
  - TODO see kernel code related with above gist.
- [cache,memory,register](https://www.geeksforgeeks.org/difference-between-cache-memory-and-register/)
  - why no [two](https://www.quora.com/Why-can%E2%80%99t-two-operands-both-be-memory-operands-in-assembly-language) memory operand (related with cache) [also](https://stackoverflow.com/questions/14510280/why-cant-mov-have-both-operands-as-memory-locations)
## registers
- r9 save parameter and [rax](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture) save return [pdf p7](../references/x64_cheatsheet.pdf) [save order](http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html)
- whether [callee pdf p26](../references/abi.pdf)
### [r9,etc Caller-saved registers](https://stackoverflow.com/questions/9268586/what-are-callee-and-caller-saved-registers)
- according to [this](https://web.stanford.edu/class/archive/cs/cs107/cs107.1174/guide_x86-64.html), although it said `Caller-saved`， but it doesn't mean **must to save**
  - more [intuitive p4 and in p6 caller and callee save can both exist with the same call ( see below "'r12-15' is used ( except r14-15 )to save caller")](https://courses.cs.washington.edu/courses/cse410/17wi/lectures/CSE410-L13-procedures-II_17wi.pdf)
    - p13 said exactly Caller-save may be not needed
    - p12 why caller/ee save
      - po here caller not use but callee use register, caller‐save is better(then the reg can be tweaked all as what callee want and after ret, caller would restore all)
    - p23,24 show `rbp` `rsp` relation
      - also [csapp](http://csapp.cs.cmu.edu/3e/waside/waside-ia32.pdf), showed condition with rsp or not.
```bash
# here only have `mov` to pass parameter, but no `push` because `main` don't use these regs like `esi` anymore. `push   rbp` is generated by `-pg`
pwndbg> dr
Dump of assembler code for function main:
   0x000000000040124e <+0>:     55                      push   rbp
   0x000000000040124f <+1>:     48 89 e5                mov    rbp,rsp
   0x0000000000401252 <+4>:     e8 f9 fd ff ff          call   0x401050 <mcount@plt>
   0x0000000000401257 <+9>:     b9 04 00 00 00          mov    ecx,0x4
   0x000000000040125c <+14>:    ba 03 00 00 00          mov    edx,0x3
   0x0000000000401261 <+19>:    be 02 00 00 00          mov    esi,0x2
   0x0000000000401266 <+24>:    bf 08 20 40 00          mov    edi,0x402008
   0x000000000040126b <+29>:    b8 00 00 00 00          mov    eax,0x0
   0x0000000000401270 <+34>:    e8 cb fd ff ff          call   0x401040 <printf@plt>
=> 0x0000000000401275 <+39>:    b8 00 00 00 00          mov    eax,0x0
   0x000000000040127a <+44>:    e8 17 ff ff ff          call   0x401196 <cpu_supports_cet_shadow_stack>
   0x000000000040127f <+49>:    85 c0                   test   eax,eax
   0x0000000000401281 <+51>:    74 0a                   je     0x40128d <main+63>
   0x0000000000401283 <+53>:    bf 2e 20 40 00          mov    edi,0x40202e
   0x0000000000401288 <+58>:    e8 a3 fd ff ff          call   0x401030 <puts@plt>
   0x000000000040128d <+63>:    b8 00 00 00 00          mov    eax,0x0
   0x0000000000401292 <+68>:    e8 5b ff ff ff          call   0x4011f2 <cpu_supports_cet_ibt>
   0x0000000000401297 <+73>:    85 c0                   test   eax,eax
   0x0000000000401299 <+75>:    74 0a                   je     0x4012a5 <main+87>
   0x000000000040129b <+77>:    bf 4c 20 40 00          mov    edi,0x40204c
   0x00000000004012a0 <+82>:    e8 8b fd ff ff          call   0x401030 <puts@plt>
   0x00000000004012a5 <+87>:    b8 00 00 00 00          mov    eax,0x0
   0x00000000004012aa <+92>:    5d                      pop    rbp
   0x00000000004012ab <+93>:    c3                      ret
pwndbg> l
14          return (edx & (1 << 20)) != 0;
15      }
16
17      int main() {
18              printf("test Caller-saved registers %d %d %d ",2,3,4);
pwndbg> bt
#0  main () at check_cet_supported.c:19
```
### mcount
```bash
$ gcc check_cet_supported.c -o check_cet_supported.out -g -no-pie -fno-pic -p -pg
$ cd /mnt/ubuntu/home/czg/csapp3e/asm;gdb ./check_cet_supported.out -ex 'start' -ex 'set record full stop-at-limit off' -nx -iex "source ~/.gdbinit_pwndbg_voltron.gdb" -ex 'wa $rdi' -ex 'target record-full'
...
0x40118f<cpu_supports_cet_shadow_stack+9>    call   mcount@plt                      <mcount@plt>
        rdi: 0x1
        rsi: 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
        rdx: 0x7fffffffe028 —▸ 0x7fffffffe4b9 ◂— 'BEMENU_BACKEND=wayland'
        rcx: 0x403de0 —▸ 0x401150 ◂— endbr64
```
  - here `mcount` is [from](https://ftp.gnu.org/old-gnu/Manuals/gprof-2.9.1/html_node/gprof_25.html) `-pg`
```bash
# mcount save program state as above said (maybe mainly because it call another func)
pwndbg> nearpc $pc 0x8
  0x7ffff7fdcb5c  sub    rsp,qwordptr[rip+0x2010d]     <_rtld_global_ro+432>
  0x7ffff7fdcb63  mov    qwordptr[rsp],rax
  0x7ffff7fdcb67  mov    qwordptr[rsp+8],rcx
  0x7ffff7fdcb6c  mov    qwordptr[rsp+0x10],rdx
  0x7ffff7fdcb71  mov    qwordptr[rsp+0x18],rsi
  0x7ffff7fdcb76  mov    qwordptr[rsp+0x20],rdi
  0x7ffff7fdcb7b  mov    qwordptr[rsp+0x28],r8
  0x7ffff7fdcb80  mov    qwordptr[rsp+0x30],r9
pwndbg> bt
#0  0x00007ffff7fdcb85 in ?? () from /lib64/ld-linux-x86-64.so.2
#1  0x0000000000401247 in main () at check_cet_supported.c:17
#2  0x00007ffff7d9b790 in ?? () from /usr/lib/libc.so.6
#3  0x00007ffff7d9b84a in __libc_start_main () from /usr/lib/libc.so.6
#4  0x0000000000401075 in _start ()
pwndbg> d- 0x0000000000401247
Dump of assembler code from 0x401242 to 0x40124c:
   0x0000000000401242 <main+4>: e8 f9 fd ff ff          call   0x401040 <mcount@plt>
   0x0000000000401247 <main+9>: b8 00 00 00 00          mov    eax,0x0
End of assembler dump.

...

pwndbg> d-- 0x7ffff7fdcbc9
Dump of assembler code from 0x7ffff7fdcb94 to 0x7ffff7fdcbfe:
   0x00007ffff7fdcb94:  48 89 94 24 58 02 00 00 mov    QWORD PTR [rsp+0x258],rdx
   0x00007ffff7fdcb9c:  48 89 94 24 60 02 00 00 mov    QWORD PTR [rsp+0x260],rdx
   0x00007ffff7fdcba4:  48 89 94 24 68 02 00 00 mov    QWORD PTR [rsp+0x268],rdx
   0x00007ffff7fdcbac:  48 89 94 24 70 02 00 00 mov    QWORD PTR [rsp+0x270],rdx
   0x00007ffff7fdcbb4:  48 89 94 24 78 02 00 00 mov    QWORD PTR [rsp+0x278],rdx
   0x00007ffff7fdcbbc:  0f c7 64 24 40          xsavec [rsp+0x40]
   0x00007ffff7fdcbc1:  48 8b 73 10             mov    rsi,QWORD PTR [rbx+0x10]
   0x00007ffff7fdcbc5:  48 8b 7b 08             mov    rdi,QWORD PTR [rbx+0x8]
=> 0x00007ffff7fdcbc9:  e8 12 db ff ff          call   0x7ffff7fda6e0
...

# obvious here, it is the caller 'mcount' to save and restore regs like `r9` bsed on rsp location
pwndbg> nearpc 0x7ffff7e831da -e
  0x7ffff7e831cf              mov    qwordptr[rip+0xcd086],0
 ►0x7ffff7e831da              ret                                  <0x7ffff7e83c88; mcount+56>
    ↓
  0x7ffff7e83c88<mcount+56>   mov    r9,qwordptr[rsp+0x30]
  0x7ffff7e83c8d<mcount+61>   mov    r8,qwordptr[rsp+0x28]
  0x7ffff7e83c92<mcount+66>   mov    rdi,qwordptr[rsp+0x20]
  0x7ffff7e83c97<mcount+71>   mov    rsi,qwordptr[rsp+0x18]
  0x7ffff7e83c9c<mcount+76>   mov    rdx,qwordptr[rsp+0x10]
  0x7ffff7e83ca1<mcount+81>   mov    rcx,qwordptr[rsp+8]
  0x7ffff7e83ca6<mcount+86>   mov    rax,qwordptr[rsp]
  0x7ffff7e83caa<mcount+90>   add    rsp,0x38
  0x7ffff7e83cae<mcount+94>   ret    
pwndbg> bt
#0  0x00007ffff7e831da in ?? () from /usr/lib/libc.so.6
#1  0x00007ffff7e83c88 in mcount () from /usr/lib/libc.so.6
...
```
### callee reg (continue after above)
```bash
$ cd /mnt/ubuntu/home/czg/csapp3e/asm;gdb ./check_cet_supported.out -ex 'br *40123e' -ex 'r' -ex 'set record full stop-at-limit off' -nx -iex "source ~/.gdbinit_pwndbg_voltron.gdb" -ex '' -ex 'br *401242' -ex 'c' -ex 'wa $rbp' -ex 'wa $rsp' -ex 'awatch $rsp' -ex 'target record-full' -ex "wm rsp"
pwndbg> d-- 0x7ffff7fda6ed
   0x00007ffff7fda6e4:  41 55                   push   r13
   0x00007ffff7fda6e6:  45 31 c9                xor    r9d,r9d
   0x00007ffff7fda6e9:  41 54                   push   r12
   0x00007ffff7fda6eb:  55                      push   rbp
   0x00007ffff7fda6ec:  53                      push   rbx
=> 0x00007ffff7fda6ed:  48 89 fb                mov    rbx,rdi
# after 4 `push`
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
01:0008│     0x7fffffffdb20 —▸ 0x7fffffffdf00 ◂— 0x1
02:0010│     0x7fffffffdb28 ◂— 0x0
03:0018│     0x7fffffffdb30 —▸ 0x7fffffffe028 —▸ 0x7fffffffe4b9 ◂— 'BEMENU_BACKEND=wayland'
...
# then spare space
 ►0x7ffff7fda6f0  sub    rsp,0x18
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdb00 —▸ 0x7fffffffdc40 —▸ 0x7ffff7e744e5 (sbrk+149) ◂— test eax,eax
01:0008│     0x7fffffffdb08 —▸ 0x7ffff7fca9d8 ◂— 0x10001100000243
02:0010│     0x7fffffffdb10 ◂— 0x6
03:0018│     0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
pwndbg> wm rsp
Watchpoint 19: *(long long *)$rsp
# do anything subroutine want to do, also push/change stack 
 ►0x7ffff7fda74e  mov    qwordptr[rsp],rax
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsi rsp 0x7fffffffdb00 —▸ 0x400470 ◂— 0x120000002f /* '/' */
01:0008│         0x7fffffffdb08 —▸ 0x7ffff7fca9d8 ◂— 0x10001100000243
02:0010│         0x7fffffffdb10 ◂— 0x6
03:0018│         0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
04:0020│         0x7fffffffdb20 —▸ 0x7fffffffdf00 ◂— 0x1
05:0028│         0x7fffffffdb28 ◂— 0x0
06:0030│         0x7fffffffdb30 —▸ 0x7fffffffe028 —▸ 0x7fffffffe4b9 ◂— 'BEMENU_BACKEND=wayland'
07:0038│         0x7fffffffdb38 —▸ 0x7ffff7fdcbce ◂— mov r11,rax
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
  0x7ffff7fda7c9  mov    eax,dwordptr[rax]
  ►0x7ffff7fda752  cmp    r8d,7

# 'rdx' caller reg pushed(saved) by caller '0x7ffff7fda7dd'
pwndbg> d- 0x7ffff7fda7ce
Dump of assembler code from 0x7ffff7fda7c9 to 0x7ffff7fda7d3:
   0x00007ffff7fda7c9:  8b 00                   mov    eax,DWORD PTR [rax]
   0x00007ffff7fda7cb:  6a 00                   push   0x0
   0x00007ffff7fda7cd:  52                      push   rdx
=> 0x00007ffff7fda7ce:  41 b9 01 00 00 00       mov    r9d,0x1
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdaf0 ◂— 0x1
01:0008│     0x7fffffffdaf8 ◂— 0x0
02:0010│ rsi 0x7fffffffdb00 —▸ 0x400470 ◂— 0x120000002f /* '/' */
03:0018│     0x7fffffffdb08 —▸ 0x7ffff7fca9d8 ◂— 0x10001100000243
04:0020│     0x7fffffffdb10 ◂— 0x6
05:0028│     0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
06:0030│     0x7fffffffdb20 —▸ 0x7fffffffdf00 ◂— 0x1
07:0038│     0x7fffffffdb28 ◂— 0x0
# '0x7ffff7fda7dd' call ‘0x7ffff7fd4180’
 ►0x7ffff7fda7dd  call   0x7ffff7fd4180                <0x7ffff7fd4180>
 
  0x7ffff7fda7e2  mov    r13,rax
# 
pwndbg> si
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdae8 —▸ 0x7ffff7fda7e2 ◂— mov r13,rax
01:0008│     0x7fffffffdaf0 ◂— 0x1
02:0010│     0x7fffffffdaf8 ◂— 0x0
03:0018│ rdx 0x7fffffffdb00 —▸ 0x400470 ◂— 0x120000002f /* '/' */
04:0020│     0x7fffffffdb08 —▸ 0x7ffff7fca9d8 ◂— 0x10001100000243
05:0028│     0x7fffffffdb10 ◂— 0x6
06:0030│     0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
07:0038│     0x7fffffffdb20 —▸ 0x7fffffffdf00 ◂— 0x1
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
 ►0x7ffff7fd4180  endbr64 
# then after several steps, 'r12-15' is used ( except r14-15 )to save caller reg passed by caller ‘0x7ffff7fda7dd’ after pushed by callee ‘0x7ffff7fd4180’
pwndbg> d-- 0x7ffff7fd4186
Dump of assembler code from 0x7ffff7fd4151 to 0x7ffff7fd41bb:
   0x00007ffff7fd4151:  33 00                   xor    eax,DWORD PTR [rax]
   0x00007ffff7fd4153:  00 48 8b                add    BYTE PTR [rax-0x75],cl
   0x00007ffff7fd4156:  4c 24 08                rex.WR and al,0x8
   0x00007ffff7fd4159:  e9 d2 fb ff ff          jmp    0x7ffff7fd3d30
   0x00007ffff7fd415e:  48 8b 7c 24 38          mov    rdi,QWORD PTR [rsp+0x38]
   0x00007ffff7fd4163:  ff 15 e7 88 02 00       call   QWORD PTR [rip+0x288e7]        # 0x7ffff7ffca50
   0x00007ffff7fd4169:  48 8d 3d 90 ea 01 00    lea    rdi,[rip+0x1ea90]        # 0x7ffff7ff2c00
   0x00007ffff7fd4170:  31 c0                   xor    eax,eax
   0x00007ffff7fd4172:  e8 49 36 00 00          call   0x7ffff7fd77c0 <_dl_fatal_printf>
   0x00007ffff7fd4177:  66 0f 1f 84 00 00 00 00 00      nop    WORD PTR [rax+rax*1+0x0]
   0x00007ffff7fd4180:  f3 0f 1e fa             endbr64
   0x00007ffff7fd4184:  41 57                   push   r15
=> 0x00007ffff7fd4186:  41 56                   push   r14
   0x00007ffff7fd4188:  41 55                   push   r13
   0x00007ffff7fd418a:  49 89 f5                mov    r13,rsi
   0x00007ffff7fd418d:  41 54                   push   r12
   0x00007ffff7fd418f:  4d 89 c4                mov    r12,r8
   0x00007ffff7fd4192:  55                      push   rbp
   0x00007ffff7fd4193:  48 89 d5                mov    rbp,rdx
   0x00007ffff7fd4196:  53                      push   rbx
   0x00007ffff7fd4197:  48 89 fb                mov    rbx,rdi
   0x00007ffff7fd419a:  48 81 ec 88 00 00 00    sub    rsp,0x88

# skip subsubroutine
pwndbg> dis
pwndbg> until *0x7ffff7fda7e2
# back to see subsubroutine; pop order is reverse which is fine
pwndbg> d-- 0x7ffff7fd4326
Dump of assembler code from 0x7ffff7fd42f1 to 0x7ffff7fd435b:
   0x00007ffff7fd42f1:  0f 84 99 02 00 00       je     0x7ffff7fd4590
   0x00007ffff7fd42f7:  4c 8b 54 24 50          mov    r10,QWORD PTR [rsp+0x50]
   0x00007ffff7fd42fc:  41 8b b7 fc 03 00 00    mov    esi,DWORD PTR [r15+0x3fc]
   0x00007ffff7fd4303:  85 f6                   test   esi,esi
   0x00007ffff7fd4305:  0f 84 75 02 00 00       je     0x7ffff7fd4580
   0x00007ffff7fd430b:  f6 05 ae 87 02 00 04    test   BYTE PTR [rip+0x287ae],0x4        # 0x7ffff7ffcac0 <_rtld_global_ro>
   0x00007ffff7fd4312:  0f 85 e8 01 00 00       jne    0x7ffff7fd4500
   0x00007ffff7fd4318:  4c 89 55 00             mov    QWORD PTR [rbp+0x0],r10
=> 0x00007ffff7fd431c:  48 81 c4 88 00 00 00    add    rsp,0x88
   0x00007ffff7fd4323:  4c 89 f8                mov    rax,r15
   0x00007ffff7fd4326:  5b                      pop    rbx
   0x00007ffff7fd4327:  5d                      pop    rbp
   0x00007ffff7fd4328:  41 5c                   pop    r12
   0x00007ffff7fd432a:  41 5d                   pop    r13
   0x00007ffff7fd432c:  41 5e                   pop    r14
   0x00007ffff7fd432e:  41 5f                   pop    r15
   0x00007ffff7fd4330:  c3                      ret
# 
pwndbg> en
pwndbg>c
# weird why pop to rsi not `rdx` above pushed
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdaf8 ◂— 0x0
01:0008│     0x7fffffffdb00 —▸ 0x7ffff7d8b058 ◂— 0xf0022000079d3
02:0010│     0x7fffffffdb08 —▸ 0x7ffff7fca9d8 ◂— 0x10001100000243
03:0018│     0x7fffffffdb10 ◂— 0x6
04:0020│     0x7fffffffdb18 —▸ 0x7fffffffdee0 —▸ 0x7fffffffe018 —▸ 0x7fffffffe480 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
05:0028│     0x7fffffffdb20 —▸ 0x7fffffffdf00 ◂— 0x1
06:0030│     0x7fffffffdb28 ◂— 0x0
07:0038│     0x7fffffffdb30 —▸ 0x7fffffffe028 —▸ 0x7fffffffe4b9 ◂— 'BEMENU_BACKEND=wayland'
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
  0x7ffff7fda7ed  pop    rsi
 ►0x7ffff7fda7ee  pop    rdi
#  after several `c`, above reg pushed by '0x7ffff7fda6ed' is restored and then return. same as above "‘0x7ffff7fda7dd’ after pushed by callee ‘0x7ffff7fd4180’"
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
  0x7ffff7fda860  mov    qwordptr[r12],rax
 ►0x7ffff7fda864  add    rsp,0x18
  0x7ffff7fda868  pop    rbx
pwndbg> d-- 0x7ffff7fda864
Dump of assembler code from 0x7ffff7fda82f to 0x7ffff7fda899:
   0x00007ffff7fda82f:  00 48 8b                add    BYTE PTR [rax-0x75],cl
   0x00007ffff7fda832:  83 58 03 00             sbb    DWORD PTR [rax+0x3],0x0
   0x00007ffff7fda836:  00 48 85                add    BYTE PTR [rax-0x7b],cl
   0x00007ffff7fda839:  c0 0f 84                ror    BYTE PTR [rdi],0x84
   0x00007ffff7fda83c:  91                      xchg   ecx,eax
   0x00007ffff7fda83d:  00 00                   add    BYTE PTR [rax],al
   0x00007ffff7fda83f:  00 48 c1                add    BYTE PTR [rax-0x3f],cl
   0x00007ffff7fda842:  e5 05                   in     eax,0x5
   0x00007ffff7fda844:  48 01 c5                add    rbp,rax
   0x00007ffff7fda847:  8b 45 1c                mov    eax,DWORD PTR [rbp+0x1c]
   0x00007ffff7fda84a:  85 c0                   test   eax,eax
   0x00007ffff7fda84c:  0f 84 9e 00 00 00       je     0x7ffff7fda8f0
   0x00007ffff7fda852:  48 8b 45 00             mov    rax,QWORD PTR [rbp+0x0]
   0x00007ffff7fda856:  8b 15 b4 22 02 00       mov    edx,DWORD PTR [rip+0x222b4]        # 0x7ffff7ffcb10 <_rtld_global_ro+80>
   0x00007ffff7fda85c:  85 d2                   test   edx,edx
   0x00007ffff7fda85e:  75 04                   jne    0x7ffff7fda864
   0x00007ffff7fda860:  49 89 04 24             mov    QWORD PTR [r12],rax
=> 0x00007ffff7fda864:  48 83 c4 18             add    rsp,0x18
   0x00007ffff7fda868:  5b                      pop    rbx
   0x00007ffff7fda869:  5d                      pop    rbp
   0x00007ffff7fda86a:  41 5c                   pop    r12
   0x00007ffff7fda86c:  41 5d                   pop    r13
   0x00007ffff7fda86e:  c3                      ret
```
## stack with `rsp`
- based on [this](https://stackoverflow.com/questions/36529449/why-are-rbp-and-rsp-called-general-purpose-registers), `rsp` doesn't imply stack start location always.
```bash
pwndbg> |vmmap|grep stack
    0x7ffffffde000     0x7ffffffff000 rw-p    21000      0 [stack]
pwndbg> telescope 0x7ffffffde000 0x3d00
00:0000│  0x7ffffffde000 ◂— 0x0
... ↓     15450 skipped
3c5b:1e2d8│  0x7fffffffc2d8 —▸ 0x7ffff7fd122a ◂— mov r10d,dwordptr[rbp-0x108]
...
pwndbg> stack
00:0000│ r13 rsp 0x7fffffffe0a0 ◂— 0x1
01:0008│         0x7fffffffe0a8 —▸ 0x7fffffffe510 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/check_cet_supported.out'
02:0010│         0x7fffffffe0b0 ◂— 0x0
03:0018│ rcx     0x7fffffffe0b8 —▸ 0x7fffffffe549 ◂— 'BEMENU_BACKEND=wayland'
04:0020│         0x7fffffffe0c0 —▸ 0x7fffffffe560 ◂— 'BROWSER=google-chrome-stable'
05:0028│         0x7fffffffe0c8 —▸ 0x7fffffffe57d ◂— 'COLORFGBG=0;15'
06:0030│         0x7fffffffe0d0 —▸ 0x7fffffffe58c ◂— 'COLORTERM=truecolor'
07:0038│         0x7fffffffe0d8 —▸ 0x7fffffffe5a0 ◂— 'DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus'
```
- see [this 28:04 function prologue](https://www.youtube.com/watch?v=LAkYW5ixvhg)
## [why](https://stackoverflow.com/questions/6212665/why-is-eax-zeroed-before-a-call-to-printf#:~:text=Since%20the%20compiler%20doesn't,defined%20as%20having%20variable%20arguments.) clear `$rax` ('it might be the case that the function is defined as having variable arguments')
## terms
- [exclusive or `^`](https://en.wikipedia.org/wiki/Exclusive_or)
  - or -> 1,0 / 0,1 / 1,1; then exclusive 1,1 , get `^`
## manuals
- [1](https://www.chessprogramming.org/X86-64#Agner_Fog)
- security
  - IEEE Security and Privacy
- [ATT](https://docs.oracle.com/cd/E19253-01/817-5477/)  diffs [this](../references/att_x86.pdf) especially SSE&AVX instruction prefix `v`
  - also [1](https://docs.oracle.com/cd/E19253-01/817-5477/) [2](https://stackoverflow.com/tags/att/info) from [this](https://stackoverflow.com/questions/1776570/is-there-a-complete-x86-assembly-language-reference-that-uses-att-syntax)
    - above 2: says att is 'destination-last order'
## visual asm
- [this](https://godbolt.org/z/BzhckE)
# blogs
- [this](http://pwnable.kr/) from [this](http://archive.hack.lu/2015/radare2-workshop-slides.pdf)
- cpu in [90min](https://www.lighterra.com/papers/modernmicroprocessors/)
## kernel
- [Parallel Programming](https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html)
## personal
### OI
- [1](https://blog.baoshuo.ren/post/oi/)
- [NOI](https://oi.baoshuo.ren/noi-outline/)
- 我们都是行走在[镜面边缘](https://www.cnblogs.com/cjjsb/p/10203401.html)的人
- other [links](https://lancern.xyz/category/books/)
## radare 2 [pdf](http://archive.hack.lu/2015/radare2-workshop-slides.pdf)
- TODO
  - hack bios & uefi p77
## small errors in some blog
- [this](https://blog.fxiao.me/got-plt/)
```bash
 ►0x401040      <printf@plt>   jmp    qwordptr[rip+0x2fc2]          <printf>
    ↓
  0x7ffff7dc7e00<printf>       endbr64 
  0x7ffff7dc7e04<printf+4>     sub    rsp,0xd8
pwndbg> dr
Dump of assembler code for function printf@plt:
=> 0x0000000000401040 <+0>:     ff 25 c2 2f 00 00       jmp    QWORD PTR [rip+0x2fc2]        # 0x404008 <printf@got.plt>
   0x0000000000401046 <+6>:     68 01 00 00 00          push   0x1
   0x000000000040104b <+11>:    e9 d0 ff ff ff          jmp    0x401020
pwndbg> telescope 0x401046+0x2fc2
00:0000│  0x404008 (printf@got[plt]) —▸ 0x7ffff7dc7e00 (printf) ◂— endbr64 
01:0008│  0x404010 (data_start) ◂— 0x0
... ↓     6 skipped
pwndbg> info symbol 0x7ffff7dc7e00
printf in section .text of /usr/lib/libc.so.6
# this is true instead of current `$rsp+0x2fc2`
pwndbg> info symbol 0x404008
printf@got[plt] in section .got.plt of /mnt/ubuntu/home/czg/csapp3e/asm/prog
```
# computer basics
## miscs
- SMP and [AMP](https://en.wikipedia.org/wiki/Asymmetric_multiprocessing), also [see](https://github.com/rr-debugger/rr/issues/3531)
## memory
- currently although using paged memory, but has been [abstracted](https://superuser.com/questions/318804/understanding-flat-memory-model-and-segmented-memory-model) to be flat, so just using [near](https://stackoverflow.com/questions/46187337/how-can-the-processor-discern-a-far-return-from-a-near-return) return `C3`
  - Internal Fragmentation is caused by being used by process. [whereas](https://www.tutorialspoint.com/difference-between-internal-fragmentation-and-external-fragmentation#:~:text=Internal%20Fragmentation%20occurs%20when%20a,removed%20from%20the%20main%20memory.&text=Best%20Fit%20Block%20Search%20is,the%20solution%20for%20external%20fragmentation.) External Fragmentation is cauesd by small unused spaces between used spaces.
  - [secondary](https://en.wikipedia.org/wiki/Computer_data_storage) memory
  - paging [diffs with](https://www.tutorialspoint.com/difference-between-paging-and-segmentation) segmentation 
  - [pdf p72](../references/intel_64.pdf) Real-Address Mode Model -> 'Real mode' in x86
- DIMM dual [meaning ('both the sides')](https://www.geeksforgeeks.org/what-is-dimmdual-inline-memory-module/),also [see](https://en.wikipedia.org/wiki/DIMM#History)
  - [LRDIMM,etc](https://community.fs.com/blog/dimm-types-udimm-vs-rdimm-vs-lrdimm.html) different w.r.t the buffer.
  - logical DIMM is one abstraction either by using [buffer](https://techlibrary.hpe.com/docs/iss/DL380_Gen9/setup_install/GUID-85811F5E-E204-474C-B670-2F4C7F90C7AA.html) or [amd doc says p27 by multiple physical DIMMs](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture#cite_note-amd-bkdg-10h-11)
# elf
## `.fini` [explanation](http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html) and `.init`
- can check by debugger 
```bash
$ readelf -S check_cet_supported.out
$ objdump -d check_cet_supported.out
```
# asm code example 
> how to read manual, [1](https://stackoverflow.com/questions/43153964/how-to-read-assembly-opcode-reference) or highly [recommended](https://stackoverflow.com/questions/28664856/how-to-interpret-x86-opcode-map) 
>

> 1 & 2 is [AT&T](https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html) syntax which is [reverse](https://stackoverflow.com/questions/43764578/assembler-parameters-type#comment74573539_43764578) from intel . 
> and they are generated with `-Og` by `gcc -Og -o prog 010-main.c 010-mstore.c -g3`, if no `-Og` may output redundant codes different from listed below.
>
> see [this](../references/x64_cheatsheet.pdf) p7 for register convention.
## 1
```asm
$ objdump -d 010-mstore.o
...
0000000000001139 <multstore>:
    1139:       53                      push   %rbx
    113a:       48 89 d3                mov    %rdx,%rbx
    113d:       e8 ee fe ff ff          call   1030 <_init+0x30>
    1142:       48 89 03                mov    %rax,(%rbx)
    1145:       5b                      pop    %rbx
    1146:       c3                      ret
```
- [push](https://www.felixcloutier.com/x86/push.html) `r64` -> [`rd` p598; note here `REX.W` indicates REX prefix instead of one bit](../references/intel_64.pdf)
### 1.1
- `mov r/m64 r64` [with](https://stackoverflow.com/questions/67368069/how-to-resolve-ambivalence-in-x64-assembly) `mov r64 r/m64`
```bash
0:  48 89 d3                mov    %rdx,%rbx
3:  48 8b da                mov    %rdx,%rbx
```
  > notice: `+` may mean different in opcode, detailed in [p598](../references/intel_64.pdf)
  > [this](https://stackoverflow.com/questions/71774299/how-do-you-understand-rex-w-b8-rd-io-form-for-x86-64-assembly) indicates [`MOV r64, imm64`](https://www.felixcloutier.com/x86/mov) `REX.W` not added to opcode, but prefix.
  > above `push` indicates `rd` is added to opcode.
  - [`89`, where Op/En->`MR`: 'ModRM:r/m (w)' | 'ModRM:reg (r)'](https://www.felixcloutier.com/x86/mov) -> `r/m64 r64`; d3 -> 'dx,bx' satisfies
    > notice: p528 '/digit...REG' -> p598 '/digit:... r/m'
    > so ~~second operand ~~ 'reg' in 'ModRM:r/m' default is r/m, also [see this '/0'](https://stackoverflow.com/questions/15017659/how-to-read-the-intel-opcode-notation/53976236#53976236)
    > so above in p530/529 -> 'EDX' **column** , combing with 'EBX' is `d3`
### 1.2
- TODO: notice p530 [EBX] is data in [memory](https://hackmd.io/@paolieri/x86_64) referenced by `EBX`
  but above `89` in `%rax,(%rbx)` -> `r/m64,r64`, so the latter should be register instead of data in memory ? 
### 1.3
- [call](https://stackoverflow.com/questions/65926175/why-does-e8-f2-ff-ff-ff-translate-to-call-0xfffffff7), so above `e8 ee fe ff ff          call   1030 <_init+0x30>` (here little endien can be tested in `file /mnt/ubuntu/home/czg/csapp3e/asm/010-mstore.o` output `LSB pie executable` ) just means jump to `p/x (signed)0xfffffeee+0x1142`(in gdb) -> `0x1030`
### 1.4
- memory address unit is [byte -> 'associated 8 bits of data' in link](https://sourceware.org/gdb/onlinedocs/gdb/Memory.html)
## 2
```asm
$ gdb ./prog -ex 'br 8' -ex 'r' -ex 'disassemble'
... 
Dump of assembler code for function main:
   0x0000555555555149 <+0>:     sub    $0x18,%rsp
   0x000055555555514d <+4>:     mov    %fs:0x28,%rax
   0x0000555555555156 <+13>:    mov    %rax,0x8(%rsp)
   0x000055555555515b <+18>:    xor    %eax,%eax
=> 0x000055555555515d <+20>:    mov    %rsp,%rdx
   0x0000555555555160 <+23>:    mov    $0x3,%esi
   0x0000555555555165 <+28>:    mov    $0x2,%edi
   0x000055555555516a <+33>:    call   0x5555555551ab <multstore>
   0x000055555555516f <+38>:    mov    (%rsp),%rsi
   0x0000555555555173 <+42>:    lea    0xe8a(%rip),%rdi        # 0x555555556004
   0x000055555555517a <+49>:    mov    $0x0,%eax
   0x000055555555517f <+54>:    call   0x555555555040 <p  rintf@plt>
   0x0000555555555184 <+59>:    mov    0x8(%rsp),%rax
   0x0000555555555189 <+64>:    sub    %fs:0x28,%rax
   0x0000555555555192 <+73>:    jne    0x55555555519e <main+85>
   0x0000555555555194 <+75>:    mov    $0x0,%eax
   0x0000555555555199 <+80>:    add    $0x18,%rsp
   0x000055555555519d <+84>:    ret
   0x000055555555519e <+85>:    call   0x555555555030 <__stack_chk_fail@plt>
End of assembler dump.
```
- [%fs:0x28](https://stackoverflow.com/questions/10325713/why-does-this-memory-address-fs0x28-fs0x28-have-a-random-value) 
- [0x8(%rsp)](https://stackoverflow.com/questions/19748074/meaning-of-0x8rsp)
- '<+18>': zero [extend](https://stackoverflow.com/questions/11177137/why-do-x86-64-instructions-on-32-bit-registers-zero-the-upper-part-of-the-full-6)
  - with 8bit, [use](https://www.felixcloutier.com/x86/movzx) (also refer to register renaming) `movzx`

## 3(begin intel asm flavor)
```asm
0x0000555555558006 <+6>:     00 00                   add    BYTE PTR [rax],al
```
or `att`
```asm
0x0000555555558006 <+6>:     00 00                   add    %al,(%rax)
```
- maybe 'r/m 64' [can](https://stackoverflow.com/questions/68605218/understanding-instruction-encoding) be 'r/m 32' with suffix like `w` in `movw`
  - so maybe above code `BYTE PTR` can make `r/m 64` -> `r/m 8`, and therefore in 64 bit OS -> [00 /r](https://www.felixcloutier.com/x86/add) and [pdf p530](../references/intel_64.pdf)
  > after all, disasm from binary to assembly, so binary is first to read. (assembly code can be different based on how interpreted)
## 4
```asm


0x555555558002 <__stack_chk_fail@got.plt+2>: push   rbp
```
## 5
```asm
0x00007ffff7fe5b68:  48 c1 e2 20             shl    rdx,0x20
```
- `48` -> REX.W; 
  `c1` [opcode](https://www.felixcloutier.com/x86/sal:sar:shl:shr) -> `shl r/m64, imm8`; 
  `e2` [pdf p529](../references/intel_64.pdf) -> `edx`(`rdx` when `REX.W` set ,p533), 
  `20`->`id`

## 6
```asm
0x00007ffff7fe5b61:  80 25 7e 82 01 00 df    and    BYTE PTR [rip+0x1827e],0xdf        # 0x7ffff7ffdde6 <_rtld_global+3558>
```
- `80` -> `AND r/m8, imm8	` [here](https://www.felixcloutier.com/x86/and)
  `25` -> `disp32` in column 4 [pdf p530](../references/intel_64.pdf)
  `7e 82 01 00` -> 4 byte(specified in [pdf p525](../references/intel_64.pdf)) little endian of `0x1827e`
  `df` -> `id`
## 7 AVX
- see [VEX field bit intel doc p539 (say `C5H form` meaing) ](https://stackoverflow.com/questions/51773399/vex-prefixes-encoding-and-sse-avx-movupd-s-instructions) (where also say `WIG` meaning)
```asm
0x00007ffff7ecd9a4:  c5 f9 6e c6             vmovd  xmm0,esi
```
- `vmovd  xmm0,esi` -> `VMOVD xmm1, r32/m32` -> `VEX.128.66.0F.W0 6E /`(here `/` may be mistaken, should be `/r`)
  - here `xmm1` in [pdf p603](../references/intel_64.pdf) -> `indicates the first source operand using an XMM register`
  - [4800h](https://www.techpowerup.com/cpu-specs/ryzen-7-4800h.c2280) not contain avx-512, so not use EVEX [pdf p561](../references/intel_64.pdf)
    - also check `grep avx /proc/cpuinfo --color=always | uniq` only has `avx` and `avx2`
- `c5` -> [pdf p539](../references/intel_64.pdf) -> `11000101`
  so use 2-byte VEX prefix
- `f9` -> `11111001` -> `1 1111 0 01` based on [this form '|~R |     ~vvvv     | L |   pp  |' ](https://wiki.osdev.org/X86-64_Instruction_Encoding#VEX.2FXOP_opcodes)
  - from binary to asm(recommended)
    - `R` = 1 -> 32bit [pdf p539](../references/intel_64.pdf)
    - `vvvv` should read `Instruction Operand Encoding` table [pdf p601,1997](../references/intel_64.pdf),here is encoded by `ModRM` -> `1111`
    - `L` & `pp` see below
  - from asm to binary(not recommended because the asm is generated by disassembly)
    - `128` -> `L` = 0 [pdf p599](../references/intel_64.pdf)
    - `66` -> [SIMD(single instruction, multiple data) prefix](https://codeforces.com/blog/entry/98594#:~:text=SIMD%20stands%20for%20single%20instruction,the%20code%20to%20run%20faster.)
- `6e` -> opcode
- `c6` in `R=1` 32bit mode [pdf p530](../references/intel_64.pdf) based on this 'Instruction Operand Encoding' [table](https://www.felixcloutier.com/x86/movd:movq) -> 
  xmm1: ModRM:reg -> xmm0
  r32/m32: ModRM:r/m -> ESI
## 8 `_GLOBAL_OFFSET_TABLE_` shown in `pwndbg`
- can use `r2 -AA` below
- `R_386_JUMP_SLOT` & `R_386_GLOB_DAT` [meaning](https://docs.oracle.com/cd/E19957-01/806-0641/chapter6-26/index.html) [also](http://netwinder.osuosl.org/users/p/patb/public_html/elf_relocs.html)
> [diffs (see 'References to a function address')](https://refspecs.linuxfoundation.org/ELF/zSeries/lzsabi0_zSeries/x2251.html) of `got` and `plt`
>
> also see [this `?v reloc.func_name`](https://www.megabeets.net/a-journey-into-radare-2-part-2/) and [this](https://stackoverflow.com/questions/9685699/what-is-global-offset-table). so got is updated by linker to real address. and as [this 'For example' ](https://ctf101.org/binary-exploitation/what-is-the-got/) says
>
> also [GOTOFF](https://stackoverflow.com/questions/58346418/difference-between-got-and-gotoff)(offset)
>
> [R_386_JUMP_SLOT](https://stackoverflow.com/questions/11676472/what-is-the-difference-between-got-and-got-plt-section)
- below is mainly inspired by [this ‘Global Offset Table (GOT) and Procedure Linkage Table (PLT) - Binary Exploitation PWN101’ by RazviOverflow](https://www.youtube.com/watch?v=B4-wVdQo040)
```asm
; pwndbg
0x555555555020                  push   qwordptr[rip+0x2fca]          <_GLOBAL_OFFSET_TABLE_+8>
; r2
0x5630f4198020      ff35ca2f0000   push qword [0x5630f419aff0]
```
- reverse check
  - [pwndbbg](https://reverseengineering.stackexchange.com/questions/23311/dumping-the-got-with-gdb-at-run-time)
    - guess:
    ```asm
    pwndbg> got
    GOT protection: Partial RELRO | GOT functions: 2
    [0x555555558000] __stack_chk_fail@GLIBC_2.4 -> 0x555555555036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
    [0x555555558008] printf@GLIBC_2.2.5 -> 0x555555555046 (printf@plt+6) ◂— push 1
    ; above 0x555555558008 -> below 000000004008
    [czg /mnt/ubuntu/home/czg/csapp3e/asm]$ readelf --relocs ./prog 

    Relocation section '.rela.dyn' at offset 0x5a0 contains 8 entries:
      Offset          Info           Type           Sym. Value    Sym. Name + Addend
    000000003dd0  000000000008 R_X86_64_RELATIVE                    1140
    000000003dd8  000000000008 R_X86_64_RELATIVE                    10f0
    000000004018  000000000008 R_X86_64_RELATIVE                    4018
    000000003fc0  000100000006 R_X86_64_GLOB_DAT 0000000000000000 __libc_start_main@GLIBC_2.34 + 0
    000000003fc8  000200000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_deregisterTM[...] + 0
    000000003fd0  000500000006 R_X86_64_GLOB_DAT 0000000000000000 __gmon_start__ + 0
    000000003fd8  000600000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_registerTMCl[...] + 0
    000000003fe0  000700000006 R_X86_64_GLOB_DAT 0000000000000000 __cxa_finalize@GLIBC_2.2.5 + 0

    Relocation section '.rela.plt' at offset 0x660 contains 2 entries:
      Offset          Info           Type           Sym. Value    Sym. Name + Addend
    000000004000  000300000007 R_X86_64_JUMP_SLO 0000000000000000 __stack_chk_fail@GLIBC_2.4 + 0
    000000004008  000400000007 R_X86_64_JUMP_SLO 0000000000000000 printf@GLIBC_2.2.5 + 0
    ```
      - TODO weird '<>'
      ```asm
        0x55555555504b<printf@plt+11>   jmp    0x555555555020                <0x555555555020>
    ↓
        ►0x555555555020                  push   qwordptr[rip+0x2fca]          <_GLOBAL_OFFSET_TABLE_+8>

      ```
      also use `nm ./prog` to see
  - TODO r2
  ```asm
  ;https://reverseengineering.stackexchange.com/questions/17379/radare-cant-seek-to-start-symbol
  f*
  [0x5630f419a976]> f~got
  0x5630f419afc0 40 section..got
  0x5630f419afe8 40 section..got.plt
  [0x5630f419a976]> s 0x5630f419afe8
  [0x5630f419afe8]> pd 2
  │           ;-- section..got.plt:
  │           ;-- _GLOBAL_OFFSET_TABLE_:
  │       ┌─< 0x5630f419afe8      e03d           loopne 0x5630f419b027   ; reloc.__cxa_finalize+0x47 ; decrement count; jump short if ecx!=0 and zf=0; [23] -rw- section size 40 named .got.plt
  │       │   0x5630f419afea      0000           add byte [rax], al      ; adds src and dst, stores result on dst
  ```
  [.got vs .got.plt](https://maskray.me/blog/2021-08-29-all-about-global-offset-table)
### `nm` [this](https://stackoverflow.com/questions/9686764/how-can-i-get-the-global-offset-table-address-in-my-program)
```asm
$ gcc -fno-pic -Og -o test_got test_got.c -g3 -no-pie # this not
$ gcc -fPIE -no-pie test_got.c -o test_got # this works
$ nm ./test_got
0000000000404028 B __bss_start
0000000000404018 D __data_start
0000000000404018 W data_start
0000000000401090 T _dl_relocate_static_pie
0000000000404020 D __dso_handle
0000000000403df8 d _DYNAMIC
0000000000404028 D _edata
0000000000404030 B _end
                 U exit@GLIBC_2.2.5
000000000040117c T _fini
0000000000403fe8 d _GLOBAL_OFFSET_TABLE_
                 w __gmon_start__
...
$ r2 -AA -d /mnt/ubuntu/home/czg/csapp3e/asm/test_got
...
[0x7f0a71588ed0]> is~GLOBAL_
5   0x00002fe8 0x00403fe8 LOCAL  OBJ    0        _GLOBAL_OFFSET_TABLE_
[0x7f7bf15b9ed0]> iS~got.p
23  0x00002fe8   0x30 0x00403fe8   0x30 -rw- PROGBITS    .got.plt
[0x7f7bf15b9ed0]> pd 3@0x00403fe8
            ;-- section..got.plt:
            ;-- _GLOBAL_OFFSET_TABLE_:
...
```
### disassembly 'wrong' if 'cutted' from [this 17:52](https://www.youtube.com/watch?v=B4-wVdQo040) (po because it is located in `.got/.got.plt`(sections can be seen by `iS` in r2) it should be viewed as address instead of instruction) <a id="dis"></a>
```asm
[0x555f3c702040]> pd 2;dr rip
            ; CALL XREF from main @ 0x555f3c70217f(x)
┌ 6: int sym.imp.printf (const char *format);
│ rg: 0 (vars 0, args 0)
│ bp: 0 (vars 0, args 0)
│ sp: 0 (vars 0, args 0)
└           0x555f3c702040 b    ff25c22f0000   jmp qword [reloc.printf] ; [0x555f3c705008:8]=0x555f3c702046 rip ; "F p<_U" ; jump
            ;-- rip:
            0x555f3c702046      6801000000     push 1                  ; rbp ; push word, doubleword or quadword onto the stack
0x555f3c702046
[0x555f3c702040]> pd 5@reloc.printf
│           ;-- reloc.printf:
│           ; DATA XREF from sym.imp.printf @ 0x555f3c702040(x)
│           0x555f3c705008      4620703c       and byte [rax + 0x3c], r14b ; binary and operation between src and dst, stores result on dst
│           0x555f3c70500c      5f             pop rdi                 ; pops last element of stack and stores the result in argument
│           0x555f3c70500d      55             push rbp                ; push word, doubleword or quadword onto the stack
...
; notice in little endien, above three instrucion is 555f3c702046(here 4620703c get inversed besed on byte unit)
```
### dynamic link( whether `-no-pie` and `checksec` no canary or not ,all fine [use two `printf/puts` to make two `dc` work without quit])
```asm
[czg ~/czg_scripts]$ cat test_got.c
// Build with: gcc -m32 -no-pie -g -o plt plt.c

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  puts("Hello world!");
  puts("Hello world!");
  exit(0);
}
[czg ~/czg_scripts]$ gcc -g -o test_got test_got.c # -no-pie to make address same every execute
[czg ~/czg_scripts]$ r2 -A -d ~/czg_scripts/test_got
INFO: Analyze all flags starting with sym. and entry0 (aa)
INFO: Analyze all functions arguments/locals (afva@@@F)
INFO: Analyze function calls (aac)
INFO: Analyze len bytes of instructions for references (aar)
INFO: Finding and parsing C++ vtables (avrr)
INFO: Skipping type matching analysis in debugger mode (aaft)
INFO: Propagate noreturn information (aanr0x5653c8441000ytes>@<offset>.  For example: 3x20@0x33 will show 3 hexdumps of 20 bytes at 0x33
[0x7f840813fed0]> db sym.imp.puts;dc;pxr 20@reloc.puts
INFO: hit breakpoint at: 0x5653c843e030
0x5653c8441000 0x00005653c843e036   6.C.SV.. @ reloc.puts /home/czg/czg_scripts/test_got .plt program R X 'push 0' 'test_got'
0x5653c8441008 0x00005653c843e046   F.C.SV.. @ reloc.exit /home/czg/czg_scripts/test_got .plt program R X 'push 1' 'test_got'
[0x5653c843e030]> dc;pxr 20@reloc.puts
Hello world!
INFO: hit breakpoint at: 0x5653c843e030
0x5653c8441000 0x00007f8407f4bc10   ........ @ reloc.puts
0x5653c8441008 0x00005653c843e046   F.C.SV.. @ reloc.exit /home/czg/czg_scripts/test_got .plt program R X 'push 1' 'test_got'
[0x5653c843e030]> dmi libc ; tell r2 libc location for comment https://reverseengineering.stackexchange.com/questions/18819/radare2-debugging-how-to-get-into-lazy-imported-functions dynamic link
Do you want to print 3041 lines? (y/N)n
[0x5653c843e030]> pxr 20@reloc.puts
0x5653c8441000 0x00007f8407f4bc10   ........ @ reloc.puts /usr/lib/libc.so.6 library R X 'endbr64' 'libc.so.6'
0x5653c8441008 0x00005653c843e046   F.C.SV.. @ reloc.exit /home/czg/czg_scripts/test_got .plt program R X 'push 1' 'test_got'
```

```asm
$ gcc -g -no-pie -o test_got test_got.c # -no-pie to make address same every execute
[czg ~/czg_scripts]$ r2 -A -d ~/czg_scripts/test_got
[0x7fef740cced0]> afl~puts
0x00401030    1      6 sym.imp.puts
[0x7fef740cced0]> iS~plt
11  0x000005b0   0x30 0x004005b0   0x30 -r-- RELA        .rela.plt
13  0x00001020   0x30 0x00401020   0x30 -r-x PROGBITS    .plt
23  0x00002fe8   0x28 0x00403fe8   0x28 -rw- PROGBITS    .got.plt
db sym.imp.puts;dc
pxr 20@reloc.puts ; these two same as above


; it shows '.got.plt' -> '_GLOBAL_OFFSET_TABLE_'
[0x00404000]> s reloc.puts
[0x00404000]> iS.
Current section

nth paddr       size vaddr       vsize perm type     name
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――
0   0x00002fe8  0x28 0x00403fe8   0x28 -rw- PROGBITS .got.plt

[0x00404000]> pd 2 @0x00403fe8
            ;-- section..got.plt:
            ;-- _GLOBAL_OFFSET_TABLE_:
            0x00403fe8      f8             clc                         ; clear carry flag; [23] -rw- section size 40 named .got.plt
            0x00403fe9      3d40000000     cmp eax, 0x40               ; elf_phdr ; compare two operands
[0x00404000]> dc
Hello world!
INFO: hit breakpoint at: 0x401030
^C
[0x00401030]> dm~ld
0x00007fef740b2000 - 0x00007fef740b3000 - usr     4K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2
0x00007fef740b3000 - 0x00007fef740d9000 - usr   152K s r-x /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r_x
0x00007fef740d9000 - 0x00007fef740e3000 - usr    40K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r__
0x00007fef740e3000 - 0x00007fef740e5000 - usr     8K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.rw_
0x00007fef740e5000 - 0x00007fef740e7000 - usr     8K s rw- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; r15
[0x00401030]> pd 3
        ╎   ;-- rip:
        ╎   ; CALL XREFS from dbg.main @ 0x40114f(x), 0x40115e(x)
┌ 6: int sym.imp.puts (const char *s);
│ rg: 0 (vars 0, args 0)
│ bp: 0 (vars 0, args 0)
│ sp: 0 (vars 0, args 0)
└       ╎   0x00401030 b    ff25ca2f0000   jmp qword [reloc.puts]      ; [0x404000:8]=0x7fef73ed8c10 ; jump
        ╎   0x00401036      6800000000     push 0                      ; push word, doubleword or quadword onto the stack
        └─< 0x0040103b      e9e0ffffff     jmp section..plt            ; jump
[0x00401030]> 2ds
; here dynamic link works
[0x7fef73ed8c10]> pd 2
            0x7fef73ed8c10      f30f1efa       endbr64
            ;-- rip:
            0x7fef73ed8c14      4156           push r14                ; push word, doubleword or quadword onto the stack
```
### `_GLOBAL_OFFSET_TABLE_` actually means (based on comparison of `r2` and `pwndbg`) (use `-no-pie` with `gcc` to compare)

### endbr64 (also ~~see~~ has contents related with dynamic link with `pxr @ reloc.printf`)
```asm
$ gcc -Og -o prog 010-main.c 010-mstore.c -g3 -no-pie
$ r2 -A -d /mnt/ubuntu/home/czg/csapp3e/asm/prog
...
[0x00401040]> dc
2 * 3 --> 6
INFO: hit breakpoint at: 0x401040
[0x00401040]> pxr @ reloc.printf
0x00404008 0x00007f9e7dc87e00   .~.}.... @ reloc.printf ;plt works
0x00404010 ..[ null bytes ]..   00000000 loc.__data_start
[0x00401040]> pd 3
        ╎   ;-- rip:
        ╎   ; CALL XREFS from dbg.main @ 0x401170(x), 0x401181(x)
┌ 6: int sym.imp.printf (const char *format);
│ rg: 0 (vars 0, args 0)
│ bp: 0 (vars 0, args 0)
│ sp: 0 (vars 0, args 0)
└       ╎   0x00401040 b    ff25c22f0000   jmp qword [reloc.printf]    ; [0x404008:8]=0x7f9e7dc87e00 ; jump
        ╎   0x00401046      6801000000     push 1                      ; rbp ; push word, doubleword or quadword onto the stack
        └─< 0x0040104b      e9d0ffffff     jmp section..plt            ; jump
[0x00401040]> 2ds
[0x7f9e7dc87e00]> dmi libc~7f9e7dc87e00 ; section..plt
1618 0x0004fe00 0x7f9e7dc87e00 GLOBAL FUNC 205       _IO_printf
2511 0x0004fe00 0x7f9e7dc87e00 GLOBAL FUNC 205       printf
[0x7f9e7dc87e00]> pd-- 2
        └─< 0x7f9e7dc87df9      eb8f           jmp 0x7f9e7dc87d8a      ; jump
            0x7f9e7dc87dfb      0f1f440000     nop dword [rax + rax]   ; no operation
            0x7f9e7dc87e00      f30f1efa       endbr64 ; here ‘section..plt’
            ;-- rip:
            0x7f9e7dc87e04      4881ecd80000.  sub rsp, 0xd8           ; substract src and dst, stores result on dst
```
#### pwndbg
```bash
# not dynamic link
pwndbg> telescope 0x401046+0x2fc2
00:0000│  0x404008 (printf@got[plt]) —▸ 0x401046 (printf@plt+6) ◂— push 1
01:0008│  0x404010 (data_start) ◂— 0x0
... ↓     6 skipped
pwndbg> br printf
pwndbg> c
pwndbg> telescope 0x401046+0x2fc2

00:0000│  0x404008 (printf@got[plt]) —▸ 0x7ffff7dc7e00 (printf) ◂— endbr64 
01:0008│  0x404010 (data_start) ◂— 0x0
... ↓     6 skipped
```
### `rip` register save the next instruction location [pdf p536](../references/intel_64.pdf) ~~updates before `jmp`~~
```bash
pwndbg> p $rip+0x2fc2
$3 = (void (*)()) 0x404008 <printf@got[plt]>
pwndbg> dr # disass /r
Dump of assembler code for function printf@plt:
   0x0000000000401040 <+0>:     ff 25 c2 2f 00 00       jmp    QWORD PTR [rip+0x2fc2]        # 0x404008 <printf@got.plt>
=> 0x0000000000401046 <+6>:     68 01 00 00 00          push   0x1
   0x000000000040104b <+11>:    e9 d0 ff ff ff          jmp    0x401020
End of assembler dump.
pwndbg> p $rip
$4 = (void (*)()) 0x401046 <printf@plt+6>
pwndbg> x $rip+0x2fc2
0x404008 <printf@got.plt>:      0x00401046
```
#### how memory save data [pdf p90](../references/intel_64.pdf)
```bash
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x401020        push   qwordptr[rip+0x2fca]          <_GLOBAL_OFFSET_TABLE_+8>
 ►0x401026        jmp    qwordptr[rip+0x2fcc]          <0x7ffff7fdcb50>
    ↓
  0x7ffff7fdcb50  endbr64
pwndbg> disass /r 0x401026,0x401040
Dump of assembler code from 0x401026 to 0x401040:
=> 0x0000000000401026:  ff 25 cc 2f 00 00       jmp    QWORD PTR [rip+0x2fcc]        # 0x403ff8
   0x000000000040102c:  0f 1f 40 00             nop    DWORD PTR [rax+0x0]
   0x0000000000401030 <__stack_chk_fail@plt+0>: ff 25 ca 2f 00 00       jmp    QWORD PTR [rip+0x2fca]        # 0x404000 <__stack_chk_fail@got.plt>
   0x0000000000401036 <__stack_chk_fail@plt+6>: 68 00 00 00 00          push   0x0
   0x000000000040103b <__stack_chk_fail@plt+11>:        e9 e0 ff ff ff          jmp    0x401020
End of assembler dump.
# little endien
pwndbg> x/g 0x000000000040102c+0x2fca
0x403ff6:       0x7ffff7fdcb500000 # -> above `  0x7ffff7fdcb50  endbr64`
pwndbg> x/b 0x000000000040102c+0x2fca
0x403ff6:       0x00
pwndbg> x/w 0x000000000040102c+0x2fca
0x403ff6:       0xcb500000
```
### '<_GLOBAL_OFFSET_TABLE_+8>' [meaning](https://reverseengineering.stackexchange.com/questions/23311/dumping-the-got-with-gdb-at-run-time)
```bash
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x401040<printf@plt>      jmp    qwordptr[rip+0x2fc2]          <printf@got[plt]>
 
 ►0x401046<printf@plt+6>    push   1
  0x40104b<printf@plt+11>   jmp    0x401020                      <0x401020>
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> x $rip+0x2fc2
0x404008 <printf@got.plt>:      0x00401046
pwndbg> got
GOT protection: Partial RELRO | GOT functions: 2
[0x404000] __stack_chk_fail@GLIBC_2.4 -> 0x401036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
[0x404008] printf@GLIBC_2.2.5 -> 0x401046 (printf@plt+6) ◂— push 1
```
so this '<printf@got[plt]>' probably indicates instruction address -> '0x401046'

```bash
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x40104b<printf@plt+11>   jmp    0x401020                      <0x401020>
    ↓
 ►0x401020                  push   qwordptr[rip+0x2fca]          <_GLOBAL_OFFSET_TABLE_+8>
  0x401026                  jmp    qwordptr[rip+0x2fcc]          <0x7ffff7fdcb50>
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> tele 0x401026+0x2fca
00:0000│  0x403ff0 (_GLOBAL_OFFSET_TABLE_+8) —▸ 0x7ffff7ffe2c0 ◂— 0x0
01:0008│  0x403ff8 (_GLOBAL_OFFSET_TABLE_+16) —▸ 0x7ffff7fdcb50 ◂— endbr64 
02:0010│  0x404000 (__stack_chk_fail@got.plt) —▸ 0x401036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
03:0018│  0x404008 (printf@got[plt]) —▸ 0x401046 (printf@plt+6) ◂— push 1
04:0020│  0x404010 (data_start) ◂— 0x0
... ↓     3 skipped
pwndbg> vmmap
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
             Start                End Perm     Size Offset File
          0x400000           0x401000 r--p     1000      0 /mnt/ubuntu/home/czg/csapp3e/asm/prog
          0x401000           0x402000 r-xp     1000   1000 /mnt/ubuntu/home/czg/csapp3e/asm/prog
          0x402000           0x403000 r--p     1000   2000 /mnt/ubuntu/home/czg/csapp3e/asm/prog
          0x403000           0x404000 r--p     1000   2000 /mnt/ubuntu/home/czg/csapp3e/asm/prog
          0x404000           0x405000 rw-p     1000   3000 /mnt/ubuntu/home/czg/csapp3e/asm/prog
    0x7ffff7c8d000     0x7ffff7c90000 rw-p     3000      0 [anon_7ffff7c8d]
    0x7ffff7c90000     0x7ffff7c9e000 r--p     e000      0 /usr/lib/libm.so.6
    0x7ffff7c9e000     0x7ffff7d18000 r-xp    7a000   e000 /usr/lib/libm.so.6
    0x7ffff7d18000     0x7ffff7d76000 r--p    5e000  88000 /usr/lib/libm.so.6
    0x7ffff7d76000     0x7ffff7d77000 r--p     1000  e5000 /usr/lib/libm.so.6
    0x7ffff7d77000     0x7ffff7d78000 rw-p     1000  e6000 /usr/lib/libm.so.6
    0x7ffff7d78000     0x7ffff7d9a000 r--p    22000      0 /usr/lib/libc.so.6
    0x7ffff7d9a000     0x7ffff7ef4000 r-xp   15a000  22000 /usr/lib/libc.so.6
    0x7ffff7ef4000     0x7ffff7f4c000 r--p    58000 17c000 /usr/lib/libc.so.6
    0x7ffff7f4c000     0x7ffff7f50000 r--p     4000 1d4000 /usr/lib/libc.so.6
    0x7ffff7f50000     0x7ffff7f52000 rw-p     2000 1d8000 /usr/lib/libc.so.6
    0x7ffff7f52000     0x7ffff7f5f000 rw-p     d000      0 [anon_7ffff7f52]
    0x7ffff7f7d000     0x7ffff7f85000 r--p     8000      0 /usr/lib/liblua.so.5.4.4
    0x7ffff7f85000     0x7ffff7fb3000 r-xp    2e000   8000 /usr/lib/liblua.so.5.4.4
    0x7ffff7fb3000     0x7ffff7fbf000 r--p     c000  36000 /usr/lib/liblua.so.5.4.4
    0x7ffff7fbf000     0x7ffff7fc1000 r--p     2000  42000 /usr/lib/liblua.so.5.4.4
    0x7ffff7fc1000     0x7ffff7fc2000 rw-p     1000  44000 /usr/lib/liblua.so.5.4.4
    0x7ffff7fc2000     0x7ffff7fc4000 rw-p     2000      0 [anon_7ffff7fc2]
    0x7ffff7fc4000     0x7ffff7fc8000 r--p     4000      0 [vvar]
    0x7ffff7fc8000     0x7ffff7fca000 r-xp     2000      0 [vdso]
    0x7ffff7fca000     0x7ffff7fcb000 r--p     1000      0 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7fcb000     0x7ffff7ff1000 r-xp    26000   1000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ff1000     0x7ffff7ffb000 r--p     a000  27000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ffb000     0x7ffff7ffd000 r--p     2000  31000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ffd000     0x7ffff7fff000 rw-p     2000  33000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffffffde000     0x7ffffffff000 rw-p    21000      0 [stack]
0xffffffffff600000 0xffffffffff601000 --xp     1000      0 [vsyscall]
# notice above 0x7ffff7ffe2c0 is in '0x7ffff7ffd000 ~ 0x7ffff7fff000' -> /usr/lib/ld-linux-x86-64.so.2
pwndbg> apropos section
...
maintenance info sections -- List the BFD sections of the exec and core files.
...
pwndbg> maintenance info sections
Exec file: `/mnt/ubuntu/home/czg/csapp3e/asm/prog', file type elf64-x86-64.
 [0]      0x00400318->0x00400334 at 0x00000318: .interp ALLOC LOAD READONLY DATA HAS_CONTENTS
 [1]      0x00400338->0x00400378 at 0x00000338: .note.gnu.property ALLOC LOAD READONLY DATA HAS_CONTENTS
 [2]      0x00400378->0x0040039c at 0x00000378: .note.gnu.build-id ALLOC LOAD READONLY DATA HAS_CONTENTS
 [3]      0x0040039c->0x004003bc at 0x0000039c: .note.ABI-tag ALLOC LOAD READONLY DATA HAS_CONTENTS
 [4]      0x004003c0->0x004003dc at 0x000003c0: .gnu.hash ALLOC LOAD READONLY DATA HAS_CONTENTS
 [5]      0x004003e0->0x00400488 at 0x000003e0: .dynsym ALLOC LOAD READONLY DATA HAS_CONTENTS
 [6]      0x00400488->0x00400523 at 0x00000488: .dynstr ALLOC LOAD READONLY DATA HAS_CONTENTS
 [7]      0x00400524->0x00400532 at 0x00000524: .gnu.version ALLOC LOAD READONLY DATA HAS_CONTENTS
 [8]      0x00400538->0x00400578 at 0x00000538: .gnu.version_r ALLOC LOAD READONLY DATA HAS_CONTENTS
 [9]      0x00400578->0x004005d8 at 0x00000578: .rela.dyn ALLOC LOAD READONLY DATA HAS_CONTENTS
 [10]     0x004005d8->0x00400608 at 0x000005d8: .rela.plt ALLOC LOAD READONLY DATA HAS_CONTENTS
 [11]     0x00401000->0x0040101b at 0x00001000: .init ALLOC LOAD READONLY CODE HAS_CONTENTS
 [12]     0x00401020->0x00401050 at 0x00001020: .plt ALLOC LOAD READONLY CODE HAS_CONTENTS
 [13]     0x00401050->0x004011bc at 0x00001050: .text ALLOC LOAD READONLY CODE HAS_CONTENTS
 [14]     0x004011bc->0x004011c9 at 0x000011bc: .fini ALLOC LOAD READONLY CODE HAS_CONTENTS
 [15]     0x00402000->0x00402013 at 0x00002000: .rodata ALLOC LOAD READONLY DATA HAS_CONTENTS
 [16]     0x00402014->0x00402050 at 0x00002014: .eh_frame_hdr ALLOC LOAD READONLY DATA HAS_CONTENTS
 [17]     0x00402050->0x00402110 at 0x00002050: .eh_frame ALLOC LOAD READONLY DATA HAS_CONTENTS
 [18]     0x00403de8->0x00403df0 at 0x00002de8: .init_array ALLOC LOAD DATA HAS_CONTENTS
 [19]     0x00403df0->0x00403df8 at 0x00002df0: .fini_array ALLOC LOAD DATA HAS_CONTENTS
 [20]     0x00403df8->0x00403fc8 at 0x00002df8: .dynamic ALLOC LOAD DATA HAS_CONTENTS
 [21]     0x00403fc8->0x00403fe8 at 0x00002fc8: .got ALLOC LOAD DATA HAS_CONTENTS
 [22]     0x00403fe8->0x00404010 at 0x00002fe8: .got.plt ALLOC LOAD DATA HAS_CONTENTS
 [23]     0x00404010->0x00404020 at 0x00003010: .data ALLOC LOAD DATA HAS_CONTENTS
 [24]     0x00404020->0x00404028 at 0x00003020: .bss ALLOC
 [25]     0x00000000->0x0000001b at 0x00003020: .comment READONLY HAS_CONTENTS
 [26]     0x00000000->0x00000060 at 0x0000303b: .debug_aranges READONLY HAS_CONTENTS
 [27]     0x00000000->0x00000272 at 0x0000309b: .debug_info READONLY HAS_CONTENTS
 [28]     0x00000000->0x000001c2 at 0x0000330d: .debug_abbrev READONLY HAS_CONTENTS
 [29]     0x00000000->0x00000170 at 0x000034cf: .debug_line READONLY HAS_CONTENTS
 [30]     0x00000000->0x00005c25 at 0x0000363f: .debug_str READONLY HAS_CONTENTS
 [31]     0x00000000->0x000001d0 at 0x00009264: .debug_line_str READONLY HAS_CONTENTS
 [32]     0x00000000->0x00000065 at 0x00009434: .debug_loclists READONLY HAS_CONTENTS
 [33]     0x00000000->0x0000134f at 0x00009499: .debug_macro READONLY HAS_CONTENTS
# here 0x403ff0 is in `.got.plt`

# or more simple
pwndbg> | maintenance info target-sections | grep 403f

 [20]     0x00403df8->0x00403fc8 at 0x00002df8: .dynamic ALLOC LOAD DATA HAS_CONTENTS
          Start: 0x00403df8, End: 0x00403fc8, Owner token: 0x55ea8716bc98
 [21]     0x00403fc8->0x00403fe8 at 0x00002fc8: .got ALLOC LOAD DATA HAS_CONTENTS
          Start: 0x00403fc8, End: 0x00403fe8, Owner token: 0x55ea8716bc98
 [22]     0x00403fe8->0x00404010 at 0x00002fe8: .got.plt ALLOC LOAD DATA HAS_CONTENTS
          Start: 0x00403fe8, End: 0x00404010, Owner token: 0x55ea8716bc98
pwndbg> | maintenance info target-sections | grep 0x55ea87f508d0 -B 2 | head

From '/lib64/ld-linux-x86-64.so.2', file type elf64-x86-64:
 [0]      0x000002a8->0x000002e8 at 0x000002a8: .note.gnu.property ALLOC LOAD READONLY DATA HAS_CONTENTS
          Start: 0x7ffff7fca2a8, End: 0x7ffff7fca2e8, Owner token: 0x55ea87f508d0
 [1]      0x000002e8->0x0000030c at 0x000002e8: .note.gnu.build-id ALLOC LOAD READONLY DATA HAS_CONTENTS
          Start: 0x7ffff7fca2e8, End: 0x7ffff7fca30c, Owner token: 0x55ea87f508d0
 [2]      0x00000310->0x000004d8 at 0x00000310: .hash ALLOC LOAD READONLY DATA HAS_CONTENTS
          Start: 0x7ffff7fca310, End: 0x7ffff7fca4d8, Owner token: 0x55ea87f508d0
 [3]      0x000004d8->0x000006bc at 0x000004d8: .gnu.hash ALLOC LOAD READONLY DATA HAS_CONTENTS
          Start: 0x7ffff7fca4d8, End: 0x7ffff7fca6bc, Owner token: 0x55ea87f508d0
 [4]      0x000006c0->0x00000a68 at 0x000006c0: .dynsym ALLOC LOAD READONLY DATA HAS_CONTENTS
```
#### in `r2` (notice with `no-pie` only code is static, lib related with `ld` all diff)
```asm
$ r2 -A -d /mnt/ubuntu/home/czg/csapp3e/asm/prog
[0x00401020]> pd 3
            ;-- section..plt:
            ;-- rip:
            0x00401020      ff35ca2f0000   push qword [0x00403ff0]     ; push word, doubleword or quadword onto the stack; [13] -r-x section size 48 named .plt
            0x00401026      ff25cc2f0000   jmp qword [0x00403ff8]      ; [0x403ff8:8]=0x7f06543ddb50 ; jump
            0x0040102c      0f1f4000       nop dword [rax]             ; no operation
; here because in .got.plt , so use `pxr` instead of `pd`. [2](#dis) link above
[0x00401020]> pxr 0x8@0x00403ff0
0x00403ff0 0x00007f06543ff2c0   ..?T.... /usr/lib/ld-linux-x86-64.so.2 library R W 0x0
[0x00401020]> iS~got
22  0x00002fc8    0x20 0x00403fc8    0x20 -rw- PROGBITS    .got
23  0x00002fe8    0x28 0x00403fe8    0x28 -rw- PROGBITS    .got.plt
[0x00401020]> pxr 0x10@0x00403fe8
0x00403fe8 0x0000000000403df8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210168 /mnt/ubuntu/home/czg/csapp3e/asm/prog .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R 0x1
0x00403ff0 0x00007f06543ff2c0   ..?T.... /usr/lib/ld-linux-x86-64.so.2 library R W 0x0 ; here is above `pwndbg` '_GLOBAL_OFFSET_TABLE_+8'
```
##### view stack (continue after above)
```asm
[0x00401020]> pd 1
            ;-- section..plt:
            0x00401020      ff35ca2f0000   push qword [0x00403ff0]     ; push word, doubleword or quadword onto the stack; [13] -r-x section size 48 named .plt
[0x00401020]> px 0x10@rsp
- offset -      3031 3233 3435 3637 3839 3A3B 3C3D 3E3F  0123456789ABCDEF
0x7fff5846fd30  0100 0000 0000 0000 7511 4000 0000 0000  ........u.@.....
[0x00401020]> pxr 0x10@rsp
0x7fff5846fd30 0x0000000000000001   ........ @ rsp 1 .comment rbp
0x7fff5846fd38 0x0000000000401175   u.@..... 4198773 /mnt/ubuntu/home/czg/csapp3e/asm/prog .text dbg.main program R X 'mov rsi, qword [rsp]' 'prog'
[0x00401020]> ds
[0x00401020]> pxr 0x10@rsp
0x7fff5846fd28 0x00007f06543ff2c0   ..?T.... @ rsp /usr/lib/ld-linux-x86-64.so.2 library R W 0x0
0x7fff5846fd30 0x0000000000000001   ........ 1 .comment rbp
[0x00401020]> px 0x10@rsp
- offset -      2829 2A2B 2C2D 2E2F 3031 3233 3435 3637  89ABCDEF01234567
0x7fff5846fd28  c0f2 3f54 067f 0000 0100 0000 0000 0000  ..?T............
[0x00401020]> ? 0x7fff5846fd30-0x7fff5846fd28~:1
uint32  8
; here quadword -> rsp should decrease 8  
```
#### `print` can print func location (most of `dmi libc` / `dmi prog` in `r2`)
### fs/gs register (other segment register no use in 64-bit mode [pdf p73,74 Canonical Addressing,79](../references/intel_64.pdf) [1 TODO:'CS/DS/ES/SS are only useful for padding to make instructions longer?'](https://stackoverflow.com/questions/50400274/why-is-the-use-of-the-ds-segment-override-illegal-in-64-bit-mode)) mainly based on [this](https://reverseengineering.stackexchange.com/questions/19979/what-does-fs-and-gs-registers-provide-in-linux)
[pdf p75](../references/intel_64.pdf) register size
> TODO more [datailed](https://unix.stackexchange.com/questions/453749/what-sets-fs0x28-stack-canary) with TLS
> > how fs:0x28 check overflow (try making program overflow and see)
```bash
[czg ~]$ cat czg_scripts/test_fs_reg.c 
// Build with: gcc -m32 -no-pie -g -o plt plt.c

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  exit(0);
}
$ echo "test_fs_reg" | xargs -I@ gcc -fstack-protector-strong -g -no-pie -fno-pic -o czg_scripts/@ czg_scripts/@.c # https://stackoverflow.com/questions/10325713/why-does-this-memory-address-fs0x28-fs0x28-have-a-random-value/10325915#10325915
# if nothing done in main then no linker run, so below is same with above code.
$ echo "test_fs_reg" | xargs -I@ gcc -g -no-pie -fno-pic -o czg_scripts/@ czg_scripts/@.c
[czg ~]$ r2 -AA -qc "pdf @ main" czg_scripts/test_fs_reg 
INFO: Analyze all flags starting with sym. and entry0 (aa)
INFO: Analyze all functions arguments/locals (afva@@@F)
INFO: Analyze function calls (aac)
INFO: Analyze len bytes of instructions for references (aar)
INFO: Finding and parsing C++ vtables (avrr)
INFO: Type matching analysis for all functions (aaft)
INFO: Propagate noreturn information (aanr)
INFO: Integrate dwarf function information
INFO: Scanning for strings constructed in code (/azs)
INFO: Finding function preludes (aap)
INFO: Enable anal.types.constraint for experimental type propagation
            ;-- main:
            ; DATA XREF from entry0 @ 0x401058(r)
┌ 25: int dbg.main (int argc, char **argv);
│           ; arg int argc @ rdi
│           ; arg char **argv @ rsi
│           ; var int64_t var_4h @ rbp-0x4
│           ; var char **var_10h @ rbp-0x10
│           0x00401126      55             push rbp                    ; stdlib.h:6    modify it under the terms of the GNU Lesser General Public ; push word, doubleword or quadword onto the stack; int main(int argc,char ** argv);
│           0x00401127      4889e5         mov rbp, rsp                ; moves data from src to dst
│           0x0040112a      4883ec10       sub rsp, 0x10               ; substract src and dst, stores result on dst
│           0x0040112e      897dfc         mov dword [var_4h], edi     ; moves data from src to dst; argc
│           0x00401131      488975f0       mov qword [var_10h], rsi    ; moves data from src to dst; argv
│           0x00401135      bf00000000     mov edi, 0                  ; stdlib.h:7    License as published by the Free Software Foundation; either ; moves data from src to dst; int status
└           0x0040113a      e8f1feffff     call sym.imp.exit           ; calls a subroutine, push eip into the stack (esp) ; void exit(int status)
# here no canary

$ cd /mnt/ubuntu/home/czg/csapp3e/asm;gcc -fno-pic -Og -o prog 010-main.c 010-mstore.c -g3 -no-pie -fno-stack-protector 
$ r2 -AA -qc "pdf @ main>./no_canary_prog.asm" /mnt/ubuntu/home/czg/csapp3e/asm/prog
# in /mnt/ubuntu/home/czg/csapp3e/asm/prog/no_canary_prog.asm
# in asm here not use `rax`
...
$ r2 -AA -qc "pdf @ main>./canary_prog.asm" /mnt/ubuntu/home/czg/csapp3e/asm/prog
```

#### fs related opcode
```asm
[0x0040113a]> pd-- 2
│       └─< 0x00401134      eb8a           jmp 0x4010c0                ; jump
            ;-- main:
            ; DATA XREF from entry0 @ 0x401068(r)
┌ 107: int dbg.main (int argc, char **argv, char **envp);
│ rg: 0 (vars 0, args 0)
│ bp: 1 (vars 1, args 0)
│ sp: 1 (vars 1, args 0)
│           0x00401136      4883ec18       sub rsp, 0x18               ; stdio.h:6    modify it under the terms of the GNU Lesser General Public ; substract src and dst, stores result on dst; int main();
│           0x0040113a b    64488b042528.  mov rax, qword fs:[0x28]    ; stdio.h:6    modify it under the terms of the GNU Lesser General Public ; moves data from src to dst
[0x0040113a]> px @fs+0x28
- offset -      6869 6A6B 6C6D 6E6F 7071 7273 7475 7677  89ABCDEF01234567
0x7f4718698768  0026 f2ec 9cde 433e 4b34 6aa3 7e6d 23c8  .&....C>K4j.~m#.
...
[0x0040113a]> pxr @fs+0x28
0x7f4718698768 0x3e43de9cecf22600   .&....C> rax
```
- `64488b042528`
  - `64` in [pdf p532](../references/intel_64.pdf) -> [legacy](https://wiki.osdev.org/X86-64_Instruction_Encoding#Legacy_Prefixes) prefix, just to [overload ‘They are still registers, so they can of course be used for various other assembly operations.’ ](https://reverseengineering.stackexchange.com/questions/2006/how-are-the-segment-registers-fs-gs-cs-ss-ds-es-used-in-linux) default segmentation usage
  - `48` see above `REX.W`
  - rest are MODR/M, same with above
#### shown in [this](https://www.felixcloutier.com/x86/push.html)
- instruction prefix [this](http://www.c-jump.com/CIS77/CPU/x86/X77_0240_prefix.htm) <a id="prefix"></a>
  - [pdf p532](../references/intel_64.pdf) said `66h` prefix usage in SSE (related with AVX [pdf p537](../references/intel_64.pdf))
    - 66h [usage](https://stackoverflow.com/questions/30090566/x64-maskmovdqu-store-selected-bytes-of-double-quadword-and-vex-segment-overrid#comment48338171_30099598) or [table](https://wiki.osdev.org/X86-64_Instruction_Encoding#Operand-size_and_address-size_override_prefix)
  - [multiple](https://stackoverflow.com/questions/2404364/combining-prefixes-in-sse) 66H prefix
### [`.rela.plt`](https://reverseengineering.stackexchange.com/questions/21521/pyelftools-relocation-section-symbols) <a id="rela"></a>
> [TODO .plt.got (it seems no use anymore)](https://systemoverlord.com/2017/03/19/got-and-plt-for-pwning.html)
```asm
[0x00401000]> iS~plt
11  0x000005d8    0x30 0x004005d8    0x30 -r-- RELA        .rela.plt
13  0x00001020    0x30 0x00401020    0x30 -r-x PROGBITS    .plt
23  0x00002fe8    0x28 0x00403fe8    0x28 -rw- PROGBITS    .got.plt
;obviously this is used when first search `reloc.printf` when linker not work
[0x00401000]> pd 0xf@0x00000000004005d8
            ;-- section..rela.plt:
            0x004005d8      .qword 0x0000000000404000 ; reloc.__stack_chk_fail ; [11] -r-- section size 48 named .rela.plt
            0x004005e0      .qword 0x0000000300000007
            0x004005e8      .qword 0x0000000000000000
            0x004005f0      .qword 0x0000000000404008 ; reloc.printf
            0x004005f8      .qword 0x0000000400000007
            0x00400600      .qword 0x0000000000000000
            0x00400608      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x0040060a      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp ; rbp ; rbp
            0x0040060c      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x0040060e      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x00400610      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x00400612      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp ; rbp ; rbp
            0x00400614      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x00400616      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x00400618      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rb
[0x00401000]> pxr @0x404008
0x00404008 0x0000000000401046   F.@..... @ reloc.printf 4198470 /mnt/ubuntu/home/czg/csapp3e/asm/prog .plt program R X 'push 1' 'prog'
0x00404010 ..[ null bytes ]..   00000000 loc.__data_start
[0x00401000]> axt 0x404008
sym.imp.printf 0x401040 [DATA:--x] jmp qword [reloc.printf]
[0x00401000]> axt 0x401040
dbg.main 0x40116a [CALL:--x] call sym.imp.printf
dbg.main 0x40117d [CALL:--x] call sym.imp.printf
[0x00401000]> pd 3@0x401040
        ╎   ; CALL XREFS from dbg.main @ 0x40116a(x), 0x40117d(x)
╭ 6: int sym.imp.printf (const char *format);
│ rg: 0 (vars 0, args 0)
│ bp: 0 (vars 0, args 0)
│ sp: 0 (vars 0, args 0)
╰       ╎   0x00401040      ff25c22f0000   jmp qword [reloc.printf]    ; [0x404008:8]=0x401046 ; "F\x10@" ; jump
        ╎   0x00401046      6801000000     push 1                      ; rbp ; push word, doubleword or quadword onto the stack
        ╰─< 0x0040104b      e9d0ffffff     jmp section..plt            ; jump
; and also got has the same table with `.rela.plt` at the beginning
[0x7f2361666ed0]> pxr @0x0000000000403fe8
0x00403fe8 0x0000000000403df8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210168 /mnt/ubuntu/home/czg/csapp3e/asm/prog .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R W 0x1
0x00403ff0 ..[ null bytes ]..   00000000 
0x00404000 0x0000000000401036   6.@..... @ reloc.__stack_chk_fail 4198454 /mnt/ubuntu/home/czg/csapp3e/asm/prog .plt program R X 'push 0' 'prog'
0x00404008 0x0000000000401046   F.@..... @ reloc.printf 4198470 /mnt/ubuntu/home/czg/csapp3e/asm/prog .plt program R X 'push 1' 'prog'
0x00404010 ..[ null bytes ]..   00000000 loc.__data_start
[0x7f2361666ed0]> iS~403
19  0x00002de8     0x8 0x00403de8     0x8 -rw- INIT_ARRAY  .init_array
20  0x00002df0     0x8 0x00403df0     0x8 -rw- FINI_ARRAY  .fini_array
21  0x00002df8   0x1d0 0x00403df8   0x1d0 -rw- DYNAMIC     .dynamic
; after update, in pwndbg
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
 ►0x401040      <printf@plt>   jmp    qwordptr[rip+0x2fc2]          <printf>
    ↓
  0x7ffff7dc7e00<printf>       endbr64 
  0x7ffff7dc7e04<printf+4>     sub    rsp,0xd8
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> telescope 0x0000000000403fe8
00:0000│  0x403fe8 (_GLOBAL_OFFSET_TABLE_) —▸ 0x403df8 (_DYNAMIC) ◂— 0x1
01:0008│  0x403ff0 (_GLOBAL_OFFSET_TABLE_+8) —▸ 0x7ffff7ffe2c0 ◂— 0x0
02:0010│  0x403ff8 (_GLOBAL_OFFSET_TABLE_+16) —▸ 0x7ffff7fdcb50 ◂— endbr64 
03:0018│  0x404000 (__stack_chk_fail@got.plt) —▸ 0x401036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
04:0020│  0x404008 (printf@got[plt]) —▸ 0x7ffff7dc7e00 (printf) ◂— endbr64 
05:0028│  0x404010 (data_start) ◂— 0x0
pwndbg> telescope 0x00000000004005d8
00:0000│  0x4005d8 —▸ 0x404000 (__stack_chk_fail@got.plt) —▸ 0x401036 (__stack_chk_fail@plt+6) ◂— push 0 /* 'h' */
01:0008│  0x4005e0 ◂— 0x300000007
02:0010│  0x4005e8 ◂— 0x0
03:0018│  0x4005f0 —▸ 0x404008 (printf@got[plt]) —▸ 0x7ffff7dc7e00 (printf) ◂— endbr64 
04:0020│  0x4005f8 ◂— 0x400000007
05:0028│  0x400600 ◂— 0x0
... ↓     2 skipped
```
#### how ld work is a bit complex (here give a scratch)
```asm
[0x00401000]> pd-- 4@section..plt
╰           0x0040101a      c3             ret                         ; return from subroutine. pop 4 bytes from esp and jump there.
            0x0040101b      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp ; rbp ; rbp
            0x0040101d      0000           add byte [rax], al          ; adds src and dst, stores result on dst ; rbp
            0x0040101f  ~   00ff           add bh, bh                  ; adds src and dst, stores result on dst ; rbp ; rbp ; rbp
            ;-- section..plt:
            0x00401020 b    ff35ca2f0000   push qword [0x00403ff0]     ; push word, doubleword or quadword onto the stack; [13] -r-x section size 48 named .plt
            0x00401026      ff25cc2f0000   jmp qword [fcn.7f903acb2b50] ; [0x403ff8:8]=0x7f903acb2b50 fcn.7f903acb2b50 ; jump
            0x0040102c      0f1f4000       nop dword [rax]             ; no operation
[0x00401000]> agf @fcn.7f903acb2b50
...
│ call fcn.7f903acb06e0;[oa]    
│ mov r11, rax    
│ jmp r11
; fcn.7f903acb06e0 is too long
; in pwndbg
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
 ►0x7ffff7fdcc0a             jmp    r11                           <printf>
    ↓
  0x7ffff7dc7e00<printf>     endbr64 
pwndbg> hexdump 0x404008

+0000 0x404008  00 7e dc f7 ff 7f 00 00  00 00 00 00 00 00 00 00  │.~......│........│
; has link to 0x7ffff7dc7e00
```
#### `.plt.got` seems to be set to `.got` in elf
```asm
; https://stackoverflow.com/questions/58076539/plt-plt-got-what-is-different
[0x7f2361666ed0]> iS~dyn
6   0x000003e0    0xa8 0x004003e0    0xa8 -r-- DYNSYM      .dynsym
7   0x00000488    0x9b 0x00400488    0x9b -r-- STRTAB      .dynstr
10  0x00000578    0x60 0x00400578    0x60 -r-- RELA        .rela.dyn
21  0x00002df8   0x1d0 0x00403df8   0x1d0 -rw- DYNAMIC     .dynamic
; four reloc in .rela.dyn
[0x7f2361666ed0]> pd 0xf4@0x00400578
            ;-- section..rela.dyn:
            0x00400578      .qword 0x0000000000403fc8 ; section..got ; reloc.__libc_start_main ; [10] -r-- section size 96 named .rela.dyn
            0x00400580      .qword 0x0000000100000006
            0x00400588      .qword 0x0000000000000000
            0x00400590      .qword 0x0000000000403fd0 ; reloc._ITM_deregisterTMCloneTable
            0x00400598      .qword 0x0000000200000006
            0x004005a0      .qword 0x0000000000000000
            0x004005a8      .qword 0x0000000000403fd8 ; reloc.__gmon_start__
            0x004005b0      .qword 0x0000000500000006
            0x004005b8      .qword 0x0000000000000000
            0x004005c0      .qword 0x0000000000403fe0 ; reloc._ITM_registerTMCloneTable
            0x004005c8      .qword 0x0000000600000006
            0x004005d0      .qword 0x0000000000000000
; here no got for __libc_start_main
[0x00403fc8]> pxr 
0x00403fc8 ..[ null bytes ]..   00000000 reloc.__libc_start_main
0x00403fe8 0x0000000000403df8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210168 /mnt/ubuntu/home/czg/csapp3e/asm/prog .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R W 0x1
0x00403ff0 ..[ null bytes ]..   00000000 
0x00404000 0x0000000000401036   6.@..... @ reloc.__stack_chk_fail 4198454 /mnt/ubuntu/home/czg/csapp3e/asm/prog .plt program R X 'push 0' 'prog'
0x00404008 0x0000000000401046   F.@..... @ reloc.printf 4198470 /mnt/ubuntu/home/czg/csapp3e/asm/prog .plt program R X 'push 1' 'prog'
0x00404010 ..[ null bytes ]..   00000000 loc.__data_start
; after link
[0x00403fc8]> pxr
0x00403fc8 0x00007fde0eac77c0   .w...... @ reloc.__libc_start_main /usr/lib/libc.so.6 library R X 'endbr64' 'libc.so.6'
; others still zero
0x00403fd0 ..[ null bytes ]..   00000000 reloc._ITM_deregisterTMCloneTable
0x00403fe8 0x0000000000403df8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210168 /mnt/ubuntu/home/czg/csapp3e/asm/prog .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R 0x1
[0x00403fc8]> pd 4
            ;-- section..got:
            ;-- reloc.__libc_start_main:
            ; CALL XREF from entry0 @ 0x40106f(x)
            0x00403fc8      .qword 0x00007fde0eac77c0                  ; RELOC 64 __libc_start_main ; [22] -rw- section size 32 named .got
            ;-- reloc._ITM_deregisterTMCloneTable:
            ; DATA XREF from fcn.00401090 @ 0x40109d(r)
            0x00403fd0      .qword 0x0000000000000000                  ; RELOC 64 _ITM_deregisterTMCloneTable
            ;-- reloc.__gmon_start__:
            ; DATA XREF from sym._init @ 0x401008(r)
            0x00403fd8      .qword 0x0000000000000000                  ; RELOC 64 __gmon_start__
            ;-- reloc._ITM_registerTMCloneTable:
            ; DATA XREF from entry.init0 @ 0x4010df(r)
            0x00403fe0      .qword 0x0000000000000000                  ; RELOC 64 _ITM_registerTMCloneTable
[0x00403fc8]> iS.
Current section

nth paddr       size vaddr       vsize perm type     name
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――
0   0x00002fc8  0x20 0x00403fc8   0x20 -rw- PROGBITS .got

;readelf
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ readelf -r prog

Relocation section '.rela.dyn' at offset 0x578 contains 4 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000403fc8  000100000006 R_X86_64_GLOB_DAT 0000000000000000 __libc_start_main@GLIBC_2.34 + 0
000000403fd0  000200000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_deregisterTM[...] + 0
000000403fd8  000500000006 R_X86_64_GLOB_DAT 0000000000000000 __gmon_start__ + 0
000000403fe0  000600000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_registerTMCl[...] + 0

Relocation section '.rela.plt' at offset 0x5d8 contains 2 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000404000  000300000007 R_X86_64_JUMP_SLO 0000000000000000 __stack_chk_fail@GLIBC_2.4 + 0
000000404008  000400000007 R_X86_64_JUMP_SLO 0000000000000000 printf@GLIBC_2.2.5 + 0
;pwndbg
pwndbg> info symbol 0x00403fc8
No symbol matches 0x00403fc8.
pwndbg> info symbol 0x0000000000404000
__stack_chk_fail@got.plt in section .got.plt of /mnt/ubuntu/home/czg/csapp3e/asm/prog
```
## 9
```asm
  0x7ffff7fe5d7f  test   rax,rax
 ►0x7ffff7fe5d82  je     0x7ffff7fe5dff                <0x7ffff7fe5dff>
```
[jump](https://stackoverflow.com/questions/13064809/the-point-of-test-eax-eax) if return 0
## 10 TODO how `leave` implemented in cpu [pdf p178](../references/intel_64.pdf), [related](https://stackoverflow.com/questions/67449884/mov-rbp-rsp-in-function-prologue) with `push rbp` above
- ~~TODO~~ why gcc [not](https://stackoverflow.com/questions/29790175/assembly-x86-leave-instruction) use enter
  - [this](https://www.agner.org/optimize/instruction_tables.pdf) p151 (~~TODO execution pipe~~?)
    - po Latency based on multiple instructions runned (dependency chain) and Reciprocal throughput is mostly based on itself (detailed see p2)
    - p3,36(execution pipe)
      - Execution pipe is [pipelined](https://en.wikipedia.org/wiki/Execution_unit) Execution units
    - here `MOV r64,r64 1 0 0.25 renaming` -> `0 0.25` and `ENTER a,b 11+3b N/A ~20+b` (multiple nested condition) with `LEAVE N/A 2 N/A 3`
    - shuffle [shufps](http://www.songho.ca/misc/sse/sse.html)
- in pdf above, rbp is mainly used to access parent variable in stack.
```bash
*RBP  0x7fffffffdfc0 ◂— 0x1                                                         *RSP  0x7fffffffdfc0 ◂— 0x1
*RIP  0x40119a (main+4) ◂— sub rsp,0x10                                              EFLAGS 0x246 [ cf PF af ZF sf IF df of ]
──────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────
00:0000│ rbp rsp 0x7fffffffdfc0 ◂— 0x1
01:0008│         0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
02:0010│         0x7fffffffdfd0 —▸ 0x7ffff7ffd000 (_rtld_global) —▸ 0x7ffff7ffe2c0 ◂— 0x0
03:0018│         0x7fffffffdfd8 —▸ 0x401196 (main) ◂— push rbp
04:0020│         0x7fffffffdfe0 ◂— 0x100400040 /* '@' */
05:0028│         0x7fffffffdfe8 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
06:0030│         0x7fffffffdff0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
07:0038│         0x7fffffffdff8 ◂— 0xa8242b04de4995fd
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x401197<main+1>   mov    rbp,rsp
 ►0x40119a<main+4>   sub    rsp,0x10
# after some run
──────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdfb0 ◂— 0x6
01:0008│     0x7fffffffdfb8 ◂— 0x58a4da165677c400
02:0010│ rbp 0x7fffffffdfc0 ◂— 0x1
...
pwndbg> dr
Dump of assembler code for function main:
   0x0000000000401196 <+0>:     55                      push   rbp
   0x0000000000401197 <+1>:     48 89 e5                mov    rbp,rsp
...
 ►0x4011ff<main+105>   leave
>si
*RBP  0x1                                                                           *RSP  0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
*RIP  0x401200 (main+106) ◂— ret                                                     EFLAGS 0x246 [ cf PF af ZF sf IF df of ]
──────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
01:0008│     0x7fffffffdfd0 —▸ 0x7ffff7ffd000 (_rtld_global) —▸ 0x7ffff7ffe2c0 ◂— 0x0
02:0010│     0x7fffffffdfd8 —▸ 0x401196 (main) ◂— push rbp
03:0018│     0x7fffffffdfe0 ◂— 0x100400040 /* '@' */
04:0020│     0x7fffffffdfe8 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
05:0028│     0x7fffffffdff0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
06:0030│     0x7fffffffdff8 ◂— 0x6b2a7c5df1500785
07:0038│     0x7fffffffe000 ◂— 0x0
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x4011ff      <main+105>   leave  
 ►0x401200      <main+106>   ret    <0x7ffff7d9b790>
# stack same with <main>,below is when main start 
*RIP  0x401196 (main) ◂— push rbp                                                    EFLAGS 0x246 [ cf PF af ZF sf IF df of ]
──────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
01:0008│     0x7fffffffdfd0 —▸ 0x7ffff7ffd000 (_rtld_global) —▸ 0x7ffff7ffe2c0 ◂— 0x0
02:0010│     0x7fffffffdfd8 —▸ 0x401196 (main) ◂— push rbp
03:0018│     0x7fffffffdfe0 ◂— 0x100400040 /* '@' */
04:0020│     0x7fffffffdfe8 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
05:0028│     0x7fffffffdff0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe548 ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
06:0030│     0x7fffffffdff8 ◂— 0xe9b166c2d1e3c3da
07:0038│     0x7fffffffe000 ◂— 0x0
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
 ►0x401196<main>     push   rbp
```
### `r8-r15` [this](https://stackoverflow.com/questions/59660118/assembly-using-rn-registers-r8-r9-have-more-code-size-than-other-registers) [rax,etc relation with r8-15 see pdf p2846](../references/intel_64.pdf)
- above  `0x4a` -> `0b01001010` -> Figure 2-4 [pdf p533](../references/intel_64.pdf)
- rasm2 [bug](https://reverseengineering.stackexchange.com/questions/18024/rasm2-giving-different-output-each-time-for-x64) still exists ,`R` -> `reg`
```bash
[0x00000100]> rasm2 -d 418b4104
mov eax, dword [r9 + 4]
# the above is right
[0x00000100]> rasm2 -a x86 -b 64 "mov eax, dword [r9 + 4]" # ignore this
448b4a04
$ rasm2 -L
...
# no x86 but x86.nasm
a__ 16 32 64    x86.nasm    LGPL3   X86 nasm assembler
a__ 16 32 64    x86.nz      LGPL3   x86 handmade assembler (by pancake)
...
$ rasm2 -a x86.nasm -b 64 "mov eax, dword [r9 + 4]" 
418b4104
```
## 11 `printf` (int & double)
```bash
  0x40115b<main+37>   mov    eax,1
  0x401160<main+42>   call   printf@plt                      <printf@plt>
  # here eax is to check xmm reg, if not 0 then not skip
pwndbg> pdisass 
 ►0x7ffff7dc7e00<printf>      endbr64 
  0x7ffff7dc7e04<printf+4>    sub    rsp,0xd8
  0x7ffff7dc7e24<printf+36>   test   al,al
  0x7ffff7dc7e26<printf+38>   je     printf+95                <printf+95>
pwndbg> pdisass 0x7ffff7dc7e26
 ►0x7ffff7dc7e26<printf+38>   je     printf+95                <printf+95>
 
  0x7ffff7dc7e28<printf+40>   movaps xmmwordptr[rsp+0x50],xmm0
  0x7ffff7dc7e2d<printf+45>   movaps xmmwordptr[rsp+0x60],xmm1
  0x7ffff7dc7e32<printf+50>   movaps xmmwordptr[rsp+0x70],xmm2
  0x7ffff7dc7e37<printf+55>   movaps xmmwordptr[rsp+0x80],xmm3
  0x7ffff7dc7e3f<printf+63>   movaps xmmwordptr[rsp+0x90],xmm4
```
- [xmm/ymm](https://wiki.osdev.org/AVX2)/[zmm](https://wiki.osdev.org/CPU_Registers_x86) , ymm [pdf p538](../references/intel_64.pdf) zmm [pdf p603](../references/intel_64.pdf), see 
## fs/gs and SS segment(rsp/rbp)
[pdf p86](../references/intel_64.pdf), see [this (fs != fs_base)](https://stackoverflow.com/questions/59797987/how-is-effective-address-calculated-with-fs-and-gs-registers)
```bash
pwndbg> x/g $fs_base+0x28
0x7ffff7c8d768: 0x6bdb9d77fe8c7e00
────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────
  0x40113a<main+4>    mov    rax,qwordptrfs:[0x28]
 ►0x401143<main+13>   mov    qwordptr[rsp+8],rax
pwndbg> p *(long long*)($fs_base+0x28)==$rax
$7 = 0x1
pwndbg> x $fs+0x28
0x28:   Cannot access memory at address 0x28
```
### how fs:[0x28] canary check overflow [similar check method maybe in old gcc / other assembler](https://sourceware.org/pipermail/gdb/2020-March/048428.html)
```bash
pwndbg> dga main
Dump of assembler code for function main:
   0x0000000000401136 <+0>:     48 83 ec 18             sub    rsp,0x18
   0x000000000040113a <+4>:     64 48 8b 04 25 28 00 00 00      mov    rax,QWORD PTR fs:0x28
   0x0000000000401143 <+13>:    48 89 44 24 08          mov    QWORD PTR [rsp+0x8],rax
   0x0000000000401148 <+18>:    31 c0                   xor    eax,eax
  #  begin move parameter
   0x000000000040114a <+20>:    f2 0f 10 05 de 0e 00 00 movsd  xmm0,QWORD PTR [rip+0xede]        # 0x402030
   ...
   0x0000000000401160 <+42>:    e8 db fe ff ff          call   0x401040 <printf@plt>
  #  after every call the stack should look same as when `0x000000000040114a`
=> 0x0000000000401165 <+47>:    48 89 e2                mov    rdx,rsp
──────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdfb0 ◂— 0x0
# `0xace30b97c80c7c00` is canary `fs:[0x28]`
01:0008│     0x7fffffffdfb8 ◂— 0xace30b97c80c7c00
02:0010│     0x7fffffffdfc0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
# return address (the next instruction)
03:0018│     0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
pwndbg> dga main
...
   0x000000000040119d <+103>:   48 8b 44 24 08          mov    rax,QWORD PTR [rsp+0x8]
   0x00000000004011a2 <+108>:   64 48 2b 04 25 28 00 00 00      sub    rax,QWORD PTR fs:0x28
  #  [rsp+0x8] should same as fs:0x28 if no overflow
   0x00000000004011ab <+117>:   75 0a                   jne    0x4011b7 <main+129>
   ...
   0x00000000004011b7 <+129>:   e8 74 fe ff ff          call   0x401030 <__stack_chk_fail@plt>

pwndbg> info br
Num     Type           Disp Enb Address            What
3       acc watchpoint keep y                      *0x7fffffffdfb0
        breakpoint already hit 4 times
4       acc watchpoint keep y                      *0x7fffffffdfb8
        breakpoint already hit 2 times
#  after debug,only read between call,except '<+47>', see below 'use rsp to access function call result'
   0x0000000000401165 <+47>:    48 89 e2                mov    rdx,rsp
   0x0000000000401168 <+50>:    be 03 00 00 00          mov    esi,0x3
   0x000000000040116d <+55>:    bf 02 00 00 00          mov    edi,0x2
   0x0000000000401172 <+60>:    e8 4d 00 00 00          call   0x4011c4 <multstore>
   0x0000000000401177 <+65>:    48 8b 34 24             mov    rsi,QWORD PTR [rsp]
   0x000000000040117b <+69>:    bf 1c 20 40 00          mov    edi,0x40201c
   0x0000000000401180 <+74>:    b8 00 00 00 00          mov    eax,0x0
   0x0000000000401185 <+79>:    e8 b6 fe ff ff          call   0x401040 <printf@plt>
# so '►0x4011a2' just to check overflow.
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
 ►0x4011a2<main+108>   sub    rax,qwordptrfs:[0x28]
  0x4011ab<main+117>   jne    main+129                      <main+129>

```
## use rsp to access function call result
```bash
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rdx rsp 0x7fffffffdfb0 ◂— 0x0
01:0008│         0x7fffffffdfb8 ◂— 0xb30961705bab4800
02:0010│         0x7fffffffdfc0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
03:0018│         0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
04:0020│         0x7fffffffdfd0 —▸ 0x7fffffffe0c0 —▸ 0x7fffffffe0c8 ◂— 0x38 /* '8' */
05:0028│         0x7fffffffdfd8 —▸ 0x401136 (main) ◂— sub rsp,0x18
06:0030│         0x7fffffffdfe0 ◂— 0x100400040 /* '@' */
07:0038│         0x7fffffffdfe8 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
  0x401165<main+47>   mov    rdx,rsp
 ►0x401168<main+50>   mov    esi,3
# RDX the third parameter -> result
   0x0000000000401165 <+47>:    48 89 e2                mov    rdx,rsp
   0x0000000000401168 <+50>:    be 03 00 00 00          mov    esi,0x3
   0x000000000040116d <+55>:    bf 02 00 00 00          mov    edi,0x2
   0x0000000000401172 <+60>:    e8 4d 00 00 00          call   0x4011c4 <multstore>
  #  pass to printf second param
   0x0000000000401177 <+65>:    48 8b 34 24             mov    rsi,QWORD PTR [rsp]
   0x000000000040117b <+69>:    bf 1c 20 40 00          mov    edi,0x40201c
   0x0000000000401180 <+74>:    b8 00 00 00 00          mov    eax,0x0
   0x0000000000401185 <+79>:    e8 b6 fe ff ff          call   0x401040 <printf@plt>

pwndbg> dr main
Dump of assembler code for function multstore:
   0x00000000004011c4 <+0>:     53                      push   rbx
=> 0x00000000004011c5 <+1>:     48 89 d3                mov    rbx,rdx
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffdfa0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
01:0008│     0x7fffffffdfa8 —▸ 0x401177 (main+65) ◂— mov rsi,qwordptr[rsp]
02:0010│ rdx 0x7fffffffdfb0 ◂— 0x0
pwndbg> dr
Dump of assembler code for function multstore:
  #  push callee reg
   0x00000000004011c4 <+0>:     53                      push   rbx
  # use caller reg
   0x00000000004011c5 <+1>:     48 89 d3                mov    rbx,rdx
=> 0x00000000004011c8 <+4>:     e8 ef ff ff ff          call   0x4011bc <mult2>
  # here is just to rdx -> rsp before/after call multstore
   0x00000000004011cd <+9>:     48 89 03                mov    QWORD PTR [rbx],rax
  #  rbx is just at top, restore it
   0x00000000004011d0 <+12>:    5b                      pop    rbx
   0x00000000004011d1 <+13>:    c3                      ret
End of assembler dump.
# mult2 no change to stack
pwndbg> dga mult2
Dump of assembler code for function mult2:
   0x00000000004011bc <+0>:     48 89 f8                mov    rax,rdi
   0x00000000004011bf <+3>:     48 0f af c6             imul   rax,rsi
   0x00000000004011c3 <+7>:     c3                      ret
End of assembler dump.

```
### here `rbx` is redundant to use, use `r2` to change binary exe because [not](https://stackoverflow.com/questions/44534733/why-copy-the-same-value-to-rax-that-he-already-has) optimized to be better debugged
```asm
$ r2 -AAq -c 'db sym.multstore;dc;wx 90909090@0x004011c4;wx 488902@0x004011cd;wx 90@0x004011d0;db 0x000000000040118a;dc;pd 4@0x004011cd;pd 8@0x004011c4;pd-- 1@0x004011d0;dc;dc' -d /mnt/ubuntu/home/czg/csapp3e/asm/prog 
2 * 3 --> 0
test: 2.468000
INFO: hit breakpoint at: 0x4011c4
2 * 3 --> 6
INFO: hit breakpoint at: 0x40118a
│           0x004011cd      488902         mov qword [rdx], rax        ; stdc-predef.h:6    License as published by the Free Software Foundation; either ; moves data from src to dst
│           0x004011d0      90             nop                         ; stdc-predef.h:7    version 2.1 of the License, or (at your option) any later version. ; no operation
╰           0x004011d1      c3             ret                         ; return from subroutine. pop 4 bytes from esp and jump there.
            0x004011d2      0000           add byte [rax], al          ; adds src and dst, stores result on dst
        ╎   ;-- multstore:
        ╎   ; CALL XREF from dbg.main @ 0x401172(x)
╭ 14: dbg.multstore (int64_t arg1, int64_t arg3);
│       ╎   ; arg int64_t arg1 @ rdi
│       ╎   ; arg int64_t arg3 @ rdx
│       ╎   0x004011c4 b    53             push rbx                    ; stdio.h:20 #define _BITS_STDIO_H 1 ; push word, doubleword or quadword onto the stack; void multstore(long int x,long int y,long int * dest);
│       ╎   0x004011c5      90             nop                         ; no operation; arg3
│       ╎   0x004011c6      90             nop                         ; no operation
│       ╎   0x004011c7      90             nop                         ; no operation
│       ╰─< 0x004011c8      e8efffffff     call dbg.mult2              ; stdc-predef.h:5    modify it under the terms of the GNU Lesser General Public ; calls a subroutine, push eip into the stack (esp)
│           0x004011cd      488902         mov qword [rdx], rax        ; stdc-predef.h:6    License as published by the Free Software Foundation; either ; moves data from src to dst
│           0x004011d0      90             nop                         ; stdc-predef.h:7    version 2.1 of the License, or (at your option) any later version. ; no operation
╰           0x004011d1      c3             ret                         ; return from subroutine. pop 4 bytes from esp and jump there.
│           0x004011cd      488902         mov qword [rdx], rax        ; stdc-predef.h:6    License as published by the Free Software Foundation; either ; moves data from src to dst
│           0x004011d0      90             nop                         ; stdc-predef.h:7    version 2.1 of the License, or (at your option) any later version. ; no operation
ERROR: Run `aeim` to initialize a stack for the ESIL vm
2 * 3 --> 6
(6664) Process terminated with status 0
INFO: ==> Process finished
ERROR: Cannot continue, run ood?
```
## [eh_frame_hdr](https://stackoverflow.com/questions/14091231/what-do-the-eh-frame-and-eh-frame-hdr-sections-store-exactly)(hdr->header) -> linux [foundation](https://refspecs.linuxfoundation.org/LSB_3.0.0/LSB-Core-generic/LSB-Core-generic/ehframechpt.html) (`eh` maybe mean 'exception header')
[also](https://github.com/nbdd0121/unwinding) 
```bash
   0x000000000040114a <+20>:    f2 0f 10 05 de 0e 00 00 movsd  xmm0,QWORD PTR [rip+0xede]        # 0x402030
   0x0000000000401152 <+28>:    48 8b 34 24             mov    rsi,QWORD PTR [rsp]
pwndbg> telescope 0x401152+0xede
00:0000│  0x402030 ◂— 0x4003be76c0000000
01:0008│  0x402038 (__GNU_EH_FRAME_HDR) ◂— 0x3c3b031b01
```
## how xmm save [pdf p52](../references/intel_64.pdf)
[pdf p67](../references/intel_64.pdf) -> 8 regs when non-64 mode
16 regs [pdf p70](../references/intel_64.pdf)
- related with stack
```bash
# 64/8=8 byte, can test with hexdump
   0x00007ffff7dc7e0b <+11>:    48 89 74 24 28          mov    QWORD PTR [rsp+0x28],rsi
   0x00007ffff7dc7e10 <+16>:    48 89 54 24 30          mov    QWORD PTR [rsp+0x30],rdx
  #  similar
   0x00007ffff7dc7e28 <+40>:    0f 29 44 24 50          movaps XMMWORD PTR [rsp+0x50],xmm0
```
- xmm
```bash
   0x000000000040114a <+20>:    f2 0f 10 05 de 0e 00 00 movsd  xmm0,QWORD PTR [rip+0xede]        # 0x402030
   0x0000000000401152 <+28>:    48 8b 34 24             mov    rsi,QWORD PTR [rsp]

pwndbg> hexdump 0x0000000000401152+0xede
+0000 0x402030  00 00 00 c0 76 be 03 40  01 1b 03 3b 3c 00 00 00  │....v..@│...;<...│
# so 0x0->minimal memory address and then grow to 0x4,etc
pwndbg> p $ymm0
$1 = {
  v16_bfloat16 = {[0x0] = 0, [0x1] = -2, [0x2] = -0.2402, [0x3] = 2.047, [0x4] = 0 <repeats 12 times>},
  v16_half = {[0x0] = 0, [0x1] = -2, [0x2] = -1.6152, [0x3] = 2.0059, [0x4] = 0 <repeats 12 times>},
  v8_float = {[0x0] = -2, [0x1] = 2.05849981, [0x2] = 0, [0x3] = 0, [0x4] = 0, [0x5] = 0, [0x6] = 0, [0x7] = 0},
  v4_double = {[0x0] = 2.4679999351501465, [0x1] = 0, [0x2] = 0, [0x3] = 0},
  v32_int8 = {[0x0] = 0x0, [0x1] = 0x0, [0x2] = 0x0, [0x3] = 0xc0, [0x4] = 0x76, [0x5] = 0xbe, [0x6] = 0x3, [0x7] = 0x40, [0x8] = 0x0 <repeats 24 times>},
  v16_int16 = {[0x0] = 0x0, [0x1] = 0xc000, [0x2] = 0xbe76, [0x3] = 0x4003, [0x4] = 0x0 <repeats 12 times>},
  v8_int32 = {[0x0] = 0xc0000000, [0x1] = 0x4003be76, [0x2] = 0x0, [0x3] = 0x0, [0x4] = 0x0, [0x5] = 0x0, [0x6] = 0x0, [0x7] = 0x0},
  v4_int64 = {[0x0] = 0x4003be76c0000000, [0x1] = 0x0, [0x2] = 0x0, [0x3] = 0x0},
  v2_int128 = {[0x0] = 0x4003be76c0000000, [0x1] = 0x0}
}
```
## printf with `xmm`
- test: only read xmm0 (TODO libc too many calls，read C source code) 
```bash
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffded0 ◂— 0x0
01:0008│     0x7fffffffded8 ◂— 0x8000
02:0010│     0x7fffffffdee0 —▸ 0x7fffffffdf78 —▸ 0x7fffffffe8c3 ◂— '/usr/lib/liblua5.4.so'
03:0018│     0x7fffffffdee8 ◂— 0x80000
04:0020│     0x7fffffffdef0 ◂— 0x300000
05:0028│     0x7fffffffdef8 ◂— 0x0
06:0030│     0x7fffffffdf00 —▸ 0x7fffffffe0e8 —▸ 0x7fffffffe570 ◂— 'BEMENU_BACKEND=wayland'
07:0038│     0x7fffffffdf08 —▸ 0x403df0 —▸ 0x401100 ◂— endbr64 
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
 ►0x7ffff7dc7e32<printf+50>   movaps xmmwordptr[rsp+0x70],xmm2
  0x7ffff7dc7e37<printf+55>   movaps xmmwordptr[rsp+0x80],xmm3
  0x7ffff7dc7e3f<printf+63>   movaps xmmwordptr[rsp+0x90],xmm4
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> info br
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x00007ffff7dc7e00 <printf>
        breakpoint already hit 1 time
2       breakpoint     keep y   0x00007fffffffdc48 
3       breakpoint     keep y   0x00007ffff7e6e9c0 <write>
4       acc watchpoint keep y                      *(0x7fffffffded0+0x50)
        breakpoint already hit 1 time
5       acc watchpoint keep y                      *(0x7fffffffded0+0x60)
        breakpoint already hit 1 time
```
### parameter scratch
```bash
pwndbg> dga 0x00007ffff7dc7e68,0x00007ffff7dc7ea7+0x1
Dump of assembler code from 0x7ffff7dc7e68 to 0x7ffff7dc7ea8:
   0x00007ffff7dc7e68 <printf+104>:     48 89 44 24 18          mov    QWORD PTR [rsp+0x18],rax
   0x00007ffff7dc7e6d <printf+109>:     31 c0                   xor    eax,eax
   0x00007ffff7dc7e6f <printf+111>:     48 8d 84 24 e0 00 00 00 lea    rax,[rsp+0xe0]
   0x00007ffff7dc7e77 <printf+119>:     48 89 e2                mov    rdx,rsp
   0x00007ffff7dc7e7a <printf+122>:     31 c9                   xor    ecx,ecx
   0x00007ffff7dc7e7c <printf+124>:     48 89 44 24 08          mov    QWORD PTR [rsp+0x8],rax
   0x00007ffff7dc7e81 <printf+129>:     48 8d 44 24 20          lea    rax,[rsp+0x20]
   0x00007ffff7dc7e86 <printf+134>:     48 89 fe                mov    rsi,rdi
   0x00007ffff7dc7e89 <printf+137>:     48 89 44 24 10          mov    QWORD PTR [rsp+0x10],rax
   0x00007ffff7dc7e8e <printf+142>:     48 8b 05 f3 7e 18 00    mov    rax,QWORD PTR [rip+0x187ef3]        # 0x7ffff7f4fd88
   0x00007ffff7dc7e95 <printf+149>:     c7 04 24 08 00 00 00    mov    DWORD PTR [rsp],0x8
   0x00007ffff7dc7e9c <printf+156>:     48 8b 00                mov    rax,QWORD PTR [rax]
   0x00007ffff7dc7e9f <printf+159>:     c7 44 24 04 30 00 00 00 mov    DWORD PTR [rsp+0x4],0x30
   0x00007ffff7dc7ea7 <printf+167>:     48 89 c7                mov    rdi,rax
pwndbg> telescope $rsp 0x1f
00:0000│ rsp 0x7fffffffdfa8 —▸ 0x40107f (main+47) ◂— mov rdx,rsp
01:0008│     0x7fffffffdfb0 ◂— 0x0
02:0010│     0x7fffffffdfb8 ◂— 0xd0c30a3adaf82800
03:0018│     0x7fffffffdfc0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
04:0020│     0x7fffffffdfc8 —▸ 0x7ffff7d9b790 ◂— mov edi,eax
05:0028│     0x7fffffffdfd0 —▸ 0x7fffffffe0c0 —▸ 0x7fffffffe0c8 ◂— 0x38 /* '8' */
06:0030│     0x7fffffffdfd8 —▸ 0x401050 (main) ◂— sub rsp,0x18
07:0038│     0x7fffffffdfe0 ◂— 0x100400040 /* '@' */
08:0040│     0x7fffffffdfe8 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
09:0048│     0x7fffffffdff0 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
0a:0050│     0x7fffffffdff8 ◂— 0xee0fb9aaeca58ca7
0b:0058│     0x7fffffffe000 ◂— 0x0
0c:0060│     0x7fffffffe008 —▸ 0x7fffffffe0e8 —▸ 0x7fffffffe570 ◂— 'BEMENU_BACKEND=wayland'
0d:0068│     0x7fffffffe010 —▸ 0x403df0 —▸ 0x401180 ◂— endbr64 
0e:0070│     0x7fffffffe018 —▸ 0x7ffff7ffd000 (_rtld_global) —▸ 0x7ffff7ffe2c0 ◂— 0x0
0f:0078│     0x7fffffffe020 ◂— 0x11f0465553078ca7
10:0080│     0x7fffffffe028 ◂— 0x11f05619822f8ca7
11:0088│     0x7fffffffe030 ◂— 0x0
... ↓        2 skipped
14:00a0│     0x7fffffffe048 —▸ 0x7fffffffe0d8 —▸ 0x7fffffffe54a ◂— '/mnt/ubuntu/home/czg/csapp3e/asm/prog'
15:00a8│     0x7fffffffe050 ◂— 0x1
16:00b0│     0x7fffffffe058 ◂— 0xd0c30a3adaf82800
17:00b8│     0x7fffffffe060 ◂— 0x0
18:00c0│     0x7fffffffe068 —▸ 0x7ffff7d9b84a (__libc_start_main+138) ◂— mov r15,qwordptr[rip+0x1b4737]
19:00c8│     0x7fffffffe070 —▸ 0x401050 (main) ◂— sub rsp,0x18
1a:00d0│     0x7fffffffe078 —▸ 0x403df0 —▸ 0x401180 ◂— endbr64 
1b:00d8│     0x7fffffffe080 ◂— 0x0
... ↓        2 skipped
1e:00f0│     0x7fffffffe098 —▸ 0x4010d0 (_start) ◂— endbr64 
```
- `rsp+0x18` -> ... -> '/mnt/ubuntu/home/czg/csapp3e/asm/prog' which is overwrited by `rax = 0x1`
- clear rax after save it
- `rsp+0xe0` addr -> rax -> `rsp+0x8`
- `rsp` -> `rdx` (caller reg save)
- clear `ecx` param
- `rsp+0x20` addr -> rax -> `rsp+0x10`
- `rip+0x187ef3` -> rax; rax -> rax -> rdi, so `rdi` -> `_IO_2_1_stdout_` , which probably is to call
```bash
pwndbg> telescope 0x00007ffff7dc7e95+0x187ef3
00:0000│  0x7ffff7f4fd88 —▸ 0x7ffff7f51688 (stdout) —▸ 0x7ffff7f515a0 (_IO_2_1_stdout_) ◂— 0xfbad2084
```
- 0x8 -> rsp, 0x30 -> rsp+0x4
> above rsp+0x0/4/8/10/18 is overrided after `0x00007ffff7dc7e68`, 20~c0 -> params with printf TODO 0xd0 maybe used when exit, 0xe0 is saved
```bash
pwndbg> telescope rsp+0xd0
00:0000│  0x7fffffffe078 —▸ 0x403df0 —▸ 0x401180 ◂— endbr64 
01:0008│  0x7fffffffe080 ◂— 0x0
pwndbg> | maintenance info sections |grep 403df0

 [18]     0x00403de8->0x00403df0 at 0x00002de8: .init_array ALLOC LOAD DATA HAS_CONTENTS
 [19]     0x00403df0->0x00403df8 at 0x00002df0: .fini_array ALLOC LOAD DATA HAS_CONTENTS
pwndbg> telescope 0x00403de8

00:0000│         0x403de8 —▸ 0x4011b0 ◂— endbr64 
01:0008│ rcx r14 0x403df0 —▸ 0x401180 ◂— endbr64 
02:0010│         0x403df8 (_DYNAMIC) ◂— 0x1
```
above param save is similar to how env saved in stack
```bash
pwndbg> telescope 0x7fffffffe0d8 0xff
02:0010│ rcx  0x7fffffffe0e8 —▸ 0x7fffffffe56f ◂— 'BEMENU_BACKEND=wayland'
03:0018│      0x7fffffffe0f0 —▸ 0x7fffffffe586 ◂— 'BROWSER=google-chrome-stable'
04:0020│      0x7fffffffe0f8 —▸ 0x7fffffffe5a3 ◂— 'COLORFGBG=0;15'
05:0028│      0x7fffffffe100 —▸ 0x7fffffffe5b2 ◂— 'COLORTERM=truecolor'
06:0030│      0x7fffffffe108 —▸ 0x7fffffffe5c6 ◂— 'DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus'
07:0038│      0x7fffffffe110 —▸ 0x7fffffffe5fc ◂— 'DEBUGINFOD_URLS=https://debuginfod.archlinux.org'
08:0040│      0x7fffffffe118 —▸ 0x7fffffffe62d ◂— 'DESKTOP_SESSION=plasmawayland'
09:0048│      0x7fffffffe120 —▸ 0x7fffffffe64b ◂— 'DISPLAY=:1'
0a:0050│      0x7fffffffe128 —▸ 0x7fffffffe656 ◂— 'GBM_BACKEND=nvidia-drm'
...
93:0498│      0x7fffffffe570 ◂— 'EMENU_BACKEND=wayland'
94:04a0│      0x7fffffffe578 ◂— 'CKEND=wayland'
95:04a8│      0x7fffffffe580 ◂— 0x524200646e616c79 /* 'yland' */
96:04b0│      0x7fffffffe588 ◂— 'OWSER=google-chrome-stable'
97:04b8│      0x7fffffffe590 ◂— 'ogle-chrome-stable'
98:04c0│      0x7fffffffe598 ◂— 'ome-stable'
99:04c8│      0x7fffffffe5a0 ◂— 0x524f4c4f4300656c /* 'le' */
9a:04d0│      0x7fffffffe5a8 ◂— 'FGBG=0;15'
```
[pdf p249](../references/intel_64.pdf) -> `67h` -> addr32 prefix here `e8` -> rel , no mem op(erand)
```bash
# here addr32 no use https://stackoverflow.com/questions/72892152/whats-addr32-in-assembly-means
   0x00007ffff7dc7ec7 <+199>:   67 e8 53 7d 0c 00       addr32 call 0x7ffff7e8fc20 <__stack_chk_fail>
```
## nopie when exit
```bash
pwndbg> d-- 0x401110
   0x0000000000401100 <_dl_relocate_static_pie+0>:      f3 0f 1e fa             endbr64
   0x0000000000401104 <_dl_relocate_static_pie+4>:      c3                      ret

   0x0000000000401180:  f3 0f 1e fa             endbr64
   0x0000000000401184:  80 3d 95 2e 00 00 00    cmp    BYTE PTR [rip+0x2e95],0x0        # 0x404020
=> 0x000000000040118b:  75 13                   jne    0x4011a0
   0x000000000040118d:  55                      push   rbp
   0x000000000040118e:  48 89 e5                mov    rbp,rsp
   0x0000000000401191:  e8 7a ff ff ff          call   0x401110
   0x0000000000401196:  c6 05 83 2e 00 00 01    mov    BYTE PTR [rip+0x2e83],0x1        # 0x404020
   0x000000000040119d:  5d                      pop    rbp
   0x000000000040119e:  c3                      ret
pwndbg> bt
#0  0x000000000040118b in ?? ()
#1  0x00007ffff7fcb0e2 in ?? () from /lib64/ld-linux-x86-64.so.2
#2  0x00007ffff7fcef4e in ?? () from /lib64/ld-linux-x86-64.so.2
#3  0x00007ffff7db3445 in ?? () from /usr/lib/libc.so.6
#4  0x00007ffff7db35b0 in exit () from /usr/lib/libc.so.6
#5  0x00007ffff7d9b797 in ?? () from /usr/lib/libc.so.6
#6  0x00007ffff7d9b84a in __libc_start_main () from /usr/lib/libc.so.6
```
## hlt last to stop current running logical processor and `endbr64` always first(although the latter not supported in old cpu)
```bash
pwndbg> dr
Dump of assembler code for function _start:
...
   0x00000000004010f8 <+24>:    48 c7 c7 60 10 40 00    mov    rdi,0x401060
   0x00000000004010ff <+31>:    ff 15 c3 2e 00 00       call   QWORD PTR [rip+0x2ec3]        # 0x403fc8
   0x0000000000401105 <+37>:    f4                      hlt
pwndbg> telescope 0x401060
00:0000│  0x401060 (main) ◂— sub rsp,0x18
pwndbg> telescope 0x403fc8
00:0000│  0x403fc8 —▸ 0x7ffff7d9b7c0 (__libc_start_main) ◂— endbr64
```
## TODO why vdso&vdrr location diff between gdb and r2
- [maybe this](https://manpages.ubuntu.com/manpages/xenial/man7/vdso.7.html), but why location state related with [stack] always same.
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ pstree -apnh | grep prog     
  |   |       |   `-r2,18110 -AA -c db sym.multstore;dc -d /mnt/ubuntu/home/czg/csapp3e/asm/prog
  |   |       |       `-prog,18111
  |   |       |   `-gdb,19446 -q ./prog -ex starti -ex set record full stop-at-limit off -nx -iex ...
  |   |       |       `-prog,19480
  |   |           `-grep,19619 --color=auto prog
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ sudo cat /proc/19480/maps -vv
00400000-00401000 r--p 00000000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00401000-00402000 r-xp 00001000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00402000-00403000 r--p 00002000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00403000-00404000 r--p 00002000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00404000-00405000 rw-p 00003000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
7ffff7c8d000-7ffff7c90000 rw-p 00000000 00:00 0 
...
7ffff7f7d000-7ffff7f85000 r--p 00000000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7ffff7f85000-7ffff7fb3000 r-xp 00008000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7ffff7fb3000-7ffff7fbf000 r--p 00036000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7ffff7fbf000-7ffff7fc1000 r--p 00042000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7ffff7fc1000-7ffff7fc2000 rw-p 00044000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7ffff7fc2000-7ffff7fc4000 rw-p 00000000 00:00 0 
7ffff7fc4000-7ffff7fc8000 r--p 00000000 00:00 0                          [vvar]
7ffff7fc8000-7ffff7fca000 r-xp 00000000 00:00 0                          [vdso]
7ffff7fca000-7ffff7fcb000 r--p 00000000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffff7fcb000-7ffff7ff1000 r-xp 00001000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffff7ff1000-7ffff7ffb000 r--p 00027000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffff7ffb000-7ffff7ffd000 r--p 00031000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffff7ffd000-7ffff7fff000 rw-p 00033000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffffffde000-7ffffffff000 rw-p 00000000 00:00 0                          [stack]
ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0                  [vsyscall]

[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ sudo cat /proc/18111/maps -vv
00400000-00401000 r--p 00000000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00401000-00402000 r-xp 00001000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00402000-00403000 r--p 00002000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00403000-00404000 r--p 00002000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
00404000-00405000 rw-p 00003000 103:08 2105174                           /mnt/ubuntu/home/czg/csapp3e/asm/prog
012bb000-012dc000 rw-p 00000000 00:00 0                                  [heap]
...
7f9e67f5b000-7f9e67f5c000 rw-p 00044000 00:18 333519                     /usr/lib/liblua.so.5.4.4
7f9e67f5c000-7f9e67f5e000 rw-p 00000000 00:00 0 
7f9e67f5e000-7f9e67f5f000 r--p 00000000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7f9e67f5f000-7f9e67f85000 r-xp 00001000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7f9e67f85000-7f9e67f8f000 r--p 00027000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7f9e67f8f000-7f9e67f91000 r--p 00031000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7f9e67f91000-7f9e67f93000 rw-p 00033000 00:18 3960                       /usr/lib/ld-linux-x86-64.so.2
7ffd32f83000-7ffd32fa4000 rw-p 00000000 00:00 0                          [stack]
7ffd32fe7000-7ffd32feb000 r--p 00000000 00:00 0                          [vvar]
7ffd32feb000-7ffd32fed000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0                  [vsyscall]
# same with in r2 and pwndbg
[0x004011e0]> dm
...
0x00007ffd32f83000 - 0x00007ffd32fa4000 - usr   132K s rw- [stack] [stack] ; map._stack_.rw_
0x00007ffd32fe7000 - 0x00007ffd32feb000 - usr    16K s r-- [vvar] [vvar] ; map._vvar_.r__
0x00007ffd32feb000 - 0x00007ffd32fed000 - usr     8K s r-x [vdso] [vdso] ; map._vdso_.r_x
0xffffffffff600000 - 0xffffffffff601000 - usr     4K s --x [vsyscall] [vsyscall] ; map._vsyscall_.__x
pwndbg> vmmap
    0x7ffff7fc4000     0x7ffff7fc8000 r--p     4000      0 [vvar]
    0x7ffff7fc8000     0x7ffff7fca000 r-xp     2000      0 [vdso]
    0x7ffff7fca000     0x7ffff7fcb000 r--p     1000      0 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7fcb000     0x7ffff7ff1000 r-xp    26000   1000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ff1000     0x7ffff7ffb000 r--p     a000  27000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ffb000     0x7ffff7ffd000 r--p     2000  31000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffff7ffd000     0x7ffff7fff000 rw-p     2000  33000 /usr/lib/ld-linux-x86-64.so.2
    0x7ffffffde000     0x7ffffffff000 rw-p    21000      0 [stack]
0xffffffffff600000 0xffffffffff601000 --xp     1000      0 [vsyscall]

```
## view virtual address space structure
```bash
$ cc -Og -Wall -I ../include -I . select.c ../src/csapp.o echo.o  -lpthread -lm -o select
$ /mnt/ubuntu/home/czg/csapp3e/conc/select 1111
$ ps aux | grep sele                           
czg         5263  0.0  0.0   3704  2048 pts/2    S+   09:40   0:00 ./select 1111
$ cat /proc/5263/maps                          
562935e6d000-562935e6f000 r--p 00000000 103:08 2145565                   /mnt/ubuntu/home/czg/csapp3e/conc/select
562935e6f000-562935e71000 r-xp 00002000 103:08 2145565                   /mnt/ubuntu/home/czg/csapp3e/conc/select
562935e71000-562935e73000 r--p 00004000 103:08 2145565                   /mnt/ubuntu/home/czg/csapp3e/conc/select
562935e73000-562935e74000 r--p 00005000 103:08 2145565                   /mnt/ubuntu/home/czg/csapp3e/conc/select
562935e74000-562935e75000 rw-p 00006000 103:08 2145565                   /mnt/ubuntu/home/czg/csapp3e/conc/select
562936ba1000-562936bc2000 rw-p 00000000 00:00 0                          [heap]
$ objdump -D /mnt/ubuntu/home/czg/csapp3e/conc/sharing | grep ptr -A 20 -B 20
Disassembly of section .bss:

0000000000007280 <stderr@GLIBC_2.2.5>:
        ...

0000000000007290 <ptr>:
        ...

0000000000007298 <cnt.0>:
$ objdump -D /mnt/ubuntu/home/czg/csapp3e/conc/sharing | grep text -A 20     
Disassembly of section .text:

0000000000002500 <_start>:
```
- below is wrong calculation
check in `python`:
```python
$ python
Python 3.10.10 (main, Mar  5 2023, 22:26:53) [GCC 12.2.1 20230201] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> hex(0x7290-0x2500)
'0x4d90'
>>> hex(0x0000562935e6d000+0x4d90)
'0x562935e71d90' # in 562935e71000-562935e73000 r--p -> /mnt/ubuntu/home/czg/csapp3e/conc/select
```
### need using `-fno-pic -no-pie` to view
```bash
$ cc -Og -Wall -I ../include -I . -fno-pic -no-pie select.c ../src/csapp.o ../src/echo.o  -lpthread -lm -o select
...
$ cat /proc/9152/maps 
00400000-00402000 r--p 00000000 103:08 2145537                           /mnt/ubuntu/home/czg/csapp3e/conc/select
00402000-00404000 r-xp 00002000 103:08 2145537                           /mnt/ubuntu/home/czg/csapp3e/conc/select
00404000-00406000 r--p 00004000 103:08 2145537                           /mnt/ubuntu/home/czg/csapp3e/conc/select
00406000-00407000 r--p 00005000 103:08 2145537                           /mnt/ubuntu/home/czg/csapp3e/conc/select
00407000-00408000 rw-p 00006000 103:08 2145537                           /mnt/ubuntu/home/czg/csapp3e/conc/select
01cee000-01d0f000 rw-p 00000000 00:00 0                                  [heap]
# here is largely different from above with `pic` especially with segment size.
$ objdump -D /mnt/ubuntu/home/czg/csapp3e/conc/sharing | grep bss -A 20        
Disassembly of section .bss:

0000000000407280 <stderr@GLIBC_2.2.5>:
        ...

0000000000407290 <ptr>:
        ...

0000000000407298 <cnt.0>:
# so bss is 00407000-00408000 rw-p

# 00402000-00404000 r-xp begin
$ objdump -D /mnt/ubuntu/home/czg/csapp3e/conc/sharing | grep 402000 -A 20 
0000000000402000 <_init>:
```
## bigger return value unable fit in `rax`
- fpu [pdf p206 Figure 8-2.](../references/intel_64.pdf)
### long double(8 byte) returned by fpu
- `fld` is similar to `push` although push to another stack `fpu`
```bash
pwndbg> c
Continuing.

Watchpoint 2: $st0

Old value = 3.1400000000000000001
New value = 6.13999999999999999988

Watchpoint 3: $st1

Old value = 0
New value = 3.1400000000000000001
pwndbg> dr
   0x000055555555515b <+4>:     db 2d af 0e 00 00       fld    TBYTE PTR [rip+0xeaf]        # 0x555555556010
   0x0000555555555161 <+10>:    db 2d b9 0e 00 00       fld    TBYTE PTR [rip+0xeb9]        # 0x555555556020
=> 0x0000555555555167 <+16>:    d9 ee                   fldz
```
### bigger struct is passed by stack (below test with `O1` will drop `test1` implementation in `main`)
```bash
$ cat test_return_struct.c
struct object_t
{
  long long m1;
  long long m2;
  long long m3;
};
...
int main(){
  ...
        struct object_t c=test1();
        printf("%lld\n",c.m1);
}
# -Og
$ cat Makefile 
CFLAGS = -g -Wall -Og
...
$ objdump test_return_struct -dr
0000000000001149 <test1>:
    1149:       48 89 f8                mov    rax,rdi
    114c:       48 b9 00 00 00 00 00    movabs rcx,0x10000000000
    1153:       01 00 00 
    1156:       48 89 4c 24 d8          mov    QWORD PTR [rsp-0x28],rcx
    115b:       48 be 00 00 00 00 00    movabs rsi,0x20000000000
    1162:       02 00 00 
    1165:       48 89 74 24 e0          mov    QWORD PTR [rsp-0x20],rsi
    116a:       48 ba 00 00 00 00 00    movabs rdx,0x30000000000
    1171:       03 00 00 
    1174:       48 89 54 24 e8          mov    QWORD PTR [rsp-0x18],rdx
# here use `xmm0` to pack two long long(8byte)
    1179:       66 0f 6f 44 24 d8       movdqa xmm0,XMMWORD PTR [rsp-0x28]
    117f:       0f 11 07                movups XMMWORD PTR [rdi],xmm0
    1182:       48 89 57 10             mov    QWORD PTR [rdi+0x10],rdx
...
0000000000001190 <main>:
...
    1194:       64 48 8b 04 25 28 00    mov    rax,QWORD PTR fs:0x28
    119b:       00 00 
    119d:       48 89 44 24 18          mov    QWORD PTR [rsp+0x18],rax
    11a2:       31 c0                   xor    eax,eax
    11a4:       48 89 e7                mov    rdi,rsp
    11a7:       e8 9d ff ff ff          call   1149 <test1>
    11ac:       48 8b 34 24             mov    rsi,QWORD PTR [rsp]
    11b0:       48 8d 3d 4d 0e 00 00    lea    rdi,[rip+0xe4d]        # 2004 <_IO_stdin_used+0x4>
    11b7:       b8 00 00 00 00          mov    eax,0x0
    11bc:       e8 7f fe ff ff          call   1040 <printf@plt>
```
above: `main:rsp` -> `rdi`, then `test1:rsp-0x28` -> `xmm0` -> `rdi`
## 12.33
- TODO `/*weird sizeof(int)*ARG_ROW*M -> '4*2*64' -> '640'*/` in 12.34_self_test.c (here 'sizeof(int)*ARG_ROW*M' is hardcoded by compiler `gcc`)
  - check by viewing `bt` when crash, then check whether param of crash func (below is `memcpy`) is right. 
```bash
$ cat ./12.34_self_test.c | grep ' BUG' -A 2
#define BUG
struct arg{
    int mat1[ARG_ROW][M];
--
        #ifdef BUG
        memcpy(thread_arg[i].return_mat, mat1,sizeof(int)*ARG_ROW*N);
        #else
$ make
$ ./12.34_self_test
...
*** stack smashing detected ***: terminated
$ cat 12.34_self_test.s | grep 400 -B 2
        push    rax     # tmp115
        push    40      #
        push    400     #
--
# 12.34_self_test.c:84:         memcpy(thread_arg[i].return_mat, mat1,sizeof(int)*ARG_ROW*N);
        lea     rax, -197648[rbp]       # tmp125,
        mov     edx, 400        #,
$ cat 12.34_self_test.s | grep -e 'fs:' -A 2
        mov     rax, QWORD PTR fs:40    # tmp168, MEM[(<address-space-1> long unsigned int *)40B]
        mov     QWORD PTR -8[rbp], rax  # D.7092, tmp168
        xor     eax, eax        # tmp168
--
        sub     rdx, QWORD PTR fs:40    # tmp169, MEM[(<address-space-1> long unsigned int *)40B]
        je      .L28    #,
        call    __stack_chk_fail@PLT    #

# 0x7fffffffdea8 -> -8[rbp]
$ pwngdb ./12.34_self_test -ex 'start' -ex 'awa *(0x7fffffffdea8)' -ex 'c'
...
pwndbg> c
Thread 1 "12.34_self_test" hit Hardware access (read/write) watchpoint 2: *(0x7fffffffdea8)

Old value = 0xb610ca00
New value = 0x1
...
────────────────────────────────────────────────────────────────────────────────────[ BACKTRACE ]────────────────────────────────────────────────────────────────────────────────────
 ► f 0   0x7ffff7ec87e2
   f 1   0x555555556945 main+562
pwndbg> dga main
...
   0x0000555555556907 <+500>:   e9 26 01 00 00          jmp    0x555555556a32 <main+799>
   0x000055555555690c <+505>:   48 8d 85 f0 4b fd ff    lea    rax,[rbp-0x2b410]
   0x0000555555556913 <+512>:   8b 95 c0 f7 fc ff       mov    edx,DWORD PTR [rbp-0x30840]
   0x0000555555556919 <+518>:   48 63 d2                movsxd rdx,edx
   0x000055555555691c <+521>:   48 69 d2 40 2b 00 00    imul   rdx,rdx,0x2b40
   0x0000555555556923 <+528>:   48 81 c2 00 2a 00 00    add    rdx,0x2a00
  #  ignore this: here 'return_mat' of return_mat[ARG_ROW][N] should be at stack bottom and decrease in 'memcpy' to access next element in matrix
   0x000055555555692a <+535>:   48 8d 0c 10             lea    rcx,[rax+rdx*1]
   0x000055555555692e <+539>:   48 8d 85 f0 fb fc ff    lea    rax,[rbp-0x30410]
   0x0000555555556935 <+546>:   ba 90 01 00 00          mov    edx,0x190 # weird 0x190=400
   0x000055555555693a <+551>:   48 89 c6                mov    rsi,rax
   0x000055555555693d <+554>:   48 89 cf                mov    rdi,rcx
   0x0000555555556940 <+557>:   e8 3b f9 ff ff          call   0x555555556280 <memcpy@plt>
   0x0000555555556945 <+562>:   48 8d 95 f0 4b fd ff    lea    rdx,[rbp-0x2b410]
...
   0x0000555555556a32 <+799>:   83 bd c0 f7 fc ff 0f    cmp    DWORD PTR [rbp-0x30840],0xf
   0x0000555555556a39 <+806>:   0f 8e cd fe ff ff       jle    0x55555555690c <main+505>
pwndbg> telescope $rbp-0x30840
00:0000│  0x7ffffffcd670 ◂— 0xf # obviously

pwndbg> p $rcx
$1 = 0x7fffffffdd60
pwndbg> p $rbp-0x8
$2 = (void *) 0x7fffffffdea8
pwndbg> 0x7fffffffdd60+0x190
Undefined command: "0x7fffffffdd60+0x190".  Try "help".
pwndbg> p 0x7fffffffdd60+0x190
$3 = 0x7fffffffdef0
pwndbg> p 0x7fffffffdd60+320
$4 = 0x7fffffffe080
pwndbg> p 0x7fffffffdd60+0x140
$5 = 0x7fffffffdea0
# ignore this: here exactly not allow overflow calculated by compiler
# here has overwriten other user stack data.
pwndbg> p 0x7fffffffdea8-(0x7fffffffdd60+0x140)
$6 = 0x8
```
### use `rep movsq` to realize `memcpy`
```bash
$ cat 12.34_self_test.s | grep ':81' -A 10
# 12.34_self_test.c:81:     memcpy(arg_mat, mat1,sizeof(arg_mat));
        lea     rax, -198160[rbp]       # tmp117,
        lea     rdx, -197648[rbp]       # tmp118,
        mov     ecx, 64 # tmp119,
        mov     rdi, rax        # tmp117, tmp117
        mov     rsi, rdx        # tmp118, tmp118
        rep movsq
pwndbg> ...
   0x00005555555568e1 <+462>:   48 8d 85 f0 f9 fc ff    lea    rax,[rbp-0x30610]
   0x00005555555568e8 <+469>:   48 8d 95 f0 fb fc ff    lea    rdx,[rbp-0x30410]
   0x00005555555568ef <+476>:   b9 40 00 00 00          mov    ecx,0x40
   0x00005555555568f4 <+481>:   48 89 c7                mov    rdi,rax
   0x00005555555568f7 <+484>:   48 89 d6                mov    rsi,rdx
   0x00005555555568fa <+487>:   f3 48 a5                rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
```
### stack can't be overflowed because compiler may use gap among stack to save small data
```bash
$ vim 12.34_self_test.s
276 .L18:
277 # 12.34_self_test.c:86:         memcpy(thread_arg[i].return_mat, mat1,ret_size);
278     mov eax, DWORD PTR -198708[rbp] # tmp121, ret_size
279     movsx   rdx, eax    # _3, tmp121
280 # 12.34_self_test.c:86:         memcpy(thread_arg[i].return_mat, mat1,ret_size);
281     lea rax, -177168[rbp]   # tmp122,
282     mov ecx, DWORD PTR -198720[rbp] # tmp124, i
283     movsx   rcx, ecx    # tmp123, tmp124
284     imul    rcx, rcx, 11072 # tmp125, tmp123,
285     add rcx, 10752  # tmp126,
286     add rcx, rax    # _4, tmp122
287 # 12.34_self_test.c:86:         memcpy(thread_arg[i].return_mat, mat1,ret_size);
288     lea rax, -197648[rbp]   # tmp127,
289     mov rsi, rax    #, tmp127
290     mov rdi, rcx    #, _4
291     call    memcpy@PLT  #
# check in ./asm/bfloat16_half.py
$ python ./asm/bfloat16_half.py
...
check 12.34
find: False
```
## COD <a id="COD"></a>
### [see matrix-matrix-multiply](https://github.com/czg-sci-42ver/matrix-matrix-multiply)
- `data16 cs nop WORD PTR [rax+rax*1+0x0]`
  - [disable](https://stackoverflow.com/questions/4486301/gcc-function-padding-value) alignment manually
  - here `cs` just to align, can be any [segment register](#segment) po.
    - [`2e`](https://stackoverflow.com/questions/49994919/assembly-instruction-and-an-extra-2e-prefix-before-its-opcode) 'addressing mode'
  - [data16](https://stackoverflow.com/questions/36706280/what-does-data16-mean-in-objdump-output) 'the sixth is the w in the nopw' (i.e. above `nop WORD PTR`), also see [pdf p1385](../references/intel_64.pdf)
    - here `WORD` or [`DWORD`](https://stackoverflow.com/questions/43991155/what-does-nop-dword-ptr-raxrax-x64-assembly-instruction-do?rq=3) ~~is based on `mode` and how assembler reads instruction bytes~~ see [prefix](#prefix) ‘table’ -> '1	N/A	Yes	16-bit'
    - more detailed with 
    [this link](http://john.freml.in/amd64-nopl) from [this](https://stackoverflow.com/questions/4798356/amd64-nopw-assembly-instruction)
      - this link:nop different bytes [C code](https://chromium.googlesource.com/native_client/nacl-toolchain/+/  feaa0af17a4d4e1a87c7de1d53a72fe19e708286/binutils/gas/config/tc-i386.c)
        - why to align: 'make sure that the target can be fetched in a single cacheline request is important', 'more efficient than repeatedly exercising the decode logic','the capability to memorize ONE **jump** instruction for every 16 bytes'
- two `ret` maybe [missed optimisation](https://stackoverflow.com/questions/74700866/why-would-gcc-o3-generate-multiple-ret-instructions) -> [1](https://stackoverflow.com/questions/62556736/why-does-gcc-emit-a-repeated-ret) -> [bug report](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71923)
  - maybe also to ~~avoid~~ decrese branch prediction penalty in some cases(po not applied to the condition here), 'duplicate any **necessary cleanup**',here two `...` are same.
    ```asm
    je lbl0
    ...
    ret
    lbl0:
    ...
    ret
    ```
    - kw: 'stack-like predictor','tail duplication','results in **fewer dynamic** instructions'
    - [loop tail duplication](https://www.technovelty.org/c/superblock-scheduling-and-tail-duplication.html) just to decrese branch prediction penalty, 'separately has a dec ecx / jnz .top_of_loop'
    - TODO: 'like you'd do with jmp fn1 instead of call fn1; ret'
  - TODO learn rtl, reread above link
  - bug report
    - [BB reorder](https://www.gnu.org/software/gcc/news/reorder.html),here just use cpu `always not taken` to optimize.
    - definition: just [change](https://discourse.llvm.org/t/extending-llvm-basic-block-reordering/33941) small jmp block
  - [Tail call optimization](https://en.wikipedia.org/wiki/Tail_call#In_assembly) including one optimization to remove unnecessary call and ret, [also 'there is one step that is unnecessary'](https://exploringjs.com/es6/ch_tail-calls.html#_tail-call-optimization)
## intel SIMD Intrinsics like avx,etc
- [see](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#text=_mm512_fmadd_pd&ig_expand=3105)
# asm thinking from optimization
- while loop
  - always [->](https://stackoverflow.com/questions/47783926/why-are-loops-always-compiled-into-do-while-style-tail-jump) do while, called [inversion](https://en.wikipedia.org/wiki/Loop_optimization) which may do one less `jmp` in every loop
    - above in short, reasons are that 1. Fewer instructions，see ‘cmp     edi, esi’
    - [SW](https://en.wikipedia.org/wiki/Software_pipelining#Example) pipelining where uses the independence like `A(i)` and `A(i+1)` to OoO by software. 
    - Loop inversion can at least remove the misprediction penalty mostly of the last execution before exiting because just [dropping out](https://en.wikipedia.org/wiki/Loop_inversion#Example_in_three-address_code) (no 'goto L2' in the latter code) the loop whether take jmp or not.
      - 'inversion' may refer to ' could change for(i) for(j) a[j][i]++;' from original contents
    - TODO: 1. 'hiding loop-carried FP latency in a reduction loop' 2. more detailed info to read after 'Benefits with very low iteration count:' 3. 'SPECint2006' meaning 4. different execution ports 5. try [`fprofile`](https://stackoverflow.com/questions/4365980/how-to-use-profile-guided-optimizations-in-g) 6. better reread after more knowledge. 7. instruction 'free' and ‘front-end’ meaning
# gdb usage
- use `x/g` to avoid accidental truncate of variable in stack (can tested with `voltron`)  
## voltron
- [`add byte [eax], al`](https://reverseengineering.stackexchange.com/questions/17555/radare-produces-a-bunch-of-add-byte-rax-al-but-why) all zeroes.
## pwndbg ([pwnlib/pwntools](https://docs.pwntools.com/en/stable/about.html))
- setting with [EFLAGS](http://www.c-jump.com/CIS77/ASM/Instructions/I77_0070_eflags_bits.htm) [pdf p80](../references/intel_64.pdf) in [gdb `p $eflags`](https://gist.github.com/mepcotterell/199b86a558b3f944589674f53ff681b0)
- [readthedoc wiki](https://browserpwndbg.readthedocs.io/en/docs/commands/misc/pwndbg/)
```python
# context.py
"context-flag-set-color", "green,bold", "color for flags register (flag set)"
```
### ghidra
- must add `set context-ghidra always` in cfg even have `set context-sections ... ghidra` addeed in cfg
### `vmmap`
- `p` [permission](https://stackoverflow.com/questions/19780783/whats-the-p-permission-found-on-var-run-screen)
```bash
pwndbg> |vmmap|grep sta
    0x7ffffffde000     0x7ffffffff000 rw-p    21000      0 [stack]

$ ps aux | grep gdb
czg         4285  0.0  0.1  93736 24768 pts/4    Sl+  09:01   0:00 vim /home/czg/.gdbinit.d/func_pwndbg.gdb -c vs -c e ~/.gdbinit.d/func.gdb
czg         7381  0.4  1.1 1537832 174348 pts/5  Sl+  10:06   0:26 gdb ./check_cet_supported.out -ex br 6 -ex br 12 -ex br *0x0000555555555040 -ex set record full stop-at-limit off -ex target record-full -ex r -nx -iex source ~/.gdbinit_pwndbg_voltron.gdb
czg        10060  0.0  0.6 1473544 101436 pts/1  Sl+  11:03   0:00 gdb ./check_cet_supported.out -ex starti -ex set record full stop-at-limit off -nx -iex source ~/.gdbinit_pwndbg_voltron.gdb -ex wa $rdi -ex
czg        11233  0.0  0.0  10856  2944 pts/13   S+   11:42   0:00 grep --color=auto gdb
$ ls /proc/7381/fd -al
total 0
dr-x------ 2 czg czg 20 Apr 14 10:06 .
dr-xr-xr-x 9 czg czg  0 Apr 14 10:06 ..
lrwx------ 1 czg czg 64 Apr 14 10:06 0 -> /dev/pts/5
lrwx------ 1 czg czg 64 Apr 14 10:06 1 -> /dev/pts/5
l-wx------ 1 czg czg 64 Apr 14 11:43 10 -> 'pipe:[140131]'
lr-x------ 1 czg czg 64 Apr 14 11:43 11 -> 'pipe:[138023]'
l-wx------ 1 czg czg 64 Apr 14 11:43 12 -> 'pipe:[138023]'
...
```
### tip
- GDB's set directories <path> parameter can be used to debug e.g. glibc sources like the malloc/free functions!
## gdb
- [LWP](https://stackoverflow.com/questions/4691031/getting-info-about-threads-in-gdb-ddd)
- breakpoint source [code](https://gitlab.com/git-mirrors/binutils/-/blob/master/gdb/python/lib/gdb/dap/events.py) or [API](https://sourceware.org/gdb/onlinedocs/gdb/Breakpoints-In-Python.html#Breakpoints-In-Python)
  (recommend read API firts, **if not understand** then go to source code [not to adhere to understandign all source codes])
- memory [watchpoint](https://stackoverflow.com/questions/11004374/watch-a-memory-range-in-gdb) [more](https://sourceware.org/gdb/download/onlinedocs/gdb/Set-Watchpoints.html#Set-Watchpoints)
- [probe](https://docs.rs/probe/latest/probe/)
- [args](https://stackoverflow.com/a/29741504/21294350) (`--args` may no use)
- view [fd](https://stackoverflow.com/questions/2231460/gdb-howto-list-open-files) 
```bash
# https://sourceware.org/gdb/onlinedocs/gdb/Process-Information.html
info proc all
# show process id https://stackoverflow.com/questions/36704270/how-does-one-obtain-the-pid-of-the-currently-debugged-process-in-gdb
pwndbg> call getpid()
'getpid' has unknown return type; cast the call to its declared return type
pwndbg> p (int)getpid()
$2 = 0x1ef21
```
### debug running program <a id="running"></a>
- [1](https://stackoverflow.com/questions/2308653/can-i-use-gdb-to-debug-a-running-process)
```bash
$ cat /proc/sys/kernel/yama/ptrace_scope   
1
$ echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope                                                         
0
$ pstree -apnh | grep 5000 -A 1
  |   |   |   |   `-grep,109774 --color=auto 5000 -A 1
  |   |   |   |-zsh,107547
--
  |   |   |       `-tiny_proxy_map_,109772 5000 8000
  |   |   |-chrome,67353
$ gdb -p 109772 -ex 'handle SIGINT pass' -ex 'p filter_str_list[0]' -ex 'p filter_str_list' -ex 'signal SIGINT'
...
The target architecture is set to "i386:x86-64".
Attaching to process 109772
Reading symbols from /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_map_heap_to_stack...
Reading symbols from /usr/lib/liblua5.4.so...
(No debugging symbols found in /usr/lib/liblua5.4.so)
...
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
0x00007fd2345f0884 in accept () from /usr/lib/libc.so.6
Signal        Stop      Print   Pass to program Description
SIGINT        Yes       Yes     Yes             Interrupt
$1 = 0x5603c07d7850 "www.baidu.com\n"
$2 = (char **) 0x5603c07d72a0
Continuing with signal SIGINT.
[Inferior 1 (process 109772) exited normally]

...
# if using `coredumpctl debug` then maybe no `heap` show , just show 'load...'
$ gdb -p 124802 -ex 'handle SIGINT pass' -ex 'p filter_str_list[0]' -ex 'p filter_str_list' -ex 'vmmap'
...
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
             Start                End Perm     Size Offset File
    0x55c1b6a26000     0x55c1b6a28000 r--p     2000      0 /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_mhtsfrginm_sim
    0x55c1b6a28000     0x55c1b6a2b000 r-xp     3000   2000 /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_mhtsfrginm_sim
    0x55c1b6a2b000     0x55c1b6a2d000 r--p     2000   5000 /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_mhtsfrginm_sim
    0x55c1b6a2d000     0x55c1b6a2e000 r--p     1000   6000 /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_mhtsfrginm_sim
    0x55c1b6a2e000     0x55c1b6a2f000 rw-p     1000   7000 /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/tiny_proxy_mhtsfrginm_sim
    0x55c1b7147000     0x55c1b71cd000 rw-p    86000      0 [heap]

```
### vmmap(pwndbg)
- anon -> [Anonymous mappings](https://stackoverflow.com/questions/13024087/what-are-memory-mapped-page-and-anonymous-page)
  - ‘not backed by a file’,'/dev/zero','there isn't a file specified.' -> just means: not related with one file, also see csapp index
  - 'heap and stack','guaranteed to be zero filled', 'POSIX shared memory' [with](https://www.geeksforgeeks.org/posix-shared-memory-api/) `mmap`
### notice
- `up` and `down` to change frame not change process context, at least most fo registers [unchanged](https://stackoverflow.com/questions/62697912/can-gdb-false-recreate-frames-registers)
- temporarily header demangle no use, although [old version with specific language](https://sourceware.org/pipermail/gdb-patches/2020-July/170823.html) works
## rizin(version:`9ab709bc34843f04ffde3b63322c809596123e77`)
- history in `/home/czg/.cache/rizin/history` or `/home/czg/.cache/radare2/history`
## r2(radare2)
- [wiki](https://r2wiki.readthedocs.io/en/latest/home/misc/cheatsheet/) or [blog](https://rehex.ninja/posts/radare2-rizin-cheatsheet/)
  - also can see official book
- meson [build](https://book.rada.re/first_steps/compilation_portability.html)
### web: [1](https://radareorg.github.io/blog/) [2](https://rada.re/n/) [3](https://www.radare.org/r/me.html)
### installation
- capstone need build from source to make `/usr/include/capstone` version right (python all version is fine) (here `$?` [return](https://stackoverflow.com/questions/7248031/meaning-of-dollar-question-mark-in-shell-scripts) 'exit status of the most recently executed foreground pipeline.' from description in 'Special Parameters' in `man bash`)
```bash
$ pkg-config --cflags capstone
-I/usr/include/capstone
$ cat ~/radare2/sys/install.sh
...
NEED_CAPSTONE=1
pkg-config --cflags capstone > /dev/null 2>&1
echo "\$\?" $?
if [ $? = 0 ]; then
    pkg-config --atleast-version=5.0.0 capstone >/dev/null 2>&1
    if [ $? = 0 ]; then
        pkg-config --variable=archs capstone 2> /dev/null | grep -q riscv
        if [ $? = 0 ]; then
            export CFGARG="--with-syscapstone"
            NEED_CAPSTONE=0
            echo "Note: Using system-wide-capstone"
        else
            echo "Warning: Your system-wide capstone dont have enough archs"
        fi  
    else
        echo "Warning: Your system-wide capstone is too old for me"                                                                                                  
    fi  
else
    echo "Warning: Cannot find system wide capstone"
fi
```
### common cmds
> not to try `ESIL` if not knowing what it will do by running something like `aei`.
> > tested it may cause battery slump to 10% 
>
> see [this](https://book.rada.re/debugger/migration.html)
>
> also [this](https://gist.github.com/williballenthin/6857590dab3e2a6559d7)/[this](https://monosource.gitbooks.io/radare2-explorations/content/intro/debugging.html)
```bash
el # list available cfgs in rizin
e?? # in r2

# `pCd 20 @ 0x00007ffff7fe5b2c ` may drop more than `pd 20 @ 0x00007ffff7fe5b2c` (exist in rizin not in r2)
pd 20 @ 0x00007ffff7fe5b2c
            # ;-- rip:
            # 0x7ffff7fe5b2c     .string "\xf3\x0f\x1e\xfaUH\x8d5\xd4D\xfe\xffH\x8d\x05\x85\x87\x01c" ; len=19
            # 0x7ffff7fe5b33      movq  xmm1, rsi
            # 0x7ffff7fe5b38      movq  xmm2, rax
            # 0x7ffff7fe5b3d      punpcklqdq xmm1, xmm2
pCd 20 @ 0x00007ffff7fe5b2c
# 0x7ffff7fe5b2c   rip:                    0x7ffff7fe5b84 mov rax, qword [rip + 0x170x7ffff7fe5bde jbe 0x7ffff7fe5bc9        0x7ffff7fe5c20 mov rax, rdi
# 0x7ffff7fe5b2c lea rax, [rip + 0x18785]  0x7ffff7fe5b8b mov qword [rip + 0x17f2e],0x7ffff7fe5be0 mov rdi, r8               0x7ffff7fe5c23 jmp 0x7ffff7fe5bc9
# 0x7ffff7fe5b33 movq xmm1, rsi            0x7ffff7fe5b92 test rax, rax             0x7ffff7fe5be3 sub rdi, rax              0x7ffff7fe5c25 nop dword [rax]
# 0x7ffff7fe5b38 movq xmm2, rax            0x7ffff7fe5b95 je 0x7ffff7fe5c28         0x7ffff7fe5be6 cmp rdi, 0xf              0x7ffff7fe5c28 movzx edx, byte [rip + 0x18

# https://github.com/radareorg/radare2
iS;is # check whether have main or other subfunc
af;pdr; agf # get scratch of one function

# https://itnext.io/radare2-for-reverse-engineering-part1-eedf0a47b5cc
aaa;afl;
dcu sym.multstore # shown above

# https://reverseengineering.stackexchange.com/questions/16844/how-to-get-a-nice-stack-view-in-radare2
pxr @ esp # view stack

# https://r2wiki.readthedocs.io/en/latest/home/tips/
ag
pxr @ esp!32

# tweak based on `e??`
e asm.hint.call=true # show syscall func

# https://book.rada.re/visual_mode/visual_panels.html?highlight=layout#saving-layouts
v=test_r2.json # not to format, otherwise, r2 can't recognize

?*~... # search all commands fuzzy
pv1 @ 0x56003724319e # can test view instruction memory
# 0xe8
# 0x56003724319e      e88dfeffff     call sym.imp.__stack_chk_fail 

# https://book.rada.re/first_steps/basic_debugger_session.html
pd 1 @ +$l # show next instruction
F2 -> br
# https://book.rada.re/first_steps/expressions.html
???~vi # check calculation

# https://gist.github.com/williballenthin/6857590dab3e2a6559d7
/aa jbe|head # search instruction, but below it‘s better

# https://github.com/radareorg/radare2/blob/master/doc/intro.md#rop from http://archive.hack.lu/2015/radare2-workshop-slides.pdf from https://r2wiki.readthedocs.io/en/latest/home/resources/
# which would output all possible gadget, may be not original asm
/R push rax

# check func refs http://archive.hack.lu/2015/radare2-workshop-slides.pdf p63
axt sym.main
# https://www.megabeets.net/a-journey-into-radare-2-part-1/
fs symbols
f

# https://reverseengineering.stackexchange.com/questions/18024/rasm2-giving-different-output-each-time-for-x64
rasm2 -a x86 -b 64 -d "48898D80FEFFFF"
rasm2 -d 418b4104

# https://book.rada.re/analysis/syscalls.html
asl read
```
#### TODO
- https://docs.google.com/document/d/1our_fcFcufIJ13QsZoDuGOEBqftF6o0zEkDsqzAy43U/edit#heading=h.zdmriiaus3dc
### [blogs](https://github.com/dukebarman/awesome-radare2)
- [this](https://www.megabeets.net/a-journey-into-radare-2-part-1/)
### notice
- with [large](https://reverseengineering.stackexchange.com/questions/16112/how-to-make-radare2-work-for-a-large-binary/16115#16115) binary
### `dsb`
- [this](https://reverseengineering.stackexchange.com/questions/31804/can-radare2-skip-syscall-when-db-maindtsdc/31805#31805)
```bash
r2 -c "dcu main;dsu -1;ood;dcu main;dts+;3ds;dr rip;dr edi;dsb;dsb;dr rip;dr edi" -d /mnt/ubuntu/home/czg/csapp3e/asm/prog
...
0x00401071
0x00402004 # edi modified
0x00401064
0x00000001
```
# gcc tweak
## parameter use
```bash
$ gcc -fomit-frame-pointer -fno-pic -no-pie -g3 -Og -o prog 010-main.c 010-mstore.c 
$ gcc -pg -fno-pic -no-pie -g3 -Og -o prog 010-main.c 010-mstore.c
$ gcc -fPIE -fPIC -no-pie -fgnu-tm test_got.c -o test_got -lstdc++
...
```
## [view](https://stackoverflow.com/questions/12697081/what-is-the-gmon-start-symbol) `__gmon_start__`
```bash
$ gcc check_cet_supported.c -o check_cet_supported.out -g -no-pie -fno-pic -p -pg
```
## makefile 
### -> `compile_commands.json`
```bash
# https://stackoverflow.com/questions/21134120/how-to-turn-makefile-into-json-compilation-database
$ make --always-make --dry-run \
 | grep -wE 'cc|gcc|g\+\+' \
 | jq -nR '[inputs|{directory:".", command:., file: match("[a-z-]+\\.c").string[0:]}]' > compile_commands.json # maybe no use with complex project 
# https://gist.github.com/gtors/effe8eef7dbe7052b22a009f3c7fc434
$ bear -- make --always-make # work
```
### miscs
- [`%`](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)
  - more [general](https://www.gnu.org/software/make/manual/make.html#Text-Functions) with `subst`
# csapp -> intel manual
- zero extended [pdf p77](../references/intel_64.pdf)
  - tested: above not apply to condition when dest is memory
- att manual 
  - map with intel[pdf p38](../references/att_x86.pdf)
```bash
   0x0000555555555150 <+23>:    c6 45 e3 01             mov    BYTE PTR [rbp-0x1d],0x1
   0x0000555555555154 <+27>:    c7 45 e4 04 00 00 00    mov    DWORD PTR [rbp-0x1c],0x4
=> 0x000055555555515b <+34>:    48 8d 45 e3             lea    rax,[rbp-0x1d]
...
End of assembler dump.
pwndbg> x $rbp-0x1c
0x7fffffffdfa4: 0x00000004
pwndbg> x/g $rbp-0x1c
0x7fffffffdfa4: 0xf7fe638000000004
```
## Problem 3.3 (show how to disassemble & assemble att syntax without `rasm2`(it doesn't support att))
- although access 32bit mem %ebx is a bit weird in 64bit, but if possible having the rights, no problem. 
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ gcc -g -no-pie -nostdlib test_ebx.s && ./a.out
zsh: segmentation fault (core dumped)  ./a.out # here is because no rights to write 0x1 mem
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ objdump -d ./a.out                            

./a.out:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <_start>:
  401000:       48 c7 c0 01 00 00 00    mov    $0x1,%rax
  401007:       48 c7 c7 01 00 00 00    mov    $0x1,%rdi
  40100e:       67 c6 03 01             movb   $0x1,(%ebx)
  401012:       c6 07 01                movb   $0x1,(%rdi)
```
### use `sed` to [test](https://stackoverflow.com/questions/32223572/sed-copy-lines-from-a-file-to-specific-line-in-another-file)
- see how sed [work](https://www.gnu.org/software/sed/manual/html_node/sed-script-overview.html) (similar to vim) 
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ cat 3_4_add.s 

        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)

# note above has 2 blank lines;test whether work
$ sed -n -e '/\(movq\t%rax, -16(%rbp)\)/r ./3_4_add.s' -e '/\(movq\t%rax, -16(%rbp)\)/,+20p' 3_4.s 
        movq    %rax, -16(%rbp)

        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)


        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)


        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)

        movl    $0, %eax
        movq    -8(%rbp), %rdx
        subq    %fs:40, %rdx
        je      .L3
        call    __stack_chk_fail@PLT
# not use egrep,https://stackoverflow.com/questions/1825552/grep-a-tab-in-unix
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ cat 3_4.s|grep -P 'movq\t%rax, -16' -A 20
        movq    %rax, -16(%rbp)

        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)


        movq    -24(%rbp),%rdi
        movq    -16(%rbp),%rsi
        movsbl (%rdi), %eax
        movl %eax, (%rsi)

        movl    $0, %eax
        movq    -8(%rbp), %rdx
        subq    %fs:40, %rdx
        je      .L3
        call    __stack_chk_fail@PLT
# begin use sed
$ cd /mnt/ubuntu/home/czg/csapp3e/asm;gcc -S -o 3_4.s problem_3_4.c -no-pie
$ sed -n -e '/\(movq\t%rax, -16(%rbp)\)/r ./3_4_add.s' -e 'p' 3_4.s > 3_4_char_int.s
$ file="3_4_char_int";gcc -g $file.s -o $file;pwngdb ./$file -ex 'start' -ex 'target record-full'
```
- here `rdi,rsi` is used, a bit of difficult to [call](https://cs.lmu.edu/~ray/notes/gasexamples/) `printf`
### `unsigned char long`
```bash
$ cat problem_3_4.c
// Build with: gcc -m32 -no-pie -g -o plt plt.c

//typedef char src_t ;
//typedef int dest_t;
typedef unsigned char src_t ;
typedef long dest_t;

int main() {
        src_t *sp;
        dest_t *dp;
        //src_t test_src=-1;
        src_t test_src=1;
        dest_t test_dest=1<<63;
        sp=&test_src;
        dp=&test_dest;
}
# important， see above 'weird problems' -> '1...'
$ cat ./sed_3_4.sh
s/\(leaq\t-32(%rbp), \)%rax/\1%rdx/g
#s/\(leaq\t-\)32\((%rbp), \)%rax/\140\2%rdx\n\t\132\2%rdx/g
$ cat ./3_4_add.s
# test
        movq    -24(%rbp), %rdi
        #sometimes weird fail,but above works...
        #movq   -16(%rbp),%rdx

        #weird the before lea work,the latter fail
        #leaq    -32(%rbp), %rdx
        #leaq    -40(%rbp), %rdx

        #book answer
        #movsbl (%rdi), %eax
        #movl %eax, (%rdx)
        #self
        #movb (%rdi), %al
        ## movsbl dest should be reg https://www.felixcloutier.com/x86/movsx:movsxd
        #movsbl %al,(%rdx)

        movzbl (%rdi), %eax
        movq %rax, (%rdx)
# end
$ cd /mnt/ubuntu/home/czg/csapp3e/asm;gcc -S -o 3_4.s problem_3_4.c -no-pie;sed -n -f ./sed_3_4.sh -e '/\(movq\t%rax, -16(%rbp)\)/r ./3_4_add.s' -e 'p' 3_4.s > 3_4_char_int.s;file="3_4_char_int";gcc -g $file.s -o $file;pwngdb ./$file -ex 'start' -ex 'target record-full' -ex 'br *0x0000555555555173' -ex '' -ex 'si 2' -ex 'x/b $rdi' -ex 'x/w $rsi' -ex 'wa $rdx' -ex 'c'
...
```
### subquesion 4
```bash
$ cat problem_3_4.c
...
	src_t test_src=-1;
	dest_t test_dest=3;
# 
   0x0000555555555150 <+23>:    c7 45 e4 ff ff ff ff    mov    DWORD PTR [rbp-0x1c],0xffffffff
   0x0000555555555157 <+30>:    c6 45 e3 03             mov    BYTE PTR [rbp-0x1d],0x3
   0x000055555555515b <+34>:    48 8d 45 e4             lea    rax,[rbp-0x1c]
   0x000055555555515f <+38>:    48 89 45 e8             mov    QWORD PTR [rbp-0x18],rax
   0x0000555555555163 <+42>:    48 8d 45 e3             lea    rax,[rbp-0x1d]
   0x0000555555555167 <+46>:    48 89 45 f0             mov    QWORD PTR [rbp-0x10],rax
   0x000055555555516b <+50>:    48 8b 7d e8             mov    rdi,QWORD PTR [rbp-0x18]
  #  here test with src '-1'
   0x000055555555516f <+54>:    8a 07                   mov    al,BYTE PTR [rdi]
   0x0000555555555171 <+56>:    88 06                   mov    BYTE PTR [rsi],al
=> 0x0000555555555173 <+58>:    b8 00 00 00 00          mov    eax,0x0
pwndbg> x/b $rsi
0x7fffffffe0b8: 0xff
pwndbg> x/b $rdi
0x7fffffffdf84: 0xff
```
## use as to check how att syntax assembly generate obj ([also](https://stackoverflow.com/questions/55674190/is-it-possible-to-create-a-shared-object-using-only-as-and-ld) can use `ld` to generate exe, but more troublesome than `gcc` directly)
```bash
$ gcc -S -o 3_4.s problem_3_4.c -no-pie
$ cat 3_4.s
        .file   "problem_3_4.c"
        .text
        .globl  main
        .type   main, @function
main:
.LFB0:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        subq    $32, %rsp
        movq    %fs:40, %rax
        movq    %rax, -8(%rbp)
        xorl    %eax, %eax
        movb    $-1, -29(%rbp)
        movl    $3, -28(%rbp)
        leaq    -29(%rbp), %rax
        movq    %rax, -24(%rbp)
        leaq    -28(%rbp), %rax
        movq    %rax, -16(%rbp)
        movl    $0, %eax
        movq    -8(%rbp), %rdx
        subq    %fs:40, %rdx
        je      .L3
        call    __stack_chk_fail@PLT
.L3:
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE0:
        .size   main, .-main
        .ident  "GCC: (GNU) 12.2.1 20230201"
        .section        .note.GNU-stack,"",@progbits
# use as
$ as 3_4.s -o 3_4.o;objdump -d 3_4.o
```
- directly `gcc` (`gcc 3_4.s -o 3_4.o;./3_4.o`)
## instruction test
### imul
```bash
────────────────────────────────────────────────────────────────────────[ DISASM / x86-64 / set emulate on ]─────────────────────────────────────────────────────────────────────────
  0x55555555516e<main+53>   imul   rcx
 ►0x555555555171<main+56>   mov    eax,0
Watchpoint 2: $rdx

Old value = 0x7fffffffe0c8
New value = 0x2aaaaaaa

Watchpoint 3: $rax

Old value = 0x7fffffffdf84
New value = 0xb417fffffadc0b60

 RCX  0x555555557dd8 —▸ 0x5555555550e0 ◂— endbr64
```
- calculation see [this](./bfloat16_half.py)
- usage `rdx` with param -> csapp p235
### `idiv`
- [why](https://stackoverflow.com/questions/72152783/why-do-x86-mul-and-div-instructions-only-take-a-source-operand) `idiv` instruction no two operand -> not to 'hard-coded'
- `rax` as Quotient -> (po) maybe to just as return value conveniently, just as `imul` save low 64-bit because it is probably to return.
## EFLAGS
- why CF flag is only [the last bit](https://stackoverflow.com/questions/71771188/why-is-the-overflow-flag-only-set-when-single-shifts-are-used) shifted, based on design (more economical)
- [why](https://stackoverflow.com/questions/13435142/why-do-the-inc-and-dec-instructions-not-affect-the-carry-flag-cf) `dec` not influence carry flag, because [redundant (ZF & OF can do the same thing)](https://stackoverflow.com/questions/13435142/why-do-the-inc-and-dec-instructions-not-affect-the-carry-flag-cf#comment86749885_13435722) and economical
### OF flag & CF
- [carry in](https://www.quora.com/What-does-carry-in-and-carry-out-mean-in-electronics#:~:text=The%20%E2%80%9Ccarry%20out%E2%80%9D%20is%20the,add%20into%20the%20next%20column.)
  - what is [overflow](http://c-jump.com/CIS77/CPU/Overflow/lecture.html#O01_0010_overflow), just unable to represent result correctly.
  - ~~TODO , so how to use in this condition~~ useful [example](https://stackoverflow.com/questions/15245762/carries-in-and-out-of-most-significant-bits-in-binary-addition)
    - so
      - [1](http://c-jump.com/CIS77/CPU/Overflow/lecture.html#O01_0080_overfow_output): 0100b+1100b has carry in `1` (because 100+100=1000, carry out from third column to fourth [carry in to fourth]) and result is 10000b -> carry out `1` to fifth column
        - the fouth column is `0+1=1`, so with carry in to fourth, must have carry out to fifth.
        - the rest is similar
      - [this](http://c-jump.com/CIS77/CPU/Overflow/lecture.html#O01_0120_signed_overflow_cont) -> must have carry in and carry out **counterbalanced**
  - because `OF` is to test whether can be represented, it doesn't care about whether negative.
```bash
$ cat seta_setg_custom.s
        movw $0x1,%ax
        pushw %ax
        subw $2,(%rsp) ## set CF no OF

        movw $0x7fff,%ax
        pushw %ax
        subw $0xffff,(%rsp) ## would always seen as -1, not unsigned... 0xfffff obviouly no use to generate overflow; 0x7fff-0xffff=0x7fff+1=0x8000 would set CF and OF
```
## simple explanation of some terms
- dereference: because data is saved in memory or reg, so memory is just reference to data(similar to alias), so `*ptr` is dereferencing.
- oct word -> ['double quadword operand' pdf p602](../references/intel_64.pdf)
- [compiler](https://english.stackexchange.com/questions/212566/etymology-of-compiler-computer-term) just 'compile' things from lib
  - [assembler](https://en.wikipedia.org/wiki/Assembly_language) 'consisting of several sections'
  - compiler may [use](https://www.quora.com/Are-assemblers-compilers) assembler
    - [cc1](https://unix.stackexchange.com/questions/77779/relationship-between-cc1-and-gcc)
    - [collect2](https://en.wikibooks.org/wiki/GNU_C_Compiler_Internals/GNU_C_Compiler_Architecture)
  - [relation](https://erg.abdn.ac.uk/users/gorry/eg2068/course/comp.html)
  - also see `man gcc` -> `/^ +-S` (where ~~compilation is a little different from above ‘compiler’ because it not directly to machine code~~ is [specfic](https://en.wikipedia.org/wiki/Compiler) to ‘assembly language’)
  - linker is [necessary](https://stackoverflow.com/questions/845355/do-programming-language-compilers-first-translate-to-assembly-or-directly-to-mac) to get object code.
```bash
$ gcc -v -o 3_4.o problem_3_4.c -no-pie
 /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/cc1 -quiet -v problem_3_4.c -quiet -dumpdir 3_4.o- -dumpbase problem_3_4.c -dumpbase-ext .c -mtune=generic -march=x86-64 -version -o /tmp/ccLtBlXL.s
...
 as -v --64 -o /tmp/ccGChgzd.o /tmp/ccLtBlXL.s
 /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/collect2 -plugin /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/liblto_plugin.so -plugin-opt=/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/lto-wrapper -plugin-opt=-fresolution=/tmp/cctTz5hJ.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --build-id --eh-frame-hdr --hash-style=gnu -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o 3_4.o /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib/crt1.o /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib/crti.o /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/crtbegin.o -L/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1 -L/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib -L/lib/../lib -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../.. /tmp/ccGChgzd.o -lgcc --push-state --as-needed -lgcc_s --pop-state -lc -lgcc --push-state --as-needed -lgcc_s --pop-state /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/crtend.o /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib/crtn.o
```
## `seta`and`setg`
```bash
$ cat seta_setg_custom.s
...
        #add
        movl $2,%eax
        movq $-1,%rdx 
        sub $-1,%eax
        # 2-(-1) need borrow -> 10..(7 bytes)2-0xf..(8 bytes) = 0x3
        setg %cl
        sub $2,%rdx
        # (-1)-2 no borrow, keep sign bit set
        setb %cl
        #end
...
$ gcc seta_setg_custom.s -o seta_setg_custom.o -g;record_pwngdb seta_setg_custom.o -ex 'start'
```
## `rep ret`
- [pdf p144](../references/amd_opt.pdf) -> branch [prediction](https://en.wikipedia.org/wiki/Branch_predictor#Next_line_prediction) related with cpu design
  - in new cpu, this is [no needed](https://stackoverflow.com/questions/20526361/what-does-rep-ret-mean), (only old `gcc` [generate](https://stackoverflow.com/questions/20526361/what-does-rep-ret-mean#comment52568460_20526918) this instruction, clang [not](https://repzret.org/p/repzret/))
## `&&` [label](https://stackoverflow.com/questions/1777990/is-it-possible-to-store-the-address-of-a-label-in-a-variable-and-use-goto-to-jum) address
## book problem notes
### 3.5
```bash
$ gcc problem_3_5.c -S -o problem_3_5.s -O3

$ cat problem_3_5.s
        .file   "problem_3_5.c"
        .text
        .p2align 4
        .globl  decode1
        .type   decode1, @function
decode1:
.LFB0:
        .cfi_startproc
        movq    (%rdi), %r8
        movq    (%rsi), %rcx
        movq    (%rdx), %rax
        movq    %r8, (%rsi)
        movq    %rcx, (%rdx)
        movq    %rax, (%rdi)
        ret
        .cfi_endproc

```
### `3.34`
- actual behavior
```bash
pwndbg> dr
Dump of assembler code for function main:
   0x00005555555551ea <+92>:    41 51                   push   r9
   0x00005555555551ec <+94>:    41 50                   push   r8
   0x00005555555551ee <+96>:    57                      push   rdi
...
──────────────────────────────────────────────────────────────────────────────────────[ STACK ]──────────────────────────────────────────────────────────────────────────────────────
00:0000│ rbp rsp 0x7fffffffdf38 —▸ 0x7fffffffdfb0 ◂— 0x1
01:0008│         0x7fffffffdf40 —▸ 0x5555555551fc (main+110) ◂— add rsp,0x18
02:0010│         0x7fffffffdf48 ◂— 0x6
03:0018│         0x7fffffffdf50 ◂— 0x7
04:0020│         0x7fffffffdf58 ◂— 0x8
pwndbg> dr
Dump of assembler code for function test_mul_args:
   0x0000555555555149 <+0>:     55                      push   rbp
   0x000055555555514a <+1>:     48 89 e5                mov    rbp,rsp # caused above rbp relocation
...
   0x000055555555517d <+52>:    8b 45 10                mov    eax,DWORD PTR [rbp+0x10]
   0x0000555555555180 <+55>:    01 c2                   add    edx,eax
   0x0000555555555182 <+57>:    8b 45 18                mov    eax,DWORD PTR [rbp+0x18]
   0x0000555555555185 <+60>:    01 c2                   add    edx,eax
   0x0000555555555187 <+62>:    8b 45 20                mov    eax,DWORD PTR [rbp+0x20]
   0x000055555555518a <+65>:    01 d0                   add    eax,edx
# clearly in 
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ file=3_34;gcc $file.c -o $file.s -S -fverbose-asm                        
[czg /mnt/ubuntu/home/czg/csapp3e/asm]$ cat 3_34.s 
        movl    -16(%rbp), %r9d # test[8], _1
        movl    -20(%rbp), %r8d # test[7], _2
        movl    -24(%rbp), %edi # test[6], _3
        movl    -28(%rbp), %r11d        # test[5], _4
        movl    -32(%rbp), %r10d        # test[4], _5
        movl    -36(%rbp), %ecx # test[3], _6
        movl    -40(%rbp), %edx # test[2], _7
        movl    -44(%rbp), %esi # test[1], _8
        movl    -48(%rbp), %eax # test[0], _9
        pushq   %r9     # _1
        pushq   %r8     # _2
        pushq   %rdi    # _3
        movl    %r11d, %r9d     # _4,
        movl    %r10d, %r8d     # _5,
        movl    %eax, %edi      # _9,
...
```
- first push last argument
### `3.45`
```bash
        movq    %rax, -64(%rbp) # tmp84, test.a
        movss   .LC0(%rip), %xmm0       #, tmp85
        movss   %xmm0, -56(%rbp)        # tmp85, test.b
        movb    $1, -52(%rbp)   #, test.c
        movw    $1, -50(%rbp)   #, test.d
        movq    $1, -48(%rbp)   #, test.e
        movsd   .LC1(%rip), %xmm0       #, tmp86
        movsd   %xmm0, -40(%rbp)        # tmp86, test.f
        movl    $1, -32(%rbp)   #, test.g
        leaq    -69(%rbp), %rax #, tmp87
        movq    %rax, -24(%rbp) # tmp87, test.h
# require 64-24+8=48 bytes
```
### 3.46
- [strlen](https://codebrowser.dev/glibc/glibc/string/strlen.c.html)
```cpp
    if (*char_ptr == '\0')
      return char_ptr - str; // not count '\0' in 
```
### 3.49
- see fig  2.29&30
### 3.51 
- TODO: why gcc not use [CVTSS2SD](https://stackoverflow.com/questions/16597587/why-dont-gcc-and-clang-use-cvtss2sd-memory)
### 3.69
- movslq not `MOVSD` in [pdf p44](../references/att_x86.pdf) but `movsxd`
```bash
$ rasm2 -d '4863c9'
movsxd rcx, ecx
```
### 4.49
- mainly based on the following:
if `a!=b` -> `(a^b)^a=b;(a^b)^b=a`
### 5.9
- maybe because of loop overhead, the A3 two multiplication in the path which isn't critical is not considered block the execution.
### Figure 5.37
- ~~TODO why example A not left chain critical?~~
  example A: two address reading can be parallel and register reading can use aliasing, so left can be seen as one operation. -> critical is left / right, but right is more intuitive.
  compared with former multiplication critical path, the multiplication is more complex than read and addition here, so it is seen as critical path.
### Figure 7.11
- see [this](#reloc)
> notice in newer GCC, `R_X86_64_PLT32` is [just](https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=bd7ab16b4537788ad53521c45469a1bdae84ad4a;hp=80c96350467f23a54546580b3e2b67a65ec65b66) `R_X86_64_PC32`
```bash
$ gcc -c main.o main.c sum.c
$ objdump -dr main.o
...
   d:   48 8d 05 00 00 00 00    lea    rax,[rip+0x0]        # 14 <main+0x14>
                        10: R_X86_64_PC32       array-0x4
  14:   48 89 c7                mov    rdi,rax
  17:   e8 00 00 00 00          call   1c <main+0x1c>
                        18: R_X86_64_PLT32      sum-0x4
...
$ readelf -a main.o | grep rel -A 20
...
Relocation section '.rela.text' at offset 0x1a0 contains 2 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000010  000300000002 R_X86_64_PC32     0000000000000000 array - 4
000000000018  000500000004 R_X86_64_PLT32    0000000000000000 sum - 4

Relocation section '.rela.eh_frame' at offset 0x1d0 contains 1 entry:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000020  000200000002 R_X86_64_PC32     0000000000000000 .text + 0
...
$ readelf -a main.o | grep symtab\' -A 20
Symbol table '.symtab' contains 6 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS main.c
     2: 0000000000000000     0 SECTION LOCAL  DEFAULT    1 .text
     3: 0000000000000000     8 OBJECT  GLOBAL DEFAULT    3 array
     4: 0000000000000000    36 FUNC    GLOBAL DEFAULT    1 main
     5: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND sum
# here 3 point to above '000300000002' higher 32bit '0x3', others similar
...
$ file main.o
main.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped # relocatable object file
```
after linker, calculate relocation
> see [more](https://stackoverflow.com/questions/64424692/how-does-the-address-of-r-x86-64-plt32-computed)
```bash
$ gcc -o main_link.o main.c sum.c
$ readelf -a main_link.o | grep sum -A 20 -B 5
    16: 000000000000113d    68 FUNC    GLOBAL DEFAULT   12 sum # so S=0x113d
$ objdump -dx main_link.o
...
Disassembly of section .text:

0000000000001020 <_start>:
    1020:       f3 0f 1e fa             endbr64
...
0000000000001119 <main>:
    1119:       55                      push   rbp
    111a:       48 89 e5                mov    rbp,rsp
    111d:       48 83 ec 10             sub    rsp,0x10
    1121:       be 02 00 00 00          mov    esi,0x2
    1126:       48 8d 05 e3 2e 00 00    lea    rax,[rip+0x2ee3]        # 4010 <array>
    112d:       48 89 c7                mov    rdi,rax
    1130:       e8 08 00 00 00          call   113d <sum> # P=0x1131
$ readelf -a main_link.o | grep -i header -A 40
Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
...
  [12] .text             PROGBITS         0000000000001020  00001020
$ r2 -
[0x00000000]> ? 0x113d-0x1131-0x4
hex     0x8
# so reloc is 0x8 ->   e8 08 00 00 00 (0x0...08)
[0x00000000]> ? 0x1131-0x18
hex     0x1119 # so ADDR(s)=ADDR(main) not referenced 'ADDR(.text)'
```
similarly to `array`
```bash
$ readelf -a main_link.o | grep -i array -A 40 -B 20
    10: 0000000000004010     8 OBJECT  GLOBAL DEFAULT   22 array
$ objdump -dx main_link.o
    1126:       48 8d 05 e3 2e 00 00    lea    rax,[rip+0x2ee3]        # 4010 <array>
$ r2 -
[0x00000000]> ? 0x4010-(0x1119+0x10)-0x4
...
hex     0x2ee3
...
```
#### Figure 7.14
- rel diff
```bash
$ readelf -e main_link.o | grep rel
  [10] .rela.dyn         RELA             0000000000000538  00000538
   02     .interp .note.gnu.property .note.gnu.build-id .note.ABI-tag .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rela.dyn 
$ readelf -e main.o | grep rel     
  [ 2] .rela.text        RELA             0000000000000000  000001a0
  [ 9] .rela.eh_frame    RELA             0000000000000000  000001d0
```
### Figure 7.19 with `-rdynamic`
```bash
$ gcc -rdynamic -no-pie -o prog2r dll.c
$ record_pwngdb prog2r -ex 'start' -ex 'telescope 403fc8 0x1f'
00:0000│  0x403fc8 —▸ 0x7ffff7d9b7c0 (__libc_start_main) ◂— endbr64 
01:0008│  0x403fd0 ◂— 0x0
... ↓     2 skipped
04:0020│  0x403fe8 (_GLOBAL_OFFSET_TABLE_) —▸ 0x403df8 (_DYNAMIC) ◂— 0x1
05:0028│  0x403ff0 (_GLOBAL_OFFSET_TABLE_+8) —▸ 0x7ffff7ffe2c0 ◂— 0x0
06:0030│  0x403ff8 (_GLOBAL_OFFSET_TABLE_+16) —▸ 0x7ffff7fdcb50 ◂— endbr64

$ r2 -c 'dcu main;dm~ld;pxr 0x18 @0x00403fe8;iS~dyna' -d prog2r
0x00007ff47d4da000 - 0x00007ff47d4db000 - usr     4K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2
0x00007ff47d4db000 - 0x00007ff47d501000 - usr   152K s r-x /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r_x
0x00007ff47d501000 - 0x00007ff47d50b000 - usr    40K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r__
0x00007ff47d50b000 - 0x00007ff47d50d000 - usr     8K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.rw_
0x00007ff47d50d000 - 0x00007ff47d50f000 - usr     8K s rw- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2
0x00403fe8 0x0000000000403df8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210168 /mnt/ubuntu/home/czg/csapp3e/link/prog2r .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R 0x1
0x00403ff0 0x00007ff47d50e2c0   ..P}.... /usr/lib/ld-linux-x86-64.so.2 library R W 0x0
0x00403ff8 0x00007ff47d4ecb50   P.N}.... /usr/lib/ld-linux-x86-64.so.2 library R X 'endbr64' 'ld-linux-x86-64.so.2'
21  0x00002df8  0x1d0 0x00403df8  0x1d0 -rw- DYNAMIC     .dynamic
```
TODO seems no addvec plt in `.plt`
```bash
$ gcc -rdynamic -o prog2r dll.c
$ r2 -c 'dcu main;dm~ld;pxr 0x18 @0x00403fe8;iS~dyna' -d prog2r
[0x00401186]> iS~plt
11  0x00000820   0xa8 0x00400820   0xa8 -r-- RELA        .rela.plt
13  0x00001020   0x80 0x00401020   0x80 -r-x PROGBITS    .plt
23  0x00002fe8   0x50 0x00403fe8   0x50 -rw- PROGBITS    .got.plt
[0x00401186]> pd 0x20@0x00401020
            ;-- section..plt:
  ╭╭╭╭╭╭╭─> 0x00401020      ff35ca2f0000   push qword [0x00403ff0]     ; push word, doubleword or quadword onto the stack; [13] -r-x section size 128 named .plt
  ╎╎╎╎╎╎╎   0x00401026      ff25cc2f0000   jmp qword [0x00403ff8]      ; [0x403ff8:8]=0x7fc7c4b5fb50 ; jump
  ╎╎╎╎╎╎╎   0x0040102c      0f1f4000       nop dword [rax]             ; no operation
  ╎╎╎╎╎╎╎   ;-- dlerror: # here plt 1 not __libc_start_main
  ╎╎╎╎╎╎╎   0x00401030      ff25ca2f0000   jmp qword [reloc.dlerror]   ; [0x404000:8]=0x401036 ; "6\x10@" ; jump
  ╎╎╎╎╎╎╎   0x00401036      6800000000     push 0                      ; push word, doubleword or quadword onto the stack
  ╰───────< 0x0040103b      e9e0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
   ╎╎╎╎╎╎   ;-- printf:
   ╎╎╎╎╎╎   0x00401040      ff25c22f0000   jmp qword [reloc.printf]    ; [0x404008:8]=0x401046 ; "F\x10@" ; jump
   ╎╎╎╎╎╎   0x00401046      6801000000     push 1                      ; rbp ; push word, doubleword or quadword onto the stack
   ╰──────< 0x0040104b      e9d0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
    ╎╎╎╎╎   ;-- dlopen:
    ╎╎╎╎╎   0x00401050      ff25ba2f0000   jmp qword [reloc.dlopen]    ; [0x404010:8]=0x401056 ; "V\x10@" ; jump
    ╎╎╎╎╎   0x00401056      6802000000     push 2                      ; 2 ; push word, doubleword or quadword onto the stack
    ╰─────< 0x0040105b      e9c0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
     ╎╎╎╎   ;-- fprintf:
     ╎╎╎╎   0x00401060      ff25b22f0000   jmp qword [reloc.fprintf]   ; [0x404018:8]=0x401066 ; "f\x10@" ; jump
     ╎╎╎╎   0x00401066      6803000000     push 3                      ; 3 ; push word, doubleword or quadword onto the stack
     ╰────< 0x0040106b      e9b0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
      ╎╎╎   ;-- dlsym:
      ╎╎╎   0x00401070      ff25aa2f0000   jmp qword [reloc.dlsym]     ; [0x404020:8]=0x401076 ; "v\x10@" ; jump
      ╎╎╎   0x00401076      6804000000     push 4                      ; 4 ; push word, doubleword or quadword onto the stack
      ╰───< 0x0040107b      e9a0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
       ╎╎   ;-- exit:
       ╎╎   0x00401080      ff25a22f0000   jmp qword [reloc.exit]      ; [0x404028:8]=0x401086 ; jump
       ╎╎   0x00401086      6805000000     push 5                      ; 5 ; push word, doubleword or quadword onto the stack
       ╰──< 0x0040108b      e990ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
        ╎   ;-- dlclose:
        ╎   0x00401090      ff259a2f0000   jmp qword [reloc.dlclose]   ; [0x404030:8]=0x401096 ; jump
        ╎   0x00401096      6806000000     push 6                      ; 6 ; push word, doubleword or quadword onto the stack
        ╰─< 0x0040109b      e980ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7fffe1560d38, 0x7fffe1560d48, 0x403df0)
[0x7fd4dbbf7ed0]> pd 2@0x0
            ;-- section.:
            ;-- section..comment:
            ;-- section..symtab:
            ;-- section..strtab:
            ;-- section..shstrtab:
            ;-- segment.GNU_STACK:
            ;-- elf_header:
            ;-- __libc_start_main:
[0x00401186]> is~start_main
2   ---------- 0x00000000 GLOBAL FUNC   16       imp.__libc_start_main
pwndbg> p __libc_start_main
$1 = {<text variable, no debug info>} 0x7ffff7d9b7c0 <__libc_start_main>
```
here obviously no `addvec` in `plt`, because it is loaded by `dlsym`
### Figure 7.19 without `-rdynamic`
still no `__libc_start_main`
```bash
$ r2 -c 'dcu main;dm~ld;pxr 0x58 @0x00403fe8;iS~dyna;iS~plt;db sym.imp.addvec;pd 0xf@0x00401020' -d prog2l
0x00007f857547f000 - 0x00007f8575480000 - usr     4K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2
0x00007f8575480000 - 0x00007f85754a6000 - usr   152K s r-x /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r_x
0x00007f85754a6000 - 0x00007f85754b0000 - usr    40K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.r__
0x00007f85754b0000 - 0x00007f85754b2000 - usr     8K s r-- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 ; map._usr_lib_ld_linux_x86_64.so.2.rw_
0x00007f85754b2000 - 0x00007f85754b4000 - usr     8K s rw- /usr/lib/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2
0x00403fe8 0x0000000000403de8   .=@..... @ obj._GLOBAL_OFFSET_TABLE_ 4210152 /mnt/ubuntu/home/czg/csapp3e/link/prog2l .dynamic section..dynamic,segment.DYNAMIC,_DYNAMIC program R 0x1
0x00403ff0 0x00007f85754b32c0   .2Ku.... /usr/lib/ld-linux-x86-64.so.2 library R W 0x0
0x00403ff8 0x00007f8575491b50   P.Iu.... /usr/lib/ld-linux-x86-64.so.2 library R X 'endbr64' 'ld-linux-x86-64.so.2'
0x00404000 0x0000000000401036   6.@..... @ reloc.printf 4198454 /mnt/ubuntu/home/czg/csapp3e/link/prog2l .plt program R X 'push 0' 'prog2l'
0x00404008 0x0000000000401046   F.@..... @ reloc.addvec 4198470 /mnt/ubuntu/home/czg/csapp3e/link/prog2l .plt program R X 'push 1' 'prog2l'
...
21  0x00002de8  0x1e0 0x00403de8  0x1e0 -rw- DYNAMIC     .dynamic
11  0x000005c0   0x30 0x004005c0   0x30 -r-- RELA        .rela.plt
13  0x00001020   0x30 0x00401020   0x30 -r-x PROGBITS    .plt
23  0x00002fe8   0x28 0x00403fe8   0x28 -rw- PROGBITS    .got.plt
            ;-- section..plt:
       ╭╭─> 0x00401020      ff35ca2f0000   push qword [0x00403ff0]     ; push word, doubleword or quadword onto the stack; [13] -r-x section size 48 named .plt
       ╎╎   0x00401026      ff25cc2f0000   jmp qword [0x00403ff8]      ; [0x403ff8:8]=0x7f8575491b50 ; jump
       ╎╎   0x0040102c      0f1f4000       nop dword [rax]             ; no operation
       ╎╎   ;-- printf:
       ╎╎   0x00401030      ff25ca2f0000   jmp qword [reloc.printf]    ; [0x404000:8]=0x401036 ; "6\x10@" ; jump
       ╎╎   0x00401036      6800000000     push 0                      ; push word, doubleword or quadword onto the stack
       ╰──< 0x0040103b      e9e0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7ffee98af2f8, 0x7ffee98af308, 0x403de0)
        ╎   ;-- addvec:
        ╎   0x00401040 b    ff25c22f0000   jmp qword [reloc.addvec]    ; [0x404008:8]=0x401046 ; "F\x10@" ; jump
        ╎   0x00401046      6801000000     push 1                      ; 1 ; push word, doubleword or quadword onto the stack
        ╰─< 0x0040104b      e9d0ffffff     jmp section..plt            ; jump ; section..plt(0x1, 0x7ffee98af2f8, 0x7ffee98af308, 0x403de0)
...
```
### `7.13.3`
- original `mymalloc.c` :LD_PRELOAD with `printf` will stuck in infinite loop (seen by `sudo coredumpctl gdb` where `bt` is too too long ) and caused segmentation fault
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/link/interpose]$ gcc -DRUNTIME -shared -fpic -ldl -o mymalloc.so mymalloc.c
$ cat mymalloc.c | grep RUN -A 20
...
    fprintf(stderr, "fprintf malloc(%d) = %p\n", size, ptr);
    printf("printf malloc(%d) = %p\n", (int)size, ptr);
$ LD_PRELOAD=./mymalloc.so ./intr
...
fprintf malloc(4096) = 0x564743d29440
fprintf malloc(4096) = 0x564743d2a450
fprintf malloc(4096) = 0x564743d2b460
zsh: segmentation fault (core dumped)  LD_PRELOAD=./mymalloc.so ./intr
# small modify 
$ cat mymalloc.c | grep RUN -A 25
...
    if(size==4096 || size==1024)
        return ptr;
    // printf("malloc(%d) = %p\n", (int)size, ptr);
    fprintf(stderr, "fprintf malloc(%d) = %p\n", size, ptr);
    printf("printf malloc(%d) = %p\n", size, ptr);
$ gcc -g -o intr int.c
$ gcc -DRUNTIME -shared -fpic -ldl -o mymalloc.so mymalloc.c -g
# https://stackoverflow.com/questions/10448254/how-to-use-gdb-with-ld-preload
$ record_pwngdb ./intr -ex 'set environment LD_PRELOAD ./mymalloc.so' -ex 'start' -ex 'br mymalloc.c:37' -ex 'c' -ex 'bt'
Breakpoint 2, malloc (size=0x400) at mymalloc.c:37
37              return ptr;
#0  malloc (size=0x400) at mymalloc.c:37
#1  0x00007ffff7e28471 in _IO_file_doallocate () from /usr/lib/libc.so.6
#2  0x00007ffff7e37570 in _IO_doallocbuf () from /usr/lib/libc.so.6
#3  0x00007ffff7e365d8 in _IO_file_overflow () from /usr/lib/libc.so.6
#4  0x00007ffff7e356ee in _IO_file_xsputn () from /usr/lib/libc.so.6
#5  0x00007ffff7e08709 in ?? () from /usr/lib/libc.so.6
#6  0x00007ffff7e087c4 in ?? () from /usr/lib/libc.so.6
#7  0x00007ffff7e122aa in ?? () from /usr/lib/libc.so.6
#8  0x00007ffff7e07eaf in printf () from /usr/lib/libc.so.6
#9  0x00007ffff7fbe1bf in malloc (size=0x20) at mymalloc.c:40
#10 0x000055555555515b in main () at int.c:14
#11 0x00007ffff7ddb790 in ?? () from /usr/lib/libc.so.6
#12 0x00007ffff7ddb84a in __libc_start_main () from /usr/lib/libc.so.6
#13 0x0000555555555075 in _start ()

# here printf caused infinite loop of 'malloc -> printf -> malloc'

# deal with https://www.jayconrod.com/posts/23/tutorial--function-interposition-in-linux
$ LD_PRELOAD=./libjmalloc.so ./intr                                                                         
malloc(32) = 0x55d10a69f2a0
```
above main diff is one to [stderr](https://codebrowser.dev/glibc/glibc/stdio-common/fprintf.c.html) while the other to [stdout](https://codebrowser.dev/glibc/glibc/stdio-common/printf.c.html) (both use `__vfprintf_internal`).
### `Figure 8.41`
- race condition is that if child exit too fast, then `SIGCHLD` will be triggered too fast, then `pid` will always be zero and stuck in while loop.
  - if `block`, then according to `man 7 signal`, `SIGCHLD` will be pending ('Between the time when it is generated and when it is delivered a signal'), so must be processed and `pid` will change.
#### 8.5.7 Explicitly Waiting for Signals
- here `pause()` has no period, so maybe stuck in loop,
  while `sleep(1)` not,
  but the period of `sleep()` is difficult to decide.

  here race condition is partly due to `while(1)` so that order may not as expected.
### `Figure 9.12`
- PTEA is calculated with PTER and VPN.
### p868
- victim page exists because virtual memory address is larger than physical memory address.
### 9.11.6
- Suffix decrement `--` is more [precedent](https://en.cppreference.com/w/c/language/operator_precedence) than dereference `*` 
### problem 9.18
- here `prev_alloc` is just function as `footer` although no size info.
### problem 9.19
- 1.a csapp p901 rounded up
### Figure 10.11
- here `readdir` will change both `streamp` and `dep` based on [source code](https://codebrowser.dev/glibc/glibc/sysdeps/unix/sysv/linux/readdir.c.html), based on `typedef struct __dirstream DIR`, see [__dirstream](https://github.com/lattera/glibc/blob/master/sysdeps/posix/dirstream.h) for definition of `dirp->offset`
```bash
struct dirent *
__readdir_unlocked (DIR *dirp)
...
      dp = (struct dirent *) &dirp->data[dirp->offset];
      reclen = dp->d_reclen;
      dirp->offset += reclen;
struct dirent *
__readdir (DIR *dirp)
...
#endif
  dp = __readdir_unlocked (dirp);
#if ...
```
### C(hapter) 10.10
- standard IO is in `man 2 ...` although it says `Standard C library (libc, -lc)` which seems to conflict with 'The library (libc) provides' in csapp p947 
### p948
- [see](https://stackoverflow.com/questions/24903442/i-o-between-input-and-output-in-c-programme) [or](https://stackoverflow.com/questions/54067462/why-input-functions-cannot-follow-output-functions-or-vice-versa-in-c), if output follows input with the same file, should 'save the data from the buffer into the file'
  - if input follows output with the same file, should change file pos because ‘in the last position of the file’
### problem 11.4
- why can use `(struct sockaddr_in *)` cast: see [`gni_host_inet_numeric`](https://codebrowser.dev/glibc/glibc/inet/getnameinfo.c.html#gni_host_inet_numeric) called by callee ... of [gni_host](https://codebrowser.dev/glibc/glibc/inet/getnameinfo.c.html)
### open_listenfd
- from `man setsockopt`, 'optlen is a value-result argument, initially containing the size of the buffer pointed to by optval, and modified', so here `optlen` set as `sizeof(int)` initially, although unmodifiable.
### echoserveri.c
- `Accept(listenfd, (SA *)&clientaddr, &clientlen);`: from `man 2 Accept`, `&clientaddr` is 'The exact format of the address returned addr' to save connected socket addr.
### problem 12.3
- global: wrong -> no 'may stop' because keyboard can't be caught at all.
  and socket doesn't recognize ^D (can be seen by defining `DEBUG_ASCII` in `csapp.c`)
- original book version: right because 'it is blocked in the call'
### Figure 12.26
- here if one reader call `reader` func , then it must update `w` and it will block when use `w` next time，i.e. one writer call `writer`.
  but one writer will never update `mutex`, so it will never influence reader.
### p932
- why use rio
  - TODO complex [`read`](https://codebrowser.dev/glibc/glibc/sysdeps/unix/sysv/linux/read.c.html) may not append EOF if reading something (also implied by `man 2 read`: 'the  number of bytes read is returned (zero indicates end of file)' and 'because fewer bytes are actually available right now (maybe because we were close to end-of-file, or because we are reading from a pipe, or from a terminal' -> so splitted to two return.)
  so use multiple `read` in `rio_readn` with `nleft`.
### p1049
- most `while(1)` is related with state machine.
### Figure 12.14
- p1030: although thread has its own stack area but all thread stacks are resided in ‘stack area of the virtual address space’, so can be **shared** by pointer.
```cpp
/*
here `connfd` is located in main thread stack and `&connfd` is same for all peer threads, so results in race condition.
*/
connfd = Accept(listenfd, (SA *) &clientaddr, &clientlen);
Pthread_create(&tid, NULL, thread, &connfd);
```
### Figure 12.36
- $T_1$: 
  sequential version -> 1 core 1 thread
  'running on one core' -> maybe 1 core multiple threads
### C 12.7.1
- although at first glance, case 1 seems to be same as case 2 because they both change one global variable.
  but it is not if thinking more deeply.
  case 1:
  1. variable must be shared to calculate count of all threads.
  2. thread order don't influence result and main thread use the last result after all threads terminate.
  case 2:
  1. not, and its aim is just to offer one temporary rand number, so not a must to share one global variable.  
  2. thread order influence result, because it uses every thread result.
  because **thread order** is decided by kernel and may **change** every time the program runs, so (p1059) must change the code to be **reentrant** and not influence by other threads at all with regard to **global** variable.
  case 3 vs case 2:
  1. (p1060) the former returns static variable (see `man 3 gethostbyaddr`), the [latter](https://stackoverflow.com/questions/6161322/using-stdlibs-rand-from-multiple-threads) use static state (variable) inside function.
### p1059
- 'arguments are passed by value'
  because local variable all stays at current caller thread stack, and parameter is passed by predefined (conventionally by cpu manufacturer) register set after transferring stack data to registers, so nothing at current caller thread stack is modified except that manually use assign return value to caller local variable.
### Figure 12.44
- the weird graph: 
  in the bottom-left corner, where one runs `P(s)` and `P(t)` both based on `s,t=1 (initally)`,
  then it can't run `P(s)` or `P(t)`, so can't forward anymore.
### Figure 12.45
- more precisely see [this pdf](../conc/12_45.pdf) by [this tex](../conc/12_45.tex) (based on csapp Figure 12.22)
  here works mainly because of they all blocks 'region k'(see above pdf figure one) where maybe `P(s)/P(t)` runs twice without running `V()` once.
  - [problem_12-15](../conc/problem_12-15.pdf) with [tex](../conc/problem_12_15.tex)
### 12.22
- need `\n` as EOF and return 0 if encounter it even if at the end of line.
  (instead of using `rio_read` to simulate real network where we keep reading after `\n`, fetch multiple lines and block at `Rio_readlineb` in one `connfd`.)
  so that we can receive multiple client requests.
- this one can't run in browser because server send wrong responce not consistent with the protocal (just echo but not process the messages, detailed see `/mnt/ubuntu/home/czg/CSAPP-3e-Solutions/site/content/chapter12/code/12.22_origin_change.c`).
### [12.27](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.27/)
- here says two condition
  first: the second `fclose` would close one closed fd (paragrph 1).
  second: one thread may close one fd another thread was to use.
### 12.28 see [12_45.pdf](../conc/homework/12_45.pdf)
### 12.29 
- whenever there are 4 (3+1) net `P()` (one `P()` can eliminate one `V()`), there is one `V()`, then no deadlock. (TODO rigorous math proof)
- (TODO rigorous math proof) why must no deadlock when no overlap? (maybe [this](https://scholarsmine.mst.edu/cgi/viewcontent.cgi?article=2901&context=doctoral_dissertations))
### 12.32
- this [comment](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.32/#comment-6161315337) not applies to 12.31 because 12.31 use signal instead of fd(stdin) check.
### 12.33
- one example to use race condition instead of avoiding.
- has tested that it is [safe](https://stackoverflow.com/questions/7235392/is-it-safe-to-call-pthread-cancel-on-terminated-thread) to use `pthread_cancel` on terminated thread?
### 12.34
- see page table (‘Figure 9.26’,9.8.2),file table('Figure 10.14') and 'Figure 12.5' 
  according to [this](https://unix.stackexchange.com/questions/21325/is-the-file-table-in-the-filesystem-or-in-memory), file table should be manipulated by kernel in the kernel memory.
### 12.37 
- this one is even worse than child process version (12.35).
### 12.38
> notice `make` flag of comparison programs should be same. 
- how to accelerate step by step
`tiny_wrong.c` ->(use mutex by `thread_with_mutex`) `tiny_log.c` -> (comment `printf` syscall,etc ) `tiny.c` -> (check buf in `check_thread`, notice here better to read `sbuf.rear` with mutex to ensure consistency ) `tiny_check_in_thread.c` -> (use `sbuf_full` which is unnecessary although more readable) `tiny_cit_sbuf_full.c` -> (forget what scope means, maybe change `thread_with_mutex *tid_set` to global) `tiny_citsf_scope.c`
(main reason is to use more threads by decreasing `SBUFSIZE` to make that buf frame full happen more)
> here, because server not terminate automatically, so `gprof` may not generate output when program terminates by sending the program `SIGKILL`
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_36]$ ./tiny_citsf_scope 5000 1

$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   235.53us  823.05us  12.40ms   96.15%
    Req/Sec    25.24k     9.45k   33.48k    87.50%
  200857 requests in 4.01s, 43.87MB read
Requests/sec:  50070.09
Transfer/sec:     10.93MB
# range from 9-11MB

[czg /mnt/ubuntu/home/czg/CSAPP-3e-Solutions/site/content/chapter12/code]$ ./12.38/main

$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   412.96us    1.19ms  18.19ms   94.58%
    Req/Sec    17.88k     9.08k   25.72k    78.75%
  142375 requests in 4.01s, 31.09MB read
Requests/sec:  35461.51
Transfer/sec:      7.74MB
```
#### not use `else if` where speed will decrease just as csapp book says by half.
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_38]$ export file=tiny_check_in_thread_correct;./$file 5000 1 > ./$file.txt

$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   783.71us    1.68ms  22.14ms   90.76%
    Req/Sec    11.06k     8.29k   21.93k    48.75%
  87988 requests in 4.03s, 19.22MB read
Requests/sec:  21842.40
Transfer/sec:      4.77MB

$ export file=tiny_check_in_thread_correct_without_else_if;./$file 5000 1 > ./$file.txt 
$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   352.43us    1.13ms  13.44ms   94.35%
    Req/Sec    21.75k    11.08k   31.95k    75.00%
  173191 requests in 4.03s, 37.82MB read
Requests/sec:  43021.12
Transfer/sec:      9.40MB
# rerun tiny_check_in_thread_correct_without_else_if
$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   263.38us    0.90ms  10.21ms   95.56%
    Req/Sec    24.71k    10.58k   34.79k    82.50%
  196770 requests in 4.02s, 42.97MB read
Requests/sec:  49001.32
Transfer/sec:     10.70MB
# $ git rev-parse czg/master                                               
# 57a7b40bccf3c10049de2982417a03508fd670b3
$ git rev-parse czg/master                         
6bee37d933eeb23610d97c444d965614978309a9
```
##### not add ~~too much calculation~~ `if` conditional block in loop (see `tiny_citcwei_conditional_move.c`)
- here whether use conditional move is fine all.
```bash
$ ./12.38/main
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_38]$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   542.57us    1.37ms  14.01ms   92.05%
    Req/Sec    16.29k    11.41k   30.28k    58.75%
  129661 requests in 4.05s, 28.32MB read
Requests/sec:  31985.19
Transfer/sec:      6.99MB
# without USE_UPDATE_IF in `tiny_citcwei_conditional_move.c`
$ export file=tiny_citcwei_conditional_move;./$file 5000 1
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_38]$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   525.08us    1.34ms  12.70ms   92.33%
    Req/Sec    16.27k    10.56k   28.29k    67.50%
  129452 requests in 4.04s, 28.27MB read
Requests/sec:  32048.37
Transfer/sec:      7.00MB
# with USE_UPDATE_IF
$ wrk -d4 -c10 http://localhost:5000
Running 4s test @ http://localhost:5000
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   611.77us    1.11ms  11.69ms   92.55%
    Req/Sec    10.62k     6.04k   18.00k    66.25%
  84663 requests in 4.03s, 18.49MB read
Requests/sec:  21025.37
Transfer/sec:      4.59MB

```
#### notice not have logical problem
see below comments.
```bash
$ diff ./tiny_check_in_thread.c ./tiny_check_in_thread_correct.c                 
--- ./tiny_check_in_thread.c    2023-05-20 20:22:59.184822139 +0800
+++ ./tiny_check_in_thread_correct.c    2023-05-20 20:41:02.772719257 +0800
@@ -26,36 +26,36 @@
   pthread_t tid;
   sem_t mutex;
 };
# here can also not global, just pass pointer is enough.
+static struct thread_with_mutex *tid_set;
 
 void *thread(void *vargp) {
   // Pthread_detach(pthread_self());
-  sem_t mutex = *((sem_t *)vargp);

# must pass pointer because `P(&mutex);` use pointer which needs to be reentrant.

+  sem_t *mutex = ((sem_t *)vargp);
   int connfd;
   while (1) {
-    P(&mutex);
+    P(mutex);
     connfd = sbuf_remove(&sbuf); /* Remove connfd from buffer */
     // printf("to read %d\n", connfd);
     doit(connfd);  // line:netp:tiny:doit
     // printf("to close %d\n", connfd);
     Close(connfd);  // line:netp:tiny:close
     // printf("has closed %d", connfd);
-    V(&mutex);
+    V(mutex);
   }
 }
 
 void *check_thread(void *argp) {
   int buf_cnt, i;
-  struct thread_with_mutex *tid_set_arg = (struct thread_with_mutex *)argp;
   while (1) {
     buf_cnt = sbuf.rear - sbuf.front;
     if (buf_cnt == sbuf.n) {
      # not occur the following logical error, otherwise the thread list may be weird with gap. and if malloc size not big enough,then throw 'segmentation fault' when access unvalid memory.
-      threads *= 2;
       if (threads > MAX_THREAD) {
         fprintf(stderr, "unable to scale");
         exit(1);
       }
       for (i = threads; i < threads * 2; i++) /* Create worker threads */
-        Pthread_create(&tid_set_arg[i].tid, NULL, thread, NULL);
+        Pthread_create(&tid_set[i].tid, NULL, thread, &tid_set[i].mutex);
+      threads *= 2;
     } else if (buf_cnt == 0) {
       // fprintf(stdout, "buffer empty");
       if (threads < 2) {
@@ -70,10 +70,11 @@
         /*
         need cancel thread because thread itself not exit automatically.
         */
-        P(&tid_set_arg[i].mutex);
-        Pthread_cancel(tid_set_arg[i].tid);
-        V(&tid_set_arg[i].mutex);
+        P(&tid_set[i].mutex);
+        Pthread_cancel(tid_set[i].tid);
+        V(&tid_set[i].mutex);
       }
      #  needs to update，otherwise may cancel duplicate threads. 
+      threads /= 2;
     }
   }
 }
@@ -83,8 +84,7 @@
   socklen_t clientlen;
   struct sockaddr_storage clientaddr;
   int i;
-  struct thread_with_mutex *tid_set =
-      Malloc(sizeof(struct thread_with_mutex) * MAX_THREAD);
+  tid_set = Malloc(sizeof(struct thread_with_mutex) * MAX_THREAD);
   pthread_t tid;
 
   /* Check command line args */
@@ -98,7 +98,7 @@
     exit(1);
   }
   sbuf_init(&sbuf, SBUFSIZE);
-  Pthread_create(&tid, NULL, check_thread, (void *)tid_set);
+  Pthread_create(&tid, NULL, check_thread, NULL);
 
   for (i = 0; i < MAX_THREAD; i++) Sem_init(&tid_set[i].mutex, 0, 1);
   for (i = 0; i < threads; i++) /* Create worker threads */
```
### 12.39
`GET /godzilla.gif HTTP/1.1`

- `tiny_proxy_wrong.c` -> (after see reference) `tiny_proxy.c` -> (default 8000) `tiny_proxy_no_server_param.c` -> (forget) `tiny_before_proxy_map.c` (this file may be the most original) -> (fail after try `READ_FILE_MAP` and `READ_FILE_BLOCK`,etc) `tiny_proxy_map.c` (see comments below) -> (see below: `tiny_proxy_map_heap_to_stack_wrong.c` -> `tiny_proxy_map_heap_to_stack.c` -> `tiny_proxy_mhts_free_wrong.c` -> `tiny_proxy_mhts_free_right.c` -> `tiny_proxy_mhtsfr_get_image.c` -> (still wrong)`tiny_proxy_mhtsfrgi_no_map.c` )-> `tiny_proxy_mhtsfrginm_sim.c`
```bash
$ diff tiny_proxy_mhtsfrgi_no_map.c tiny_proxy_mhtsfrginm_sim.c
-#define READ_FILE_BLOCK 1
-#define READ_FILE_MAP 0
+#define READ_FILE_BLOCK 0  // not use when file big
+#define READ_FILE_MAP \
+  0  // this is not what proxy should do, and maybe not comform to browser
+     // transmission protocal
+#define READ_FILE_LINE 1
+#define LOG_MUT 1

-  Rio_writen(fd, file_buf, strlen(buf));
+  Rio_writen(fd, file_buf, strlen(file_buf));

# more robust to check maybe weird EOF.
if (!Rio_readlineb(&server_rio, s_buf, MAXLINE)) {
      Close(connfd);
      continue;
    }
```

- `diff tiny_proxy_wrong.c tiny_proxy.c`
```bash
# to conform to that server close fd after serving one connection.
   listenfd = Open_listenfd(argv[1]);
-  proxy_client = Open_clientfd("localhost", argv[2]);
-  printf("open proxy client: %d\n", proxy_client);
+
   clientlen = sizeof(struct sockaddr_storage);
   while (1) {
+    proxy_client = Open_clientfd("localhost", argv[2]);
+    printf("open proxy client: %d\n", proxy_client);
     connfd = Accept(listenfd, (SA *)&clientaddr,
                     &clientlen);  // line:netp:tiny:accept
     Getnameinfo((SA *)&clientaddr, clientlen, hostname, MAXLINE, port, MAXLINE,
@@ -111,6 +113,7 @@
     printf("Accepted connection from (%s, %s)\n", hostname, port);
     doit(connfd);   // line:netp:tiny:doit
     Close(connfd);  // line:netp:tiny:close
+    Close(proxy_client);
# correctly read file like image, TODO but then, next proxy-client server no transmission occured stuck in `open proxy client: 5`.
+    printf("write buf loop: %s", buf);
+#if READ_FILE_BLOCK
+    if (!strcmp(end, buf)) {
+      printf("get header\n");
+      break;
+    }
+#endif
...
+#if READ_FILE_BLOCK
+  printf("read file\n");
+  Rio_readnb(&rio_client_to_server, buf, MAXLINE);
+  printf("read file end\n");
+  char *file_buf = Malloc(MAXLINE + 1);
+  char null_char = 0;
+  file_buf = strcat(buf, &null_char);
+  Rio_writen(fd, file_buf, strlen(buf));
+  printf("write file_buf:\n %s len: %ld\n", file_buf, strlen(file_buf));
+  // Rio_writen(fd, &null_char, strlen(&null_char));
+  printf("write file end\n");
+#endif
```
#### use `write` instead of `printf` to better flush or use [`fsync`](https://stackoverflow.com/questions/259355/how-can-you-flush-a-write-using-a-file-descriptor) to flush.
#### notice `\0`
```bash
$ diff tiny_proxy_mhts_free_right.c tiny_proxy_mhtsfr_get_image.c
-  if (!strncmp(filetype, image_str, sizeof("image"))) {
+  /*
+  ignore '\0'
+  */
+  int is_image = !strncmp(filetype, image_str, sizeof("image") - 1);
+  printf("filetype: %s image_str: %s substr: %d", filetype, image_str,
+         is_image);
+  if (is_image) {

# this is important, otherwise the program will weirdly stuck when reading image like `gif` or other non plain text.
$ diff tiny_proxy_mhtsfrgi_no_map.c tiny_proxy_mhtsfrginm_sim.c
+#if READ_FILE_LINE
+  long int len;
+  while ((rc = Rio_readlineb(&rio_client_to_server, buf, MAXLINE)) > 0) {
+    len = strlen(buf);
+    if (len != rc) {
+      printf("write buf loop: %d not equal to %ld\n", rc, len);
+    }

$ diff tiny_proxy_mhtsfrginm_sim.c tiny_proxy_mhtsfrginms_all_work.c
+#define BIG_FILE_SIZE 20000
...
 #if READ_FILE_BLOCK
-  printf("read file\n");
-  Rio_readnb(&rio_client_to_server, buf, MAXLINE);
-  printf("read file end\n");
-  char *file_buf = Malloc(MAXLINE + 1);
-  char null_char = 0;
-  file_buf = strcat(buf, &null_char);
-  Rio_writen(fd, file_buf, strlen(file_buf));
-  printf("write file_buf:\n %s len: %ld\n", file_buf, strlen(file_buf));
+  /*
+  this is not safe if rc is too big.
+  */
+  char *file_buf = Malloc(BIG_FILE_SIZE);
+  printf("read response header and file\n");
+  /*
+  read until BIG_FILE_SIZE or client close transmission.
+  */
+  rc = Rio_readnb(&rio_client_to_server, file_buf, BIG_FILE_SIZE);
+  printf("read response header and file end\n");
+  Rio_writen(client_fd, file_buf, rc);
+  printf("write file_buf:\n %s len: %ld\n", file_buf, rc);
```
#### TODO weird says 'no file'
```bash
$ cat tiny_proxy_mhtsfrginm_sim.c
    /*
    both 0 and ALL_MODE is right, sometimes weird says no file
    */
```
#### weird heap -> stack when call signal handler
- can use `printf` in code or `gdb` to attach running process (the latter is better [see](#running)) to debug.
```bash
$ cat tiny_proxy_map_heap_to_stack_wrong.c | grep tmp                
char *tmp, **filter_str_list;
  printf("in handler: %p\n", tmp);
  Free(tmp);
  printf("before alloc: %p\n", tmp);
  tmp = Malloc(max_line_with_newline); # in heap
  printf("alloc %p\n", tmp);
  tmp = strcat(uri, "\n"); # in stack, more seriously, even in callee function stack which may be not valid if reused by other caller/callee. 
...
$ diff tiny_proxy_map_heap_to_stack_wrong.c tiny_proxy_map_heap_to_stack.c
-  tmp = Malloc(max_line_with_newline); 
+  char *end = "\r\n", *tmp; # enough to use stack to save ptr instead of using heap.
```
#### handler must exit to avoid unexpected rerun
```bash
# without exit(0), will implicitly return to main and continue running, then cause rerun of `free` -> 'double free detected in tcache 2'(https://stackoverflow.com/questions/67359233/what-does-this-error-means-free-double-free-detected-in-tcache-2) /
$ ./tiny_proxy_mhts_free_wrong  5000 8000
^C
 Cannot be terminated using Ctrl+C 
Catch Interrupt
close log_fd in handler
free all filter_str_list
^C
 Cannot be terminated using Ctrl+C 
Catch Interrupt
Close error: Bad file descriptor
```
#### free `char**`
```bash
# so Free(filter_str_list); is enough althoug below recommend free nestedly.
$ diff ./tiny_proxy_mhts_free_right.c ./tiny_proxy_mhts_free_wrong.c 
--- ./tiny_proxy_mhts_free_right.c      2023-05-21 17:55:46.154375319 +0800
+++ ./tiny_proxy_mhts_free_wrong.c      2023-05-21 17:54:40.336581259 +0800
@@ -43,10 +43,10 @@
   printf("close log_fd in handler\n");
 #endif
   // https://stackoverflow.com/questions/2483869/how-to-properly-free-a-char-table-in-c
+  Free(filter_str_list);
   for (int i = 0; i < FILTER_SIZE; i++) {
     Free(filter_str_list[i]);
   }
-  Free(filter_str_list);
   printf("free all filter_str_list\n");
   exit(0);
 }
```
#### TODO learn more about network, need response header to communicate
```bash
$ cat tiny_proxy_mhtsfrginm_sim.c
#if RESPONSE_HEADER
    serve_static(client_fd, filename, sbuf.st_size);
#else
    /*
    both 0 and ALL_MODE is right,sometimes weird says no file
    */
    int srcfd = Open(filename, O_RDONLY,
                     ALL_MODE);  // line:netp:servestatic:open

    int filesize = sbuf.st_size;
    char *srcp = Mmap(0, filesize, PROT_READ, MAP_PRIVATE, srcfd,
                      0);  // line:netp:servestatic:mmap
    printf("get file contents:\n%s\n", srcp);
    Close(srcfd);  // line:netp:servestatic:close
    printf("write %s, size %d\n", filename, filesize);
    Rio_writen(client_fd, srcp, filesize);
    Munmap(srcp, filesize);  // line:netp:servestatic:munmap
#endif
```
## miscs
- better not to use [ddd (archaic)](https://news.ycombinator.com/item?id=32125868)
- see [operation](https://www.felixcloutier.com/x86/unpcklps#operation) of instruction better than description -> `UNPCKLPS`
  - [VCVTPS2PD](https://www.felixcloutier.com/x86/cvtps2pd#vcvtps2pd--vex-128-encoded-version-) -> `cvtps2pd`
  - `cvtsi2ss` second operand -> [SRC1](https://www.felixcloutier.com/x86/cvtsi2ss#vcvtsi2ss--vex-128-encoded-version-)
```asm
$ cat jmp_test.s| grep vcvts -A 3 -B 1                           
        jmp *%rax
        vcvtsi2ss %edi, %xmm1, %xmm2
        vmulsd %xmm0, %xmm1, %xmm0 #Multiply a by x
        vcvtsi2sd %edi, %xmm1, %xmm1 #Convert i to double
        vdivsd %xmm1, %xmm2, %xmm2
;att
vcvtsi2ss %edi, %xmm1, %xmm2
;intel
    115d:       c5 f2 2a d7             vcvtsi2ss xmm2,xmm1,edi
```
- qnan/snan [pdf p94](../references/intel_64.pdf)
  - why define two types of [nan](https://softwareengineering.stackexchange.com/questions/392179/should-nan-default-to-snan-or-qnan)
  - also see [IEEE_754] and this [overview](https://techdocs.altium.com/display/FPGA/IEEE+754+Standard+-+Overview#Multiplication) of IEEE_754
    - SNaN (Signaling NaN)
- alignment is based on [base](https://stackoverflow.com/questions/381244/purpose-of-memory-alignment), -> offset should be multiply of alignment size.
- xmm1 return [pdf p26](../references/abi.pdf) / homework 3.75
- y86-64 online [simulator](https://boginw.github.io/js-y86-64/)
- Obviously, there will be more hazards if stages is above 5.
- Figure 4.66
> bubble [vs](https://stackoverflow.com/questions/42743411/understanding-bubble-vs-stall-vs-repeated-decode-fetch) stall
  - `ret` is detected when fetched, so the following **one** fetch is stalled (having a small possibility to return to next fetched instruction, so not cancel, i.e. bubble) -> decode after the following fetch is got bubble.
  - 'Load/use hazard' is detected when execute (Figure 4.54), so the following **two** instruction still work, but the related registers should be modified (So not cancelled -> not bubble). Similar to above.
  - 'Mispredicted branch', two following instruction must be wrong -> cancelled (see Figure 4.56)
- [Retirement Unit](https://stackoverflow.com/questions/22368835/what-does-intel-mean-by-retired#:~:text=In%20the%20context%20%22retired%22%20means,if%20they%20execute%20in%2Dorder.)
  - this is same as [graduation 'branch *mispredictions* can be handled before the branch reaches graduation' & 'recover any *remap* state'](https://en.wikipedia.org/wiki/Register_renaming)
- AVX no parallel multiplication of 64-bit integers, but AVX512 has [similar](https://stackoverflow.com/questions/41403718/can-i-use-the-avx-fma-units-to-do-bit-exact-52-bit-integer-multiplications#comment70023106_41403718); can use conversion but [not recommended](https://stackoverflow.com/questions/41403718/can-i-use-the-avx-fma-units-to-do-bit-exact-52-bit-integer-multiplications#comment70023106_41403718).
- [EDO DRAM](https://en.wikipedia.org/wiki/Dynamic_random-access_memory#Extended_data_out_DRAM) mainly kept data cache to accelerate.
> or see Bibliographic Notes [1](https://user.eng.umd.edu/~blj/papers/isca99.pdf)
  - [SDRAM](https://en.wikipedia.org/wiki/Synchronous_dynamic_random-access_memory#Commands) use one better encoding method
  - [DDR SDRAM](https://en.wikipedia.org/wiki/Synchronous_dynamic_random-access_memory#DDR_SDRAM_prefetch_architecture) use a new cache enhancement method.
  - flash [diff](https://www.tutorialspoint.com/difference-between-eeprom-and-flash#:~:text=EEPROM%20is%20a%20type%20of,to%20and%20erased%20in%20blocks.) with EEPROMs
    - TODO [hardware](https://en.wikipedia.org/wiki/Flash_memory) diff DRAM
    - this will be [worn out 'Degradation or wear of the oxides'](https://en.wikipedia.org/wiki/Flash_memory#Charge_trap_flash).
- [Recording density](https://www.anandtech.com/show/11925/western-digital-stuns-storage-industry-with-mamr-breakthrough-for-nextgen-hdds/2)
- [Transfer Time](https://www.javatpoint.com/seek-time-vs-transfer-time-in-disk-scheduling)
  - p630 : 1 circle -> 400 sectors/track, so 1/400 circle time -> 1 sector
- when use [col major](https://craftofcoding.wordpress.com/2017/02/03/column-major-vs-row-major-arrays-does-it-matter/#:~:text=In%20a%20large%202D%20array,%2Dfetches%20data%20required%20next).
- [when](https://computerscience.chemeketa.edu/cs160Reader/Binary/Bytes.html) use 2 or 10 with KB
- [common](https://binarydodo.wordpress.com/2016/05/09/investigating-linking-with-common-symbols-in-elf/) symbol which 'are present only for backward-compatibility with old source files'
- [reference](https://stackoverflow.com/questions/46515755/exactly-what-is-a-symbol-reference-in-an-object-file) is similar to call but also applies to variable.
- Relocation entries <a id="reloc"></a>
  - [structure](https://docs.oracle.com/cd/E19683-01/817-3677/chapter6-54839/index.html) (more [specific](https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-54839.html)) or  x64 [type](https://www.intezer.com/blog/malware-analysis/executable-and-linkable-format-101-part-3-relocations/) 
  - symbol [index](https://stackoverflow.com/questions/19593883/understanding-the-relocation-table-output-from-readelf) ; symbol [value](https://stackoverflow.com/questions/48942103/how-to-understand-fields-of-relocation-section-rela-plt)
- [symtab](https://stackoverflow.com/questions/3065535/what-are-the-meanings-of-the-columns-of-the-symbol-table-displayed-by-readelf) describe 'Ndx',etc
- Virtual Address [diff](https://www.javatpoint.com/virtual-vs-physical-address) with Physical Address
  - the latter is decided by adding the base address when running (especially PIE)
- lazy binding, see above GOT / PLT, or `RTLD_LAZY` in `man dlopen` / csapp
- view [got](https://stackoverflow.com/questions/39785280/how-shared-library-finds-got-section) in shared lib
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/link]$ objdump -R libvector.so
$ LD_DEBUG=all ./prog2r 2>&1 |less
```
- negated [errno](https://softwareengineering.stackexchange.com/questions/170694/why-error-codes-are-negated)
- syscall [param](https://www.cs.fsu.edu/~langley/CNT5605/2017-Summer/assembly-example/assembly.html)
- [fflush](https://www.quora.com/Why-do-we-use-the-functions-fflush-stdin-and-fflush-stdout-in-c) just to 'flush' the buffer out ('which is flushed when it is full or when you call fflush')
  - [`fflush(stdin)`](https://www.geeksforgeeks.org/use-fflushstdin-c/#)
  - `%[^\n]s` , [this](https://www.geeksforgeeks.org/use-fflushstdin-c/) is wrong, [see](https://stackoverflow.com/questions/40038538/how-does-scanf-n-str-work-in-c-programming) 
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/test]$ cat flush_stdin.c
$ cat flush_stdin.c                                 
...
                //scanf("%[^\n]s", str);
                scanf("%d", str); # here '\t' is not matched and interpreted as delimiter
                printf("%s\n", str);
                fflush(stdin);
$ gcc flush_stdin.c -o flush_stdin.o;./flush_stdin.o
67 68
C
D
$ cat flush_stdin.c
                scanf("%[^\n]s", str); # here '\t' is matched
                //scanf("%d", str);
$ gcc flush_stdin.c -o flush_stdin.o;./flush_stdin.o
67 67
67 67
67 67
```
- [async-signal-safe](https://docs.oracle.com/cd/E19455-01/806-5257/gen-26/index.html#:~:text=A%20concept%20similar%20to%20thread,operation%20that%20is%20being%20interrupted.)
- page table [entry](https://wiki.osdev.org/Paging#Page_Directory), more extended with [64-bit](https://wiki.osdev.org/Paging#64-Bit_Paging)
  - [page](https://en.wikipedia.org/wiki/Page_(computer_memory)) is just one unit, see csapp p841, similar to block as minimum transfer unit between cache memory,etc.
- why use set-block with cache memory?
> detailed is related how cache memory hardware designed.
  - block is minimum transfer unit to accelerate based on spatial locality.
  - set is related with replacement frequency. see [p34](https://courses.cs.washington.edu/courses/cse378/09wi/lectures/lec15.pdf) about expensive cost or csapp p649 working set.
  - tag is to check whether one cache memory block without being cleared in advance should be used.
- [mm_struct (recommended linux reference doc)](https://docs.huihoo.com/doxygen/linux/kernel/3.7/mm__types_8h_source.html#l00348) 
- [high-water mark](https://stackoverflow.com/questions/45489405/what-are-high-and-low-water-marks-in-bit-streaming)
- [thrashing](https://www.techopedia.com/definition/4766/thrashing) or csapp p887
- [(void *) -1](https://stackoverflow.com/questions/38550401/significance-of-void-1)
- [Buddy systems p2](http://www.cs.cmu.edu/afs/cs/academic/class/15213-s01/lectures/class15.4up.pdf)
  - [fragmentation](https://www.geeksforgeeks.org/buddy-system-memory-allocation-technique/)
- [mmap](https://www.clear.rice.edu/comp321/html/laboratories/lab10/)
- address order [Explicit Free List](https://courses.cs.washington.edu/courses/cse351/10sp/lectures/15-memallocation.pdf) and [video](https://www.youtube.com/watch?v=rhLk2lf6QXA)
- [strace brk(NULL) -> sbrk](https://unix.stackexchange.com/questions/75638/why-is-brk0-called)
- [view](https://linux-kernel-labs.github.io/refs/heads/master/labs/device_drivers.html#majors-and-minors) [Character vs. block devices](https://tldp.org/LDP/khg/HyperNews/get/devices/basics.html)
- get [predefined macro](https://stackoverflow.com/questions/2224334/gcc-dump-preprocessor-defines) ` echo | gcc -dM -E -` [or](https://stackoverflow.com/questions/19409847/how-does-eclipse-cdt-understand-size-type)
- stat structure not shown in `man 2 stat` in archlinux, shown in [man7](https://man7.org/linux/man-pages/man2/stat.2.html)
  - [S_ISREG](https://linux.die.net/man/2/stat)
  - or [`man inode`](https://stackoverflow.com/questions/40163270/what-is-s-isreg-and-what-does-it-do)
- `<` [redirection](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)
- Descriptor table Open file table [detailed](https://www.usna.edu/Users/cs/wcbrown/courses/IC221/classes/L09/Class.html) [simplified](https://biriukov.dev/docs/fd-pipe-session-terminal/1-file-descriptor-and-open-file-description/)
- [why](https://stackoverflow.com/questions/985051/what-is-the-purpose-of-fork) use fork()
- use `wait()` without `SIGCHLD` or `waitpid()` with `SIGCHLD` to reap which is done by kernel: [release](https://stackoverflow.com/questions/58885831/what-does-reaping-children-imply) process table slot at least.
- CGI standard defines [?](https://datatracker.ietf.org/doc/html/rfc3875)('"?" <query-string>') also
  - `%` as escape of ascii in [2.3](https://datatracker.ietf.org/doc/html/rfc3875#section-2.3) 
  - 'QUERY_STRING = query-string'
  - TODO & definition
- [difference](https://stackoverflow.com/questions/3581585/whats-the-difference-between-a-null-pointer-and-a-void-pointer#:~:text=A%20null%20pointer%20points%20has,the%20pointer%20has%20been%20nullified.) between a Null pointer & a Void pointer
- two [same](https://stackoverflow.com/questions/17353461/open-what-happens-if-i-open-twice-the-same-file) `open` not point to same thing in `Open file table`(Figure 10.12) 
  - vs Problem 12.27
- [`stty -icanon`](https://man7.org/linux/man-pages/man3/termios.3.html) which disable 'Input is made available line by line' by searching 'stty "canon" line buffering' from [this comment](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.32/#comment-6161315337), ~~and can be seen clearly in `vim` with '/<backspace>' where will show '/^?' defaultly.~~ ~~TODO what does `stty -icanon` do?~~
```bash
$ stty -a | grep -e '?'  
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
$ stty erase ^H
$ stty -icanon && vim
# /<backspace> -> /^?
```
  - noncanonical mode [application](https://stackoverflow.com/questions/358342/canonical-vs-non-canonical-terminal-input)
- maps perms `p` [meaning](https://stackoverflow.com/questions/19379793/how-to-identify-stack-and-heap-segments-in-proc-pid-maps-file)
### signal
- whether use `Waitpid(-1, NULL, 0);`
  - below `signalprob0_mod_0` check after child terminates by receiving `SIGUSR1`, between reception of signal and into handler1, the child may be have been reaped by kernel.
  ```bash
  [czg /mnt/ubuntu/home/czg/csapp3e/ecf]$ ./signalprob0_mod_0
  23Waitpid error: No child processes
  [czg /mnt/ubuntu/home/czg/csapp3e/ecf]$ ./signalprob0      
  213%   
  $ diff signalprob0_mod_0.c signalprob0.c
  --- signalprob0_mod_0.c 2023-05-20 12:22:57.853316323 +0800
  +++ signalprob0.c       2023-05-20 12:16:15.879542168 +0800
  @@ -11,7 +11,7 @@
  void handler1(int sig) 
  {
      sigset_t mask, prev_mask;
  -    Waitpid(-1, NULL, 0);
  +    // Waitpid(-1, NULL, 0);
      Sigfillset(&mask);
      Sigprocmask(SIG_BLOCK, &mask, &prev_mask);  /* Block sigs */
      Sio_putl(--counter);
  @@ -34,7 +34,7 @@
          // _exit(0);
      }
      Kill(pid, SIGUSR1); 
  -    // Waitpid(-1, NULL, 0);
  +    Waitpid(-1, NULL, 0);
  ```

  - more detailed see `tiny_sigprocmask.c` comments
  ```bash
  [/mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12.35]$ git rev-parse czg/master 
  a517a18def6af63d775dd521c661000490ae9657
  ```
### network
- [ai_flags](https://www.akkadia.org/drepper/userapi-ipv6.html)
  - [addrinfo](https://www.qnx.com/developers/docs/6.5.0SP1.update/com.qnx.doc.neutrino_lib_ref/a/addrinfo.html)
- `##family` [meaning](https://stackoverflow.com/questions/28225972/what-is-the-meaning-of-family)
- get `EOF` [relation](https://unix.stackexchange.com/questions/110240/why-does-ctrl-d-eof-exit-the-shell) with `Ctrl+D`
- errno on [different](https://www.ioplex.com/~miallen/errcmp.html) from [this](https://stackoverflow.com/questions/7003234/which-systems-define-eagain-and-ewouldblock-as-different-values/7003379#7003379) of [1](https://stackoverflow.com/questions/49049430/difference-between-eagain-or-ewouldblock) platforms
- [MIME](https://www.digipres.org/formats/mime-types/) [or](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types)
- HTTP standard text line [ending](https://stackoverflow.com/questions/5757290/http-header-line-break-style) `\r\n`
  - HTTP [Request](https://www.ibm.com/docs/en/cics-ts/5.3?topic=protocol-http-requests) ([responses](https://www.ibm.com/docs/en/cics-ts/5.2?topic=protocol-http-responses)), more [detailed](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages)
    - [headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers#proxies)
    - HTTP request [methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
- CGI [env](https://www6.uniovi.es/~antonio/ncsa_httpd/cgi/env.html)
- http/1.1 [rfc](https://datatracker.ietf.org/doc/html/rfc2616)
- [`Connection reset by peer`](https://stackoverflow.com/a/1434592/21294350) [see problem 12.23](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.23/)
### threads
- [asynchronous](https://unix.stackexchange.com/questions/386814/what-do-asynchronous-and-synchronous-mean-in-notifying-processes-of-system-event) event
- CPU Context Switching [save](https://www.scaler.com/topics/operating-system/context-switching-in-os/) CPU state in cooperation with separate virtual memory.
- p1010 -> `man 7 signal` :'The signal being delivered  is also added to the signal mask...These signals are thus blocked while the handler executes'
- [clean](https://www.pluralsight.com/blog/software-development/10-steps-to-clean-code) code
- [shared](https://www.softprayog.in/programming/interprocess-communication-using-posix-shared-memory-in-linux#:~:text=Shared%20memory%20is%20an%20inter,segment%20to%20its%20address%20space.) memory
- [cancellation point](https://stackoverflow.com/questions/27374707/what-exactly-is-a-cancellation-point) may be simply some point where OS can cancel the thread ('The write function is a cancellation').
- [closed-form solution](https://stats.stackexchange.com/questions/70848/what-does-a-closed-form-solution-mean)
- although `pthread_join()` blocks, but it doesn't influence peer thread running and only blocks main thread.
- [`time`](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1) usage (here user bigger than real because of [`threads`](https://stackoverflow.com/questions/15928334/user-time-larger-than-real-time))
```bash
$ bash -c 'time ./psum-array 32 30'

real    0m0.867s
user    0m12.934s
sys     0m0.007s
```
#### processes (a), I/O multiplexing (b), and threads (c) diffs
1.  (a) doesn't use other data structure to control flow, just let kernel decide process instructions running order
    (b) use `fd_set` to control I/O fd
    one process and one thread promises that no running **order** is needed to be concerned.
    (c) use `semaphore` to control function instructions behavior to exclude wrong behavior subsets.
    and thread order may be different and is needed to be concerned.
#### summary
- class 1: use `semaphore` to protect.
  class 2: rewrite p1059
  class 3/4 : at least by lock-and-copy
- producer and consumer [original source](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD01xx/EWD123.html)
#### miscs
- from `man 2 select`, bits of `fd_set` should less than `FD_SETSIZE`,
  from source code, here `__FD_SETSIZE` implies that we can have size equal to `FD_SETSIZE` and index up to `FD_SETSIZE-1`.
```cpp
typedef struct
  {
    /* XPG4.2 requires this member name.  Otherwise avoid the name
       from the global namespace.  */
#ifdef __USE_XOPEN
    __fd_mask fds_bits[__FD_SETSIZE / __NFDBITS];
# define __FDS_BITS(set) ((set)->fds_bits)
#else
    __fd_mask __fds_bits[__FD_SETSIZE / __NFDBITS];
# define __FDS_BITS(set) ((set)->__fds_bits)
#endif
  } fd_set;
```
### C syntax miscs
- [Function Pointer](https://www.geeksforgeeks.org/function-pointer-in-c/#) similar to ['typedef fixed length array'](https://stackoverflow.com/questions/4523497/typedef-fixed-length-array), etc
```cpp
void (*fun_ptr)(int) = &fun; // here '(*fun_ptr)' is main body; can be seen as '*fun_ptr' -> function 'void foo(int)'
typedef char type24[3]; // here 'type24' is main body; can be seen as 'type24' -> char[3]
```
- Exception number [pdf p167](../references/intel_64.pdf)
## TODO
- redo 3.68 homework after understanding stack better.
- 3.73 use asm not __asm__ direct.
- relearn digital circuits and relearn chapter 4 and try designing circuits.
- [prime](https://stackoverflow.com/questions/67623801/is-it-always-necessary-to-make-hash-table-number-of-buckets-a-prime-number-for-p) hash bucket number
- [AMDuProf](https://community.amd.com/t5/server-gurus-discussions/intel-vtune-on-amd-processors/m-p/529122/highlight/true) & [callgrind](https://stackoverflow.com/questions/6663614/use-valgrind-to-know-timein-seconds-spent-in-each-function)
- SRAM DRAM [design](https://www.egr.msu.edu/classes/ece410/mason/files/Ch13.pdf), more [concise  ](https://web.cs.umass.edu/~weems/homepage/335-Notes/ewExternalFiles/Lecture%209.pdf)
  - TODO 
    - how DRAM [implemented](http://blackandwhitecomputer.blogspot.com/2012/03/reading-writing-operation-of-dram.html)
    - [precharge](https://electronics.stackexchange.com/questions/246835/what-is-the-need-for-precharging-in-sram-dram-memory-cell/246846#246846)
- problem 6.34 -> 'typedef' related book referenced in csapp 
- reread p735 'aside' after chapter 9
- time travel [debug](https://pspdfkit.com/blog/2021/time-travel-debugging-for-c/) which also temporarily disabled avx to solve 'Process record does not support instruction 0xc4 at address ...'
- page table entry (pte) [kernel](https://github.com/lorenzo-stoakes/linux-vm-notes/blob/master/sections/page-tables.md) code
- show `__builtin_bswap32` definition
- [defining](https://stackoverflow.com/questions/47377745/c89-c99-say-theyre-macros-make-them-happy) a macro that does essentially nothing `#define stdin stdin`
- SOCK_RAW SOCK_DGRAM [diff](https://stackoverflow.com/questions/5815675/what-is-sock-dgram-and-sock-stream) csapp p975
- why rio... in csapp robust?
- memory [circuit][memory_Introduction] and virtual memory related with [vm][Virtual_Memory]
- how [semaphore](https://www.shiksha.com/online-courses/articles/mutex-vs-semaphore-what-are-the-differences/) is used differently from mutex with regard to ‘several processes’
  - one difference for illustration ('It cannot be locked or unlocked by any context other than the context that **acquired** it.'):
    see csapp Figure 12.26 -> `rw1.c`, if we prepend `P(&w)` in `writer(void)` with `V(&w)` (although this is insane but it is able to do it), then can run Critical section between `V(&w)` and `P(&w)`.

    but it may be not for `mutex`,
  - difference with [`Java Monitor`](https://www.javatpoint.com/semaphore-vs-monitor#:~:text=Semaphore%20is%20an%20integer%20variable%2C%20whereas%20monitor%20is%20an%20abstract,crucial%20section%20at%20a%20time.) 
    po, java Monitor implementation is mostly encapsulated (i.e. abstraction) without too much care. 
- why r7 4800h can run 32 [threads](https://unix.stackexchange.com/questions/342014/hyperthreading-is-there-a-way-to-know-from-the-command-line-if-it-is-enabled-in)
```bash
# https://unix.stackexchange.com/questions/33450/checking-if-hyperthreading-is-enabled-or-not
$ sudo dmidecode -t processor | grep -e 'HTT\|cor\|th' -i
                HTT (Multi-threading)
        Version: AMD Ryzen 7 4800H with Radeon Graphics         
        Core Count: 8
        Core Enabled: 8
        Thread Count: 16
                Multi-Core
                Hardware Thread
$ bash -c 'time ./psum-array 32 30'                

real    0m0.855s
user    0m12.746s
sys     0m0.000s
$ bash -c 'time ./psum-array 16 30'

real    0m1.589s
user    0m19.608s
sys     0m0.003s
$ bash -c 'time ./psum-array 8 30' 

real    0m1.735s
user    0m13.123s
sys     0m0.001s
[czg /mnt/ubuntu/home/czg/csapp3e/conc]$ bash -c 'time ./psum-array 4 30'

real    0m3.352s
user    0m12.626s
sys     0m0.000s
```
- `read` seems to not change file position related with [stream](https://www.gnu.org/software/libc/manual/html_node/File-Positioning.html).
```cpp
/* /mnt/ubuntu/home/czg/csapp3e/conc/homework/tfgets-select_comment_1.c */
printf("%p\npos: %ld\n",readptr,ftell (stream));
```
- check client without closing it after receiving one message, by checking `fd` duplicate after `fd` is manipulated by kernel once `connfd` related with some client is closed by client itself.
# directly [use](https://cs.lmu.edu/~ray/notes/gasexamples/) syscall with asm to run (this blog get by googling 'use as to assemble')
# att syntax
- [label(%rip)](https://stackoverflow.com/questions/69464871/assembly-and-rip-usage) 
  - more [detailed](https://stackoverflow.com/questions/3250277/how-to-use-rip-relative-addressing-in-a-64-bit-assembly-program) 'the address of your string'(also see 'disassembler gave 0x10(%rip) because distance from current rip and msg is 0x10 byts' [here](https://stackoverflow.com/questions/3250277/how-to-use-rip-relative-addressing-in-a-64-bit-assembly-program#comment46433871_3260178))
```bash
$ cc -O1 -Wall -I ../include -S badcnt.c -masm=intel -o badcnt_intel.s
$ cat badcnt_intel.s
...
lea rbx, thread[rip]
$ objdump -D badcnt | grep 2609 -A 20
0000000000002609 <thread>:
    2609:       48 8b 0f                mov    rcx,QWORD PTR [rdi]
    ....
    268f:       48 8d 1d 73 ff ff ff    lea    rbx,[rip+0xffffffffffffff73]        # 2609 <thread>
    2696:       48 89 da                mov    rdx,rbx
```
  - [also](https://godbolt.org/) [from](https://www.felixcloutier.com/documents/gcc-asm.html#examples) 
# misc syntax
## C
- struct dot before variable like [`struct timeval t = {.tv_sec = 5};`](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.32/#comment-6161315337)
- not to overlap dst and src str although csapp `tiny.c` use, and here if move `%s` after const str like `sprintf(buf, "Server: Tiny Web Server%s\r\n", buf); ` , then generate weird wrong result. 
```bash
[czg /mnt/ubuntu/home/czg/csapp3e/netp/tiny]$ cat tiny.c | grep sprin
  sprintf(buf, "HTTP/1.0 200 OK\r\n");  // line:netp:servestatic:beginserve
  sprintf(buf, "%sServer: Tiny Web Server\r\n", buf); 
$ man sprintf
NOTES
       Some programs imprudently rely on code such as the following

           sprintf(buf, "%s some further text", buf);
           ...
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12.35]$ cat tiny_bug.c | grep sprin
    sprintf(buf, "%d", pid);
    sprintf(buf,"%s reaping",buf);
    sprintf() 
    // sprintf(buf,"%s %s","reaping",buf);
    ...
```
- [near](https://www.geeksforgeeks.org/what-are-near-far-and-huge-pointers/),(type modifiers also applies to variable, not just ptr)[far](https://stackoverflow.com/questions/33373701/use-of-type-modifiersnear-far-huge-with-normal-variables) (A2: '"non-far variables" in the stack' related with stack/local variable),  
  - 'safely ignore them'
## Makefile
- /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12.35/Makefile
  - use [`shell`](https://stackoverflow.com/questions/65518363/how-to-append-to-a-list-of-variables-in-a-makefile)
  - [`+=`](https://stackoverflow.com/questions/55500865/how-to-append-lists-in-makefile-using-loops)
- why `clean` has [`*~`](https://stackoverflow.com/questions/38002190/what-is-happening-in-this-make-clean) (which is emacs backup)
- [diff](https://unix.stackexchange.com/questions/100786/why-does-diff-fail-when-invoked-from-a-makefile)
- clang-format not change Include order<a id="format"></a> [1](https://unix.stackexchange.com/questions/32908/how-to-insert-the-content-of-a-file-into-another-file-before-a-pattern-marker) 2
- using [variable](https://stackoverflow.com/questions/16267379/variables-in-makefile-prerequisites)
```bash
[/mnt/ubuntu/home/czg/CSAPP-3e-Solutions/site/content/chapter12/code]$ tail makefile 
        (cd 12.39; make clean)
        find . -type f -executable -print0 | xargs -0 rm -f --

benchmark:
        wrk -d4 http://localhost:5000
format:
        (clang-format --style=Google -dump-config > ./.clang-format_google)
        #(cat ./.clang-format >> ./.clang-format_google)
        (sed -n -e '/.../r ./.clang-format_tmp' ./.clang-format_google > ./.clang-format)
        (find . -name '*.c' | xargs clang-format --style=file -i )
$ cat ./.clang-format_tmp
SortIncludes: false
```
### common derivative
```bash
@echo ...
$(subst ...)

# generate assembly with source code inline https://stackoverflow.com/questions/137038/how-do-you-get-assembler-output-from-c-c-source-in-gcc/137479#137479 from https://stackoverflow.com/questions/12965019/generate-assembly-for-a-target
# Create assembler code:
g++ -S -fverbose-asm -g -O2 test.cc -o test.s

# Create asm interlaced with source lines:
as -alhnd test.s > test.lst
```
## clangd
- sometimes will change the header order and result compile error. [see](https://github.com/clangd/clangd/issues/918)
## Sed
- read `man sed`, just find address 'Addresses' and run command like 'Zero- or One- address commands', read [example](#format)
# `.gitignore`
## `.gitignore` use bash [Pattern Matching](https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html) (i.e. [glob](https://stackoverflow.com/questions/33189437/explain-gitignore-pattern-matching)) although current latest `.gitignore` file not show it. **NOT using regex**
- so use [`git check-ignore -v **/* `](https://scriptcrunch.com/git-show-ignored-files/) to check all subdir files, here `**/` -> all subdirs, `*` -> any str
- regex `+` by [`?*`](https://stackoverflow.com/questions/28281504/what-is-the-gitignore-equivalent-of-one-or-more-occurrence)
- [debug](https://stackoverflow.com/questions/2937407/test-whether-a-glob-has-any-matches-in-bash) glob with `compgen`
- [pattern-list](https://www.linuxjournal.com/content/pattern-matching-bash)
- using [make](https://www.codesynthesis.com/~boris/blog/2009/03/23/generating-gitignore/) to generate
```bash
$ git diff .gitignore                     
diff --git a/.gitignore b/.gitignore
index 51b072f..756b705 100644
--- a/.gitignore
+++ b/.gitignore
@@ -55,7 +55,13 @@ dkms.conf
 
 **/[0-9a-z_]*.o
 [0-9a-z_]*.o
+# this '**/' will match zero dir (https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html), then '?*_?*' will match 'self_test'
+**/?*_?*
+!**/?*_?*.*
+**/?*_?*.o
+!self_test
+# gitignore not use regex, so '+' is wrong
 # **/[_a-z]+[^.]+
 ![0-9]_[0-9]*.*
 # *
-# **
\ No newline at end of file
+# **
```
## check whether remove all executable without suffix
```bash
$ git ls-files -c | grep -v -e '\.\|README\|Makefile'
data/2_44
data/2_54
data/2_59
data/bad-sum
data/bisbic
data/casting
data/code
...
# check whether current remove cache
$ git ls-files --ignored --exclude-standard -c

## TODO weird `check-ignore -v` not valid
$ compgen -G "**/?*_?*" | grep da
data/2_44
data/2_44.c
...
$ git check-ignore -v **/* | grep data
# https://stackoverflow.com/questions/15925079/why-does-git-ls-files-ignore-require-exclude-patterns
$ git ls-files --ignored --exclude-standard -c -v
H data/2_44
H data/2_54
...

# diff two commands https://askubuntu.com/questions/229447/how-do-i-diff-the-output-of-two-commands
$ diff <(git ls-files --ignored --exclude-standard -c) <(git ls-files -c | grep -v -e '\.\|README\|Makefile')
--- /proc/self/fd/11    2023-05-22 17:51:48.594727632 +0800
+++ /proc/self/fd/12    2023-05-22 17:51:48.594727632 +0800
@@ -23,6 +23,7 @@
 link/interpose/intr
 mem/matmult/bmm
 mem/matmult/mm
+mem/memperf/INSTALL
 mem/memperf/memperf
 mem/mountain/mountain
 mem/mountain1x1/mountain
$ git ls-files -c | grep '\.so'
```
## this repo 
```bash
# only manipulate added dir
$ cat ~/.histfile | grep csapp3e | grep cd | grep -v ";" | uniq
cd /mnt/ubuntu/home/czg/csapp3e/
cd /mnt/ubuntu/home/czg/csapp3e/asm
#cd /mnt/ubuntu/home/czg/csapp3e/asm
cd /mnt/ubuntu/home/czg/csapp3e/asm
cd /mnt/ubuntu/home/czg/csapp3e/asm/
cd /mnt/ubuntu/home/czg/csapp3e
cd /mnt/ubuntu/home/czg/csapp3e/ecf
cd /mnt/ubuntu/home/czg/csapp3e/ecf/../include
cd /mnt/ubuntu/home/czg/csapp3e/ecf/
cd /mnt/ubuntu/home/czg/csapp3e/ecf/l
cd /mnt/ubuntu/home/czg/csapp3e/ecf/
cd /mnt/ubuntu/home/czg/csapp3e/vm
cd /mnt/ubuntu/home/czg/csapp3e/references/
cd /mnt/ubuntu/home/czg/csapp3e/vm/malloc/
cd /mnt/ubuntu/home/czg/csapp3e/io/
cd /mnt/ubuntu/home/czg/csapp3e/netp
cd /mnt/ubuntu/home/czg/csapp3e/conc
cd /mnt/ubuntu/home/czg/csapp3e/ecf
cd /mnt/ubuntu/home/czg/csapp3e/conc
cd /mnt/ubuntu/home/czg/csapp3e/ecf
cd /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_38
cd /mnt/ubuntu/home/czg/csapp3e/io
cd /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39/
cat ~/.histfile | grep csapp3e | grep cd | uniq

# remove cache to see how work

$ git rm --cached -r .
# this can show more real state than `git check-ignore`
$ git status --ignored .

# https://www.cyberciti.biz/faq/linux-unix-copy-a-file-to-multiple-directories-using-cp-command/
$ xargs -n 1 cp -v asm/.gitignore <<< "ecf/ vm/ io/ netp/ conc/"
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework]$ xargs -n 1 cp -v ../../asm/.gitignore <<< $(ls | grep tiny)

# debug current dir: https://stackoverflow.com/questions/466764/git-command-to-show-which-specific-files-are-ignored-by-gitignore,https://stackoverflow.com/questions/46714324/how-to-check-if-a-file-is-git-ignored
[czg /mnt/ubuntu/home/czg/csapp3e/conc]$ git check-ignore -v *
# debug start by `.` dir/file
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39]$ git check-ignore -v .*
conc/homework/.gitignore:3:.cache/      .cache
[czg /mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_39]$ git check-ignore -v * | grep '\.ca'
# nothing
# better use 
$ ls -a | xargs  git check-ignore -v
# git check-ignore not check whether file real exists
$ ls -al data/2_44.c
ls: cannot access 'data/2_44.c': No such file or directory
$ git check-ignore data/2_44.c -v
netp/.gitignore:2:!*.*  data/2_44.c

# template .gitignore
$ cat .gitignore 
*
!*.*
!**/
.cache/
!Makefile
*.o
*.gdb
*.out
![A-Z]*
# !**                                            
```
## must use suffix or constant name in subdirs so that [`.gitignore`]() can be used better, then just write in parent `.gitignore` is enough ('it matches files and folders in any folder or subfolder.').
-[recommend](https://www.golinuxcloud.com/gitignore-examples/), also [see](https://gist.github.com/chichunchen/970a7e97c74a253a4503)
- if not suffix, remove exe will be more [complex](https://stackoverflow.com/questions/63590953/gitignore-on-executable) because need deal with every subdir.
> notice above link 5.2, 5.6
>
- here `Tracked files` is not conflict with `Ignored files`, the former is based on history and the latter is based on `.gitignore`.
```bash
   1135         deleted:    ecf/_build/cmake_install.cmake
   1136         deleted:    ecf/_build/compile_commands.json
   1137         deleted:    ecf/_build/libYourLib.so

   1863         ecf/_build/
```
## git miscs
- caret [`^`](https://stackoverflow.com/questions/1955985/what-does-the-caret-character-mean-in-git) or tilde `~`
# assembly pseudo instruction
- TODO dd meaning [here](https://en.wikipedia.org/wiki/Spinlock#Example_implementation) same as [this](https://stackoverflow.com/questions/46513413/x86-asm-dd-being-used-as-an-instruction) ?
  - dd [example](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)
# other books about computer basic architecture
## [Computer organization and design David A. Patterson](../references/other_resources/dokumen.pub_computer-organization-and-design-mips-edition-the-hardware-software-interface-6nbsped-9780128226742.pdf&) which is generated by [this](https://www.pdf2go.com/result#j=19de2dd4-c818-4a03-93c4-004f44fc35f4) (this one is based on MIPS although it have [RISC-V](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20RISC-V%20edition.pdf) and ARM version)
> [compared](https://www.quora.com/Why-is-William-stallings-computer-architecture-book-not-as-popular-as-Hennessy-Patterson) with william stallings computer organization and architecture which is referenced in this [zhihu link](https://www.zhihu.com/question/36539741?utm_id=0), see [IPFS](https://www.reddit.com/r/textbookrequest/comments/10aa3b7/computer_organization_and_architecture_eleventh/)
> RISC-V encoding behavior [reasons](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way)
- risc-v [appendix](https://www.elsevier.com/books-and-journals/book-companion/9780128122754/advanced-content-and-appendices#Advanced%20Content)
- also see above [COD](#COD)
- [COD5th](../references/other_resources/COD/CS422-Computer-Architecture-ComputerOrganizationAndDesign5thEdition2014.pdf) rendered more well
- thought as [bible](https://passlab.github.io/CSE564/resources/#textbook)
- exercise [solution](https://www.studocu.com/ko/document/konkuk-university/%EC%BB%B4%ED%93%A8%ED%84%B0%EA%B5%AC%EC%A1%B0/computerorganizaion-design-5th-solution/9639022)
- more detailed see [CAAQA](../references/other_resources/CAAQA/Computer_Architecture_A_Quantitative_App.pdf)
- TODO all ' Self-Study' in better pdf rendering
- MIPS [register](https://en.wikibooks.org/wiki/MIPS_Assembly/Register_File)
  - instruction [set](https://edumips64.readthedocs.io/en/latest/instructions.html)
> [choose](https://www.quora.com/Why-do-we-study-MIPS-in-great-detail-in-Computer-Architecture-instead-of-the-more-common-ISAs-like-ARM-or-x86) MIPS or ARM or [RISC-V](https://www.reddit.com/r/learnprogramming/comments/118vxbk/comment/j9juyma/?utm_source=share&utm_medium=web2x&context=3)
- TODO where is ’The rest of Section 1.12 is found online.‘ online ?
### chapter 1
> p27 show important part subtitle in the book.
> read subtitle to see whether self scratch that what the book will say
- mainly introduction without much useful information see p43,45,65,[71](https://www.techinsights.com/blog/teardown/apple-iphone-13-pro-teardown),106->39,128,'Fallacies and Pitfalls',
> 106->39 means p106 in 'doku..' -> p39 in 'CS422...'
### chapter 2
- see 'Design Principle ',242('What is and what is not preserved'),FIGURE 2.12,268,FIGURE 2.21,280,285,290(lazy binding),292(Java bytecode),
  - 'FIGURE E2.15.1','FIGURE E2.15.2' 'FIGURE E2.15.7'
    - `Code motion` p321,322(TODO more specific example)
    - p320 see this [p22](https://cons.mit.edu/fa18/slides/S16-lecture-15.pdf)
      - p327 [induction variable elimination](http://www.nullstone.com/htmls/category/ive.htm)
      - TODO related with compiler p329 [p11](https://people.iith.ac.in/ramakrishna/fc5264/global-reg-allocation.pdf), [also](https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/ive/)
    - p351, 'FIGURE E2.15.12' ([leaf procedure](https://courses.cs.vt.edu/~cs2505/summer2011/Notes/pdf/T27.RecursionInMIPS.pdf) -> not need to push registers, maybe only caused in RISC because of using `$ra` (like [`LR` in ARM](https://developer.arm.com/documentation/dui0801/l/Overview-of-AArch64-state/Link-registers)) instead of stack to save return address) after reading `c++ primer`
  - mips risc-v [diff](https://stackoverflow.com/questions/67464262/mips-and-risc-v-differences) similar to p362
  - p365 more detailed of csapp p203 
    - ~ p368 more compact description of x86(-64)
  - p380 register [hints](https://www.geeksforgeeks.org/understanding-register-keyword/).
  - p392 reason why use variable-length instruction
  - TODO p393 ... history
  - p396~398 UNIX make C popular, and Sun failure make Oak never heard, but Netscape make Java (descendant of Oak) known with its browser 
- [frame pointer ‘the base of the stack frame’](https://twilco.github.io/riscv-from-scratch/2019/07/28/riscv-from-scratch-4.html)  like `$rbp`
#### p360 ARMv7 vs v8, TODO see [linux foundation](https://events.static.linuxfound.org/sites/events/files/slides/KoreaLinuxForum-2014.pdf) or [simplified](https://qr.ae/pyrWZp)
- [conditional execution field](https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding/The-condition-code-field?lang=en)
- loading [constant](https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/how-to-load-constants-in-assembly-for-arm-architecture)
- instruction [encoding](https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding?lang=en)
- [Load Multiple](https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/Instruction-Details/Alphabetical-list-of-instructions/LDM-LDMIA-LDMFD--Thumb-?lang=en) see [example](https://azeria-labs.com/load-and-store-multiple-part-5/) [also](https://keleshev.com/ldm-my-favorite-arm-instruction/) addressing [mode](https://developer.arm.com/documentation/dui0068/b/Writing-ARM-and-Thumb-Assembly-Language/Load-and-store-multiple-register-instructions/LDM-and-STM-addressing-modes) or more [general](https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/The-Instruction-Sets/Load-store-instructions/Addressing-modes) addressing mode with [examples](https://www.cs.uregina.ca/Links/class-info/301/ARM-addressing/lecture.html).
> see 'P.1' for how to read the instruction description.
> TODO use one real ARMv7 program to see what happen
```cpp
if CurrentInstrSet() == InstrSet_ThumbEE then SEE "ThumbEE instructions";
n = UInt(Rn);  registers = '00000000':register_list;  wback = (registers<n> == '0');
if BitCount(registers) < 1 then UNPREDICTABLE;
```
  - above, things like 'CurrentInstrSet()/SEE' see ['PseudocodeIndex' table Q.1](../references/other_resources/ARMv7/DDI0406C_arm_architecture_reference_manual.pdf)
  - `Rn` just see web link
  - 'register_list' see [A8](../references/other_resources/ARMv7/DDI0406C_arm_architecture_reference_manual.pdf)
    > here 'registers = '00000000':register_list;' can be guessed by other Encoding description like 'registers = P:M:'0':register_list;' or 'registers = register_list;', so ':' just means **concatenation** (':' description maybe not shown in both doc and other web resources.)
  - 'wback' can be guessed by the web link description 'wback = (W == '1');' and 'Causes the instruction to write a modified value back to <Rn>. Encoded as W = 1. ...', so means **‘write back’**
```cpp
if W == '1' && Rn == '1101' then SEE POP (Thumb);
n = UInt(Rn);  registers = P:M:'0':register_list;  wback = (W == '1');
if n == 15 || BitCount(registers) < 2 || (P == '1' && M == '1') then UNPREDICTABLE;
if registers<15> == '1' && InITBlock() && !LastInITBlock() then UNPREDICTABLE;
if wback && registers<n> == '1' then UNPREDICTABLE;
```
  - POP (Thumb) [p532](../references/other_resources/ARMv7/DDI0406C_arm_architecture_reference_manual.pdf)
> then read **`Operation`** section in web link
##### more friendly [paper](../references/other_resources/ARMv7/Porting%20to%20ARM%2064-bit%20v4(2).pdf) from [this](https://community.arm.com/support-forums/f/architectures-and-processors-forum/3357/differences-between-armv7-to-armv8/165675#165675) highly recommended
- show why use `The Zero Register` in arm and not use `PC` in armv8
#### ARM [registers relation with x86](https://azeria-labs.com/arm-data-types-and-registers-part-2/)
### below temporarily changed to RISC-V just as [18-447 TODO reason for switching to RISC-V](https://users.ece.cmu.edu/~jhoe/course/ece447/S22handouts/L02.pdf)
> [ARM-v8 version](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20ARM%20edition.pdf): author use v8 instead of v7 in p17 for more similarity with MIPS.

from 5.14,I changed to this [book](https://bank.engzenon.com/tmp/5e7f7183-219c-4d93-911a-4aaec0feb99b/5dc835ea-b66c-4988-be3f-4d51c0feb99b/Computer_Organization_RiscV_Edition.pdf) (saved at this [location](../references/other_resources/COD/Computer_Organization_RiscV_Edition.pdf)) which keeps the same layout as the original book [appendix](https://www.elsevier.com/books-and-journals/book-companion/9780128122754/advanced-content-and-appendices#Advanced%20Content). Before that, I read [this](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20RISC-V%20edition.pdf) which is saved [here](../references/other_resources/COD/COD_RISCV_OCR.pdf)
#### RISC-V [manual](../references/other_resources/RISC-V/riscv-spec-20191213.pdf), [latest](https://riscv.org/technical/specifications/)
- TODO SB-format B [meaning](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way)
- also green/[reference](https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf) card
- p23: rd(destination), rs(source), funct3(3 bits,p126)
- XLEN [meaning with other infos](https://www.imperialviolet.org/2016/12/31/riscv.html#:~:text=RISC%2DV%20is%20little%2Dendian,are%20the%20native%20register%20size.) and three modes
##### ISA doc
- [online doc (i.e. instruction set list) with description of instructions like `ld`](https://msyksphinz-self.github.io/riscv-isadoc/html/rv64i.html#ld) [all](https://msyksphinz-self.github.io/riscv-isadoc/html/index.html)
  - [more readable](https://jemu.oscc.cc/SUB)
#### complement of above
##### chapter 1
- p90 [wafer die yield](https://en.wikichip.org/wiki/yield)
- p123 see my mathexchange [answer](https://math.stackexchange.com/a/4711125/1059606) in ['solved Why geometric mean get a same relative answer rather than arithmetic mean?'](https://math.stackexchange.com/questions/4083719/solved-why-geometric-mean-get-a-same-relative-answer-rather-than-arithmetic-mean)
- p129
  - here 'lower layer' is similar to those in memory hierarchy
- p130
  - 'Maintaining the instruction set ...' means both AMD zen1/2/3 ... or [intel Sandy Bridge/Haswell](https://en.wikipedia.org/wiki/List_of_Intel_CPU_microarchitectures)(' many implementations of that architecture') all run 'x86-64'('instruction set architecture ')
- p133
  - [dependability](https://en.wikipedia.org/wiki/Dependability)
##### chapter 2
- 'FIGURE 2.41': varying popularity of instructions
- pipeline [vs](https://qr.ae/pyyGJ7) parallel ‘Parallelism involves replicated hardware (exploiting space). Pipelining involves re-using hardware optimally based on dataflows (exploiting time).’
- load-reserved
  - ~~based on maunal p48 subsumes the bytes in the addressed word, this will check address~~
  - p253 both 'atomic compare and swap or atomic fetch-and-increment (semaphore)' and above 'CompareExchange ...' are all **read and a write**
- [memory model](https://danielmangum.com/risc-v-tips/2022-01-05-rvwmo/) TODO more [detailed](https://riscv.org/wp-content/uploads/2018/05/14.25-15.00-RISCVMemoryModelTutorial.pdf)

- p183 here offset always in instruction imm
- p184 why linux/unix-like use [LP64](http://archive.opengroup.org/public/tech/aspen/lp64_wp.htm), also [see link2](https://stackoverflow.com/questions/384502/what-is-the-bit-size-of-long-on-64-bit-windows) and [code convention ’avoid using "int" and "long"‘ (at least `long`)](https://stackoverflow.com/questions/7279504/why-do-c-compilers-specify-long-to-be-32-bit-and-long-long-to-be-64-bit)
  - kw: ’key evaluation‘
  - 'LLP64 preserves the relationship' , 1- will add 'non-portable scalar datatype' `long long`, so in other operating system, 'related to assumption that a **pointer** will fit in an int' (implicit cast to int because C standard not have long long)
  - 'ILP64' no 32-bit, 'ignores the portability of data or depends on the addition of a 32-bit datatype' which is not expected when 'The world is currently dominated by 32-bit computers' (? this link is archived, so this may be wrong)
  > both LLP64 and ILP64 need ’non-standard datatypes‘ to be **compatible** which may be why Microsoft choose LLP64 (their system source code is different from unix.).
  >> link2 says '32-bit software can be recompiled without change' (also see 'intptr_t')
  - LP64 'run on 32-bit systems without change'
- p199 S-type, also see [MIPS](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_help.html)
  - also [p7](../references/other_resources/RISC-V/Lecture7.pdf)
- p210 [bit-field](https://en.cppreference.com/w/cpp/language/bit_field) just to keep data compact , then ' to match an externally enforced interface' <a id="bit-field"></a>
- p240 [add 1](https://stackoverflow.com/questions/50742420/risc-v-build-32-bit-constants-with-lui-and-addi) '-4096'
- p252 load-reserved ... pair is based on ' a memory **read and a write** in a single, uninterruptible instruction.' 
  - [reservation set](https://stackoverflow.com/questions/70242113/whats-reservation-in-risc-vs-lr-instruction) just 'reserve's the cache line. <a id="load_reservation"></a>
    - kw:'cache line leaves exclusively-owned','it is conditional'
    - TODO 'ARM's "monitor" region'
  - [ABA](https://www.baeldung.com/cs/aba-concurrency#value--vs-reference-based-scenarios) mainly because of Value-Based [TODO](https://www.baeldung.com/cs/aba-concurrency#3-immutability)
  - so [Load-link/store-conditional](https://en.wikipedia.org/wiki/Load-link/store-conditional) has no ABA, also [see p48 'detects any intervening memory write'](https://people.eecs.berkeley.edu/~krste/papers/EECS-2016-1.pdf) 
  - TODO [weak](https://liblfds.org/mediawiki/index.php/Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family) (this also shows platform related with cas or LL/sc) LL/SC meaning
    - based on [this](https://en.wikipedia.org/wiki/Load-link/store-conditional#Implementations) (TODO 'three registers') maybe only one 'cache line' is weak (see manual p51), while 'dependent blocks' is strong
  - CompareExchange,Load-Linked/Store-Conditional, and Compare-And-Swap [compare](https://stackoverflow.com/questions/7069986/compare-and-swap-atomic-operation-vs-load-link-store-conditional-operation)
    - kw(keyword): 'except that', '"ABA" problem', 'implemented in terms of', 'though the limited amount'
    - [live-lock 'Difference between Deadlock, Starvation ('some processes *never* getting serviced') , and Livelock: '](https://www.geeksforgeeks.org/deadlock-starvation-and-livelock/) (where two process swap locks but not 'do some work',also [see](https://stackoverflow.com/a/1162847/21294350)) which is related with program, maybe not directly related with lock only.
- p277 why inlining increased the cache miss rate.
  - highly [recommended](https://isocpp.org/wiki/faq/inline-functions#inline-and-perf) answer from [this](https://stackoverflow.com/questions/33705825/how-do-inline-functions-increase-memory-cache-miss-and-why-is-it-bad-compared-to)
    - here says 'cache misses' is that reference too many memory ('span across multiple lines of the memory cache') that caused thrashing (which also may caused by 'increase the size of the binary executable')
- p278
  - 'C program is 8.3 times faster than the interpreted Java' means `1.0` better than `0.12`, while 'Quicksort beats Bubble Sort by a factor of 50' means `0.05` better than `2.41`
- p254 TODO?
- p342
  - 'Simplicity favors regularity' this makes hardware easier to design,see chap 4.
  - 'common RISC-V case fast': better to use PC-relative to decrease number of bits to represent address.
  - 'common variations of instructions': po pseudo instruction
- p345
  - 'Transfer instructions' like `ld,sd`
  - [case/switch unconditional jmp p29,30](https://cs.wellesley.edu/~cs240/f18/slides/x86-control.pdf)
  - 'equal': means equal popularity.
- p303
  -  [local optimizations](https://www.geeksforgeeks.org/code-optimization-in-compiler-design/) mainly based on one assignment (like [Local value numbering](https://en.wikipedia.org/wiki/Value_numbering#Local_value_numbering)),etc.
- p305 TODO 'Flow-insensitive'
- p194
  - 'did need an extra step' because in 'two’s complement' $1+~0(-1)$ just overflow to become 0.
  - ['biased notation'](https://stackoverflow.com/questions/24729320/what-is-biased-notation) is just highly manually designed.
#### chapter 3
- TODO [p394](https://en.wikipedia.org/wiki/Division_algorithm)
- ~~TODO why use `_mm256_broadcast_sd()` p441~~
```bash
C[i][j] C[i+1][j]
```
- p375 [Carry Look-Ahead Adder](https://www.geeksforgeeks.org/carry-look-ahead-adder/)
- p377 more [clear](https://www.massey.ac.nz/~mjjohnso/notes/59304/l5.html)
- p380 may be [(the link show swap and `escape` which the book don't mention)](https://stackoverflow.com/questions/39841223/mips-hardware-multiplication-alu),also [p383](https://electronics.stackexchange.com/questions/56488/parallel-multiplication-hardware?rq=1) also see 'FIGURE 3.6'
```bash
# second method in https://www.massey.ac.nz/~mjjohnso/notes/59304/l5.html inspired by 'Instead of shifting multiplicand to left, shift product to right?' to make 'least significant bits of product ' can be changed
step    multiplier  multiplicand    product
        4           -6
1       00000100    11111010        00000000 00000000
2       00000010    11111010        00000000 00000000
# then left half shift right,
3       00000001    11111010        11111101 00000000
4       00000000    11111010        11111110 10000000
5       00000000    11111010        ...
6       00000000    11111010        ...
7       00000000    11111010        ...
8       00000000    11111010        11111111 11101000
# book second method (i.e. third method of  https://www.massey.ac.nz/~mjjohnso/notes/59304/l5.html)
step    multiplier  multiplicand    product
        4           -6
1       00000100    11111010        00000000 00000100
2       00000010    11111010        00000000 00000010
# then left half shift right,
3       00000001    11111010        11111010 00000001 -(shift right)> 11111101 00000000
4       00000000    11111010        11111110 10000000
5       00000000    11111010        ...
6       00000000    11111010        ...
7       00000000    11111010        ...
8       00000000    11111010        11111111 11101000
```
- booth's [algorithm](https://en.wikipedia.org/wiki/Booth%27s_multiplication_algorithm#How_it_works) may be redundant
```cpp
# https://www.massey.ac.nz/~mjjohnso/notes/59304/l5.html
Example: 2 x 6
m=2,p=6;

  m = 0010
  p = 0000 0110 

0000 0110 0 no-op
0000 0011 0 >> p
# 1110 0011 0 p = p - m
# here should be
1110 0011 0 p = p + -m << 4
# -m = ~m+1

1111 0001 1 >> p
1111 0001 1 no-op
1111 1000 1 >> p
0001 1000 1 p = p + m
0000 1100 0 >> p

=12
```
- p386 more clear [see p189](../references/other_resources/CS422-Computer-Architecture-ComputerOrganizationAndDesign5thEdition2014.pdf), [also](https://sistenix.com/division.html), also 'FIGURE 3.10',
  - when 'Rem < Div', better use 'Rem + (-Div)'
  - FIGURE 3.11 similar to above and because every time quotient is updated by shift one bit
  - [see](https://people.cs.pitt.edu/~cho/cs0447/currentsemester/handouts/lect-ch3p2_4up.pdf)
    - Restoring Division p2, also see https://www.geeksforgeeks.org/restoring-division-algorithm-unsigned-integer/ <a id="geeks"></a>
    - p3 Non-Restoring, see pdf left page 'Left-shifting R by 1 bit and then adding D!'; TODO maybe similar to Booth's Algorithm
    ```bash
    0 0010
    initial values 0000 0111
    shift remainder left by 1 0000 1110
    1 0010
    # here is upper half do minus, so  0000 - 0010 = 1110
    # the left is similar to above '# then left half shift right,'
    remainder = remainder – divisor 1110 1110
    (remainder<0) ⇒ +divisor; shift left; r0=0 0001 1100
    2 0010
    remainder = remainder – divisor 1111 1100
    (remainder<0) ⇒ +divisor; shift left; r0=0 0011 1000
    3 0010
    remainder = remainder – divisor 0001 1000
    (remainder>0) ⇒ shift left; r0=1 shift left; r0=1 0011 000 0011 0001
    4 0010
    remainder = remainder – divisor 0001 0001
    (remainder>0) ⇒ shift left; r0=1 0010 0011
    done 0010 shift “left half of remainder” right by 1 0001 0011
    ``` 
- p395 [jump and link](https://www.sciencedirect.com/topics/computer-science/link-instruction#:~:text=Jump%20and%20link%20(jal)%20and,jumps%20to%20the%20target%20instruction.)
- p399 floating meaning
- p411 algorithm diagram -> p414 hardware block diagram
- p428 [guard digit](https://en.wikipedia.org/wiki/Guard_digit) and [roundoff](https://en.wikipedia.org/wiki/Round-off_error) error
  - p430 [stiky point](https://pages.cs.wisc.edu/~david/courses/cs552/S12/handouts/guardbits.pdf)
- 'FIGURE 3.21' AVX parallel [also](https://redirect.cs.umbc.edu/courses/undergraduate/CMSC411/spring18/park/lectures/L16-ILP-Pipeline-Sched.pdf)([this](http://www.cs.umd.edu/class/fall2022/cmsc411/) use Computer Architecture: A Quantitative Approach)
```cpp
// here will generate
C[i][j] C[i][j+1] ...
A[i][k] A[i][k+1] ...
B[k][j] B[k][j] ...
// A should swap with B
```
- p410 see p204->~~223~~222 in COD5
  - why unnormalized operand [not fast](https://stackoverflow.com/questions/36781881/why-denormalized-floats-are-so-much-slower-than-other-floats-from-hardware-arch) mainly is trade-off of CPU architecture (TODO self design referenced in the link).
- p426 row major vs column major, how to [choose](https://stackoverflow.com/questions/47691785/why-does-julia-uses-column-major-is-it-fast/47734127#comment82352970_47691785) which should be consistent with how to [access](https://cs.stackexchange.com/a/153479), [more](https://comp.lang.fortran.narkive.com/ry8nFrVm/historical-reason-why-fortran-has-chosen-column-major-order)
- p427 [Newton–Raphson division](https://en.wikipedia.org/wiki/Newton%27s_method#Multiplicative_inverses_of_numbers_and_power_series) more [intuitive](https://wethestudy.com/mathematics/newton-raphson-method-how-calculators-work/)
- p448
  - [exceptions or interrupts](https://www.microcontrollertips.com/exceptions-traps-and-interrupts-whats-the-difference-faq/) 
    - this is different from how csapp defined them:
      - 'Exceptions are sometimes called “traps”','Exceptions are a **subset** of **software**-driven interrupts'
- p449
  - design *hardware* intentionally based on instruction *frequency*.
  - `fmul.d` is double (risc-v p450)instead of [single](https://msyksphinz-self.github.io/riscv-isadoc/html/rvfd.html#fmul-d)
#### chapter 4
[differences](https://www.tutorialspoint.com/differences-between-data-paths#:~:text=In%20single%20cycle%2C%20one%20instruction,be%20executed%20at%20a%20time.) among single-cycle,Multiple Cycle, Pipeline. Most of time, the latter two are thought as [same](https://users.cs.utah.edu/~bojnordi/classes/3810/f20/slides/18-cpu.pdf).
- 'FIGURE 4.2' 'FIGURE 4.4'(state element) PC+[4](https://stackoverflow.com/questions/63904609/why-program-counter-in-risc-v-should-be-added-by-4-instead-of-adding-0-or-2) although the book says it use 64-bit
- 'FIGURE 4.7' [slash](https://electronics.stackexchange.com/questions/329358/what-does-a-slash-over-a-line-in-a-circuit-diagram-mean) num meaning
- p493 [immediate generation unit](https://www.reddit.com/r/VHDL/comments/ap00mj/need_help_with_the_immediate_generator_part_of/), which may be used to generate branch target (see 'FIGURE 4.9')
- [SB-format p7](https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture7.pdf) risc-v format <a id="rformat"></a>
- 'FIGURE 4.15,17'
- p543 [latency](http://ece-research.unm.edu/jimp/611/slides/chap3_1.html)
- p545 here 'single-cycle datapath' has no relation with 'Single-cycle, nonpipelined execution' in 'FIGURE 4.25',
- 'FIGURE 4.31' related with later figures 'FIGURE 4.34/41',etc
  - ‘FIGURE 4.36’ although here must use 'address' to read memory, but maybe to be distinct with 'FIGURE 4.38' write, so just split.
- p500 ALUop [implemented p5](https://ece.uwaterloo.ca/~cgebotys/NEW/ECE222/4.Processor.pdf) in `opcode` (different from [this p41](https://passlab.github.io/CSE564/notes/lecture08_RISCV_Impl.pdf))
  - TODO relation with actual instruction [binary](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#add)
  - how related [hardware p12 (based on truth table)](https://cseweb.ucsd.edu/classes/su06/cse141/slides/s06-1cyc_control-1up.pdf) implemented <a id="hardware"></a>
    - the whole [ALU	control](https://cs.wellesley.edu/~cs240/f14/lectures/18-control.pdf)	signals including `NOR`
    - TODO how Function code in p6 above defined
    - [this p4 (COD also says in appendix p1191)](https://ece.uwaterloo.ca/~cgebotys/NEW/ECE222/4.Processor.pdf) how ALU control are encoded, so NOR: `~(a|b)=(~a)&(~b)` <a id="ALU0p"></a>
- 'FIGURE 4.49','FIGURE 4.52 '
- p596 2-bit is still unperfect, although it may deal with the problem listed [here](https://www.youtube.com/watch?v=malQIOtaAuU)
  - why [two (see 'first and last loop iterations')](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/dynamic-branch-prediction/index.html) wrong
    - see book p597 answer 'flipped on prior execution of the last iteration of the loop'
  - more [detailed](https://danluu.com/branch-prediction/) from [here](https://stackoverflow.com/questions/59285260/states-of-a-2-bit-branch-predictor)
  - [when](https://www.geeksforgeeks.org/correlating-branch-prediction/) 2-bit is better than 1-bit (here Correlating Branch Prediction is just Two-level predictor) ([saturating](https://electronics.stackexchange.com/questions/259436/2-bit-saturating-counter) counter)
  > also see [row-column](https://www.researchgate.net/figure/General-structure-of-a-two-level-adaptive-branch-prediction_fig3_220055462)
    - here, 'At location 4': 010 -> the least significant bit means the most recent state (0:not taken), the middle '1' means the one before the most recent is 1 (taken).
    - so LHT (i.e. the below link GHR, local in p11) saves states of branches, and LPT (i.e. PHT, Global in p11) saves prediction for different branch states. 
      > why use instruction as index, see book p598(because this can be done in IF stage)
      - local and global [predictor p11](https://www.inf.ed.ac.uk/teaching/courses/car/Notes/2017-18/lecture05-handling_hazards.pdf) or more [specific](https://en.wikipedia.org/wiki/Branch_predictor#Local_branch_prediction)
        - here 'disadvantage is that the history is diluted by irrelevant', so better use 'two-level adaptive predictor' to filter branch first
         - Tournament Predictor p23
      - branch Target Buffer [BPT p21](https://users.cs.utah.edu/~bojnordi/classes/6810/s18/slides/10-bpred.pdf) is similar as csapp Figure 6.25
- p600
  - [load-use hazard](https://courses.cs.vt.edu/cs2506/Spring2013/Notes/L12.PipelineStalls.pdf) is just RAW in Data hazard 
- p611 
  - [see](http://utenti.dieei.unict.it/users/gascia/COURSES/sist_emb_14_15/download/SE07_Pipeline_Exception.pdf) precise interrupt is just those can be recovered p10 and why may be imprecise p19 
- p614 [multiple issue (see figure, issue both int and fp each time.)](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/multiple-issue-processors-i/index.html) , 
  - detailed see CAAQA p223 & 'Figure 3.19'
    - p226 [reservation station](https://en.wikipedia.org/wiki/Reservation_station) in each 'Functional Units' which may be used to forwarding (i.e. 'rather than waiting for it to be stored in a register and re-read') by 'listens on a Common Data Bus for the operand to become available'
    - issue slot or operation slot related with [ROB](https://en.wikipedia.org/wiki/Re-order_buffer) p215 
- p619 here 'an ALU and a data transfer' still take 'usual hazard detection's in account, see p622 example.
- p623 loop unrolling to decrease nop at least.
- 'FIGURE 4.69'
- p538,630 ‘hide the branch delay’
  - here dalay is not real delay, because the `beq` is changed before `add`, so the delay of `add` is just how the `beq` should do originally.
  - kw: 'automatically arrange','the add instruction before the branch ','moved after the branch'
  - [delay slot](https://en.wikipedia.org/wiki/Delay_slot) 'execute *a pair* of instructions following a branch instruction before the branch takes effect','this instruction will execute *even if* the preceding branch is taken','typical for *assemblers* to *automatically reorder* instructions', so it is just to make ‘the *pipeline* must be full of instructions at all times’，‘Each cycle where a *stall* is inserted is considered one branch delay slot’
    - notice: the main purpose of [`delay slot`](https://stackoverflow.com/questions/15375084/what-is-the-point-of-delay-slots) is not to add stall which doesn't has any influence to pipeline performance. Instead, as the book say, it is to **`reorder`**.
      - 'instead of execute, empty, empty, execute'
    - [example](http://web.cecs.pdx.edu/~zeshan/ece586_lec12_1.pdf)
  - CODv5 p316 <a id="Elaboration274"></a>
    - the [reason](https://www.cise.ufl.edu/~mssz/CompOrg/CDA-pipe.html) for keeping pipeline full (although adding nonsense `nop`): 'while minimizing *set-up* time' which is related with hardware signal transformation and hot/cold code.
    - p323 the delay slot has been almost replaced by ' dynamic prediction'
      - kw: 'loop branch','branch target buffer' because target always same like in loop.
- p631 
  - [see](https://passlab.github.io/CSE564/notes/lecture18_ILP_DynamicMultIssueSpeculationAdvanced.pdf)
    - p29 comparison of Dynamic Scheduling and Speculation
      - [RAW](https://en.wikipedia.org/wiki/Hazard_(computer_architecture)#Read_after_write_(RAW)),etc
    - Speculation detailed p39 (i.e. whether use 'prediction scheme' p597)
- p635 think of energy vs performance, which may also answer csapp why cpu doesn't increase performance when adding cores first time (page location temporarily unfound).
  - [issue width](https://www.eecg.toronto.edu/~moshovos/ACA06/homework/hw3.htm#:~:text=Issue%2Dwidth%20is%20the%20maximum,processor%20can%20search%20for%20ILP.)
  - [Store buffer](https://paulcavallaro.com/blog/x86-tso-a-programmers-model-for-x86-multiprocessors/) (see [comment](https://stackoverflow.com/questions/11105827/what-is-a-store-buffer#comment14639780_11130239) it ‘not always inside CPU’ ) same as [ROB](https://stackoverflow.com/questions/40887592/reorder-buffer-commit) located [~~inside~~](https://stackoverflow.com/questions/11105827/what-is-a-store-buffer) CPU
- p636 [nonblocking caches](https://dl.acm.org/doi/pdf/10.1145/381718.381727) use [MSHR](https://miaochenlu.github.io/2020/10/29/MSHR/) (which is just one **independent** hardware unit and medium to fetch memory)as one method to forwarding
  - store buffer [hardware](http://csg.csail.mit.edu/6.S078/6_S078_2012_www/handouts/lectures/L25-Non-Blocking%20caches.pdf) also [p17](http://csg.csail.mit.edu/6.175/lectures/L15-Caches%20and%20Store%20BuffersRev.pdf)
  - see CAQQA p132
    - multi [bank ’Banking supports simultaneous‘](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/cache-optimizations-iii/index.html) mainly because of store like of array is adjacent.
      - detailed with [example](https://www.anandtech.com/show/3851/everything-you-always-wanted-to-know-about-sdram-memory-but-were-afraid-to-ask/2), 
        - kw: '16K pages';'16,384 rows/bank' 'each row (page)' '1KB x 8 contiguous banks' (here related pages are *condensed together* '')
        - here 1 rank -> 8 ICs ('8 *contiguous* banks' )-> 64 banks ('Each IC contains eight *banks*','*stacked* banks') -> 64\*16,384 rows and 64\*1,024 columns
          - must differentiate 
          > each page of memory is segmented *evenly across Bank n* of each IC for the associated *rank*
          
          > So when we talk about IC density we are referring to eight distinct *stacked* banks and the total memory space therein, whereas when we talk about page space, we are really working with Bank n spread *across the total number of ICs* per rank. In the end *the math comes out the same* (8 ICs versus 8 banks), but conceptually it's a critical *distinction* worth acknowledging if we are to really grasp the ins and outs of memory addressing.

          here banks should more explicily 'IC(contiguous banks)' and $8$ in $8n$ is because that 8 stacked banks in one IC
          > We can now see why the DDR3 core has a *8n*-prefetch (where n refers to the number of *banks* per rank)

          >This is because each bank, of which there are eight for DDR3, fetches no less than 8 bits (1 byte) of data per read request - the equivalent of *one column's worth* of data.

  - renaming function (这里是 '功能' 而不是 函数 ) (also googling ‘renaming function cpu architecture’) based on p566 'The function of each of six control signals'
    - also see ['register alias table' p38](https://courses.cs.washington.edu/courses/cse471/07sp/lectures/Lecture4.pdf)
- (un)conditional branch prediction and (in)direct [relation](https://stackoverflow.com/questions/21787457/branch-target-prediction-in-conjunction-with-branch-prediction) from [this](https://stackoverflow.com/questions/28006386/how-can-unconditional-branches-be-predicted-with-a-2-bit-predictor#comment44493696_28006386)
- p639
  - [Indirect predictor](https://developer.arm.com/documentation/ddi0488/c/BABEHAJJ) 'only provides the address' while hybrid predictor 'predictor still predicts the direction' with True or false ...
    - implementation
      - [bit-level](https://people.engr.tamu.edu/djimenez/pdfs/p27-garza.pdf) p4 
        - [hash](http://meseec.ce.rit.edu/eecc722-fall2001/papers/branch-prediction/4/indir_isca24.pdf)
      - with jump [table](https://llvm.org/devmtg/2017-02-04/Efficient-clustering-of-case-statements-for-indirect-branch-prediction.pdf)
    - related with cpu IBPB & STIBP [1](https://terenceli.github.io/%E6%8A%80%E6%9C%AF/2018/03/07/spectre-mitigation) or [kernel](https://www.kernel.org/doc/Documentation/admin-guide/hw-vuln/spectre.rst)
  - TODO early decode
- p643
  - [Anti-dependency](https://en.wikipedia.org/wiki/Data_dependency#Anti-dependency) 'the ordering of these instructions cannot be changed'
  - [retirement p6](https://www.ece.uvic.ca/~amiralib/courses/p6.pdf) (rrf) stage architecture is just commit also [see](https://en.wikipedia.org/wiki/Register_renaming#Architectural_versus_physical_registers)
  - see CAQQA p286
    - loop stream detection just to directly skip some stages by direct fusion
- p644 
  - Distributed(decentralized) [v.s.](http://lastweek.io/notes/arch/) Centralized Reservation Station
    - here whether centralized is mainly dependent on whether all function units **share** something
  - micro-op is mainly related with ALU ,i.e. functional units.
  - here shows the **whole process of pipeline** more detailed than csapp.
- p646
  :memo: the picture [origin](https://www.bit-tech.net/reviews/tech/cpus/intel-core-i7-nehalem-architecture-dive/5/) from [this](https://stackoverflow.com/questions/4830865/how-many-pipeline-stages-does-the-intel-core-i7-have), 14 stage can also see in agner's doc '7.1 The pipeline in PM' which is similar to Nehalem :'The main stages in the pipeline are:' 
  - Cache [Associativity  ](https://csillustrated.berkeley.edu/PDFs/handouts/cache-3-associativity-handout.pdf) more [detailed](https://en.wikipedia.org/wiki/Cache_placement_policies)
    - see 'multiple sets[1] with a single cache line per set' vs 'a single cache set with multiple cache lines'
    - related with [code](https://en.algorithmica.org/hpc/cpu-cache/associativity/) which csapp not says directly.
      - kw: 'corresponding to **any** of the N total memory' 'to a single cache line' (similar to above  wikipedia examples); 'prohibitively expensive '; 'doesn’t require storing any additional meta-information associated with a cache line **except its tag**' -> only need tag meta-information, 'in-between'
        - kw for why not use $2^{12}$ for step: 'different sets in the L3 cache instead of' 'just love using powers of two when indexing arrays' 'binary shift', 'smallest integer exponent' like 
          $$2^n$$
          'transitivity divisible' ([i.e.](https://math.stackexchange.com/questions/158492/divisibility-is-transitive-a-mid-b-mid-c-rightarrow-a-mid-c) $2^{n}|10^{n}$),'while searching over arrays of size',
          - TODO 'divide-and-conquer algorithm'
      - here L3 cache 8MB is split into two subset, each is '4MB' 'divisible by some large powers of two and map to the same cache line' which should only related with index subbits
      - figure 'Address composition for a 64-entry', here should use 22bit to encode 2^22 byte->4MB because 'Because the main memory is 16kB, we need a minimum of 14' in wikipedia.
        - should use '$2^{12}$ cache *sets*' instead of '$2^{12}$ cache *lines*'
  - [Microcode 'translates machine instructions, state machine data'](https://en.wikipedia.org/wiki/Microcode)
  - memory order [buffer](https://en.wikipedia.org/wiki/Memory_ordering)
    > one valuable doc about [RCsc ordering ‘Release Consistency sequentially consistent’](https://developer.arm.com/documentation/102336/0100/Load-Acquire-and-Store-Release-instructions) <a id="Load-Acquire"></a>
    - 'A safe reordering' to address 'problem of address aliasing' by using local variable which is also said in csapp. Also applies to $f(*a)$ which may change $*b$
    - contains load buffer, Store Address Buffer (SAB) and Store Data Buffer (SDB) [p5](../references/other_resources/COD/references/1903.00446.pdf)
    - recommend this [blog](http://gavinchou.github.io/summary/c++/memory-ordering/) which says all and more like `compare_exchange_strong` about Memory Order.
    - in `c++` always avoid [std::memory_order_consume](https://stackoverflow.com/questions/19609964/how-do-acquire-and-consume-memory-orders-differ-and-when-is-consume-prefe#comment29108991_19609964) because ['// may or may not fire: data does not carry dependency from ptr'](https://en.cppreference.com/w/cpp/atomic/memory_order#Release-Consume_ordering)
      - why have `memory_order_consume`, at least [cheaper](https://stackoverflow.com/questions/55741148/memory-order-consume-usage-in-c11)
      - diff in [code](https://preshing.com/20140709/the-purpose-of-memory_order_consume-in-cpp11/) (this link from [this where also says why not use consume sometimes](https://stackoverflow.com/questions/65336409/what-does-memory-order-consume-really-do)) , consume use pointer to synchronize and acquire use something like *global* variable.
        - acquire and release [definition p3 'Synchronization accesses can further be partitioned '][isca90_GLL_90] 
    - intel reference p3284 only ensure one processor order, not ensure multi, see figure 9-1
  - memory barrier
    - [no needed](https://stackoverflow.com/questions/12183311/difference-in-mfence-and-asm-volatile-memory) in [strong](https://stackoverflow.com/questions/12183311/difference-in-mfence-and-asm-volatile-memory#comment88616281_12204320) memory model. But ['storeload'][Weak_vs_Strong_Memory_Models] still exists.~~So we need~~ This can be solved with store release and load acquire.
      - [x86 p3][sequential_consistency], [TLO p30](https://spcl.inf.ethz.ch/Teaching/2019-dphpc/lectures/lecture4-memory-models.pdf) can be seen [here CAS](https://www.felixcloutier.com/x86/lock.html#:~:text=The%20LOCK%20prefix%20is%20typically,observed%20for%20arbitrarily%20misaligned%20fields.)
    - why use [weak](https://stackoverflow.com/questions/58870009/why-do-weak-memory-models-exist-and-how-is-their-instruction-order-selected) memory model ’big advantage‘
    - [detailed][Weak_vs_Strong_Memory_Models] where says 'a little disagreement over this question'(i.e. ~~definition ~~ classification of strong memory model)
      - here relaxed memory model -> Weak ... allowing all reordering.
      - [loadload][Memory_Barriers] is just means *load after load* can't be reordered. [related][ac_rel] with acquire,etc
        - notice: [Acquire](https://stackoverflow.com/questions/24565540/how-to-understand-acquire-and-release-semantics) means the instruction can *acquire* what is done before. Similarly, Release means *release* what is done, so instruction after can get the result.
        - why StoreLoad 'is often a more *expensive* memory barrier type', maybe other are [redundant](https://stackoverflow.com/questions/27475025/why-is-a-store-load-barrier-considered-expensive#comment71586035_27477887) because *hardware* has ensured. Also [see](https://stackoverflow.com/questions/64131951/why-is-storeload-more-expensive-than-other-barrier-types/76506593#76506593)
        - also [see arm doc](#Load-Acquire), here 'Load-Acquire' is not just one barrier but also function as *load*, see original [definition](https://learn.microsoft.com/en-us/windows/win32/dxtecharts/lockless-programming?redirectedfrom=MSDN#read-acquire-and-write-release-barriers) (which is referenced in the parent link) in c++
          > When your code **acquires ownership** of some memory, either by acquiring a lock or by pulling an item off of a shared linked list (without a lock), there is **always a read involved**

          > When ownership of some memory is *released*, either by releasing a lock or by pushing an item on to a shared linked list, there is always a write involved which *notifies* other threads that the memory is now available to them.

          - So, *acquire* implies the load *first*, so LoadLoad or LoadStore. release is the same way.
          - above definition also explains the above arm doc link. 
  - [dual port](https://en.wikipedia.org/wiki/Alpha_21264#Primary_caches) using 'both the rising and falling edges'
  - [inclusive](https://en.wikipedia.org/wiki/Cache_inclusion_policy) cache ’inclusive of the higher level cache‘, so here is relative with main memory
  - uncore(i.e. not in cpu) [arbiter](https://en.wikipedia.org/wiki/Arbiter_(electronics))
- p649
  - back-to-[back](https://en.wikipedia.org/wiki/Control_unit#Translating_control_units) operation
- p654
  - amd turbo core, how to [test](https://bbs.archlinux.org/viewtopic.php?pid=2103636#p2103636)
  - tips: [check](https://serverfault.com/questions/62316/how-do-i-list-loaded-linux-module-parameter-values) kernel param; 
  - helpful ['ignore_ppc'](https://askubuntu.com/questions/340626/permanently-change-maximum-cpu-frequency) [2](https://lucraymond.net/2022/04/12/unlock-your-ryzen-cpu-on-linux-and-enable-turbo-boost/)
  - maybe not set to [specific freq](https://askubuntu.com/questions/459788/how-to-enable-amd-turbo-core-on-ubuntu-14-04) 'The boost is an autonomous decision' 
    - also from [kernel](https://www.kernel.org/doc/Documentation/cpu-freq/boost.txt) 'Writing a "1" does not explicitly boost the system'
  - also use 'userspace' to [automate](https://stackoverflow.com/questions/61286774/how-to-set-specific-cpu-frequency-when-using-intel-pstate) which needs running script manually.
```bash
# force range to one value
    sudo cpupower frequency-set -u $UPPER
    sudo cpupower frequency-set -d $UPPER
    sudo cpupower frequency-set -f $UPPER
$ sudo cpupower frequency-info
  current policy: frequency should be within 2.90 GHz and 2.90 GHz.
                  The governor "userspace" may decide which speed to use
```
  - check kernel whether [support](https://forum.manjaro.org/t/is-the-amd-pstate-driver-included-in-5-17-rc1-kernel/99978/5) amd_pstate
- p659
  - named fields may be just [bit field](#bit-field).
- p662
notice: `if (IDEXop ...)` just do what EX should do, instead of just storing what ID has done. 
```bash
# view result.
$ num=2;make;vvp build/E4.13.${num}_log.o;gtkwave vcd/log_${num}.vcd vcd/clock_op.sav
```
  - `IDEXrs2 != 0` because write to zero register (in risc-v) is nonsense.
    - `IDEXrsl = EXMEMrd` to ensure register are corresponded and `EXMEMop = ALUop` to ensure write one modified register value (also avoid nonsense like writing one nonmodified value.)
  - notice although here `<=` *nonblocking* is parallel which not ensures running order, with `gtkwave` simulation, order still exists and consistent every time. (if using block, then no parallel)
    - save gtkwave [view setting](http://billauer.co.il/blog/2017/08/linux-vcd-waveform-viewer/)
    - change time scale by 'time->zoom ...' from [official doc](https://gtkwave.sourceforge.net/gtkwave.pdf)
```verilog
  assign IFIDop = IFIDIR[6 : 0];
  assign IDEXop = IDEXIR[6 : 0];
  ...
    IFIDIR <= IMemory[PC>>2];
    ...
    IDEXIR <= IFIDIR;
// IDEXIR is assigned with old IFIDIR in parallel with old IFIDIR assigned with IMemory[PC>>2]
// and `assign` ensure direct change of wire `IFIDop`,etc.
```
  - only diff with p658 in outside assign block, `always` block no changed.
- p665 
see 'FIGURE E4.13.19' 
from [this](https://stackoverflow.com/questions/62117622/mips-pipeline-stalls-sw-after-lw?rq=2) related with my ~~[question](https://stackoverflow.com/questions/76443233/stall-implementation-based-on-forwarding-by-checking-memwb-and-idexop-in-cod)~~ [question](https://electronics.stackexchange.com/questions/670082/), forward to `IFID` may be proper. The first link says 'require forwarding back in time.' because `SD` ALU use `LD` data. Also it says 'Forwarding into the MEM stage'. (Notice: whether to *stall* depends on how *hardware* is designed.) (The second link is based on this [code_2 (i.e. playground_2)](../COD/verilog/E4.13.3_log_simplified_with_nop.v) and this [code_3](../COD/verilog/E4.13.3_mfElnWf_no_stall_cnt.v)) 
  - see this
    - here `(((IDEXop == LD) || (IDEXop == SD)) && (IDEXrs1 == MEMWBrd))` is not duplicate with `(IDEXrs1 == MEMWBrd) && (IDEXrs1 != 0) && (MEMWBop == LD)`
      - because the former is related with `IDEXop` so may include `IDEXop=LD,MEMWBop=ADD`(here forwarding is delayed from `IFIDop=LD,IDEXop=ADD`), which the latter not includes.
  - why use stall when already having `forwarding`,p532 (because two cycle lag causes the IDEX has fetched the old reg withou)
    - also [see](https://en.wikipedia.org/wiki/Classic_RISC_pipeline#Solution_B._Pipeline_interlock) 
  - see `E4.13.3_ms_log.v`, here, although how many bubble/stall, the address of `sd` directly after `ld` which is calculated in **`IDEXop`** will not change, because it is **register** instead of **wire**.
    - above can be seen in vcd, some notices: 1. when `EXMEMop == SD`, the `EXMEMALUOut` is calculated from last **`IDEXop`** cycle(i.e the cycle just before `EXMEMop`) 2. 
  - `ld,sd,ld,sd...` (ld `rd` equals to sd `rs1`)
    - here, the situation that `stall` uprise when `ld` occurs will maybe make `sd` write to wrong location, so need `wire` directly forward, instead of `reg` which has at least one cycle delay.
    - in `IDEXop`, wire like `Ain` ensures forwarding without delay.
      - in `EXMEMop`, only register value (not memory) will be influenced only by the current `MEMWBop`. Therefore, only `EXMEMALUOut` and `EXMEMB` will be influenced.
    - see `E4.13.3_mfEXMEM_log.v`. (here only change `EXMEMALUOut` to wire `WB_fw`，`EXMEMB` is similar).
      ```bash
      $ num=3_mfEXMEM;make;vvp build/E4.13.${num}_log.o;gtkwave vcd/log_${num}.vcd vcd/clock_op.sav
      ...
      EXMEMALUOut:1100 load from 3th mem value 11, imm:100
      # here offset step set as 4.
      WB_fw:111, stall_cnt: 1 # here binary 111=100(4)+11(3), right calc.
      IFIDrs2:30
      finish store, cnt: 4,cycle: 9,EXMEMB 11110000 store to 1th mem,EXMEMALUOut: 1100 # store to 111>>2=1, right
      # can see from gtkwave Dmem[1] has been written after the `EXMEMop` when 'stall'
      ```
      - here init: `DMemory[i] = i;` ; `Regs[i] = i*8;`
      - notice: here `WB_fw` is wrong and also not easy to synthesis, because `Ain` will always change (by `assign`). So sometimes, it must use the wrong `Ain`. see `1867902` git log hash, the 3rd and 4th rising edge. Here `Ain` in 4th instruction fetch cycle will be assigned `IDEXA` which is `<=` in the former cycle by `nop` instruction.
        - `stall_cnt` make stall longer, which may update `WB_fw`.
    - how csapp solve the above problem
      - p470, by many stall, from decode (where will add detection which is *same* as above ’IDEXrs1‘).
      - p472&473, detect when MEMWB and EXMEM
      - p474, change when *decode* (i.e. `IFID`) which is different from COD.
      - p477, just *same* as above situation `ld,sd...`
        - p478, use one stall *same* as COD, 
          - difference: 
            1. csapp forward to *`IFID`* (which can ensure update of register is always new. po I think this is the *main reason* why csapp will work.) when generating tmp register value instead of forwarding to `IDEX` which may be *too late*. <a id="IFID_forward"></a>
               1. So csapp also check `IDEXrd`  
               2. above COD `ld,sd...` fails because it ~~stalls after running `IFID`~~ runs `IDEX` of `sd` and `EXMEM` of `ld` meanwhile, so update of `ld` won't influence `sd` at all although having forwarding,
                  1. except that like in `3_mfEXMEM_log.v` using `WB_fw` to directly forward to `EXMEMop` of `sd`...
            2. ~~also it check adjacent cycle instead of bypassing one cycle(i.e. instead of checking IDEXrs1)~~
      - p479, no needed to be considered in risc-v because risc-v has *return register* (most RISC has it)
      - p491 conclusion of when to use stall.
      - p492,494 the fetch stage stalls, just meaning it is unchanged which can be viewed conveniently in *`gtkwave`*.
        - ' injecting *bubbles* into the *memory* stage and *stalling* the excepting instruction in the write-back stage', notice here differences between bubble and stalling.
      - p493 *’stalling the write-back* stage when it has an excepting instruction‘, this can be done based on ROB and Retirement Unit.
      - p494 TODO how COD implements about condition code with exception.
      - p495 so COD ~~use bubble when stalling~~ use bubble instead of stalling (p496 'an *error* to set *both* the bubble and the stall signals to 1', po `bubble` is stronger than `stalling`) ~~which is weird, because ~~
        - p496 so Mispredicted branch only bubble no stall to save resources. (see COD verilog code, NOP nothing done, also can be seen from doc.)
      - p496 'blocks of combinational logic' which can be seen from COD `assign ... = ?:?:...` (here signal is just `wire` in verilog).
        here arrow in figure is same as `<=` in verilog and *'pass along IR'* (this ensures the instruction will propogate through the pipeline) in COD. 
        - ret -> p492, fetch `stall` no big influence, even no influence (i.e. no need to read memory) if with ~~memory ~~ cache in the cpu.
          - from COD, the bubble will make all ~~subsequent~~ instructions ~~of~~ running after bubbled instruction ~~cancelled~~ (i.e. here is `F` for `D` in `ret`, ) unchanged (not consuming computer resources).
          - here stall next instruction instead of bubble (i.e. drop) maybe because ret target is just next instruction. <a id="target"></a>
        - `Load/use hazard` stall at `D` because `D` use register which load will maybe update.
          - po here stall to still run repeated instructions maybe to make *cache* updated to date.
          - (p478) the `D` stalled cause `E` bubbled.
            - although in COD where `bubble` in `EXMEMop` of `sd` seems to cause `stall` of subsequent `ld,sd` (see in `E4.13.3_mfEXMEM_log.v`).
        - `Mispredicted branch`: just all bubble (corresponds to cycle 5 of p480)
          - compared with `ret` where no new instruction fetched, here will fetch the correct branch.
      - p498
        - here `bubble+stall` -> `stall` to avoid `use hazard` if [1](#target).
      - p506
        - TODO whether cache miss stall in COD
    - has updated `bypassAfromLDinMEM` which can directly forward memwrite in `EXMEMop` to Ain in `IDEXop`, which can solve `ld,sd,ld`.
      - here must use stall. if `ld,sd,nop,ld` then when the fourth ld run `IFID`, it will read reg which is meanwhile updated by the first `ld` in `MEMWBop`.
        - So recommend [1](#IFID_forward)
          - maybe using something liek `bypassAfromLDinMEM` similarly to forward to `IFID`.
        - ~~this is also why COD book use `stall`, because `MEMWB` write to reg `Regs[MEMWBrd]` which will not directly influence `Ain` because it is influenced by reg with ``~~
- p666
  - here bypass is same as data hazard does,like using former substract result,see p591.
- p669
  - [synthesizable](https://www.jameswhanlon.com/writing-synthesizable-verilog.html) Verilog
    - kw
      - ‘the specification of *Verilog does not specify* which features are synthesizable; that depends on the *tooling* used.’, 'Many of the observations in this note relate to coding style.','closed-source software by companies like *Cadence*, Synopsis and Mentor','there is no standard synthesizable subset...','sticking to a *lowest common denominator* of the language features','makes the control flow structure *clearer*','*parallelism* should be exposed where ever possible','separate the logic for each condition into *separate parallel processes*'，'*infer* a dependence between two signals’,'*no timing* controls and only one event control)','non-blocking assignments, <=','particularly between simulation and synthesis'
      - 'presumably because they apply *conservative* rules'
      - 'blocks only from a logic signal name': use 'a logical expression' in `always_comb` and `always_ff` just use variable directly ('must have a *reset* condition of a constant value'), 'clock gates are used'
        - logic is [2-state](https://www.verilogpro.com/verilog-reg-verilog-wire-systemverilog-logic/)
      - `sum_t'(a + b)` : `sum_t` is bit-width. 
      - carry out 'Using a prefix like unused_' (here `unused_` is used to store carry out bit).
    - [`.*`](https://stackoverflow.com/questions/58436253/in-systemverilog-what-does-mean)
    - TODO: 'formal analysis/model checking,...','rather than using *two mechanisms* to achieve the same effect', why '4'b000?,'-> 'STATUS_ERROR', ~~(a+b) meaning in 'sum_t'(a + b)',~~ 'particularly with multipliers','generate an optimised adder implementation for the given set','*complexity* of a block','unnamed scope'，'Avoid logic in module instantiations.' vs 'named signals','the extension of operands as inputs to binary operations'
    - wave viewer: 'common prefixes for related signals, *sorting*'
    - coding [tips p25('– Ignoring “unoptimizable” warnings can drop performance by 2x'),32,35(TODO graph Optimizations)](https://www.veripool.org/papers/verilator_philips_internals.pdf)
      - 'they associate left to right','always *bracket* the condition'
    - 'Drive one signal per block.' which implies why book code is not synthesizable because it has only one always block.
    - miscs
      - [always_...](https://www.verilogpro.com/systemverilog-always_comb-always_ff/), 'sensitive to changes within the contents of a function','cannot be written by other processes', (TODO 'flip-flop logic'),'no blocking timing controls' <a id="always_comb"></a>
      - [one-hot](https://www.quora.com/What-is-case-1b1-in-Verilog)
      - case [inside](http://www.cjdrake.com/verilog-case-inside-statement.html) to use some features
    - recommended [course](https://ocw.mit.edu/courses/6-884-complex-digital-systems-spring-2005/pages/related-resources/)
  - p670
    - `PCdatasrc`: used in branch
    - `ALUBinput`: `PC+4`->`64'd4` (also see how 'RISCVALU ALU' implemented),`B` just normally used in R-format
      - `ALUAin` unchanged after assigning reg, because ALU at least use one reg.
        - by `registerfile`, `B`(Data2) is `IR[24:20]`(RF[Read2]) and `A` is `IR[19 : 15]` which is only unused in U-format where ALU not used.(while UJ-format will use~~. TODO, so ALU may be wrong.~~ which will checked by `ALUSrcA`).
    - `MemOut` is used to read instruction memory.
  - non-synthesizable [example](https://nandland.com/lesson-6-synthesizable-vs-non-synthesizable-code/) TODO 'Loops do NOT behave the same way'
  - [testbench](https://verilogguide.readthedocs.io/en/latest/verilog/testbench.html), 'used by other softwares for further analysis','simulation purpose only (not for synthesis)','ports of the testbench is always empty','it is very easy to look for errors in the terminal/csv file as *compare* to finding it in the waveforms',
- p671
  - the [datapath](https://www.cs.fsu.edu/~zwang/files/cda3101/Fall2017/Lecture8_cda3101.pdf) is just data passed among these stages, control are just these wire signals(see above link p54).
  - see p69
- p674
  - it needs add 'reset' to 'synthesize' the 'Initial statements',
  - reset `R0` by influencing read and write of register instead of assigning register value every clock.
- p675
  - here 'fold' means 'translate' instead of 'transform'. So the control line implementation in 'FIGURE E4.13.7' is just Mealy-style, not [Moore-style](https://en.wikipedia.org/wiki/Moore_machine).
- p676
  - [single-clock-cycle and multiple-clock-cycle](https://www.geeksforgeeks.org/differences-between-single-cycle-and-multiple-cycle-datapath/) where they mainly differs in *CPI*
    - see [this](http://ece-research.unm.edu/jimp/611/slides/chap3_6.html) better
      - view this stackoverflow [Q&A](https://stackoverflow.com/posts/76450114/timeline?filter=NoVoteDetail)
        - ['structural hazards'](https://en.wikipedia.org/wiki/Hazard_(computer_architecture)#Structural_hazards) so ‘divide unit’ is taken account because 1. It isn't pipelined 2. It has only one  divider ALU
        - 'WAW hazards' -> A1, ..., A4, Divide, or M1, ...,M7 for the **same** destination register (here kw is same destination not 'Divide').
        - '*after* the earlier instruction reaches the MEM phase' to ensure the 'earlier' first write.
        - ['The instructions in the pipeline'](https://stackoverflow.com/posts/76450114/timeline#history_b38eedbd-f2e9-4e53-814a-e73c71df3158) should implies the registers related with them are also saved.
        - 'there are no such reads' may be one optimization of cpu to avoid unnecessary computation.
        - ['unmasked'](https://dev.opencascade.org/content/should-floating-point-exceptions-be-masked) is to enable exception ('By default ...,all FP exceptions are masked'). <a id="mask"></a>
        - 'part-way through' and 'maybe NOP-out every other pipeline' based on power saving (which one of forwarding and nop saves power). 
        - [DLX](https://en.wikipedia.org/wiki/DLX)
      - Integer ALU latency is 0, because it can be directly forwarded from EX. Data memory latency is 1 because it needs one more *pipeline* `MEM` to read memory (so the *Initiation Interval* isn't influenced).
        - so in 'FP and integer divide' which isn't pipelined, `Initiation Interval` is `Latency` plus 1 (which is based on how `Latency` defined.)
      - kw: 'structural hazard','variable *length instructions*' (here length means the pipeline length not the instruction bits),
      - to solve 'exception', instructions completed *in the order* in which they were *issued* (which is also said in csapp). Otherwise, the result behavior may be undefined.
      - 'RAW hazards:'
        - the former instruction stall will obviously cause the latter stall, or even bubble to nop instruction.
        - 'MULTD *stalls* due to load latency.' which can be avoided by renaming, also applies to other stall.  
      - 'Not worth it since steady state usage is close to 1.' means that always one port instead of multiple.
        - 'Serialize the writes': finish the write in order.
      - 'shift register', po this can make the register write is in order, using ['Serial-In Parallel-Out Shift Register (SIPO)'](https://www.geeksforgeeks.org/shift-registers-in-digital-logic/)(notice to add signals related with `write` and `read` to these registers) 
        - here still needs stall, because the `Serial-In`.
      - 'see slide 8' -> the eighth occurence of 'Multi-Cycle Pipeline Operations'
        - ‘this is ONLY a hazard’, the 'ONLY' means the number is only one.
          - 'without any instruction ever using it' -> is in contrast to the following 'there was a use between ADDD and LD' (here LD can be anything other that use ADDD result which will be propogated to be wrong if `ADDD` result is wrong.)
          - 'RAW hazard would stall' (WAW can also stall, here based on that `RAW` priority is higher than `WAW` input.)
            - here with WAW, `LD` has no influence to `ADDD` because it has used the former forwarding register value and finished the calculation of the value to store in `EX` stage. But it will maybe influence the instruction after the `LD`.
      - TODO 
        - 'the earlier instruction reaches the MEM phase.' 1. 'the earlier instruction' refers to `MUL`? 2. 'reaches the MEM' means finish the MEM? 3.'Cancel the WB phase of the earlier instruction.' , So not WB?
        - 'Check for structural hazards .' because 'The divide unit.' latency not fixed? So 'in A1, ..., A4, Divide, or M1, ...,M7'?
      - 'two register files' -> one for int, one for floating.
      - [continued chap3_7](http://ece-research.unm.edu/jimp/611/slides/chap3_7.html)
        - 'Ignore the problem' for long FP calculation.
        - Handling exceptions, po this can be implemented in retirement unit with additional care. just the 'second solution', see 'the *difference* in running *time* among operations is large.' 
          - 'have enough *entries* for *one register* modification' -> maybe modified multiple times.
          - [VAX](https://en.wikipedia.org/wiki/VAX) [autoincrement](http://odl.sysworks.biz/disk$axpdocdec001/opsys/vmsos721/4515/4515pro_004.html)
          - 'the precise values for the interrupted state.' see [p13](https://course.ece.cmu.edu/~ece447/s15/lib/exe/fetch.php?media=onur-447-spring15-lecture11-precise-exceptions-afterlecture.pdf), TODO 'The instructions in the pipeline and the corresponding PCs must be saved.' diff with 2
          - ~~TODO '*Technique* is used in the SPARC architecture.'~~
    - ~~po the former is sequential and the latter is pipelined. also see [this link](#bypassing)~~
  - bypassing means [*same*](https://courses.engr.illinois.edu/cs232/sp2009/section/Discussion7/disc7.pdf) as forwarding <a id="bypassing"></a>
- p680
  - notice 'FIGURE E4.13.9' 'shift left 1' to implement `PCOffset` 
    - ~~TODO how to deal with the non-blocking delay,~~ although in `ALUBinput`, the `<=` make that `PCOffset` and `ImmGen` can be only chosen *one*, from the circuit, the `PCOffset` is obviously generated from `ImmGen` which has no influence with delay to the pipeline because the `ALUBinput` should be calculated to generate the input of `ALUSrcB` (i.e. `ALUBin`) before `ALU`.
      - the main reason is that the verilog code has only *one* `ALU` module instance while the real hardware has two. 
  - the `zero` of the bottom `ALU` should be connected to above `ALU` output to function as `PCWriteCond` which shows whether to use branch address.
- p686
  - 'FIGURE E4.13.12' ~~TODO what '8' destination register at the bottom means ?~~
- p684
  - risc-v [instruction encoding](https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture12.pdf) p14. also see risc-v doc p18 'The right shift type is encoded in bit 30'.
  - ~~TODO~~ 'control values' see p509 'FIGURE 4.18' (here the 'Figures e' just is 'Figures')
    - The `EX` use `ALU...`. Others see figure. [hardware](#hardware)
      - `M` use `Mem...,branch`
- p686
  - notice `branch` control value
- p693
  - notice the grey of 'x2' in the second figure first ALU
  - here all data related with `reg` including `rd` and `RegWrite` in MEM and WB, two regsrc num in EX are passed to Forwarding unit.
    - notice two mux before ALU.
  - 'FIGURE E4.13.17' here not adds the *memory* data to reg forwarding.
- p697
  - the `rd` at the bottom and `rc` '2' highlighted as blue ~~detects~~ implies the hazard.
- p699
  - the 'bubble' doesn't drop instruction.
  - notice clock 5 forwards the mem data of `ld` to `add`.
- p702
  - the book maybe has *many errors*... 'despite its being reviewed by more than 100 people and being class-tested at 18 universities'
  - delayed branch [see](#Elaboration274) in CODv5 p255
- p703
  - 'Addressing modes that update registers': [Auto Indexed (increment mode)](https://www.geeksforgeeks.org/addressing-modes/), here `(R2)+` means plus after loading, `-(R2)` similarly before loading.
- p704
  - *increase* in effective latency
    - Multi-cycle clock period calculation [p2](https://www.eng.auburn.edu/~uguin/teaching/E6200_Spring_2017/hw/Solutions/hw2_DP_Control.pdf) related with [critical path p6](https://syssec.ethz.ch/content/dam/ethz/special-interest/infk/inst-infsec/system-security-group-dam/education/Digitaltechnik_14/21_Architecture_MultiCycle.pdf)
    - [overhead](https://acg.cis.upenn.edu/milom/cis371-Spring09/lectures/05_pipeline.pdf) of pipeline where also says detailedly about differences among single-cycle, multiple-cycle and pipeline.
      - p2 TODO 11ns?
        - multiple-cycle
      - p3 here Base CPI is about stage, not instruction.
      - overhead from p3 stall, p7 hazard ...(p7 calculation)
      - p12 *CPI* is related with hardware if stall is executed by hardware.
  - 'reducing clock cycles per instruction' is based on average time calculation, not every instruction speedup.
- p705
  - ['Scheduling'](https://en.wikipedia.org/wiki/Instruction_scheduling)
    - [illegal](https://www.intel.com/content/www/us/en/docs/programmable/683836/current/illegal-instruction.html) operation
    - by searching 'cpu instruction ambiguous operation', semantically [ambiguous](https://en.wikipedia.org/wiki/Memory_disambiguation) operations which is one data hazard.
  - Software mainly refers to compiler. 
    - speculation can at least done by removing like somthing `if(AlwaysKnown){...}`.
- p706
  - `unroll` not only removes the overhead of checking condition in loop, but also trick the cpu to try multiple-issue, out-of-order(related with 'Scheduling') (p650)
    ~~- because the branch delay slot is always unused ()~~
  - [sequential programming](https://www.intel.com/content/www/us/en/docs/programmable/683546/current/sequential-programming.html) model is just what it literally means. 
##### reorder buffer ROB [1 https://courses.cs.washington.edu/courses/cse471/07sp/lectures/Lecture4.pdf](../references/other_resources/COD/references/Lecture4.pdf)
> recommend see [CAQQA](../references/other_resources/CAAQA/Computer_Architecture_Sixth_Edition_A_Qu.pdf) used by many courses including [this](https://papaef.github.io/hy425/2022f/) which has more extensive and intuitive infos although web and also the author says it is more difficult.
- 1
  - p3 see [2 https://cs.colby.edu/courses/F17/cs232/notes/outlines27.pdf]() 
  - TODO read after p15
- Tomasulo with Common Data Bus (CDB) [vs https://www.cse.iitk.ac.in/users/biswap/CS422-2020/L9.pdf](../references/other_resources/COD/references/L9.pdf) Scoreboarding
  > also see example [1](https://cseweb.ucsd.edu//classes/wi08/cse240a/ilp2.pdf)
  - p37 'over Common Data Bus that broadcasts results to all FUs', so can run in parallel which the latter can't -> can [decentralized](https://courses.cs.washington.edu/courses/csep548/00sp/lectures/class3/tsld035.htm) with Function Units
  - p7 Rj [meaning p3 (may be wrong based on following wikipedia link)](https://web.njit.edu/~sohna/cs650/lec4-2.pdf) `Rj = Yes` [means (here also says 'RAW' solve by Scoreboarding in ‘Read operands’)](https://en.wikipedia.org/wiki/Scoreboarding) 'ready for and are not yet read.'~~not avialable (see p12 vs p11)~~. ~~however,p15 load F2 means **not available**, while mul says `rj` is no which means **available** ~~
    - so cycle 1,2 `Rk=Yes`, cycle 3 `Rk=No` because has been read; cycle 6 `Rj=No` because not ready for.
- Dynamic instruction scheduling [overlook](../references/other_resources/COD/references/HY425_L8_ReorderBuffer.pdf) https://www.csd.uoc.gr/~hy425/2020f/lectures/HY425_L8_ReorderBuffer.pdf
  - also known as [Superscalar](http://thebeardsage.com/multiple-issue-processors/) [1](https://en.wikipedia.org/wiki/Superscalar_processor) <a id="scheduling"></a>
  - see p5,14
- ROB [structure p25](https://www.csd.uoc.gr/~hy425/2020f/lectures/HY425_L8_ReorderBuffer.pdf)
  - also see [1](https://decodezp.github.io/2019/04/06/quickwords24-skylake-pipeline-8/) [2](https://github.com/drharris/cs6290-notes/blob/master/reorder-buffer.md) [video in 2](https://www.youtube.com/watch?v=0w6lXz71eJ8)
- also see  ROB in [Apple](https://news.ycombinator.com/item?id=25163883)
###### diff with store buffer
- CAQQA p230,242,247(relation with reorder buffer)
  - notice the design may be different slightly between amd and intel, also different microarchitecture.
  - [RAT design](../references/other_resources/COD/references/pipeline/xiao2013_RAT.pdf) with 'global checkpoints' for *recovery* (It may be same as ["RAT (Resource Allocation Table)"](https://easyperf.net/blog/2018/12/29/Understanding-IDQ_UOPS_NOT_DELIVERED) from [this (also says other like IDQ)](https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(client)#Renaming_.26_Allocation))
  - TODO 
    - RAT hardware design [1](https://compas.cs.stonybrook.edu/~nhonarmand/courses/sp16/cse502/slides/08-superscalar_ooo.pdf) (this [better](https://www.eecg.utoronto.ca/~veneris/10tvlsi.pdf))or more [abstract](https://www.eecg.utoronto.ca/~veneris/10tvlsi.pdf)
    - [CAM](https://en.wikipedia.org/wiki/Content-addressable_memory) is faster than RAM with `SL`, [also](https://www.geeksforgeeks.org/difference-between-random-access-memory-ram-and-content-addressable-memory-cam/) <a id="CAM"></a>
#### chapter 5
- p749
  - [Stream](https://www.cs.virginia.edu/stream/ref.html) benchmark is based on 'specifically designed to work with datasets *much larger than* the available cache'
- p758
  - cache prediction just to prefetch whic then results in less cache miss. <a id="prefetch"></a>
    - [hardware](https://en.wikipedia.org/wiki/Cache_prefetching#Methods_of_hardware_prefetching) 
      - Stream buffers which is fixed size with *contiguous* locations.
      - Strided prefetching which is at least not *contiguous* (Regular) and with variable step (Irregular) or targeted to specific subsets (Temporal)
      - 'synergistically'
    - [software](https://en.wikipedia.org/wiki/Cache_prefetching#Methods_of_hardware_prefetching) 
      - here fetching is based on *cache miss penalty* where *only* make the first 'stride' are missed.
      - only applied in ['regular'](https://en.wikipedia.org/wiki/Cache_prefetching#Comparison_of_hardware_and_software_prefetching) access.
        - 'less CPU overhead'
    - DDR generation [differences](https://eu.crucial.com/articles/about-memory/difference-among-ddr2-ddr3-ddr4-and-ddr5-memory) are mainly about *prefetch* 
      - except for DDR4 use [Bank *Group*](https://www.synopsys.com/designware-ip/technical-bulletin/ddr4-bank-groups.html) (from DDR1, it has [banks](https://www.mouser.cn/new/zentel/zentel-ddr1-sdram/?_gl=1*4u7g04*_ga*dW5kZWZpbmVk*_ga_15W4STQT4T*dW5kZWZpbmVk*_ga_1KQLCYKRX3*dW5kZWZpbmVk)) to offer 'another *independent* bank group', better implementing ['*time* division multiplex'.](https://www.geeksforgeeks.org/frequency-division-and-time-division-multiplexing/)
      - here DDR can also use [dual channel mode](https://www.compuram.de/blog/en/single-dual-and-multi-channel-memory-modes/) ['double the memory bandwidth'](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture#Performance) which can be seen [here](https://www.hardwaretimes.com/single-channel-vs-dual-channel-ram-which-one-is-better-for-gaming/)
        - notice the differences between *slot* and channel.
- p767
  - [early restart](http://thebeardsage.com/cache-optimization-critical-word-first-and-early-restart/) (better see what book said)
    - [byte-addressable/byte addressing](https://pages.cs.wisc.edu/~markhill/cs354/Fall2008/notes/addressibility.html#:~:text=The%20x86%20Intel%20architecture%20is%20also%20byte%20addressable.&text=If%20we%20have%20an%20integer,done%20by%20numbering%20the%20bits.&text=This%20is%20called%20little%20endian%20numbering%20(of%20bits).) 'the *processor* can read is in units of words', also see [CAM](#CAM).
    - 'Critical Word First' based on 'Early Restart' ('resumes execution *before* the entire cache block is loaded') that 'This missing critical word is first fetched'.
- p769
  - [why do we need *reading* from memory when write-miss occurs?](https://stackoverflow.com/questions/76457048/why-do-we-need-reading-from-memory-when-write-miss-occurs)
    - because the transfer unit (cache block size) may be bigger than what is to be written. So if write to memory one *block* (min transfer unit), the other *unwritten* bytes are also transferred. The *read* is  just to ensure other *unwritten* bytes are consistent between cache and lower memory.
      - see p771 'may be unnecessary'.
- p771
  - page [diff](https://www.geeksforgeeks.org/difference-between-page-and-block-in-operating-system/) block
  - kw: 'before we knew' so decrease miss penalty somewhat; ' cannot *overwrite*' 'a cycle to check for a hit';
  - 'write-back buffer' is just ['victim buffer' ('dirty evicted lines')](https://en.wikipedia.org/wiki/Write_buffer)
  - 'Assuming another miss does not occur *immediately*' to ensure the reading won't be interrupted.
- p774
  - here word size [('the number of bits processed by a computer's CPU')](https://stackoverflow.com/questions/19821103/what-does-it-mean-by-word-size-in-computer#comment86797295_19821177) may be not same as intel doc says because [this](https://stackoverflow.com/questions/19821103/what-does-it-mean-by-word-size-in-computer#comment86797295_19821177).
  - [conflict miss vs capacity miss](https://stackoverflow.com/questions/33314115/whats-the-difference-between-conflict-miss-and-capacity-miss)
    - 'conflict' because map to same block ('map to the same sets'), 'capacity' because not big enough to 'fit in that cache'.
    - ['set skewing'](https://static.aminer.org/pdf/PDF/000/419/445/a_case_for_two_way_skewed_associative_caches.pdf), see [highlighting](../references/other_resources/COD/references/a_case_for_two_way_skewed_associative_caches.pdf)
      - p6 here X-way -> X-bank,
      - also see p776 [interleaving](https://en.wikipedia.org/wiki/Interleaved_memory)
      - TODO see [math](../references/other_resources/COD/references/Skewed-associative_Caches.pdf)
  - obviously, 'Combined cache miss rate' won't be much better than 'Split cache effective miss rate' because it only ~~avoids~~ use the very low possibility that instruction cache has the same address as data cache and with other defects.
- p776
  - [Burst mode](https://en.wikipedia.org/wiki/Burst_mode_(computing)), 'the total initial latency is decreased' because 'caused only *once* in burst mode'. <a id="Burst_mode"></a>
  - [comparison](https://www.geeksforgeeks.org/modes-of-dma-transfer/)
    - IO -(DMA request)> DMA -(HOLD signal)> CPU -(shares two basic information, *then* HLDACK)> DMA -(DMA ACK)> IO device
      - is still controlled by CPU. But 'without the involvement of CPU *during data transfer*'.
        - po normally non-DMA pass the cpu and cached there in something like L1 cache.
      - also [see](#DMA) 'without the involvement of the CPU, *providing* (if) memory address and control signals as required'
    - Burst: CPU will be *blocked*, 'at once'
    - Cycle Stealing Mode: when 'preparing the data', the transfer is interrupted, so slower.
    - Interleaving Mode: 'CPU will not be blocked', lowest.
    - TODO how 'Percentage of Time CPU remains blocked' is calculated.
- p778
  - write-back still use the [write buffer](https://www.quora.com/What-is-the-role-of-the-write-buffer-in-a-write-back-cache).
- p791
  - here only one bit used because [(TODO) state](https://stackoverflow.com/questions/23448528/how-is-an-lru-cache-implemented-in-a-cpu)
    - LRU see p831 [also](#reference_bit)
  - TODO Radix sort
- p799
  - show why use column order sometimes.
  - $2N^{3}$ is for A and B, $N^2$ for C.
- p800
  - TODO here sum of A and B should be $2*(\frac{n}{BLOCKSIZE})^{3}*BLOCKSIZE^2=2*\frac{n^3}{BLOCKSIZE}$, C should be $(\frac{n}{BLOCKSIZE})^{3}*BLOCKSIZE^3=n^3$
- p801
  - global/local miss rate are all [relative](https://stackoverflow.com/questions/34215343/is-local-miss-rate-equivalent-to-the-global-miss-rate-for-the-lowest-level-of-a)
- p802
  - [autotuning](https://ieeexplore.ieee.org/document/8425539)
- p804
  - ' The higher costs make large fully associative caches' ['because of the output multiplexer and additional comparators'('Sarah L. Harris, David Harris, in')](https://www.sciencedirect.com/topics/computer-science/set-associative-cache#:~:text=Set%20associative%20caches%20generally%20have,output%20multiplexer%20and%20additional%20comparators.)
- p805
  - 'Service accomplishment' just means service (e.g. disk in 'MTTF vs. AFR of Disks') work well
  - 'Service interruption' is the opposite of above.
  - See this [image](https://www.researchgate.net/figure/A-schematic-diagram-of-MTTF-MTTR-and-MTBF_fig5_334205633)
- p808
  - how hamming code [encoded](https://www.geeksforgeeks.org/hamming-code-in-computer-network/), also see [mem_appendix] 
  - ~~TODO is it coincidence that $0110=6$ which is wrong bit.~~ also [see](https://www.tutorialspoint.com/hamming-code-for-single-error-correction-double-error-detection)
    - see [this](https://en.wikipedia.org/wiki/Parity_bit#Error_detection), why hamming code can detect one error bit *location*.
    - or book 'should always be even'.
  - [wikipedia](https://en.wikipedia.org/wiki/Hamming_code#)
    - TODO 
      - 'perfect codes','Parity-check matrix ... shortened Hadamard code','Hamming distance of four','double-error detecting'
      - 'but also which bit caused the error.'
      - 'error syndrome'
    - 'grew increasingly frustrated with having to restart his programs from scratch','Damn it, if the machine can detect an error, why can't it locate the position of the error and correct it?' :)
    - [Two-out-of-five code](https://en.wikipedia.org/wiki/Hamming_code#Two-out-of-five_code)
      - ten because $C_{2}^{5}=10$, this is high school knowledge...
      - like parity bit, 'can detect ... all odd numbered bit-errors', also [unidirectional error](https://en.wikipedia.org/wiki/Two-out-of-five_code#)
    - ['code rate'](https://en.wikipedia.org/wiki/Code_rate) is same as rate in [this](https://en.wikipedia.org/wiki/Hamming_code#)
    - kw: 'flipping two or more bits','a distance of','In general','two problems at once','parity bits *overlap*','the index of the *corrupted* bit',
    - how `[8,4]` check [2-bit error (see 'The (8,4) Extended Hamming Code')](https://www.ece.unb.ca/tervo/ece4253/hamming.shtml#:~:text=The%20(8%2C4)%20Extended%20Hamming%20Code&text=Having%20distance%20(d%3D4),parity%20check%20(P)%20passes.)
    - block code in `[7,4] Hamming code` is just the [mapping](https://en.wikipedia.org/wiki/Block_code#The_block_code_and_its_parameters) from set 4 to set *7*.
    - the [generator](https://en.wikipedia.org/wiki/Hamming_code#Encoding) may be better viewed with the ['This general rule'](https://en.wikipedia.org/wiki/Hamming_code#General_algorithm)
    - TODO view more detailedly after 'Hamming codes with additional parity (SECDED)'
      - [codeword](http://www.ee.unb.ca/cgi-bin/tervo/hamming.pl?X=+Generate+&L=7&D=4&T=0000000)
    - here $-A^{{\text{T}}}$ in ${\mathbf  {G}}:={\begin{pmatrix}{\begin{array}{c|c}I_{k}&-A^{{\text{T}}}\\\end{array}}\end{pmatrix}}$ do not means negation because ['underlying field is 2' (here need knows basic understanding of *block matrix*), so $P+P=2P=\vec{0}$](https://en.wikipedia.org/wiki/Parity-check_matrix)
    - TODO how 'parity-check matrix' interpreted when operated with $(\vec{x}^TG)^T$
    - here '*minimum* distance of three' because 'with two or more 1 bits', so one *data* bit changed, then at least two or more *parity* bits changed. Then in sum, *three* or more bit in the whole bits are changed.
      - notice: the *minimum* distance is better to be bigger to differentiate between different original code.
    - '(3,1) repetition' can 'correct one-bit errors' mainly based on *redundancy* and 
    - TODO 'a code with distance k can detect but not correct *k − 1* errors' doesn't apply to hamming code because it doesn't detect *double bit* errors (see [this](https://en.wikipedia.org/wiki/Hamming_code#[7,4]_Hamming_code), if $d_3,d_4$ changed, then p1 flipped once [changed] and p2,p3 flipped twice [so unchanged], then mapped to p1 self... ).
  - the parity code is manually chosen as [odd or even](https://en.wikipedia.org/wiki/Parity_bit#Error_detection).
- p812
  - [chipkill](https://en.wikipedia.org/wiki/Chipkill) 
    - 1. 'across multiple memory *chips*', 'another, *spare*, memory chip'
      - notice this is based on the assumption that much higher possibility exists with 1-bit error than 2-bit, so '*reconstructed* despite the complete failure of one chip' (here one chip may only has one-bit error.)
    - TODO [BCH](https://www.ece.unb.ca/tervo/ece4253/bch.shtml),bit-steering
    - [RAS](https://en.wikipedia.org/wiki/Reliability,_availability_and_serviceability),
    - TODO 
      - [Reliability](https://www.bmc.com/blogs/system-reliability-availability-calculations/) is related with probability 'which depends on the *failure rate*'
    - ~~how 'Lockstep memory' and 'DDDC',~~ ['ADDDC'](https://www.intel.com/content/www/us/en/developer/articles/technical/new-reliability-availability-and-serviceability-ras-features-in-the-intel-xeon-processor.html) implemented.
      - maybe see this [whitepaper p8](https://dl.dell.com/content/manual9740166-poweredge-yx4x-server-memory-ras-whitepaper.pdf?language=en-us) which may be referenced by [this](https://community.intel.com/t5/Processors/Intel-Xeon-Gold-ADDDC-Memory-RAS-Feature-Clarification/td-p/1210819)
        - Adaptive because 'failing DRAM bank is *dynamically* mapped out'
      - TODO [virtual lockstep](http://support-it.huawei.com/docs/zh-cn/typical-scenarios-1/server-knowledgebase/zh-cn_topic_0000001108467806.html)
        - here lockstep which use ['redundancy (duplication)'](https://en.wikipedia.org/wiki/Lockstep_(computing)) originates from [army](https://en.wikipedia.org/wiki/Lockstep#:~:text=Originally%20it%20was%20used%20in,prisons%20of%20the%2019th%20century.) (lock the *step*s of soldiers) usage (i.e. *synchronize*)
    - po here book should be 'DDDC' instead of 'SDDC'
  - [burst error](https://en.wikipedia.org/wiki/Burst_error-correcting_code) which 'may be due to physical damage such as scratch on a disc' so that 'occur in many *consecutive* bits'
    - TODO 'cyclic'
  - TODO [Non-cyclic Codes](https://math.stackexchange.com/questions/3141351/non-cyclic-codes)
  - [Modulo 2 Arithmetic](https://www.csus.edu/indiv/p/pangj/166/f/d8/5_Modulo%202%20Arithmetic.pdf) ('coefficients of a polynomial' p1)which is used as division in CRC, which can be seen [here p2](https://cs.newpaltz.edu/~easwarac/CN/Module7/CRC2.pdf)
  - TODO opposite of Galois fields
  - [Reed-Solomon code](https://www.cs.cmu.edu/~guyb/realworld/reedsolomon/reed_solomon_codes.html#:~:text=Reed%2DSolomon%20codes%20are%20block,%2C%20DVD%2C%20barcodes%2C%20etc))
    - [Linear Block Code](https://electronicsdesk.com/linear-block-code.html)
    - TODO why '*2s* redundant symbols' although it can truly correct errors ('determine the 4 polynomial coefficients')
    - TODO 'Berlekamp-Massey *algorithm*'
- p815
  - overhead is determined by 1. whether 'OS-intensive' 2. 'ISA' emulation overhead.
  - TODO [Orthogonal Architecture](https://info.support.huawei.com/info-finder/encyclopedia/en/Orthogonal+Architecture.html), 
  - how 'allows the VM to execute *directly* on the hardware'.[see](https://embeddedinn.xyz/articles/tutorial/exploring_virtualization_in_riscv_machines/). Maybe mainly because other ISA not allow *trap* with some instructions, see [p22](../references/other_resources/RISC-V/EECS-2016-1.pdf)
  - why x86 not '*classical* virtualization',[see 'the inability to trap on some privileged'](https://en.wikipedia.org/wiki/Hardware-assisted_virtualization)
- p825
  - [Difference](https://www.geeksforgeeks.org/difference-between-paging-and-segmentation/) Between Paging and Segmentation
    - 1. '*compiler* is accountable' 2.[external](https://www.geeksforgeeks.org/difference-between-internal-and-external-fragmentation/) fragmentation ...
    - 'two-part address'. From above first link, the page is just one step from virtual memory to physical memory. While in segmentation, it first use S.no ( segment number ) to find one entry in segment table and then get the limit and *base*, then use them to search in physical memory.(this is second step)
  - ['page table register'](https://www.intel.com/content/www/us/en/docs/programmable/683620/current/the-pteaddr-register.html)
- p831
  - here mainly complex object is 'data structure' (i.e. [sorted data structures](https://dl.acm.org/doi/fullHtml/10.1145/3472456.3472514))
- p833
  - [*inverted* page table](https://www.geeksforgeeks.org/inverted-page-table-in-operating-system/) because it targets at physical pages instead of virtual memory. Also [see](https://www.geeksforgeeks.org/difference-between-page-table-and-inverted-page-table/)
- p835 <a id="reference_bit"></a>
  - reference bit is used with *counter* which either store [interval](https://courses.cs.washington.edu/courses/cse451/99wi/Lectures/8-vm/tsld014.htm) or last [access time p30~33](https://sites.cs.ucsb.edu/~chris/teaching/cs170/doc/cs170-08.pdf) (p15: R and M Bits, which also has 'Inverted Page Table';p7: structure; p5:MMU; p18:FIFO, i.e. based on time instead of frequency; p23 use *matrix* with LRU; p25 use counter to calculate *reference counts*; p27: 'it can be *preloaded*' (working set) ; p30: 'Use execution time instead of *references* '(i.e. reference counts); TODO read after p33.)
- p844
  - pipeline refers to ['fetching pipeline'](https://stackoverflow.com/questions/49752651/is-tlb-used-at-all-in-the-instruction-fetching-pipeline)
- p847
  - no alias problem because 'really a physical address since it is *not translated*' (offset not translated)
- p848
  - the third 'go from user mode to supervisor mode' is definitely [not included](https://pages.uoregon.edu/stevev/cis399/notes/osvm.html) in virtual machines.
- p850
  - here cache needs clear because of *protection*
  - [rare occasions](https://stackoverflow.com/questions/76500243/when-to-clear-the-tlb-if-using-process-identifier?noredirect=1#comment134939512_76500243)
    - [IPI](https://en.wikipedia.org/wiki/Inter-processor_interrupt) between processors
    - [mm](https://linux-mm.org/)
- p851
  - here mainly because of 'restart' which may *load* a different memory address if `x10` has been *overwrited*. see p853,854('continued midstream')
- p852
  - here exception should not be interrupting, otherwise will overwrite *SEPC*,etc.
- p854
  - shadow page table
    - [p6,8 with MPN,etc](https://cseweb.ucsd.edu/~yiying/cse291j-winter20/reading/Virtualize-Memory.pdf) more directly [p29 with MPN,etc definition](https://www.doc.ic.ac.uk/~etheresk/etheresk-211-vms.pdf)
      - here SPT is [shadow ~~(beacuse *skip* one media)~~ page table](https://sites.google.com/site/masumzh/articles/hypervisor-based-virtualization/memory-virtualization) <a id="hypervisor"></a>
  - [CR3 -> PDBR](https://en.wikipedia.org/wiki/Control_register#CR3)
  - [indirection 'accessing a variable through the use of a *pointer*'](https://en.wikipedia.org/wiki/Indirection)
  - po 'real pages' should refer to above ~~MPN~~ PPN, see p855 ('virtual memory, *physical memory*, and machine memory')
  - virtualizing the *instruction set* is '*inefficiency* in managing exceptions'
- p856
  - 'simplifying memory allocation' because ['illusion that it possesses the entire address space'](https://medium.com/@mahmoudabdalghany/virtual-memory-b2c77308c9fd). So po no need to worry about the memory size because this is done by OS via virtual memory.
  - principle is locality and policy is related with write (i.e. write-back or write-through). 
  - working set [also](#reference_bit)
  - how [counting sort](https://en.wikipedia.org/wiki/Counting_sort) sort? mainly by $count[i] = count[i] + count[i - 1]$
  - why radix sort -> TLB miss, see [this](../references/other_resources/COD/references/rahman2001.pdf), 1. p3, 'working set' because each sort will be through the whole number list. 
    - TODO 1. explicit block transfer. p11 2. how PRE-SORTING help, p12 3. p9 *Reducing* working set size
- p869
  - [next-state function and output function](https://inst.eecs.berkeley.edu/~cs61c/fa06/labs/10/PH-B10.pdf), also see p1240
  - see p1413, the PLA and the ROM implementation is similar based on *mapping*.
- p872
  - split into two pieces -> two side of the square
  - 'For example' :  Mealy machine can differentiate 'two sequences of states' by input instead of the states themselves.
  - 'Note that a write hit also sets the valid bit and the tag field': here whether write hit 'needs to change the valid and tag fields' is based on what *type* write hit is. If it is ['when there is *sufficient room* in cache to store a requested write IO'](https://www.dell.com/community/Symmetrix/Understand-the-Write-Hit-and-Write-Miss-in-Symmetrix/td-p/7063670) (i.e. write one new address), then obviously needs. Otherwise, no needs if just update data stored in [already existing address in cache](https://gateoverflow.in/147397/what-is-the-write-miss-and-write-hit). 
  - the tag and cache index [p48](https://www.cs.fsu.edu/~zwang/files/cda3101/Fall2017/Lecture11_cda3101.pdf)
- p876
  - here, 'A memory system is coherent if' 1. based on one processor which is obvious. 2. update different process cache line after one processor's write. 3. how write reorders is same to all processors.
    - 1 (same processor) and 2 (different processors) is RAW, 3 is WAW which may be followed by some read (so also RAW, see ' some processor could see the write of P2 *first*,...,*maintaining* the value written by P1 indefinitely').
      - more detailed: 1. $P_1: W(x)1,No_W_O(x),R(x)$ (No_w_o(x) means No Write of Others) ...
    - this is same as what [wikipedia][Cache_Consistency_def] defines. <a id="Cache_coherence"></a>
      - po the 'all memory locations' is just same meaning as 'single memory location' when the latter generalized which is the normal operation. Similar to other definitions.
  - TODO single-processor systems
- p877
  - 'transparent fashion' means the processor has illusion that the data is from memory.
  - 'This is a *benefit* of caching we have in single-processor systems as well.' although 'single-processor' won't have a *shared data* since it has no processor to share.
    - it is to say the benefit of *cache*.
  - [MESI](https://en.wikipedia.org/wiki/MESI_protocol)
    - also [see](https://en.wikipedia.org/wiki/Cache_coherency_protocols_(examples))
    - kw: 'This is termed "BusRdX" in tables above.' & 'A read for *ownership* transaction is a read operation with intent to *write* to that memory address'
    - ~~TODO Table 1.2: Transition to Invalid.~~ [BusRdX p22, recommend this slide](https://ee.usc.edu/~redekopp/ee457/slides/EE457Unit10_Coherence.pdf) which also says 'PrRd/-' meaning in wikipedia State diagram. <a id="BusRdX"></a>
    - Modified(M)	BusRd -> which writes to Main memory. This is to avoid too frequent 'snoop (intercept)'. Also, 'protocol ensures that Modified cannot exist if any other cache can perform a read hit' (i.e. avoid too many *read miss* because of noncoherent cache .)
    - Better to read [this MSI](https://en.wikipedia.org/wiki/MSI_protocol) first
    - [Invalidate Queues](https://stackoverflow.com/questions/51264290/memory-barriers-a-hardware-view-for-software-hackers-invalidate-queues) which is just the Invalidate in *BusRdX*
    - [read barrier](https://stackoverflow.com/questions/1787450/how-do-i-understand-read-memory-barriers-and-volatile) 'will flush the invalidation queue' because the 'Invalidate' is always from Write which will be followed by write (which also implies read from memory) and read and read barrier 'control the order of reads'.
    - MESI's [advantage](https://en.wikipedia.org/wiki/MESI_protocol#Advantages_of_MESI_over_MSI) of 'exclusive' is no need of 'BusUpgr' which will 'invalidate' with write *hit* (while `BusRdX` will invalidates with write *miss* because of the read) when [WAR](https://en.wikipedia.org/wiki/Hazard_(computer_architecture)#Write_after_read_(WAR)) <a id="Advantages"></a>
      - kw: 'As only one processor works on a piece of data, all the accesses will be exclusive', 'are both representable with 2 bits.'
      - [comparison](https://en.wikipedia.org/wiki/MESI_protocol#Disadvantage_of_MESI)
        - Forward (F): ' specialized form of the *S state*','designated responder for any requests', So can exist with other S and I cache.
        - Owned: to avoid frequent flush and allow dirty state. See ['allows dirty sharing of data'](https://en.wikipedia.org/wiki/MOESI_protocol). Also ['only *one* cache can have the owned'](https://en.wikipedia.org/wiki/MOSI_protocol)'writing the modifications back to main memory.' -> Write hit.
          - see [this](https://en.wikipedia.org/wiki/MESI_protocol#cite_note-8) in amd [doc](../references/AMD/amd64.pdf)
            - [Probe Read Miss p37](https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture20.pdf), also see 'the term probe is used to refer to *external* probes' p645 in amd doc
  - 'switch access' may refer to change *state*.
  - centralized in 'centralized state' is similar to 'addressed as a single *shared* address space' in [this](https://en.wikipedia.org/wiki/Distributed_shared_memory)
- p878
  - [False Sharing](https://haryachyy.wordpress.com/2018/06/19/learning-dpdk-avoid-false-sharing/) caused by *redundant* invalidation of cache block can be partly solved by alignment. [Also](https://www.codeproject.com/Articles/85356/Avoiding-and-Identifying-False-Sharing-Among-Threa). Also see wikipedia 'but that data shares a cache block with data that is being *altered*,... force the first participant to *reload*'
    - also [related](https://joemario.github.io/blog/2016/09/01/c2c-blog/) with `perf c2c`
- p879
  - [memory consistency model][memory_models] defines the memory *order*.
    - [off-by-one errors](https://en.wikipedia.org/wiki/Off-by-one_error)
    - '00' will cause one weird loop, so impossible.
    - 'Sequential consistency' just means no parallel. See original [paper 'two processors cannot both be executing their critical sections *at the same time*.'; 'Memory requests from all processors issued to an *individual* memory module are serviced from a single *FIFO* queue.'; two Requirements; 'the price of *slowing down* the processors'][SC_orig]
      - 'Requirement R1: Each processor issues memory requests in the order specified by its *program*.'. also [see p3][lec_17] which has no [*overlap* in p9][lec_17] (also [see p2 '*Atomicity* means, that no operation can overlap'][sequential_consistency]) (otherwise,RAW overlap will make reordering of StoreLoad). <a id="overlap"></a>
        - also see [p42][MEMORY_CONSISTENCY_DETAILED]
      - also see [p2 (above FIFO ensures the *write atomicity* which will not be interruptted by others)](https://users.cs.utah.edu/~rajeev/cs7820/pres/7820-12.pdf)
      - this also [forbids the OoO on each *core*](https://www.sciencedirect.com/topics/computer-science/sequential-consistency#:~:text=Sequential%20consistency%20is%20a%20conservative,to%20preserve%20their%20program%20order.) (see 'in the order specified by its program')
      - this is just opposite of pipeline. See COD before.
      - 'appear in this sequence inthe order specified by its program.' -> 'write does not complete...' in COD' & ' does not change the *order* of any write'
      - [examples][sequential_consistency]
      - also see ['*appears* to run sequentially.'](https://community.arm.com/arm-community-blogs/b/tools-software-ides-blog/posts/armv8-sequential-consistency)
      - [diff](https://stackoverflow.com/questions/14861822/) with [acq_rel][acq_rel_cpp]: the former ensures the order between ~~*cores*~~ threads while the latter only care order between *related* [acq_rel][acq_rel_cpp] operations. <a id="ac_rl"></a>
  - [I/O Coherence](https://phdbreak99.github.io/blog/arch/2020-05-18-io-coherence/)
  - ['directory-based cache coherence protocol'](https://en.wikipedia.org/wiki/Directory-based_coherence) has 'implementation overhead' because the *directory* and 'reduce traffic between caches' because directory function to send data.
- p880
  - Based on MESI, after the second step, both caches transition to *Shared*. With *PrWr*, A -> *Modified*, then with *BusRd* , A->Shared and then *write-back* (i.e. 'Memory Controller, which writes to *Main memory*.')
    - notice ~~the book use~~ both MSI and MESI only flush when receiving BusRd(x) with modified state. So ' the second miss by B' should be the fourth step which 'occurs when a block becomes shared' from *Modified*.
- p885
  - [see](https://en.wikipedia.org/wiki/Standard_RAID_levels) 
    - [byte level](https://bit-tech.net/reviews/tech/understanding_raid/2/) 
    - see RAID 6 [P,Q](https://en.wikipedia.org/wiki/Standard_RAID_levels#General_parity_system)
    - [TODO](https://en.wikipedia.org/wiki/Standard_RAID_levels#Comparison)
- p886
  - RAID 2: 'all hard disk drives implementing internal error correction' like [Reed-Solomon](https://datarecovery.com/rd/what-are-hard-drive-error-correction-codes-eccs/) , so 'external Hamming code' is redundant -> 'not currently used'.
  - TODO RAID 3 Bit-Interleaved Parity [difference](https://gursimrandhillon.files.wordpress.com/2013/09/raid-notes.pdf) with RAID 4
  - RAID 4 is better because it 'allowing independent accesses' while RAID 3 is based on 'byte-level striping' and 'because any single block of data will, by definition, be *spread across* all members of the set'. So RAID 3 is not independent .
    - In short, RAID 4 can manipulate multiple requests because they normally are stored at different disks (i.e. 'as long as the *minimum access* is *one* sector.'). While RAID 3 can't because every data spread across these disks.
      - Write is *similarly* benefited. And it can use *shortcut* to reduce disk access *number*.
- p889
  - maybe [not efficient 'RAID levels 2, 3, and 4 are *theoretically* defined but not used in practice.'](https://www.raid-calculator.com/raid-types-reference.aspx)
  - based on shortcut, 'multiple writes to occur *simultaneously*'
- p891
  - RAID reliability calculated by [markov chain](https://www.bqr.com/resources2/white-papers-articles/how-to-calculate-raid-reliability/#:~:text=RAID%20reliability%20depends%20on%20the,than%2010%20HDDs\)%20are%20recommended.), also see above RAS.
- p892
  - RAID 01 [vs](https://www.thegeekstuff.com/2011/10/raid10-vs-raid01/) RAID 10
    - TODO see physical layout and how error tolerant.
    - 10: 1(mirror) -> 0(stripe) 'stripe of mirrors'.
- p902
- p903
  - Transaction [Serialization](https://en.wikipedia.org/wiki/Cache_coherence#Overview) is realized by [bus p25](http://www.cs.cmu.edu/afs/cs/academic/class/15740-f03/www/lectures/lect12.4up.pdf) (also [see highlight](../references/other_resources/COD/references/lect12.4up.pdf))
    - bus is prioritized (p45) <a id="Serialization"></a>
    - xaction~~, see above [Rdx](#BusRdX) (po: x -> invalidate )~~ TODO see [p18 why READ/Modify](http://www.csl.ece.upatras.gr/advanced/2.%20bus-based%20CC.ppt)
  - outstanding means ['continuing to exist'](https://www.merriam-webster.com/dictionary/outstanding)
  - most of these are shown in FSM in MESI wikipedia,etc
- p904
  - tag search can based on memory with the inherent search circuit (TODO name forgotten.)
  - exclusive is different from [MESI](https://en.wikipedia.org/wiki/MESI_protocol#Operation) where Shared(S) & PrWr 'State transition to *(M)Modified*.' which can be seen p906 'the modified state implies that the block is exclusive'
  - 'No further *invalidations*' see [this 'While in the *Owner* ... the block remains in the same state while *flushing*'](https://en.wikipedia.org/wiki/MOSI_protocol). So it only offer data except that '(BusRd*X*), the block changes state to invalid (I)'
    - in COD where exclusive is synonym of *Modified*, see [MSI where 'On a *BusRd*, the cache block is flushed onto the bus and state changes to Shared.' implying 'No further invalidations'](https://en.wikipedia.org/wiki/MSI_protocol#State_Machine)
- p905
  - 'duplicate' from L1 to L2 (i.e. inclusion property) to save bandwidth 
- p906 (better to read the FSM instead of the table, which also applies to p910)
  - 3rd row :read miss when [shared](https://stackoverflow.com/questions/21126034/msi-mesi-how-can-we-get-read-miss-in-shared-state) because index match but tag mismatch (*conflict* miss).
    - all row with processor source -> read miss on *bus*. To make bus function with higher [priority](#Serialization). 
  - 5th row: should [wirte back](https://en.wikipedia.org/wiki/MSI_protocol#cite_ref-:0_2-0).
  - second to last row: here `shared` because maybe multiple shared *read* access of one cache. 'write block that Is shared;' -> block which send the bus message. 'Invalidate the cache block' -> block which receives the message.
  - last row: 'that Is exclusive elsewhere' because `modified` has invalidated all other caches, so `shared` is impossible. The `exclusive` occurs to master after the *master* sending `Write miss` to bus.
- p907 say [simialrly](#Advantages)
  - 'write miss' implies will overwrite the original cache block.
  - ~~TODO `otherwise` may be wrong, because miss with `exclusive` has no cache to offer data.~~ So see [p22](https://www.cs.cornell.edu/courses/cs3410/2013sp/lecture/18-caches3-w.pdf) which also say 'no way to *distinguish which word* was dirty with only *a single dirty bit.*'
    - here exclusive implies modified -> writes back; otherwise (i.e. shared which implies clean), so no need to write back -> 'read from memory'.
    - also see 'Having *per-byte validity* for cache block contents would also complicate cache coherence and consistency' in the following link.
      - cache coherence and consistency are ['synonymous' p5][mosberger93memory].
  - read memory on a write-miss because  probably ['only with just a word missing in a block'.](https://cs.stackexchange.com/questions/21318/why-we-need-to-read-memory-on-a-write-miss)
- p908
  - `exclusive` implies only cached in current cache, so other processor's cache has no *copy* -> *miss*. Then also allow dirty sharing (see above).
    - ~~'this block' -> block in *memory* instead of cache.~~
  - 'but for a different address' -> conflict miss. ('address requested by the processor does not match ' ->tag not match)
  - ~~TODO why ~~ 'the exception being the invalidate on a write *hit* to a *shared* block' because no processor to invalidate. ~~ since [p3 'write hit to a shared block ...'](https://people.cs.pitt.edu/~melhem/courses/xx45p/coherence.pdf)~~
- p911
  - shared: 'always up to date' -> clean. 'preserved in this protocol, and in most other protocols' -> '*simplifies* the implementation'
  - 'read misses would also not be atomic' because [refreshed 'have to be cleaned after the context switch'](https://www.quora.com/Why-would-context-switching-cause-a-cache-miss)
  - using somthing similar to [pipeline p52 by using 'two separate buses' p48 to 'use it as efficiently as possible' p44](http://www.cs.cmu.edu/afs/cs/academic/class/15418-s19/www/lectures/12_snoopimpl.pdf) to ensure *atomic* somewhat. 
    - ~~deadlock~~ race in cache p35 in above link: P2 needs to *response* to 'invalidate' and 'modify its own outstanding requests' which is originally 'BusUpg'.
    - deadlock of the transmission path between response and request: 'P1 must be able to service *incoming* transactions while waiting to issue *requests* '
      - which implies the above 'two separate buses'.
    - 'Livelock' p37 is just redundant and unnecessary loop (also see above)
- p912
  - 'makes the individual steps atomic.': just *illusion* seen by other processors.
- p914
  - [Round-robin](https://developer.arm.com/documentation/den0013/d/Caches/Cache-policies/Replacement-policy) or cyclic replacement 
    - TODO see Random Replacement [math](https://inria.hal.science/hal-01054982/document)
  - [Variable page size](https://stackoverflow.com/questions/35720775/variable-page-size-in-linux)
    - THP: ~~TODO view code why~~ 'some kind of *defragmentation*' because the size isn't totally variable in all range although [*automatic* promotion and demotion implies 'Transparent'](https://www.kernel.org/doc/html/next/admin-guide/mm/transhuge.html) 
      - [disadvantage](https://techoverflow.net/2017/02/18/advantages-and-disadvantages-of-hugepages/): 'access almost the *entire* hugepage'
  - [Approximated LRU](https://www.geeksforgeeks.org/lru-approximation-second-chance-algorithm/) [see](#reference_bit), this is one version without counter. Second Chance is given by 'reference bit (bitref)'. 
  - 'Two-way (1), four-way (D)' because instruction to be fetched is normally larger.
- p918
  - 'merge requests' is similar to SIMD (here data are merged. po). 

##### In this `###` from here, Not use the [old book][RISC_V_Custom], use the [new book][RISC_V_Orig] page as the index.
- p464
  - 'special purpose and systems category'
    - special purpose -> status register 
    - TODO system detailed meaning
    - see [riscv_spec] doc '“Zifencei”',etc.
  - `fence.i`
    - [riscv_spec] 
      - p31
        - ['“store instruction word” instruction'](../references/other_resources/COD/references/MAJC.pdf) is to specifically *store instruction* by checking whether it has been *modified*.
          - p7 $512$ registers is calculated by `(96+32*4)*2+32*2` (here register file is delimited into two types, and only one registerfile's 'Global registers are shared')
        - ['snoop the instruction (data) cache on every data (instruction) cache miss'](https://stackoverflow.com/questions/76546433)
          - [Difference](https://www.geeksforgeeks.org/difference-between-von-neumann-and-harvard-architecture/) between Von Neumann and Harvard Architecture mainly about *cache*
          - ''
            - uop/Micro-operation cache is just to store uops.
            - [trace cache](https://en.wikipedia.org/wiki/Trace_cache#Trace_structure) is similar to *prediction* ('different branching paths'), also see 'MICRO_2020.pdf' which can function as uop cache (also [see](https://www.realworldtech.com/willamette-architecture/2/))
          - [patent](https://stackoverflow.com/a/17395717/21294350), see US6594734.pdf.
            - TLB is used with physical addr and linear addr (i.e. virtual addr (linear because we view it as one line instead of physical banks,etc.))
            - 'FINE HIT' is just offset.
            - here can get the physical addr from cache because 1. 'physically addressed.' 2. maybe using [CAM](#CAM) mem.
          - here *snoop* keeps cache coherency, resulting less overhead of fence to keep cache coherency.
          - [JIT](https://stackoverflow.com/questions/2837635/how-does-jit-replace-optimized-machine-code-during-runtime?noredirect=1&lq=1) use `mmap` to update instruction in *linux*.
          - 'run fence.i before jumping to that buffer' to invalidate / 'flush the local instruction cache' as [riscv_spec] doc says.
        - ['inclusive'](https://en.wikipedia.org/wiki/Cache_inclusion_policy#Inclusive_Policy) implies update of '*unified* private L2' will also update related L1 ('*primary* instruction cache')
        - 'hart' see [riscv_spec] doc or 'electronics-10-00518.pdf'
          - 'local hart' -> hardware thread in current cpu core; 'user hart' -> current *using* hardware thread; 'different physical hart' -> another hardware thread (whether to 'execute an additional FENCE.I' depends on local hart definition (i.e. based on core maybe with multiple harts or just one hart.)).
        - ['finer-grain'](https://www.geeksforgeeks.org/difference-between-fine-grained-and-coarse-grained-simd-architecture/) just means more '*subdivided* into various parts' as its literal meaning.
      - p3 execution environment interface (EEI)
        - [ABI vs API](https://en.wikipedia.org/wiki/Application_binary_interface) Here 'interface' is similar to communication. ABI defines how instruction should communicate with hardware ('hardware-dependent format' because [calling convention](https://en.wikipedia.org/wiki/X86_calling_conventions#Register_preservation) related with *caller/callee-saved* regs). API 
          - 'deal with an ABI ... in a mix of programming languages' because compiler changed (at least language may differ in whether column-major or row-major).
          - 'system call stubs' beacuse dynamic loading and PLT and here [*stub*](https://en.wikipedia.org/wiki/Method_stub#Method_Stub_Overview) is 'yet-to-be-developed code'
          - 'Sizes,' like fetch instruction size.
          - 'direct system calls' vs 'procedure calls to system call'. see [figure](https://www.8bitavenue.com/difference-between-system-call-procedure-call-and-function-call/)
          - [API](https://en.wikipedia.org/wiki/API) 'offering a *service* to'. One example of API specification is `man 2 open`.
      - p47
        - [I/O domain](https://docs.oracle.com/cd/E38405_01/html/E38406/iodomainoverview.html) may just mmap physical I/O devices like how virtual memory map disk. ('direct access to a physical I/O device')
    - [lwn memory blog ][CPU_cache] which also says about [hardware][memory_Introduction]
      - [NUMA][NUMA] [node and local/remote access](https://www.boost.org/doc/libs/1_66_0/libs/fiber/doc/html/fiber/numa.html) <a id="local_remote_access"></a>
  - `fence` [riscv_spec] p26
  - `sfence.vma` 
    - [riscv_spec]
      - p83
        - I/O memory. Just take [GPU](https://images10.newegg.com/uploadfilesfornewegg/itemintelligence/videocard/graphics_card_interfaces.pdf) as one example because it receive Input from CPU and output to something like the HDMI port. And of course it has register like p179 says.
        - [MMIO](https://en.wikipedia.org/wiki/Memory-mapped_I/O_and_port-mapped_I/O)
          - kw: 'must be reserved for I/O', 'or use a dedicated' (bus), 'a *separate* address space from general memory','*allowing* port I/O', 'debugging *closed-source* device drivers'
          - 'Address Decoding' just to select bank and decoder. See [the 4th figure](https://ece-research.unm.edu/jimp/310/slides/8086_memory2.html).
            - whether Complete or Incomplete can be implemented by $A_{11\sim19}$ in figure 1. If only one combination of $A_{11\sim19}$ are allowed to select EPROM, then Complete decoding. Otherwise Incomplete (Also [see](#Virtual_Address_Aliasing) )
              - So if all $A_{\dots}$ are inputs of EPROM, then Linear decoding.(Just as its literal meaning, no bank selection -> linear.)
        - ['transactional memory'](https://en.wikipedia.org/wiki/Transactional_memory) just means it has *inherent atomic* ensure (See 'high-level abstraction as an alternative to low-level *thread synchronization*' or the figure clearly which also says the same thing about [OCC 'Optimistic concurrency control'](https://en.wikipedia.org/wiki/Optimistic_concurrency_control#Phases_of_optimistic_concurrency_control)).
        - 'width' -> [bandwidth: transfer rate](https://en.wikipedia.org/wiki/Memory_bandwidth) 
      - p57
        - [explicit memory access](https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-processor/memory-model/memory-system-ordering-of-memory-accesses) just means access by explicit instruction. Compared with [Implicit accesses](https://developer.arm.com/documentation/ddi0419/c/System-Level-Architecture/System-Memory-Model/About-the-system-memory-model?lang=en)
    - [riscv_privileged]
      - p53
        - [ordering bit `.aq`,etc](https://github.com/riscv-non-isa/riscv-asm-manual/issues/8)
        - ['bus mastering devices'](https://en.wikipedia.org/wiki/Bus_mastering) just accelerate by no need of control of [DMA](https://en.wikipedia.org/wiki/Direct_memory_access#Third-party) controller which may 'the scheduler can *no longer arbitrate* for the bus and hence cannot provide deterministic latency'. <a id="DMA"></a>
      - `sfence.vma`
        - i
          - PMP [code](https://sifive.github.io/freedom-metal-docs/devguide/pmps.html) or [hardware view](https://riscv.org/blog/2022/04/xuantie-virtualzone-risc-v-based-security-extensions-xuan-jian-alibaba/)
            - also see p56
        - ii
          - bare S-mode may -> p61 'page-based virtual memory is not implemented'.
            - see p73,75 'Table 4.4' and p78
          - TODO `SFENCE.VMA` and `SFENCE.VM` diff. 
        - p100
          - Privilege Mode: here Hypervisor is VMM (' hyper- used as a stronger variant of super-') (also [see](#hypervisor)) while supervisor is *kernel*.
            - also see [riscv_privileged] p2 and p3 encoding. Also see why reserve `10` instead of `11` in p22.
        - p24
          - here not 'reinterpreted' memory-management data structure -> no need `SFENCE.VMA` to update page table which is what `SFENCE.VMA` should do '*populate* shadow page tables'.
            - [see](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#sfence-vma): it ensure page table ('related to address translation') *latest* and . (See doc p76)
          - 'world switch' -> guest OS change p25.
        - p12
          - WARL
        - p73
          - ASID, also [see](https://stackoverflow.com/questions/76500243/when-to-clear-the-tlb-if-using-process-identifier).
          - only 'satp register is considered *active*' will update page-table. writing `satp` may lazy delay the update if not active.
        - p76
          - TLB shootdown: ['invalidate'](https://stackoverflow.com/questions/3748384/what-is-tlb-shootdown). While in risc-v it also update after invalidating ('analog').
          - see p81 global mapping. It implies *shared* by all ASIDs. So it 'need not be flushed from' because it is one-copy from 'need not be stored redundantly'.
        - p77
          - 'simplification.' design by 1. over-fence So no need to select/*speculate*/branch what to do. 2. no need to *jump* to exception handler but just to skip.
          - ' ... interacts cleanly ' just means `SFENCE.VMA` order may not follow RVWMO rule. See 'In particular,...'. So they probably has stall or somthing to keep results right.
            - 'A consequence of this specification' interprets why 'any translation' because program behavior may *not determined* because of the reordering.
          - ['superpage' p14,15](https://my.eng.utah.edu/~cs6810/pres/08-6810-14.pdf) is just similar to SIMD. one virtual maps to one superpage('16 physical pages') instead of just one *small* page.
            - 'match a single address' because originally they map to multiple *pages*. But now these pages are ~~condensed~~ combined into one bigger superpage(i.e. a single address).
            - 'whether the old *non-leaf* PTE or the new leaf PTE': see p87 also [this][chromit]
              - '*Any* level of PTE may be a *leaf* PTE' (maybe implies dynamic memory) because the pte *level* can change. So page offset may be combined with `PPN[0:0+k]` -> `PPN[0]` add storage to $2^{9-10}K*4K=2M$ megapages. this implies *non-leaf* PTE in the upper level which points to megapage is now leaf PTE because it point to the *minimum page unit*.<a id="leaf_PTE"></a>
          - 'unsafe' because different possible update order of PTE's subsets may offer different observation to (implicit) reads of PTE.
        - p78
          - '*caching* of PTEs whose V (Valid) bit is clear' just means it is not totally invalidated and may consume unnecessary PTE storage. 'causing additional page fault' because it may *wrongly* assume cache is latest and thought as [page fault (see the figure)](https://www.baeldung.com/cs/cache-tlb-miss-page-fault) (also by 'insufficiently aligned.' in p82). <a id="additional"></a>
          - see p63 'sstatus'
            - also see p23 part update of mstatus also not needs `SFENCE.VMA` 
          - bullet point list 'require executing an `SFENCE.VMA`'
            - 1. `satp.PPN` change. Here can lazy make `satp` take effects. But must make `SFENCE.VMA` influence `ASID`.
              - `satp` is register, so it is just offer *state* to the current *context*.
            - 2. here need propogate to all page tables because here implies all ASIDs.
              - 'ASID 0' from the 'rs2=x0' in p76: it means all ASIDs.
              - 'should execute SFENCE.VMA with rs1=x0' is just one *guess* about what user want to do. So it should check whether 'no global translations'. to avoid unnecessary *flush* of global translations. 
                - notice `x0` and `x[i]=0` ($i\neq0$) diff.
            - 4. 'any PTE along the traversal path' because leaf PTE is [*dynamic*](#leaf_PTE). So here PTE is more like something child PTE (notice the terminology is not official). 
            - 5. here also explains why riscv allows *invalid leaf*. Here either get *valid* leaf if `SFENCE.VMA` can update V bit or 'page-fault'.
              - this also says why 'additional' [above](#additional).
        - p82
          - 'For non-leaf PTEs, the D, A, and U bits are reserved'. po non-leaf PTE function as *index* table to leaf PTE, so they should never more frequent accessed than leaf PTE. And may leave kernel or something similar to manipulate them consistently.
  - `CSR`
    - as [riscv_spec] 
      - p55, 
        - it is not 'mandatory' and 'moved out of the *base*'.
        - here 'address space' is ~~not [same]()~~ more [general 'hybrids','ROM and in some cases *I/O* units'](https://www.quora.com/What-is-the-difference-between-registers-and-address-space) than what it is in the virtual memory context.
          - kw: 'WP register points to a “working page”' So here register also has one *page* architecture or other addressing method.
        - here `Zi` means removed from 'base *I* instruction set'.
      - p56
        - 'side effects ' may be caused by 'controlling CSR' in [riscv_privileged] p13.
        - 'zero-extending a 5-bit' just maps to 'Unprivileged and User-Level CSRs Standard read/write' in [riscv_privileged] 'Table 2.1: Allocation of RISC-V CSR address ranges.'.
        - notice: `CSRRSI and CSRRCI` with 'uimm[4:0] field is zero' 'write to the CSR'. While in opposite `CSRRS and CSRRC` 'attempt to write the unmodified value *back* to the CSR and will cause any *attendant side effects*'
          - this can be seen from the figure.
            - here `rd=x0` is no use to write into it (i.e. `rd`). So no need to read CSR. But write value into CSR always has meaning, so 'write CSR' yes.
            - `rs1=x0` means no set bit. So no change, meaning no need to write back.
              - here register value with 0, write back. Because no convenient quick method to *speculate* no need to write back as `CSRRS/CI` with imm in opcode to speculate.
              - Always 'read CSR' no need. But it is implemented as yes by riscv. Fine after all.
      - p57
        - 'encoded as CSRRS rd, csr, x0.' see figure p56. Always use `x0` to avoid unnecessary read or write.
        - see 'Further assembler ...' which *isn't implemented* now.
        - 'CSR access is performed after ...' is one [acq_rel][acq_rel_cpp] fence. And 'CSR read ...' implies acquire and also CSR write implies release.
        - 'unless a CSR access modifies the execution behavior' is just similar to ~~like most architecture and compiler says ~~ SC (the result as if program order.)
      - p58
        - '*not necessarily* apply to the order of the completion': means memory consistency can be defined as designer implemented.
        - 
    - [riscv_privileged]
      - p13 
        - TODO 2.4 is probably because of some hardware limitation causing always 'unspecified value' even '*remains* legal after the write'.
          - it keeps 'affected CSR' (i.e. controlled CSR) unchanged.
        - 2.6 implies [RMW](https://en.wikipedia.org/wiki/Read%E2%80%93modify%E2%80%93write) using one temporary register to ensure atomicity.
      - p8
        - `URW` can be guessed as `UserReadWrite` by p7.
  - `ecall`
    - [riscv_spec] 
      - p10
        - here 'exception' may not totally same as csapp defined because it is related with instruction excluding hardware issued exception.
        - `trap` may have different meanings (csapp, here and this [Q&A](https://stackoverflow.com/questions/3149175/what-is-the-difference-between-trap-and-interrupt#comment13892039_3149217) all are different)
          - Q&A: 'hardware interrupt' -> 'ALU' and 'from a user process' implies view side may define current exception is whether trap or interrupt.
          - from [IEEE_754] p56, it defines trap as one *handler*.
          - literally, in riscv doc, trap means 'trap' something(cpu) into something(*handler*) which is also the wikipedia [definition](https://en.wikipedia.org/wiki/Interrupt) 'called an interrupt handler' referenced by Q&A. This is also the system call / [kernel trap](https://en.wikipedia.org/w/index.php?title=Kernel_trap&redirect=no) (also [see](https://en.wikipedia.org/wiki/Interrupt#Terminology)) in csapp.
        - Trap categories:
          - 'Contained' -> 'user' contained by 'supervisor'.
            - just changing *mode* within *same* hart.
          - 'Requested Trap'
            - 'synchronous' means directly change *control*
            - 'on behalf of software' implies not same hart.
          - 'Invisible Trap'
            - just means *parallel* handled by others and not '*aware*'
            - [demand-paged](https://afteracademy.com/blog/what-are-demand-paging-and-pre-paging/) virtual-memory system
          - 'Fatal Trap' just defines *result* instead of how to do as before.
          - Or see the figure.
        - see [riscv_spec] p3 [opcode trap](https://en.wikipedia.org/wiki/Illegal_opcode) which is similar to above riscv trap definition caused by invalid *opcode*.
          - 'abstract' implies 'greater portability'.
        - 'imprecise' means not function as *expected*.
      - p27
        - here `ecall` just similar to `call` in `x86` if EEI pass parameters by 'integer register file'.
        - ['Semihosting'](https://developer.arm.com/documentation/dui0471/g/Bgbjjgij#:~:text=Semihosting%20is%20a%20mechanism%20that,%2C%20and%20disk%20I%2FO.) means ['target'](https://wiki.segger.com/Semihosting) (one embedded board) and one host (e.g. PC/laptop) (So *semi*)
          - from the example in arm doc, it is just similar to *serial viewer* (As riscv doc says '*service call*'). So it is not totally same as normal debugger like `gdb` does (i.e. debugger controlled how the program is running.)
        - 'built around' just means doing something before into debuger and after leaving debugger.
        - notice here use different types of NOP as encoding *identifier*. 
        - TODO SVC specified with debugger [1](https://developer.arm.com/documentation/dui0471/i/semihosting/debug-agent-interaction-svcs) [2](https://developer.arm.com/documentation/dui0473/m/arm-and-thumb-instructions/svc)
    - [riscv_privileged] p46
      - whether `epc` use 'the following instruction' depends on whether 'retire'.
      - `minstret` used to count retired instructions just as literally interpreted and also by 'should not increment the minstret CSR'.
  - `sret`
    - [riscv_privileged]
      - i
        - `mstatus.MPRV`
          - p21
            - `xIE` only control `x` but not `w<x` or `y>x`.
              - But relative 'higher-privilege-mode interrupts' can be controlled when '*ceding control* to a lower-privilege mode'.
            - ['synchronous trap'](https://docs.oracle.com/cd/E19455-01/806-5257/gen-15/index.html#:~:text=Traps%20\(such%20as%20SIGILL%2C%20SIGFPE,same%20type%20of%20trap%20simultaneously.) 'a thread does to *itself*'.
              - just see csapp what '(a)synchronous' means.
            - [global Interrupt Enable](https://forum.allaboutcircuits.com/threads/difference-between-global-interrupt-enable-and-peripheral-interrupt-enable-bit.166766/) just literally 'all'.
            - 'x IE is set to 0;' because not allow other interrupt interfere the *trap*.
            - here `xPP` just holds the state *before* into trap (i.e. 'prior to the trap'), So return from trap will restore it (i.e. 'privilege mode is changed to y'). Similarly, 'x IE is set to x PIE'.
            - `MPP` see 'previous privilege'
            - from p67, 'lower privilege modes' just means literally.
            - 'x PIE is set to 1', because need to restore to before into the trap.
              |             | SPIE                                    | SIE |
              | ----------- | --------------------------------------- | --- |
              | before trap | A(not stored, unknown state)            | B   |
              | into trap   | B                                       | 0   |
              | exit trap   | (default set to 1 to allow interrupt) 1 | B   |
            - 'x PP!=M': if not set `MPRV=0`, Then will use `MPP`. It may use wrong `xPP`. See p20 figure.
              - This answers why *i* page 'clear mstatus.MPRV when leaving M-mode'.
            - 'one entry per stack' means ~~either `MPP` or `SPP`.~~ just like how stack functions (`push`, `pop`).
          - p25
            - `hypervisor` needs to check whether `SRET` is valid. So needs '(Trap SRET)'.
          - p47
            - See p138 for all encodings.
            - `mepc` see p37,38.
              - '(mepc[0]) is always zero' means at least $2$ bytes (16 bits).
            - ['LR address reservation'](#load_reservation)
            - [riscv_spec] p50 `sc.w t0, a2, (a0)` here is pseudo instruction where `a2` is `rs2` at the 3rd location in [this](https://msyksphinz-self.github.io/riscv-isadoc/html/rva.html#sc-w)
              - here *retry* (TODO this is said in one stackoverflow Q&A) is because something inherent in compare-and-swap or others.
              - 'not guaranteed to provide any stronger' means riscv is similar to x86 not strict StoreLoad ordering by default (But maybe x86 can be tuned by software while riscv can't.).
            - p52 AMO -> atomic memory operation.
            - p53 [parallel reductions](https://www.openmp.org/spec-html/5.0/openmpsu107.html#x140-5810002.19.5.4) in memory use 'private copy' 'using the *combiner* associated with' (maybe same as acc0/1 in 'Figure 5.21' TODO see assembly) and also see [this](https://dournac.org/info/gpu_sum_reduction) which uses local memory (i.e. private copy) to parallel calculate global memory (this is similar to nvidia [slide](https://www.olcf.ornl.gov/wp-content/uploads/2019/12/05_Atomics_Reductions_Warp_Shuffle.pdf) p14). It seems to have no relation with [this](https://en.wikipedia.org/wiki/Reduction_of_summands#:~:text=Reduction%20of%20summands%20is%20an,reduction%20of%20summands%2C%20and%20summation.) where has no copy and parallel and it use carry and original bit summand separately. <a id="reduction"></a>
              - above nvida offer some pdf in p25 [reduction_1](https://developer.download.nvidia.com/assets/cuda/files/reduction.pdf) and [reduction_2](https://developer.nvidia.com/blog/faster-parallel-reductions-kepler/)
                - reduction_1: 
                  - two addressing: 1. p8 Interleaved Addressing which may use *same bank* in p12 because not adjacent memory addr. 2. same as above slide 3. TODO the other #... in reduction_1.
                  - the second is same as 'Shuffle Warp Reduce' in reduction_2.
            - 'cleared LR reservation' -> means LR has been destroyed in some way. So '*impossible* to single-step through'.
  - `wfi` p48
    - TODO just view the code. What interrupt to wait?
      - also see 'If the implementation does not stall', it then runs 'idle loop' and 'continue' after 'resume'.
    - 'delegated to a less-privileged' -> implies be handled by 'less-privileged' and *not* *resume*. But 'must be unaffected' -> still assume.
      - 'not individually enabled' is similar.
    - 'allowing wakeup' -> allow `WFI`.
    - 'WFI as a NOP.' because *W* means wait.
    - 'explicitly check for' because `NOP` doesn't check.
    - 'until an interrupt might need servicing' implies *pending*. So 'can also be executed when interrupts are *disabled*'
    - 'trap into a higher privilege mode' -> 'at any privilege level'
    - `mideleg`
      - see p30
        - ['Trap Delegation'](https://www.sifive.com/blog/all-aboard-part-7-entering-and-exiting-the-linux-kernel-on-risc-v) just allow multiple 'privilege levels' to handle trap instead of only one 'machine mode by default' 'allowing for high performance'.
      - p31
        - mask see [this](#mask) -> disable interrupt. So 'delegator privilege level' means M-mode.
- p465
  - cache  blocking is just unparalleled version of [reduction](#reduction) with one copy.
- p390
  - 4 is obviously right by 'the bandwidth of main memory is *increased* to transfer cache blocks more efficiently'.
  - ~~2~~ 1 is right by p384: Assume that init time is low, if 'cache block' is large, then the low init time won't contribute much to decreasing the total transfer time. See 'Amdahl’s Law' in p49.
- p376
  - 'omit the index bits' means omit in assigned as the tag (not use one of index bits as one tag bit).
- p401
  - Increasing associativity -> less block nums -> more tag bits, see [this](https://en.wikipedia.org/wiki/Cache_placement_policies#Set-associative_cache). Here index bits are not used to index all cache lines but index cache sets which may has *multiple lines*. (index bit num from [6](https://en.wikipedia.org/wiki/Cache_placement_policies#Example)->5)
- p407
  - see 
- p408
  - [GFLOPS:gflop/s](https://en.wikipedia.org/wiki/FLOPS)
#### appendix
##### A
- p1187 why only `Binvert` used in overflow detection.
- p1178 here dot means $\&$, $+$ means $|$,see FIGURE A.5.5
- p1195 here `ALU0p <=12;` should be `ALUCtl <=12;` [see](#ALU0p)
  - `ALUOp` not related with `opn`
  - `input [ 5:0J FuncCode;` should refer to opcode, which can decide aluop, so should be `input [6:0] FuncCode;`
- p1198 $c4$ ~~explains~~ corresponds to $P0+G0$ in p1201 (which is similar to forwarding that skip some action to directly work), see 'FIGURE A.6.3'
  - p1205 lookahead is just *non-blocking* while ripple carry is blocking which is just same as [this 'takes a time delay',' without the wait for the preceding additions.','at the same time as soon as the input signal'](https://www.electricaltechnology.org/2018/04/ripple-carry-and-carry-look-ahead-adder.html)
  - p1208 C4 -(2 gate dalays)> Pi and Gi ...(2) pi ...(1), so 2+2+1
  - p1209 [barrel shifter 'cycle the order of the bits ABCD as DABC'](https://en.wikipedia.org/wiki/Barrel_shifter#:~:text=A%20barrel%20shifter%20is%20a,inherently%20provides%20a%20binary%20operation.)
- p1218
  - here [D flip-flop](https://www.electronicsforu.com/technology-trends/learn-electronics/flip-flop-rs-jk-t-d) just replace the `S,R` in Flip-Flop to `D,~D`.
  - p1219 very *direct* design of D flip-flop...
  - TODO ~~why hold time since data has been in first D latch.~~
    - here hold time is to ensure min_time [with setup time](https://www.realworldtech.com/overclocking-realities/2/) .
    - notice here not gate [location](https://electronics.stackexchange.com/questions/543323/analysis-of-two-d-flip-flop-designs-based-on-d-latches/544027?newreg=9ec75f45a4204faa95478a108b3916ba) which influences 'the inverter delay' is important.
    - the book says 'sampled on the clock edge' similar to ['the data propagates to the output'](https://vlsiuniverse.blogspot.com/2016/10/latch-principle.html)
      - [Transmission gate 'Transmission Gate Truth Table'](https://www.electronics-tutorials.ws/combination/transmission-gate.html)
  - 
### TODO
#### when browsing web
- [Memory Models](https://hpc170063702.wordpress.com/2018/06/21/high-perf-computing-and-concurrency/)
#### chapter 2
- p304 IPA
- p240 'suffices to add 1'
- p232 Iteration is [better (also show stack version)](https://medium.com/@chenfelix/removal-of-recursion-28ab46c891c7) than Recursion
- p221 how to [discard 'hard-wired to zero'](https://en.wikichip.org/wiki/zero_register)
- p202 subi by `addi`
#### chapter 3
- p394 TODO [SRT](https://en.wikipedia.org/wiki/Division_algorithm#SRT_division) with prediction.
- p433 Ordered and UnOrdered compare [diff](https://stackoverflow.com/questions/8627331/what-does-ordered-unordered-comparison-mean)
- p396 nonperforming restoring division also referenced [above](#geeks)
- p393 show why round to zero
- p375 use hardware parallel to carry by [carry lookahead ('reduce')](https://en.wikipedia.org/wiki/Carry-lookahead_adder)
#### chapter 4
- TODO how ROB [implemented](https://docs.boom-core.org/en/latest/sections/reorder-buffer.html)
### COD5 
- p233 [fixed point](https://stackoverflow.com/questions/7524838/fixed-point-vs-floating-point-number)
### RISC-V
> doc [V1][riscv_spec],[V2][riscv_privileged],[greencard](../references/other_resources/RISC-V/RISCVGreenCardv8-20151013.pdf) 
[hart: hardware thread](https://stackoverflow.com/questions/42676827/risc-v-spec-references-the-word-hart-what-does-hart-mean)
- different format, reference [1](https://danielmangum.com/posts/risc-v-bytes-intro-instruction-formats/)
  - U-Format -> lui to load [32-bit](https://stackoverflow.com/questions/50742420/risc-v-build-32-bit-constants-with-lui-and-addi) constant, see 1 'jal         ra,0x10418 <printf>'
  - SB-Format used ‘for small, local jumps.’ because of 13-bit offset, see 1
    - [why](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way) this weird encoding, [BL7(berkeley lecture 7) p46](https://inst.eecs.berkeley.edu//~cs61c/resources/su18_lec/Lecture7.pdf) weher inst is ‘instruction’ which is also referenced in the link 'used to store bit 11 of the SB-Format immediate'
      - keyword: 'sign extension hardware' which is also referenced in BL7 and [riscv_spec].
      - TODO: 'wiring the input bits', 'datapath sized wiring', 'two or so (1-bit) wires and one 1-bit mux and a 1-bit control signal'
  - more detailed why format defined as what it is, based on [riscv_spec] and greencard
    - p17 all keep 31~25 where not conflict with register. Because `load` is from mem to reg, `store` is from reg to mem (so no `rd`) and `jmp` will store pc+4. 
      - Then UJ to be similar to U and B, 'inst[19:12]', 'inst[30:25]' and 'inst[31]' has been put in the slots and based on [‘immediate bit 1’](https://stackoverflow.com/questions/39427092/risc-v-immediate-encoding-variants), bit 24-21 also are put. (TODO )
- [why](https://stackoverflow.com/questions/62807066/riscv32-vs-riscv64) RV64I
- why [pc+4](https://stackoverflow.com/questions/63904609/why-program-counter-in-risc-v-should-be-added-by-4-instead-of-adding-0-or-2) because instruction length
- TODO here [`jalr`](https://stackoverflow.com/questions/53036468/what-is-the-definition-of-jal-in-risc-v-and-how-does-one-use-it) maybe just indirect, not return always
#### [registers](https://en.wikichip.org/wiki/risc-v/registers),see this more [specific](https://msyksphinz-self.github.io/riscv-isadoc/html/regs.html) which is from manual chapter 25
- [global](https://five-embeddev.com/quickref/global_pointer.html) pointer function like base pointer related with 'Global variables'
- [thread pointer](https://www.indes.com/embedded/en/news/2020/12/450_Code_size__Closing_the_gap_between_RISC-V_and_Arm_for_embedded_applications/) (see link 'second global base','the model for the thread pointer') only used in 'thread-local' (thread [share](https://stackoverflow.com/questions/1762418/what-resources-are-shared-between-threads) (also see csapp)) 
- [alternate link register](https://stackoverflow.com/questions/44556354/jal-what-is-the-alternate-link-register-x5-for) ('clobber the link register') used in [Millicode](https://en.wikipedia.org/wiki/Millicode) with [prologue and epilogue](https://en.wikipedia.org/wiki/Function_prologue_and_epilogue)
  - pdf link [1](https://escholarship.org/uc/item/7zj0b3m7#page=59) or [2](https://news.ycombinator.com/item?id=19165301)
- here [saved](https://stackoverflow.com/questions/64545005/which-registers-are-saved-and-not-saved-in-risc-v) (similar to x86-64 design) is related with **callee**
#### manual interpretation
- p21 jalr still use multiple of 2 bytes by [`&∼1`](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#jalr), 
  - `r` means register.
  - 'error checking' because of dropping the least-significant bit which will jump to one non-instruction location.
  - 'the lowest 2 KiB or highest 2 KiB' -> -2^11 byte ~ 2^11-1 byte = -2KiB(2^10 bytes) ...
  - when in `while` loop, `jal` 
  - ['macro-op fusion'](https://en.wikichip.org/wiki/macro-operation_fusion) here first `ra` in `lui ra, imm20` doesn't function as return addr, so not pop to `ra` which isn't expected.
    - [RAS](https://one2bla.me/cs6290/lesson4/return-address-stack.html#return-address-stack-ras)
  - why use jmp and [link](https://en.wikipedia.org/wiki/Link_register) see paragraph 1
- p22 also book p221, 'rd=x0' just to **not pollute** ’conditional-branch prediction tables‘ and ’return-address stack‘ which is **useful**
#### common
- [riscv_spec]
  - `XLEN` -> 'width of an *integer* register' p4
- [riscv_privileged]
  - shadow CSR addresses, [see](https://github.com/riscv/riscv-isa-manual/issues/23). It is similar to cache memory (which is referenced as shadow memory [this stackexchange Q&A 'store a copy of a slower ROM'](https://electronics.stackexchange.com/questions/86032/what-actually-is-a-shadow-register).) 
    - why use it. See p6. To ensure the consistent permission of all access 'shadowed into separate CSR addresses ... made *read-write*'. So 'avoids trapping permitted' (i.e. shadowed addr) and 'causing traps on illegal accesses' (original addr).
      - It is same as what the Q&A above says 'double buffer' which keeps *atomicity* in some way (write FIFO and definite write [order](#atomic_ordered)) (see 'alter it to a shorter pulse ... ').
        - also see [frame buffer swap](https://en.wikipedia.org/wiki/Swap_chain) where backbuffer function same as shadow register.
        - banked register see [doc p4](https://simplemachines.it/doc/arm_inst.pdf) which is in [comment](https://stackoverflow.com/questions/13432297/what-does-banking-a-register-mean/13432309#comment29312732_13432309)
          - here 'different physical registers' to switch is because ['load values *used by* the interrupt handler'](https://electronics.stackexchange.com/questions/102742/what-does-banking-mean-when-applied-to-registers/102743#102743)
            - 'extend *addressable* storage': notice is not add availablility. [See](https://en.wikipedia.org/wiki/Bank_switching#Microcomputer_use). It is 'work around limitations in address *bus width*'(i.e. no need of 'switching to a processor with a wider address bus' and 'access separate RAM banks' by something like 'supporting 8 banks of 64 KB' using 'via bank *select registers*'(i.e. Internal bank registers)). And it also manage 'input-output devices and system management registers'.
              - why faster than paging: '*switched out* from ...' and 'could be used by other hardware'.
                - They can be implemented at the same time.
              - Notice: it is more seen in early computers where processor can only *address* a limited range.
- miscs
  - [PMA](https://docs.openhwgroup.org/projects/cv32e40x-user-manual/en/latest/pma.html)
### stackoverflow asked questions
#### 1
- CAS_weak [diff](https://stackoverflow.com/questions/72766332/c11-how-to-produce-spurious-failures-upon-compare-exchange-weak) CAS_strong. From 'Godbolt' in link, `cbnz    w4, .L5` is main diff which will retry after store failure. (also [see](https://stackoverflow.com/questions/4944771/stdatomic-compare-exchange-weak-vs-compare-exchange-strong) 'overhead to retry' where it says when to use each)
- COD p254 [question 1](https://stackoverflow.com/questions/76374201/does-lock-can-avoid-lr-sc-spuriously-fail/76384145#76384145) ‘also a benefit to not storing at all when the load sees a non-zero value’ (also [see](https://stackoverflow.com/questions/76285849/what-does-this-compare-exchange-weak-example-loop-do-on-atomic-boolean-from-a))
  - here 'specific to the LL/SC' means that although `lr/sc` will check write to memory, but it doesn‘t check value in mem. So if mem is already not valid (i.e. lock is used by another thread in here condition) before `lr`, it will not throw error.
    - 'reduce livelock' is because of 'not storing at all when the load sees a non-zero value', so won't unnecessary try to 'dirty cache line'.
  - TODO above 'inline' link 
### macro-op with micro-op
- definition [macro-operation MOP/µOP](https://en.wikichip.org/wiki/macro-operation#:~:text=In%20their%20context%2C%20macro%2Doperations%20are%20a%20fixed%2Dlength,%2C%20modify%2C%20and%20write%20operation.)
- [fused](https://easyperf.net/blog/2018/02/04/Micro-ops-fusion) instruction example
  - Macro-operation fusion [vs](https://stackoverflow.com/questions/56413517/what-is-instruction-fusion-in-contemporary-x86-processors#comment99423928_56413517) Micro-operation fusion
    - here based on angle [doc p109](../references/microarchitecture.pdf), 'multiple' should be 'two' and Micro-op is just 'read/write' action,etc while [Macro-op](https://en.wikichip.org/wiki/macro-operation#:~:text=In%20their%20context%2C%20macro-operations%20are%20a%20fixed-length,%2C%20modify%2C%20and%20write%20operation) is instruction
    - [TODO](https://easyperf.net/blog/2018/02/15/MicroFusion-in-Intel-CPUs)
- Macro-Operation Fusion example [`cmpjne`](https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(client)#Instruction_Queue_.26_MOP-Fusion) (notice: this instruction is not available in ISA set)
  - here `50` in 'duplicated over for each thread (i.e. 50 total entries)' is mainly because that Broadwell has 2 threads all
- [better](https://community.intel.com/t5/Software-Tuning-Performance/Macro-fusion-merges-two-instructions-into-a-single-micro-op/m-p/1139693#M6608) to read [Agner‘s microarchitecture doc](../references/Agner/microarchitecture.pdf) '8.9 Execution units' and '8.5，4'
  - [branch hint](https://stackoverflow.com/questions/14332848/intel-x86-0x2e-0x3e-prefix-branch-prediction-actually-used) not used now.
  - '16-byte boundry' because COD p645 second step
  - ’not a memory and an immediate operand‘ because ROB can only store one temporary value (i.e. 'There is not enough space for storing both'), see CAQQA p245.
    - other with register can store register value in register file.
  - 'the address of a branch target' see ['Destination (either memory address'](https://en.wikipedia.org/wiki/Re-order_buffer)
  - 'are split into two μops' ’read instructions have only one μop‘ because in doc above context says 'read-modify instructions' instead of 'read instructions'
- COD p645
  - also see [wikichip](https://en.wikichip.org/wiki/intel/microarchitectures/sandy_bridge_(client)) 'two fused µOPs only occupy a single entry in the ROB'
    - TODO 'fragmented across 2 MiB entries','with four entries for 1 GiB page'
  - stackoverflow [Q&A](https://stackoverflow.com/questions/76394605/question-about-micro-op-fusion-related-with-rob-entry-occupation-and-micro-op-f?noredirect=1#comment134713199_76394605)
    - TODO [performance counters](https://relate.cs.illinois.edu/course/cs598apk-f18/f/demos/upload/perf/Using%20Performance%20Counters.html) for [retire slots ‘td_slots_retired’](https://lore.kernel.org/lkml/1462489447-31832-4-git-send-email-andi@firstfloor.org/), [metric](https://shbakram.github.io/assets/papers/honors-thesis-adi.pdf) understanding
    - [‘indexed addressing modes micro-fused’](https://stackoverflow.com/questions/76394605/question-about-micro-op-fusion-related-with-rob-entry-occupation-and-micro-op-f) -> ‘indexed addressing modes are always *un-laminated*’
    - lfence is [no use](https://stackoverflow.com/questions/20316124/does-it-make-any-sense-to-use-the-lfence-instruction-on-x86-x86-64-processors) in contemporary cpu and SFENCE is less than MFENCE with `StoreLoad`.
      - why non-temporal [implies](https://community.intel.com/t5/Intel-C-Compiler/Asymmetry-in-non-temporal-streaming-load-store-intrinsics/m-p/1185919) streaming, because 'write directly to the *graphics frame buffer*'. Also see [this](https://web.archive.org/web/20120210023754/https://software.intel.com/en-us/articles/copying-accelerated-video-decode-frame-buffers), so it implies '`USWC` memory'. <a id="non_temporal_streaming"></a>
        - `USWC` -> [Uncacheable by L1 cache](https://stackoverflow.com/questions/75224657/memory-type-wb-vs-uswc-of-memory-mapped-files-on-x86),etc 
        - more [detailed](https://sites.utexas.edu/jdm4372/2018/01/01/notes-on-non-temporal-aka-streaming-stores/) which says 'Non-allocating store'
          - 'Non-globally-ordered store': order is only needed in the processor, not always when interprocessor communication. (Same as intel doc says).
      - [store-miss](https://stackoverflow.com/questions/18408189/cpu-cache-performance-store-misses-vs-load-misses) [policies](https://en.wikipedia.org/wiki/Cache_%28computing%29#Writing_policies)
        - wikipedia
          - 'Write allocate' is *usually* tied with 'write-back' ( here 'allocate' to 'cache'. which implies the *read* by '*fetch* on write', also see CAAQA p167 which is related with write buffer ('backing store') when 'No-write allocate'.)
            - 'is done *only* to the cache,... write to the backing store is *postponed*' in 'write-back' is in conflict with 'written directly to the *backing store*'(i.e. main memory or lower memory of L1 like L2) in 'No-write allocate'
              - notice: ['if a write hits, the cache will be *updated*'](https://www.quora.com/What-are-Write-Allocate-and-Write-No-Allocate-Cache-What-are-their-merits-and-demerits)
            - 'write-through' is compatible with 'Write allocate'
          - 'a read miss in a write-back cache' : implies the cache line is *full*, so need both eviction (this implies 'write...' to lower memory ) and read.
            - 'dirty' means has been used.
          - from this [image](https://en.wikipedia.org/wiki/File:Write-back_with_write-allocation.svg), ~~cache hit occurs when cache has *empty slot* to store data instead of it has cached store location and been dirty.~~
            - [write-miss](https://cs.stackexchange.com/questions/133352/what-is-a-cache-write-miss) ~~may be not consistent with the image.~~
            - see p771 'if the *tag* mismatches, then a miss occurs'
          - 'coherency protocols' ~~see this markdown ~~ just means synchronous operation among caches.
        - stackoverflow
          - 'is already in the cache' means the *location* is cached, So 'store-miss' is just  the location not exists in cache.
      - ['CLFLUSH'](https://stackoverflow.com/questions/54434006/does-clflush-instruction-flush-block-only-from-level-1-cache) is to synchronize cache 'of all cores'.
        - intel [doc](https://www.felixcloutier.com/x86/clflush) :'that data is written back to memory.','speculative reads','speculatively loaded into a cache line'
      - [LLC](https://en.wikichip.org/wiki/last_level_cache)
      - 'it's only a hint, so it *doesn't force* the'
### Agner‘s doc
#### microarchitecture
- 10.8 -> 'reorder buffer and the scheduler' so scheduler is [reservation station](https://stackoverflow.com/questions/76394605/question-about-micro-op-fusion-related-with-rob-entry-occupation-and-micro-op-f#comment134711147_76394605) [sometimes](https://www.realworldtech.com/merom/5/), also see COD FIGURE 4.74 ,[link 1 in above link's comment](https://stackoverflow.com/questions/51986046/understanding-the-impact-of-lfence-on-a-loop-with-two-long-dependency-chains-fo)
  - here 'RS can't fully overlap both dep chains' -> link 1 'as the two dep chains are *120 uops* long (vs. a RS size of 97).'
  - 'micro-fusion doesn't apply to the RS' -> ~~TODO maybe 'micro-fusion' occupys one RS entry.~~ 'They both only take *one* ROB entry for a micro-fused uop'
### CAAQA
- virtual cache
  - this [disadvantage](https://www.alibabacloud.com/tech-news/virtualization/1km-how-virtual-cache-memory-works) description has not many detailed infos
  - p742 definition ;p744 alias <a id="alias"></a>
    - p744 TODO should be 'two blocks in each of *eight* sets' because $64=4*2*8(2^3)$. Need search all page because 'different virtual address' mapping with 'operating systems and user programs',etc.
- p754
  - the cache size and the page size is both $2^13$ byte and $512=2^6*2^3$ bit
  - here should be `TLB tag <43>` ~~first~~ check to ensure TLB data right which translate from virtual address to physical. 
  - ~~TODO~~ here `L1 cache tag <43>` should be `L1 tag compare address <28>` which corresponds to the tag in the physical address. See p745.
- p162
  - Unified TLB miss penalty higher than L1 because it is [not on-chip](https://chipsandcheese.com/2023/05/28/arms-cortex-a53-tiny-but-important/).
  - [Softcore vs Hardcore p3](https://www.uio.no/studier/emner/matnat/fys/FYS4220/h20/lecture-slides/embedded_softcore_vs_hardtcore.pdf)
  - 'two different cache addresses' because 'up to four banks' and $4*2*4=32$.
  - 'hardware detection' see above p744.
  - '32 KiB' -> L1 $2^8*64(2^6)=2^4$K (page) -(2 bank which seen from the picture)> $2^5=32$KiB primary cache.
- p163
  - compared with appendix B ~~Opteron~~ p754, the TLB tag should be compatible with L1 tag based on different occasions.
    - Here `Virtual page number` just ~~function as index~~ search the whole TLB without index because of 'Fully associative' Data MicroTLB with `Data TLB` and both index and tag with , while p754 as both index and tag.
  - TODO [Pseudo-LRU](https://en.wikipedia.org/wiki/Pseudo-LRU)
- p166
  - TODO should be $2^6=64$ 'GiB'.
  - Section B.4 p754 say two-level cache instead of TLB although similar.
    - two-level TLB see p163.
  - 'virtually indexed' p744.
  - ' 4 KiB page size,' -> need [$4*2^10(K)=12$](https://stackoverflow.com/questions/33216503/how-many-bits-required-for-page-frame-number-on-32-bit-system-with-220-bytes-ph) bit offset
#### related with figure, p167~169
~~- how '1536 PTE' and '128 PTE',etc are indexed TODO.~~
- $1536/12=2^7$. Also DTLB should use Tag<32> which is same as ITLB.
- [protection bits p9 at least 3bits TODO 4bit](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-tlbs.pdf)
- here bank is just associativity
- interpretation of the figure
  - 1
    - 36 bit -> index + tag
      - ITLB: $2^4=128/8=16$
        - notice : here should check tag as L2 TLB does.
  - 4
    - check tag
  - miscs
    - here if TLB miss, L2 TLB -> I/DTLB -> I/DCACHE
    - 128 bit instruction because max is [15 bytes](https://en.wikipedia.org/wiki/Instruction_set_architecture#Instruction_length) from [this](https://stackoverflow.com/questions/14698350/x86-64-asm-maximum-bytes-for-an-instruction), then min n for $2^n>15$ is 4.
    - here 'additional 2 bits' are not shown in the figure. (2bit -> $64/16=4=2^2$)
    - `...` means pipeline in figure. ('L1 cache is pipelined')
    - 'composed with the *page offset*' is not shown in the input of L2 CACHE of the figure.
    - [unified cache](https://en.wikipedia.org/wiki/CPU_cache#Separate_versus_unified)
    - 'initial 12-cycle latency' includes the 4-cycle latency in L1. 
    - notice L2 '8 bytes per clock' (data transfer size) and L3 '16 bytes' (instruction transfer size)
    - 'both channels have identical DIMMs.' mostly means their [freq](https://forums.tomshardware.com/threads/do-two-dimms-have-to-be-identical-if-there-in-the-same-channel.395140/) and size same.
      - see channel relation with DIMM w.r.t the hardware. 
    - $200\sim(64-16)/16*20+160(220)$
    - merging write buffer
      - write buffers [destroy](https://stackoverflow.com/a/66775022/21294350) sequential consistency because the processor running `store,load` can be seen as `load,store` by others due to the delay of store buffer.
        - kw:'these 2 get reordered','the load of B will *overtake* the store of A' 
      - implemented by ['combines writes that have *consecutive* destination addresses'](https://en.wikipedia.org/wiki/Write_buffer)
        - also [see](http://thebeardsage.com/cache-optimization-merging-write-buffer/)
        - Write [combining](https://en.wikipedia.org/wiki/Write_combining) while may change store order because it delays the store by combining them and write together.
          - kw: 'lead to the write combining order'; 'be treated as a fully associative *cache*' (so `read` can fetch it.)
          - here intel is [strong](https://preshing.com/20120930/weak-vs-strong-memory-models/) so no need to make 'the write buffer' '*added* into the memory hierarchy' <a id="strong_mem"></a>
    - 'when the next level in the cache is *unused* for a read'. This increase the throughout of the write buffer by increasing the usage rate.
    - 'see if the cache line exists': use write buffer to speed up the *search*.
  - TODO
    - in Icache, offset may not be used in the left block.
    - 'The four tags and valid bits' may be eight (because eight banks) and tag is higher bits of physical addr.
- p168
  - ~~TODO here should be 'the same place in the cache' which implies alias (see [above](#alias)) instead of ' two different places in the cache' (just origianal eight-way index has one redundant bit, so conflict miss.)~~
  - ~~TODO 'four-way set associative' need more infos. Because if with the same info as 6700, then four-way needs 7bit index while 6bit will select only half.~~ See [this](https://stackoverflow.com/questions/76530296/what-is-the-relation-between-set-associative-and-cache-aliasing) <a id="Virtual_Address_Aliasing"></a>
    - [Homonyms and Synonyms (aliases)](http://www.cse.unsw.edu.au/~cs9242/02/lectures/03-cache/node8.html) (this can also say VIPT alias problem.)
    - also see page-coloring [with p18](https://www.inf.ed.ac.uk/teaching/courses/car/Notes/2016-17/lecture09-virtual_memory.pdf) VI-PT caches 
      - Also see [this](https://www.intel.com/content/www/us/en/docs/programmable/683836/current/virtual-address-aliasing.html) although it doesn't say about 'VI-PT' but it implies the virtual *index* to be make same physical address be placed in different cache location.
        - kw: '*untranslated* bits of the page offset'; 'bits *beyond* the page offset (bits 12 and up) are used to select the cache line' (So `0x1000` and `0x2000` can map to same physical address because their *page offset* are same.); 'virtually-indexed and physically-tagged'
    - Also see [this 'the bits for indexing the cache *all come from* the page offset bits'](https://cs.stackexchange.com/questions/68492/does-the-aliasing-problem-show-up-in-a-virtually-indexed-physically-tagged-cache) which offers detailed paper about [TLB](https://www.academia.edu/29585076/A_Survey_of_Techniques_for_Architecting_TLBs)
    - wikichip has [no info](https://en.wikichip.org/wiki/Intel_Core_i7-4700HQ) before [57...](https://en.wikichip.org/wiki/intel/core_i7/i7-5750hq)
    - maybe ~~no [4-way](https://en.wikichip.org/wiki/intel/core_i7/i7-2535qm)~~ [4-way](https://en.wikichip.org/wiki/intel/core_i7/i7-610e)
  - [page coloring](https://en.wikipedia.org/wiki/Cache_coloring) which ensures that '*sequential* pages' will never contend with neighbor pages (also for same page which is implied.) by keeping lower $n$ bits same to keep them *separate*.
    - So 'when the page map is changed', no need w.r.t 'must be checked' because above 'sequential' pages are ensured with no conflict.
    - Also see ['The OS kernel can program that MMU', 'MMU can be *programmed* to translate'](https://stackoverflow.com/questions/3435606/how-are-same-virtual-address-for-different-processes-mapped-to-different-physica). So virtual map can be random, although Os kernel will not do randomly as usual.
  - 'demands that this access result in an exception because of an access violation.' -> (should) result in (this line is english interpretation.)
  - 'page table walkers' [see](../references/other_resources/CAAQA/Hennessy_References_Appendices/Appendix_L_online.pdf) 
    - TODO [Radix tree](https://en.wikipedia.org/wiki/Radix_tree)
    - ~~[NTLB p2](https://pages.cs.wisc.edu/~remzi/Classes/838/Spring2013/Notes/twodimwalk.pdf) which is po shadow page table~~
      - also [see](https://projectacrn.github.io/latest/developer-guides/hld/hv-memmgt.html) where [EPT](https://en.wikipedia.org/wiki/Second_Level_Address_Translation#Extended_Page_Tables) is SLAT (guset and host: two level)
    - p2
      - With linux, it [doesn't offer](https://forums.sifive.com/t/tlb-miss-and-page-table-fault-handling/2618) 'interrupt handler to ”walk” the page table' where SBI means 'Supervisor Binary Interface' in risc-v.
        - [`grub`](https://en.wikibooks.org/wiki/X86_Assembly/Bootloaders#GNU_GRUB) use 'Two-Stage' because by convention ['the last word of the sector must contain the signature 0xAA55'](https://en.wikibooks.org/wiki/X86_Assembly/Bootloaders) ([Single Stage](https://wiki.osdev.org/Bootloader#Single_Stage_Bootloader) is small)
      - TODO [check with `opcontrol` perf tool][TLBs_and_costs] self machine TLB
      - from [this where *hardware* 'the state machine handles a TLB miss'](https://dl.acm.org/doi/pdf/10.1145/291069.291065) 'the reorder buffer need not be flushed'
      - nTLB (skip nested table,see appendix p25) (the following link p2 'caching the full 2D translation') see amd doc p1005 and [also](https://pages.cs.wisc.edu/~remzi/Classes/838/Spring2013/Papers/p26-bhargava.pdf)
        - here why nested is just same as why use multi-level virtual-page (To increase the whole page size.) 
        - p1 $nm + n + m$ just view p3 image.
          - notice condition to use nested page 'overhead is greater than'
        - [PWC](https://developer.arm.com/documentation/ddi0517/f/functional-description/cache-structures-of-the-mmu-500/page-table-walk-cache)
        - 'Guest physical addresss' function as *base* addr of next level page table.
    - p3
      - 11 p6 use [speculation](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=343a384d5476ead9496f96559aba5ad09e95e01e) -> 'overlap page table walks with independent instructions'
      - [Exploiting Clustering p3](http://www.cs.yale.edu/homes/abhishek/binhpham-hpca14.pdf) to increase Spatial Locality (just see the figure to get the scratch quickly.)
      - TODO 'coalesce multiple virtual-tophysical page translations into *single* TLB entries'
      - [68 'Concurrent Support of Multiple Page Sizes'](https://pdfs.semanticscholar.org/45f9/391ba46daa4b119063f4d5077a1b7f7fde75.pdf) -> set Page Size dynamicly.
      - ~~TODO~~ ~~may use more hardware~~ to 'service multiple TLB misses concurrently'. see p21
    - just see p20... on how hardware implements the page table walkers 
  - '36 bits  6 bits (index)  6 bits (block offset)' -> 36bit physical addr - $log_{2}(512/8)=6$ bit index.
- p343
  - SIMT vs SIMD
  - with p344,`name < <<dimGrid, dimBlock>> >` just use grid and block to use `grid*block` threads
- p345
  - 'hide latency to DRAM' is [same](https://www.geeksforgeeks.org/multithreading-and-latency-hiding/) as how pipeline or OoO reduce latency.
- p346
  - terminology ~~from CPU to GPU~~
  - 'mask and predicate register': the [former](https://en.algorithmica.org/hpc/simd/masking/) may has no mask register from ['The predicate registers are usually used as bit *masks* for data operations'](https://developer.arm.com/documentation/102476/0001/SVE-architecture-fundamentals) and the [latter 'conditional mask vector'](https://en.wikipedia.org/wiki/Predication_(computer_architecture))
    - from the ~~first~~ ~~arm~~ algorithmica link 'through predication', it can also be seen that mask and predicate means the same thing.
      - [_mm256_blendv_epi8](https://www.intel.com/content/www/us/en/docs/cpp-compiler/developer-guide-reference/2021-8/mm256-blendv-epi8.html) TODO epi meaning; 8->[8-bit](https://www.felixcloutier.com/x86/pblendvb#vpblendvb--vex-256-encoded-version-) transfer unit.
        - here [/is4](https://www.felixcloutier.com/x86/pblendvb#instruction-operand-encoding) also see intel doc p600
          - in 64-bit, ymm index use 4bit see p603. So see p538 'VEX.W' as 'REX.W' and p533 how REX use which will change `ModRM`,etc.
            - VEX.vvvv p541
          - TODO see practical usage of `VSIB` p545
      - here just to avoid branch prediction by calculating similar conditions as *vector*.
  - view the 'Figure 4.12' with the following.
- p347
  - 'vector processor' vs ... see 'Figure 4.22' p365.
  - TODO [difference](https://en.wikipedia.org/wiki/Vector_processor#Difference_between_SIMD_and_vector_processors) between SIMD and vector processor。 [Also](https://stackoverflow.com/questions/12965377/simd-vs-vector-architectures) [p3](http://www.cse.msu.edu/~cse820/lectures/CAQA5e_ch4.pdf)
  - 'each multithreaded SIMD Processor is assigned 512 elements' -> one thread block.
    - GPU with Processors -> grid with blocks
      - 'Scheduler' control the 'transparent scalability' to enlarge GPU when developing the hardware.
  - ['strip-mined vector loop'](http://physics.ujep.cz/~zmoravec/prga/main_for/mergedProjects/optaps_for/common/optaps_vec_mine.htm) same as csapp ~~unloop~~ loop unrolling.
  - ~~'a SIMD *instruction* executes 32 elements at a time' -> p348 ~~
- p348
  - 'Thread Scheduler ...' So whether threads in one block are ~~*not parallel*~~ parallel depends on GPU .
- p349
  - just show how *multithreaded* implemented with multiple SIMD lanes (thread)
#### TSO and other memory consistency model
- TSO [p10](https://www.cs.rice.edu/~johnmc/comp522/lecture-notes/COMP522-2019-Lecture9-HW-MM.pdf) also see book p453
  - also see [riscv_spec] p26 and [riscv_privileged] p53
  - definition based on relation with [PSO][TSO_PC_PSO]
    - ~~TODO maybe ~~ has relation with [Partially ordered set](https://en.wikipedia.org/wiki/Partially_ordered_set) (relation with StoreStore reordering in PSO) which is also referenced in original SC [paper][SC_orig] 'partial ordering on the set of memory requests.' and the following Relaxed Memory Consistency Models are based on sequential consistency as in [p6][CSG280].
      - obviously the order is about StoreStore because TSO is normally based on write buffer (FIFO) which ensures [no reordering][#StoreStore] of StoreStore.
    - here example 1 is based on synchronization.
    - `total Store Ordering` means *total*ly allowing re*ordering* *store* with subsequent load which can be implemented by *store buffer*.
    - maybe the most primitive [definition p31:TSO](https://www.google.com/books/edition/Scalable_Shared_Memory_Multiprocessors/OJzbBwAAQBAJ?hl=en&gbpv=1) of all memory consistency models having all *math axioms* which is referenced by [this]. 
    - also see [sparcv9][sparcv9] p143 and [this 'a single, global order of writes'][Weak_vs_Strong_Memory_Models]
  - notice it doesn't guarantee the strong memory model, it just means having a [store buffer (utexas link)][memory_models] so allow [Storeload reordering p4](https://users.cs.utah.edu/~rajeev/cs7820/pres/7820-12.pdf) (here 'it returns the value of own write before others see it' is same as ['with exceptions for *local* memory'](https://www.reddit.com/r/hardware/comments/i0mido/comment/fzqb4is/?utm_source=share&utm_medium=web2x&context=3)) (also see the utexas link) from user's perspective although their issue order may not change.
  - [explicit definition](http://www.cse.unsw.edu.au/~cs9242/02/lectures/10-smp/node8.html) here 'FIFO order' implies it is [~~subset ('might as well say that sequential consistency *map*')~~ ycombinator link](https://news.ycombinator.com/item?id=21588893#21592299) ~~of~~ similar to sequential consistency because requirement R1 may not meet (see [p6 'regain sequential consistency' (i.e. 'recover sequential consistency with additional barriers' in the above ycombinator link)](https://www.cl.cam.ac.uk/~pes20/weakmemory/cacm.pdf)). But 'sequential consistency (SEQCST) + a store buffer' in ycombinator is obvious true which can also got from the following upenn link although store buffer will change the original behavior of sequential consistency. <a id="TSO"></a>
    - as ycombinator says ('Acquire-release consistency allows many more reorderings'), here SC > TSO (only allow StoreLoad reordering) > Acquire-release (> means [stronger](#strong_mem))
      - [see ac_rl](#ac_rl), [acq_rel][acq_rel_cpp] only control *order* of same variable (implies support for variable alias). So from [this 'freely reorder...cannot migrate upward past an *acquire*...'](https://en.wikipedia.org/wiki/Release_consistency#Weak_ordering_(Weak_consistency)) 
        - here 'synchronization accesses' implies from the context that it is not for threads at least (also from above ac_rl code behavior).Also should [second sense](https://en.wikipedia.org/wiki/Weak_consistency)
    - here 'Loads read from write buffer *if possible*.' also implies 'store is a release...' in the above ycombinator link.
    - Also see this [upenn link:p9 vs p15 difference][sc_tso_cis601]. Here FIFO ensures the StoreStore order unchanged (see p5). But the store *buffer* *delays* the store to *memory* <a id="StoreStore"></a>
      - p7: see doublequote contents which is definition of SC(Sequential	Consistency).
      - p9: `<m/p`, `	MAX	<m/<p` meaning
      - p13: `C↓1` meaning.
      - p15: `S(a)<p	L(a)` just means it allows delay so *memory order* (see p7) changed (load access memory earlier than store.)
- [Weak Consistency (WC)][Weak_Consistency]
  - memory MOOULES is hardware interface with memory,see [SC_orig] p2 top left.
  - p6 just defined based on synchronization, similar to [wikipedia](https://en.wikipedia.org/wiki/Consistency_model#Weak_memory_consistency_models).
  - p2
    - 2a: interconnection of local memories ('MEM') by using *bus* and wires. And it also function as remote
      - it can access memory more quickly than 1.
      - notice in the figure, enqueue right and dequeue left. 
  - Also see [mosberger93memory]
    - def 2&3 -> fences.
  - this [paper where only reference SC_orig when saying 'In return the system appears sequentially consistent'](https://dl.acm.org/doi/pdf/10.1145/139669.139674)
    - [mosberger93memory] p6: here no data race ensures the *sequential* and 'synchronization is visible to the memory' just to ensure cache/others_mem coherency and avoid starvation or deadlock,etc.
    - also see [isca90_GLL_90] p5 WCsc: sc implies total synchronization -> SC. 
- [Release Consistency (RC)][isca90_GLL_90]
  - see [cppreference](https://en.cppreference.com/w/cpp/atomic/memory_order#Release-Acquire_ordering) 
    - Release-Acquire
      - A_stores -> A_store_release -> A_store_between -> B_load
                                                                 -> C_load
        - Above diagram is same as [Lamport_1985] convention convention: B will see A_stores 'visible side-effects'. And B may see 'A_store_between'(i.e. a value from later in the release sequence).
        - C_load may not see A_store_release -> A_stores (See 'established only between')
      - 'prohibited from moving non-atomic stores past' is just as [ac_rel] says.
      - Notice: how A and B see A write *order* may differ (from 'than *either* or both').
        - This is mainly because synchronization latency.
      - kw: 'Mutual exclusion locks'
    - Release-Consume
      - similar to above: 
        A_stores -> A_store_release -> A_store_between -> B_load -> B_consumer_use_load
        - Both B_consumer_use_load and B_load will see 'A_stores -> A_store_release' (See 'within those operations ... *into* which the load operation carries *dependency*')
      - kw: 'DEC Alpha',
      - ['speculative load'](https://llvm.org/docs/SpeculativeLoadHardening.html)
        - [Side-channel attack](https://en.wikipedia.org/wiki/Side-channel_attack). Here 'side' means '*extra* information'. e.g. 'power analysis' is by viewing cpu power then guessing what is running.
        - here 'leak secret data' may implies 'comparing an attacker's given *password*' in above wikipedia. -> [cache-timing attack 'whose *timing* obviously *varies* with, among other things, input-dependent RAM *cache hits*'](http://cr.yp.to/antiforgery/cachetiming-20050414.pdf)
        - here 'speculative' means `value` may be saved in ROB *cache*.
        - So 'Consume' implies no 'speculative load' because it may cause *load* value changed (Here is mainly about Therad A load, B may be free to reorder its load).
      - ['carries_dependency'](https://en.cppreference.com/w/cpp/language/attributes/carries_dependency) just avoid `fence` overhead.
        - See [godbolt](https://godbolt.org/z/Gr9sff69b), it may have no influence with two `print` same.
        - [kill_dependency](https://en.cppreference.com/w/cpp/atomic/kill_dependency) does opposite.
      - 'currently (2/2015) no known production compilers *track dependency chains*: ... *lifted* to acquire operations.' and 'The specification of release-consume ordering is being *revised*'
      So both compiler and language semantics may *change*.
    - So 'Release-Acquire' is more about the whole program result. While 'Release-Consume' is about one data structure (with one 'dependency chain'). Why designed as what they are is obviously tuning WC(weak consistency) (see 'may be an expensive operation on *weakly-ordered architectures*').
      - So [rcu](https://en.wikipedia.org/wiki/Read-copy-update#Name_and_overview) is 'An example of such scenario' because it only cares about 'a linked structure' and 'avoids the use of lock primitives' to keep 'multiple threads *concurrently read*' which is obviously not available in the lock context.
        - here 'update' is to ensure 'consume' right.
        - it checks 'no readers left using the old structure' to ensure space deallocation.
  - p2 'LOAD Globally' just to check whether StoreLoad reordering and the overlap because of 'non-atomic STORES'.
  - p5 '(stricter)' definition similar to order.
  - 'only rquired to be processor consistent' because reordering of StoreLoad is same as what acquire and release do in [ac_rel].
  - p4 'nsyncL for the store' ~~because here only needs read not interrupt by others and precedes the self Modify-Store. Store is then to write buffer and also probably adjoint.~~ because atomic so nothing to release ['it does not 'release' anything'](https://stackoverflow.com/questions/51978573/memory-ordering-or-read-modify-write-operation-with-read-write-only-memory-ord).
  - p6 'chaotic relaxation' definition 
- [Atomic Consistency][slow_mem] from [mosberger93memory][mosberger93memory]
  - in '2.2', 'we use atomic, con-sistent and coherent *interchangeably* t o refer t o intuitive correctness' and '2' consistent (atomic) memory must be *slow* in high latency environments.
    - So here atomic memory is just shared memory.
  - '2.3' still assumes SC, also see [sc_tso_cis601] p8 and 'SNIR.pdf' p9.
    - here 'x = 0,y = 1 is prohibited' is just why 'consistent memory will not allow the final outcome in which *both processes read 0*.' in 2.2. So atomic memory is just consistent memory. This paper *terminology* may be *too casual*.
    - It is definitely not this [physical atomic memory](https://www.npr.org/sections/alltechconsidered/2016/07/28/486755823/writing-data-onto-single-atoms-scientists-store-the-longest-text-yet) based on atoms. 
  - here 'serial execution' just to avoid [loop 'Things that shouldn’t happen'][memory_models].
  - 'read-begin or write-end' just means read take effect at once while write delays to *end*. So order is more 'determinism' than dynamic atomic memory.
  - [herlihy paper][herlihy] from Fig. 1,2 we can know LINEARIZABILITY is similar 
    - here 'linearizability,' is related with ' real-time' which wikipedia also says because it 'is also a *nonblocking* property:'.
    - why defines [locality p13](http://courses.csail.mit.edu/6.852/03/lectures/linearizable.pdf) just to simplify development so that can develop 'individual object'(herlihy p8, also slow_mem 308).  
    - p5 join also see csapp or [this](https://stackoverflow.com/questions/25391025/what-exactly-is-python-multiprocessing-modules-join-method-doing): it is just to wait to avoid zombie so that all threads can be controlled.
      - also says definition of 'sequential' by 'immediately followed' which is opposite of 'concurrent.'.
    - p7 extended: L1. means adding response can make sequences of inv/res pairs (see p5 'complete(H) is the maximal') sequential (non-overlapping p5).
      - in short, it just allows adding res of pending inv to make match (p5). (p5 has almost all defs used.)
      - So [Linearizability_atomic] is not `H` ('an ordered list of invocation' in wikipedia po) but `S`. <a id="atomic_ordered"></a>
  - [Lamport_1985]
    - p20 'atomic register' '*definite* order' which is just similar to synchronization and *all* [acq_rel][acq_rel_cpp] instead of just before acquire and release (see [CAAQA][CAAQA] p453).
      - from ' *introduced two* weakenings' in slow_mem, it means the same thing as '3.1 Atomic' in [slow_mem][slow_mem]
      - this also implies the FIFO of instruction queue in herlihy p4 (more detailed see its reference [Misra_1985 p2 'concurrent accesses to the common register are *sequentially* ordered.'][Misra_1985]).
  - here can be seen as *both read* and write atomicity.
  - Also from '3.2', 'the effects of operations may appear *delayed*.' doesn't conflict with definition because definition only ensures *executed* (issue) order and consistency with program order.
    - in short, it doesn't ensure [cache consistency](#cache_consistency).
    - delay ~~implies *overlap* although [above][#overlap] says no overlap.~~  ' as their name implies, non-overlapping,' in p304
    - here key point is that the '*some* sequential order' which may not be original program order.
      - see different sequential orders [p8][sc_tso_cis601].
    - 'Both private and serial memory are *restrictions* of tradi-tional atomic memory' means atomic memory don't have some advantages of the former. So it is more restrictive.
      - ' to-tally ordered ' implies private is somthing like ~~cache~~ write-buffer. and '*partially* ordered by the several inter-leaved program orders' implies the delay of write-buffer.
    - 'need not be retained by' just means not has one absolute relation.
    - 'delayed by differing amounts,' just means stall, see below diagram.(`[]`means the begin and end where write must take effect).
    ```bash
    [W(x)1                              ]
          [W(x)2     ]
                      [R(x)2][R(x)0       ][R(x)1]
    ```
    - p305 'P2:W(y)2 and P3:R(y)2' (same as [mosberger93memory] p4 'R(y)2' which 'reads a value that has *not been written yet*') is sequentially consistent because rereading its definition. It says ' the result of any execution is the *same* *as if* the operations of *all* the processors were executed in some *sequential* order, and the operations of *each* individual processor appear in this sequence inthe order *specified by its program*.'
      - So here it just runs *same as* what the original *program sequential* result (see the diagram timeline which is what [Lamport_1985] does in p).
      - here read future is what regular/safe register allows but atomic register not allows. So shows the [mosberger93memory] p4 Figure 2.
      - here SC *allow reordering* as seen from the above example. But from the perspective of *results*, it not allow reordering and 'appear in this sequence in the order *specified by its program’*' -> as program order.
- ~~TODO~~ in this ~~[paper](https://dl.acm.org/doi/pdf/10.1145/160551.160553)~~ (the former is too coarse see [this mosberger93memory paper][mosberger93memory]) which lists almost all *consistency* models (highly recommended because it says the differences very *clearly*, the link is from [wikipedia][Wl_1]),`R(y)2` in p4 seems to be conflict with upenn link p8(a). This may be the 'surprising *flexibility* of the SC model' because it not [defines][Sequential_consistency] how to *read*.
  - notice here PC has at least two versions 'PC as defined by the DASH group ...  is not *comparable*' (See paper_2 and paper_3 below).
  - atomic consistency with ['real-time constraint' in Sequential_consistency wikipedia][Sequential_consistency] because ['*vague* about when an operation is considered to begin and end'](https://en.wikipedia.org/wiki/Linearizability#History_of_linearizability)
    - [here][Linearizability_atomic]. kw: `ordered` (this is main difference with SC where order is not determined. Only 'sequential' is ensured. also see [herlihy] p2 'legal sequential ')
      - `ordered` also implies synchronization.
      - TODO see [herlihy] about why 'sequential history is a subset' in wikipedia.
      - definition see [herlihy] p7
    - maybe also related with cache with just [*synchronization*, see 'real-time constraints', '*tell* some other process about an event','*observe* that event'](https://jepsen.io/consistency/models/sequential) 
  - paper interpretation
    - 'appear commuted' -> non AC because 'non-overlapping'?
    - 'Causal Consistency': casual based on one processor's load/store order (here is $P_2$ order). So $W(x)2,W(x)3$ is not casual.
    - 'Cache Consistency': here 'per-location basis' just means cache data physical address. So assume that $P_1: W(x)1,R(x)$ and $P_2: W(x)2,R(x)$, then both processors should read same which implies Cache Consistency.
    - combi-nation of coherence (see ' as long as those writes are to *different* locations') and PRAM ('...disagree on...')
  - *Processor* consistency [vs](https://en.wikipedia.org/wiki/Processor_consistency#Examples_of_Processor_Consistency) others
    - notice [p5](http://www.cs.cmu.edu/afs/cs/academic/class/15740-f03/www/lectures/mcm-slides.pdf) may be wrong, here allow reordering of 'reading/writing the same address', but must keep all processors agree on 'order of writes' from [paper_1](#agree).
      - 'visible in program order.' because StoreStore is in FIFO *without reordering*, see paper_3
    - 'removes the requirements for loads to wait for stores to complete' because StoreLoad can be reordered (from the above paper, it only ensures how stores from different processors are *observed* but not ensures the store order with load.). Also from the above paper 'a write as a *message-send* event and a read as a message-read event.' may implies that Causal Consistency not allow StoreLoad reordering.
    - TODO here Example 4 seems to be wrong. Because from [Cache_Consistency definition][Cache_Consistency_def], 'processor P1 reads the *old* value of X ... incoherent'
      - see this [stackoverflow Q&A](https://stackoverflow.com/questions/76550200)
        - Q1
          - 'weaker' should be right. 
            - paper_2 and paper_3 def relation [see p198][Scalable_Shared_Memory_Multiprocessors_libgen] (the latter should based on the former when having something like write buffer to *delay* write.); paper_1 and paper_2 here cache coherency and PRAM may be implied from the paper_2 '*stronger* than weak ordering, but *weaker* than strong ordering,'.
              - also [see p38][MEMORY_CONSISTENCY_DETAILED] 
              - the above differences also implies why *only StoreLoad* are allowed reordering. Bcause in the original paper_2, it *not allows* reordering. then in paper_3 it use 
            - After all, it is just one *manual definition* of memory consistency. Consider more of whether it is correct than how it is defined.
            - paper_1 can also say weaker. Because in paper_1, p4 says 'all processors agree on the order of causally related events' although *not about all events*. p5 says '*disagree* on the order of writes by dif-ferent processors, as long as those writes are to different locations.' implies 'not require writes from all processors...' in wikipedia, However, wikipedia doesn't mean the opposite of the former 'require writes from all processors ...' applies to CC. This is really a *english comprehension* problem. <a id="agree"></a>
        - Q2
          - first here Cache Consistency and coherence(coherency) aren't synonymous as paper_1 says. 
            - From paper_2 which is referenced by paper_1, it defines 'Memory *Consistency*' related with synchronization. So it means 'when a written value must be *seen*' as [COD_Orig][RISC_V_Orig] p458 says.
              - But more specific, here 'when' also implies the write *observation order* as paper_2 'the order in which memory opera-tions occur may be *observed*'. just like wikipedia [says](https://en.wikipedia.org/wiki/Consistency_model#Cache_consistency).
            - From paper_3, it defines coherence as 'all processors observe two writes to the same location in the *same order*' in p11 (notice: only care about *order* of *two* writes but not what are read).
              - From COD_Orig p454 it also says 'what values *can* be returned' but not '*should* be returned.', otherwise no need to define 'cache consistency' because 'should' must implies when to read (at least in a range without influencing the result). <a id="cache_consistency"></a>
              - Also the 'no writes to X by *another* processor' may based on consideration of something like the write buffer. Because the write buffer of different threads may receive the *request* at different speed and time. (Just see Example 3 where `R(x)1` by P3 may receive `x` data later than `R(x)2` by P2).
            - notice the COD_Orig is [referenced](https://en.wikipedia.org/wiki/Cache_coherence#cite_note-:3-4) in wikipedia.
          - Then paper_1 says 'per-location basis.' in '3.5 Cache Consistency' (implied by above *order*) which corresponds to 'as long as those writes are to different locations.' in '3.6 Processor Consistency' shows that PC really is cache-coherent. ~~(cache Consistency depends on what model is used.)~~
            - here implentation of Cache ~~Consistency~~ coherence depends on protocal used like MESI snooping (see paper_3 p8).
            - while Cache consistency is more from *software* (implies PC always generate same results as SC because programmer cares about the StoreLoad reorder.), see paper_2 p4.
              - Enqueue, Dequeue: po is just semaphore whose value is above $1$.
          - paper_3 coherence is only the third definition of COD_Orig p455.
          - more generally, the wikipedia example 3 meets the needs of COD_Orig cache coherence.
            - `R(x)1` of P3 follows `W(x)1` by P1 with `W(x)2` by P1 in *between*. So the 1 and 2 definition of COD_Orig not applies.
              - then because both P2 and P3 has only one `R(x)` so the order of all writes *seen* by P2 and P3 is *unknown*. This also interprets why 'Example 2' is right.
            - cache consistency is not in consideration about the relation of PC and cache coherency(also see above differences discussion in Q1). 
              - from paper_1, ~~it~~ cache coherency obviouly not care the cache consistency at all because both `R(x),W(x)` and `W(x),R(x)` w.r.t. `x` are permitted. (i.e. `R(x)0,W(x)1` in the paper_1)
              - meanwhile, the cache consistency may differ largely or littlely when implemented based on same model.
                - [see p48][MEMORY_CONSISTENCY_DETAILED], here 'IBM-370, TSO, and PC models' all provide the *relaxation* (i.e. same 'relaxed memory model' based on strict SC model). But 'TSO always allows a write followed by a read' which obviously changed '*when* to read' while IBM-370 'a read is not allowed to return the value of a write from the *buffer*'.
                  - So IBM-370 reorder issue, but ~~may *stall* to keep result same~~ the result may be wrong beacuse 'a read returns the *latest* value in memory' which may has been *stale* with write buffer.
            - Then PRAM (i.e. processor write order) also meets (or more specifically, need *more information* to decide, i.e. if P2 then has `R(x)1`,then obviously not meets Processor Consistency).
          - in short, why example 3 isn't Causal consistent but is Processor consistent is just whether they '*require* writes from *all* processors to be seen in the same order'.
            - Here, assume more casually that allow `W(x)1,W(x)2` by P1 reordered. But whether it is reordered, the 'W(x)2 in P1 *causally precedes* W(y)3 in P2.' is unchanged. So the order implies that `R(x)2` must occur while it may overriden by `W(x)2,W(x)1` reordering.
              - Notice from the paper_1 3.5 `R(x)0,W(x)1`, the diagram *may not* show the reordered instruction list.
      - The [reference](https://en.wikipedia.org/wiki/Processor_consistency#cite_note-:2-1) is same as [this][mosberger93memory] where $W(c)1$ can be reordered because it is not read, so no RAW hazard. This implies cache coherency.
    - TODO prove subset relation of different consistency model
      - some relation and proof can be see [here p7](https://dl.acm.org/doi/pdf/10.1145/165231.165264)
        - TODO see why processor consistency defined as TSO from math perspective.
    - TODO see how PROCESSOR CONSISTENCY [implemented][Scalable_Shared_Memory_Multiprocessors_libgen] in reality.
    - ['Write Atomicity'](https://courses.cs.washington.edu/courses/csep524/99wi/lectures/lecture5/tsld012.htm) is obviously not ensured by Processor Consistency. Also [see paper](https://en.wikipedia.org/wiki/Consistency_model#Relaxed_memory_consistency_models)
      - [non-atomic](https://preshing.com/20130618/atomic-vs-non-atomic-operations/) write/store which may store large data.
      - here the latter paper p14 'serialized (i.e., writes to the same location be made visible in the *same order* to all processors)' implies no interrupt because assume that P1 and P2 write same location X with data a and b simultaneously. Then based on pipeline, P1 and P2 see the two write in different order because they both think that their self write occurs first.
    - without the need for ['load speculation'](https://www.cs.nmsu.edu/~rvinyard/itanium/speculation.htm) because the write latency has been hidden by write buffer. ~~So~~ 'load speculation' ~~need to~~ means changing load ~~location~~ by *overlapping* with store to [hide the store latency p20][stanford_149_09_consistency].
    - why PC [always](https://en.wikipedia.org/wiki/Processor_consistency#Processor_Consistency_vs._Sequential_Consistency) behave same as SC which is same as ~~original~~ [PC paper][] says in p2.
  - See wikipedia [Consistency_model](https://en.wikipedia.org/wiki/Consistency_model#Relaxed_write_to_read)
    - 'at the *hardware* level' ['write to read'](https://en.wikipedia.org/wiki/Consistency_model) ('write followed by a read') 
      - Because hardware level, 'some programs like XXX may fail ' while 'programs like YYY are still expected'.
      - 'processor consistency' doesn't control *read* behavior, so it is 'the most relaxed'.
    - ~~TODO~~ 'the result is possible only in IBM 370 because read(A) is *not issued until* the write(A) in that processor is completed.' because 'A read can be complete before an earlier write to a different address' which implies no reorder if [*same address*][Similarity_TSO_IBM_370]. Also, [this TSO related Similarity][Similarity_TSO_IBM_370] says about 'SPARC V8 TSO': 'allows operations to the *same* location to complete *out of program order*'. So the above *only*.
      - notice here implies TSO is one general term.
    - 'which effectively *hides the latency* of write operations': this is to [hide](https://www.geeksforgeeks.org/multithreading-and-latency-hiding/#) by filling the pipeline without stalling which may removing data dependency wrongly.
    - 'Example B' obviously PC (processor consistency model) allow StoreLoad reordering.
  - from CAAQA p453, it says TSO is same as processor consistency which seems weird at first glance based on the above mosberger93memory paper definition
    - they are not totally same. [See][TSO_PC_PSO]
    - from this [paper 'TR1006.pdf'][PC_orig]. p5 says the original definition when introduced which diffs from SC(sequential consistency) that it not cares about order of *all* processors (which is cared in SC) but only individual (this can also be seen from the CAAQA figure). So 'writes from two processors' (i.e. combination of two processor writes) 'not be identical,'. But 'issuing from any processor' (i.e. only one) 'may not be observed ... other than that in which they are issued.' (i.e. same as *issue* order).
      - footnote 3: there must be one read because 'outstanding writes to one,' disallows [parallel p1][lec_17] 
      - 'single ordering of write operations ' also implies it is same as TSO
      - 'when the fence operation may unblock the processor.' -> control StoreStore
      - 'to date we have been unable to identify a single application for such code.' -> *rare* to fail.
      - 'both processes can never be killed.' -> more clearly, should be 'never be killed at the same time.' (i.e. possible to kill one but not the other.). see [p8][sc_tso_cis601] for possible situations of SC.
      - ['fence operations'](https://en.wikipedia.org/wiki/Memory_barrier) is to control memory access *order* (from this [isca90_GLL_90 paper][isca90_GLL_90], it only use fence with StoreLoad), while [Synchronization](https://docs.oracle.com/cd/E19455-01/806-4750/chap7rt-95545/index.html) is to control *exclusive* access (avoid *overlap*, also [see 'synchronization is required'][TSO_PC_PSO]) by using somthing like `semaphores` like csapp says.
      - 'prefetches operands or instructions is not strongly ordered.' because prefetch implies *load* which may reordered with current *store*. (also see '*scheduling* the code' and [above](#scheduling))
    - isca90
      - 'strict event ordering' -> pipeline stages po.
      - 'evcntuaIIy perform.' (this is pdf OCR words) -> must *release* (by writing) the lock to avoid deadlock.
  - very [helpful doc][MEMORY_CONSISTENCY_DETAILED] with memory consistency from [wikipedia](https://en.wikipedia.org/wiki/Processor_consistency#cite_note-:3-4)
    - lecture related [TSO p5][lec_17], also [lec_16](http://www.cs.cmu.edu/afs/cs/academic/class/15740-f02/www/lectures/lect16.pdf)
    - p47 'issues its operations in program order' & 'issued in the same order to memory.' specify differences between program order and memory order.
    - p49 footnote says 'processor consistency' has changed and different from Goodman says.
    - sequence can either mean *thread* program instruction sequence as p28/48 says or mean total instruction sequence of all threads as p49 says.
      - p50 sequence should refer to the former one, otherwise $(u,v,w)=(1,1,0)$ is impossible.
        - so Figures 2.3(c): memory order may be $a1,a2,b2,a3,b3$ but $b3$ may not ['see ... updated'][TSO_PC_PSO] 
          - TODO the above may be in conflict with 'coherence requirement'.
          - here also has no program order *bypass*
          - the behavior is just [what p27 says][stanford_149_09_consistency]
        - Figures 2.3(d) is similar. $P1...P4$ and $b4$ in P4 also not see updated A.
    - 
#### [Reference Appendices](https://www.elsevier.com/books-and-journals/book-companion/9780128119051) where also has other resources.
#### TODO
- A *vertical cut* of a thread of SIMD instructions
### miscs
- why use [L3$](https://softwareengineering.stackexchange.com/questions/108340/why-is-the-dollar-sign-used-to-abbreviate-the-description-of-a-cache)
# valgrind
- using [latest](https://forum.manjaro.org/t/unable-to-use-valgrind/120042/14) arch
- [different types](https://developers.redhat.com/blog/2021/04/23/valgrind-memcheck-different-ways-to-lose-your-memory#generating_a_leak_summary) of leak, [official](https://valgrind.org/docs/manual/faq.html#faq.deflost)
  - Still reachable: 'The memory is still reachable, so the program could still be using it' -> can be freed in the program. 'In theory, you could free it at the end of the program, but all memory is freed at the end of the program **anyway**.' -> so can ignore this error if you are the sure the program must be run at the *end*.
  - ‘possibly lost’ because using `**` pointer which may be unsafe because to free it may be complex which will result in errors, see 'If we kept some extra information', 'used the numbers pointer as a base', 'points to the third block of numbers'(i.e. after runnning `numbers++;`),' theoretically count backward to the beginning'
  - 'indirectly lost'
    - 'be **tempted** to fix it by simply clearing the pointer','We should have freed the memory first', 'by iteratively fixing the definitely lost memory leaks, you will eventually fix all indirectly lost memory leaks.'
    - 'indirectly lost: 24 bytes in 3 blocks' -> `numbers->nums`
  - 'Suppressed' -> to manually Suppress leak
    - 'won't show backtraces for where those still **reachable or indirectly** lost blocks','make sense to see whether you can deallocate them early'
- definition of 'memory leak' [two](https://stackoverflow.com/questions/3840582/still-reachable-leak-detected-by-valgrind)
- comparison [1](https://github.com/google/sanitizers/wiki/AddressSanitizerComparisonOfMemoryTools) [2](https://valgrind.org/gallery/survey_03/q4.html)
  - not use `LD_PRELOAD` when using `gcc -fsanitize=address`
# error debug
- [double free or corruption](https://stackoverflow.com/questions/12548868/why-am-i-getting-this-memory-access-error-double-free-or-corruption) (!prev)
- [corrupted top size](https://www.reddit.com/r/cs50/comments/y7gppx/pset_5_malloc_corrupted_top_size_please_help/) meaing 'invalid write'
# verilog simple introduction
- basics different from C, [constant](https://en.wikipedia.org/wiki/Verilog#Definition_of_constants) (underscore [ignored](https://cseweb.ucsd.edu/classes/sp11/cse141L/pdf/01/SV_Part_1.pdf)),[Reduction operator 'convert vectors to scalars'](https://nandland.com/reduction-operators/),[Initial and always 'a common misconception'](https://en.wikipedia.org/wiki/Verilog#Initial_and_always)
- [Logical equality](https://stackoverflow.com/questions/5927615/what-is-the-difference-between-and-in-verilog) based on [four-states, see list](https://www.verilogpro.com/verilog-reg-verilog-wire-systemverilog-logic/)
- synthesis -> ['logic synthesis'](https://en.wikipedia.org/wiki/Logic_synthesis)
- ~~TODO~~ [diff wire and reg](https://inst.eecs.berkeley.edu/~cs150/Documents/Nets.pdf)
  - [assign](https://www.chipverify.com/verilog/verilog-assign-statement) just to ensure right-hand value is 'constant'.
  - [Combinational and Sequential Circuits](https://www.geeksforgeeks.org/combinational-and-sequential-circuits/), here Sequential means somewhat *stateful* (related with state machine) instead of stateless.
    - here Sequential Circuits is also ['Sequential logic'](https://en.wikipedia.org/wiki/Sequential_logic)
    - ‘controlled by a clock transition are flip-flops’, so it does not permit delay. [see](#always_comb)
  - [always@ block =](https://www.chipverify.com/verilog/verilog-always-block) needs *delay* to avoid infinite loop *hang*
    - output reg -> 'reg elements can be used as *outputs within* an actual module'
  - [initial block =](https://www.chipverify.com/verilog/verilog-initial-block) 'not synthesizable','do not serve much purpose than to be used in simulations', '$finish' 'tells the simulator to *terminate* the current simulation'
  - in 1.2, 2 is correspond to 3 and 1 is correspond to 4.
    - 8->9 because above shows 'Sequential Circuits' is *stateful* which relys on registers.
- ["non-blocking" assignment](https://www.chipverify.com/verilog/verilog-blocking-non-blocking-statements) means similarly nonblock in unix (i.e. continue running and schedule the current instruction if current instruction not complete) which is also 'relational operator in expressions', 'End of time-step'
  - conventionally, assignment only occurs when `#num` delay or `end` with `initial`
## COD p658
based on 'FIGURE 4.33' p548, see 'COD/verilog' dir
- Verilog Array [Packed Arrays (similar to packed instruction) and Unpacked Arrays (i.e. array size)](https://www.javatpoint.com/verilog-arrays), more [clear](https://www.chipverify.com/verilog/verilog-arrays) where depth is array size and wide (width) means pack size. 
  - So `reg [63:0] Regs[0:31]` is 32 64-bit regs.
  - notice [order `[7:0] or [0:7]`](https://stackoverflow.com/questions/16762167/order-of-bits-in-reg-declaration)
- [data type](https://www.chipverify.com/verilog/verilog-data-types) 'not connected to anything will have a high-impedance' (which is just as book digital circuit says although I forgot most of them ...)
- `<=` to ensure parallel (see csapp what 'parallel' means) because of non-blocking
- `PC>>2` because `PC+4` ($1<<2=4$) and use `reg [31:0] Imemory[0:1023]` (instruction is 32 bit at most in risc-v)
- use Concatenation and Replication to construct imm in risc-v
- [R-type](#rformat) still p7
- B register is `rs2`
### TODO
- why `EXMEMALOUT >> 2` not `EXMEMALOUT >> 1` to just put `64=32<<1` bit data.
# cache miss debug
- I use ryzen 7 4800h with [256KiB L1D cache](https://en.wikichip.org/wiki/amd/ryzen_7/4800h#Cache) and each core has [32KiB](https://www.techpowerup.com/cpu-specs/ryzen-7-4800h.c2280)
  [check](https://superuser.com/questions/837970/is-there-a-way-to-know-the-size-of-l1-l2-l3-cache-and-ram-in-ubuntu#comment2554233_837989) in linux directly (L1 cache [per core](https://www.quora.com/In-a-multi-core-system-does-each-core-have-a-cache-memory-for-itself-or-does-it-have-to-share-the-same-cache-with-other-cores) and [relation](https://unix.stackexchange.com/questions/468766/understanding-output-of-lscpu) among thread,core,socket )
  from the following, L2 is 64 byte <a id="cacheline_byte"></a>:
  ```bash
  $ lscpu --cache
  NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL SETS PHY-LINE COHERENCY-SIZE
  L1d       32K     256K    8 Data            1   64        1             64
  L1i       32K     256K    8 Instruction     1   64        1             64
  L2       512K       4M    8 Unified         2 1024        1             64
  L3         4M       8M   16 Unified         3 4096        1             64
  $ for i in $(ls /sys/devices/system/cpu/cpu0/cache/index0);do echo $i;cat /sys/devices/system/cpu/cpu0/cache/index0/$i;echo -e '';done # view by file https://stackoverflow.com/questions/1922249/c-cache-aware-programming
  $ python
  >>> 64*8*64/2**10 # L1
  32.0 # implies 64 byte cache block
  $ lscpu | grep -i Thread -A 2
  Thread(s) per core:              2
  Core(s) per socket:              8
  Socket(s):                       1
  $ sudo lshw -C memory # more general info https://unix.stackexchange.com/questions/167038/is-there-any-way-to-know-the-size-of-l1-l2-l3-cache-and-ram-in-linux
  ...
  capabilities: pipeline-burst internal write-back unified
  $ cat /sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list # check cpu shared state; https://superuser.com/questions/55776/how-to-find-the-l2-cache-size-in-linux check L2
  0-1
  $ cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
  0-7
  ```
  - ['pipeline-burst'](https://en.wikipedia.org/wiki/Pipeline_burst_cache): 1. pipeline is just same as instruction pipeline by 'divided into stages' 2. Burst mode not only decreases init counts but also no need to transfer unnecessary sequential separate address,also see [this](#Burst_mode) same thing.
  - So `double` is 8bytes.
## [perf tools][mem_perf_tools]
- TODO try [intel VTune](https://stackoverflow.com/questions/32542164/using-valgrind-to-measure-cache-misses)
- here [oprofile](https://oprofile.sourceforge.io/news/) hasn't been updated since 2020 and [not support](https://github.com/Xilinx/xen/issues/2) 23th family amd cpu (like my cpu ryzen 4800h)
  - 'This is where oprofile is currently *hard* to use' because it use something not general like `DTLB_MISSES`.
  - 'Oprofile performs *stochastic* profiling' (maybe not very stochastic...) 'Only every Nth event'.
  - 'corresponds to the *actual* hardware'. So *can't simulate* like cachegrind.
  - [`__builtin_expect`](https://stackoverflow.com/questions/7346929/what-is-the-advantage-of-gccs-builtin-expect-in-if-else-statements) just use *prefetch* and branch prediction. Then L1i cache miss should be decreased at least because of fetching less instructions.
  - should use `perf` over `oprofile` by this [Q&A](https://stackoverflow.com/questions/8126311/how-much-of-what-every-programmer-should-know-about-memory-is-still-valid)
- [pfmon](https://sourceforge.net/p/perfmon2/libpfm4/ci/master/tree/) ([same](https://askubuntu.com/questions/637144/how-to-install-perfmon2-on-ubuntu)) is one lib instead of one software to use like cachegrind, also for [papi](https://aur.archlinux.org/packages/papi) (see [example](https://stackoverflow.com/questions/54638486/counting-l1-cache-misses-with-papi-read-counters-gives-unexpected-results))
  - TODO use [pfmon software](https://www.cse.iitd.ac.in/~rkpal/pfmon.html)
- above Q&A
  - not use 'software prefetch' and '*perf* has mostly superseded oprofile'.
- also see this [blog](https://samueleresca.net/analysis-of-what-every-programmer-should-know-about-memory/) which offers one good [`perf` web page](https://www.brendangregg.com/perf.html)
- ~~Better to~~ also see [mem_paper_1] ~~where internal links are all valid.~~
  - ~~it says 'Section 10' in [mem_perf_tools] as 'Appendix B'~~
- TODO [other perf tools](https://perfmon2.sourceforge.net/perfmon2-20080124.pdf)
- calculate NTA manually maybe by `SSE_PRE_EXEC` and `LOAD_HIT_PRE`.
- NTA prefetch
  - TODO how check [hardware prefetcher](https://stackoverflow.com/questions/32103968/non-temporal-loads-and-the-hardware-prefetcher-do-they-work-together)...
  - not same as [this](#non_temporal_streaming) because NTA prefetch will use cache.
  - also see [17h_Optimization] p19.
  - 'Non-Temporal' [implies](http://www.nic.uoregon.edu/~khuck/ts/acumem-report/manual_html/ch05s03.html) 'not be allowed to evict other data'.
  - `PrefetchNTA` calculation [Equation](http://www.nacad.ufrj.br/online/intel/vtune/users_guide/mergedProjects/analyzer_ec/mergedProjects/reference_olh/mergedProjects/pmm/ratios/useful_prefetchnta_ratio.html) also can be implied by above [mem_perf_tools] `SSE_PRE_MISS, SSE_PRE_EXEC,` using [`pfmon` interface](https://indico.cern.ch/event/28823/contributions/658270/attachments/537472/740937/PH_Workshop_pfmon_April2008.pdf).
  - here NTA may not be *aligned* but *access* as amd doc 'PPR_60h' p33 says.
## related with my cpu 4800h
- TODO cpuid [subleaf](https://www.felixcloutier.com/x86/cpuid)
  ```bash
  $ sudo cpuid | head -n 3
  Leaf     Subleaf    EAX            EBX            ECX            EDX            
  00000000 00000000:  00000010 ....  68747541 Auth  444d4163 cAMD  69746e65 enti
  00000001 00000000:  00860f01 ....  00100800 ....  7ed8320b .2.~  178bfbff ....
  ```
  - also see [this code](../self_test/cpuid/cpuid.c)
    - see [cpuid] p10 how family and model are encoded. It is same as [wikichip_cpuid] says.
    - here use Leaf `0x1h` because [rev_17h] p8 says 'returned in the *EAX*' with `0000_0001h`.
- My cpu L2 cache is inclusive
  - here L3 isn't inclusive but to be 'populated by L2 *victims*'. '**shadow tags**' stores 'state information' of L2 cache which includes MOESI related 'coherency state' and *allocation* property related with victim and invalidation. Although [intel](https://stackoverflow.com/questions/57702498/the-way-to-get-cache-placement-policy-of-cpu-on-linux) L3 is inclusive.
    - shadow tags:
      - also see [zen2_wikichip](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2). The shadow tags also function between CCXs by 'exclusive to this CCX' and 'CCXs are not directly connected'.
      - Better see this [patent][shared_tag_patent].
      - not totally same as [shadow memory](https://electronics.stackexchange.com/questions/240248/cache-memory-vs-shadow-ram) beacuse it adds some infos like 'state' and 'allocation property'.
      - also see this [slide](https://my.eng.utah.edu/~cs7810/pres/14-7810-12.pdf) 
        - p20 'partial tags' is same as patent says 'at least a portion of an address'.
        - p4 die layout.
      - ~~TODO~~ no relation with [Shadow memory](https://en.wikipedia.org/wiki/Shadow_memory) better see valgrind [paper][shadow_memory].
## perf doc use [epyc 7713](https://en.wikichip.org/wiki/amd/cores/milan) which should share the same model `0x01` in one location of [19h](https://en.wikichip.org/wiki/amd/cpuid#Family_25_.2819h.29) just as [renoir](https://en.wikichip.org/wiki/amd/cores/renoir) including 4800h does in [17h](https://en.wikichip.org/wiki/amd/cpuid#Family_23_.2817h.29) 
- TODO [QoS Monitoring and Enforcement](https://www.amd.com/system/files/TechDocs/56375_1.03_PUB.pdf) in [L3 cache](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2)
- ~~recommend read [perf](https://man7.org/linux/man-pages/man1/perf-list.1.html) online in man7 which is newer than archlinux `man-db`.~~ `man perf-list`
  - It offers this valuable amd doc repo in [bugzilla](https://bugzilla.kernel.org/show_bug.cgi?id=206537) :-)
  - ~~TODO ~~ the man said `If ... 28FH     03H` while the [19h_01h_vol_1] p217 ~~has no umask shows. And where is ''~~
    - here from [19h_01h_vol_1] p167 event select[11:8] -> `35:32`
      ```bash
      $ cat /sys/bus/event_source/devices/cpu/format/event 
      config:0-7,32-35
      $ cat /sys/bus/event_source/devices/cpu/format/umask                                                   
      config:8-15
      ```
      from p209 should use `0x20043048F` **or** `0x20043078F`(9 bytes). see set bits in [miscs_py_script].
    - PPR_old see this [repo](https://github.com/tpn/pdfs/blob/master/AMD%20-%20Preliminary%20Processor%20Programming%20Reference%20(PPR)%20for%20AMD%20Family%2017h%20Models%2000h-0Fh%20Processors%20-%20Rev%201.14%20-%20April%2015th%2C%202017%20(54945).pdf)
      - some PPR use `DC` abbr which is in [uprof_doc] p18.
    - [this link_1](https://community.amd.com/t5/server-gurus-discussions/pmc-questions-of-epyc-processor/td-p/439817) may get unit mask from the table in [17h_01h] Table 19 `0xFF0F0000_00400106`(64bits).
      - still from p146 '35:32 EventSelect[11:8]', so `{0:06}` is same as p174 `0x06` in 'L3PMCx06'.
      - also see this [question](https://stackoverflow.com/questions/70237030/counting-l3-cache-access-event-on-amd-zen-2-processors) which is also posted on [amd community](https://community.amd.com/t5/general-discussions/counting-l3-cache-access-event-on-amd-zen-2-processors/td-p/508781).
        - `amd_l3` [origin](https://lkml.iu.edu/hypermail/linux/kernel/1909.2/03972.html) where `+ { "L3PMC", "amd_l3" },` implies need `amd_l3` to use L3 PMC.
        - this is same as link_1 about L3 cache based on 17h model 01h.
        - '`umask 0x80` is undefined for this event' beacuae Table 19 not says about 'FP Scheduler Empty' and p163 in [17h_01h] also not says about unit mask. 
          - so 'counting an *undefined* event'.
        - `L3LookupState` is just `L3PMCx04` in [17h_01h] p174 from the last two bytes of `0xFF0F0000_0040FF04`. (The unit mask is *recommended* in [17h_01h] Table 19) The other is similar.
  - Notice: better view the cpu PPR and use [recommended event code](https://www.spinics.net/lists/linux-perf-users/msg17608.html). So maybe predefined `perf` event isn't dependable all the time.
- TODO L1cache may save TLB page walk cache, so fetching instruction may cause miss.
- TODO `+-` [meaning](https://stackoverflow.com/questions/29881885/can-perf-account-for-all-cache-misses/58139638#58139638) in `perf stat -r`
- event [definition](https://github.com/torvalds/linux/blob/457391b0380335d5e9a5babdec90ac53928b23b4/arch/x86/events/amd/core.c#L31) (check kernel version) for all amd, referenced [here](https://stackoverflow.com/questions/52170960/hardware-cache-events-and-perf)
- cache miss may due to both [ITLB](https://stackoverflow.com/questions/29881885/can-perf-account-for-all-cache-misses) and [dTLB][perf_cache_misses]
- TODO this `check_events` no use
  ```bash
  $  ~/libpfm4/examples/check_events 0x5:0x01:0x01
  check_events: cannot encode event 0x5:0x01:0x01: event not found
  $ ~/libpfm4/examples/showevtinfo
  ...
  IDX      : 933232695
  PMU name : amd64_fam17h_zen2 (AMD64 Fam17h Zen2)
  Name     : RETIRED_SERIALIZING_OPS
  Equiv    : None
  Flags    : None
  Desc     : The number of serializing Ops retired.
  Code     : 0x5
  Umask-00 : 0x01 : PMU : [X87_CTRL_RET] : None : X87 control word mispredict traps due to mispredction in RC or PC, or changes in mask bits.
  ```
- show predefined [event code](https://lore.kernel.org/all/21eb16b3-ddbd-b249-e7b1-476cb17361be@amd.com/T/). 
- [AMD BKDG](https://web.eece.maine.edu/~vweaver/projects/perf_events/faq.html#q2e) temporarily only has 16h.

## perf
### commands
- see this [perf_cache_misses]. Here not use [`--call-graph dwarf`](https://stackoverflow.com/questions/59307540/profiling-my-program-with-linux-perf-and-different-call-graph-modes-gives-differ) beacuse it generate much bigger file.
  ```bash
  $ cd;perf record -g -e L1-dcache-load-misses:u\
  ,L1-dcache-loads:u,L1-dcache-prefetches:u\
  ,L1-icache-load-misses:u,L1-icache-loads:u\
  ,dTLB-load-misses:u,dTLB-loads:u\
  ,iTLB-load-misses:u,iTLB-loads:u \
  ~/matrix-matrix-multiply/build/src/dgemm
      # see https://stackoverflow.com/questions/12160449/call-stack-in-the-perf-profiler
  $ perf report -i ~/perf_log/L1_TLB_dgemm_znver2.log  -M intel --stdio --stdio-color always --group --show-ref-call-graph --percentage relative --raw-trace
  #                                                                 Children                                                                      Self  Command  Shared Object         Symbol                                       >
  # ........................................................................  ........................................................................  .......  ....................  .............................................>
  #
    66.59%  28.42%  44.41%  57.28%  58.13%  89.27%  87.30%   1.96%   3.75%    66.56%  28.42%  44.40%  57.28%  58.13%  89.22%  87.29%   1.96%   2.92%  dgemm    dgemm                 [.] dgemm_basic
            |
            ---dgemm_basic
      # ignore this line: here `dgemm_basic_blocked` is too small, so not counted here.
      # even when not using `__attribute__((noinline))` in `do_block`.
    28.91%  14.19%  47.71%  22.45%  21.25%   4.64%  10.64%   1.40%  17.08%     0.00%   0.00%   0.00%   0.01%   0.00%   0.00%   0.00%   0.56%   0.83%  dgemm    dgemm                 [.] calc_speed_up
            |
            ---calc_speed_up
                |          
                |--16.69%--dgemm_avx256
                |          
                |--7.95%--dgemm_unrolled_avx256
                |          
                --4.27%--dgemm_blocked_avx256

    16.69%   7.12%  21.37%   9.23%   7.65%   3.34%   8.13%   0.00%   3.75%    16.68%   7.11%  21.36%   9.23%   7.65%   3.34%   8.13%   0.00%   3.75%  dgemm    dgemm                 [.] dgemm_avx256
            |          
              --16.68%--calc_speed_up
                        dgemm_avx256

      7.95%   4.47%  16.34%  10.65%  10.64%   0.19%   2.26%   0.56%   0.00%     7.95%   4.47%  16.31%  10.65%  10.64%   0.19%   2.26%   0.00%   0.00%  dgemm    dgemm                 [.] dgemm_unrolled_avx256
            |
            ---calc_speed_up
                dgemm_unrolled_avx256

      # 4.44%  57.74%   2.03%  42.47%  57.43%   0.10%   1.72%   0.00%   6.31%     4.44%  57.72%   2.03%  42.46%  57.43%   0.10%   1.72%   0.00%   6.31%  dgemm    dgemm                 [.] dgemm_basic_blocked
      
      # with `__attribute__((noinline))` with `do_block`

      4.30%  54.17%   7.00%  18.84%  19.45%   4.73%   2.05%   0.28%   8.75%     4.30%  54.15%   7.00%  18.84%  19.45%   4.73%   2.05%   0.28%   8.75%  dgemm    dgemm                 [.] do_block
            |
            ---do_block

      4.27%   2.60%  10.00%   2.56%   2.96%   1.11%   0.25%   0.00%  12.50%     4.27%   2.60%   9.98%   2.56%   2.96%   1.11%   0.25%   0.00%  12.50%  dgemm    dgemm                 [.] dgemm_blocked_avx256
            |
            ---calc_speed_up
                dgemm_blocked_avx256
      ...
      0.05%   0.34%   0.08%   0.08%   0.08%   0.08%   0.01%   0.00%   0.00%     0.05%   0.34%   0.08%   0.08%   0.08%   0.08%   0.01%   0.00%   0.00%  dgemm    dgemm                 [.] dgemm_basic_blocked
  ```
  The above Q&A may be duplicate of [this](https://stackoverflow.com/questions/73032552/cache-miss-even-if-both-operands-are-registers)
  - it may be due to [event skid](https://stackoverflow.com/a/70026620/21294350). Or see [this branch example](https://easyperf.net/blog/2018/08/29/Understanding-performance-events-skid). So above should be miss at **jump** instruction instead of before jump.
    - no `pp` modifier listed in `man perf-list` available because [`PEBS`](https://easyperf.net/blog/2018/06/08/Advanced-profiling-topics-PEBS-and-LBR). Also see from [source code](https://elixir.bootlin.com/linux/v5.6.14/source/tools/perf/pmu-events/arch/x86/skylakex/cache.json#L630) referenced [here](https://stackoverflow.com/a/62059796/21294350).
    - maybe also due to [link_1 **fuesd** instruction](https://stackoverflow.com/questions/43794510/linux-perf-reporting-cache-misses-for-unexpected-instruction) (can also be seen from [the comment](https://stackoverflow.com/questions/43794510/linux-perf-reporting-cache-misses-for-unexpected-instruction#comment74631685_43794510)) where it also says to use cachegrind to get a [scartch](https://stackoverflow.com/questions/43794510/linux-perf-reporting-cache-misses-for-unexpected-instruction#comment74630635_43794510). From Link_2 , it may be also due to ['the instruction that was waiting for it'][perf_delay] (TODO how [Meltdown](https://meltdownattack.com/) which is [CVE-2017-5754](https://www.cvedetails.com/cve/CVE-2017-5754/) get memory data and whether LSD means [this](https://stackoverflow.com/questions/52054585/can-the-lsd-issue-uops-from-the-next-iteration-of-the-detected-loop)).
      - Above two links are in ['Other related ...'](https://stackoverflow.com/questions/69351189/how-does-perf-record-or-other-profilers-pick-which-instruction-to-count-as-cos) where the third also said from OoO and pipeline view.
  - related with above Q&A, `lbr` also not available on amd.
### first glance
- from above, why dgemm_basic behaves like that has been said in the Q&A. 
  `dgemm_avx256`: Then `dgemm_avx256` use `vfmadd231pd` to simplify *speculative* cache prefetch which is also said in Q&A. And it also it won't fetch 
  next line in `A` in `cij += A[i + k * n] * B[k + j * n];` when `k++`, but loads from the *consecutive* addresses from `_mm256_mul_pd` in `_mm256_mul_pd(_mm256_load_pd(A + i + k * n),_mm256_broadcast_sd(B + k + j * n)));` (at least row major in C works, column major in Fortran is similar.) <a id="fetch"></a>
  ```bash
  $ perf annotate -i ~/perf_log/L1_TLB_dgemm_znver2.log  -M intel --stdio --stdio-color always --group
      0.00    0.08    0.04    0.28    0.00    0.00    0.09    0.00    0.00 :   3900:   vfmadd231pd ymm0,ymm1,YMMWORD PTR [r9+rdx*8]
                                                                           : 145  dgemm_avx256(unsigned int, double const*, double const*, double*):
                                                                           : 35   for (uint32_t k = 0; k < n; k++) {
     97.99   97.82   97.91   96.99   96.91   98.19   97.32    0.00    0.00 :   3906:   cmp    r8,rax
  ```
  `dgemm_unrolled_avx256`: also `dgemm_unrolled_avx256` just load **more consecutive addresses** in `A` and it also use this same method with `B`,~~`c[r]`~~,`C` (above all are done in one j-loop to *avoid fetch new row* of all matrixs).
  ```bash
    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00 :   3a10:   mov    edx,r10d
                                                                         : 44   _mm256_broadcast_sd(double const*):
                                                                         : 736  return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
    0.25    0.51    0.51    0.00    0.41    0.00    0.76    0.00    0.00 :   3a13:   vbroadcastsd ymm0,QWORD PTR [rcx]
                                                                         : 738  dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
                                                                         : 35   for (uint32_t k = 0; k < n; k++) {
    2.45    2.88    3.08    2.27    2.80    3.85    2.66    0.00    0.00 :   3a18:   add    rcx,0x8
    2.76    2.46    1.77    2.25    1.86    0.93    2.88    0.00    0.00 :   3a1c:   add    r10d,ebx
                                                                         : 39   _mm256_load_pd(A + n * k + r * 4 + i), bb, c[r]);
    0.13    0.00    0.13    0.00    0.00    0.00    0.00    0.00    0.00 :   3a1f:   lea    r13,[rdi+rdx*1]
                                                                         : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4), double __vector(4)):
                                                                         :
                                                                         : 50   extern __inline __m256d
                                                                         : 51   __attribute__((__gnu_inline__, __always_inline__, __artificial__))
                                                                         : 52   _mm256_fmadd_pd (__m256d __A, __m256d __B, __m256d __C)
                                                                         : 53   {
                                                                         : 54   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00 :   3a23:   vfmadd231pd ymm4,ymm0,YMMWORD PTR [r12+r13*8]
                                                                         : 56   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
   21.84   21.32   25.04   24.84   23.31   24.06   21.26    0.00    0.00 :   3a29:   lea    r13,[r9+rdx*1]
                                                                         : 40   _mm256_fmadd_pd(double __vector(4), double __vector(4), double __vector(4)):
    7.97    7.53    8.44    9.04    9.65   12.57    6.74    0.00    0.00 :   3a2d:   vfmadd231pd ymm3,ymm0,YMMWORD PTR [r12+r13*8]
                                                                         : 50   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
    6.79    5.52    5.62    4.75    5.69    8.13    9.00    0.00    0.00 :   3a33:   lea    r13,[r8+rdx*1]
    0.00    0.00    0.13    0.00    0.38    0.00    0.12    0.00    0.00 :   3a37:   add    rdx,r11
                                                                         : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4), double __vector(4)):
    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00 :   3a3a:   vfmadd231pd ymm2,ymm0,YMMWORD PTR [r12+r13*8]
   44.47   44.28   41.11   45.05   38.23   34.39   43.46    0.00    0.00 :   3a40:   vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rdx*8]
                                                                         : 51   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
                                                                         : 35   for (uint32_t k = 0; k < n; k++) {
   11.34   10.61   10.27   10.51   14.98   11.53   10.31    0.00    0.00 :   3a46:   cmp    r14,rcx
    0.00    0.26    0.00    0.00    0.50    0.19    0.12    0.00    0.00 :   3a49:   jne    3a10 <dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*)+0xd0>
  ```
  `do_block`: in `do_block`, even not unroll with `#pragma GCC unroll 1`. The miss rate is still low than **all the above**. Because every 3-level subloop **only save one small block** in L1d cache instead of traversing one whole matrix. Take `A[i + k * n]` as one example, in the above two funcs, they traverse all rows of `A` and `do_block` traverse `BLOCKSIZE` rows. <a id="block"></a>
### comparison of different events
- `L1-dcache-load-misses` has been said above.
#### `L1-dcache-loads` and `L1-dcache-prefetches`
- obviously, **avx** loads less because they do SIMD so load more *each time*, then load counts are less. 
  - `do_block` will duplicately load.See `do_block(n, si, sj, sk, A, B, C);` where when `k++`, at least the block in `C` will be re-traversed. So it is higher than `dgemm_basic`. <a id="reuse"></a>
    - so `L1-dcache-prefetches` of `do_block` is minimal, because it always use duplicate loads. Why the other `L1-dcache-prefetches` rank like they are is similar to `L1-dcache-loads`.
#### `L1-icache-load-misses` and `L1-icache-loads`
- Similar to `L1-dcache-loads`, it is one way to calculate loop counts, although `do_block` and `dgemm_basic` don't hold one proportion relation. 
#### `dTLB-loads` and `dTLB-load-misses`
- only `dgemm_basic` has one very high rate because it neither uses SIMD which uses consecutive data probably sharing dTLB nor uses block to keep dTLB or other cache less being *victims*.
#### `iTLB-loads` and `iTLB-load-misses`
- obviously they are must be consecutive.So miss rates are very low.
#### L3
- unluckily my cpu doesn't support that and don't have *PMC*s related with L3.
### comparsion after adding `L2` related
#### terminology explanation
- view `perf list` to select events.
  - `breakdown` [meaning](https://interviewnoodle.com/cache-problems-cache-penetration-cache-breakdown-cache-avalanche-9b866483e2b7) (Better see its reference which has more **explicit** examples shown): 1. `penetration` ~~can be seem as fetching from disk~~ is one type of attack by using `non-existence data to frequently attack the application` and caused sequential cache miss because 'it will not be written to the cache'. 2. `breakdown` is similar to fetch from mem. 3. `Avalanche` is just too many requests ("multiple hot keys fail at the same time"). Here they are meaningful requests. Think of e-commerce Platform requests at the shopping festival.
  - [L1 prefetcher](http://iccd.et.tudelft.nl/Proceedings/2007/Papers/5.1.4.pdf) and L2 meaning. It is to 'prevent cache pollution' and store to later put them in corresponding cache (L1 prefetcher -> L1 cache).
    - So [PPR_17h_60h] p167 just means not to fetch into L2cache. But just use L2cache to offer service to L1 cache. So [`Core`](https://github.com/torvalds/linux/blob/995b406c7e972fab181a4bb57f3b95e59b8e5bf3/tools/perf/pmu-events/arch/x86/amdzen2/cache.json#L184C26-L184C30) means `L1`. (Also see [this](https://unix.stackexchange.com/questions/326621/what-are-kernel-pmu-event-s-in-perf-events-list) related with intel)
  - `l2_request_g1.cacheable_ic_read` related PMCx060 and PMCx061 are ~~not~~ related with L1 miss. ~~So ignore them.~~ Only use `l2_request_g2.ic_rd_sized(_nc)` to test whether avx fetch *sized* data *cacheline*.
    - also see [uprof_doc] p38 for **metric group**.
  - `ls_hw_pf_dc_fill.ls_mabresp_rmt_cache` here shoule be 0, because my cpu only has one numa. This can be seen from [lstopo](#lstopo) and cmds:
    ```bash
     # https://stackoverflow.com/questions/11126093/how-do-i-know-if-my-server-has-numa
    $ numactl --hardware # share the main memory 
    available: 1 nodes (0)
    node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
    node 0 size: 15360 MB
    node 0 free: 7910 MB
    node distances:
    node   0 
      0:  10 
    ```
  - `ls_refills_from_sys.ls_mabresp_lcl_cache` '**Home Node** is on this thread's die'. Better also see [PPR_17h_60h] doc. It is similar to above `ls_hw_pf_dc_fill`, only different in the aspect of whether demand (by instruction or explicit fetch) or prefetch (**implicit** fetch).
    - '**IO** from this thread's die.'
  - `ls_st_commit_cancel2.st_commit_cancel_wcb_full` see [this](https://stackoverflow.com/a/25877134/21294350) 'never be written to a cache'. Also related with [Replacement_Policies](https://stackoverflow.com/questions/9544094/how-to-mark-some-memory-ranges-as-non-cacheable-from-c)
  - `l2_cache_accesses_from_dc_misses` -> `0xc8` -> `0b11001000`: why not count 'Data Cache Shared Reads' 
    (also for `l2_cache_hits_from_dc_misses`. TODO diff from 'Data Cache Read Hit on Shared Line'). 
    And TODO maybe better to count 'Software Prefetch' with `0b100` because it may also fetch data although rare. See ["using the prefetched data"](http://www.nic.uoregon.edu/~khuck/ts/acumem-report/manual_html/ch_intro_prefetch.html).
    - It should be sum of above `l2_request_g1`, etc. So ignore this.
    - `l2_cache_accesses_from_ic_misses` seems right.
    - `l2_cache_hits_from_ic_misses` is right.
    - 'L2 Prefetch Hit in L2' maybe means 'Prefetcher'.
  - The others in `recommended:` are all included in the above subcommands.
  - `SDT` is no use here because the above program not ['use SDT markers'](https://lwn.net/Articles/618956/). See [probe](https://www.gnu.org/software/libc/manual/html_node/Memory-Allocation-Probes.html)
#### test
record list
- [x] ls_refills_from_sys (5 items)
- [x] ls_hw_pf_dc_fill (5)
- [x] ls_sw_pf_dc_fill (5)
- [x] `ls_st_commit_cancel2.st_commit_cancel_wcb_full`
- [ ] `l2_request_g1`
  - [x] `change_to_x`
  - [x] `prefetch_l2_cmd`
- [ ] `l2_request_g2.group1` and `l2_request_g1.group2`
---

- use this python script [perf_post_py_script] or 
  `awk` by `awk 'FNR >= 12 || FNR <=41 {for(i=22;i<=42;i++) $i=""; print $0}' ~/perf_log/almost_all_cache.log.report | less` (this will make the output format change by make all delimiters ' '. How to select [row and column](https://stackoverflow.com/questions/1506521/select-row-and-element-in-awk)). Also can try [`cut`](https://stackoverflow.com/questions/2626274/print-all-but-the-first-three-columns). `sed` may be difficult to select [column](https://stackoverflow.com/questions/59326355/how-to-get-third-column-first-row-with-sed-in-linux)
- Better not to sample too many events at one time. It may interfere with each other (not only the value but also the [behavior](#percent_error)). Although the following example is.
```bash
$ cd;perf record -g -e L1-dcache-load-misses:u\                            
,L1-dcache-loads:u,L1-dcache-prefetches:u\
,L1-icache-load-misses:u,L1-icache-loads:u\
,dTLB-load-misses:u,dTLB-loads:u\
,iTLB-load-misses:u,iTLB-loads:u,\
l2_request_g2.group1,l2_request_g1.group2\
,l2_request_g1.all_no_prefetch\
,ic_cache_fill_l2,ic_cache_fill_sys\
,ic_cache_inval.fill_invalidated,ic_cache_inval.l2_invalidating_probe\
,l2_cache_req_stat.ic_access_in_l2,l2_cache_req_stat.ic_dc_hit_in_l2,l2_cache_req_stat.ic_dc_miss_in_l2\
,l2_cache_req_stat.ic_fill_hit_s,l2_cache_req_stat.ic_fill_hit_x,l2_cache_req_stat.ic_fill_miss\
,l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
,l2_cache_req_stat.ls_rd_blk_x\
,l2_cache_hits_from_l2_hwpf,l2_pf_miss_l2_hit_l3,l2_pf_miss_l2_l3\
,l2_request_g2.ls_rd_sized,l2_request_g2.ls_rd_sized_nc\
,ls_hw_pf_dc_fill.ls_mabresp_lcl_cache,ls_hw_pf_dc_fill.ls_mabresp_lcl_dram\
,ls_hw_pf_dc_fill.ls_mabresp_lcl_l2\
,ls_hw_pf_dc_fill.ls_mabresp_rmt_cache,ls_hw_pf_dc_fill.ls_mabresp_rmt_dram\
,ls_refills_from_sys.ls_mabresp_lcl_cache,ls_refills_from_sys.ls_mabresp_lcl_dram\
,ls_refills_from_sys.ls_mabresp_lcl_l2\
,ls_refills_from_sys.ls_mabresp_rmt_cache,ls_refills_from_sys.ls_mabresp_rmt_dram\
,ls_st_commit_cancel2.st_commit_cancel_wcb_full\
,ls_sw_pf_dc_fill.ls_mabresp_lcl_cache,ls_sw_pf_dc_fill.ls_mabresp_lcl_dram\
,ls_sw_pf_dc_fill.ls_mabresp_lcl_l2\
,ls_sw_pf_dc_fill.ls_mabresp_rmt_cache,ls_sw_pf_dc_fill.ls_mabresp_rmt_dram\
,de_dis_uops_from_decoder.opcache_dispatched\
,l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\
,l2_request_g1.ls_rd_blk_c_s\
,l2_request_g1.cacheable_ic_read\
,l2_request_g1.change_to_x\
,l2_request_g1.prefetch_l2_cmd\
,l2_request_g1.l2_hw_pf\
,l2_request_g1.group2\
,l2_request_g2.group1 \
~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/almost_all_cache.log
$ perf report -i ~/perf_log/almost_all_cache.log --group --stdio
    64.63%  29.20%  41.34%  57.59%  60.69%  38.60%  88.19%   0.00%   0.00%  65.21%  50.40%  67.62%  50.17%  54.71%  59.13%  74.92%  54.99%  59.81%  73.12%  49.30%   0.00%  57.71%  74.30%  61.44%  93.98%  61.71%  15.27%  55.59%  50.98%  65.77%   0.00%  50.40%  53.77%  61.64%  38.71%   0.00%   0.00%  76.08%  62.43%  67.39%   0.00%   0.00%   0.00%  51.11%   4.98%  46.87%   0.00%   0.00%  32.28%  65.13%  48.90%  84.45%  56.53%  44.01%   0.00%  49.80%  45.69%  62.31%  dgemm    dgemm                 [.] dgemm_basic
            |
            ---dgemm_basic

    30.86%  15.92%  51.51%  29.83%  20.86%  42.21%   9.82%   0.00%   0.00%  28.28%  15.99%  27.69%  18.59%  21.63%  22.86%  22.12%  19.75%  35.90%  21.31%  12.93%   0.00%  18.42%  20.16%  13.34%   1.48%  34.16%  37.65%  36.91%  33.59%  21.77%   0.00%  17.84%  35.69%  25.32%  56.31%   0.00%   0.00%  19.75%  19.04%  29.69%   0.00%   0.00%   0.00%  17.88%   0.85%  10.00%   0.00%   0.00%  12.76%  30.34%  25.42%   8.49%  20.81%  11.39%   0.00%  39.32%  20.64%  31.16%  dgemm    dgemm                 [.] calc_speed_up
            |
            ---calc_speed_up
               |          
               |--18.44%--dgemm_avx256
               |          
               |--8.10%--dgemm_unrolled_avx256
               |          
                --4.32%--dgemm_blocked_avx256

    18.44%   8.38%  20.42%  13.01%   8.24%  36.91%   7.65%   0.00%   0.00%  17.30%  10.39%  16.11%  11.71%  14.05%  14.43%  16.15%  13.47%  18.40%  15.63%  10.04%   0.00%  13.94%  15.98%  10.43%   1.41%  18.33%   1.59%  21.99%  21.40%   7.19%   0.00%  11.89%  17.04%   9.25%  17.52%   0.00%   0.00%  14.29%  10.78%  16.86%   0.00%   0.00%   0.00%  12.19%   0.43%   6.69%   0.00%   0.00%   7.64%  17.77%   1.63%   5.79%  13.23%   8.44%   0.00%  23.73%  14.83%  19.20%  dgemm    dgemm                 [.] dgemm_avx256
            |
            ---calc_speed_up
               dgemm_avx256

     8.10%   4.99%  19.91%  14.51%  10.63%   3.17%   2.04%   0.00%   0.00%   7.46%   3.73%   7.87%   3.81%   5.08%   5.67%   5.39%   4.48%   9.62%   5.02%   1.94%   0.00%   2.58%   3.66%   1.71%   0.00%   6.55%   0.00%  10.52%  10.58%  11.39%   0.00%   4.62%  16.70%  10.56%  22.38%   0.00%   0.00%   5.08%   3.72%   6.66%   0.00%   0.00%   0.00%   4.61%   0.36%   2.75%   0.00%   0.00%   3.43%   8.44%   0.00%   1.53%   4.86%   1.71%   0.00%  12.64%   3.87%   8.02%  dgemm    dgemm                 [.] dgemm_unrolled_avx256
            |
            ---calc_speed_up
               dgemm_unrolled_avx256

     4.32%   2.55%  11.18%   2.31%   1.99%   2.14%   0.12%   0.00%   0.00%   3.51%   1.87%   3.72%   3.06%   2.47%   2.63%   0.58%   1.81%   7.87%   0.66%   0.95%   0.00%   1.90%   0.52%   1.19%   0.08%   9.28%  36.06%   4.40%   1.61%   3.19%   0.00%   1.32%   1.95%   5.51%  16.41%   0.00%   0.00%   0.38%   4.54%   6.17%   0.00%   0.00%   0.00%   1.08%   0.07%   0.55%   0.00%   0.00%   1.70%   4.13%  23.38%   1.18%   2.72%   1.24%   0.00%   2.96%   1.93%   3.94%  dgemm    dgemm                 [.] dgemm_blocked_avx256
            |
            ---calc_speed_up
               dgemm_blocked_avx256

     4.25%  48.68%   5.88%   9.24%  15.70%   8.48%   1.99%   0.00%   0.00%   6.24%  28.06%   4.61%  30.98%  23.47%  18.01%   2.62%  22.74%   3.92%   5.55%  28.99%   0.00%  22.24%   5.48%  24.10%   3.60%   4.00%   6.40%   7.21%  15.15%   4.78%   0.00%  28.41%  10.53%   5.44%   3.99%   0.00%   0.00%   4.15%  13.12%   2.84%   0.00%   0.00%   0.00%  14.19%   0.50%  15.39%   0.00%   0.00%  46.66%   4.33%   3.16%   6.38%  20.33%  10.92%   0.00%  10.01%  26.02%   6.06%  dgemm    dgemm                 [.] dgemm_basic_blocked
            |
            ---dgemm_basic_blocked
```
##### TODO what `l2_request_g2.group1` and `l2_request_g1.group2` measures. See this [Q&A_1](https://stackoverflow.com/questions/76601866). Also see [this Q&A](https://unix.stackexchange.com/posts/750399/timeline#history_8a66734e-9ee0-40e4-bdeb-9e4ff000021e) and [miscs_py_script] script.
- not use `l2_request_g1.group2` it may cause sampling failure. And also above weird samples <a id="percent_error"></a>
```bash
$ cat /mnt/ubuntu/home/czg/csapp3e/debug/sample_all_cache.log.report | less -S
           729         800         754         416         768         126         718           0           0         779           0         793          45         341         135          69         157         747         800          21           0         407         803         410         215         784         443         821         828         233           0           0         801         322         717           0           0         707          48         652           0           0           0          39           5           8           0           0         755         701          37         436         134           4           0         716           0         688  dgemm    dgemm                 [.] dgemm_basic_blocked
            |
            ---dgemm_basic_blocked # here has one weird `779           0`, so `group2` not sampled. But the above percentage still count it.
$ cd;perf record -F 100000 -g -e l2_request_g2.bus_locks_originator,l2_request_g2.bus_locks_responses\
,l2_request_g2.ic_rd_sized,l2_request_g2.ic_rd_sized_nc\
,l2_request_g2.ls_rd_sized,l2_request_g2.ls_rd_sized_nc\
,l2_request_g2.smc_inval\
,l2_request_g2.group1,l2_request_g1.group2\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/group2.log
# here also cause `group1` fails to sample.
$ perf report -i ~/perf_log/group2.log -n --group --stdio
...
# Total Lost Samples: 0
```
- Answering the above Q&A_1, from [PPR_17h_60h] p163, they are just *OR* relation in **most situations**. The unit0 probably just means **reset** state. And from [OCRR_17h] p160, it means that "Miscellaneous events covered in more detail by" in [PPR_17h_60h] "PMCx061" refers to all group1 events.
  Also note as the [PPR_17h_60h] says "result in misleading counts", sometimes if sum up, we may get not consistent result. See [#750399 post "Not sum. 0xf9:  5091787060.0 , while mask sum:  5150956350.0"](https://unix.stackexchange.com/posts/750399/timeline#history_8a66734e-9ee0-40e4-bdeb-9e4ff000021e) which can be also seen in [miscs_py_script]. 
  From this [llvm review "doesn't really count the 6 pipes."](https://reviews.llvm.org/D94395?id=341995), the [`0xc8`](https://github.com/torvalds/linux/blob/a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451/tools/perf/pmu-events/arch/x86/amdzen2/recommended.json#L31) shown in the above #750399 post may be not accurate just as the post says.
```bash
$ perf stat -e r0aa,r1aa sleep 1 

 Performance counter stats for 'sleep 1':

                 0      r0aa                                                                  
         1,815,971      r1aa
```
###### so ignore `l2_request_g2.ls_rd_sized` and `l2_request_g2.ls_rd_sized_nc`
##### `l2_request_g1.all_no_prefetch` is sum of other small events. Ignore it.
##### `ic_cache_fill_l2` from here use new perf data
```bash
$ cd;perf record -g --call-graph fp -e l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
,l2_cache_req_stat.ls_rd_blk_x\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/l2_cache_req_stat_ic_cache_fill_etc.log
# can also use `--no-children` to compare and choose the preferred 
$ perf report -i ~/perf_log/l2_cache_req_stat_ic_cache_fill_etc.log --group --stdio -n --hierarchy
...
$ 
```
- From above, viewing the value `ic_cache_fill_l2/ic_cache_fill_sys`, it 
##### `l2_request_g1`; better view `ls_refills_from_sys`. (The following also has `ls_sw_pf_dc_fill` and `ls_hw_pf_dc_fill`)
###### `l2_request_g1` related cmds
```bash
$ cd;perf record -g --call-graph fp -e l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\    
,l2_request_g1.ls_rd_blk_c_s\
,l2_request_g1.cacheable_ic_read\
,l2_request_g1.change_to_x\
,l2_request_g1.prefetch_l2_cmd\
,l2_request_g1.l2_hw_pf\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/l2_request_g1.log
$ file=l2_request_g1;perf report -i ~/perf_log/${file}.log --group --stdio -n --hierarchy > /mnt/ubuntu/home/czg/csapp3e/debug/${file}.report
$ cd /mnt/ubuntu/home/czg/csapp3e;file=l2_request_g1;python debug/perf_report_post.py -i debug/${file}.report -o debug/sample_${file}.report
$ cat debug/sample_${file}.report
...
   26773       12993       19163       11995        1335           0       26645        dgemm  
       26670       12144       17668        9581          53           0       26483        dgemm               
          13889       10558       11799        6094          20           0       13775        [.] dgemm_basic
            |
            ---0x7f7bf6b27850
               main
               calc_speed_up
               dgemm_basic

          3343         192        2017        1108           0           0        3269        [.] dgemm_avx256
            |
            ---0x7f7bf6b27850
               main
               calc_speed_up
               dgemm_avx256

           1127          47         601         386           1           0        1153        [.] dgemm_unrolled_avx256
            |
            ---0x7f7bf6b27850
               main
               calc_speed_up
               dgemm_unrolled_avx256

           7753        1008        2894        1734          11           0        7665        [.] dgemm_basic_blocked
            |
            ---0x7f7bf6b27850
               main
               calc_speed_up
               dgemm_basic_blocked

           510         271         279         209           0           0         518        [.] dgemm_blocked_avx256
            |
            ---0x7f7bf6b27850
               main
               calc_speed_up
               dgemm_blocked_avx256
```
- `dgemm_basic` load  more from sys mem, because it traverse range is too large. As said [before](#fetch),
- `prefetch_l2_cmd` can be seen in [17h_01h] p172, **software prefetch** may interfere hardware prefetch and also if it fetches instruction, then it will interfere the data cache. So above it shows **0**.
  - similarly, `ls_sw_pf_dc_fill` all no count. See [ls_sw_pf_dc_fill](#ls_sw_pf_dc_fill)
- `change_to_x`: only `dgemm_basic` and `dgemm_basic_blocked` shows one small value. (The `dgemm_unrolled_avx256` shows 1, ignore it) Because they not use somewhat parallel method like avx, so ~~cpu may schedule a new thread to help running it with original threads~~ it may change cache state. See [SOG_17h] doc p18, it use "Linear address utag" (i.e. ~~at least virtually indexed. ~~ to accelerate selecting way with **hash** after using VIPT,etc to [select **set**](https://en.wikipedia.org/wiki/CPU_cache#Cache_entry_structure).). So it may conflict.
  - Since avx256 is 32 byte (256=32*8), it corresponds to 'L2 to L1 data path is 32 bytes wide.' in [SOG_17h] p19. So perform better (both load and invalidation less). <a id="data_path"></a>
    - it is just  and also not exceed [cacheline size](#cacheline_byte). 
    - Also see [SOG_17h] p17 it conforms to "natural **alignment** boundary". so `__m256d` use `__vector_size__ (32),` in `g++` header.
    - kw: "two 128-bit loads",
    - Since it is **loaded together** (So `dgemm_basic_blocked` still has `change_to_x`), it may less possible to cause hash conflict.
  - [PPR_17h_60h] p164 LS meaning see [SOG_17h] p33.
    - [PPR_17h_60h] `EX` should be the execution stage. `DE` decoder (Then will 'Dispatch Resource'), `BP` -> 'Branch Prediction' (related with `IC`(Instruction Cache), so put together)
  - [AGQ](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2) in [SOG_17h] p27. `DE` may means ['directory entry'](https://wiki.osdev.org/Paging)
- [`Overhead`](https://perf.wiki.kernel.org/index.php/Tutorial) proportion may be not same as `Samples` proportion due to precison of 2. Use `Samples` better.
- view the `rate1=l2_request_g1.rd_blk_l/l2_request_g1.rd_blk_x`, here obviously avx `rate1` is higher because store one **packet** with four data instead of one data 
  (although with `-O3` `basic` get use `xmm` 128 bit but not use `vfmadd231pd`).
  Here `dgemm_unrolled_avx256` use multiple `ymm` register because of **small** `unroll` size which is optimized by compiler. <a id="ymm"></a>
- 
- DAT,WCB(maybe WC(write-combining) buffer),MAB,STP meaning in [SOG_17h] p34.
- From the close relation between L1 `L1-*` and L2 `l2_request_g1` in `perf annotate`. They may not use uncachable store buffer. So 
###### `ls_sw_pf_dc_fill`
- notice: on 4800h with only **one numa**, `ls_sw_pf_dc_fill.ls_mabresp_rmt_cache` and `ls_sw_pf_dc_fill.ls_mabresp_rmt_dram` show $0$. But `ls_mabresp_lcl_cache` >  `ls_mabresp_lcl_l2` >`ls_mabresp_lcl_dram`. So obviously implicitly using multiple threads.
  Here, why `dgemm_unrolled_avx256`'s `ls_mabresp_lcl_cache`,etc are less than `dgemm_avx256` is probably because ~~it use multiple [`ymm`](#ymm)~~. ~~So the former may use write combining buffer to write together which is not viewed from the assembly code.~~ (Compared with `ls_hw_pf_dc_fill` and `ls_refills_from_sys`, `ls_sw_pf_dc_fill` can be ignored based on **Amdahl's law**.)
  Since most of `l2_request_g1` are not $0$, so it use cacheable write buffer. Then `ls_st_commit_cancel2.st_commit_cancel_wcb_full` is $0$.
  ```bash
  $ cd;perf record -g --call-graph fp -e l2_request_g1.rd_blk_l,l2_request_g1.rd_blk_x\
  ,l2_request_g1.ls_rd_blk_c_s\
  ,l2_request_g1.cacheable_ic_read\
  ,l2_request_g1.change_to_x\
  ,l2_request_g1.prefetch_l2_cmd\
  ,l2_request_g1.l2_hw_pf\
  ,ls_sw_pf_dc_fill.ls_mabresp_lcl_cache,ls_sw_pf_dc_fill.ls_mabresp_lcl_dram\
  ,ls_sw_pf_dc_fill.ls_mabresp_lcl_l2\
  ,ls_sw_pf_dc_fill.ls_mabresp_rmt_cache,ls_sw_pf_dc_fill.ls_mabresp_rmt_dram\
  ,ls_st_commit_cancel2.st_commit_cancel_wcb_full\
  ,ls_hw_pf_dc_fill.ls_mabresp_lcl_cache,ls_hw_pf_dc_fill.ls_mabresp_lcl_dram\
  ,ls_hw_pf_dc_fill.ls_mabresp_lcl_l2\
  ,ls_hw_pf_dc_fill.ls_mabresp_rmt_cache,ls_hw_pf_dc_fill.ls_mabresp_rmt_dram\
  ,ls_refills_from_sys.ls_mabresp_lcl_cache,ls_refills_from_sys.ls_mabresp_lcl_dram\
  ,ls_refills_from_sys.ls_mabresp_lcl_l2\
  ,ls_refills_from_sys.ls_mabresp_rmt_cache,ls_refills_from_sys.ls_mabresp_rmt_dram\
    ~/matrix-matrix-multiply/build/src/dgemm;
  $ cat /mnt/ubuntu/home/czg/csapp3e/debug/sample_prefetch.report
  ...
  # Event count (approx.): 2926555774
  ...
    7650        4637        5272        2778         294           0        7623        1423          79         186           0           0           0        7678        4680        7700           0           0        7548        3498        7632           0           0        dgemm  
        7630        4376        4973        2269           5           0        7529        1314          17         134           0           0           0        7667        4474        7688           0           0        7536        2910        7607           0           0        dgemm               
          3937        3685        3311        1531           3           0        3877         853          13          86           0           0           0        3922        2891        3912           0           0        3917        2253        3929           0           0        [.] dgemm_basic
            |
            ---0x7f93f27c3850
                main
                calc_speed_up
                dgemm_basic

          986          56         455         163           1           0        1011         100           0          17           0           0           0        1054         562        1042           0           0        1056         458        1046           0           0        [.] dgemm_avx256
            |
            ---0x7f93f27c3850
                main
                calc_speed_up
                dgemm_avx256

            283           2          90         100           0           0         270          49           2           8           0           0           0         317         145         282           0           0         267          86         251           0           0        [.] dgemm_unrolled_avx256
            |
            ---0x7f93f27c3850
                main
                calc_speed_up
                dgemm_unrolled_avx256

            2238         509        1031         406           0           0        2191         286           0          21           0           0           0        2250         782        2206           0           0        2210          48        2196           0           0        [.] dgemm_basic_blocked
            |
            ---0x7f93f27c3850
                main
                calc_speed_up
                dgemm_basic_blocked

            176         113          67          57           0           0         132          21           1           0           0           0           0         122          31         157           0           0          85          64         185           0           0        [.] dgemm_blocked_avx256
            |
            ---0x7f93f27c3850
                main
                calc_speed_up
                dgemm_blocked_avx256
  ```
  Here why `dgemm_unrolled_avx256` is that it use `vbroadcastsd` fourth times each k-loop. Then avoid duplicate loads. So that it demands loading less, then `ls_refills_from_sys` is less in `ls_refills_from_sys.ls_mabresp_lcl_dram` (less demands to main mem) (i.e. **comparison_1**: `ls_refills_from_sys.ls_mabresp_lcl_dram` is less than `ls_hw_pf_dc_fill.ls_mabresp_lcl_dram` compared with `dgemm_avx256` and `dgemm_basic`).
  With respect to `dgemm_basic_blocked`, it use `block` so it must load less from dram. So also has *comparison_1* relation (The `perf annotate` about `dgemm_basic_blocked` is somewhat not accurate, so not post it here.)
  ```bash
    0       0       2       0       2       0       0       0       0       0       0       0 :   3252:   vbroadcastsd ymm0,QWORD PTR [rdx]
    ...
    0       0       0       0       0       0       0       0       0       0       0       0 :   3261:   vfmadd231pd ymm4,ymm0,YMMWORD PTR [r12+r10*8]
                                                                                              : 56   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
    0       0     101      37      78       0       0      64      13      74       0       0 :   3267:   lea    r10,[r9+rax*1]
                                                                                              : 40   _mm256_fmadd_pd(double __vector(4), double __vector(4), double __vector(4)):
    0       0      22      11      24       0       0      20       4      26       0       0 :   326b:   vfmadd231pd ymm3,ymm0,YMMWORD PTR [r12+r10*8]
                                                                                              : 50   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
    0       0      20       7      22       0       0       9       6      16       0       0 :   3271:   lea    r10,[r8+rax*1]
    0       0       0       0       0       0       0       0       0       0       0       0 :   3275:   add    rax,r11
                                                                                              : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4), double __vector(4)):
    0       0       0       0       0       0       0       0       0       0       0       0 :   3278:   vfmadd231pd ymm2,ymm0,YMMWORD PTR [r12+r10*8]
    0       0     130      55     137       0       0     101      40      98       0       0 :   327e:   vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rax*8]
                                                                                              : 51   dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*):
                                                                                              : 35   for (uint32_t k = 0; k < n; k++) {
    0       0      35      21      38       0       0      28       9      28       0       0 :   3284:   cmp    r13,rdx
    0       0       0       0       0       0       0       1       0       0       0       0 :   3287:   jne    3250 <dgemm_unrolled_avx256(unsigned int, double const*, double co>
  ```
  So now we only focus on the `ls_hw_pf_dc_fill` among the three group `ls_sw_pf_dc_fill`, `ls_refills_from_sys` and `ls_hw_pf_dc_fill`. [See](#ls_hw_pf_dc_fill)
  - [when](https://lemire.me/blog/2018/04/30/is-software-prefetching-__builtin_prefetch-useful-for-performance/) will use software prefetch: if "the access pattern looks too unpredictable" (e.g. address has **dependency**). But "software prefetchers have no additional ressources" So it may be difficult to know whether **it is time** to prefetch. TODO "... take into account memory-level parallelism."
    - better use hardware prefetch instead of software which is said many posts. Also see ["So the hardware prefetcher was **busy** during this time"](https://lwn.net/Articles/444336/)
###### `ls_hw_pf_dc_fill`
```python
$ python debug/bfloat16_half.py
...
dgemm_basic_normalized -> [1.36, 1.0, 1.35, 0.0, 0.0]
dgemm_avx256_normalized -> [1.88, 1.0, 1.85, 0.0, 0.0]
dgemm_unrolled_avx256_normalized -> [2.19, 1.0, 1.94, 0.0, 0.0]
dgemm_basic_blocked_normalized -> [2.88, 1.0, 2.82, 0.0, 0.0]
dgemm_blocked_avx256_normalized -> [3.94, 1.0, 5.06, 0.0, 0.0]
compare base dram
dgemm_basic -> 1.0
dgemm_avx256 -> 0.19
dgemm_unrolled_avx256 -> 0.05
dgemm_basic_blocked -> 0.27
dgemm_blocked_avx256 -> 0.01
```
- compare base dram: from above, just as said before, `avx256` load size is [L2 to L1 size](#data_path) (the loads/stores hot location is at `2f26:   cmp    r8,rax` in `perf annotate` because ["waiting for it"][miss_event_blame]).
  Then `dgemm_unrolled_avx256` with unroll size $4$, so it is $\frac{0.19}{4}\approx0.05$
  `dgemm_basic_blocked` just [reuse](#reuse).
- normalized: similar to the above, `avx256` load more from cache because it load unit (256 bits) is larger.
  `dgemm_basic_blocked` is based on the [block](#block), so even load more from cache.
##### `l2_cache_req_stat` (not including L2 Prefetch) and `de_dis_uops_from_decoder`
```bash
$ dir=/mnt/ubuntu/home/czg/csapp3e;\                                                 
file=no_prefetch_l2_opcache;\
events=l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
,l2_cache_req_stat.ls_rd_blk_x\
,de_dis_uops_from_decoder.opcache_dispatched,de_dis_uops_from_decoder.decoder_dispatched;\
events_num=$(echo ${events} | awk -F "," "{print NF}" -);\
cd;perf record -g --call-graph fp -e ${events}\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/${file}.log;\
perf report -i ~/perf_log/${file}.log --group --stdio -n --hierarchy > ${dir}/debug/${file}.report
python ${dir}/debug/perf_report_post.py -i ${dir}/debug/${file}.report -o ${dir}/debug/sample_num_${file}.report -n ${events_num}
$ less -S /mnt/ubuntu/home/czg/csapp3e/debug/sample_num_no_prefetch_l2_opcache.report
   26682       16215       13184       26815       12390       26813       18476        dgemm  
       26588       15359       12276       26764       11692       26770       16997        dgemm               
          13891        8187        7173       13914        8837       13692        9066        [.] dgemm_basic
          3512        1499         967        3524         552        3281        1657        [.] dgemm_avx256
           7659        4736        3512        7643        1776        7667        5222        [.] dgemm_basic_blocked
           1031         596         374        1033           6         939         496        [.] dgemm_unrolled_avx256
           488         150         142         530         355         436         405        [.] dgemm_blocked_avx256
```
- `ls_rd_blk_c` is just ``
###### `de_dis_uops_from_decoder`
- there seems no related doc about 17h 60h model opcache implementation by "AMD doc "OpCache" site:amd.com". 
  [zen2 ~~implementation~~ opcache performance](https://chipsandcheese.com/2021/07/03/how-zen-2s-op-cache-affects-performance/) (TODO 'the Twitterverse',)
- [opcache Q&A](https://superuser.com/questions/1368480/how-is-the-micro-op-cache-tagged) in intel, **amd** seems to not have many people knowing it.
  - As it says, it is mainly used in "(speculative) execution" and not store unnecessary things like `0x90 NOP`. 
    - kw: "doesn't try to populate the uop cache ... ", "has multiple jump entries", maybe "virtually addressed (VIVT)", "This is guesswork"
    - TODO `0xcc int3` may just use `0xcc` as one *mark*, see "replace the first byte ... without overwriting other instructions".
  - [MITE,LSD][LSD_DSB_MITE]
    - as paper p3 says "mis-prediction occurs" and "exceeds the limit", LSD will not be used (also see the figure).
    - [LSD_DSB_MITE] p3 also says " two threads mutually affects the micro-op decoding". So above Q&A says "decodes the same bytes two different ways.". This implicitly means "forces DSB evictions of micro-ops of the **first thread** to occur" as paper says (i.e. "throw out the uop cache ways " in Q&A).
    - "filling up all 3 ways and triggering DSB-to-MITE switches" in Q&A see paper "exceeds the limit".
  - also see how to [measure](https://www.reddit.com/r/hardware/comments/12smvw9/comment/jgzufr3/?utm_source=share&utm_medium=web2x&context=3) opcache.
- the `de_dis_uops_from_decoder` counts obviously depends on instruction counts fetched. So the order is direct to get.
  - the `opcache_dispatched/decoder_dispatched` of `avx` is almost $2$ because it use avx instructions (`dgemm_basic` is almost $1.5$).
    - TODO but why `dgemm_blocked_avx256` is not one mix of `dgemm_unrolled_avx256` and `dgemm_basic_blocked` like something $1.7$. It shows proportion $1$. 
      - The `annotate` output shows hot `237     204 :   30f5:   cmp    r11,rdx` which is located in k-loop by viewing the comment (the whole proportion of each func is almost same as the proportion of the hot location inside that func.)
        ```cpp
           0       0       0       0       0       0       0 :   30c0:   mov    edi,ecx
                                                             : 31   _mm256_broadcastsd_pd(double __vector(2)):
                                                             ...
                                                             : 25   for (uint32_t k = sk; k < sk + BLOCKSIZE; k++) {
         242      78      76     281     158     237     204 :   30f5:   cmp    r11,rdx
           0       0       1       0       0       0       0 :   30f8:   jne    30c0 <dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+0x160>
        ``` 
      - guess based on above Q&A:
        1. "decoded along the path of (speculative) execution". Maybe the loop is some
        2. from this [paper](https://www.cs.virginia.edu/venkat/papers/isca2021a.pdf), amd has no LSD, so only has opcache and MITE. It can't be LSD to help the **more predictable**(because it targets to one block.) 
        - [opcache_patent] patent, also [see](#amd_patent_1)
          - fig2: 3. Maybe due to "Ucode EP:" splits the OC entry, so only 0-3 can store ops and 5-7 store data. See p11. And even only "A micro-coded instruction" can consume the whole **operation 220 position** which can store 4 uop.
            - "DQ" control whether **bypass** "DQ-bypass multiplexer " and output IC data.
            - 410 -> 440, because440 needs to forward "physical fetch address".
            - OCQ is just something like the write buffer.
              - "OCQ 460 is empty, bypassed around the OCQ 460 as new addresses arrive," -> just skip OCQ to go to 470.
          - p17 what opcache entry stores.
          - p18 here utag is only used to predict. it may be imprecise because of hash func and the tag is the real tag.
            - TODO not change utag? "returns to step 710 of method 700."
          - mainly see Fig 4&5.
            - main idea: "OC Fetch Redirect  " and utag control whether in OC/IC mode by "DQ 430 receives the fetch address ...".
          - kw: "decoded instructions (ops) ", 620: "assembled OC entry contents"
          - Also [OC/IC ,etc](https://fuse.wikichip.org/news/2458/a-look-at-the-amd-zen-2-core/) TODO BPU meaning.
          - "FIG. 4" -> "IC decoder": 
      - after **tweaking `BLOCKSIZE` by setting it to `n`** (i.e. `BLOCKSIZE = 32 * 20;`), with one new parent loop, the compiler seems to better understand the code.
        ```cpp
        // dgemm_blocked_avx256
          30d0:       44 89 d0                mov    eax,r10d
          30d3:       c4 c2 7d 19 03          vbroadcastsd ymm0,QWORD PTR [r11]
          30d8:       41 01 f2                add    r10d,esi
          30db:       49 83 c3 08             add    r11,0x8
          30df:       4e 8d 34 00             lea    r14,[rax+r8*1]
          30e3:       c4 a2 fd b8 14 f3       vfmadd231pd ymm2,ymm0,YMMWORD PTR [rbx+r14*8]
          30e9:       4c 8b 74 24 f8          mov    r14,QWORD PTR [rsp-0x8]
          30ee:       49 01 c6                add    r14,rax
          30f1:       c4 a2 fd b8 1c f3       vfmadd231pd ymm3,ymm0,YMMWORD PTR [rbx+r14*8]
          30f7:       4c 8b 74 24 f0          mov    r14,QWORD PTR [rsp-0x10]
          30fc:       49 01 c6                add    r14,rax
          30ff:       c4 a2 fd b8 24 f3       vfmadd231pd ymm4,ymm0,YMMWORD PTR [rbx+r14*8]
          3105:       4c 8b 74 24 e8          mov    r14,QWORD PTR [rsp-0x18]
          310a:       4c 01 f0                add    rax,r14
          310d:       c4 e2 fd b8 0c c3       vfmadd231pd ymm1,ymm0,YMMWORD PTR [rbx+rax*8]
          3113:       4c 39 5c 24 d8          cmp    QWORD PTR [rsp-0x28],r11
          3118:       75 b6                   jne    30d0 <dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+0x170>
        // dgemm_unrolled_avx256
          3270:       89 c8                   mov    eax,ecx
          3272:       c4 e2 7d 19 02          vbroadcastsd ymm0,QWORD PTR [rdx]
          3277:       48 83 c2 08             add    rdx,0x8
          327b:       01 d9                   add    ecx,ebx
          327d:       4c 8d 14 07             lea    r10,[rdi+rax*1]
          3281:       c4 82 fd b8 24 d4       vfmadd231pd ymm4,ymm0,YMMWORD PTR [r12+r10*8]
          3287:       4d 8d 14 01             lea    r10,[r9+rax*1]
          328b:       c4 82 fd b8 1c d4       vfmadd231pd ymm3,ymm0,YMMWORD PTR [r12+r10*8]
          3291:       4d 8d 14 00             lea    r10,[r8+rax*1]
          3295:       4c 01 d8                add    rax,r11
          3298:       c4 82 fd b8 14 d4       vfmadd231pd ymm2,ymm0,YMMWORD PTR [r12+r10*8]
          329e:       c4 c2 fd b8 0c c4       vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rax*8]
          32a4:       49 39 d5                cmp    r13,rdx
          32a7:       75 c7                   jne    3270 <dgemm_unrolled_avx256(unsigned int, double const*, double const*, double*)+0xc0>
        ``` 
        from above, the `dgemm_unrolled_avx256` is pattern is ~~more unpredictable ~~ less **normalized** than `dgemm_blocked_avx256` (the latter use the similar sequence `vfmadd231pd,mov ... [rsp...],add`)
        ```cpp
        // see the last two columns : de_dis_uops_from_decoder.opcache_dispatched,de_dis_uops_from_decoder.decoder_dispatched
        // dgemm_unrolled_avx256
           2     421     214 :   3287:   lea    r10,[r9+rax*1]
                              : 40   _mm256_fmadd_pd(double __vector(4), double __vector(4), doub>
            0      27      15 :   328b:   vfmadd231pd ymm3,ymm0,YMMWORD PTR [r12+r10*8]
                              : 50   dgemm_unrolled_avx256(unsigned int, double const*, double co>
            1      80      52 :   3291:   lea    r10,[r8+rax*1]
            0       1       1 :   3295:   add    rax,r11
                              : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4), doub>
            0       0       0 :   3298:   vfmadd231pd ymm2,ymm0,YMMWORD PTR [r12+r10*8]
            3     214     117 :   329e:   vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rax*8]
                              : 51   dgemm_unrolled_avx256(unsigned int, double const*, double co>
                              : 35   for (uint32_t k = 0; k < n; k++) {
            0      56      29 :   32a4:   cmp    r13,rdx
            0       1       0 :   32a7:   jne    3270 <dgemm_unrolled_avx256(unsigned int, double>
        // dgemm_blocked_avx256
           0       0       1       0 :   30e3:   vfmadd231pd ymm2,ymm0,YMMWORD PTR [rbx+r14*8]
                                     : 56   do_block_avx_256():
          21       0     176     150 :   30e9:   mov    r14,QWORD PTR [rsp-0x8]
          15       1      13      18 :   30ee:   add    r14,rax
                                     : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4),>
           0       0       0       0 :   30f1:   vfmadd231pd ymm3,ymm0,YMMWORD PTR [rbx+r14*8]
                                     : 50   do_block_avx_256():
          14       1      69      54 :   30f7:   mov    r14,QWORD PTR [rsp-0x10]
           2       0       0       0 :   30fc:   add    r14,rax
                                     : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4),>
           0       0       0       0 :   30ff:   vfmadd231pd ymm4,ymm0,YMMWORD PTR [rbx+r14*8]
                                     : 50   do_block_avx_256():
          84       2     152     103 :   3105:   mov    r14,QWORD PTR [rsp-0x18]
           1       0       2       1 :   310a:   add    rax,r14
                                     : 41   _mm256_fmadd_pd(double __vector(4), double __vector(4),>
          15       0      16      15 :   310d:   vfmadd231pd ymm1,ymm0,YMMWORD PTR [rbx+rax*8]
                                     : 50   do_block_avx_256():
                                     : 34   for (uint32_t k = sk; k < sk + BLOCKSIZE; k++) {
          41       4     109      63 :   3113:   cmp    QWORD PTR [rsp-0x28],r11
           2       0       2       2 :   3118:   jne    30d0 <dgemm_blocked_avx256(unsigned int, do>
        ```
        So have the following result:
        The `dgemm_blocked_avx256` hot path is **longer** although it has one more regular path and average the `de_dis_uops_from_decoder` among them, so its `de_dis_uops_from_decoder.decoder_dispatched` is larger. 
        See [opcache_patent] p26 fig3 and p11 related description, **longer** hot path may cause the opcache unable to store the significant instructions after storing too many redundant data like duplicate `mov,add` and same registers.
        Notice: above source code is based on `641a164` of `git@github.com:czg-sci-42ver/matrix-matrix-multiply.git` where use three `#pragma GCC unroll 1` and allow `inline` in both `do_block_avx_256` and `do_block`.
        ```bash
         # same as above, see the last two column num 
         253        1018          13         819         628        [.] dgemm_blocked_avx256
         340        1042           7         933         481        [.] dgemm_unrolled_avx256
        4050        8167        2553        8236        5016        [.] do_block
        ```
        **Notice**: although it seems that `dgemm_basic_blocked` and `dgemm_blocked_avx256` should have one similar assembly code organization, but compiler may be not ~~think of that~~ unable to do that. From the following and the above cpp, `dgemm_basic_blocked` don't have one "similar sequence" because ~~no~~ not uses [xmm version](https://www.felixcloutier.com/x86/vfmadd132pd:vfmadd213pd:vfmadd231pd) of `vfmadd231pd` to calculate in parallel.
        Then `do_block` loop counts more, so its `de_dis_uops_from_decoder` must be higher
        ```cpp
                                                               : 67   cij += A[i + k * n] * B[k + j * n]; /* cij+=A[i][k]*B[k][j] */
           328     237     158     350      63     299     210 :   402f:   mov    r8d,edx
             2       0       3       0       0       1       3 :   4032:   mov    esi,eax
                                                               : 66   for (uint32_t k = sk; k < sk + BLOCKSIZE; k++) {
             0       1       1       1       1       0       1 :   4034:   inc    eax
           726     381     258     760     131     344     329 :   4036:   add    edx,r12d
                                                               : 67   cij += A[i + k * n] * B[k + j * n]; /* cij+=A[i][k]*B[k][j] */
           450     273     212     444      98     388     269 :   4039:   vmovsd xmm0,QWORD PTR [r14+r8*8]
          1073     613     532     909     244    1355     735 :   403f:   vmulsd xmm0,xmm0,QWORD PTR [r13+rsi*8+0x0]
           761     435     319     690     182     644     450 :   4046:   vaddsd xmm1,xmm1,xmm0
                                                               : 66   for (uint32_t k = sk; k < sk + BLOCKSIZE; k++) {
          1738    1222     905    1915     431    1752    1043 :   404a:   cmp    ecx,eax
          1172     783     543    1219     287     984     653 :   404c:   jne    402f <dgemm_basic_blocked(unsigned int, double const*, double const*, double*)+0xaf>
        ```
      - tweaking `BLOCKSIZE` back and view how `dgemm_blocked_avx256` get changed. See [mat_mat_mul] `dgemm_blocked_avx256.cpp`.
        ```cpp
        :
        610         299        [.] dgemm_unrolled_avx256
        506         408        [.] dgemm_blocked_avx256 // 1.2401960784313726

        /2:
        600         268        [.] dgemm_unrolled_avx256
        297         125        [.] dgemm_blocked_avx256 // 2.376
        /10:
        615         283        [.] dgemm_unrolled_avx256
        379         405        [.] dgemm_blocked_avx256 // 0.9358024691358025
        ```
        TODO: When using one huge block but not the total,
        Notice: here diables unroll in `do_block_avx_256` and the `dgemm_blocked_avx256:  elapsed-time=     19547     speed-up=   17.9827` which is not double of `dgemm_unrolled_avx256:  elapsed-time=     24084     speed-up=   13.8905` with `BLOCKSIZE = 32 * 20 / 10` which is `n/10`.
        Then with `n/20` they have the double relation.
        So can just ignore it because it won't cause one bottleneck.
      - [opcache_patent] <a id="amd_patent_1"></a>
        - p12 at a taken branch target. -> 310b. And "at the last byte of a taken branch instruction." -> 310b and 310d.
        - Here **cacheline** storage is continuous but opcache is not. It may have unused "the op storage remaining empty.".
          - This may can explain the above weird `dgemm_blocked_avx256` behavior because it has 
        - p13 "OC Microtag " is to **predict**. which is also said in [zen_2] "predict the way where the instruction block".
          But [zen_2] says "Bypassing the clock-gated fetch and **decode** units" while [opcache_patent] says "the OC data array is read and **decoded**". (Wrong)
            the latter says decode OC entry and get op,imme,uop,etc. But not decode the instruction.
      - instruction op list see Agner doc p102 with zen2.
        `lea    r10,[r9+rax*1]` -> 1 1-2
        `vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rax*8]` -> v,v,v/m 1
        ...
### comparsion after adding `store` related
### perf miscs
- get event code and mask from this kernel [maillist](https://lore.kernel.org/all/YZE8SDkzq0OMcmhS@krava/T/).
  ```bash
  $ perf --debug perf-event-open stat -e cache-misses sleep 1     
  ------------------------------------------------------------
  perf_event_attr:
    size                             136
    config                           0x3
    sample_type                      IDENTIFIER
    read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
    disabled                         1
    inherit                          1
    enable_on_exec                   1
    exclude_guest                    1
  ------------------------------------------------------------
  sys_perf_event_open: pid 58431  cpu -1  group_fd -1  flags 0x8 = 3
  ```
  So, not use `-a` which will track all processes by its output `sys_perf_event_open: pid -1  cpu 0  group_fd -1  flags 0x8 = 3`.
  from [source code](https://elixir.bootlin.com/linux/v4.2/source/tools/perf/builtin-trace.c#L84), it only enables `PERF_FLAG_FD_CLOEXEC` flag.
- [metric use](https://lwn.net/Articles/732567/)
- get umask from the doc [PPR_17h_60h] p187, also see [linux source](https://github.com/torvalds/linux/blob/995b406c7e972fab181a4bb57f3b95e59b8e5bf3/tools/perf/pmu-events/arch/x86/amdzen2/cache.json#L23). So `0x10` -> 5th bit -> `CacheableIcRead`. -> 'Instruction cache reads'. <a id="umask"></a>
- [`lstopo`](https://unix.stackexchange.com/questions/113544/interpret-the-output-of-lstopo) <a id="lstopo"></a>
  - check [pci](https://stackoverflow.com/questions/25908782/in-linux-is-there-a-way-to-find-out-which-pci-card-is-plugged-into-which-pci-sl)
    - lspci output [meaning](https://www.thegeekstuff.com/2014/04/lspci-examples/) based on bus. Better view [uefi doc](https://uefi.org/specs/UEFI/2.10/14_Protocols_PCI_Bus_Support.html#server-system-with-four-pci-root-bridges)
  - [home node](https://opvizor.medium.com/vmware-vsphere-why-checking-numa-configuration-is-so-important-9764c16a7e73) meaning, also [see](#local_remote_access) also see [uprof_doc] p19.
- view [event definition](https://perf.wiki.kernel.org/index.php/Tutorial#Hardware_events). See BKDG. Also ['Open-Source Register Reference'](https://www.reddit.com/r/Amd/comments/amovex/requesting_bios_and_kernel_developer_guide_bkdg/)
- better to view the code, and the wiki may be [outdated](https://stackoverflow.com/questions/67772680/what-is-the-default-behavior-of-perf-record) (here is how to check default freq, i.e. `-F` param in `perf record -F 100000`).
- umask OR relation, see related [source code](https://github.com/torvalds/linux/blob/a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451/tools/perf/pmu-events/arch/x86/amdzen2/other.json#L11). So they have OR relation, although **same event and umask** may offer different data with same program:
```bash
$ perf --debug perf-event-open stat -e r2aa,r1aa,r3aa,rffaa,de_dis_uops_from_decoder sleep 1
perf_event_attr:
  type                             4
  size                             136
  config                           0xffaa
  sample_type                      IDENTIFIER
  read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
  disabled                         1
  inherit                          1
  enable_on_exec                   1
  exclude_guest                    1
------------------------------------------------------------
sys_perf_event_open: pid 22216  cpu -1  group_fd -1  flags 0x8 = 9
------------------------------------------------------------
perf_event_attr:
  type                             4
  size                             136
  config                           0xffaa
  sample_type                      IDENTIFIER
  read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
  disabled                         1
  inherit                          1
  enable_on_exec                   1
  exclude_guest                    1
------------------------------------------------------------
sys_perf_event_open: pid 22216  cpu -1  group_fd -1  flags 0x8 = 10

 Performance counter stats for 'sleep 1':

           478,357      r2aa                                                                  
         1,824,584      r1aa                                                                  
         2,303,227      r3aa                                                                  
         2,303,513      rffaa                                                                 
         2,303,803      de_dis_uops_from_decoder
```
- From all the above tests, all the PMC count hot locations are same for almost all events. So probably as the [perf_delay] says "choose **exactly one** of the in-flight instructions to "blame"" and "Be very **suspicious** of ... very small scales".
  - The [perf_delay] references [one interesting link](https://stackoverflow.com/questions/45442458/loop-with-function-call-faster-than-an-empty-loop) where highlights the alignment significance to keep function **order** not influencing the performance. See ["If you remove the **nops** it gets much slower."](https://stackoverflow.com/questions/45442458/loop-with-function-call-faster-than-an-empty-loop#comment83955473_45529487),
    - kw: ' (Your lack of an **ALIGN** directive ... changing the first one would have **changed** the alignment of the loop branch in the 2nd)',"help Skylake observe lower **store-forwarding** latency from push to pop" (from push to pop -> in the function,
    - TODO: 'You should see a huge speedup if you push edx but pop eax', "the stack engine"
- [LLC](https://fuse.wikichip.org/nehalem-sandy_bridge_overview_change/) (more [detailed](https://en.wikichip.org/wiki/intel/microarchitectures/coffee_lake)) also see QPI
  - [QPI vs FSB](https://superuser.com/questions/593651/confusion-with-terms-fsb-qpi-ht-dmi-umi): the latter is for older cpu which is probably one core ("kept a single FSB"), ~~so unit is Hz~~. The latter just increases the **bandwidth** and support more cpus to connect. Also [see "the frequency", "how many cpus"](https://linustechtips.com/topic/703903-whats-the-difference-between-qpi-and-fsb/?do=findComment&comment=8997108)
    - QPI resembles ["network"](https://en.wikipedia.org/wiki/Intel_QuickPath_Interconnect#Protocol_layers)
- zen2 infos can also be got from [7zip benchmark](https://www.7-cpu.com/cpu/Zen2.html)

---

# Links inspired by [this](https://stackoverflow.com/questions/25815856/including-reference-links-in-markdown-as-bullet-point-list-on-github)

---

- wikipedia 
  - [Sequential_consistency]
  - [Cache_Consistency_def]
- wikipedia_ref
  - [Wl_1]
- paper
  - memory consistency
    - [mosberger93memory]
    - [PC_orig]
    - [SC_orig]
    - [MEMORY_CONSISTENCY_DETAILED]
    - [isca90_GLL_90]
    - [herlihy]
    - [Misra_1985]
    - lamport
      - [Lamport_1985]
  - [shadow_memory]
- blog
  - preshing
    - [Memory_Barriers]
    - [Weak_vs_Strong_Memory_Models]
    - [ac_rel]
  - lwn
    - memory 
      - [mem_paper_1]
        - [CPU_cache]
        - [memory_Introduction]
        - [Virtual_Memory]
        - [NUMA]
        - [mem_perf_tools]
        - [mem_appendix]
      - [TLBs_and_costs]
  - wikichip
    - [wikichip_cpuid]
- assignment 
  - dphpc
    - [sequential_consistency]
- class_lecture
  - memory consistency
    - [sc_tso_cis601]
    - [lec_17]
    - [TSO_PC_PSO]
    - [stanford_149_09_consistency]
    - [memory_models]
    - [CSG280]
    - with math
      - [Misra_1985]
      - [Lamport_1985]
      - [Weak_Memory_Consistency]
- official doc
  - [sparcv9]
  - risc-v
    - [riscv_spec]
    - [riscv_privileged]
    - implementation 
      - [chromit]
  - amd
    - related with r7 4800h
      - [cpuid]
      - [17h_Optimization]
      - [rev_17h]
    - ppr
      - epyc
        - [19h_01h_vol_1][19h_01h_vol_1]
- patent
  - amd
    - [shared_tag_patent]
- book
  - from wikipedia
    - [Scalable_Shared_Memory_Multiprocessors_libgen]
  - COD (Computer Organization and Design) by David A. Patterson (Author), John L. Hennessy (Author)
    - [RISC_V_Orig]
    - [RISC_V_Custom]
    - [RISC_V_Custom_OCR]
  - CAAQA (Computer Architecture: A Quantitative Approach 6th edition) by David A Patterson and John L. Hennessy
    - [CAAQA]
- source code
  - perf
    - []
- Q&A
  - stackoverflow
    - [perf_cache_misses]

---

[Sequential_consistency]:https://en.wikipedia.org/wiki/Consistency_model#Sequential_consistency
[Wl_1]:https://en.wikipedia.org/wiki/Causal_consistency#cite_note-10
[mosberger93memory]:https://www.cse.psu.edu/~buu1/teaching/spring07/598d/_assoc/CCBD250576DD4E41ABC1EC82207C66A0/mosberger93memory.pdf
[Cache_Consistency_def]:https://en.wikipedia.org/wiki/Cache_coherence#Definition


[Memory_Barriers]:https://preshing.com/20120710/memory-barriers-are-like-source-control-operations/
[Weak_vs_Strong_Memory_Models]:https://preshing.com/20120930/weak-vs-strong-memory-models/
[ac_rel]:https://preshing.com/20120913/acquire-and-release-semantics/

---

[sequential_consistency]:https://spcl.inf.ethz.ch/Teaching/2017-dphpc/assignments/sequential_consistency_sol.pdf
[Similarity_TSO_IBM_370]:https://en.wikipedia.org/wiki/Processor_consistency#Similarity_to_SPARC_V8_TSO,_IBM-370,_and_x86-TSO_Memory_Models
[sc_tso_cis601]:https://www.cis.upenn.edu/~devietti/classes/cis601-spring2016/sc_tso.pdf
[PC_orig]:../references/other_resources/COD/references/memory_consistency/TR1006_PC_orig.pdf
[lec_17]:http://www.cs.cmu.edu/afs/cs/academic/class/15418-s11/public/lectures/lect17.pdf
[SC_orig]:https://www.microsoft.com/en-us/research/uploads/prod/2016/12/How-to-Make-a-Multiprocessor-Computer-That-Correctly-Executes-Multiprocess-Programs.pdf
<!-- [MEMORY_CONSISTENCY_DETAILED]:https://typeset.io/pdf/memory-consistency-models-for-shared-memory-multiprocessors-3fuice3vg8.pdf -->
[MEMORY_CONSISTENCY_DETAILED]:../references/other_resources/COD/references/memory-consistency-models-for-shared-memory-multiprocessors-3fuice3vg8.pdf
[sparcv9]:../references/other_resources/COD/references/sparcv9.pdf
[TSO_PC_PSO]:http://15418.courses.cs.cmu.edu/spring2013/article/41#:~:text=Partial%20Store%20Ordering%20(PSO)%20is,be%20in%20order%20at%20all.
[stanford_149_09_consistency]:https://gfxcourses.stanford.edu/cs149/winter19content/lectures/09_consistency/09_consistency_slides.pdf
[isca90_GLL_90]:../references/other_resources/COD/references/gharachorloo.isca90.pdf
[Scalable_Shared_Memory_Multiprocessors_libgen]:../references/other_resources/COD/references/Scalable_Shared_Memory_Multiprocessors_libgen.pdf

<!-- riscv book -->
[RISC_V_Custom_OCR]:../references/other_resources/COD/COD_RISCV_OCR.pdf
[RISC_V_Orig]:../references/other_resources/COD/Computer_Organization_RiscV_Edition.pdf
[RISC_V_Custom]:../references/other_resources/COD/COD_RISCV.pdf

[slow_mem]:../references/other_resources/COD/references/memory_consistency/slow-memory-weakening-consistency-to-enhance-concurrency-in-dist.pdf
[memory_models]:https://www.cs.utexas.edu/~bornholt/post/memory-models.html
[herlihy]:../references/other_resources/COD/references/memory_consistency/p463-herlihy.pdf
[CAAQA]:Computer_Architecture_Sixth_Edition_A_Qu.pdf
[Misra_1985]:../references/other_resources/COD/references/memory_consistency/Misra_1985.pdf
[Lamport_1985]:../references/other_resources/COD/references/memory_consistency/interprocess.pdf
[CSG280]:../references/other_resources/COD/references/memory_consistency/document_CSG280.pdf
[Weak_Memory_Consistency]:https://es.cs.rptu.de/publications/datarsg/Senf13.pdf
[Weak_Consistency]:Weak_Consistency.pdf
[Linearizability_atomic]:https://en.wikipedia.org/wiki/Linearizability
[riscv_spec]:../references/other_resources/RISC-V/riscv-spec-20191213.pdf
[riscv_privileged]:../references/other_resources/RISC-V/riscv-privileged-20211203.pdf
[chromit]:https://chromite.readthedocs.io/en/using-csrbox/mmu.html
[acq_rel_cpp]:https://en.cppreference.com/w/cpp/atomic/memory_order#Constants
[csapp_global]:../references/csapp/csapp_global.pdf
[csapp_global_cropped]:../references/csapp/csapp_global_cropped.pdf
[csapp_us_masteringengineering]:../references/csapp/csapp_zlib.pdf
[IEEE_754]:../references/IEEE/ieee-standard-for-floatingpoint-arithmetic.pdf

<!-- lwn -->
[CPU_cache]:https://lwn.net/Articles/252125/
[memory_Introduction]:https://lwn.net/Articles/250967/
[Virtual_Memory]:https://lwn.net/Articles/253361/
[NUMA]:https://lwn.net/Articles/254445/
[TLBs_and_costs]:https://lwn.net/Articles/379748/
[mem_perf_tools]:https://lwn.net/Articles/257209/
[mem_paper_1]:https://www.akkadia.org/drepper/cpumemory.pdf
[mem_appendix]:https://lwn.net/Articles/258188/

<!-- amd -->
[17h_Optimization]:../references/AMD/amd_17h/55723_SOG_3.01_PUB.pdf
[cpuid]:../references/AMD/cpuid.pdf
[rev_17h]:../references/AMD/rev_17h_guide.pdf
[uprof_doc]:../references/AMD/uprof-v4.0-gaGA-user-guide.pdf
<!-- amd_ppr -->
[19h_01h_vol_1]:../references/AMD/PPR/PPR_19h_01h/PPR_Family_19h_Model_01h_Rev_B1_Vol1.pdf
[17h_01h]:../references/AMD/PPR/PPR_17h_amd_01h/54945_3.03_ppr_ZP_B2_pub.pdf
[PPR_17h_60h]:../references/AMD/PPR/PPR_17h_60h_model_amd/55922-A1-PUB_3.06.pdf
<!-- from this https://www.amd.com/en/support/tech-docs/open-source-register-reference-for-amd-family-17h-processors, it applies to all 17h family -->
[OCRR_17h]:../references/AMD/OSRR/OSRR_17h.pdf
[SOG_17h]:../references/AMD/SwOpt/17h/55723_SOG_3.01_PUB.pdf

<!-- wikichip -->
[wikichip_cpuid]:https://en.wikichip.org/wiki/amd/cpuid
[shared_tag_patent]:../references/AMD/shared_tag.pdf
<!-- https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Memory_Hierarchy WO 2018/106736 A1. -->
[opcache_patent]:../
[zen_2]:https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Memory_Hierarchy

<!-- paper -->
[shadow_memory]:../references/papers/shadow-memory2007.pdf
[LSD_DSB_MITE]:../references/papers/opcache_LSD_DSB_MITE_etc_2105.12224.pdf

<!-- script -->
[miscs_py_script]:../debug/bfloat16_half.py
[perf_post_py_script]:../debug/perf_report_post.py

<!-- Q&A -->
[perf_cache_misses]:https://stackoverflow.com/q/76593928/21294350
[miss_event_blame]:https://stackoverflow.com/questions/65906312
[perf_delay]:https://stackoverflow.com/a/65907314/21294350

<!-- repo -->
[mat_mat_mul]:https://github.com/czg-sci-42ver/matrix-matrix-multiply