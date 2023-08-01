# what to learn
- See [this](https://www.eecs.mit.edu/academics/undergraduate-programs/curriculum/6-3-computer-science-and-engineering/) ([i.e.](http://catalog.mit.edu/degree-charts/computer-science-engineering-course-6-3/)) for what to learn.
  - If to learn [ML](https://www.xilinx.com/applications/ai-inference/difference-between-deep-learning-training-and-inference.html), then [learn](http://student.mit.edu/catalog/search.cgi?search=6.3800) 
# miscs
- hwo to [post](https://stackoverflow.com/help/minimal-reproducible-example) question
- stackoverflow image [size](https://meta.stackoverflow.com/a/253405/21294350) based on imgur (use "l" is enough:https://i.stack.imgur.com/Cneu8l.png).
- the following `''` is assumed as *quote* of link contents.
- vscode sign in with [kwallet](https://github.com/microsoft/vscode/issues/104319) fails
- vscode `awk IDE` can't format and keep bracket highlight with comment, 
  just use something like `gawk -f ~/dgemm_de_dis_before.awk -o${HOME}/dgemm_de_dis_p.awk;mv ${HOME}/dgemm_de_dis_p.awk ~/dgemm_de_dis.awk`.
- use "\[`(.[^(]*)`\]" -> "[$1]" in vscode to avoid something like `[``]()` (Here rendering fails, see original markdown doc).
- [bash pitfalls](https://mywiki.wooledge.org/BashPitfalls) from [this](https://stackoverflow.com/a/52901093/21294350)
- I used r7 4800h cpu which is 16 threads 8 cores. The following `perf` is based on that.
- "etc." used in the [middle](https://www.englishtipz.com/2020/09/etc-etc-or-etc-how-to-use-etc-in-middle.html) of a sentence. -> "etc.," (notice: need to [turn on case](https://github.com/microsoft/vscode/issues/66357#issuecomment-515265641) using regex in vscode `"(etc\.)([^\n) ^log$])" -> "$1,$2"`)
- not use `ps` although it has many [pros](https://www.adobe.com/creativecloud/file-types/image/vector/ps-file.html) [compared](https://stackoverflow.com/a/4619312/21294350) with `pdf`
  ```bash
      # conversion https://wiki.archlinux.org/title/PDF,_PS_and_DjVu#ps2pdf
  $ ps2pdf -sPAPERSIZE=a4 -dOptimize=true -dEmbedAllFonts=true ~/Downloads/via-analysis.ps
  ```
- Basic [Logic Gate symbols](https://learnabout-electronics.org/Digital/dig21.php#basicgates)
- reddit seems to unable to support the [whole math symbols](https://www.reddit.com/r/mathriddles/comments/34fxve/writing_math_on_reddit/)
  maybe [`[; ... ;]`](https://www.reddit.com/r/math/comments/12h42y/comment/c6v6lx2/?utm_source=share&utm_medium=web2x&context=3) only usable in r/math
  or use [this](https://editor.codecogs.com/)
- archived web see wayback machine or [this](https://archive.is/) from [this](https://stackoverflow.com/users/1593077/ein-supports-moderator-strike)
## bash
- use [`${!x}`](https://stackoverflow.com/a/3816570/21294350) to expand variable `x` before passing it to `$`.
## TODO
- why [glibc](https://stackoverflow.com/questions/57650895/why-does-glibcs-strlen-need-to-be-so-complicated-to-run-quickly) defined strlen somewhat complicated. 1. at least for alignment. In ['glibc-2.37'](https://github.com/bminor/glibc/blob/glibc-2.37/string/strlen.c), it is same as the Q&A shows. but later [changed](https://github.com/bminor/glibc/commit/350d8d13661a863e6b189f02d876fa265fe71302#diff-dcfbf226df3ebab574846a48fc7f2f69d6aa1bde910adcc24065d80597691e73)
  - better view sourceware [code repo](https://sourceware.org/git/?p=glibc.git;a=blob;f=string/strlen.c;hb=HEAD)
- what is the differences between fallacy and pitfalls in [COD_RISC_V_Orig].
- try [hyperdbg](https://hyperdbg.github.io/commands-map/) which not supports amd now and support [hypervisor](https://docs.hyperdbg.org/getting-started/faq).
## regex
- positive lookahead ["?="](https://stackoverflow.com/a/2973495/21294350)
  but `sed` [doesn't support](https://stackoverflow.com/a/12176094/21294350) it.
  Also [examples](https://regex101.com/r/fB7iO8/8) from [this](https://stackoverflow.com/a/25069602/21294350)
- Also see [perl doc](https://stackoverflow.com/questions/2086450/pcre-regex-to-sed-regex#comment2023327_2086504)
### sed
- use [loop](https://unix.stackexchange.com/a/26290/568529) with label like `:a`
- also with [*not* operator `!`](https://stackoverflow.com/a/57720342/21294350)  
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
- better use [U.S. version](https://www.quora.com/Why-arent-Pearson-International-Edition-books-allowed-to-be-bought-in-the-U-S-and-Canada)... (Also see [this ycombinator comment](https://news.ycombinator.com/item?id=22287045) and [learning cs by self][learn_self] highlighting two books 'focus on just two books' in the comment's [parent](https://news.ycombinator.com/item?id=22286340))
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
    7. `telnet` check tcp while [nc](https://serverfault.com/questions/395342/telnet-counterpart-for-udp) check udp  
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
  can use `x` two times to get `(rip=0x401046)+0x2fc2` store one ptr `[rip+0x2fc2]`, then jmp to `addr=[rip+0x2fc2]`.
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
  - in [pdf p3095][intel_64] 
  - [unable](https://stackoverflow.com/questions/28263624/can-i-print-the-gdtr-and-gdt-descriptor-under-gdb) to view (GDTR, LDTR, IDTR, and TR) reg, same with segment descriptor in GDT, also [CR](https://stackoverflow.com/questions/7415515/how-to-access-the-control-registers-cr0-cr2-cr3-from-a-program-getting-segmenta) reg like CR0 except in *ring 0* (kerenel code) 
    - [workaround](https://forum.osdev.org/viewtopic.php?f=1&t=25968) in emulator like qemu
  - but [this](https://wiki.osdev.org/Global_Descriptor_Table#Segment_Descriptor) says to ignore Segment Descriptor ‘In 64-bit mode’.
- `GOT` more [specific](http://www.infosecwriters.com/text_resources/pdf/GOT_Hijack.pdf) than '## 8' below.
- [DIY](https://www.righto.com/2016/06/y-combinators-xerox-alto-restoring.html) old computer
## [intel reference][intel_64]
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
- try [rr chaos](https://rr-project.org/)
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
## stackoverflow Q to ask
# resources
## categories
- [registers](https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture) [or](https://wiki.osdev.org/CPU_Registers_x86-64) 
- [online opcode](https://www.felixcloutier.com/x86/push.html) or [pdf p615][intel_64] or [this](http://ref.x86asm.net/coder64.html)
- how to [interpret](https://stackoverflow.com/questions/28664856/how-to-interpret-x86-opcode-map) opcode
- gdb [rc tutorial](https://sourceware.org/gdb/onlinedocs/gdb/Process-Record-and-Replay.html) or [target](https://sourceware.org/gdb/onlinedocs/gdb/Target-Commands.html#Target-Commands) in [this](https://sourceware.org/gdb/onlinedocs/gdb/index.html#SEC_Contents)
  - [this is out-dated](https://sourceware.org/gdb/wiki/ProcessRecord)
- [wiki](https://stackoverflow.com/tags/sse/info) in stackoverflow
## miscs
- `as` used by `gcc` assembly code comment [definition](https://sourceware.org/binutils/docs/as/index.html#SEC_Contents), also [see](https://stackoverflow.com/questions/24787769/what-are-lfb-lbb-lbe-lvl-loc-in-the-compiler-generated-assembly-code) [source](https://github.com/gcc-mirror/gcc/blob/releases/gcc-4.8.2/gcc/dwarf2out.c) code
  - [L..](https://slowstarter80.github.io/gcc/labels_in_assembly_code/) like [.LFB0](https://sourceware.org/binutils/docs/as/Symbol-Names.html)
- [.cfi_def_cfa_offset](https://sourceware.org/binutils/docs/as/CFI-directives.html#g_t_002ecfi_005fdef_005fcfa_005foffset-offset)
- [pushq](https://stackoverflow.com/questions/48251829/whats-the-difference-between-push-and-pushq-in-att-assembly)
  - [opcode p96 & 327](../references/amd64.pdf)
- [r/m](https://cs.fit.edu/~mmahoney/cse3101/nasmdocb.html) from [this](https://stackoverflow.com/questions/22445347/how-do-i-interpret-this-instruction)
- [CS.D](https://stackoverflow.com/questions/11970750/rex-prefix-decoding-for-intel-x64-arch)
- callee and caller saved [regs](https://stackoverflow.com/questions/9268586/what-are-callee-and-caller-saved-registers)
- [N.E.](https://stackoverflow.com/questions/71753270/intel-reference-specification-questions#comment126817567_71753270) in [pdf p605][intel_64] means x86 instruction **not encodable** in 64-bit OS.(po)
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
  - more detailed [pdf p78][intel_64] and register [definition](https://wiki.osdev.org/Segmentation)
    - module [pdf p162][intel_64] [also](https://github.com/LordNoteworthy/cpu-internals/blob/master/README.md)
    - so code segment [not default](https://stackoverflow.com/questions/49994919/assembly-instruction-and-an-extra-2e-prefix-before-its-opcode/49995022#comment87006918_49995022) Intuitively
      - above `CS segment override` may be not needed because call [default 'code segment'](https://www.felixcloutier.com/x86/jmp) use CS
      - also [see 'always modify all segment registers except CS (the code segment selector).'](https://en.wikipedia.org/wiki/X86_memory_segmentation#Practices)
        - here also says about `ES` segment register usage 'extra segment specified by the segment selector held in the ES register.'
- compare [binary](https://superuser.com/questions/125376/how-do-i-compare-binary-files-in-linux)
### cpu specific
- my cpu 4800h doesn‘t [support](https://gist.github.com/kohnakagawa/fb77904fcc44fc5652ef6d338c35a718) 'CET'， so `ENDBR64` does [nothing](https://vstinner.readthedocs.io/assembly_x86.html), see [pdf p413 INDIRECT BRANCH TRACKING][intel_64]
  - from [this](https://stackoverflow.com/questions/56905811/what-does-the-endbr64-instruction-actually-do), some keywords are ‘control flow violations’， ‘WAIT_FOR_ENDBRANCH’， ‘state machine’
  > from [this](https://en.wikipedia.org/wiki/Return-oriented_programming) , [above](#rop) maybe related with return address overwriting, so related with instructions like `jmp` -> related with `ENDBR64`.
  > "manipulates the call stack" -> stack smashing
  > "overwrite the return address"
  - TODO see kernel code related with above gist.
- [cache,memory,register](https://www.geeksforgeeks.org/difference-between-cache-memory-and-register/)
  - why no [two](https://www.quora.com/Why-can%E2%80%99t-two-operands-both-be-memory-operands-in-assembly-language) memory operand (related with cache) [also](https://stackoverflow.com/questions/14510280/why-cant-mov-have-both-operands-as-memory-locations)
## registers
- r9 save parameter and [rax](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture) save return [pdf p7](../references/x64_cheatsheet.pdf) [save order](http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html)
- whether [callee pdf p26](../references/abi.pdf)
### [r9,etc.,Caller-saved registers](https://stackoverflow.com/questions/9268586/what-are-callee-and-caller-saved-registers)
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
- [SMP](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) and [AMP](https://en.wikipedia.org/wiki/Asymmetric_multiprocessing), also [see](https://github.com/rr-debugger/rr/issues/3531) <a id="SMP"></a>
## memory
- currently although using paged memory, but has been [abstracted](https://superuser.com/questions/318804/understanding-flat-memory-model-and-segmented-memory-model) to be flat, so just using [near](https://stackoverflow.com/questions/46187337/how-can-the-processor-discern-a-far-return-from-a-near-return) return `C3` where "segmented memory model" is mostly used by old cpus.
  Notice: In [COD_RISC_V_Orig] p469, the total size of "16 bits of segment to the existing 16-bit" is same as "unsegmented 32-bit address space", but their physical implementation is different, at least the former memory only needs to search 16-bit range while the latter needs to 32-bit. See [this](https://en.wikipedia.org/wiki/Flat_memory_model#x86_segmented_memory_model) and Segmentation with *paging* just means using [page table](https://en.wikipedia.org/wiki/Memory_segmentation#Segmentation_with_paging) <a id="Segmentation"></a>
  - Internal Fragmentation is caused by being used by process. [whereas](https://www.tutorialspoint.com/difference-between-internal-fragmentation-and-external-fragmentation#:~:text=Internal%20Fragmentation%20occurs%20when%20a,removed%20from%20the%20main%20memory.&text=Best%20Fit%20Block%20Search%20is,the%20solution%20for%20external%20fragmentation.) External Fragmentation is cauesd by small unused spaces between used spaces.
  - [secondary](https://en.wikipedia.org/wiki/Computer_data_storage) memory
  - paging [diffs with](https://www.tutorialspoint.com/difference-between-paging-and-segmentation) segmentation 
  - [pdf p72][intel_64] Real-Address Mode Model -> 'Real mode' in x86
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
- [push](https://www.felixcloutier.com/x86/push.html) `r64` -> [`rd` p598; note here `REX.W` indicates REX prefix instead of one bit][intel_64]
### 1.1
- `mov r/m64 r64` [with](https://stackoverflow.com/questions/67368069/how-to-resolve-ambivalence-in-x64-assembly) `mov r64 r/m64`
```bash
0:  48 89 d3                mov    %rdx,%rbx
3:  48 8b da                mov    %rdx,%rbx
```
  > notice: `+` may mean different in opcode, detailed in [p598][intel_64]
  > [this](https://stackoverflow.com/questions/71774299/how-do-you-understand-rex-w-b8-rd-io-form-for-x86-64-assembly) indicates [MOV r64, imm64](https://www.felixcloutier.com/x86/mov) `REX.W` not added to opcode, but prefix.
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
  - so maybe above code `BYTE PTR` can make `r/m 64` -> `r/m 8`, and therefore in 64 bit OS -> [00 /r](https://www.felixcloutier.com/x86/add) and [pdf p530][intel_64]
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
  `e2` [pdf p529][intel_64] -> `edx`(`rdx` when `REX.W` set ,p533), 
  `20`->`id`

## 6
```asm
0x00007ffff7fe5b61:  80 25 7e 82 01 00 df    and    BYTE PTR [rip+0x1827e],0xdf        # 0x7ffff7ffdde6 <_rtld_global+3558>
```
- `80` -> `AND r/m8, imm8	` [here](https://www.felixcloutier.com/x86/and)
  `25` -> `disp32` in column 4 [pdf p530][intel_64]
  `7e 82 01 00` -> 4 byte(specified in [pdf p525][intel_64]) little endian of `0x1827e` <a id="little_endian"></a>
  `df` -> `id`
## 7 AVX
- see [VEX field bit intel doc p539 (say `C5H form` meaing) ](https://stackoverflow.com/questions/51773399/vex-prefixes-encoding-and-sse-avx-movupd-s-instructions) (where also say `WIG` meaning)
```asm
0x00007ffff7ecd9a4:  c5 f9 6e c6             vmovd  xmm0,esi
```
- `vmovd  xmm0,esi` -> `VMOVD xmm1, r32/m32` -> `VEX.128.66.0F.W0 6E /`(here `/` may be mistaken, should be `/r`)
  - here `xmm1` in [pdf p603][intel_64] -> `indicates the first source operand using an XMM register`
  - [4800h](https://www.techpowerup.com/cpu-specs/ryzen-7-4800h.c2280) not contain avx-512, so not use EVEX [pdf p561][intel_64]
    - also check `grep avx /proc/cpuinfo --color=always | uniq` only has `avx` and `avx2`
- `c5` -> [pdf p539][intel_64] -> `11000101`
  so use 2-byte VEX prefix
- `f9` -> `11111001` -> `1 1111 0 01` based on [this form '|~R |     ~vvvv     | L |   pp  |' ](https://wiki.osdev.org/X86-64_Instruction_Encoding#VEX.2FXOP_opcodes)
  - from binary to asm(recommended)
    - `R` = 1 -> 32bit [pdf p539][intel_64]
    - `vvvv` should read `Instruction Operand Encoding` table [pdf p601,1997][intel_64],here is encoded by `ModRM` -> `1111`
    - `L` & `pp` see below
  - from asm to binary(not recommended because the asm is generated by disassembly)
    - `128` -> `L` = 0 [pdf p599][intel_64]
    - `66` -> [SIMD(single instruction, multiple data) prefix](https://codeforces.com/blog/entry/98594#:~:text=SIMD%20stands%20for%20single%20instruction,the%20code%20to%20run%20faster.)
- `6e` -> opcode
- `c6` in `R=1` 32bit mode [pdf p530][intel_64] based on this 'Instruction Operand Encoding' [table](https://www.felixcloutier.com/x86/movd:movq) -> 
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
### `rip` register save the next instruction location [pdf p536][intel_64] ~~updates before `jmp`~~
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
#### how memory save data [pdf p90][intel_64]
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
### fs/gs register (other segment register no use in 64-bit mode [pdf p73,74 Canonical Addressing,79][intel_64] [1 TODO:'CS/DS/ES/SS are only useful for padding to make instructions longer?'](https://stackoverflow.com/questions/50400274/why-is-the-use-of-the-ds-segment-override-illegal-in-64-bit-mode)) mainly based on [this](https://reverseengineering.stackexchange.com/questions/19979/what-does-fs-and-gs-registers-provide-in-linux)
[pdf p75][intel_64] register size
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
  - `64` in [pdf p532][intel_64] -> [legacy](https://wiki.osdev.org/X86-64_Instruction_Encoding#Legacy_Prefixes) prefix, just to [overload ‘They are still registers, so they can of course be used for various other assembly operations.’ ](https://reverseengineering.stackexchange.com/questions/2006/how-are-the-segment-registers-fs-gs-cs-ss-ds-es-used-in-linux) default segmentation usage
  - `48` see above `REX.W`
  - rest are MODR/M, same with above
#### shown in [this](https://www.felixcloutier.com/x86/push.html)
- instruction prefix [this](http://www.c-jump.com/CIS77/CPU/x86/X77_0240_prefix.htm) <a id="prefix"></a>
  - [pdf p532][intel_64] said `66h` prefix usage in SSE (related with AVX [pdf p537][intel_64])
    - 66h [usage](https://stackoverflow.com/questions/30090566/x64-maskmovdqu-store-selected-bytes-of-double-quadword-and-vex-segment-overrid#comment48338171_30099598) or [table](https://wiki.osdev.org/X86-64_Instruction_Encoding#Operand-size_and_address-size_override_prefix)
  - [multiple](https://stackoverflow.com/questions/2404364/combining-prefixes-in-sse) 66H prefix
### [.rela.plt](https://reverseengineering.stackexchange.com/questions/21521/pyelftools-relocation-section-symbols) <a id="rela"></a>
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
## 10 TODO how `leave` implemented in cpu [pdf p178][intel_64], [related](https://stackoverflow.com/questions/67449884/mov-rbp-rsp-in-function-prologue) with `push rbp` above
- ~~TODO~~ why gcc [not](https://stackoverflow.com/questions/29790175/assembly-x86-leave-instruction) use enter
  - [this](https://www.agner.org/optimize/instruction_tables.pdf) p151 (~~TODO execution pipe~~?)
    - po Latency based on multiple instructions runned (dependency chain) and Reciprocal throughput is mostly based on itself (detailed see p2)
    - p3,36(execution pipe)
      - Execution pipe is [pipelined](https://en.wikipedia.org/wiki/Execution_unit) Execution units
    - here `MOV r64,r64 1 0 0.25 renaming` -> `0 0.25` and `ENTER a,b 11+3b N/A ~20+b` (multiple nested condition) with `LEAVE N/A 2 N/A 3` (renaming means "register renaming" p170)
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
### `r8-r15` [this](https://stackoverflow.com/questions/59660118/assembly-using-rn-registers-r8-r9-have-more-code-size-than-other-registers) [rax,etc.,relation with r8-15 see pdf p2846][intel_64]
- above  `0x4a` -> `0b01001010` -> Figure 2-4 [pdf p533][intel_64]
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
- [xmm/ymm](https://wiki.osdev.org/AVX2)/[zmm](https://wiki.osdev.org/CPU_Registers_x86) , ymm [pdf p538][intel_64] zmm [pdf p603][intel_64], see 
## fs/gs and SS segment(rsp/rbp)
[pdf p86][intel_64], see [this (fs != fs_base)](https://stackoverflow.com/questions/59797987/how-is-effective-address-calculated-with-fs-and-gs-registers)
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
## how xmm save [pdf p52][intel_64]
[pdf p67][intel_64] -> 8 regs when non-64 mode
16 regs [pdf p70][intel_64]
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
[pdf p249][intel_64] -> `67h` -> addr32 prefix here `e8` -> rel , no mem op(erand)
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
- fpu [pdf p206 Figure 8-2.][intel_64]
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
    - [2e](https://stackoverflow.com/questions/49994919/assembly-instruction-and-an-extra-2e-prefix-before-its-opcode) 'addressing mode'
  - [data16](https://stackoverflow.com/questions/36706280/what-does-data16-mean-in-objdump-output) 'the sixth is the w in the nopw' (i.e. above `nop WORD PTR`), also see [pdf p1385][intel_64]
    - here `WORD` or [DWORD](https://stackoverflow.com/questions/43991155/what-does-nop-dword-ptr-raxrax-x64-assembly-instruction-do?rq=3) ~~is based on `mode` and how assembler reads instruction bytes~~ see [prefix](#prefix) ‘table’ -> '1	N/A	Yes	16-bit'
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
    - [SW](https://en.wikipedia.org/wiki/Software_pipelining#Example) pipelining where uses the independence like `A(i)` and `A(i+1)` to OoO by software.  <a id="Software_pipelining"></a>
    - Loop inversion can at least remove the misprediction penalty mostly of the last execution before exiting because just [dropping out](https://en.wikipedia.org/wiki/Loop_inversion#Example_in_three-address_code) (no 'goto L2' in the latter code) the loop whether take jmp or not.
      - 'inversion' may refer to ' could change for(i) for(j) a[j][i]++;' from original contents
    - TODO: 1. 'hiding loop-carried FP latency in a reduction loop' 2. more detailed info to read after 'Benefits with very low iteration count:' 3. 'SPECint2006' meaning 4. different execution ports 5. try [`fprofile`](https://stackoverflow.com/questions/4365980/how-to-use-profile-guided-optimizations-in-g) 6. better reread after more knowledge. 7. instruction 'free' and ‘front-end’ meaning
# gdb usage
- use `x/g` to avoid accidental truncate of variable in stack (can tested with `voltron`)  
## voltron
- [add byte [eax], al](https://reverseengineering.stackexchange.com/questions/17555/radare-produces-a-bunch-of-add-byte-rax-al-but-why) all zeroes.
## pwndbg ([pwnlib/pwntools](https://docs.pwntools.com/en/stable/about.html))
- setting with [EFLAGS][EFLAGS] [pdf p80][intel_64] in [gdb `p $eflags`](https://gist.github.com/mepcotterell/199b86a558b3f944589674f53ff681b0)
  More [detailed](https://en.wikipedia.org/wiki/FLAGS_register)
  TODO how "Virtual 8086 Mode flag" is implemented.
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
- [%](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)
  - more [general](https://www.gnu.org/software/make/manual/make.html#Text-Functions) with `subst`
# csapp -> intel manual
- zero extended [pdf p77][intel_64]
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
      - [1](http://c-jump.com/CIS77/CPU/Overflow/lecture.html#O01_0080_overfow_output): 0100b+1100b has carry in `1` (because 100+100=1000, carry out from third column to fourth [carry in to fourth]) and result is 10000b -> carry out `1` to fifth column <a id="check_overflow"></a>
        More [specific table](http://c-jump.com/CIS77/CPU/Overflow/lecture.html#O01_0120_signed_overflow_cont)
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
- oct word -> ['double quadword operand' pdf p602][intel_64]
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
- why can use `(struct sockaddr_in *)` cast: see [gni_host_inet_numeric](https://codebrowser.dev/glibc/glibc/inet/getnameinfo.c.html#gni_host_inet_numeric) called by callee ... of [gni_host](https://codebrowser.dev/glibc/glibc/inet/getnameinfo.c.html)
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
  - TODO complex [read](https://codebrowser.dev/glibc/glibc/sysdeps/unix/sysv/linux/read.c.html) may not append EOF if reading something (also implied by `man 2 read`: 'the  number of bytes read is returned (zero indicates end of file)' and 'because fewer bytes are actually available right now (maybe because we were close to end-of-file, or because we are reading from a pipe, or from a terminal' -> so splitted to two return.)
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
`tiny_wrong.c` ->(use mutex by `thread_with_mutex`) `tiny_log.c` -> (comment `printf` syscall,etc.) `tiny.c` -> (check buf in `check_thread`, notice here better to read `sbuf.rear` with mutex to ensure consistency ) `tiny_check_in_thread.c` -> (use `sbuf_full` which is unnecessary although more readable) `tiny_cit_sbuf_full.c` -> (forget what scope means, maybe change `thread_with_mutex *tid_set` to global) `tiny_citsf_scope.c`
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
#### use `write` instead of `printf` to better flush or use [fsync](https://stackoverflow.com/questions/259355/how-can-you-flush-a-write-using-a-file-descriptor) to flush.
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
- qnan/snan [pdf p94][intel_64]
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
  - [SDRAM](https://en.wikipedia.org/wiki/Synchronous_dynamic_random-access_memory#Commands) use one better (how Better ? TODO )encoding method
    
    [not SRAM](https://www.elinfor.com/knowledge/differences-among-dram-sdram-and-sram-p-10976#:~:text=SRAM%20is%20short%20for%20Static%20RAM%2C%20mainly%20used%20to,memory%20configuration%20of%20the%20PC.)
    This also explains the differences between SRAM and DRAM "resulting in *capacitance destruction* leakage and slow *discharge*"
  - [DDR SDRAM](https://en.wikipedia.org/wiki/Synchronous_dynamic_random-access_memory#DDR_SDRAM_prefetch_architecture) use a new cache enhancement method.
    "on consecutive *rising and falling* edges of the clock cycle" <a id="DDR"></a>
  - flash [diff](https://www.tutorialspoint.com/difference-between-eeprom-and-flash#:~:text=EEPROM%20is%20a%20type%20of,to%20and%20erased%20in%20blocks.) with EEPROMs which is said in this [Q&A](https://electronics.stackexchange.com/questions/675566/does-field-electron-emission-used-in-eeprom-work-better-than-hot-carrier-inje) <a id="EEPROM"></a>
    Better see [1][electronic_stackexchange_EPROM_EEPROM] and [2](https://electronics.stackexchange.com/a/65507/341985)

    here 2 "FLASH is *block*-based for erase/write operations." is same as what [naver blog][naver_EPROM] which is referenced in 1 says "it is not bit erasable. When you erase you have to do a *global* erase because of this problem.If you *do not have the select* transistor you cannot do a bit erase, you have to do a global erase.".
    Also see [wikipedia "however, *generally* can be performed *one byte or word at a time*."](https://en.wikipedia.org/wiki/Flash_memory#Erasing)
    The more detailed [mos view](https://www.jameco.com/Jameco/workshop/Howitworks/eeproms-an-upgrade-from-eproms.html) of EEPROM logic circuit in the [naver_EPROM] 

      - [this "*Some* are cleared using ultra violet radiation"](https://electronics.stackexchange.com/a/237404/341985) may answer above 1 
      - See [this](https://www.electroniclinic.com/programmable-read-only-memory-or-prom-in-digital-electronics/) where PROM can be just PLA which is totally different from EPROM which answers the [old 1st question in this Q&A](https://electronics.stackexchange.com/posts/675556/timeline#history_872bce9c-b1dc-40b4-8424-fc8aede2ba4f) although "mainstream product adopts a *double-layer gate* ...".
      Notice it is also similar to [interconnects in the FPGA architecture](https://dennishnf.com/posts/projects/2013-11_cmos-design-of-fpgas-programmable-interconnect-points/page.html)

      Better see [COD_RISCV_2nd_A_appendix] A-77 "by configuring the *connections*, a user *determines what  logic functions* are implemented"
      - Notice above 1st link use fuse which is opposite of the book ["antifuse"](https://en.wikipedia.org/wiki/Antifuse) (just literal meaning).
        TODO detailed chemistry and physics explanation: antifuse is also realized by MOS but it use ["Amorphous silicon"](https://en.wikipedia.org/wiki/Antifuse#Amorphous_silicon_antifuses) instead of ["the controlled oxidation of silicon"](https://en.wikipedia.org/wiki/MOSFET#Circuit_symbols) which then "*melts* a thin insulating layer ... *permanent* resistive silicon link." (also [see](https://www.pcmag.com/encyclopedia/term/antifuse#:~:text=A%20programmable%20chip%20technology%20that,%22growing%22%20a%20conductive%20via.))
        Also see other types of antifuses with figures [p3,4](http://www.engr.siu.edu/haibo/ece428/notes/ece428_program.pdf)

        "active transistors for switches" means they are [on "Transistors that are fully “ON” are said to be in their *Saturation* region."](https://www.electronics-tutorials.ws/transistor/tran_4.html#:~:text=Transistor%20as%20a%20Switch%20Summary&text=Transistors%20that%20are%20fully%20%E2%80%9CON,much%20larger%20Collector%20load%20current.)
    - [NOR flash](https://en.wikipedia.org/wiki/Flash_memory#NOR_flash) just means *either* word line (implies `OR`) will "pull the output bit line low" (implies `N(OT)`) because of the current conduction.
      - NAND is similar to the above except that "first the *desired group* is selected (in the same way that a single transistor is selected from a NOR array). Next, *most* of the word lines are pulled up above $V_{T2}$, 
      while *one* of them is pulled up to $V_I$"
    - Here reading MOSFET is by ["Electric-field screening" -> "*damping* of electric fields caused by the presence of *mobile charge carriers*"](https://www.chemeurope.com/en/encyclopedia/Electric_field_screening.html#:~:text=Screening%20is%20the%20damping%20of,and%20conduction%20electrons%20in%20metals.) (here the $FG=V_{T2}$ will damp the electric field 
    so that "the channel *does not conduct* at the $V_{I}$")
    - ~~TODO~~ [hardware](https://en.wikipedia.org/wiki/Flash_memory) diff DRAM 
      Just see the above, but notice Flash is just one special EEPROM and it only has structural similarity with DRAM because of `WL` and `BL` but how they store bit is totally different where the latter uses capacitor and the former uses "*Floating-gate* MOSFET".

      Notice: floating gate "solving the traditional *endurance* roblem" because of "utilizing an *oxide* less than 2001 thick *between* a floating poly gate and an $N^+$ region" (more detailedly, it is *surrounded* by oxide) (This is also said somewhere in wikipedia which is temporarily forgotten the location)

      [open](https://en.wikipedia.org/wiki/Open_collector) in MOSFET just means high-Z (po this is used more often) or GND.
    - how EPROM works
      See [utmel_EPROM] "After the EPROM chip writes the data, the *window must be sealed* with an opaque sticker or tape to prevent the data from being damaged by the surrounding *ultraviolet rays*" (i.e. ["although in practice many EPROMs are *encapsulated in plastic that is opaque* to UV light"](https://en.wikipedia.org/wiki/EEPROM#Comparison_with_EPROM_and_EEPROM/flash))
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
  - [fflush(stdin)](https://www.geeksforgeeks.org/use-fflushstdin-c/#)
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
  - or [man inode](https://stackoverflow.com/questions/40163270/what-is-s-isreg-and-what-does-it-do)
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
- [stty -icanon](https://man7.org/linux/man-pages/man3/termios.3.html) which disable 'Input is made available line by line' by searching 'stty "canon" line buffering' from [this comment](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.32/#comment-6161315337), ~~and can be seen clearly in `vim` with '/<backspace>' where will show '/^?' defaultly.~~ ~~TODO what does `stty -icanon` do?~~
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
- [Connection reset by peer](https://stackoverflow.com/a/1434592/21294350) [see problem 12.23](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.23/)
### threads
- [asynchronous](https://unix.stackexchange.com/questions/386814/what-do-asynchronous-and-synchronous-mean-in-notifying-processes-of-system-event) event
- CPU Context Switching [save](https://www.scaler.com/topics/operating-system/context-switching-in-os/) CPU state in cooperation with separate virtual memory.
- p1010 -> `man 7 signal` :'The signal being delivered  is also added to the signal mask...These signals are thus blocked while the handler executes'
- [clean](https://www.pluralsight.com/blog/software-development/10-steps-to-clean-code) code
- [shared](https://www.softprayog.in/programming/interprocess-communication-using-posix-shared-memory-in-linux#:~:text=Shared%20memory%20is%20an%20inter,segment%20to%20its%20address%20space.) memory
- [cancellation point](https://stackoverflow.com/questions/27374707/what-exactly-is-a-cancellation-point) may be simply some point where OS can cancel the thread ('The write function is a cancellation').
- [closed-form solution](https://stats.stackexchange.com/questions/70848/what-does-a-closed-form-solution-mean)
- although `pthread_join()` blocks, but it doesn't influence peer thread running and only blocks main thread.
- [time](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1) usage (here user bigger than real because of [threads](https://stackoverflow.com/questions/15928334/user-time-larger-than-real-time))
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
- Exception number [pdf p167][intel_64]
## TODO
- redo 3.68 homework after understanding stack better.
- 3.73 use asm not __asm__ direct.
- relearn digital circuits and relearn chapter 4 and try designing circuits.
- [prime](https://stackoverflow.com/questions/67623801/is-it-always-necessary-to-make-hash-table-number-of-buckets-a-prime-number-for-p) hash bucket number
- [AMDuProf](https://community.amd.com/t5/server-gurus-discussions/intel-vtune-on-amd-processors/m-p/529122/highlight/true) & [callgrind](https://stackoverflow.com/questions/6663614/use-valgrind-to-know-timein-seconds-spent-in-each-function)
- SRAM DRAM [design](https://www.egr.msu.edu/classes/ece410/mason/files/Ch13.pdf), more [concise][SRAM_DRAM]
  - TODO 
    ~~- how DRAM [implemented](http://blackandwhitecomputer.blogspot.com/2012/03/reading-writing-operation-of-dram.html)~~
  - [precharge](https://electronics.stackexchange.com/questions/246835/what-is-the-need-for-precharging-in-sram-dram-memory-cell/246846#246846) See my [ans](https://electronics.stackexchange.com/a/675299/341985)
  - [NMOS](https://www.oreilly.com/library/view/introduction-to-digital/9780470900550/chap5-sec004.html) and PMOS
    so NMOS with `1` input it will be "turned on" as one switch (Also see ["Construction and Physical Operation"](https://anysilicon.com/introduction-to-nmos-and-pmos-transistors/)).

    Notice N -> [negative](https://en.wikipedia.org/wiki/Extrinsic_semiconductor#N-type_semiconductors)
    - Better review **high school physics**.  
      here ["valence band"](https://energyeducation.ca/encyclopedia/Valence_band) is "the band of *electron* orbitals that electrons can *jump out of* ... " and See ["What Is the Conduction Band?"](https://byjus.com/jee/conduction-band/) -> "can *bounce up* into from the valence band when energised"
      So in [this](https://energyeducation.ca/encyclopedia/Electron_hole#:~:text=Both%20electrons%20and%20holes%20are,a%20forward%20or%20reverse%20bias.)
      - "Holes are formed when electrons in *atoms* move out of the valence band"
      - "An electron hole is one of the two types of charge carriers that are responsible for *creating electric current*" -> [wikipedia "flow electrons from the valence to the conduction band."](https://en.wikipedia.org/wiki/Valence_and_conduction_bands#Electrical_conductivity)
      - Also see influence with "thermal or other excitations" in ["Silicon Energy Bands"](http://hyperphysics.phy-astr.gsu.edu/hbase/Solids/band.html)
    - TODO 
      - see [layout and process of fabrication](https://en.wikipedia.org/wiki/CMOS#Example:_NAND_gate_in_physical_layout)
    - ["body bias"](https://semiengineering.com/body-bias-what-it-is-and-why-you-should-care/)
      just to make body and source hardwired then *no voltage between* them will influence "the *threshold* voltage". Also because use [$V_{GS}$](https://en.wikipedia.org/wiki/MOSFET#Cutoff,_subthreshold,_and_weak-inversion_mode) to show whether circuit turned on.
    - $N+,N-$ [meaning](https://qr.ae/pye575)
    - hole conduct the *electricity* the [opposite](https://www.allaboutcircuits.com/textbook/semiconductors/chpt-2/electrons-and-holes/#:~:text=The%20free%20electron%20and%20hole,will%20conduct%20in%20opposite%20directions.) direction with electron
    - NMOS PMOS [comparison where "n+" in NMOS cause it called NMOS](https://en.wikipedia.org/wiki/MOSFET#cite_ref-memory_7-0)
    - [symbol explanation](https://en.wikipedia.org/wiki/MOSFET#Circuit_symbols)
      - TODO [JFET](https://www.power-and-beyond.com/jfet-meaning-types-and-working-principles-explained-a-bd1d589211e6ebaab70e53e5b22507b9/#:~:text=JFET%20is%20a%20field%20effect,operations%2C%20advantages%2C%20and%20applications.) ["pinched-off"](https://www.electronics-tutorials.ws/transistor/tran_5.html)
        Also see this for ["pinch-off"](https://en.wikipedia.org/wiki/MOSFET#Modes_of_operation)
      - "Arrows always point from P to N" (current direction)
        whether "If the bulk is connected to the source" (see above "body bias") or "they are generally common bulk" 

        Notice: in NMOS, when "no bulk" and "alternatively an arrow ...", P bulk is implied in `G`, just like [BJT](https://en.wikipedia.org/wiki/Bipolar_junction_transistor) 
        So the direction is opposite of ones with bulk.
      - "Depletion MOSFET" just has inversion channel [beforehand](https://www.electrical4u.com/mosfet-working-principle-of-p-channel-n-channel-mosfet/#N-%E2%80%93-Channel-Depletion-MOSFET) from this [video](https://www.youtube.com/watch?v=AoXhq5nAGVs) -> "a solid line for depletion mode" to represent one channel (Also [see](https://eepower.com/technical-articles/what-are-depletion-mode-mosfets/#))
    - "threshold voltage" -> "the gate voltage at which the volume density of *electrons* in the inversion layer is the same as the volume density of *holes* in the body is called the threshold voltage" (i.e. achieve one balance)
      "above the depletion region" where depletion region has less electrons than the inversion layer.
  - how SRAM [work](https://en.wikipedia.org/wiki/Static_random-access_memory#SRAM_operation) <a id="SRAM"></a>
    "Standby" is obvious because $M_5,M_6$ are closed
    $\overline{BL}$
    
    ~~TODO why is inverter discharge ~~ 
    "Reading" -> "causes one bit line BL voltage to slightly drop" because ["inverter holding 0 partly *discharges* its bit line" p9][SRAM_DRAM] -> "*sense amplifier* will sense ... "
    Here think of one condition($\overline{BL}=\overline{Q}=1,Q=0,BL=1$): because $\overline{Q}=1$ will turn $M_3$ on and set $Q=0$ internally, (also implies "cross-coupled inverters *magnify* the writing process.")
    So both 
    $\overline{BL},\overline{Q}$ will probably race over $BL$ -> "inverter ... discharges"
    - reading based on the Sense Amplifier [See p12,33](https://inst.eecs.berkeley.edu/~eecs151/sp19/files/lec16-ram.pdf)
      one simple implementation just [use MOS as switch](https://en.wikipedia.org/wiki/Differential_amplifier#Differential_output) to hardware to different voltages.
      TODO DRAM p5 symbol meaning.
    - Writing based on [weak transistor](https://electronics.stackexchange.com/a/240504/341985) -> relative low current by lower [Transconductance](https://en.wikipedia.org/wiki/Transconductance#:~:text=Transconductance%20(for%20transfer%20conductance)%2C,is%20the%20reciprocal%20of%20resistance.)
      it can be replaced by "resistors".
      TODO "a threshold implant"

      So it can be overrided.

      TODO "PMOS transistors are much weaker than NMOS" [1](https://www.quora.com/Why-is-PMOS-good-to-pass-logic-1-and-NMOS-is-good-to-pass-logic-0) [2](http://ece-research.unm.edu/jimp/vlsiII/slides/cmos_inverter1.pdf) ; "This means that the M1 and M2 transistors can be easier overridden, and so on"
    - "Writing" is similar to reading but it doesn't has race of both $\overline{BL},BL$ are `1`. It just has complement inputs. 
    - "page mode" just skips refreshing inputs by "sequentially read by *stepping* through".
  - how DRAM works <a id="DRAM"></a>
    - [read](https://en.wikipedia.org/wiki/Dynamic_random-access_memory#Operations_to_read_a_data_bit_from_a_DRAM_storage_cell)
      - TODO
        - "Since the capacitance of the bit-line is *typically much higher* than the capacitance of the storage cell" (this implies "voltage on the bit-line increases very *slightly*")
      - here ["dynamic logic"](https://en.wikipedia.org/wiki/Dynamic_logic_(digital_electronics)) because [stray capacitance](https://en.wikipedia.org/wiki/Capacitance#Stray_capacitance) (formula [see](https://www.ourpcb.com/stray-capacitance.html) -> so long line cause `C` bigger -> the capacitance between two *adjacent lines* is bigger)
      - ["cross-connected inverters"](https://qr.ae/pyekl3) just similar to SR latch
        TODO how this related with the wikipedia [image "sense amplifier"](https://en.wikipedia.org/wiki/File:DRAM_cell_field_(details).png)
      - "*All* storage cells in the open row are sensed simultaneously" may be a little redundant (i.e. all "sense amplifier outputs latched").
        But it increases the *refresh frequency* which is better.
      - "Reads of different columns in the same row" from the figure, it only accounts for half a whole row.
      - "While reading of columns in an open row is occurring, current is *flowing back up* the bit-lines from the output of the sense amplifiers and *recharging* the storage cells"
        Notice: "long propagation delay ... thus *overlaps* with one or more column reads"
      - "the row is "open"" should be start at 4. "The desired row's word-line is then driven high" instead of 5.
      - TODO "the bit-lines are precharged again"
      - Also see [SRAM_DRAM] p13 where 
        1. drop 1 in the above wikipedia.
        2. doesn't refer to 3. about capacitance between "bit-lines"
        3. 3,4 -> wikipedia 4
        4. 5~7 -> wikipedia 5~7
        5. drop wikipedia 8 which is cleanup.
      - notice: "*Positive feedback* then occurs from the cross-connected inverters" this is the main method to refresh data then keep read *not to destroy the data* when reading.

    - write
      - "Due to the sense amplifier's *positive feedback* configuration"
      - "so although *only a single* column's storage-cell capacitor charge is changed, the entire row is *refreshed*" -> why it called *dynamic* ram. and the [COD_RISCV_2nd_A_appendix] "somewhat simpler" in A-57.
        po here the former current should be upward from "data in latch" while the others is downward from mem cell (just see the `x` symbol in one `0` channel of `MUX4P2T` in the [figure](https://en.wikipedia.org/wiki/File:Square_array_of_mosfet_cells_write.png)).
      - Or see [SRAM_DRAM] p12 where *doesn't refer to refresh* in the write.
    - refresh
      - TODO "Refreshing the data consumes power and a variety of techniques are used to *manage the overall power* consumption."
      - [rate](https://en.wikipedia.org/wiki/Dynamic_random-access_memory#Refresh_rate)
        1. "each row must be refreshed every 64 ms"
        2. "involving all rows every 64 ms." or "*staggered* throughout the 64 ms interval"
        3. "determined by an *external timer* function"
        4. "the row that will be refreshed next is maintained by external logic or a *counter within the DRAM*"
          "*relinquishes control over which row* is refreshed and only provides the refresh command." -> DRAM priority is higher.
        5. TODO "Some modern DRAMs are capable of self-refresh" maybe just integrate "external logic" inside,
        - "can be recovered even if the DRAM has not been refreshed for several minutes"
          - [this](https://sci-hub.ru/10.1109/HST.2016.7495561) -> [reference 4](https://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html) -> [this](https://www.usenix.org/legacy/events/sec01/full_papers/gutmann/gutmann.pdf)
            - Wear leveling -> ["erasures and re-writes are distributed *evenly*"](https://en.wikipedia.org/wiki/Wear_leveling)
            - ["hot-carrier effects"](https://www.iue.tuwien.ac.at/phd/entner/node21.html) just electron goes into the gate which is "dielectric".
            - ["Electromigration" just generates holes and electrons](https://en.wikipedia.org/wiki/Electromigration) -> "superior conductivity"
            - "Because of this type of operation it’s not possible to *cycle fresh cells* to reduce remanence effects *without bypassing the filesystem*" ("cycle fresh cells" means use fresh more frequently by cycle (i.e. Wear leveling)) because filesystem determines "which determines which memory segments to clean, when to clean them, and *where to write* changed data"
            - "(*controlled*) wearing"
            - why "ever-shrinking device dimensions" -> "more and more difficult to recover data". See below "shorter window ..."
            - "multilevel storage" helps "making it more and more *difficult to recover* data" because decryption is harder.
          - [referenced](https://www.usenix.org/legacy/event/sec08/tech/full_papers/halderman/halderman_html/) by wikipedia
            - "The first is to *cool* the memory chips"
            - "memory with higher densities have a *shorter window* where data is recoverable"
            - "decay rates were low enough" cause *recoverable* behavior and "may be recoverable for hours or days with *sufficient cooling*."
              Also see [figures](https://www.usenix.org/legacy/event/sec08/tech/full_papers/halderman/halderman_html/#htoc6)
              See [wikipedia](https://en.wikipedia.org/wiki/Dynamic_random-access_memory#Data_remanence)
      - TODO "Refreshing of cells remains necessary, but unlike with 1T1C DRAM"
      - "can leak between nearby cells" -> "row hammer" in [COD_RISCV_2nd_A_appendix] 493
      - RAS Only Refresh
        - "$\overline{CAS}$ must remain high." to select the whole row.
        - "Refreshes were interleaved with common instructions like memory reads." -> same as the book "Refresh is performed by simply reading ... " in A-64
        - "refresh was often handled by the *video circuitry*"
      - "CAS before RAS refresh" just says the refresh *condition*.
        - here use "uses an internal counter to select the row" instead of $\overline{RAS}$
      - "Hidden refresh" is "CAS before RAS refresh" by "performs a CBR refresh cycle".
        "holding $\overline{CAS}$ low" ->  If the $\overline{CAS}$ line is driven low
        "If $\overline{RAS}$ is then asserted again" -> before $\overline{RAS}$
        "while the DRAM outputs remain valid" -> "the DRAM ignores the address inputs" (i.e. $\overline{RAS}$)
      - "pseudo-static operation, this mode is often equivalent to a *standby* mode" -> "*without losing* data stored in DRAM"
  - From the above, SRAM use *$V_{DD}$* and GND to keep the state and DRAM use capacitor and refresh to keep.
  - TODO ["p-type semiconductor"](https://en.wikipedia.org/wiki/MOSFET#Metal%E2%80%93oxide%E2%80%93semiconductor_structure) meaning to MOSFET
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
  - difference with [Java Monitor](https://www.javatpoint.com/semaphore-vs-monitor#:~:text=Semaphore%20is%20an%20integer%20variable%2C%20whereas%20monitor%20is%20an%20abstract,crucial%20section%20at%20a%20time.) 
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
- struct dot before variable like [struct timeval t = {.tv_sec = 5};](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.32/#comment-6161315337)
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
  - use [shell](https://stackoverflow.com/questions/65518363/how-to-append-to-a-list-of-variables-in-a-makefile)
  - [+=](https://stackoverflow.com/questions/55500865/how-to-append-lists-in-makefile-using-loops)
- why `clean` has [*~](https://stackoverflow.com/questions/38002190/what-is-happening-in-this-make-clean) (which is emacs backup)
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
- so use [git check-ignore -v **/* ](https://scriptcrunch.com/git-show-ignored-files/) to check all subdir files, here `**/` -> all subdirs, `*` -> any str
- regex `+` by [?*](https://stackoverflow.com/questions/28281504/what-is-the-gitignore-equivalent-of-one-or-more-occurrence)
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
## must use suffix or constant name in subdirs so that [.gitignore]() can be used better, then just write in parent `.gitignore` is enough ('it matches files and folders in any folder or subfolder.').
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
- caret [^](https://stackoverflow.com/questions/1955985/what-does-the-caret-character-mean-in-git) or tilde `~`
# assembly pseudo instruction
- TODO dd meaning [here](https://en.wikipedia.org/wiki/Spinlock#Example_implementation) same as [this](https://stackoverflow.com/questions/46513413/x86-asm-dd-being-used-as-an-instruction) ?
  - dd [example](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)
# other books about computer basic architecture
## [Computer organization and design David A. Patterson][MIPS_COD] which is generated by [this](https://www.pdf2go.com/result#j=19de2dd4-c818-4a03-93c4-004f44fc35f4) (this one is based on MIPS although it have [RISC-V](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20RISC-V%20edition.pdf) and ARM version)
> [compared](https://www.quora.com/Why-is-William-stallings-computer-architecture-book-not-as-popular-as-Hennessy-Patterson) with william stallings computer organization and architecture which is referenced in this [zhihu link](https://www.zhihu.com/question/36539741?utm_id=0), see [IPFS](https://www.reddit.com/r/textbookrequest/comments/10aa3b7/computer_organization_and_architecture_eleventh/)
> RISC-V encoding behavior [reasons](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way)
- risc-v [appendix][COD_RISC_V_Orig_companion]
- also see above [COD](#COD)
- [COD5th](../references/other_resources/COD/CS422-Computer-Architecture-ComputerOrganizationAndDesign5thEdition2014.pdf) rendered more well
- thought as [bible](https://passlab.github.io/CSE564/resources/#textbook)
- exercise [solution](https://www.studocu.com/ko/document/konkuk-university/%EC%BB%B4%ED%93%A8%ED%84%B0%EA%B5%AC%EC%A1%B0/computerorganizaion-design-5th-solution/9639022)
  - [appendix A][appendix_A_exercise_ans] <a id="appendix_A_exercise_ans"></a>
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
  - mips risc-v [diff](https://stackoverflow.com/questions/67464262/mips-and-risc-v-differences) similar to p362 <a id="mips_riscv_diff"></a>
    mips: "depending on whether the comparison is true ... then follow that *comparison instruction*" (just use two instructions to implement `beq` in riscv).
    TODO "switch order of operands ... tested by the branch"; 
    "the full MIPS is *a much larger* instruction set than RISC-V"
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
### below temporarily changed to [RISC-V][RISC_V_Custom_OCR] just as [18-447 TODO reason for switching to RISC-V](https://users.ece.cmu.edu/~jhoe/course/ece447/S22handouts/L02.pdf)
> [ARM-v8 version](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20ARM%20edition.pdf): author use v8 instead of v7 in p17 for more similarity with MIPS.

from 5.14,I changed to this [book](https://bank.engzenon.com/tmp/5e7f7183-219c-4d93-911a-4aaec0feb99b/5dc835ea-b66c-4988-be3f-4d51c0feb99b/Computer_Organization_RiscV_Edition.pdf) (saved at this [location](../references/other_resources/COD/Computer_Organization_RiscV_Edition.pdf)) which keeps the same layout as the original book [appendix](https://www.elsevier.com/books-and-journals/book-companion/9780128122754/advanced-content-and-appendices#Advanced%20Content). Before that, I read [this](http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20RISC-V%20edition.pdf) which is saved [here](../references/other_resources/COD/COD_RISCV_OCR.pdf)
#### RISC-V [manual](../references/other_resources/RISC-V/riscv-spec-20191213.pdf), [latest](https://riscv.org/technical/specifications/)
- ~~TODO~~ SB-format B [meaning](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way)
  - just see [cs61_07] p42 -> B:branch
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
  "guard digit" just add precision
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
[differences][single_Multiple_Cycle] among single-cycle,Multiple Cycle, Pipeline. 
Most of time, the latter two are thought as [same](https://users.cs.utah.edu/~bojnordi/classes/3810/f20/slides/18-cpu.pdf). But more strictly, it is not. See [COD_RISC_V_2nd] p282.e1.
- 'FIGURE 4.2' 'FIGURE 4.4'(state element) PC+[4](https://stackoverflow.com/questions/63904609/why-program-counter-in-risc-v-should-be-added-by-4-instead-of-adding-0-or-2) although the book says it use 64-bit
- 'FIGURE 4.7' [slash](https://electronics.stackexchange.com/questions/329358/what-does-a-slash-over-a-line-in-a-circuit-diagram-mean) num meaning
- p493 [immediate generation unit](https://www.reddit.com/r/VHDL/comments/ap00mj/need_help_with_the_immediate_generator_part_of/), which may be used to generate branch target (see 'FIGURE 4.9')
- [SB-format p7][cs61_07] risc-v format <a id="rformat"></a>
  - also see [riscv_spec] p16
- 'FIGURE 4.15,17'
- p543 [latency](http://ece-research.unm.edu/jimp/611/slides/chap3_1.html)
- p545 here 'single-cycle datapath' has no relation with 'Single-cycle, nonpipelined execution' in 'FIGURE 4.25',
- 'FIGURE 4.31' related with later figures 'FIGURE 4.34/41',etc
  - ‘FIGURE 4.36’ although here must use 'address' to read memory, but maybe to be distinct with 'FIGURE 4.38' write, so just split.
- p500 ALUop [implemented p5](https://ece.uwaterloo.ca/~cgebotys/NEW/ECE222/4.Processor.pdf) in `opcode` (different from [this p41](https://passlab.github.io/CSE564/notes/lecture08_RISCV_Impl.pdf))
  - TODO relation with actual instruction [binary](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#add)
  - how related [hardware p12 (based on truth table)][truth_table] implemented <a id="truth_table_hardware"></a>
    - the whole [ALU	control](https://cs.wellesley.edu/~cs240/f14/lectures/18-control.pdf)	signals including `NOR`
    - TODO how Function code in p6 above defined
    - [this p4 (COD also says in appendix p1191)](https://ece.uwaterloo.ca/~cgebotys/NEW/ECE222/4.Processor.pdf) how ALU control are encoded, so NOR: `~(a|b)=(~a)&(~b)` <a id="ALUop"></a>
      "FIGURE A.5.12" implies "FIGURE A.5.13"
      
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
- p614 [multiple issue (see figure, issue both int and fp each time.)](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/multiple-issue-processors-i/index.html) <a id="multiple_issue"></a>
  [COD_RISC_V_2nd] p343 load and ALU can be multiple issued, just by the architecture [figure](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Individual_Core) where it has 4 ALUs and 3 AGUs.
  - detailed see CAAQA p223 & 'Figure 3.19'
    - p226 [reservation station](https://en.wikipedia.org/wiki/Reservation_station) in each 'Functional Units' which may be used to forwarding (i.e. 'rather than waiting for it to be stored in a register and re-read') by 'listens on a Common Data Bus for the operand to become available'
      related with "register renaming".
    - issue slot or operation slot related with [ROB](https://en.wikipedia.org/wiki/Re-order_buffer) p215 
- p619 here 'an ALU and a data transfer' still take 'usual hazard detection's in account, see p622 example.
- p623 loop unrolling to decrease nop at least.
- 'FIGURE 4.69'
- p538,630 ‘hide the branch delay’
  - here dalay is not real delay, because the `beq` is changed before `add`, so the delay of `add` is just how the `beq` should do originally.
  - kw: 'automatically arrange','the add instruction before the branch ','moved after the branch'
  - [delay slot](https://en.wikipedia.org/wiki/Delay_slot) 'execute *a pair* of instructions following a branch instruction before the branch takes effect','this instruction will execute *even if* the preceding branch is taken','typical for *assemblers* to *automatically reorder* instructions', so it is just to make ‘the *pipeline* must be full of instructions at all times’，‘Each cycle where a *stall* is inserted is considered one branch delay slot’
    - notice: the main purpose of [delay slot](https://stackoverflow.com/questions/15375084/what-is-the-point-of-delay-slots) is not to add stall which doesn't has any influence to pipeline performance. Instead, as the book say, it is to **`reorder`**.
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
  - [Indirect predictor](https://developer.arm.com/documentation/ddi0488/c/BABEHAJJ) 'only provides the address' while [hybrid predictor](https://en.wikipedia.org/wiki/Branch_predictor#Hybrid_predictor) 'predictor still predicts the *direction*' with True or false ...
    - implementation
      - [bit-level](https://people.engr.tamu.edu/djimenez/pdfs/p27-garza.pdf) p4 
        - [hash](http://meseec.ce.rit.edu/eecc722-fall2001/papers/branch-prediction/4/indir_isca24.pdf)
      - with jump [table](https://llvm.org/devmtg/2017-02-04/Efficient-clustering-of-case-statements-for-indirect-branch-prediction.pdf)
    - related with cpu IBPB (*Indirect Branch* Predictor Barrier) & STIBP (*Single thread* indirect branch predictors) [1](https://terenceli.github.io/%E6%8A%80%E6%9C%AF/2018/03/07/spectre-mitigation) or [kernel](https://www.kernel.org/doc/Documentation/admin-guide/hw-vuln/spectre.rst)
  - TODO early decode
- p643
  - [Anti-dependency](https://en.wikipedia.org/wiki/Data_dependency#Anti-dependency) 'the ordering of these instructions cannot be changed'
  - [retirement p6](https://www.ece.uvic.ca/~amiralib/courses/p6.pdf) (rrf: Retirement Register File) stage architecture is just commit. Also [see](https://en.wikipedia.org/wiki/Register_renaming#Architectural_versus_physical_registers)
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
    - [.*](https://stackoverflow.com/questions/58436253/in-systemverilog-what-does-mean)
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
    - see [this][fp_multi_cycle] better <a id="pipelined_fp"></a>
      "FP/integer divide" -> non-pipelined
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
    - The `EX` use `ALU...`. Others see figure. [hardware][truth_table]
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
  - pipeline scheduling ['Scheduling'][pipeline_scheduling]
    The compiler Schedules (i.e. reorders) instructions by avoiding [hazards](https://en.wikipedia.org/wiki/Instruction_scheduling#Data_hazards), 

    ["list scheduling"](https://en.wikipedia.org/wiki/List_scheduling) just schedule "job"s to different threads (i.e. "machines" in the link context) if using one multi-core cpu.
    kw: critical path; associated latency; a resource(mem / port); many new sources?;

    pass [flags](https://en.wikipedia.org/wiki/Instruction_scheduling#Compiler_examples) to the compiler ("which *"port"* each use". This implies *pipeline* scheduling).

    TODO read more the first link.
    - [illegal](https://www.intel.com/content/www/us/en/docs/programmable/683836/current/illegal-instruction.html) operation
    - ~~by searching 'cpu instruction ambiguous operation', semantically [ambiguous]~~ [Memory_disambiguation](https://en.wikipedia.org/wiki/Memory_disambiguation) ~~operations which is one data hazard.~~
      Here use hardware 
      a. like store queue which 1. ["to the memory system"](https://en.wikipedia.org/wiki/Memory_disambiguation#Avoiding_WAR_and_WAW_dependencies) 2. to [`load`](https://en.wikipedia.org/wiki/Memory_disambiguation#Store_to_load_forwarding)

      b. load queue is similar, just to OoO. So ["the load is marked as *"violated"* in the *retirement* buffer"](https://en.wikipedia.org/wiki/Memory_disambiguation#Load_queue_CAM_search) when **RAW** is reordered so that load "must have *executed before* the store and thus read an incorrect, old value". Then "*restarts* execution from the load". "all *previous* stores have committed ... any *dependent* instructions"
      not "create resource conflicts with other loads" because it is in "the *load queue*".

      "Disambiguation at retirement" just add one "*compared* to the value obtained when the load first executed"  to avoid unnecessary flush and violation generalization (See "will not flag a RAW dependence...") based on the above.
      - Notice [`RAW`](https://en.wikipedia.org/wiki/Memory_disambiguation#Avoiding_RAW_dependence_violations) reordering (i.e. Storeload) is [allowed][Weak_vs_Strong_Memory_Models] in x86.
        "the address generation operations ... can execute out-of-order" (p.s. However, the load,store time is mostly on memory access, so this reordering may ~~not~~ improve the performance because it avoid `load` to load *twice* from cache/mem).

        Memory dependence prediction using [Store Sets](https://safari.ethz.ch/digitaltechnik/spring2020/lib/exe/fetch.php?media=chrysos_isca1998.pdf) which is probably precalculated.
    - by searching 'compiler semantically ambiguous operation', "semantically ambiguous" may means "two parse trees" or more in CFG("context-free grammar"). Just see this [example](https://en.wikipedia.org/wiki/Ambiguous_grammar#Addition_and_subtraction). Here ["leftmost derivation"](https://en.wikipedia.org/wiki/Context-free_grammar#Derivations_and_syntax_trees) just means from left to right like [C Operator Precedence](https://en.cppreference.com/w/c/language/operator_precedence)
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
    - Scoreboard [algorithm](https://en.wikipedia.org/wiki/Scoreboarding#The_original_6600_algorithm) <a id="scoreboard"></a>
      - wait until `!Result[dst]` (i.e. until `Result[dst]=0`, from `Result[Fi[FU]] ← 0; // 0 means no FU generates the register's result` means the *last* Result has been *completed*. Notice: here although program written order `Result[Fi[FU]] ← 0;` ~~then assign the value~~ is before `RegFile[Fi[FU]] ← computed value;`, but similar to verilog grammar, here may mean *non-blocking* assignment.)
        This is to "In order to avoid output dependencies ( WAW ...)"
      - "when write dependencies (RAW – Read after Write) have been dropped" and "To avoid Register File *Port contention*" -> `wait until (Rj[FU] AND Rk[FU]);`.
        po this can be optimized to allow multiple instructions to read same data.
      - `(Fj[f]≠Fi[FU] OR Rj[f]=No)` means either the write `Fi[FU]` won't influence other reads or other has read (`Rj[f]=No`). -> "the Unit is *clear of all* (WAR – Write after Read) hazards".
      - po here Scoreboard just means *recording scores* (i.e. infos about registers including register dependency and others).
- Dynamic instruction scheduling [overlook](../references/other_resources/COD/references/HY425_L8_ReorderBuffer.pdf) https://www.csd.uoc.gr/~hy425/2020f/lectures/HY425_L8_ReorderBuffer.pdf
  - also known as [Superscalar](http://thebeardsage.com/multiple-issue-processors/) [1](https://en.wikipedia.org/wiki/Superscalar_processor) <a id="scheduling"></a>
    Superscalar is just ~~pipeline~~ [multiple isuue](https://en.wikipedia.org/wiki/Superscalar_processor) "by using multiple execution units" which is independent of pipeline ("different performance enhancement techniques"). <a id="Superscalar"></a>
  - see p5,14
- ROB [structure p25](https://www.csd.uoc.gr/~hy425/2020f/lectures/HY425_L8_ReorderBuffer.pdf)
  - also see [1](https://decodezp.github.io/2019/04/06/quickwords24-skylake-pipeline-8/) [2](https://github.com/drharris/cs6290-notes/blob/master/reorder-buffer.md) [video in 2](https://www.youtube.com/watch?v=0w6lXz71eJ8)
- also see  ROB in [Apple](https://news.ycombinator.com/item?id=25163883)
###### diff with store buffer
- CAQQA p230,242,247(relation with reorder buffer)
  - notice the design may be different slightly between amd and intel, also different microarchitecture.
  - [RAT design](../references/other_resources/COD/references/pipeline/xiao2013_RAT.pdf) with 'global checkpoints' for *recovery* (It may be same as ["RAT (Resource Allocation Table)"](https://easyperf.net/blog/2018/12/29/Understanding-IDQ_UOPS_NOT_DELIVERED) from [this (also says other like IDQ: Instruction Decode Queue)](https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(client)#Renaming_.26_Allocation))
    RAT also means ["register allocation table"][move_elimination]
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
      - Strided prefetching which is at least not *contiguous* (Regular) and with *variable step* (Irregular) or targeted to specific subsets (Temporal)
        - Also see [arm](https://community.arm.com/arm-research/b/articles/posts/making-temporal-prefetchers-practical--the-misb-prefetcher)
      - 'synergistically' -> Collaborative prefetching
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
    - see [COD_RISC_V_Orig] p404
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
    [AFR](https://en.wikipedia.org/wiki/Annualized_failure_rate)
  - 'Service interruption' is the opposite of above.
  - See this [image](https://www.researchgate.net/figure/A-schematic-diagram-of-MTTF-MTTR-and-MTBF_fig5_334205633)
- p808
  - how hamming code [encoded][geeksforgeeks_hamming], also see [mem_appendix] <a id="hamming"></a>
    "covers all bit positions which have the least significant bit" (based on *bit* to error detection).
  - ~~TODO is it coincidence that $0110=6$ which is wrong bit.~~ also [see][hamming_tutorialspoint]
    - see [this](https://en.wikipedia.org/wiki/Parity_bit#Error_detection), why hamming code can detect one error bit *location*.
      Also see [this][geeksforgeeks_hamming] for the detailed example.
      And [this](https://en.wikipedia.org/wiki/Hamming_code#Description): "Hamming distance" defines the *minimum distance* between elements in one set. Also see [COD_RISCV_2nd_A_appendix] A-65 the distance "between legal *combinations* of parity and data." <a id="hamming_distance"></a>
      Also see [this "there exists *at most one* codeword c (from C) such that the Hamming distance between w and c is *at most k*"](https://en.wikipedia.org/wiki/Hamming_distance#Error_detection_and_error_correction) -> "and only if, the minimum Hamming distance between any two of its codewords is *at least 2k+1*", So the correction mapping is *unique* and can be corrected.

    - or book 'should always be even'.
  - hamming code short description
    - from [this][hamming_tutorialspoint] and this [Q&A](https://stackoverflow.com/questions/76480970/why-hamming-code-say-at-least-n-p-1-states)
      here state is just detect the *one-error location* where "one additional state indicates *no error*" (i.e. all zeros of parity means no error).
    - why distance 3 is based on the minimum change -> bit 3 changes (since $3=2^0+2^1$, so it changes 3 bits while something like $31=\sum_{i=0\ldots 4}2^i$ will change $5+1=6$ bits)
      Better see [this][hamming_table]
  - [wikipedia](https://en.wikipedia.org/wiki/Hamming_code#)
    - TODO 
      - 'perfect codes','Parity-check matrix ... shortened Hadamard code','Hamming distance of four','double-error detecting'
      - 'but also which bit caused the error.'
      - 'error syndrome'
    - 'grew increasingly frustrated with having to restart his programs from scratch','Damn it, if the machine can detect an error, why can't it locate the position of the error and correct it?' :)
    - [Two-out-of-five code](https://en.wikipedia.org/wiki/Hamming_code#Two-out-of-five_code)
      - ten because $C_{2}^{5}=10$, this is high school knowledge...
      - like parity bit, 'can detect ... all odd numbered bit-errors', also [unidirectional error ("all the individual bit errors are of *a single type* (all 0→1 or all 1→0).")](https://en.wikipedia.org/wiki/Two-out-of-five_code#)
    - ['code rate'](https://en.wikipedia.org/wiki/Code_rate) is same as rate in [this](https://en.wikipedia.org/wiki/Hamming_code#)
    - kw: 'flipping two or more bits','a distance of','In general','two problems at once','parity bits *overlap*','the index of the *corrupted* bit',
    - how `[8,4]` check [2-bit error (see 'The (8,4) Extended Hamming Code')](https://www.ece.unb.ca/tervo/ece4253/hamming.shtml#:~:text=The%20(8%2C4)%20Extended%20Hamming%20Code&text=Having%20distance%20(d%3D4),parity%20check%20(P)%20passes.)
    - block code in `[7,4] Hamming code` is just the [mapping](https://en.wikipedia.org/wiki/Block_code#The_block_code_and_its_parameters) from set 4 to set *7*.
    - the [generator](https://en.wikipedia.org/wiki/Hamming_code#Encoding) may be better viewed with the ['This general rule'][hamming_table]
    - TODO view more detailedly after 'Hamming codes with additional parity (SECDED)'
      - [codeword](http://www.ee.unb.ca/cgi-bin/tervo/hamming.pl?X=+Generate+&L=7&D=4&T=0000000)
    - here $-A^{{\text{T}}}$ in ${\mathbf  {G}}:={\begin{pmatrix}{\begin{array}{c|c}I_{k}&-A^{{\text{T}}}\\\end{array}}\end{pmatrix}}$ do not means negation because ['underlying field is 2' (here need knows basic understanding of *block matrix*), so $P+P=2P=\vec{0}$](https://en.wikipedia.org/wiki/Parity-check_matrix)
    - TODO how 'parity-check matrix' interpreted when operated with $(\vec{x}^TG)^T$
    - here '*minimum* distance of three' because 'with two or more 1 bits', so one *data* bit changed, then at least two or more *parity* bits changed. Then in sum, *three* or more bit in the whole bits are changed.
      - notice: the *minimum* distance is better to be bigger to differentiate between different original code.
    - '(3,1) repetition' can 'correct one-bit errors' mainly based on *redundancy* and 
    - TODO 'a code with distance k can detect but not correct *k − 1* errors' doesn't apply to hamming code because it doesn't detect *double bit* errors (see [this](https://en.wikipedia.org/wiki/Hamming_code#[7,4]_Hamming_code), if $d_3,d_4$ changed, then p1 flipped once [changed] and p2,p3 flipped twice [so unchanged], then mapped to p1 self... ).
  - the parity code is manually chosen as [odd or even](https://en.wikipedia.org/wiki/Parity_bit#Error_detection) where "Even parity" means even 1 number.
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
        - here lockstep which use ['redundancy (duplication)'](https://en.wikipedia.org/wiki/Lockstep_(computing)) originates from [army](https://en.wikipedia.org/wiki/Lockstep#:~:text=Originally%20it%20was%20used%20in,prisons%20of%20the%2019th%20century.) (lock the *step*s of soldiers) usage (i.e. *synchronize* which implies "in parallel")
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
    - [p6,8 with MPN,etc](https://cseweb.ucsd.edu/~yiying/cse291j-winter20/reading/Virtualize-Memory.pdf) more directly [p29 with MPN,etc.,definition](https://www.doc.ic.ac.uk/~etheresk/etheresk-211-vms.pdf)
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
  - [Round-robin (i.e. cyclic "cycles *back* to 0")](https://developer.arm.com/documentation/den0013/d/Caches/Cache-policies/Replacement-policy) or cyclic replacement 
    Also see [this][hardware_thread_scheduler] "barrel-scheduler (also known as a round-robin scheduler)"
    - TODO see Random Replacement [math](https://inria.hal.science/hal-01054982/document)
  - [Variable page size](https://stackoverflow.com/questions/35720775/variable-page-size-in-linux)
    - THP: ~~TODO view code why~~ 'some kind of *defragmentation*' because the size isn't totally variable in all range although [*automatic* promotion and demotion implies 'Transparent'](https://www.kernel.org/doc/html/next/admin-guide/mm/transhuge.html) 
      - [disadvantage](https://techoverflow.net/2017/02/18/advantages-and-disadvantages-of-hugepages/): 'access almost the *entire* hugepage'
  - [Approximated LRU](https://www.geeksforgeeks.org/lru-approximation-second-chance-algorithm/) [see](#reference_bit), this is one version without counter. Second Chance is given by 'reference bit (bitref)'. 
  - 'Two-way (1), four-way (D)' because instruction to be fetched is normally larger.
- p918
  - 'merge requests' is similar to SIMD (here data are merged. po). 

#### from here, Not use the [old book][RISC_V_Custom], use the [new book][COD_RISC_V_Orig] page as the index.
##### chapter 5
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
          - Privilege Mode: here Hypervisor is VMM (virtual machine monitor) (' hyper- used as a stronger variant of super-') (also [see](#hypervisor)) while supervisor is *kernel*. Also [see](https://www.vmware.com/topics/glossary/content/hypervisor.html#:~:text=A%20hypervisor%2C%20also%20known%20as,such%20as%20memory%20and%20processing.) <a id="VMM"></a>
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
        - `ebreak` is just used by debugger like `gdb`.
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
            - p53 [parallel reductions](https://www.openmp.org/spec-html/5.0/openmpsu107.html#x140-5810002.19.5.4) in memory use 'private copy' 'using the *combiner* associated with' (maybe same as acc0/1 in 'Figure 5.21' TODO see assembly) (See [COD_RISC_V_2nd] which corresponds to above link "Table 2.11") and 
              also see [this](https://dournac.org/info/gpu_sum_reduction) which uses local memory (i.e. private copy) to parallel calculate global memory 
              (this is similar to nvidia [slide](https://www.olcf.ornl.gov/wp-content/uploads/2019/12/05_Atomics_Reductions_Warp_Shuffle.pdf) p14). <a id="reduction_nvidia"></a>
              It seems to have no relation with [this](https://en.wikipedia.org/wiki/Reduction_of_summands#:~:text=Reduction%20of%20summands%20is%20an,reduction%20of%20summands%2C%20and%20summation.) where has no copy and parallel and it use carry and original bit summand separately. <a id="reduction"></a>
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
- p390 <a id="Check_5_2"></a>
  - 4 is obviously right by 'the bandwidth of main memory is *increased* to transfer cache blocks more efficiently'.
  - ~~2~~ 1 is right by p384: Assume that *init time* is low, if 'cache block' is large, then the low init time won't contribute much to decreasing the total transfer time. See 'Amdahl’s Law' in p49.
    Also see answer "amortize".
- p376
  - 'omit the index bits' means omit in assigned as the tag (not use one of index bits as one tag bit).
- p401
  - Increasing associativity -> less block nums -> more tag bits, see [this](https://en.wikipedia.org/wiki/Cache_placement_policies#Set-associative_cache). Here index bits are not used to index all cache lines but index cache sets which may has *multiple lines*. (index bit num from [6](https://en.wikipedia.org/wiki/Cache_placement_policies#Example)->5)
- p407
  - see 
- p408
  - [GFLOPS:gflop/s](https://en.wikipedia.org/wiki/FLOPS)
- p465
  - p220 subword-parallel instructions -> AVX
  - p342 instruction-level parallelism: just allow multiple `_mm256_mul_pd`,etc.,to issue because they rely on different `c[x]`.
  - here "40 and 28 instructions respectively" may diff when using different `-O`
    With `-O3`, `dgemm_unrolled_avx256` puts `j...` after the loop which implies always do the loop the first time. And `dgemm_blocked_avx256` at least save variable `si/sj... + BLOCKSIZE` by something like `lea    eax,[r9+0x40]` when using `BLOCKSIZE = 32 * 20 / BLOCK_DENOMINATOR;` and `BLOCK_DENOMINATOR=10` -> `0x40=64`. So the latter use more instructions **before** the original `dgemm_unrolled_avx256` loop.

    use `gdb` and `rr` to view which branch is related with which for loop.
    Here `dgemm_blocked_avx256` use more loops, so it has more instructions **after** the original `dgemm_unrolled_avx256` loop to solve with the 3-level loop outside `do_block_avx_256`.
    ```bash
    $ typeset -f id2c
    id2c () {
            . ~/.virtualenv/misc/bin/activate
            icdiff <(eval " $1") <(eval " $2")
    }
     # here sed  not support '\d' https://stackoverflow.com/a/14671415/21294350
    $ id2c \         
    "objdump_base -d ~/matrix-matrix-multiply/build/debug_block/dgemm_10 | sed -E '/^[[:alnum:]]+ <dgemm_unrolled_avx256.*/,/^[[:alnum:]]+ <[a-z].*/p'" \
    "objdump_base -d ~/matrix-matrix-multiply/build/debug_block/dgemm_10 | sed -E '/^[[:alnum:]]+ <dgemm_blocked_avx256.*/,/^[[:alnum:]]+ <[a-z].*/p'" | less_n

    $ rr record ~/matrix-matrix-multiply/build/debug_block/dgemm_10
    $ rr replay
    >>> br *dgemm_blocked_avx256+487
    >>> c
    >>> si # view the stack in dashboard. Here inline `do_block_avx_256` in `dgemm_blocked_avx256`
    [0] from 0x0000564374a9e447 in do_block_avx_256+412 at /home/czg/matrix-matrix-multiply/src/dgemm_blocked_avx256.cpp:87
    [1] from 0x0000564374a9e447 in dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+487 at /home/czg/matrix-matrix-multiply/src/dgemm_blocked_avx256.cpp:117
    ...
    >>> disassemble dgemm_blocked_avx256
    ...
       0x0000564374a9e2f0 <+144>:   mov    r14d,0x4 # this is BLOCKSIZE/(UNROLL * 4)=4 when using 'constexpr' both in `constexpr uint32_t BLOCKSIZE = 32 * 20 / BLOCK_DENOMINATOR` , `constexpr uint32_t UNROLL = UNROLL_DEF;` and `BLOCK_DENOMINATOR=10`.
       0x0000564374a9e2f6 <+150>:   mov    DWORD PTR [rsp-0x1c],ebx
       0x0000564374a9e2fa <+154>:   mov    QWORD PTR [rsp-0x38],rbx
       0x0000564374a9e2ff <+159>:   mov    DWORD PTR [rsp-0x44],ecx
       0x0000564374a9e303 <+163>:   mov    DWORD PTR [rsp-0x48],r9d
       0x0000564374a9e308 <+168>:   mov    ebx,r13d # find the last r14 assignment before the jump target.
    ...
       0x0000564374a9e41d <+445>:   vmovapd YMMWORD PTR [r8],ymm1
       0x0000564374a9e422 <+450>:   jne    0x564374a9e34a <dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+234 at /home/czg/matrix-matrix-multiply/src/dgemm_blocked_avx256.cpp:93>
    ...
       0x0000564374a9e444 <+484>:   dec    r14d
    => 0x0000564374a9e447 <+487>:   jne    0x564374a9e308 <dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+168 at /home/czg/matrix-matrix-multiply/src/dgemm_blocked_avx256.cpp:89>
    ...
       0x0000564374a9e45b <+507>:   cmp    r15d,esi
       0x0000564374a9e45e <+510>:   jb     0x564374a9e2e6 <dgemm_blocked_avx256(unsigned int, double const*, double const*, double*)+134 at /home/czg/matrix-matrix-multiply/src/dgemm_blocked_avx256.cpp:87> # this is similar to how above is analysised.
    ```
  - [turbo -> single core](https://qr.ae/pyObYW)
- p468
  - "36 is a word address" ([word address](https://www.geeksforgeeks.org/difference-between-byte-addressable-memory-and-word-addressable-memory/)) -> byte address $36*2=72$, ~~then~~ 
    - TODO given this [example](https://stackoverflow.com/questions/70325412/how-to-find-tag-bit-in-cache-given-word-address), here "a block size of 4 bytes" -> "a block size of 2 words". Then should be block $(36/2)mod8=2$. (This is similar to the book example)
      ```bash
      $ ipython -c "bin(36>>1)[-3:]"
      Out[1]: '010' # 2
      ```
  - [base](https://en.wikipedia.org/wiki/Base_address#:~:text=In%20computing%2C%20a%20base%20address,displacement)%20is%20added%20to%20it.) of the address.
- p469
  - Notice: set associativity should > threads used
  - memory access time may be *overlapped* due to OoO and continue to run when encountering one miss. So p391 "miss penalty in clock cycles for a read" may be *dynamic* due to overlap. 
  - See [this](#Segmentation), segmentation *split* the memory in some way which may cause some special cases thorny like using large arrays,etc.
  - see p421("The number of bits in the page offset field")/438("8-bit address space ID (ASID) field")/450("except that the data fields are now 128 bits wide"), here field may just mean one data unit. 
    disk may have [one specific field with each sector](https://en.wikipedia.org/wiki/Disk_sector#History). [See](https://en.wikipedia.org/wiki/File:CKD_Track_Format.png)

    "specifications" means what datasheet or manuals said not what model the disk uses.
  - [logical block address from wikipedia][CHS]~~ vs is similar to flat memory~~
    See this for ["sectors, tracks, and surfaces"](https://tldp.org/LDP/sag/html/hard-disk.html)
    Notice: in RAID, it also use [LUNs](https://en.wikipedia.org/wiki/Logical_block_addressing#Overview) to encode disk number.

    actual mapping: from [CHS], first it select *head location* by `head = C × HPC + H` (more detailed [see where track is one platter of cylinder](https://en.wikipedia.org/wiki/Cylinder-head-sector#Definitions), each cylinder has `HPC` heads), then each head can select in the corresponding sector, so -> `head × SPT + (S − 1)`
    from the table in the [CHS], `63` is more nearer than ~~`62`~~ `62/2=31` to `1` because the former just changed the head. So "since the disk knows the *actual mapping*".
- p470
  - "protection" ~~just~~ means at least [memory protection](https://en.wikipedia.org/wiki/X86_memory_segmentation). Notice [different](https://en.wikipedia.org/wiki/X86_memory_segmentation#80386_protected_mode) protected mode where 80386 adds "paging unit".
    "virtualizable" problems with `x86` is that privileges are not totally controlled. 
    TODO:
    - what does "Anderson, 2003" refer to?
    - [VMX p15](https://www.cs.dartmouth.edu/~sergey/cs258/2014/TorreyGuestLecture-Hypervors.pdf)
    - [Pacifica `VMRUN` p7](https://courses.cs.vt.edu/~cs5204/fall07-kafura/Papers/Virtualization/AMD-Pacifica-slides.pdf)
    - [Xen](https://github.com/Xilinx/xen) which is part of xilinx of AMD.
      - "uses only the easy-to-virtualize parts"
    - [APIC](https://edc.intel.com/content/www/us/en/design/ipla/software-development-platforms/client/platforms/alder-lake-desktop/12th-generation-intel-core-processors-datasheet-volume-1-of-2/intel-apic-virtualization-technology-intel-apicv/)
- p471
  - [Robin and Irvine, 2000](https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q=Robin+and+Irvine%2C+%222000%22+virtualization&btnG=) -> [this](https://www.usenix.org/legacy/events/sec2000/full_papers/robin/robin_html/) (better view the [pdf][robin]
    in FIGURE 5.51
    - the first 6 instructions violate "Requirement 3B" which involves "sensitive instruction".
      The main problem is registers related with these instructions are *only one* which will be influenced by multiple VMOSs.
      - `SGDT` store [`GDTR`](https://en.wikibooks.org/wiki/X86_Assembly/Global_Descriptor_Table) which describes GDT used in segmentation. What the GDT [store](https://wiki.osdev.org/GDT_Tutorial#What_to_Put_In_a_GDT) is Segment Descriptor (also [see](https://wiki.osdev.org/GDT#Segment_Descriptor))
        SGDT -> GDTR -> GDT
        
        `SLDT` is similar to `SGDT`, but it [stores][Segment_Selector] "Segment Selector" which select Segment Descriptor in GDT. Also see [this "entry of LDT is save in GDT"](https://stackoverflow.com/questions/34243432/how-are-ldt-and-gdt-used-differently-in-intel-x86) And [this figure](https://wiki.osdev.org/GDT_Tutorial#The_LDT).

        [`Offset`](https://wiki.osdev.org/Interrupt_Descriptor_Table#IDTR) in IDTR just corresponds to `base` in `GDTR`. (Also see [Task Gate](https://wiki.osdev.org/Interrupt_Descriptor_Table#Task_Gate) which is only used in [IA-32 not used](https://en.wikipedia.org/wiki/IA-32) now and the [figure](https://pdos.csail.mit.edu/6.828/2005/readings/i386/s07_04.htm). Notice: in x86-64, it just use [stack](https://stackoverflow.com/a/25787369/21294350) to do the task switch as csapp says but also can use [TSS TODO](https://en.wikipedia.org/wiki/Task_state_segment#TSS_in_x86-64_mode). See [contents](https://wiki.osdev.org/Task_State_Segment) of TSS) <a id="TSS"></a>

        [Relation](https://xem.github.io/minix86/manual/intel-x86-and-64-manual-vol3/o_fe12b1e2a880e0ce-74.html#:~:text=Local%20Descriptor%20Table%20Register%20(LDTR,the%20linear%20address%20of%20byte) of three
      - kw: a problem arises when multiple operating systems try to use the *same* registers; 
      - [CPL 0](https://www.sciencedirect.com/topics/computer-science/current-privilege-level#:~:text=The%20current%20privilege%20level%20(CPL,for%20Windows%2Dbased%20operating%20systems.) implies *trap* but only to write not read which may "might see the state of a *different VMOS* executing within a VM".
        kw: its own virtual set
      - `SMSW`: `CR0` is "32 Bit version of the old *Machine Status Word*".
        ~~Same as~~ Similar to above 3 instruction, "would *incorrectly* see that the PE bit is set".
        "SMSW could be *removed*" because it "should not be used by *application* software." and "is a *system* instruction" although "This instruction is only provided for *backwards compatibility* with the Intel 286 processor". And it is substituted by [`mov`](https://docs.oracle.com/cd/E19455-01/806-3773/instructionset-109/index.html).
        kw: 286

        TODO view table 1 in pdf
      - `PUSHF`
        "flags that control the operating mode" -> [EFLAGS] IOPL.
        "in the *same* way that the SMSW instruction prevents virtualization"
    - 3.2 are all due to *privilege check*. And VMOS maybe *wrongly* thought of itself at privilege level 0 but it is at 3.
        - After all, it is still due to only one related segment register,etc.
      - `LAR`,etc., 4 instructions
        "The problem with all four ..." -> RPL,CPL,DPL [relation/privilege check](https://en.wikipedia.org/wiki/X86_memory_segmentation#Detailed_segmentation_unit_workflow)

        "are both greater than the descrip-tor privilege level" -> `max(CPL, RPL) ≤ DPL` in the above wikipedia link, only access lower level (i.e. bigger level number)

        *problem* is "*assume* that they are operating at the *highest* privilege" means wrongly access `DPL=0` when `CPL=3` -> wrongly `CPL>DPL` (Also see [`POP` "assumes it is in CPL 0"](#POP))
        - [`LAR` in felixcloutier](https://www.felixcloutier.com/x86/lar#description) scatters the access rights. Also [see](https://wiki.osdev.org/GDT#System_Segment_Descriptor) where describes "conforming code segment" (just means allowable *minumum* privilege levels) and ~~'valid' in "not valid for instruction" -> Present bit~~.
          - In the above felixcloutier, type and valid see [the table](https://www.felixcloutier.com/x86/lar#tbl-3-53)
            - In `LSL`, SegmentDescriptor(G) means [G bit](https://wiki.osdev.org/GDT#System_Segment_Descriptor) just as `SegmentDescriptor(Type)`.
              Here `OR 00000FFFH` can be ignored.
      - `POP` <a id="POP"></a>
        - Same as above, problems are incurred by *privilege check*.
      - `PUSH` problem similar to above: "*thinks* it is running in CPL 0"
      - 3.2.4
        - `CALL`
          - call gate which is [similar](https://en.wikipedia.org/wiki/Call_gate_(Intel)#Format_of_call_gate_descriptor) to other gates has been replaced by [SYSCALL](https://en.wikipedia.org/wiki/Call_gate_(Intel)#Modern_use)
            - similar to , when the call gate and task gate are not used, their infos are probably saved in the *kernel stack* just as csapp says. Also [see](#TSS)
            - when using "the call gate and task gate", the *stack* is still used with each task by "A task uses a different stack for every privilege level" and "saves procedure linking information to the stack".
        - `JMP`
          - "both the way that it executes and the reasons it prevents virtualization" -> [this](https://www.felixcloutier.com/x86/jmp#operation)
        - `INT n`
          - similar `call` except for ["the EFLAGS register is pushed onto the stack".](https://www.felixcloutier.com/x86/intn:into:int3:int1#description)
            - `n` is entry of [Interrupt vector table](https://en.wikipedia.org/wiki/Interrupt_vector_table)
            - "the software interrupt redirection bit map" controls the mode, see [intel_64] p3876
          - "protection system" -> "Segments have a descriptor privilege level (*DPL*)"
        - `RET`
          - kw:"cause the DS, ES, FS, and GS registers to not be cleared when they *should* be".
          - TODO `IRETD` may just means *context* Operand Size.
          - "nested task" is just unattached task (implies *interrupt* to synchronize) from ["AttachedToParent option."](https://stackoverflow.com/a/20048563/21294350)
        - kw:because they involve the CPL, DPL, and RPL
        - "CPL 3 task" -> from VMM view and "CPL 0 operating system" from VMOS's view.
      - `STR`
        - [task register](https://www.scs.stanford.edu/05au-cs240c/lab/i386/s07_03.htm) is 16-bit in 80386 which ["Loading the task register with the *selector* of the incoming task's TSS descriptor".](https://pdos.csail.mit.edu/6.828/2018/readings/i386/s07_05.htm)
        - "examine its requested privilege level (RPL)" which may be 3, then "will find that it is not running at the privilege level at which it *expects* to run."
      - [`MOVE`](https://www.felixcloutier.com/x86/mov-1)
        - load CS can be done in [`call` "the processor *pushes* the current value of both the CS"](https://www.felixcloutier.com/x86/call#description) as [this](https://www.felixcloutier.com/x86/mov#description) says.
        - TODO "CS and *SS* registers both contain the *CPL* in bits 0 and 1" may use RPL in [selector][Segment_Selector] just as [this](https://en.wikipedia.org/wiki/X86_memory_segmentation#Practices) says "segment selector held in the SS register."
        - same as before "VMOS is *expecting*-typically 0.".
- p472
  - "strategies" -> p446 replacement strategies
  - "same properties of locality" -> p366 two types
  - "do something when it is idle" -> maybe [prefetch](#prefetch).
  - write the full block -> not fetch but just overwrite the memory block.
  - TODO reread after 6.10
#### from here use [2nd book][COD_RISC_V_2nd]
- p xiii
  - [sext(offset)](https://msyksphinz-self.github.io/riscv-isadoc/html/rv64i.html#lwu) here means zero-extension although [riscv_spec] p36 (SEXT -> Sign-EXTension)
  - `addwi` -> `addiw` (i->immediate)
  - `sllw`: `ll` -> left logically. w->[word](https://passlab.github.io/ITSC3181/notes/Chapter02_Instructions_LogicBranch.pdf) and see [riscv_spec] p6.
  - [Dennard Scaling](https://en.wikipedia.org/wiki/Dennard_scaling) -> power/unit stay constant. "no longer hold," in p xvi.
  - spectre
    - "hardware multithreading" related with [spectre][spectre] because p10 "a separate thread was used to *mistrain* the branch predictor" and "*sharing* the branch predictor state"
    - ["Timing attack"](https://en.wikipedia.org/wiki/Timing_attack) just attacks by analysing "the time taken to execute cryptographic algorithms".
      see [spectre] p11, the timing just tells the attacker "the state of the cache" so that maybe the attacker can know whether he can get "register R1 contains a *secret* value". 
  - [“hyperscalers”](https://en.wikipedia.org/wiki/Hyperscale_computing) "*scale* appropriately as increased *demand*"
  - ["Row hammer" see the figure](https://en.wikipedia.org/wiki/Row_hammer#Overview): hammer -> "leaking their charges, *possibly changing* the contents"
  - Mitigation:
    - "SECDED" no use because error number may > 2 ("include *more than two* flipped bits").
    - "performs *counter*-based identification" and "*proactively* refreshes their neighboring rows" 
      or "*random* refreshes ... *neighboring* the accessed rows" ...
    - DRAM: "TRR" "*although* it is not part of the DDR4 memory standard"
      similar to above, refresh
      "if the sum of row activations for its two *neighboring* rows reaches the MAC limit within the tMAW time *window*."
      TODO "not effective in protecting against Rowhammer"
  - [TPU see 2nd figure](https://cloud.google.com/tpu/docs/intro-to-tpu#how_a_tpu_works) just uses multiple gpu as one *gpu pipeline*.
  - [TPU v4](https://cloud.google.com/tpu/docs/system-architecture-tpu-vm#tpu_v4) add two MXUs
    - TODO [this](https://semiengineering.com/googles-tpuv4-architecture-3-major-features/) references [this which says OCS](https://cloud.google.com/blog/topics/systems/tpu-v4-enables-performance-energy-and-co2e-efficiency-gains)
  - "re-virticalization" -> Cloud
- p xvi
  - TODO "updates all the examples and figures"
- p xvii
  - [resource website](https://inspectioncopy.elsevier.com/book/details/9780128203316)
  - ["President Hennessy"](https://hennessy.stanford.edu/biography/)
- p50
  - notice `numpy` is "highly optimized".
- p274
  - better see [this](#spec_instr_format) and [this](#SB_format)
- See [this](#understanding-program-performance)
- see [this](#hardwaresoftware-interface)
- see [this](#fallacies-and-pitfalls)
- see [this](#the-big-picture)
- see [this](#check-yourself)
- see [this](#Self-Study)
- p25
  - "Vacuum tube" used in [triode. See the 2nd figure](https://en.wikipedia.org/wiki/Valve_amplifier#Origins)
  - TODO read 1.13 Historical Perspective and Further Reading
  - *patterns* of chemicals are placed on each wafer (here "patterns" is just "smallest feature size" -> `nm` in  `7nm` meaning) <a id="cpu_die"></a>
- p27
  - why use dies: "cope with *imperfection* is to place many independent components" and "these components, called *dies*".
  - "the lower yield" because the denominator is larger when the numerator is almost unchanged.
- chapter 6 see [this](#chapter-6-in-cod-riscv-2nd)
##### TODO
- read 2.17,18
  2.21 is just in 1st edition 3.8.

  read 282.e14 to 282.e19 which is extension of C.3 .
#### appendix
##### A <a id="fast_carry"></a>
- p1187 why only `Binvert` used in overflow detection.
- p1178 here dot means $\&$, $+$ means $|$,see FIGURE A.5.5
- p1195 here `ALUop <=12;` should be `ALUCtl <=12;` [see](#ALUop)
  - `ALUOp` not related with `opn`
  - `input [ 5:0J FuncCode;` should refer to opcode, which can decide aluop, so should be `input [6:0] FuncCode;`
- p1198 $c4$ ~~explains~~ corresponds to $P0+G0$ in p1201 (which is similar to forwarding that skip some action to directly work), see 'FIGURE A.6.3'
  - p1205 lookahead is just *non-blocking* while ripple carry is blocking which is just same as [this 'takes a time delay',' without the wait for the preceding additions.','at the same time as soon as the input signal'](https://www.electricaltechnology.org/2018/04/ripple-carry-and-carry-look-ahead-adder.html)
    Also see [COD_RISCV_2nd_A_appendix] A-29
  - p1208 C4 -(2 gate dalays)> Pi and Gi ...(2) pi ...(1), so 2+2+1 <a id="level_abstraction"></a>
  - p1209 and [COD_RISCV_2nd_A_appendix]  [barrel shifter 'cycle the order of the bits ABCD as DABC'](https://en.wikipedia.org/wiki/Barrel_shifter#:~:text=A%20barrel%20shifter%20is%20a,inherently%20provides%20a%20binary%20operation.)
    
    Here "full crossbar" use $n^2$ gates -> the [figure](https://en.wikipedia.org/wiki/File:Crossbar_barrel_shifter.svg) symbol just means one switch. (implies *rotate n-bits*)
    TODO Also see [COD_RISCV_2nd_A_appendix] p? which has circuit where order is related.

    Because of the cost due to size, "crossbar shifters require however n2 gates" is used "instead" -> "growing only with n x log n".

    "a sequence of multiplexers" -> [this p3 circuit (it can be tweaked to be *cyclic* in p4)][shifter] and more [simplified](https://www.d.umn.edu/~gshute/logic/barrel-shifter.html). Also see [verilog](https://community.element14.com/technologies/fpga-group/b/blog/posts/systemverilog-study-notes-barrel-shifter-rtl-combinational-circuit)
    - [COD_RISCV_2nd_A_appendix] "FIGURE A.3.2" show logics of the *multiplexor* which has 2 gate delays.
    - [COD_RISCV_2nd_A_appendix] A-46 "no more time than it takes to add two 32-bit numbers" 
      (
      the latter is 5 gate latencies and 
      the former is either one multipler which is [$\log_2 n$](https://www.electronics-tutorials.ws/combination/comb_2.html) gate latencies (here just 5 same as the latter)
      or "cascade" then $4*cascade_level$ at least in [shifter] p4 (TODO this line; then *not* "no more time")
      )
- p1218
  - here [D flip-flop](https://www.electronicsforu.com/technology-trends/learn-electronics/flip-flop-rs-jk-t-d) just replace the `S,R` in Flip-Flop to `D,~D`.
  - p1219 very *direct* design of D flip-flop...
  - TODO ~~why hold time since data has been in first D latch.~~
    - here hold time is to ensure min_time [with setup time](https://www.realworldtech.com/overclocking-realities/2/). <a id="setup_time"></a>
      just as it says "acts like a camera that “*takes a picture*” of the value on the “D” input" -> So if no setup time, then maybe *capture one wrong state* (i.e. "If the D input *changes* state within this sampling window, then the Q output of the flip-flop is *undefined*").

      "sampled at the razor’s edge of decision between a “0” or “1” ... *metastability*" -> means input is changing between 0 and 1. See this [general](https://en.wikipedia.org/wiki/Metastability#:~:text=In%20chemistry%20and%20physics%2C%20metastability,a%20simple%20example%20of%20metastability.) or specific to [electronics "*unable to settle* into a stable '0' or '1' logic level *within* the time required for proper circuit operation"](https://en.wikipedia.org/wiki/Metastability_%28electronics%29)
      See [COD_RISCV_2nd_A_appendix] A-75 This also explains why "required setup and hold times"
      - [Example](https://en.wikipedia.org/wiki/Metastability_%28electronics%29#Example) is similar to race by "The final state will depend on which of R or S *returns to zero first*, if both transition at about the same time, the resulting metastability" -> "metastability" just means neither 0 or 1 which is similar to high-impedance but it will go to 0/1 while high-impedance not.
      - [Arbiters](https://en.wikipedia.org/wiki/Arbiter_(electronics)#Asynchronous_arbiters_and_metastability) decides the output of metastability by "Classical arbiters ... to *decay* from a meta-stability as rapidly as possible" (i.e. default outputs `0`) or others. -> [COD_RISCV_2nd_A_appendix] A-76 "where some logic blocks reading the output of the flip-flop see a 0 *while others* see a 1."
      - solution: "wait long enough" in [COD_RISCV_2nd_A_appendix] A-76 (i.e. [this "simply *delaying* the input signal (data0)"](https://en.wikipedia.org/wiki/Metastability_%28electronics%29#Synchronous_circuits))
        "decreases exponentially," -> probability theory.
        "clock rate is longer than the potential metastability period ... *two* D flip-flops" -> period between "two" edges is enough to cover "metastability period".
        Compare "FIGURE A.11.6" with "FIGURE A.8.4" ~~where the former has almost no delay to ~~: better see this [figure](https://en.wikipedia.org/wiki/File:Metastability_D-Flipflops.svg) where metastable *can't drive* the output which cause the read has *more delays* which needs two cycles instead of one cycle (here default reset is `0`).

        "*not be seen by any other logic* element until the second clock" -> "need only be provided when transferring data between *different clock domains*", So just think the two D flip-flops as *one whole element*.

      "Other than this *short sampling window*, ... will continue to *drive the last captured value* out on the Q output" because *edge*-triggered.
      "insensitive regions are shown in Figure 2 as *gray bars*"
    - notice here `not gate` [location](https://electronics.stackexchange.com/questions/543323/analysis-of-two-d-flip-flop-designs-based-on-d-latches/544027?newreg=9ec75f45a4204faa95478a108b3916ba) which influences 'the inverter delay' is important.
    - the book says 'sampled on the clock edge' similar to ['the data propagates to the output'](https://vlsiuniverse.blogspot.com/2016/10/latch-principle.html)
      - [Transmission gate 'Transmission Gate Truth Table'][Transmission_gate] which shows the truth table is better than [this wikipedia](https://en.wikipedia.org/wiki/Transmission_gate)
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
  better see [this](https://stackoverflow.com/a/38516544/21294350) `ordered = (x>y) | (x==y) | (x<y);` just means *normal* comparison -> normal.
  while NaN can't be compared -> unordered -> unordered comparison checks if *either* operand is a NaN (i.e. allow compare NAN, see [this](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html?highlight=equ#floating-point-comparisons-floating-point-operators-nan)).
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
  also see [riscv_spec] p17 <a id="spec_instr_format"></a>
  - U-Format -> lui to load [32-bit](https://stackoverflow.com/questions/50742420/risc-v-build-32-bit-constants-with-lui-and-addi) constant, see 1 'jal         ra,0x10418 <printf>'
  - SB-Format used ‘for small, local jumps.’ because of 13-bit offset, see 1
    - [why](https://stackoverflow.com/questions/58414772/why-are-risc-v-s-b-and-u-j-instruction-types-encoded-in-this-way) this weird encoding, [BL7(berkeley lecture 7) p46](https://inst.eecs.berkeley.edu//~cs61c/resources/su18_lec/Lecture7.pdf) where inst is ‘instruction’ which is also referenced in the link 'used to store bit 11 of the SB-Format immediate' <a id="SB_format"></a>
      - keyword: 'sign extension hardware' which is also referenced in BL7 and [riscv_spec].
      - TODO: 'wiring the input bits', 'datapath sized wiring', 'two or so (1-bit) wires and one 1-bit mux and a 1-bit control signal'
  - more detailed why format defined as what it is, based on [riscv_spec] and greencard
    - p17 all keep 31~25 where not conflict with register. Because `load` is from mem to reg, `store` is from reg to mem (so no `rd`) and `jmp` will store pc+4. 
      - Then UJ to be similar to U and B, 'inst[19:12]', 'inst[30:25]' and 'inst[31]' has been put in the slots and based on [‘immediate bit 1’](https://stackoverflow.com/questions/39427092/risc-v-immediate-encoding-variants), bit 24-21 also are put. (TODO )
- [why](https://stackoverflow.com/questions/62807066/riscv32-vs-riscv64) RV64I
- why [pc+4](https://stackoverflow.com/questions/63904609/why-program-counter-in-risc-v-should-be-added-by-4-instead-of-adding-0-or-2) because instruction length
- TODO here [jalr](https://stackoverflow.com/questions/53036468/what-is-the-definition-of-jal-in-risc-v-and-how-does-one-use-it) maybe just indirect, not return always
#### [registers](https://en.wikichip.org/wiki/risc-v/registers),see this more [specific](https://msyksphinz-self.github.io/riscv-isadoc/html/regs.html) which is from manual chapter 25
- [global](https://five-embeddev.com/quickref/global_pointer.html) pointer function like base pointer related with 'Global variables'
- [thread pointer](https://www.indes.com/embedded/en/news/2020/12/450_Code_size__Closing_the_gap_between_RISC-V_and_Arm_for_embedded_applications/) (see link 'second global base','the model for the thread pointer') only used in 'thread-local' (thread [share](https://stackoverflow.com/questions/1762418/what-resources-are-shared-between-threads) (also see csapp)) 
- [alternate link register](https://stackoverflow.com/questions/44556354/jal-what-is-the-alternate-link-register-x5-for) ('clobber the link register') used in [Millicode](https://en.wikipedia.org/wiki/Millicode) with [prologue and epilogue](https://en.wikipedia.org/wiki/Function_prologue_and_epilogue)
  - pdf link [1](https://escholarship.org/uc/item/7zj0b3m7#page=59) or [2](https://news.ycombinator.com/item?id=19165301)
- here [saved](https://stackoverflow.com/questions/64545005/which-registers-are-saved-and-not-saved-in-risc-v) (similar to x86-64 design) is related with **callee**
#### manual interpretation
- p21 jalr still use multiple of 2 bytes by [&∼1](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#jalr), 
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
    - here based on angle [doc p109](../references/microarchitecture.pdf), 'multiple' should be 'two' and Micro-op is just 'read/write' action,etc.,while [Macro-op](https://en.wikichip.org/wiki/macro-operation#:~:text=In%20their%20context%2C%20macro-operations%20are%20a%20fixed-length,%2C%20modify%2C%20and%20write%20operation) is instruction
    - [TODO](https://easyperf.net/blog/2018/02/15/MicroFusion-in-Intel-CPUs)
- Macro-Operation Fusion example [cmpjne](https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(client)#Instruction_Queue_.26_MOP-Fusion) (notice: this instruction is not available in ISA set)
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
        - `USWC` -> [Uncacheable by L1 cache](https://stackoverflow.com/questions/75224657/memory-type-wb-vs-uswc-of-memory-mapped-files-on-x86),etc.
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
      - [LLC](https://en.wikichip.org/wiki/last_level_cache) probably ["shared L3 cache"](https://cvw.cac.cornell.edu/ClusterArch/LastLevelCache) which is prior to fetching from *memory*.
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
~~- how '1536 PTE' and '128 PTE',etc.,are indexed TODO.~~
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
        - [grub](https://en.wikibooks.org/wiki/X86_Assembly/Bootloaders#GNU_GRUB) use 'Two-Stage' because by convention ['the last word of the sector must contain the signature 0xAA55'](https://en.wikibooks.org/wiki/X86_Assembly/Bootloaders) ([Single Stage](https://wiki.osdev.org/Bootloader#Single_Stage_Bootloader) is small)
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
  - ['strip-mined vector loop'](http://physics.ujep.cz/~zmoravec/prga/main_for/mergedProjects/optaps_for/common/optaps_vec_mine.htm) same as csapp ~~unloop~~ loop unrolling. <a id="strip-mined"></a>
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
            - From paper_2 which is referenced by paper_1, it defines 'Memory *Consistency*' related with synchronization. So it means 'when a written value must be *seen*' as [COD_Orig][COD_RISC_V_Orig] p458 says.
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
#### [Reference Appendices][CAAQA_companion] where also has other resources.
#### TODO
- A *vertical cut* of a thread of SIMD instructions
### miscs
- why use [L3$](https://softwareengineering.stackexchange.com/questions/108340/why-is-the-dollar-sign-used-to-abbreviate-the-description-of-a-cache)
## Understanding Program Performance
- p9
  - "architecture" influences the ISA which may has internal barrier like intel x86-64.
  - "operating system" at least offer virtual memory and syscall which may influence the performance. p13 defines *ABI*.
- p33
  - throughput is related with elapsed time ([inverse proportion](https://stackoverflow.com/questions/49552745/how-throughput-and-response-time-are-related))
    - bottlenecks
      - p296 TODO "involving more use of pointers" -> branch pointer.
        loop unroll and rescheduling by compiler/OoO by hardware "for reducing data dependences". <a id="code_scheduling"></a>
      - p362 "memory hierarchy" ~~implies miss penalty.~~ can use prefetch ["keeping as much of the data needed in the *near future* as *close* to the processor " p11](https://dspace.mit.edu/bitstream/handle/1721.1/87163/46805825-MIT.pdf?sequence=2)
      - p479.e5 "spread" to increase throughout.
      - p514 Chip multiprocessors (CMPs) 
- p39
  - TODO how to avoid "uses more divides"
  - "indirect calls" -> [p62 use table](https://www.eecis.udel.edu/~cavazos/cisc471-672-spring2018/lectures/Lecture-24.pdf) to index variable in class.
- p147
  - CPI [lower -> better](https://cs.stackexchange.com/questions/141795/does-higher-cpi-give-better-performance#:~:text=CPI%20%3D%20cycled%20per%20instruction.,So%20it's%20worse.).
- p295
  - multiple-issue pipelined see [this](#multiple_issue)
  - [control hazard](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/handling-control-hazards/index.html) also avoid OoO in some way ("cannot be moved in front of" and "so that the branch controls").
    - kw: basically two ways;  
  - "not be fully pipelined" -> [this](#pipelined_fp)
  - ["Register renaming"](https://en.wikipedia.org/wiki/Register_renaming) -> <a id="Register_renaming"></a>
    1. mapping from "logical registers" to *physical* registers.
    2. just using *another logical* register. (This is compiler-based)
      In [this](https://en.wikipedia.org/wiki/Register_renaming#Data_hazards), WAR where R use "old value" which may in one register and W writes with "the new value".
      Just use [more registers](https://www.d.umn.edu/~gshute/arch/register-renaming.html#:~:text=Register%20renaming%20is%20a%20form,in%20the%20instruction%20set%20architecture.) to avoid the data dependency.
  - "different implementations of the same instruction set" just see amd and intel differences / different implementations of riscv.
- p362
  - "aggressive multiple issue" -> use [*other threads*'s FU p2](https://www.ece.mcmaster.ca/faculty/teds/COURSES/4DM4-folder/COURSE_NOTES_folder/L23-4DM4-ADVANCED-PIPELINING-MULTI-THREADING-2013-2pp.pdf)
  - TODO ["back-to-back operations"](https://en.wikipedia.org/wiki/Control_unit#Translating_control_units) may mean latency between "issues the *micro-operations*".
- p351
  - "pipeline latency and issue width" depends on the cpu hardware (The former may depends on fp hardware and the latter may depend on op cache and dispatcher,etc ([this](https://news.ycombinator.com/item?id=25258985) referenced zen2 wikichip which says "8 macro-ops per cycle to the *micro-op queue*") ). 
- p425
  - TODO comparison of "Sorting and *so on*"
  - The "cache miss" caused the "the Radix Sort line diverges" in some way. -> "*ignores* the impact of the memory hierarchy"
- p151
  - the left must has the `p+=4` -> `p+=i*4`, this “multiply” is the overhead. <a id="avoid_mul"></a>
- TODO 151.e16 learn bytecode
### p151.e
#### 1
- "interleaving with another pass." maybe just similar to pipeline.
#### 2 
- "The Front End" is just what [bison](#bison) and flex do.
- "intermediate representation" is just one *simple initiated* machine codes.
- "virtual registers" may be just *comments* like `tmp87` in the `gcc -S -fverbose-asm`
  Also [see "overlapping live ranges" and "the *infinite* number of virtual registers and fixed number of physical registers"](https://llvm.org/devmtg/2014-10/Slides/Baev-Controlling_VRP.pdf)
#### 3
- FIGURE e2.15.2 [factor](https://www.sigmdel.ca/michel/program/delphi/parser/parser1_en.html) can be thought as *constant* used in *calculation*.
#### 4 <a id="Local_Global_Optimizations"></a>
- [this Loop Interchange example](https://www.cita.utoronto.ca/~merz/intel_c10b/main_cls/mergedProjects/optaps_cls/common/optaps_perf_optstrats.htm#:~:text=Loop%20Interchange%20is%20a%20nested,loop%20to%20improve%20cache%20locality.) may be redundant because after Interchange both `c` and `a` lose locality.
- "blocking loop" is just cache blocks as chapter 5. 
- ["common subexpression elimination" just avoids duplicate calculation `b * c`](https://en.wikipedia.org/wiki/Common_subexpression_elimination) <a id="optimizations"></a>
- ["Constant propagation"](https://en.wikipedia.org/wiki/Constant_folding#Constant_propagation) just calculate constants beforehand.
- ["copy propagation"](https://en.wikipedia.org/wiki/Copy_propagation) just removes "direct assignment" like `x = y` in some way.
- [Dead Store Elimination](https://cran.r-project.org/web/packages/rco/vignettes/opt-dead-store.html#:~:text=Dead%20Store%20Elimination%20is%20an,read%20by%20any%20subsequent%20instruction.&text=After%20applying%20other%20optimizations%2C%20such,some%20variables%20become%20dead%20stores.&text=And%20thus%2C%20n%20would%20become%20a%20dead%20store.) just remove *seemingly* unused store by *local* data dependency.
  - free [not resets](https://stackoverflow.com/questions/11239707/why-are-the-contents-pointed-to-by-a-pointer-not-changed-when-memory-is-dealloca) data. So [this "Dead Store Elimination"](https://www.usenix.org/sites/default/files/conference/protected-files/usenixsecurity17_slides_zhaomo_yang.pdf) which removes the `memset` may leak the data.
  - TODO read [free](https://github1s.com/bminor/glibc/blob/master/malloc/malloc.c#L3346-L3347) source codes.
- ["strength reduction"](https://en.wikipedia.org/wiki/Strength_reduction#) just use simpler operation (multiplication -> addition and "replacing *exponentiation* within a loop with a multiplication",etc.)
  - see 5 "shift left."
#### 5
- here `0(r103)` stores `x[i]`
- "dead code" (means ~~*never* run~~ [not used](https://en.wikipedia.org/wiki/Dead_code#:~:text=In%20some%20areas%20of%20computer,wastes%20computation%20time%20and%20memory.)) due to [macros, templates](https://stackoverflow.com/questions/48209595/ignore-dead-code-warnings-in-c-c) because it not knows the type of variable (maybe *const*.) <a id="dead_code"></a>

  TODO somewhere in this doc say elimination of "dead code" may have detrimental influences.
#### 6
- "conservative." just as csapp says.
- "allocate a variable to a register" because of thinking its [*liveness* "cannot be in the same register wherever their *live ranges overlap*"](https://www.cs.cmu.edu/~fp/courses/15411-f13/lectures/03-regalloc.pdf) is long.
  1. "the absence of side effects by a function call." -> may avoid pushing some variable to stack which won't be changed during the call before the call.
  2. "the absence of aliasing between two pointers" -> allow above [optimizations](#optimizations), see [this](https://stackoverflow.com/questions/52399590/is-there-a-way-to-tell-the-c-compiler-that-a-pointer-has-no-aliasing-stores) where `read_array(arr);` interferes the optimization where it may increase the reference count of `p` and change its value and the [`restrict`](https://www.geeksforgeeks.org/restrict-keyword-c/) tells the compiler of "the absence of aliasing".
- "pointer code" may be unoptimized due to not knowing the above *2 absences*.
- ["Code motion" / code hoisting](https://en.wikipedia.org/wiki/Code_motion#Uses) <a id="loop_invariant_optimization"></a>
  Also [see p4](https://llvm.org/devmtg/2016-11/Slides/Kumar-Pop-GVNHoist.pdf)
  "Removing unused/useless operations" which exists with *one branch* but not the other "moving instructions to branches in which they are used".
  "Code Factoring": "*merges* common dependencies" which is just opposite of the first. This is similar to ~~vscode~~ [Refactoring](https://code.visualstudio.com/docs/editor/refactoring#_refactoring-actions)
  "code scheduling" is just as [COD_RISC_V_2nd] book [says](#code_scheduling) to avoid dependency penalties.
  `D` is "Loop-invariant"
- ["Induction-Variable Elimination"](https://www.javatpoint.com/loop-optimization#:~:text=Induction%20variable%20elimination%20is%20used,space%20and%20run%20time%20performance.) is similar to [this](#avoid_mul) just as the [COD_RISC_V_2nd]
#### 7
- Local Optimizations
  - 2,3 "Replace all uses of R106" -> common subexpression elimination.
  - 4 "*now* have the same input operand" -> e.6"Copy propagation ... such as common subexpression elimination"
  - 5 is similar to 4.
  - "two instances of an operand" -> something like `r101` and `r107` for `i`.
- Global Optimizations
  - "an IR statement like add Rx, R20, R50." -> IR just use *virtual register* which is different from the last machine codes.
  - 1. whether values of same register are "identical" which decides whether "*common* subexpression" in different "basic blocks".
  - 2. "whether its value is used again" by "*common* subexpression elimination and copy *propagation*" decides whether it is ok to eliminate the "dead code".
  - 3. whether "the load of k is loop invariant".
#### 8
- [control flow graph](https://en.wikipedia.org/wiki/Control-flow_graph#:~:text=In%20computer%20science%2C%20a%20control,matrices%20for%20flow%20analysis%20before.)
- "use-definition information" and "definition-use information" see [def_use llvm doc][def_use] referenced by [this](https://labs.engineering.asu.edu/mps-lab/resources/llvm-resources/llvm-def-use-use-def-chains/)
  - although [wikipedia](https://en.wikipedia.org/wiki/Use-define_chain#Definition_of_a_Variable) says "consists of a use, U, of a *variable*", the User may be always Instruction as above [def_use] says which may have multiple defs with multiple operands each.
    Also see [def-use chain example](https://serge-sans-paille.github.io/pythran-stories/gast-beniget-use-def-chains-for-python-programs.html#about-use-def-chains) which is just map from one def to multiple uses.
  - llvm
    Value -> "such as Constants, Arguments" which is the most higher [parent class](https://llvm.org/doxygen/classllvm_1_1Value.html)
    [Static Single Assignment (SSA)](http://www.cs.cmu.edu/afs/cs/academic/class/15745-s06/web/handouts/ssa15745.pdf) just means assign [index p3](http://www.cs.cmu.edu/afs/cs/academic/class/15745-s06/web/handouts/ssa15745.pdf) to each variable (i.e. only ["one definition referred to"](https://llvm.org/docs/ProgrammersManual.html#user)) so that ["each variable to be assigned exactly *once*"](https://en.wikipedia.org/wiki/Static_single-assignment_form)
- here just use "sequential fall-through" to replace `jal x0 loop` <a id="fall_through"></a>
#### 9
- Since using SSA, def in `def-use` just means "definitions (changes)".
- "no definitions (changes) of the operands" because the dest regs are all different.
  1~6 move out of the loop except for `lw r5, 0(r4)` where `r4` is changed ~~in the loop body~~ with `i` ("Hence, this statement is *not loop invariant*.").

  "induction variable elimination" -> `slli r5, r4, 2` (where `lw r4, i`) to `addi r4, r4, 4` (where `r4` is inited as `save[i]` in the first block in FIGURE e2.15.5)
- "the variable k and the variable i actually refer to *the same memory location*" is also said in csapp.
  This is just "aliasing".
- erratum
  - "in statement 10 where it is stored" -> 9
  - `addi r7, r6, 1` -> `addi r7, r2, 1` where `r2` is `i` and later `sw r7, i` to store to `i`.
#### 10
- "load-store architectures" / register-register architecture is specific to RISC and CISC allows [mem-reg -> reg / mem-mem](https://www.geeksforgeeks.org/computer-organization-risc-and-cisc/) (i.e. register-memory architecture). Also [see wikipedia](https://en.wikipedia.org/wiki/Load%E2%80%93store_architecture#See_also) and [this lecture](https://cs.colby.edu/courses/F20/cs232/notes/9.ISA(II).pdf) (load/store is *between* reg and mem just as wikipedia says) <a id="CISC"></a>
  Also see [chap_2_24] 174.e2.
- "The process": 1~2 -> def-use chain (here just use reg like `r4` as src but not dest); 3 use-def chain (here may use something like `add r4,r4,4` to modify original def of `r4`); 4 iteration.
- TODO [interference graph](https://users.cs.northwestern.edu/~simonec/files/Teaching/CC/slides/Interference_graph.pdf)
  - p8 ~~what is~~ here probably `r10` is used by before p7, so better not interfere with that -> use other regs like `rcx`.
  - p12 see reg allocation before call and after call returns.
- "interference graph" and "graph coloring"
  - [register_allocation_18] is good.
    - p22, see p25 and the counterpart p26,p32, then all is obvious with **interference graph** with coloring.
      p29 just whether use p23 "subscript" and "distinguishes between different live ranges"
    - p36 what if color number is *too low*.
      remove then add back. see p37~44
      p45 may fail if neighbours are too many (here all 4(K+1) has K neighbors).

      Then results in "Graph surgery" p51 -> *spill* to mem.
    - p50 empty graph caused by *all* "nodes with < K edges"
    - p55 [activation record](https://pages.cs.wisc.edu/~horwitz/CS701-NOTES/5.REGISTER-ALLOCATION.html) means mem (at least anything that is not reg ).
    - p57 although [this](#CISC), x86 has [no mem-mem instruction](https://stackoverflow.com/questions/52573554/what-x86-instructions-take-two-or-more-memory-operands).
      "Must run register allocation *prior to* instruction selection" maybe means ["Instruction selection" p10](https://www.eecis.udel.edu/~cavazos/cisc471-672-spring2018/lectures/Lecture-20.pdf) are also done partly in ["Instruction scheduling" p1](http://www.cs.cmu.edu/~745/lectures/reg_alloc.pdf)
    - p59 since "RISC" needs reg-reg, so spill may be not allowed.
      Then p60 "Spare registers"
      p61 may be not applied to RISC. 
    - TODO p67~68 should add one v5-5 to overlap with v1~3.
    - p74,76 spill with *split* just let each loop *independent* and no need to refresh which will occurs if all *sharing* one mem. Also [see](#split)
    - See p79~91 K-coloring with each nodes >= K edges.
    - p93 "Coalescing" just copy propagation. <a id="Coalescing"></a>
    - TODO p35 NP-complete
  - also see [this](https://courses.cs.washington.edu/courses/cse501/01wi/slides/slides.02-23.pdf) "not reflexive" because of the graph internal property (just view the graph).
  - not to read [this](https://users.cs.northwestern.edu/~simonec/files/Teaching/CC/slides/Interference_graph.pdf) which split the contents to other pdf like 'Spilling.pdf' in p38
- Also see [this](https://www.cs.cmu.edu/~fp/courses/15411-f13/lectures/03-regalloc.pdf)
  TODO 4. [Chordal Graphs](https://en.wikipedia.org/wiki/Chordal_graph) usage.; 6. 
#### 11
- "Spilling is equivalent to splitting up a region" just split *partly* to use register as more as possible. <a id="split"></a>
  - "The location *chosen* to split a region" explains why [register_allocation_18] p69 "*reduces* number of instructions that are needed to load (store)" because the mem reference is *not needed to span all* the `v5` live range.
- here drop load and store of `i`, so "dropped to only four from six" because `i` is just temp var which is not needed to store to mem too many times. And because "i were *unused* after the loop", " the increment inside the loop could be eliminated" -> drop `addi x12, x12, 1`.
#### 12
- "aliasing" may cause soemthing like [Coalescing](#Coalescing) but not obvious like `v3 = v2`. It may be `v1=*arg1,v2=*arg2` but `arg1,arg2` may be same as *input* of the function.
- ["symbolic values"](https://www.sciencefriday.com/educational-resources/write-your-name-in-binary-code/) -> just map symbol to binary.
- ["simple architectures"](https://www.cs.umd.edu/~meesh/411/CA-online/chapter/instruction-set-architecture/index.html) like RISC just consists of the *most basic* instructions.
- [parser](#parser) just match combination of tokens which is just what parser should do.
  - TODO the inner idea of "tree-based pattern matcher" should be same as parser.
    similar to FIGURE e2.15.2.
- TODO different computers [may](https://groups.google.com/g/r-inla-discussion-group/c/qkoV9ZtA1Wo) generate different results. Also see ["using the mathematics of the target machine"](https://en.citizendium.org/wiki/Constant_folding)
  - Constant folding Also [see](https://www.codingninjas.com/studio/library/constant-folding-in-compiler-design) (i.e. *precalculate* the constant.)
- "localized instruction scheduling" see [COD_RISC_V_2nd] p345 FIGURE 4.71 and the following figure.
- ["Straight-line code"](https://www.pls-lab.org/en/Straight-line#:~:text=One%20could%20say%20that%20straight,doesn't%20seem%20precise%20either.) which obviously excludes branch. <a id="Straight_line_code"></a>
- "Stack height reduction" may be similar to "Tree Height Reduction" which increases [ILP](https://en.wikipedia.org/wiki/Instruction-level_parallelism) obviously.
- shift has a little big [penalty](https://news.ycombinator.com/item?id=2962785) on Arm Cortex-A9 and even more on PS3,etc., especially for variable-shifts and reg-shift.
- the offset is at least [dependent on processor](https://stackoverflow.com/questions/76287548/why-is-there-a-connection-between-branch-prediction-failure-and-rep-ret-in-the) where `ret` should be checked whether it is at the odd location and "follows another branch , they will *share a branch selector*".
  TODO how "Choose the shor test branch"
- local Optimization example see e5.
- "so general that they aren’t fast" -> [`loop`](https://www.felixcloutier.com/x86/loop:loopcc) only for `count!=0` which is obvious not for some more common case like `i<NUM;i++`
  - "an option" may be like `ZF` referenced above. 
#### 13
- TODO [interprocedural analysis IPA](https://groups.seas.harvard.edu/courses/cs252/2011sp/slides/Lec05-Interprocedural.pdf)
  - [CFG Control-flow graph](https://en.wikipedia.org/wiki/Control-flow_graph)
- TODO [Flow-Insensitive](https://www.cs.cornell.edu/courses/cs711/2005fa/slides/sep13.pdf) -> ["ignores the flow of control in a program"](https://pages.cs.wisc.edu/~fischer/cs701.f14/7.POINTER-ANALYSIS.html)
- TODO [may-information](https://www.cs.utexas.edu/users/lin/cs380c/handout12.pdf)
#### 25
- TODO reread after c++ primer.
## Hardware/Software Interface
- p43
  - "third rail" means that it is better to comform to the "rail" (i.e. how hardware is parallel) (2nd [definition](https://www.collinsdictionary.com/us/dictionary/english/third-rail#:~:text=If%20you%20refer%20to%20something,is%20to%20commit%20political%20suicide.)).
    - or means it may ["electrocution"](https://en.wikipedia.org/wiki/Third_rail#) (i.e. failure)
      See [this](https://en.wikipedia.org/wiki/Third_rail_(politics)) "political suicide" and "result in electrocution"

      So "explicitly parallel programming" means "rewrite their programs to be parallel".
- p76
  - better see [this](https://en.wikipedia.org/wiki/Endianness) "stores the least-significant byte at the smallest address" and also see this [example](#little_endian)
  - from [riscv_spec] p6, should be "*8* bytes in a doubleword"
- p93
  - "design principle that smaller is faster" -> larger memory is slower than smaller registers.
- p101
  - "basic block" is similar to [Straight-line code](#Straight_line_code)
- 103
  - "statements for decisions" -> `if`,etc. <a id="decisions_and_loops"></a>
- 110
  - [auto](https://www.geeksforgeeks.org/storage-classes-in-c/) is default -> just [random values](https://stackoverflow.com/questions/15326611/how-garbage-values-are-assigned-to-variables-in-c#comment115456392_15326621) which may result from [stack](https://stackoverflow.com/questions/15326611/how-garbage-values-are-assigned-to-variables-in-c#comment21642064_15326611).
  - view "/mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/static" `static.c` is same as `no-static.`
    ```bash
    $ id2c \      
    "objdump_base -d /mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/static/static.o" \
    "objdump_base -d /mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/static/no-static.o" 
    ```
- p121
  - "enhanced language of the *assembler*" help "break large constants into pieces" and "memory addresses".
- p124
  - use "unconditional branch" to change *far* branch to near.
- p151.e24 TODO reread after learning JAVA.
  Maybe just jave virtual machine helps "error checking and code reuse" (reuse error checking codes) by "testing for null object references and index out-of-bounds error".
  "Load method table" (which is chained load with "Get method address") is similar to virtual method table in cpp.
- p206
  - [Divide Overflow](http://www.c-jump.com/CIS77/MLabs/M11arithmetic/M11_0130_divide_overflow.htm) is checked by the magnitude [relation](https://www.geeksforgeeks.org/division-algorithm-in-signed-magnitude-representation/) of divisor and dividend ("what if the divisor is *greater than or equal to* the dividend". Here "equal to" not overflows)
- p225
  - "all sized operands in registers into a single internal format." just combines data like avx(512) to [manipulate str](https://lemire.me/blog/2022/09/14/escaping-strings-faster-with-avx-512/).
- p273
  - "R Format: Arithmetic" and "I format" are for MIPS.
  - "FIGURE 4.17" also see [this](#rformat)
    Here just *shift left* with S in "Cond. Branch",so overlap is less.
- p339
  - "hardware failure" like "segmentation fault". (vs [page fault](https://stackoverflow.com/questions/6950549/segmentation-fault-vs-page-fault) "illegal condition" and "perfectly normal")
    similar to csapp says.
- p350
  - "pipeline hazard" just disallow OoO.
  - ["true data dependence"](https://www.ida.liu.se/~TDTS08/labs/vliw/dependencies.html) -> RAW; it can be solved by [this](#Register_renaming)
  - "output dependencies": here only 1,2,4 instruction is write which are related with *output dependencies* and their dests aren't same -> no output dependencies.
    - "the first and second iterations." -> csapp critical path.
  - "name or data dependence": name -> reg while data -> variable where the former changed more frequently.
- p352
  - 1. implicit dependences due to "aliasing" cause stall -> failure of "*sustaining* that issue rate". <a id="compiler_anti_aliasing"></a>
    But "greater regularity of array accesses" implies "no dependences exist".
  - 2. "branches" 3. "widely separated" ILP 
    4. "losses in the memory hierarchy" 4.1. "limited amounts of ILP" 
- 438
  - [EC2](https://en.wikipedia.org/wiki/Amazon_Elastic_Compute_Cloud)
- 449
  - only track the first access but not the count. [See](#reference_bit)
## Fallacies and Pitfalls
- p170
  - "repeat the subsequent instruction" -> [`F3`](https://en.wikipedia.org/wiki/X86_instruction_listings#cite_note-25) or [intel_64] p1776
  - ~~TODO~~ "new releases of operating systems" at least C++ standard may [change](https://en.wikipedia.org/wiki/Linux_kernel_version_history#cite_note-32)
    "recent computers": at least segmentation used before has been unused now and "more instruction set architectures." 
    TODO [unnamed namespace](https://stackoverflow.com/questions/25724787/static-functions-outside-classes)
    static just "external linkage" (i.e. access by other files).
    "better declared in a header"
    [Translation unit](https://en.wikipedia.org/wiki/Translation_unit_(programming)) in [this](https://stackoverflow.com/questions/572547/what-does-static-mean-in-c#comment45074783_572547) -> "a source file" which "has been processed by the C preprocessor".
    - "declared outside all procedures are considered *static*" -> so needs `extern` to share between files.
### chapter 6
- 1
  - "*linear* speed-up with 1000 processors" breaks the "Amdahl’s Law" limit that can't 100% improvement.
  - [Amdahl_1967]
    - [Data Housekeeping](https://www.hometowntech.com/post/data-housekeeping#:~:text=Data%20Housekeeping%20is%20the%20process,it%20to%20run%20more%20efficiently.). This is just "sequential processing rates" in the book.
    - "Amdahl’s Law obviously applies to parallel processors" but the influence may be offseted by "the rest was fully parallel".
      So it should "to run larger problems" which can imply using *multiple processors*.
      - one [category](https://en.wikipedia.org/wiki/Parallel_computing#Massively_parallel_computing) of parallel processor is "single computer with many networked processors" which is just what category TPUv3 is in.
- 3
  - "a single lock" which is software inhibits "an OS kernel that allows *multiple threads*"
    "the lock still serializes all the jobs" because "program" read the page table although it shouldn't cause one expensive lock since it doesn't write.
- the last
  See original paper [hill2020] 
  - "microarchitectural “bread-crumbs” of a supposedly hidden secret" means "*cache contents*) can survive nominal state reversion" in [spectre_origin_arXiv]
    Also see p7 "leave measurable side effects"
    - [FLUSH_RELOAD]
      - [""content-aware" sharing"](https://www.gartner.com/en/information-technology/glossary/content-awareness#:~:text=The%20ability%20to%20determine%20what,in%20use%20or%20in%20transit.) just means knowing *infos related* with file, etc.
      - ["De-duplication"](https://www.druva.com/glossary/what-is-deduplication-definition-and-related-faqs#:~:text=Deduplication%20refers%20to%20a%20method,to%20identify%20duplicate%20byte%20patterns.) just literal meanings.
        - "copy-on-write" page sharing is just as csapp says.
        - ["OS fingerprinting"](https://www.firewalls.com/blog/security-terms/os-fingerprinting/) -> analyzing data packets
        - [`=/+`](https://gcc.gnu.org/onlinedocs/gcc/Modifiers.html)in `asm`
          - `"a"` means [`eax`](https://www.felixcloutier.com/documents/gcc-asm.html#examples) but not [addr](https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html#index-other-register-constraints).
            Also see [x86 "The a register."](https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html)
          - [`%0`](https://www.felixcloutier.com/documents/gcc-asm.html#constraints) is probably the *output* because of its *order*.
        - [`CLFLUSH`](https://www.felixcloutier.com/x86/clflush) only flush one *specific addr*.
      - The main idea of attack is
        See p7 "For example, be-tween time slots 3,917 and 3,919 the victim was calcu-lating a square" -> based on cache hit/miss time, attacker gets *what code block* is runned. 
        Then p8 it gets the *running sequence* 
        and then "Sequences of Square-Reduce-Multiply-Reduce indicate a set bit" -> get bit ~~patterns~~ se-quence.
      - notice: "Figure 6" implies flush-probe sequence and "Figure 4" is only *probe* which flush the data at the *input addr* at the end (line 14)
      - Mitigation solutions <a id="FLUSH_RELOAD_Mitigation"></a>
        - [ ] means not recommended
        - [x] means recommended
        - hardware 
          - [ ] change `clflush` instruction 
        - software 
          - [ ] preventing sharing
            - [x] better only to "sensitive code"
          - [x] "disabling page de-duplication"
          - [ ] Re-ducing the resolution of the clock
    - " in user pro-cesses from accessing *kernel* memory, the attack will stillwork"
      See [this](https://cyber.wtf/2017/07/28/negative-result-reading-kernel-memory-from-user-mode/): mainly also based on "last two instructions are executed *speculatively*" Then cache stores the data "differs depending on the value *loaded from somekerneladdress*".
    - ["orthogonal" techopedia](https://www.techopedia.com/definition/16420/orthogonal#:~:text=Orthogonal%2C%20in%20a%20computing%20context,are%20perpendicular%20to%20each%20other.) just means independent ("without considering its after-effects", "two things vary from each other independently"). <a id="orthogonal"></a>
      This is same as [wikipedia definition](https://en.wikipedia.org/wiki/Orthogonality_(programming))
      - "C++ is considered non-orthogonal" because it doesn't "nothing but that instruction happens" but may generate [exceptions](https://stackoverflow.com/a/19929214/21294350).
        - from [c2](http://wiki.c2.com/?ConcurrencyIssuesAreOrthogonalToObjects)
          "on the lines of "not related"" *but not* "mutually independent" or "well separated".
          - TODO 
            Your last comment is certainly orthogonal to this discussion ?
            they can be used together, as well as separately.

          - "referring to a **programming language**": *consistency* in its syntax (i.e. whether to use *any* syntaxes). Just see [examples](https://www.mindprod.com/jgloss/orthogonal.html).
            "changes in one thing don’t effect another" -> Orthogonal (just similar to *projection* in math). -> this also explains "compatible with earlier versions of itself" (i.e. not influence others by *projecting* to them) in techopedia.
            This is similar to ISA ("each register has *special* properties" -> non-orthogonal). This implies [wikipedia definition "use all addressing modes" -> orthogonal](https://en.wikipedia.org/wiki/Orthogonal_instruction_set)
            Also see "exceptions" and "complicate the compilers.".

          - also means somewhat *abstraction* "look at the transactional aspects, ... ".
    - notice p5 "array1_size and array2 are not present in the pro-cessor’s cache" otherwise p6 it won't "During this wait" and then use "the branch predictor", but it use the *cache* to calculate the true condition.
    - code p15
      `x = training_x ^ (x & (malicious_x ^ training_x));`: 
      x=-1 -> malicious_x (because `training_x ^(malicious_x ^ training_x) = malicious_x`)
      x=0 -> training_x which always in the `array1_size` range by `tries % array1_size;`.
      ~~TODO~~ ~~why ~~`mix_i = ((i * 167) + 13) & 255;` just traverse the `array2` to try accidentally get the **cacheline** related with `malicious_x`.

      Here just try to get out-of-bounds data through `array2`.
      - Since `malicious_x++` and reuse it in `for (j = 29; ...` and `for (tries = 999; ...` 
        And in `j` loop `training_x` and `malicious_x` don't change, so won't use too much cache space.
        so p6 `array1[x]` when `x=malicious_x` will probably hit.

        And use `_mm_clflush(&array1_size);` to avoid `array1_size` in cache.
    - notice: although "rewinds its register state." ~~before~~ when "read from array2 is pending", "the speculative read from array2 affects the cache state" *still occurs*. So "the next read to array2[n*256] will be fast for *n=k*"
      "secret byte using the *out-of-bounds* x" (`k`)
    - "flush+probe" in p6 ~~just use explicit load instead of ~~ is just from [FLUSH_RELOAD] p5.
    - ["soft page fault"](https://techcommunity.microsoft.com/t5/ask-the-performance-team/the-basics-of-page-faults/ba-p/373120#:~:text=On%20the%20other%20hand%2C%20a,working%20set%20of%20another%20process.) implies DLL. (link also says about hard ones) <a id="soft_hard_page_fault"></a>
    - p9 gadget
      - "gadget" is just some mem-reference program .
      - "onto smaller regions" by controlling `edi` and fixed data in `[ebx+edx+13BE13BDh]` when `ebx` is controlled fixed.
      - "un-evict the return" maybe by [`RET imm16`](https://www.felixcloutier.com/x86/ret) where store ret address elsewhere beforehand.
    - p10 
      - "false but mispredicts as true" -> [False positives](https://en.wikipedia.org/wiki/False_positives_and_false_negatives)
      - Variations
        - "Evict+Time" is similar to "FLUSH+RELOAD"
        - "Instruction Timing" just similar but expose register related infos.
        - expose "*checkpoints* for speculative execution"
        - "mistrain the branch predictor" to make "interrupt" return to the target.
    - Mitigation
      same terminology as [`FLUSH_RELOAD`](#FLUSH_RELOAD_Mitigation) 
      - [ ] se-rializing instructions because of "are discarded" but not "speculative execution *will not occur* or leak information"
      - [ ] `cpuid` [serializing](https://www.felixcloutier.com/x86/cpuid#description) just function same as fence.
        - [ ] `mfence` and `lfence`
          from [intel_64] 1194, it has added "blocks speculative execution" as paper footnote in p11 says.
          [`WB`](https://danluu.com/clwb-pcommit/#:~:text=The%20four%20memory%20types%20they,whenever%20it's%20forced%20to%20be.), etc., memory type

          But it will "severely degrade performance" and "needs to be recompile".
      - [ ] "very long" delay
      - Indirect branch poisoning
        - [ ] "disable hyperthreading" -> not appear to be any architecturally-defined method
        - [ ] something "currently unknown and likely to vary among *processors*"
      - [ ] "microcode" fix by "dis-able speculative execution"
      - [ ] "*Buffering* speculatively-initiated memory trans-actions *separately* from the cache"
        Then "*timing* of speculative execution can also reveal"
      - [ ] "*other ways* that speculative execution can leak information"
        So Maybe difficult to develop one *general* solution.
    - "Spectre  speculatively  executes  instructions  whose  ISA  changes it knows will be rolled back" this means "Spectre  speculatively  executes  instructions and spectre knows that ISA changes will be rolled back"
      ISA changes just means something like register states.

      Also see p11 "vary among processors."

    - "compromised" just reverse calculate the time of *memory reference*.
  - 2 
    explains why ~~we not~~ "its status need not be restored on misspeculation"  related with *cache*.
    "place, and later find" -> [spectre_origin_arXiv] `temp &= array2[array1[x] * 512];` to place in the *cache* and `results[mix_i]++`
  - 3
    See [spectre_origin_arXiv] "5.1 Discussion" "code executing in *one hyper-thread* of Intel x86 processors can mistrain ... in a different hyper-thread"
    "subtle timing changes" -> "run in close proximity". This is same as [spectre_origin_arXiv] p10 "set their CPU *affinity* to share a core" So the time won't be influenced by communication time between cores which may be too longer.
#### [arxiv_Meltdown]
- ["end-to-end"](https://www.investopedia.com/terms/e/end-to-end.asp) -> complete solution.
- [Zero Idiom](https://easyperf.net/blog/2018/04/22/What-optimizations-you-can-expect-from-CPU#zero-idiom) just view *must-zero* instructions as `nop`.
  And [Move elimination](https://easyperf.net/blog/2018/04/22/What-optimizations-you-can-expect-from-CPU#zero-idiom) just point to ["the same physical register"][move_elimination]
- "Unified Reservation Sta-tion" are just "Scheduler" in Figure 1
- [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)
- "3 A Toy Example" just tells how "out-of-order" exploit functions.
  So [spectre_origin_arXiv] 1.4 tells differences between meltdown and spectre.
  1. "causes a trap" in 1.4 just corresponds to [arxiv_Meltdown] `raise_exception();` in 3
    Notice [spectre_origin_arXiv] "Variations on Speculative Execution" still use `branch` due to `ret` from interrupt. 
  2. 
    ["prime-and-probe"](https://security.stackexchange.com/a/213236) -> "estimate what cache lines were *loaded*"

  ~~TODO~~ [spectre_origin_arXiv] "specific to Intel processors" ~~may be wrong~~, because [arxiv_Meltdown] only use intel TSX to give one example of "Exception Suppression" by using "an atomic opera-tion" ( then avoid exception handler overhead by "continues without disruption.") to *redirect* the control flow after executing the *transient instruction sequence* in 4.1.
  - See [arxiv_Meltdown] 6.4 for the failure on "ARM and AMD". Then all processor can "exploits a privilege escalation vulner-ability" theoretically but maybe some processors "towards against the data leakage" due to "a more shal-low out-of-order execution pipeline".
- notice p5 "microarchitectural side effects" still stay but not "architectural effect".
- 4.1 explains how to " targets a secret at a *user-inaccessible* address"
  1. using "child process" to run "transient instruction sequence" and then parent recover the secret "through a side-channel" by Exception handling
  2. "Exception suppression" is mainly talking about how to suppress but not how to expose secret.
    See 5.2 "Exception Suppression using Intel TSX" -> "microarchitectural effects are still visible"
    So just do similar as 1. but not through one exception handler.
- See p6 "covert channel".
- Countermeasures
  - 7.1 2 solutions and the 1st is not practical.
    2 and the KAISER are all targeted at manipulation of *kernel*.
  - [KAISER](https://en.wikipedia.org/wiki/Kernel_page-table_isolation) from its name "Kernel Address Isolation", just think of it as "not have the kernel mapped in the user space." although "several privileged memory loca-tions are required to be mapped".
## The BIG Picture
- 17
  - interface -> something like syscall.
- 22
  - "identical software" -> same source codes.
- 94
  - Is there computers that aren't "stored-program".
    See [chap_1_13] p54.e2
- 119 [CMYK](https://cmyktool.com/cmyk/100-100-100-00000000/)
- 351
  - "pipeline and issue mechanisms": the former -> forwarding, etc., and the latter -> stall,etc.
  - ["Speculation, performed by the compiler"](https://www.cs.umd.edu/users/meesh/cmsc411/website/proj01/ppc/spec.html):
    TODO 1,4...
    2 is just same as [this](#fall_through).
    3 is ["allows such exceptions to be ignored until it is clear"](http://thebeardsage.com/speculation-hardware-vs-software/#:~:text=Speculation%20is%20an%20approach%20whereby,compiler%20or%20by%20the%20hardware.) (i.e. not speculative).
- 391
  - "cannot be present in level i unless they are also present in level i + 1." not applies to [Exclusive Policy](https://en.wikipedia.org/wiki/Cache_inclusion_policy#Exclusive_Policy)
- 400
  - may prefetch data from *multiple paths* to decrease the prediction penalty.
- 468
  - "virtual memory" is also based on *blocks* and has different ["Replacement Policies"](http://denninginstitute.com/modules/vm/yellow/repol.html#:~:text=The%20part%20of%20the%20virtual,again%20for%20the%20longest%20time.).
- 470
  - "increase access time" both due to *search time*.
## Check Yourself
### chapter 1
- [x] 10
  - [post-PC](https://en.wikipedia.org/wiki/Post-PC_era)
  - 2
    1. just when optimizing the loops.
    2. python is slower than C. clang may be better than gcc.
    3. kernel version
    4. whether has AVX512.
    5. memory bandwidth.
- [x] 24
  |       | volatility | access time | relative cost (just opposite of "access time") |
  | ----- | ---------- | ----------- | ---------------------------------------------- |
  | DRAM  | Yes        | fast        |                                                |
  | flash | No         | slower      |                                                |
  | disk  | No         | slowest     |                                                |
- [ ] (wrong) 28: 2,3([mask](https://en.wikipedia.org/wiki/Photomask#:~:text=Photomasks%20are%20commonly%20used%20in,known%20as%20a%20mask%20set.)),4,5(wafer and die [relation](https://www.quora.com/What-is-the-difference-between-a-wafer-and-a-die) and here volume may mean IC count per die by [high production volumes](https://en.wikipedia.org/wiki/Economies_of_scale) in [this](https://en.wikipedia.org/wiki/Integrated_circuit).)
- [x] 33
  - 1 a. both b. response time c.none
  - 2 7s
- [x] 40 b
- [x] 53
  - $10^6$ -> million
  - a. A
  - b. just count cycles -> B
### 2
- [x] 72: 3>2>1
- [x] 79: 2
- [x] 86: 2 and 4
- [x] 95: 3 (here funct7 should be `64`);0x28
- [ ] 98: 1
- [ ] 103
  I. see [this](#decisions_and_loops) 1,2,3,
  II 2
  po 1 "Logical operations" should be ["bitwise"](https://stackoverflow.com/questions/49617159/difference-between-and-in-c) (above link "lower precedence" means [higher priority](https://en.cppreference.com/w/c/language/operator_precedence))
  conditional branches -> means bool (is right).
- [x] 114 1,2
- [ ] 119 TODO learn JAVA
  I 2,3,4
  II 3
- [ ] 128
  [I](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#beq) 3; [II](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#jal) 3
  
  $\sum_{i=0\sim11}2^i=2^12-1$ -> 4K
- [ ] 131 1)
  processes may be switched then needs *Synchronisation* (["it will be switched out in a *pre-emptive arena*"](https://stackoverflow.com/questions/24030680/why-is-synchronization-in-a-uniprocessor-system-necessary)).
- [ ] 140 2~4
  See [this "not need to compile every part of the program"](https://en.wikibooks.org/wiki/Introduction_to_Programming_Languages/Interpreted_Programs#:~:text=The%20main%20advantage%20of%20an,processes%20the%20source%20code%20directly.)
  [2, and "memory efficient"](https://www.softwaretestinghelp.com/compiler-vs-interpreter/#Advantages_Interpreter_over_Compiler) are also advantages but not the main. (~~Maybe no "object code"~~ "An intermediate code is also known as the Object code ... eliminating the need for compiling the source program *each time*")
### 3
- [x] 193 2)
- [ ] 232 3) min should be subnormal -> $\pm2^{1-15}*2^{-10}$. See [this](https://en.wikipedia.org/wiki/Bfloat16_floating-point_format#bfloat16_floating-point_format)
  Also see [COD_RISC_V_2nd] p233.
### 4
- [ ] 4
  just compare to the *whole* pipeline.
- [ ] 261 False
  Based on verilog syntax, this is obvious.
- [ ] 268
  I a.
  II b.
- [ ] 282 See this for [truth table][truth_table]
  sw: `MemRead` is 0, and see p278 why `MemtoReg` is 0.
  282.e6 [MDR "contains a *copy* of the value in the memory location" and "act *independently* without being affected"](https://en.wikipedia.org/wiki/Memory_buffer_register)
  "the other signal" (i.e. ALUOp1) first inverse and "flip the order" just mux from `1 0` to `0 1`.
- [ ] 282.e20
  False
- [ ] 295
  1: stall; 2: forwarding; 3: "without stalling or forwarding"
- [x] 309 (just see pipeline veilog source codes)
  (half of 1 is right ("Allowing branches and *ALU* instructions to take *fewer* stages") ) 2,4
  3 is wrong, see above
- [x] 332
  1: "predict not taken"; 2: predict taken; 3: dynamic predictor.
- [x] 339
  1
- [ ] 353
  1. both
  2. hardware wrong TODO how software
  3. hardware wrong See [this](https://en.wikipedia.org/wiki/Very_long_instruction_word#Overview)
  4. hardware
  5. hardware
  6. hardware
  7. both
  8. hardware
  9. both 
- [ ] 365
  1,2,4
  1: not directly, but translate them to "micro-operations".
  - 358 "microarchitecture" like zen2 is just one specific implementation of "architecture" ~~like x86~~ like [Harvard architecture](https://en.wikipedia.org/wiki/Harvard_architecture). See [this](https://www.pcmag.com/encyclopedia/term/microarchitecture#:~:text=Microarchitecture%20vs.,See%20pipeline%20and%20cache.) and "ignores details of the implementation".
    Also see ["*conceptual* structure and functional *behavior*"](https://sci-hub.live/10.1147/rd.82.0087)

    Better see [this](https://cs.stackexchange.com/a/29464/161388) for details "typically encompasses".

    "antidependences" and "incorrect speculation" is solved by "register renaming".
  2: p354 "dual-issue".
  3: "architectural registers" is less than "physical registers". (p358)
  TODO read p354 after using processors based on ARM like stm32.
### 5
- [x] 391
  1. true
  2. false
  3. false (see [this](https://www.tutorialspoint.com/what-is-memory-hierarchy#:~:text=In%20Memory%20Hierarchy%20the%20cost,form%20register%20to%20Tertiary%20memory.&text=The%20registers%20are%20present%20inside,they%20have%20least%20access%20time.), this statement applies to the unit cost, but not the total cost).
  4. true
- [ ] see [this](#Check_5_2)
- [ ] 430: 1
- [ ] 470: 1,3
### appendix A
- [x] A-8 No. Because the second omits $A ⋅ C ⋅ \overline{B}$
- [x] A-20 
  Address $0$ -> 0
  Address $1$ -> 1 
  Then choose C
- [ ] A-22: 2,3,4 -> 15*16
  1. Z can be checked in "/mnt/ubuntu/home/czg/csapp3e/self_test/verilog/A_22.v"
- [x] A-26 0,1
- [ ] A-37 1
  > 1. No change. You can calculate NAND quickly using the current ALU since $\overline{(a ⋅ b)} = \overline{a} + \overline{b}$ and we already have NOT a, NOT b, and OR.
- [x] A-46 1
  "a ripple carry 8-bit add" -> $8*2=16$
  "carry-lookahead": same two level -> $5$
- [x] A-57 c
- [ ] A-71 b
  a. is weird because only one state -> not need anything to next-state function.
  b. just see [this](#internal_opcode) -> here `opcode` can be external input instead of output of the internal `Datapath`.
- [ ] A-76 a
  clock skew introduced by [gates](https://www.vlsi-expert.com/2016/03/types-of-clock-skew.html) which may be intentional from 2nd link hold violation (i.e. unstable) or [path length](https://www.vlsi-expert.com/2016/03/types-of-clock-skew.html) which is external skews from 1st link
  - Better see [this](https://www.vlsi-expert.com/2011/05/example-of-setup-and-hold-time-static.html) instead of [this](https://vlsiuniverse.blogspot.com/2017/02/setup-and-hold-violations.html) or [this](https://qr.ae/pyZ7yU)
    - also says about [setup time](https://www.vlsi-expert.com/2011/04/static-timing-analysis-sta-basic-part3a.html)
      where $T_{pd} DIN$ and $T_{pd} CLK$ decides which of `D` and `C` of the flip-flop *first updates*.
    - setup or hold analysis
      since setup is to *propagate* data, so "Setup is checked at next clock edge."
      and hold is to keep the current state *unchanged* which can be sensed by outside things like logics. So "Hold is checked at same clock edge.".
    - hold / setup violation
      just to check whether *min/max* of related CLK and D meet the setup or hold requirements.

      1. add "hold time of FF2" because from [this](#setup_time) data should last *longer* than CLK by hold time.
      2. "= (Clock period) + ... - (Setup time of FF2)" just see above "since setup ..."

      So [clock skew](https://www.intel.com/content/www/us/en/programmable/quartushelp/17.0/reference/glossary/def_clockskew.htm#:~:text=The%20difference%20in%20the%20arrival,using%20gated%20or%20rippled%20clocks.) will influence "hold violation" (from the above formula, it also influence "setup violation").
    - TODO [methods](https://www.vlsi-expert.com/2014/01/10-ways-to-fix-setup-and-hold-violation.html#:~:text=Hold%20violation%20happen%20when%20data,increases%20in%20the%20data%20path.) to solve above violations
## 4.5 A Multicycle Implementation (only implementing 4 types of instructions)
### 282.e1
- "two adders" are used to calculate `PC+4` and branch PC
### 2
- "timing race" just means both write and read occur on something like "Registers".
### 3
- ~~TODO~~ PC MUX
  Memory data MUX (See FIGURE e4.5.3).
- B -> "Write data": what sw does.
- "ALUOut" with "PC" is just to discriminate from "ALU" with `PC+4` (this is the more normal case) based on the opcode although they are just same (Also see "only if the two designated registers are *equal*" with `beq`).
### 4
- `ALUOp` see [truth_table].
- kw: the clock cycle cannot accommodate the time required for *both*;
### 5
- `PCSource` first select PC value, then `PCWriteCond`,etc. check whether to write PC.
  See e8 1,3 how `PCSource` is updated after 1 when `PCWriteCond` and `Zero` is valid at 3. "actually write the PC *twice*" ("(during the Instruction decode/register fetch)" should be "Instruction *fetch* step").
- "Elaboration": just use "a shared bus" instead of *two* multiplexors.
  But we should [avoid bus](https://electronics.stackexchange.com/questions/323495/shared-bus-vhdl) because 1. it is just [similar to MUX](https://electronics.stackexchange.com/questions/323495/shared-bus-vhdl#comment755425_323495) (maybe just [same](https://inst.eecs.berkeley.edu/~cs150/fa05/CLD_Supplement/chapter11/chapter11.doc2.html#681)) 2. it [isn't "SYNTHESIZABLE"](https://electronics.stackexchange.com/questions/323495/shared-bus-vhdl#comment755570_323600).

  TODO [try](https://www.reddit.com/r/factorio/comments/bku4z2/data_mux_for_sharing_one_network_between_multiple/) in the game !
### 6
- has "Effect when deasserted" when it is used in one multiplexor just as the book says.
- `PCSource` should be controlled by `PCWriteCond`.
- "The funct field" see [truth_table] p6
  also e9 "the opcode".
- "(IR[25:0] shifted left 2 bits" doesn't applies to riscv because riscv has 16-bit instruction (2 bytes), so [riscv_spec] p16 "multiples of 2 in the B format".
### 7
- both "operate in series" and "operate in parallel" occur in "single-cycle" and "multicycle".
- "takes an additional clock cycle" -> `<=` ([nonblocking](https://stackoverflow.com/questions/35435420/what-is-the-difference-between-and-in-verilog), i.e. parallel running, also see [verilog_md] "$<=$") in verilog (`wire` -> "is part of a clock cycle").
  Also see e8 "can occur in parallel".
  "and *then* all assignments" also implies above behaviors.
  Also implies using "stored into ALUOut" in e8.
- "access overhead" -> search overhead.
- " from three to five " -> ["variable CPIs"][single_Multiple_Cycle]
### 8
- "this action is benign" ? [See](https://www.reddit.com/r/FPGA/comments/t8morx/comment/hzr1zlc/?utm_source=share&utm_medium=web2x&context=3)
- `ALUOut <= PC + immediate` in 2/3(Memory reference) (also see e10 "in step 2 and once in step 3") is to calculate the memory data address which will be fetched ~~in 3~~ and written to MDR in 4 and into regs if `load` in 5. 
### 10
- "RegDst" see p273 to select the dest bit field and this [comparison](#mips_riscv_diff)
  Also view e15,e16 for more specific information.
### 12
- "fewer separate components in the datapath" -> *variable* component number each cycle.
### 14
- notice differences between "multiplexor control" and control "signals".
### 15
- FIGURE e4.5.9,etc. have shared components just as pipeline has.
### 16
- `ld` access both memory and register file, so it needs 2 more instructions compared with `sw` which only needs 1.
  Also R-format ~~not needs to calculate *offset*~~ to *access* register file (So ~~no need state 2~~ need 1 more state after ALU).
### 17
- "use only the Zero output" to keep "The branch target" in "ALUOut" not changed (Maybe still stored in the `ALUOut`, but must occur in the next cycle).
  comparison with FIGURE e4.5.8, "(It will also be stored into ALUOut, but never used from there" (i.e. it may use `wire` in verilog to directly use `PC + 4`).
- `Zero` is inverse of "the result of the subtraction".
- "In Section B.3" should be C.3 .
- "consider another way to represent control." may means with *input*, see e19 "depend only on the current state, *not on the inputs*".
### 19
- "single-cycle CPI" -> average CPI.
- "Floating-point" see [fp_multi_cycle].
### comparison with single cycle
- e2:
  1. here use "temporary register" to save the states, "for use on a later cycle".
  It is similar to ~~stage register~~ pipeline registers in pipeline.
- e7:
  reuse the functional unit "*at most one* ALU operation, or one register file access". Also see "1. Instruction fetch step",etc.
  Performing these “optimistic” (i.e. "since it *isn’t harmful* to read them") actions early
### comparison with pipeline
- e2:
  1. "hold the instruction until the end of execution" while pipeline updates the instruction each cycle *mostly*.
## Self-Study
### 1 connected with the real world.
- [ ] 1
  - pipeline 
  - Dependability
  - prediction
  - Common Case Fast
  - Hierarchy
  - Parallelism
  - Common Case Fast -> wrong
    "simpler model" -> option
- [ ] 
  - P3 4Ghz
  - P2, P3
    ```bash
    $ ipython -c "print(2.2*0.25);1.5*0.33"
    0.55
    Out[1]: 0.495
    ```
  - total time is only. (not accurate)
- [ ]
  - 11
  - See [this](https://www.reddit.com/r/computerarchitecture/comments/1513ih1/comment/jsa5z53/?utm_source=share&utm_medium=web2x&context=3)
    So think original savings is $1$
    Then "90% of the startup’s increase" -> "90% of the startup’s increase **due to self invest**" -> "90% of 11x" where $11x$ is from the 1st question.
    "11%∗1" just take the original savings in account. (just same as 1st question "a *return* (i.e., investment multiple) on your overall wealth" which includes principal (本金))
- [ ] 
  1. 2010~20 slowdown.
  2. maybe "processing steps" improved in FIGURE 1.12 ; Moore theorem (wrong)
  "factor-of-ten increase in volume" -> *capacity* can also improve the price.
  3. Yes. (wrong)
### 2 based on codes.
- [ ]
  1. 0x14b2823
  2. 21702691
  3. No
  4. `sw r20,16(r22)`
  ```bash
  $ ipython -c "num='0b00000001010010110010100000100011';\
  str_num=num[2:]
  print(str_num[-7:])
  print(str_num[-7-5:-7])
  print(str_num[-7-5-3:-7-5])
  print(int(str_num[-7-5-3-5:-7-5-3],2))
  print(int(str_num[-7-5-3-5-5:-7-5-3-5],2))
  print(str_num[-7-5-3-5-5:-7-5-3-5])                        
  print(int(str_num[-7-5-3-5-5-7:-7-5-3-5-5]+str_num[-7-5:-7],2))
  print(str_num[-7-5-3-5-5-7:-7-5-3-5-5])
  "
  0100011
  10000
  010
  22
  20
  10100
  16
  0000000
  ```
- [ ] just change the stack ( stack overflow to the parent stack).
  view stack model. Then all is obvious.
- [x]
  ```asm
  init: addi ...
  // 3 lines
  beq ... init
  // remove addi and beq; then fall-through into Exit.
  ```
- [ ] See MIPS [registers](http://homepage.divms.uiowa.edu/~ghosh/1-28-10.pdf) (notice this may differ from the book `$s0` index) and [instruction cheatsheet](https://uweb.engr.arizona.edu/~ece369/Resources/spim/MIPSReference.pdf)
  ```c
  x7 = &A[f+1]
  x5 = A[f+1]
  x5 = A[f]+A[f+1]
  B[g] = x5

  B[g] = A[f]+A[f+1]
  ```
### 3 connected with chapter 2 and related with the Latest AI research.
- [x] see [miscs_py_script] `COD riscv 2nd 3.12 1`
  here should be "/($2^{23}$)" from [binary32] "which yields ... "
  - decimal64, very highly recommend to see the example in the [book][muller2010] which is referenced in wikipedia ([The wikipedia][dec_64] and [IEEE standard][IEEE_754] not gives the example (["ISO/IEC/IEEE 60559:2011"](https://en.wikipedia.org/wiki/Decimal64_floating-point_format#cite_note-ISO-60559_2011-2) mostly needs purchasing and no doi offered) )

    - [muller2010] p86 *DPD* Encoding
      - first [BID](https://en.wikipedia.org/wiki/Binary_integer_decimal) needs `(−1)s×10q×c`, so transform the original number to $3141592653589793 × 10^{−15}$

      - here why use bias `398`: because the biggest exponent of non-NAN and non-infinite is `1011111111` from [dec_64] "3 × $2^8$ = 768 possible decimal exponent values."
      
        Notice: here 1. Binary integer significand field: 10-bit binary $2^{10}=1024$ which can obsolutely contains 3-digit 10-radix number. But notice it is not has precise split as Densely... (See [here](#Binary_split)). 2. [Densely packed decimal significand field](https://en.wikipedia.org/wiki/Decimal64_floating-point_format#cite_ref-Cowlishaw_2000_4-0): obviously 10-bit -> 3-digit
        So 50-bit -> *15*-digit

        Comparing with [binary32][binary32], here significand obviously *doesn't have fraction* format. <a id="no_fraction"></a>
        ```bash
        $ ipython -c "strnum = '10'+'1'*8;print(int(strnum,2)/2);print((int(strnum,2)-1)/2+15)"
        383.5 # here /2 is similar to Binary32, see below `127.0`
        398.0 # here `+15` to make significand has radix point after the first digit.
        $ ipython -c "0b11111110/2"
        Out[1]: 127.0
        ```
        So has 
        $$(−1)^{sign} × 10^{exponent−398} × significand = \\
        (−1)^{sign} × 10^{exponent−383-15} × significand = \\
        (−1)^{sign} × 10^{exponent−383} x significand^{-15} $$
      - "combination field" also see [dec_32] "DPD Encoding of the Combination Field" where has MSB and LSB of different fields.
        for example, here `0101111111` is split by "*MSB*" of "Significand" `3=011`.
      - "declet" just see [dec_32] "Densely packed decimal encoding rules" where "large digit" -> 8–9.
        for example, $592$ -> 3rd row, so $101$+$01$+$1$+$101$+$0$ (here `+` means concatenation).
    - [muller2010] p90 "BID Encoding" is similar to the above.
      but here "Combination Field" is *not split*, also see [dec_32] "BID Encoding of the Combination Field". <a id="Binary_split"></a>
      Notice: here the MSB `3` is `101` and only the *first 2 bits* are in the Combination field.
    - p91 See [this](#no_fraction)
    - Example 6 is similar.
- [x] This seems to be similar to one exercise in csapp.
  1. `2**31-1=2147483647`
  2. No
  3. `2**31` since `2**(-30) > 2**(-23)-2**(-30) -> Out[5]: False` in `ipython`
  4. Can be precisely described in the [double precision](https://en.wikipedia.org/wiki/Double-precision_floating-point_format#IEEE_754_double-precision_binary_floating-point_format:_binary64) because $1023>31$ and minimum precision is smaller than $2^{-30}$.
    `2**15*(2-2**(-10)) = 65504.0`
- [x] 
  ["Brain Division"](https://www.extremetech.com/science/google-merges-brain-division-and-deepmind) is one research division called Brain

  based on subnormals/denorms
  1. `2**(-int('1'*7+'0',2)/2+1)*2**(-7) = 9.183549615799121e-41`
  2. bigger than smallest of fp32.
  3. `2**(-int('1'*7+'0',2)/2+1)*2**(-7)/(2**(-10-(2**5-2)/2)) = 3.0814879110195774e-33`

  not based on subnormals/denorms
  1. $2^{-\frac{2^{8}-1-1}{2}}=5.87747175411144 \cdot 10^{-39}$
  2. same
  3. $2^{-127-(-15)}=2^{-112}$
- [ ] 
  - FIGURE 3.7
    based on FIGURE 3.4 and [this Q&A](https://electronics.stackexchange.com/q/56488/341985) 
    Here the rightest and highest adder generates 34-bit number and the *left* of it is *36-bit*. Here `Mplier1` should be `10/00` and `Mplier2` is `1<<2/0<<2`, etc. "last (fifth) tier, you're adding together a 48-bit" in the answer above may be wrong.
    And "The *second number* is x if bit #30 of y is 1" in [this](https://cs.stackexchange.com/questions/95733/difficulty-understanding-the-faster-multiplication-hardware) is also wrong because the first Q&A has offered the formula where *sum* of `Mplier0*Mcand` and `Mplier1*Mcand` decides the *second number*.
    Better to see the *verilog* codes.

    The figure righest 1 bit is the LSB of `Mplier0 • Mcand` and `Product1` is *sum* of `Mplier0*Mcand` and `Mplier1*Mcand` as above says. Then the rightest of `32 bits` of 2nd tier outputs 2 bits (i.e. bit2,3 of result if bit0 is LSB).

    - Here "carry save adders" (i.e. fast carry) is to *accelerate adders*. Comparing FIGURE A.5.7 and FIGURE A.6.1, obviously here just use *precalculated carry formula* to avoid delay. And FIGURE A.6.2&3 is just use *4-step*.
      See A-28 for the formula in A-38
  - exponent can be just *added*, so not take it in account.
    TODO why "the square of size".
- [x] cast is more available. "the same behavior for underflows and overflows," -> similar if take subnormal in account.
- [ ] 1,2,3(if full -> single).
  "software programmer" because more smaller.
### 4 mainly based on "infer other things from one fact" 举一反三
- [x] 1,2; 3; 4,5
  See FIGURE 4.29 for time (where mem access and ALU take longer).
- [ ] $\frac{1}{\frac{300*3}{300*3-100}}$ (wrong this is based on the *whole pipeline* time.)
- [x] 2 Yes.
- [x] Yes, stall.
- [ ] Yes, forwarding or prediction.
  see [COD_RISC_V_2nd] p327 "moving the conditional branch execution to the ID stage" and So only the instruction fetched is the penalty when the branch goes into `ID`. See FIGURE 4.70 vs FIGURE 4.35 where in the former the imm sum adder is moved into `ID`.
- [ ] lower because at least use ALU which increase *100ps*.
  ~~TODO~~ although CPI lower, but the total time is CPI*cycle_time which may increase as above says.
  [CPI aka clock cycles per instruction, *clocks* per instruction](https://en.wikipedia.org/wiki/Cycles_per_instruction)
### 5 dive into the before problems and conneted with the read world.
- [ ] 18 and 26 always miss; other first loop miss and then all hits. (wrong, see the original cache in FIGURE 5.9)
- [x] See [COD_RISC_V_2nd] p401
  just combine 2 lines into one set
  Then m,m,h,h,m,m(here 011,010 set is full),h,m(because set is full,*maybe evict 3/26*),h
  (18,...) h,m,h,m,h(if evict 3)
- [ ] x means wrong
  1. ~~L2~~ L1
  2. ~~L1~~ opcache x
  here freezer is to store something which is *not used recently* but after sometime.
  3. ~~L3~~ L2 x
  4. ~~memory~~ ~~disk~~ mem x
  5. ~~memory~~ L3 x
  6. ~~L2 time~~ decoding and scheduling time x
  7. 
  8. write back
  9. prefetch x
  10. decode 

  ---
  after reading the above answers

  11. eviction from L1
  12. write back to ~~mem~~ L3
  13. fetching data
  or miss
- [ ] 
  Not: 
  1. associative ( partly wrong )
  2. same to Q2
  Yes:
  1. replacement strategy 
  2. write back?
- [x] 
  compulsory miss: first usage 
  conflict miss: grocery store
  capacity miss: full items
- [ ]
  1. associative
  2. no copy -> ans 5
  
  Answers: 
  4. cache miss may cause *write* which may spoil.
  Also different L1 cache (different refrigerators of different families) of L3 cache (the grocery) didn't have cache *coherence*.
- [ ]
  because they share the hardwares.
### 6 specific to real-world *genome sequence*
- ~~TODO~~ [`r5.2xlarge` meaning](https://instances.vantage.sh/aws/ec2/r5.2xlarge)
- [sequence genomes][Genome_Sequencing_508c] is similar to `uniq` command (from [this](https://www.cdc.gov/pulsenet/pathogens/wgs.html#:~:text=If%20you%20know%20the%20sequence,an%20organism%20in%20one%20process.)).
- [x] 1,2
- [ ] 3
## Historical Perspective and Further Reading 
Most of docs here are separate pdfs because [COD_RISC_V_2nd] don't have corresponding toc related with them.
### [1][chap_1_13]
- TODO " mercury acoustic delay lines " in [EDVAC](https://en.wikipedia.org/wiki/EDVAC#Technical_description).
  - [EDSAC](https://en.wikipedia.org/wiki/EDSAC#Physical_components) is similar
- [Mark I](https://en.wikipedia.org/wiki/Mark_I) term and [Manchester Mark 1](https://en.wikipedia.org/wiki/Manchester_Mark_1)
- TODO read [this paper](https://www.ias.edu/sites/default/files/library/Prelim_Disc_Logical_Design.pdf)
- [relay machine](https://en.wikichip.org/wiki/relay_computer)
- [Whirlwind](https://en.wikipedia.org/wiki/Whirlwind_I) is still "vacuum tube computer".
  [Magnetic-core memory](https://en.wikipedia.org/wiki/Magnetic-core_memory) is based on Magnetic hysteresis
- ["Northrop"](https://en.wikipedia.org/wiki/Northrop_Corporation)
- "IBM System/360" and "PDP-8" still use *Magnetic-core memory*.
- p7 "IBM" -> "Microsoft" and "Intel".
- ["IBM PC compatible" is now a historical description only](https://en.wikipedia.org/wiki/IBM_PC_compatible)
- Million instructions per second [(MIPS)](https://www.gartner.com/en/information-technology/glossary/mips-million-instructions-per-second#:~:text=Million%20instructions%20per%20second%20(MIPS)%20is%20an%20approximate%20measure%20of,to%20perform%20the%20same%20activity.)
- Synthetic programming: "cannot be obtained using the *standard capabilities* of the calculator"
- "base SPECFP measurement" -> based on base computer like VAX-11/780 or Sun SPARC Station 10/40.
### 2
- "Regular-memory" in p2 should be Register-memory.
- "Thumb-2" and "Thumb" [diff](https://stackoverflow.com/a/71378041/21294350)
- "hardware" may be [targeted](https://retrocomputing.stackexchange.com/a/8886) at specific languages "ARM processors have *hardware JVM* support". -> ["High-Level-Language Computer Architectures"](https://en.wikipedia.org/wiki/High-level_language_computer_architecture#:~:text=A%20high%2Dlevel%20language%20computer,being%20dictated%20by%20hardware%20considerations.)
- TODO [emulation](https://news.ycombinator.com/item?id=4108557)  of  the  AM  6502?
- [LR-parsing](https://en.wikipedia.org/wiki/LR_parser) just see [bison](#bison) and [MIPS_COD]
### 3
- ["Bad money"](https://en.wikipedia.org/wiki/Gresham%27s_law#%22Good_money%22_and_%22bad_money%22) include *counterfeit* coins 
- just See [COD_RISC_V_2nd] p193 for "the tail of the accumulator and *shifted out*".
- "scale factors" -> one floating number
- "1948, Von Neumann and Goldstine"'s [paper](https://www.historyofinformation.com/detail.php?id=658)
- reread 242.e4.
  The main problem is that roundoff without guard digits.
  also see [this](https://stackoverflow.com/questions/45662113/guard-round-sticky-bits-floating-point#comment78287551_45662113) and [this Q&A_2](https://stackoverflow.com/questions/76709959/is-there-one-way-to-alleviate-roundoff-errors)  
  Codes see "/mnt/ubuntu/home/czg/csapp3e/self_test/miscs_test/Guard_digit".

  It may be also one problem of the compiler "*Without compiler* support, these features have *atrophied*".
  ```bash
  $ gdb ./Guard_digit_changed.o
   0x000055555555516b  main+34 fld    TBYTE PTR [rip+0xecf]        # 0x555555556040
   0x0000555555555171  main+40 fsubp  st(1),st # stop here
  >>> info registers float 
  st0            0.299999999999999988898 (raw 0x3ffd9999999999999800)
  st1            0.300000000000000016653 (raw 0x3ffd9999999999999c00) # the problem is just fpu bit size
      # watch long double https://stackoverflow.com/questions/29821669/gdb-examine-long-double-array

      ###################
      # when stop at `a -= 0.3L;`
   0x00005555555551e1  main+152 fld    TBYTE PTR [rip+0xe89]        # 0x555555556070
   0x00005555555551e7  main+158 fsubp  st(1),st # stop here
      # crazy equal
  >>> info registers float 
  st0            0.300000000000000000011 (raw 0x3ffd999999999999999a)
  st1            0.300000000000000000011 (raw 0x3ffd999999999999999a)
  $ readelf -a Guard_digit_changed.o
    [16] .rodata           PROGBITS         0000000000402000  00002000 # show "Section Headers" ; this is where [rip+0xe89] resides in. https://www.cyberciti.biz/faq/linux-find-size-of-text-data-segment-bss-uninitialized-data/
       0000000000000080  0000000000000000   A       0     0     16
  ```
  - Above Q&A_2 [answer_1](https://stackoverflow.com/a/76712236/21294350)
    - ~~what `.0625` means?~~ 
      ~~why highlight "greater than or equal to *.0625* cannot have any non-zero bits below 2−56"~~

      a is $2^{−56}$ or greater -> implies why outputs `i=57`.

      here $2^{−56}$ is exponent $-4$ and fraction ranges to 52bit ("a *significand*").
  - commments
    - _Decimal is still [C2x](https://patchwork.ozlabs.org/project/gcc/patch/alpine.DEB.2.21.1910111732490.26290@digraph.polyomino.org.uk/) which is [in draft](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1312.pdf)
- TODO 242.e5 is probably dependent on the hardware implementation.
  "about one-third of the bits that normal multiplier arrays generate have been *left out* of his multipliers"
- "combine a flat register file with a stack": just manipulate the fpu registers *like the stack*.
  "get the same result as a two-operand instruction" -> [implies](https://www.felixcloutier.com/x86/fxch) st0 and st1.
- [ulp](https://en.wikipedia.org/wiki/Unit_in_the_last_place) is just the [precision](https://stackoverflow.com/questions/43965347/ulp-unit-of-least-precision).
- "commutative." is not the always case in 242.e9.
- TODO read papers referenced in the para of Further Reading.
  ARITH [paper](http://www.acsel-lab.com/arithmetic/) or official [1](https://arith2022.arithsymposium.org/program.html),[2](https://ieeexplore.ieee.org/xpl/conhome/9973813/proceeding)
### 4
- superscalar (i.e. multiple issue) [vs](https://stackoverflow.com/questions/1656608/what-is-difference-between-superscaling-and-pipelining) pipeline
- "Out-of-Order" is same as  “Dynamic scheduling” See [p19 (where it says what is in-order),20](https://www.cs.cmu.edu/afs/cs/academic/class/15740-f18/www/lectures/15-ooo.pdf)
  "Out-of-order instruction commit" should be replaced by In-order instruction commit from above p19.
- ["high-level architecture"](https://encyclopedia.pub/entry/28258#:~:text=The%20high%2Dlevel%20architecture%20(HLA,regardless%20of%20the%20computing%20platforms.) -> "distributed computer simulation systems"
- [VLIW](https://www.geeksforgeeks.org/very-long-instruction-word-vliw-architecture/) implies *multiple issue*.
  - VLIW -> "Complex *compilers* are required."
- [bit-slice](https://en.wikipedia.org/wiki/Bit_slicing) is similar to coprocessor.
  [circuit](https://www.circuitlab.com/circuit/kk5c4n/bit-slice-adder/)
- ["Explicitly Parallel Instruction Computing (EPIC)"](https://link.springer.com/referenceworkentry/10.1007/978-0-387-09766-4_6#:~:text=Definition,keeping%20hardware%20complexity%20relatively%20low.) where "Explicitly" implies compiler.
  Notice [EPIC](https://en.wikipedia.org/wiki/Explicitly_parallel_instruction_computing) implies *VLIW*, so "Itanium 9700-series processors, the *last EPIC* chips" and [difficult](https://softwareengineering.stackexchange.com/questions/279334/why-was-the-itanium-processor-difficult-to-write-a-compiler-for) to use it.
- [software pipelining](#Software_pipelining)
- [Trace scheduling](https://en.wikipedia.org/wiki/Trace_scheduling) is referenced in [pipeline_scheduling] just gives "trace with the *highest frequency*" the higher priority.
  "including branches" implies "control flow path" in [pipeline_scheduling]
  It is probably related with [trace cache](https://en.wikipedia.org/wiki/Trace_cache#Necessity) which stores "A,B,D" here.
  - Different [types](https://en.wikipedia.org/wiki/Instruction_scheduling#Types)
    Here Local and Global is just as [this](#Local_Global_Optimizations) says.
    Modulo scheduling just [this](#Software_pipelining)
    Superblock scheduling "not attempt to merge control flow" but uses probability (See [the last figure](https://embeddedbhavesh.wordpress.com/2015/11/10/basic-block-trace-scheduling-superblock-scheduling/) or [p10](https://core.ac.uk/download/pdf/158319639.pdf))
### 5
- "the founder of *Digital*" -> Digital Equipment Corporation (DEC)
- ["HP Precision architecture"](https://en.wikipedia.org/wiki/PA-RISC#:~:text=Precision%20Architecture%20RISC%20(PA%2DRISC,the%201980s%20until%20the%202000s.) is RISC.
  IA-64 [vs](https://superuser.com/questions/383711/whats-the-difference-between-intel-64-and-amd64#comment431860_383711) amd64
- TODO [tunnel diode](https://en.wikipedia.org/wiki/Tunnel_diode#Reverse_bias_operation) memory
- *disk* is "magnetic storage" which is same as old [core memory](https://en.wikipedia.org/wiki/Magnetic-core_memory).
- `Cobol`: see 2.24 in [MIPS_COD]
- TODO 
  IBM IMS vs Integrated Data Store
  Relational model
- ["nonprocedural language"](https://www.geeksforgeeks.org/difference-between-procedural-and-non-procedural-language/) -> "leave it up to computers to process it".
  [System R](https://en.wikipedia.org/wiki/IBM_System_R) and [Ingre](https://en.wikipedia.org/wiki/Ingres_(database)) are both SQL.
  *DB2* of IBM is "relational databases" while IMS isn't.
- ["transaction processing"](https://en.wikipedia.org/wiki/Transaction_processing) just "divided into individual, *indivisible* operations called transactions" and "data-oriented resources are *not permanently updated* unless *all* operations within the transactional unit complete successfully"
- See [COD_RISC_V_2nd] 479.e6 for "RAID 5" which has [rotating parity](https://infohub.delltechnologies.com/l/dell-powermax-reliability-availability-and-serviceability/data-protection-schemes)
- seven check disks may be *redundant* based on [this](#hamming)
  ```bash
  $ ipython -c "print(2**6>=32+7+1);print(2**5>=32+7+1)"
  True
  False
  ```
- RAID has two abbr meanings in the book just as [wikipedia](https://en.wikipedia.org/wiki/RAID) says.
- [CMS](https://www.ibm.com/docs/en/zvm/7.2?topic=product-conversational-monitor-system-cms) ~~is just~~
  [CP-67](https://en.wikipedia.org/wiki/CP-67#:~:text=CP%2D67%20is%20the%20control,customized%20S%2F360%2D40.) is the [VMM](#VMM).
  TODO See [development process](https://en.wikipedia.org/wiki/VM_(operating_system)) of VM in IBM including VM/370 and z/VM.
- Batch processing is just based on processing *one batch* each time ("run the next until the batch was complete").
  In [multitasking](https://en.wikipedia.org/wiki/Computer_multitasking) used by [Time-sharing](https://en.wikipedia.org/wiki/Time-sharing#Time-sharing) "New tasks can *interrupt* already started ones before they finish" while Batch processing can't ([Multiprogramming](https://en.wikipedia.org/wiki/Computer_multitasking#Multiprogramming) is similar, "the context of this program was stored away"). This implies "interactive".

- TODO 
  read "The Mythical Man Month"
  process model implementation.
### 6
- "The cost of a general multiprocessor ... " See the original [paper][bouknight1972]
- "single-bit-wide processor": just min data size is [1-bit ("The logic unit")](http://www.righto.com/2021/02/a-one-bit-processor-explained-reverse.html).
- "Thinking Machines and then by MasPar" are 2 companys ([MasPar](https://en.wikipedia.org/wiki/MasPar)).
- "After being resurrected in the 1980s":
  1. unable to scale down. (Similar to the above "FIGURE 6.33" samll size doesn't show one good improvement when using multiple threads)
  2. "built custom processors" but not rely on the outside "microprocessor technology".
- ["diminishing returns"](https://en.wikipedia.org/wiki/Diminishing_returns)
- ["data stream"](https://en.wikipedia.org/wiki/Data_stream) one "transmission" -> just means how data are split ("a series of *packets*").
  Also see [this][SIMD_category] where it means minimum data unit.
- Distributed memory -> ["each processor has its memory"](https://www.sciencedirect.com/topics/earth-and-planetary-sciences/distributed-memory#:~:text=Distributed%20memory%20refers%20to%20a,remote%20processors%20to%20transfer%20data.)
  - [centralized p4,5](https://www.dauniv.ac.in/public/frontassets/coursematerial/computer-architecture/CompArchCh12L06centralisedmemory.pdf) memory -> shared mem
- "off-the-shelf interconnect" -> off-chip, similar to [off-the-shelf memory chips](https://people.ece.ubc.ca/stevew/standalone.html).
- "parallel vector multiprocessors" See [this](#vector_processor) and also [these figures](https://www.geeksforgeeks.org/introduction-of-multiprocessor-and-multicomputer/)
  Also see the [original paper](https://sci-hub.live/10.1126/science.228.4698.462)
  Just take riscv for concrete example which can have many cores (multiprocessors) with vector extension (vector) which support pipeline in the ALU (parallel)
- [mesh-connected](https://www.researchgate.net/figure/4-2-4-wraparound-mesh-connected-multiprocessor-Illiac-IV-type_fig3_3316462) multiprocessors
  [hypercube-connected](https://www.geeksforgeeks.org/hypercube-interconnection/) multiprocessor
  [Caltech Cosmic Cube](https://en.wikipedia.org/wiki/Caltech_Cosmic_Cube) -> 6-dimensional hypercube network
  [iPSC](https://en.wikipedia.org/wiki/Intel_iPSC) Four-dimensional hypercube topology with the figure
- [Tandem](https://www.pcmag.com/encyclopedia/term/tandem#:~:text=In%201997%2C%20Compaq%20Computer%20acquired,See%20ServerNet%20and%20HP%20Enterprise.) is one company.
  [MPP](https://en.wikipedia.org/wiki/Massively_parallel) where "Massively" -> a large number
- VI interface standard -> [Virtual Lane][via_analysis_VI_interface]
- 587.e7
  - took over -> [lost ground](https://en.wikipedia.org/wiki/AltaVista)
- "Blue Gene" use ["torus interconnect"](https://en.wikipedia.org/wiki/IBM_Blue_Gene#Major_features)
  Also see [Hierarchy](https://en.wikipedia.org/wiki/IBM_Blue_Gene#History)
- [Asanovic] in 587.e8
  - programming model just how to [program "Binary search. ..."](https://algs4.cs.princeton.edu/11model/)
    mainly based on [abstraction "where Java is the *base* language"](https://en.wikipedia.org/wiki/Programming_model#:~:text=A%20programming%20model%20is%20an,model%20of%20the%20programming%20model.)
    Also see p5
  - TODO 
    reread p7

    other challenges see p16,24,32,35,36,38,43,47
- ["16-bit by 8-bit multipliers"](https://www.techiedelight.com/multiply-16-bit-integers-using-8-bit-multiplier/) just as [COD_RISC_V_2nd] book says about multiplication in chapter 3.
- TODO [diannao](https://users.cs.duke.edu/~lkw34/papers/diannao-asplos2014.pdf) from this [Syllabus](http://people.cs.uchicago.edu/~aachien/lssg/people/andrew-chien/chien-teaching/CA-ML-s19/CA-ML-Syllabus5-23-2019.pdf);
  [also this referenced by COD][chen2016] which includes *family* of four DNN architecture
  - "minimizes memory accesses ... efficient architectural support for the memory-access patterns" -> [loop tiling](https://en.wikipedia.org/wiki/Loop_nest_optimization) which is same as COD loop blocking.
  - ["synapse"](https://www.freecodecamp.org/news/deep-learning-neural-networks-explained-in-plain-english#what-is-a-neuron-in-deep-learning) same as [this](https://deepai.org/machine-learning-glossary-and-terms/synapse)
  - ["cycle-accurate"](https://news.ycombinator.com/item?id=13052487#13053150)
- [Putnam_2016]one specific [reconfigurable fabric](http://www.cs.cmu.edu/~phoenix/reconfigurable.html) (结构) is FPGA.
## chapter 6 in COD RISCV 2nd
- p520
  - multiprocessor is [not](https://www.javatpoint.com/multiprocessor-and-multicore-system-in-operating-system#:~:text=A%20multicore%20contains%20multiple%20cores,capable%20of%20running%20many%20programs.) multicore.
  - job is similar to program where the latter [contains](https://superuser.com/questions/1661789/whats-the-difference-between-a-program-process-job-service-daemon-script) process and the former [contains](https://www.geeksforgeeks.org/difference-between-job-task-and-process/) tasks. And the book "task-level parallelism or process-level parallelism " implies their equivalence.
    Also see [this](https://superuser.com/a/1661791/1658455) "A job is just a scheduled program".
  - Shared Memory Processors -> [this](#SMP).
- concurrent program [vs](https://slikts.github.io/concurrency-glossary/?id=concurrent-order-independent-vs-sequential#:~:text=Concurrency%20is%20about%20independent%20computations,step%20to%20produce%20correct%20results.) sequential program (whether *order* counts)
- "spend too much time communicating with each other" -> just as csapp says about overhead of semaphore.
  See p51 for bottleneck when target time is too demanded.
- Amdahl’s Law calculation See [csapp_global] p58 which is also referenced in wikipedia.
- p524 "55%" is just $\frac{5.5}{10}$.
  "harder than getting good speed-up by *increasing the size*" because $10t$ is unavoidable.
  $M/P$ just means the working set on each processor isn't high enough (i.e. the utilization proportion of *per* processor is *not kept constant* when increase problem size).
- Challenge (corresponding to 3 examples from p523 to 525):
  1. not to drop small proportion of to-improve program.
  2. maybe better using "Weak scaling".
  3. "Balancing Load" which is similar to the *Barrel Effect*.
- "multiprocessing" [vs](https://towardsdatascience.com/multithreading-and-multiprocessing-in-10-minutes-20d9b3c6a867) multithreading: the former is based on "run multiple *process*ors in parallel".
- SIMD just make multiple data to *one vector*. See [these 2 figures](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data#Software)
  [SSE](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) just use xmm registers.
- [array processor](https://www.geeksforgeeks.org/types-of-array-processor/) is similar to SIMD
  See this for [differences][SIMD_category]
  kw: own *separate and distinct* memory and register file; "predicated" (masked) SIMD.
- MMX (64 bits) [differences](https://stackoverflow.com/a/31493072/21294350) from AVX,SSE(128 bits).
- [vector architecture](https://www.lkouniv.ac.in/site/writereaddata/siteContent/202004291236420982rohit_vector_architecture.pdf) add (a1) "pipeline" based on array processor. <a id="vector_processor"></a>
  Here ~~`a1`,etc. refers to differences between vector and *array* processor, and~~ `a1/b1` refers to differences between vector and array processor (also its [parent][SIMD_category] *SIMD* processor -> b)
  p529 -> ~~(a2)~~ ["vector register" and "had eight vector registers ... sixty-four 64-bit words" in wikipedia](https://en.wikipedia.org/wiki/Vector_processor#Supercomputers). (from [SIMD_category], Array processor also has above components).
  - wikipedia: 
    
    kw: rather than multiple ALUs; pipelined into each of the ALU subunits; *coupling* several scalar processors to act as a vector processor; 
    (a1/b1) ["vector chaining"](https://en.wikipedia.org/wiki/Chaining_(vector_processing)) is similar to [Systolic array](#Systolic_array) and "can be more resource-efficient by using *slower* hardware and saving power ... "
    - (b2) difference between SIMD and vector: SIMD is fixed-length, and Vectors are *variable*.
    - TODO watch [RISC-V RVV](https://en.wikipedia.org/wiki/RISC-V#Vector_set)
    - [Duncan's taxonomy](https://en.wikipedia.org/wiki/Duncan%27s_taxonomy#Pipelined_vector_processors)
      - "a filled *pipeline* are processing *different elements* of the vector"
      - kw: from special vector registers are termed register-to-register; examples of memory-to-memory vector
      - is similar to Systolic array, but the former mainly based on the pipeline while the latter based on "a regular, local interconnection network" (Just [see](#Systolic_array)).
      - So "Pure Vectors" differs from "Pure (fixed) SIMD",etc., mainly due to their *pipelined vector processing unit*.
    - "variable-length since their inception." -> just what RISC-V RVV Vector set does by using one separate register to control the length, etc. ("`vsetvl` instruction in RISCV RVV").
      - "allows locally controlled (*predicated*) activation of units to provide the appearance of *variable length*" -> "Predicated SIMD" "*almost* qualifies as a vector processor".
    - comparison with [example](https://en.wikipedia.org/wiki/Vector_processor#Difference_between_SIMD_and_vector_processors)
      - "4-wide simultaneous ... very costly" -> "1-wide 64-bit LOAD, 1-wide 64-bit STORE ..."
        "multi-issue is not possible, then the operations take *even longer*"
        "only when all four LOADs have completed *may* the SIMD operations start" (notice here is "may" because cpu may start related `add` with completed `load` which is just function similar to "vector chaining"). 
      - vector processor: "resource utilization, due to vector chaining,"

  "pipeline" is mainly due to no need to stall multiple times by "only stall for the first element" p530.
- "the prefix “V”" is still in [draft](https://github.com/riscv/riscv-v-spec). TODO
  See the [pdf][riscv_V_ext] or [adoc](https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#vector-length-register-vl)
- [DAXPY](https://netlib.org/utk/papers/latbw/node10.html)
- [vector lane Figure 1.4](https://developer.arm.com/documentation/den0018/a/Introduction/Fundamentals-of-NEON-technology/Registers--vectors--lanes-and-elements?lang=en#CFFFHHBE) just parallel. But "cannot be a carry or overflow from one lane to another." to keep *independent*.
  Also see p532 comparison with "lanes on highways" (where "vector lane" also includes "a *portion* of the vector register file" -> "*element N* from other vector registers").
- "bookkeeping code" in p530 may just record the manipulation counts and ["recording"](https://www.topaccountingdegrees.org/faq/what-is-a-bookkeeping-system/#:~:text=Bookkeeping%20systems%20are%20technically%20defined,transactions%20that%20occur%20in%20business.) related infos to [recover](https://stackoverflow.com/a/76798806/21294350).
- ["strip mining"](http://physics.ujep.cz/~zmoravec/prga/main_for/mergedProjects/optaps_for/common/optaps_vec_mine.htm) and "handle the leftovers" (i.e. Cleanup) is just same as csapp says. Also see [this](#strip-mined)
- "Vector versus Scalar" p531
  2,4 reduced check of independence between data.
  5 "interleaved memory bank" / "adjacent" implies only one fetch (spacial locality).
  7 conclusion.
- "permit this *sharing*, the processor must *duplicate* the independent state" just as csapp says.
- "instruction-level parallelism" is used in SMT but not Coarse MT (Coarse-grained multithreading) and Fine MT.
- i7 6700 [vs](https://cpu.userbenchmark.com/Compare/Intel-Core-i7-960-vs-Intel-Core-i7-6700/m778vs3515) i7 960
- p539 reduction same to  [this](#Reduction_verilog) and [this](#reduction)
  "half" ... "a quarter" are just same as [reduction_nvidia](#reduction_nvidia)
- in `linux`, `cc` (UNIX C compiler) and `gcc` are same although their inodes are different.
  ```bash
  $ diff /usr/bin/cc /usr/bin/gcc
  $ ls -ai /usr/bin/gcc /usr/bin/cc
  3658826 /usr/bin/cc  3658828 /usr/bin/gcc
  ```
- p544 
  - "MIMD" and "SIMD" relation.
    - better see [this](https://en.wikipedia.org/wiki/Flynn%27s_taxonomy#Diagram_comparing_classifications)
  - "Address coalescing unit" -> combining *multiple* memory accesses into a single transaction (i.e. sequential (so stride in "Code Example" isn't coalesced)and aligned) <a id="mem_coalescing"></a>
- 545
  - how "hardware thread scheduler" [implemented][hardware_thread_scheduler].
    ""scheduled” onto *hardware* by first letting one execute, *interrupting* it, *saving its state* ..." (Also see p546 "hold the state of the many threads")
    "the scheduling is done by BOTH: the OS decides ... what ... the hardware chooses *how* to execute them"
  - "64 vector registers" implies one lane has 4 registers and "32 elements" -> "threads are 32 wide".
  - "a vertical cut" -> " one element ". (CUDA thread not equals to SIMD lane & POSIX thread)
  - "2048 registers" contains multiple threads' registers.
    ```bash
    $ ipython -c "print(32*32*64==32768);print(16*2048==32768)"
    False
    True
    ```
  - po CUDA thread (i.e. *one element* executed by one *SIMD lane*) is smaller than SIMD lane (i.e. a thread of SIMD instructions)
  - TODO "SIMD thread" diff with "SIMD lane".
- 547
  - ["demand paging"](https://en.wikipedia.org/wiki/Demand_paging) which is said in csapp just not "Anticipatory".
  - FIGURE 6.11
    | Feature                                              | GPU       |
    | ---------------------------------------------------- | --------- |
    | SIMD processors                                      | 15 to 128 |
    | SIMD **lanes**/processor                             | 8 to 16   |
    | Multithreading hardware support for SIMD **threads** | 16 to 32  |
  - GPU solves page fault by *sharing* mem space. See [this p12,13](https://on-demand.gputechconf.com/gtc/2018/presentation/s8430-everything-you-need-to-know-about-unified-memory.pdf) referenced in [this forum topic](https://forums.developer.nvidia.com/t/unified-memory-page-fault-handling/63197).
  - "MIMD core" -> one SIMD *processor*.
- 548
  Better See FIGURE B.2.5
  - "CUDA Thread" -> "One iteration" Then "A vertical cut" is just *temporal* cut.
    So "A Thread of SIMD Instructions" is ~~just from *hardware* perspective~~ and "CUDA Thread" is from the **program runtime**'s perspective. (From what **Warp** means shown below, here `Thread` is just one quantifier like `one,two,three` but not one hardware element).
    "Thread block" -> "made up of *one or more threads of SIMD instructions*" (i.e. SIMD thread **IF** "thread of SIMD instruction" just means "SIMD thread"). ~~Then from FIGURE 6.10, Thread block is made up of ~~

    From FIGURE 6.9, "SIMD threads" run on "SIMD Lanes" (From FIGURE 6.12, SIMD Lane is *processing hardware*).
    From FIGURE 6.4, SIMD Lane contains multiple primitive instruction like `add` / `mul`.
  - [PTX](https://en.wikipedia.org/wiki/Parallel_Thread_Execution) just functions as "assembly language" targetted at CUDA.
  - [Warp](https://nyu-cds.github.io/python-gpu/02-cuda/) can be seen as combination of ~~instructions~~ threads to issue.
    ![](https://nyu-cds.github.io/python-gpu/fig/02-sm.png)
  - From [this](https://en.wikipedia.org/wiki/CUDA#Ontology), cuda core is just cuda thread because "GPU L0 cache".
  - From this [fermi doc p8](https://www.nvidia.com/content/pdf/fermi_white_papers/nvidia_fermi_compute_architecture_whitepaper.pdf), Register File is shared by cores -> "a full thread block".
  - "Machine Objects" contains things related with instructions and hardwares which are not used in *Processing*.
  - [warp scheduler p7](https://courses.engr.illinois.edu/cs433/fa2018/slides/chapter4-part2-full-1.pdf) which is similar to scoreboard and Tomasulo
- 549
  1. here "dedicated memories" means "**software**-controlled scratchpad memory."
    - scratchpad ["**manually**" managed](https://qr.ae/pyirsh) in [SRAM](https://stackoverflow.com/questions/30563123/cache-and-scratchpad-memories) (i.e. write something on and **keep** with you and "software-controlled")
- 551
  - [Systolic Array](https://www.telesens.co/2018/07/30/systolic-architectures/#Matrix_Multiplication_on_a_Weight_Stationary_2D_Systolic_Array_MXU_on_a_Google_TPU) is just *pass* data through the array. <a id="Systolic_Array"></a>
  - ["*activations* (to the Unified Buffer)"](https://medium.com/@antonpaquin/whats-inside-a-tpu-c013eb51973e)
- 553
  - TODO "message-passing" network diff "local area" network
  - whether caring 
    1. poorer communication performance
    2. dependability
    3. Also see p555 *three* major distinctions
       1. enough *independent* data sets
       2. Operational Costs over "longer lifetime"
       3. "economy of scale" due to "volume discounts" and related fault tolerance 
    decides whether to use clusters.  
  - [`MapReduce` p13 source codes][MapReduce] referenced [here](https://en.wikipedia.org/wiki/MapReduce#cite_note-17): 1. `Map` just *filter* target. 2. `Reduce` just do what to process on the target.
    "intermediate result of key-value pairs" just see [MapReduce] p2.
    [lisp map](http://clhs.lisp.se/Body/f_map.htm) just use one specific function.
    Also see p557
- 557
  - Reread 6.9 after the computer network.
  - ring vs bus, the ~~latter~~ former needs ["sent through the devices from sender to receiver"](https://www.geeksforgeeks.org/difference-between-ring-topology-and-bus-topology-in-computer-networks/) which results in the [latency](https://www.wevolver.com/article/understanding-ring-topology-a-detailed-exploration) (both bus and ring are simultaneous transfer, but the ~~latter~~ former implies transfer order). <a id="ring_bus"></a>
- 558
  - [bisection bandwidth][bisection_wikipedia]
    Since all data are passed through *only one bus*, so it is one "link bandwidth for the bus" ("*a single link* is as fast as the bus").
    ["the bandwidth between two partitions is minimum"][bisection_wikipedia] -> "worst-case metric" bacause it only calculates bandwidth between *2 nodes*.
    "bisection bandwidth is $(P/2)^2$" just take 4 nodes for example, after cutting it to halves, $P/2$ processors connect to $P/2$ **each** -> $(P/2)^2$.
- 559
  - ["multistage networks"](https://en.wikipedia.org/wiki/Multistage_interconnection_networks#Omega_network) just similar to neutral network.
    - [Crossbar](https://en.wikipedia.org/wiki/Multistage_interconnection_networks#Crossbar_Switch_Connections) is ~~similar to~~ fully connected.
    - `Omega` use **switch** to connect all nodes.
    TODO Topology.
      $2n\log_{2}{n}$ calculate *duplicate* lines for the middle boxes. See [this wikipedia](https://en.wikipedia.org/wiki/Multistage_interconnection_networks#Omega_network) 
      - wikipedia 
        $\log_2 n$ stages because each stage take one *box* input and output to two boxes.
        $\frac{n}{2}$ "switching elements in each stage" just because above "output to two boxes".
        $8!$ just mappings of 8 to 8.
        - TODO view Omega-network [example](https://github.com/vijendra/Omega-network) from [wikipedia](https://en.wikipedia.org/wiki/Omega_network).
          $2^12$: ~~why not $n*2^{\log_2 n}$ permutations.~~ 
          - A1: 
            ~~$2^{\log_2 n}$~~
            ~~Then all switching -> $2^{\log_2 n}^{\frac{n}{2}}$~~
          - ["blocking" tutorialspoint](https://www.tutorialspoint.com/what-is-blocking-networks-and-non-blocking-networks-in-computer-architecture) because each switch is *fixed* at runtime, so in the example, `100` and `101` can't be both connected to the *upper* port.
            So $2^{12}$ less than $8!$ 
            -> blocking and book "the Omega network cannot.". and "cannot send a message from P0 to P6 *at the same time* that it sends a message from P1 to P4"
          - From the book "FIGURE 6.16" the switch operations are sequential (i.e. in c., if A switched to C, then it can't continue to switch to D.) Better see tutorialspoint figure.
- 560 
  - "mapped onto chips" See [Fig. 2.2](https://www.semanticscholar.org/paper/COMPARISON-OF-SPHERICAL-CUBE-MAP-PROJECTIONS-USED-Dimitrijevic-Lambers/8cf18f4813589713b5b61af9a646141eb9a75156/figure/2)
  - TODO [Grid network](https://en.wikipedia.org/wiki/Grid_network) / grid topology
- 563
  - [Compute kernel](https://en.wikipedia.org/wiki/Compute_kernel) can be seen as just ~~one~~ SIMD threads ("no implied sequential operation").
  - [SPLASH 3](https://github.com/SakalisC/Splash-3) is mainly [OpenGL](https://en.wikipedia.org/wiki/OpenGL_Shading_Language#:~:text=OpenGL%20Shading%20Language%20(GLSL)%20is,on%20the%20C%20programming%20language.)
  - TODO [unstructured parallelism](https://sci-hub.se/10.1145/2486159.2486175) may just mean data-parallel (independent).
  - ["Cassandra"](https://en.wikipedia.org/wiki/Apache_Cassandra)
  - "because of, say, the algorithm" -> algorithm is unchanged So it *may prefer* some architectures.
- 564
  - [3Cs](https://courses.cs.washington.edu/courses/cse410/99au/lectures/Lecture-10-18/tsld035.htm)
- "FIGURE 6.19 Roofline Model": obviously at first Arithmetic Intensity $\propto$ memory performance, then due to "hardware limit", it becomes the "horizontal line".
  See the formula in 566
  - ["dual socket system"](#cpu_socket)
  - here "limited by memory bandwidth" mainly `FLOPs/Byte * Byte_count` doesn't generate enough FLOPS to fill execution units -> `Byte_count` is small -> 'memory bandwidth' is not high. 
- 567
  - "four times" because 2 times cores and 2 times floating-point units.
  - "fit in the caches": then it won't be limited by the memory bandwidth.
- 568
  - "fused multiply-add" just use the pipeline more optimizedly.
    Similar to 2 of "following two optimizations can help almost any kernel"
  - many stackoverflow Q&As has said that not "software prefetch" because modern processor hardware prefetch is always *better* than software prefetch.
  - TODO 
    - try [this](https://github.com/RRZE-HPC/likwid/wiki/Tutorial%3A-Empirical-Roofline-Model) to graph the *roofline*.
    - try Stream benchmark
  - "computational" roofline (i.e. computational ceilings) diff "memory" roofline
- 570
  - "Without ILP or SIMD" implies no overlap of floating-point operations. -> GFLOPS is constant.
  - TODO reread [more detailed](https://www.osti.gov/servlets/purl/963540).
  - Since "Arithmetic Intensity" is "FLOPs/Byte", it should be dependent on how to calculate but not how access.
    So p569 "optimizations that improve cache performance also improve arithmetic intensity." only improve "FIGURE 6.21" graph but not *arithmetic intensity* alone.
- 569
  - memory hierarchy optimization:
    1. unroll 
      this is similar to "memory affinity" -> TODO So why "moving the arithmetic intensity pole to the *right*" ?  
    2. "not first fill" -> delay fill. 
- 571
  - memory "bandwidth" check by STREAM or [others](https://unix.stackexchange.com/questions/32517/how-can-i-observe-memory-bandwidth)
    [physical info](https://www.cyberciti.biz/faq/check-ram-speed-linux/):
    ```bash
    $ sudo dmidecode --type 17 | grep -E -i "speed|type"                 
      Handle 0x0023, DMI type 17, 84 bytes
              Type: DDR4
              Type Detail: Synchronous Unbuffered (Unregistered)
              Speed: 3200 MT/s # just means mb/s; https://www.reddit.com/r/buildapc/comments/utmo78/is_mhz_and_mts_is_same/
              Configured Memory Speed: 3200 MT/s
        ...
      # https://v0dro.in/blog/2020/02/27/interpreting-stream-benchmarks/
    
    $ gcc -O3 -fopenmp -DSTREAM_ARRAY_SIZE=4194304 stream.c -o stream.o
    [czg /mnt/ubuntu/home/czg/csapp3e/self_test/benchmark]$ export OMP_NUM_THREADS=1                                                                           
    [czg /mnt/ubuntu/home/czg/csapp3e/self_test/benchmark]$ ./stream.o
    Function    Best Rate MB/s  Avg time     Min time     Max time
    Copy:           26886.5     0.002572     0.002496     0.002890
    Scale:          18345.5     0.003793     0.003658     0.004389
    Add:            20682.5     0.004904     0.004867     0.004944
    Triad:          20789.4     0.004903     0.004842     0.005059 # 20GB/s ?
    ```
- 580
  - using all threads may not as fast as expected (See Elaboration).
### 6.12 is just based on [TPU_3] 572~...
- [Permutation matrix](https://en.wikipedia.org/wiki/Permutation_matrix#Definition)
- **Better** see ["A Domain-Specific Supercomputer for Training Deep Neural Networks"][TPU_3] just TPU paper
- "convolution" just doing one function based on **steps**, just like how it is in signal processing.
- TODO reread after learning AI.
- [Ring-Reduce And All-Reduce](https://roman-kazinnik.medium.com/machine-learning-distributed-ring-reduce-vs-all-reduce-cb8e97ade42e) just similar to [ring](#ring_bus) while the former is consecutive (i.e. dependent) and the latter "independently".
- $64$ is $32*2$ in bisection which is obvious from the [TPU_3] figure 1.
- "TPUv3 supercomputer" has at least one link *each chip* while clusters is one link each *host*. So probably the former is faster.
  - "DSA supercomputer" just one computer with **enormous chips**.
  - "*four* custom Inter-Core Interconnect (ICI) links" just see [TPU_3] Figure 1
- liquid cooling is mainly based on the water block [3:15](https://www.youtube.com/watch?v=6knc_2vV1wE).
- ["loss scaling"](https://keras.io/api/mixed_precision/loss_scale_optimizer/#:~:text=Loss%20scaling%20is%20a%20technique,the%20loss%20scale%20as%20well.) just has its literally meaning.
- [tiered networking](https://www.leviton.com/en/solutions/industries/data-centers/architectures/threetier-network-architecture) similar to OSI
- inside 128x128 arrays -> [Systolic Array](#Systolic_Array)
- `15 nm` meaning [See](#cpu_die)
- 577
  - "latency-tolerant" because each core has many *threads*.
  - [coalescing hardware](https://www.intel.com/content/www/us/en/docs/programmable/683349/22-1/memory-access-coalescing-and-load-store.html). Also [see](#mem_coalescing)
  - [TCO](https://en.wikipedia.org/wiki/Total_cost_of_ownership)
- ["embedding"](https://developers.google.com/machine-learning/crash-course/embeddings/video-lecture) just remove redundancy.
  TODO reread p579 Embeddings.
  - [MLP](https://arxiv.org/pdf/2105.01601.pdf) 
### 6.10
- ["Ethernet"](https://www.techtarget.com/searchnetworking/feature/Whats-the-difference-between-internet-and-Ethernet) is mainly based on LAN. Just compare it with wifi.
- TODO 
  - [PHY and MAC](https://electronics.stackexchange.com/a/75597/341985) chip. [wikipedia](https://en.wikipedia.org/wiki/OSI_model#Layer_architecture)
  - reread FIGURE e6.10.3 
    "receive steps": 1,2 is same to "transmit" and 3~5 are a bit different.
    - why " the last three steps are time-critical" "since the first two ..." decides whether it is able to *begin receiving*.
  - "kernel network software stack" [1](https://www.thomas-krenn.com/en/wiki/Linux_Storage_Stack_Diagram) [2](https://the-linux-channel.the-toffee-project.org/index.php?page=3-links-linux-kernel-network-stack-and-architecture&lang=en)
  - "FIGURE e6.10.4" paragraph.
  - reread "561.e8"
- 561.e3 explains why to use DMA. " from or to a high-speed ko could be intolerable"
- See 334, `vectored interrupts` just uses one *Vector Table Base Register* to control the cause (similar to the virtual method table).
  `SCAUSE` just see [riscv_privileged] p70
- It shouldn't happen that "user programs could perform I/O *directly*." so "OS provides abstractions"
- "zero-copy" just skip the "intermediary buffers". <a id="zero_copy"></a>
  See ["then *unnecessary data copies*, from kernel space to user space and from user space to kernel space, can be avoided by using *special* (zero-copy) system calls"](https://en.wikipedia.org/wiki/Zero-copy#Principle) and ["across the kernel-user boundary to the *application* ... reduces the number of *context switches* between kernel and user mode."](https://developer.ibm.com/articles/j-zerocopy/)
- From [this](https://en.wikipedia.org/wiki/Cyclic_redundancy_check#Standards_and_common_use)
  Also see [this](#hamming_distance)
  - TODO 
    - [CRC weights](http://users.ece.cmu.edu/~koopman/roses/dsn04/koopman04_crc_poly_embedded.pdf)
    - how to calculate [hamming_distance](https://stackoverflow.com/a/27865713/21294350) in CRC
- ["Preamble"](https://erg.abdn.ac.uk/users/gorry/course/lan-pages/mac.html) and others.
- "PCIe round-trip" just means transmit time by ["before write() and after read()"](https://forum.peak-system.com/viewtopic.php?t=5574#p12918) and "waits for the reply" in the book.
- check PCIE [version](https://superuser.com/questions/693964/can-i-find-out-if-pci-e-slot-is-1-0-2-0-or-3-0-in-linux-terminal) and [lane](https://unix.stackexchange.com/questions/393/how-to-check-how-many-lanes-are-used-by-the-pcie-card)
  ```bash
  $ sudo lspci -vv | grep -E 'PCI bridge|LnkCap'
                  LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                ...
  ```
- [Internet Protocol](https://en.wikipedia.org/wiki/Internet_Protocol) deals with "IP network"s. Also [see](https://csrc.nist.gov/glossary/term/transmission_control_protocol#:~:text=Whereas%20the%20IP%20protocol%20deals,in%20which%20they%20were%20sent.)
- ["*double*-checking the contents with the TCP CRC"](https://softwareengineering.stackexchange.com/questions/378724/has-crc-check-on-top-of-tcp-any-meaning)
- IP header [checksum](https://en.wikipedia.org/wiki/Internet_checksum#Examples) "ones' complement" implies `ffff`.
  TODO how `carry` bit transfered.
- ["elegance of TCP/IP"](https://www.nakov.com/inetjava/lectures/part-1-sockets/InetJava-1.1-Networking-Basics.html) "broken into multiple packets"
- ["DMA controller knows nothing of virtual memory" -> a *contiguous* block of physical memory.](https://www.science.unitn.it/~fiorella/guidelinux/tlk/node87.html)
- e9 "remapping"s are all skipping some hardwares.
### openmp
- See [IBM reference](https://www.ibm.com/docs/en/zos/2.4.0?topic=descriptions-pragma-directives-parallel-processing) or [omp_greeencard_3_0] from [this Q&A](https://stackoverflow.com/a/1500435/21294350) ([latest][openmp_ref])

- Better see [example_doc][openmp_example]
  - reduction
    - p433 `inscan`
      [Prefix sum](https://en.wikipedia.org/wiki/Prefix_sum)
      also [see](https://passlab.github.io/OpenMPProgrammingBook/MultiCoreMultiCPU/2_UsingOpenMP_parallel.html#reduction-clause).
      - ["inclusive or exclusive scan"](https://en.wikipedia.org/wiki/Prefix_sum#Inclusive_and_exclusive_scans)
      - The first example codes implies "inclusive" by "indicates that value a[k] (a(k) in Fortran) is included"
    - Notice ["2.19.5 .4" of `reduction`](https://www.openmp.org/spec-html/5.0/openmpsu107.html#x140-5890002.19.5.4) "a *private copy* is created in *each implicit task or SIMD lane*" and "*After the end* of the region, the original list item is updated with the values of the private copies using the *combiner* associated with the reduction-identifier." just corresponds to the [COD_RISC_V_2nd] p539 and p540 codes
    - Task Reduction in [openmp_example] p399 just corresponds to conditions where some other *prerequisites* are needed before the reduction task (i.e. nested task where reduction is nested in a bigger one).
    - Notice ["Initializer"](https://www.openmp.org/spec-html/5.0/openmpsu107.html#x140-5810002.19.5.1) implied by "reduction-identifiers"
    - "the original list item ... the update of the *original list item* ... as a *result* of the reduction computation." implies `list` stores the result.
- why use `omp parallel for`
  - See [introduction p20](https://www.openmp.org/wp-content/uploads/Intro_To_OpenMP_Mattson.pdf) which is in [omp_Tutorial]
  - Better to read [old specification](https://www.openmp.org/wp-content/uploads/cspec20.pdf) and old[omp_greeencard_3_0] for detailed infos like `parallel for`
- `(NUMA)` stills has "single address space" where "some memory accesses are much *faster* than others" due to "main memory is divided".
### CUDA
- p543
  - some [restrictions](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#restrictions)
  - OPENCL can be seen as [open-source version](https://saturncloud.io/blog/what-is-the-relationship-between-nvidia-gpus-cuda-cores-and-opencl-computing-units/#how-do-cuda-cores-and-opencl-computing-units-relate-to-each-other) of CUDA.
  - "multithreading, MIMD, SIMD, and instruction-level parallelism" are all based on "CUDA Thread"s.
- [tutorial](https://cuda-tutorial.readthedocs.io/en/latest/tutorials/tutorial01/) based on `C`. (notice this is not compatible with `cuda_12.2.r12.2/compiler.32965470_0`)
  archlinux cuda [installation](https://wiki.archlinux.org/title/GPGPU#CUDA)
### 531
- "dozens of operations" because *64 elements* of 64-bit double data.
- "register" stores element number. So no need to add too many "SSE, SSE2",etc.
  So "better *matches to compiler* technology"
- "strided accesses" and "indexed accesses" (one enhanced) See [riscv_V_ext] 7.5/6 .
  Better see [this p20](https://riscv.org/wp-content/uploads/2017/12/Wed-1330-RISCVRogerEspasaVEXT-v4.pdf)
  Or TODO see [arm doc](https://developer.arm.com/documentation/ddi0602/2023-06/SME-Instructions/LDNT1D--scalar-plus-scalar--strided-registers---Contiguous-load-non-temporal-of-doublewords-to-multiple-strided-vectors--scalar-index--#execute) 
  - ["gather-scatter"](https://en.wikipedia.org/wiki/Gather/scatter_(vector_addressing)#Gather) implies index.
### 534
- ["operating system state."](https://byjus.com/gate/process-state-in-operating-system-notes/) because it is the operating system to *control* the processes.
- fine-grained vs *Coarse*-grained
  1. whether "overcome throughput losses"
  2. "Coarse-grained multithreading need pipeline be empty" because it needs *much more slots* than "Fine-grained multithreading" in the pipeline to do many instructions itself. Also see [this](https://stackoverflow.com/questions/76726857/why-do-pipeline-constraints-of-coarse-grained-multithreading-and-fine-grained-mu/76734313?noredirect=1#comment135281908_76734313).
    Also due to updating the "FP rounding mode" "by draining the pipeline on change" (i.e. changing state like the thread context). Note: this can also be done with "register *renaming*".
### Concluding Remarks
- "Warehouse-Scale Computers" -> WSC in 554
- [sublinear](https://en.wikipedia.org/wiki/Time_complexity#Sub-linear_time) performance
### check-yourself
- [x] 522 No
- [x] 527 false
- [x] 533 True
  TODO try [`_mm256_i32gather_pd`](https://johnnysswlab.com/when-vectorization-hits-the-memory-wall-investigating-the-avx2-memory-gather-instruction/) Also [see](https://stackoverflow.com/questions/24756534/in-what-situation-would-the-avx2-gather-instructions-be-faster-than-individually)
  More detailed [see](https://www.felixcloutier.com/x86/vgatherdpd:vgatherqpd#operation) which mainly use "vector register specifies an index" in [intel_64] p544.
  [scatter](https://www.intel.com/content/www/us/en/docs/cpp-compiler/developer-guide-reference/2021-8/intrinsics-for-int-gather-and-scatter-ops.html) operation like [`VPSCATTERDD`](https://www.felixcloutier.com/x86/vpscatterdd:vpscatterdq:vpscatterqd:vpscatterqq) also use VSIB.
- [x] 537 
  1. True
  2. True
- [x] 541 False
- [x] 549 False
- [x] 552 False
- [ ] 557
  1. False. Because independence is implied.
    Ans: should be "explicit"
  2. False. no casual relation.
    "separate memories" implies no share -> "many copies of the operating system".
- [x] 560 True
- [ ] 561.e9 **no ans**
  1. polling, DMA
  2. interrupts, DMA
- [x] 571 True
## appendix
### A from here read [this][COD_RISCV_2nd_A_appendix] with ~~indexed~~ bookmarked appendix.
- 4
  - difference between "combinational" and sequential logic. Same as what [verilog_md] says. 
    So "truth table" only applies to "combinational".
  - ~~TODO "only the truth table entries for the nonzero outputs."~~ -> "Chapter 4" uses `X` to simplify the truth table.
    This corresponds to A-17 "Don’t Cares"
- 7
  - A.2 exercise
    [De Morgan's laws](https://en.wikipedia.org/wiki/De_Morgan%27s_laws) ${\displaystyle {\begin{aligned}{\overline {A\cup B}}&={\overline {A}}\cap {\overline {B}},\\{\overline {A\cap B}}&={\overline {A}}\cup {\overline {B}},\end{aligned}}}$
    $\overline{A\cdot B\cdot C} = \overline{A} + \overline{B} +  \overline{C}$ Then combine with the former -> 
    $A \cdot B \cdot \overline{A}$ is obviously $0$ and same to $A \cdot B \cdot \overline{B}$
    Then only left $A \cdot B \cdot \overline{C}$

    Above is same as [this](#appendix_A_exercise_ans) says
  - $B \verb!^! C$ -> $B \cdot \overline{C} + C \cdot \overline{B}$ [See latex caret](https://tex.stackexchange.com/questions/77646/how-to-typeset-the-symbol-caret-circumflex-hat)
- TODO learn the boolean algebra.
  why AND,OR,inversion are enough to build the logic and one of "NOR and NAND" is enough -> See [this](https://en.wikipedia.org/wiki/NAND_logic#Making_other_gates_by_using_NAND_gates)
- "synthesize combinational logic" just means "combinational logic" can be ["converting ... into an optimized *gate-level* representation ..."](http://www.doe.carleton.ca/~shams/ELEC4708/Lab2SimulationsTut2014.pdf)
  [example](https://www.doe.carleton.ca/~shams/ELEC4708/Lab2SynthesisTut14.pdf)
- "any logic function can be implemented with *only AND, OR, and NOT* functions" maybe can be thought as one [axiom](https://qr.ae/pyac5h).
- 11
  - "the truth table" only care about `true` entry. 
    This is just what "digital circuit" book says.
  - explains how PLA generated.
- PROM is only "written only once" (i.e. "programmed just once") and ["irreversible"](https://www.geeksforgeeks.org/difference-between-prom-and-eprom/)
  EPROM is opposite "may be reprogrammed".
- TODO why Flash memory is faster than EEPROM since they are [both flash](https://electronics.stackexchange.com/a/219704/341985) after all.
  - flash [naming "be done at high speed,"](https://en.wikipedia.org/wiki/Read-only_memory#Solid-state_ROM)
  - See ROM [categories](https://www.electrical4u.com/read-only-memory/)
  - TODO ROM [logic](https://www.javatpoint.com/rom)
- A-15
  - here ROM just map the whole table instead of reusing *gate* logics. -> "fully decoded".
    "contain more entries" -> at least all $0$ outputs.
    - 8 entries -> 8 rows in A-14.
    - 3 bits wide -> 3 outputs.
    - Also see [this](https://madpcb.com/glossary/logic-device/) where 
      "PLA" -> "programmable AND gate array, which links to a *programmable OR* gate array"
      "PAL" -> "*fixed*-OR, programmable-AND". This is one type of "SPLD"
      CPLD -> "contain the equivalent of *several PALs* linked by programmable interconnections"
      GAL -> "has the same logical properties as the PAL but can be *erased and reprogrammed*". [See](#EEPROM) 
  - "examples in Appendix C" in A-16 -> "C-12".
  - FPGA is similar to PLA by ["have PLA-Structure"][PLD_FPGA] which is one of [PLD][PLD_FPGA] where "field-programmable" means ["programmed by the *customer*".][PLD_FPGA]
    Better see [COD_RISCV_2nd_A_appendix] A-77 "field programmable gate arrays (FPGAs), which provide both combinational logic and *flip-flops*" (i.e. "possibly memory devices")

    Also see [PLC vs PLD "PLD is a *variable* logic device" "PLC is generally used for the *weak* point to *drive strong* electricity"](https://www.fpgakey.com/technology/details/on-the-difference-between-plc-and-pld#:~:text=PLD%20is%20the%20abbreviation%20of,can%20sometimes%20ignore%20the%20two.)
- [Karnaugh map](https://en.wikipedia.org/wiki/Karnaugh_map#Solution) just use color to "cover" all *ones* by "grouping" 1s (here grouping just means "cover").
  it can also solve by [grouping 0s](https://en.wikipedia.org/wiki/Karnaugh_map#Inverse) or more aggressive when [`X`](https://en.wikipedia.org/wiki/Karnaugh_map#Don't_cares) exists
  Maxterm -> ["maximum area of 1s"](https://www.allaboutcircuits.com/textbook/digital/chpt-8/minterm-maxterm-solution/)
  - Race hazards just because changing from one *product* to another in [SOP][SOP] which cause one "potential glitch".
    Just use one new "additional term of $A\overline{D}$" to make *the states together*.
  - more ~~easy~~ [basic](https://en.wikipedia.org/wiki/Karnaugh_map#2-variable_map_examples) examples
  - Notice: here ["Elimination"](https://en.wikipedia.org/wiki/Karnaugh_map#Elimination) is based on *torus* so `0010` is adjacent with `0000` (the `ABCD` order).
- “multiple sources and uses” 
  sources -> multiple bits
  uses -> just as inputs of multiple multiplexors
- TODO continue reading [Ada](https://www.electronicdesign.com/technologies/communications/iot/article/21801203/comparing-ada-and-c)
  kw: "a focus on support for *embedded real-time*"; "through features that include *checks* either statically or at run time."; "strongly *typed extensible* language ... definition of constrained *subranges* of scalar values"
- [Full adder](https://en.wikipedia.org/wiki/Adder_(electronics)#Full_adder) adds carry based on half-adder.
  - explains how the adder in A-26 is implemented.
  - This also explain how full adder implemented by *2 half adder*.
    "carry outputs from the two half-adders are connected to an OR gate" because $A+B=0b10$ which will eliminate the $C_{in}$ influence. So need `OR` to recover.
    "2 gates (AND and OR) in carry-block" just see [COD_RISCV_2nd_A_appendix] "FIGURE A.4.1".

    Notice: "one XOR gate in adder and through 2 gates (AND and OR)" can be declined to 2-level with the help of the *truth table* by dropping the `ADD` to get the first `S` ("output S as one of the inputs to the second half adder").
- A-27 notice here `+` is the OR operator.
- A-28 "Sum" can be just directly same architecture as CarryOut with [sum of product][SOP]
- "FIGURE A.5.8" explains how "CarryIn" architecture constructs the *2's complement*.
  "helps explain why two’s complement representation has become the *universal standard*"

  And 1's complement sum is $\sim 0$, so not convenient although the hardware is simpler.
- Notice: A-31 need *all bits* of $b$ to do negation (just as what 2's complement needs to do) to do subtraction.
  See A-32 "both CarryIn and Binvert to 1"
- "the difference is negative, then a < b" -> so track the *sign* bit which is what "FIGURE A.5.11" does.
- A-31 overflow check see [this](#check_overflow) where check *sign* of inputs and outputs.
  
  Also see A.24 by "Exercise A.24" in A-33 ([appendix_A_exercise_ans] p12)
  But it doesn't show how to check overflow but implies that overflow will *change the sign*.
- "output from the most significant ALU bit ... for the slt operation is *not* the output of the adder" may be wrong because $a<b$ will cause the sign (i.e. the *most significant*) to be $1$, then just corresponds to `set`.
- A-35 [See](#ALUop)
- A-38 Fast Carry simplification is based on "two levels of logic." -> $\cdot$ and $+$.
- A-45 "taking the shortcut" similar to forwarding in the pipeline.
- A-46 TODO "ALU using CMOS transistors" by using "switches" instead of "multiplexors" based on gates.
  
  $g_{4\ldots 1}$ -> $G_0$ in A-40
- TODO A-47 "may not be the best choice" -> [DDR](#DDR) mem is "edge-triggered" but obviously its ancestor isn't
- ~~TODO~~ A-48 what timing methodology can't "both an input and output"
  [level triggering](https://www.geeksforgeeks.org/edge-triggering-and-level-triggering/) may update too frequently, So it can't apply the above principle.
- TODO maybe "change on the opposite clock edge" just to avoid race.
  And "one-half clock cycle" is enough, maybe no need to use "the more usual full clock cycle"
  Also to ~~decrease latency~~ "reduce the pipelining overhead." because update frequency is lower.
  Chapter 4  just use hardwire with `read` and `posedge` with `write` by `@(posedge clock) if (RegWrite) RF[WriteReg] <= WriteData;`.
- A-57
  - SRAMs and DRAMs cell implementation. See [this](#SRAM)
  - access time [influenced](https://en.wikipedia.org/wiki/Static_random-access_memory#SRAM_operation) by
    1. accept all address bits at a time
    2. Asynchronous?
  - "4M entries" -> word lines
  - "8-bit data output line" -> why [this](#DRAM) has "All storage cells in the open *row* are sensed simultaneously"
- the [enable signal](https://www.instructables.com/DIY-SRAM-The-RAM-in-your-Microcontroller/#step2) just connect to the *gate* of MOSFET. (similar to [this](https://www.researchgate.net/figure/Typical-bit-write-enable-desig_fig2_224370313)) 
- ~~->~~ "but a pulse with a *minimum width* requirement" is same to why latch needs pulse (i.e. "the setup times, the hold times").
- "stand-by" power mainly related with ["Machine state is held in *RAM*"](https://en.wikipedia.org/wiki/Sleep_mode#Sleep).
- A-58
  - "setup-time and hold-time" applies to all sequential logic with *states*.
  - "tristate buffer" may be similar to (but output opposite by "tristate buffer is equal to the data input signal") ["tri-state inverter"][iolts_2009] which is used in "standby mode" and "trengthen the charge"
    where Tri-State Inverter is [4 MOSFETs](https://faculty-web.msoe.edu/johnsontimoj/Common/FILES/tristate_inverter.pdf)

    - in [iolts_2009] 
      - p3: when $\overline{WL}=0$ the leftmost input of the "tri-state inverter" constructs one loop connected by **two NMOSs**.

      "high impedance" because it is like [switch "Tri-state Buffer Switch Equivalent"](https://www.electronics-tutorials.ws/logic/logic_9.html). See [this](#high_impedance)
      - "use *capacitors* in SRAM cells to absorb the excessive charge" -> "floating body" in ["15" reference](https://sci-hub.live/10.1109/TDMR.2005.853451).
  - "each cell that corresponds to a *particular output* can share the same output line" -> multiple word lines share bit lines
  - "FIGURE A.9.3" -> one address corresponds to 2 bits -> here word is 2 bits.
- "two-step decoding" similar to Multilevel Paging
  TODO why FIGURE A.9.4 "select 1 bit from *each* 1024-bit-wide array"
- "a burst of data" -> [Subsequent words of the burst will be produced in time for *subsequent* rising clock edges](https://en.wikipedia.org/wiki/Synchronous_dynamic_random-access_memory#Construction_and_operation)
  notice: "wrapping back to the start of the block" like `5-6-7-4`.
- A-63 [$\overline{RAS}, \overline{CAS}$](https://en.wikipedia.org/wiki/Dynamic_random-access_memory#Principles_of_operation_2)
- A-64
  - "access times much longer (by a factor of 5–10)" mainly due to ~~the size~~ [the "refresh"](https://www.enterprisestorageforum.com/hardware/sram-vs-dram/#:~:text=DRAM%20requires%20little%20bursts%20of,can%20be%20around%20ten%20nanoseconds.) but not the two-level circuitry because SRAM also has this.
  - “64M × *4* DRAM actually accesses 8K bits on every row access” and "throws away all but *four* of those during a column access"
    just means each column contains 4bits which is the *minimum* unit.
- A-66
  - 3 bit distance can't correct "2-bit errors" because it defaultly assumes that "a single error is a much higher probability.", So it will probably correct by *adding one error* which has *the minimum changes* (obviously this is wrong).
  - "truth table" of one combinational logic -> "finite-state machine" of one sequential logic.
    take SRAM as the example
    - when writing data, "the output function" (i.e. data) may be dependent on "the next-state function" (i.e. current write data) by [this](#additional_logic_register_file_write)
  - TODO $2n$ states should be $2^n$.
  - 365.e14 
    Notice in 1st riscv version, it is "e4.13.4"
    "e4.14.4" is the final pipeline implementation which "incorporates the basic logic for *branches* and control hazards" as 365.e8 says. (notice these has no states for "finite-state machine")
    "e4.14.6" and "e4.14.7" corresponds to detailed verison of "e4.14.5" (these are "finite-state machine"s)

    take "e4.14.7" for the example:
    "the output function is often restricted to depend on just the current state" because output like `ALUOp` to `Datapath` take something like `(state === 1)` and *internal vars* like `MemoryOp` to output constants like `2'b01` or others like `opcode`. <a id="internal_opcode"></a>
  - from "FIGURE 5.38" where *controller* states are dependent on the input (i.e. whether the *memory* is ready).
    Compared with "e4.14.7" where cpu *integrated* the `Datapath` module *inside* which includes `opcode`. So the states are not dependent on the inputs.

    "show a Verilog version of finite-state control using a Mealy machine" -> From "FIGURE e5.12.8" it is also dependent on one input `rst` by `if (rst) rstate <= idle;`.
- A-68
  - notice `EW/NScar` shows whether it needs to *conform to the time cycle* since letting cars on one directional road wait for one *empty* sequence on the other directional road is nonsense.
- A-78
  - FPGA: "a combination of gates and flip-flops" is similar to the structure of the [SRAM](#SRAM) where it typically uses 4 MOSs / 2 resistors and 2 MOSs to *hold* the state.
    Also implied by "basically small, programmable RAMs".

    Notice: "Newer FPGAs contain more sophisticated building blocks such as pieces of *adders* ... contain 64-bit RISC-V cores"

    TODO "In addition to programming each cell to perform a specific function, the *interconnections* between cells are also *programmable*"
    See [p8 overview of FPGA mesh architecture,p7 Fig. 2.4 "Configurable Logic Block" (here minimum CLB logic is based on multiple base and gates,etc.) and p9 Fig. 2.6 "connection box"](https://cse.usf.edu/~haozheng/teach/cda4253/doc/fpga-arch-overview.pdf)
#### A.11
- why use "edge-triggered"
  1. "correctly without *races*"
- "from one flip-flop through the combinational logic to another flip-flop" to make the states able to *propagate*.
- A-73
  - ~~here $\Delta$ should be $<0$, if $>0$, then the slave just wait longer for the rising edge (if rising-edge triggered).~~
    here $\Delta>0$ make the 2nd flip-flop fails to propagate the *old state* before the 1st flip-flop has changed the *old state* -> "race forward".

    Then add $t_{skew}$ to both 1st and 2nd flip-flop, then 1st will *delay* its change to the old state. 
  - with $t_{skew}<0$ -> second flip-flop sees the clock *earlier*.
    rising-edge may overlap with $t_{setup}$ and even earlier signal, so it will read one *old state*.
    This is why cycle should *add* 
    $t_{skew}$ to *offset* the recession. -> "can also arrive in the *opposite* order ... arriving $t_{skew}$ earlier"
  - kw: "carefully *routing* the clock signal"
  - po "clock skew can also *affect the hold-time* requirements" -> better $t_{skew} < t_{hold}$. So it can be hidden.
  - "requires more logic" [See](#edge_triggering)
- "FIGURE A.11.4"
  - assume the ~~low~~high-level Timing by "respective clocks must be *asserted*".
    Then at the beginning the high $\varPhi_{2}$ latch the ~~1st output~~ 
    2nd $D$ to $Q$ and the input $Q_1$ unchanged because of low $\varPhi_{1}$.

    Then $\varPhi_{2}$ -> low and 
    $\varPhi_{1}$ -> high to pass the $Q_2$ -> $D_3$.

    TODO why "minimum delay of any logic block".
  - since "alternate the use of latches", if $\varPhi_{2}$ and 
    $\varPhi_{1}$ both high, then all $Q,D$ will keep changing and *unstable*.

    "*latched* by a φ2 clock, which is open only during φ2 when the input latch is closed and hence has a valid output" here latch means the latch is *open and propogate* data.
- "synchronous with the input clock." because the clock *controls when* to write data -> implies synchronous.
  "held asserted until it is acknowledged" maybe means *cpu will tell I/O* device it has *received* the data.
#### A.8
- "flip-flops and latches" [diff][latch_flip_flops_diff]
  - "reserve the term flip-flop exclusively for *edge*-triggered storage elements and latches for level-triggered ones"
    
    Here [edge-triggering](https://sites.ualberta.ca/~gingrich/courses/phys395/notes/node143.html#:~:text=Edge%20triggering%20is%20when%20the,the%20high%20or%20low%20state.) is realized by *delay* with inverter. So their basic ideas are same except that [flip-flop](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#D_flip-flop) has one *clock* to synchronize. <a id="edge_triggering"></a>
    Also see "FIGURE A.8.4" where just use one latch function as one delay and "contain additional gates used to store signal values" in A-50

- "recycled by inverting it to obtain Q" -> when $S=0,R=0$
- [positive-edge-triggered D flip-flop](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#Classical_positive-edge-triggered_D_flip-flop) from [ti](https://www.ti.com/lit/ds/symlink/sn74s74.pdf)
  Notice "Dual D-Type Positive-Edge -Triggered Flip-Flops" has many implementations like [1 p5](https://www.ti.com/lit/ds/symlink/sn74s74.pdf) and [2 p2](https://assets.nexperia.com/documents/data-sheet/HEF4013B_Q100.pdf)
  
  ~~Pass transistor~~ Transmission gate See [this "CMOS Transmission Gate"][Transmission_gate] which is just [COD_RISCV_2nd_A_appendix] "tristate buffer".
  <img src="https://www.electronics-tutorials.ws/wp-content/uploads/2018/03/comb69.gif" alt="drawing" width=" 350"/>
  Pass transistor from [COD_RISCV_2nd_A_appendix] A-62 -> NMOS/PMOS as one switch.
  - how [this figure][Classical_D_flip_flop] referenced in [this](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#cite_note-27) function same as half of [this](https://en.wikipedia.org/wiki/File:D-Type_Flip-flop_Diagram.svg) (i.e. ["D-type Flip-Flop Circuit"](https://www.electronics-tutorials.ws/sequential/seq_4.html) and [Gated D latch][Gated_D_latch])
    
    - why "if D = 1, the upper output becomes low".
      just take `Q` of the bottom-left latch `RS_1` as `A` and  the top-left latch (`RS_2`) `Q` as `B`
      Then inputs of `RS_1` is $R_1=\overline{B}\&CLK, D$ and inputs of `RS_2s` is $R_2=\overline{A}, CLK$
      
      So in the right `RS_3`
      $\overline{B}$ reset $A$ 
      $\overline{B}=\overline{A}=R_3$ (-> "to two input combinations (01 and 10) for the output $\overline{SR}$ latch")
  - "the clock signal *continues* staying high, the outputs *keep* their states" -> why edge-triggered <a id="level_keep"></a>
    just "as the *input logical zero* (of the *output stage*) remains active while the clock is high" <a id="input_logical_zero"></a>
    (compare it with "$\overline{SR}$ NAND latch" where input $\overline{S}=0$ will always keep the output $Q$ as `1`
    
    and [Gated D latch][Gated_D_latch] where no output set control with the input to output something. (i.e. "while in the positive-edge-triggered D flip-flop $\overline{SR}$ NAND latches")
    )

    For example, 
    1. when `CLK` keeps `1` and `D` changed from `0` to `1`, 
      then the old $A$ keeps $0$ (corresponds to [this](#input_logical_zero)) 
      so the 
      $\overline{A}$ still is $1$. -> implicitly ""lock" the active output producing low voltage (a *logical zero*)".
      So $D$ won't propagate its influence.
    2. when `CLK` keeps `1` and `D` changed from `1` to `0`, then 
      $\overline{A}$ will change from $0$ to $1$,
      But 
      $\overline{B}$ is still stays old $\overline{A}=0$, (corresponds to [this](#input_logical_zero))
      so $A$ (left 3rd from top to bottom) and $B$ (left 1st from top to bottom) keeps $1$ -> implicitly ""lock" the active output producing low voltage (a *logical zero*)".
      So $D$ still won't propagate its influence.
    - other cases
      1. ~~falling~~ negative edge and low level, just "If the clock is low, both the output signals of the input stage are high regardless of the data input" because of `NAND` logic outputs `0` when one input is `0`.
      2. positive-edge works because the old $A=1,\overline{B}=1$
        So the left 3rd and 4th logic gate from top to bottom are all *only* dependent on $D$ ( just function as [Gated_D_latch])
    - So "store the data only while the clock is low." may should be "also when keeping high level" TODO
  - [history](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#History)
    - JK flip-flop just one notation like `ABC` by "Nelson assigned letters to flip-flop inputs as follows".
    - po "flip-flop" -> "flip" -> "edge-triggered"
    - latch -> "a gated D latch with latched input gates" See [this](#level_keep) just means high/low level will keep the states. 
  - TODO
    ~~- why "regardless of the data input" since $D=0$ must reset $A$~~
      ~~Then how does this result -> "to store the data only while the clock is *low*."~~
- T Flip Flop formed from [others](https://www.javatpoint.com/t-flip-flop-in-digital-electronics) where D and RS can be verified by setting $Q=0/1$ then all obvious.
  [J-K](https://www.electronics-tutorials.ws/sequential/seq_2.html) just by its [definition](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#JK_flip-flop).
- "all the *latches* and flip-flops we will use from this point on are *clocked*" -> this ~~is~~ seems to be a little different from what [wikipedia][latch_flip_flops_diff] defines where latches think of clock *defaultly asserted*.
  From "FIGURE A.8.2" and [Gated_D_latch], they are just same where `E` of latter is `C` of the former.
- "transparent latch" means it functions like one wire which is *transparent*.
  Also see "Flip-flops are not transparent ..."
- A-52 "Setup time" is just to make the *master* latch able to store the data (take one extreme condition, D positive edge is same as C negative edge, then obviously master doesn't store the data because *no C high level* now)
  Also see [this realworldtech](#setup_time) which explains better.
  "Hold time" is similar, to make the *slave* latch able to store

  "Hold times are usually either 0 or very small" because the state has been *latched* in the master and it won't be changed quickly *after the falling-edge* (better see above realworldtech figure, where falling/rising-edge is *one process*.)

  Here "Setup time" actually includes Setup time in realworldtech and $t_{prop}$ "FIGURE A.11.1". So it is longer.
- A-55 [decoder](https://www.tutorialspoint.com/digital_circuits/digital_circuits_decoders.htm) just same to use truth table.
  - TODO how "attached implicitly." -> `@(posedge clock)` and "hooked up ... implicitly" -> `if (RegWrite)` (i.e. try )
    - [yosys](https://www.edaplayground.com/x/hv6B) is not efficient (zoom the svg to view the big image).
    - vtr seems also [not valid](https://electronics.stackexchange.com/a/61595/341985) 
    - also see [1](https://electronics.stackexchange.com/questions/26570/generic-free-verilog-synthesis-tools) and [2](https://electronics.stackexchange.com/questions/612948/fpga-verilog-synthesis-and-simulation-open-source-appoach)
  - "extensive use" ~~doesn't~~ include "additional logic in the register file or *outside* of it is needed" maybe by `assign` to hardwire connect. <a id="additional_logic_register_file_write"></a>
- "continuous assignment" -> `assign` almost without delay see A-23
#### A.6.
- "propagate" means propagate a *carry* -> $( a_i + b_i ) ⋅ c_i$ -> has "FIGURE A.6.1" "*plumbing* analogy" ~~-> A-39 $c_4$ expression with no ~~ (i.e. "valve" controls whether to "propagate")
  Also see A-39 for naming of it and "generate"

  Here "abstraction" just use some symbol for some reusable expression. 
- Since one level of Abstraction (i.e. $p_i,g_i$) "*considerable* logic even for a 16-bit adder." -> Second Level of Abstraction
##### Also see [this](#fast_carry)
- it says A-40 $P_i,G_i$ relation with $c_{4i}$
  Also by "carry out of the *most significant* bit of the 4-bit group."

  Notice: the function of "propagate" by "all the intermediate propagates" which is similar to ML network propagation
  Better see "FIGURE A.6.2" for the intuitive understanding.

- "FIGURE A.6.3"
  Here use one cycle (i.e. one level of abstraction) to calculate all $p_i,g_i$ because they *only depend on* $a_i,b_i$ and then combines to $P_i,G_i$ from the FIGURE A.6.3 (Also can use one more cycle if the hardware overheads of direct $P_i,G_i$ are too high) in **ALU**.

  Then one more cycle to $C_i$ from FIGURE A.6.3 in **"Carry-lookahead unit"** by "come from the carry-lookahead unit".

  Notice: from A-45 EXAMPLE, here $p_i,g_i$ *won't be expanded* in $P_i,G_i$ so take more delay.

- A-40 Notice "very similar" between two levels of abstraction.
#### exercises related
- A-42
  - A.28 not included in [appendix_A_exercise_ans]
    - [ ] no official answer ?
      1. obviously ripple adders $2T*(4-1)=6T$ because of blocking
        wrong See A-45 EXAMPLE -> should be $2T*4=8T$
      2. carry lookahead -> $2T$

      From A-45 EXAMPLE two-level -> 
      1st level: 2T
      2st: 2T
  - A.31 
    From "FIGURE A.14.1", it similar to propagation. "a single normal adder" -> the last row of "lower right of Figure A.14.1".
    
    comparing with "ripple carry" it decreases the length of the longest dependency chain (i.e. $s_5$)
    This is same as what [appendix_A_exercise_ans] A.34 says: 
    > many such paths, all with a time delay of 7 × 2T = 14T.
    Here 7 -> $a0,e0,e1,...,e3,f3,s4$
#### verilog, also [see][verilog_md]
- set bit [length](https://stackoverflow.com/a/40124569/21294350). Notice the *intermediate* data length.
- "high-impedance" because ["no current." from wikipedia reference](https://web.archive.org/web/20170429052914/http://www.cs.umd.edu/class/sum2003/cmsc311/Notes/CompOrg/tristate.html) -> ["tri-stated"](https://en.wikipedia.org/wiki/High_impedance) <a id="high_impedance"></a>
  Also see differences in verilog [1](https://stackoverflow.com/a/49987958/21294350) and [2](https://www.edaboard.com/threads/diff-b-w-unknown-value-x-and-high-impedance-value-z.71160/#post-313472).
  ["if not all FPGAs *do not have internal tristate* routing networks"](https://electronics.stackexchange.com/a/219778/341985) -> "we will not discuss in this appendix"

  Also see [COD_RISCV_2nd_A_appendix] A-59 "allows a three-state buffer whose Output enable is asserted to *drive* the shared output line" (i.e. it has no influence to the circuit).
##### synthesize
- 24
  - `always` -> "reg does not synthesize into a register".
    Then use "inputs appear in the sensitivity list"
  - "assigns a value to the exact *same* set of bits" just make the output can be *truly multiplexed*.
  - "all combinational logic in a *continuous* assignment or an always block." just make it not sequential where continuous means `assign`.

### B
Notice:
1. CUDA doc [online](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#intrinsic-functions) or [pdf][CUDA_doc]

---

something like "The programming model scales transparently to large numbers of processor cores" and *others* are duplicately said in this section ......

- [PC](https://streamersplaybook.com/pc-vs-desktop-whats-the-difference/) -> Windows-based computers which is subset of *desktop*.
- [graphics (i.e. vector) vs images (i.e. raster)](https://www.quora.com/What-are-the-differences-between-graphics-and-images) and [vector](https://guides.lib.umich.edu/c.php?g=282942&p=1885352) is mainly based on formulas,etc. <a id="graphic_image"></a>
- [1st GPU in 1999](https://en.wikipedia.org/wiki/GeForce_256)
  ["display generator" -> Video-*signal* generator](https://en.wikipedia.org/wiki/Video-signal_generator)
  VGA [hardware](https://digilent.com/reference/learn/programmable-logic/tutorials/vga-display-congroller/start) or [VHDL](https://www.instructables.com/Design-of-a-Simple-VGA-Controller-in-VHDL/)
- [VGA diff GPU](https://www.quora.com/What-is-the-difference-between-GPU-and-VGA/answer/Kolya-Galston)
  Also see [COD_RISCV_2nd_A_appendix] B-5 "*hardwired*, limited capability VGA controllers"
- GPU core is similar to CPU core, see [COD_RISCV_2nd_A_appendix] p547.
- index arithmetic [See](https://stackoverflow.com/questions/29157639/what-are-the-benefits-of-symmetric-level-index-arithmetic-alternative-to-floati) and [codes][miscs_py_script]
  TODO [more detailed](https://math.oxford.emory.edu/site/math125/indexArithmetic/)

  code is based on [wikipedia](https://en.wikipedia.org/wiki/Symmetric_level-index_arithmetic) which is based on the [original paper p3](https://homepages.gac.edu/~holte/level-index)
  - "allow negative exponents, if the magnitude of X is less than 1." -> $r_X$
  - "A sign bit may also be used to allow negative numbers" -> $s_X$
  - generalized logarithm function map $X$ to $x=l+f$
    $$
    {\displaystyle x= \psi (X)={\begin{cases}X&{\text{if }}0\leq X<1\\1+\psi (\ln X)&{\text{if }}X\geq 1\end{cases}}}
    $$
    here $1+\psi (\ln X)$ to calculate the level $l$
  - generalized exponential function which is more obvious is opposite of the above.
  - here to *increase the precision* because 
    $[1,+\inf)$ is obvious larger than $[0,1]$, 
    use $\max(|X|,|X|^{-1})$
    $$
    x=\psi (\max(|X|,|X|^{-1}))=\psi (|X|^{r_{X}})
    $$
  - $X=0$ -> $l=f=x=0$
- "effective hardware acceleration" because GPU may just be developed based on these API.
  "why new GPUs are being *developed every 12 to 18 months* that double the performance" because standards like OpenGL and [DirectX](https://en.wikipedia.org/wiki/DirectX#Versions) are keeping changing.
  Also see B-5 "changing the *logical (API-based)* graphics pipeline to incorporate programmable elements"

  TODO [comparison like "OpenGL is a purebred graphics API"](https://www.makeuseof.com/opengl-vs-directx-game-development-best/) of OpenGL and DirectX

  - Not be confused with CUDA vs [OPENCL](https://www.incredibuild.com/blog/cuda-vs-opencl-which-to-use-for-gpu-programming#why-opencl?) Also [see](https://stackoverflow.com/a/7907609/21294350)
    And "GPU computing" includes CUDA and OPENCL.
- [visual computing](https://www.researchgate.net/figure/Overview-of-Visual-Computing_fig1_327802249) relation with others
- ["scalable execution"](https://saturncloud.io/blog/scaling-performance-across-multiple-gpus-a-guide-for-data-scientists-and-software-engineers/#what-is-multi-gpu-scaling) can be thought as *independent* parallel by "*distributing* the computational workload". See "FIGURE 6.9"
  It is different from [this](https://sci-hub.ru/10.1145/3415958.3433082) which is based on "software container technologies and message-oriented middleware" (the latter is used in ROS).

  See different [types](https://saturncloud.io/blog/scaling-performance-across-multiple-gpus-a-guide-for-data-scientists-and-software-engineers/#model-parallelism) of Parallelism
- data parallel in SPMD is done by *software* program while it is handled in the instruction with hardwares in SIMD.
  ~~Also "lockstep" with SIMD means SPMD *not totally parallel*.~~
  SPMD better see [book][COD_RISCV_2nd_A_appendix] definition "*writes a program for one thread* that is instanced and executed by many threads in parallel" by something like `<<<grid_size,block_size>>>` in `CUDA`
  kw: "at *independent* points"; "*vector* processors"
  Also see B-12 "*myriad* thread instances in parallel"
  - [lockstep](https://www.acecloudhosting.com/blog/what-is-simd-and-how-gpus-employ-it/#:~:text=SIMD%20and%20SIMT,-Single%20Instruction%20stream&text=Like%20SIMD%2C%20all%20the%20instructions,concurrently%20manage%20multiple%20data%20streams.) in SIMD/SIMT where "each core waits for other cores to finish processing their data before all the cores *simultaneously proceed to the next* data batch." (i.e. one `AVX` instruction must be finished to start next logically, but OoO may change it).
    Also "Consecutive *threads proceeding in lock-step* are grouped as warps, which are then grouped as thread blocks" -> means [parallel](https://stackoverflow.com/questions/76791769/does-lockstep-in-simd-simt-imply-the-ecc-tolerance). Also by ["are analogous to SIMD *lanes*"](https://en.wikipedia.org/wiki/Single_instruction,_multiple_threads)

    warp -> Also [see](http://15418.courses.cs.cmu.edu/spring2017/lecture/gpuarch/slide_059) where it is the  block minimum unit (["further divide this into 16 sequential blocks"](https://stackoverflow.com/a/3792301/21294350)) is the warp. So [cuda_cpp_Best_Practices_Guide] or [online](https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html) "choosing sensible thread block sizes, such as *multiples of the warp* size ... facilitates memory accesses by warps that are properly *aligned*." Also see B-27
    but not see [COD_RISCV_2nd_A_appendix] p548
- [chipset](https://en.wikipedia.org/wiki/Chipset#Computers) is just one *interface* between cpu and I/O,etc.
- compare [ISA](https://en.wikipedia.org/wiki/Industry_Standard_Architecture#:~:text=Industry%20Standard%20Architecture%20(ISA)%20is,ISA) and [PCI](https://en.wikipedia.org/wiki/Industry_Standard_Architecture#:~:text=Industry%20Standard%20Architecture%20(ISA)%20is,ISA) based on the right card.
- [framebuffer](https://en.wikipedia.org/wiki/Linux_framebuffer#) is one software abstraction. [See the kernel doc "doesn't need to know anything about the low-level (hardware *register*) stuff."](https://docs.kernel.org/fb/framebuffer.html#introduction) 
  - kw: "containing a *current* video frame ... *only the Linux kernel*'s own basic facilities" which is separate from the *user space*.
  - TODO 
    - how [applied](https://en.wikipedia.org/wiki/Linux_framebuffer#Applications)
    - [read](https://www.kernel.org/doc/html/v6.5-rc3/fb/)
  - above kernel doc: 
    1. "Application software that uses the frame buffer device (e.g. the *X server*)"
    2. "a frame buffer device is a *memory* device like /dev/mem ... is *not the whole* memory, but the frame buffer of some video hardware."
- [PCIE x16](https://en.wikipedia.org/wiki/PCI_Express) -> lane number.
  PCIE [derivative](https://en.wikipedia.org/wiki/PCI_Express#Derivative_forms) includes Thunderbolt
- [daisy-chained](https://ivanky.com/blogs/news/what-is-daisy-chaining-displayport-mst-explained) is similar to [`extend` in windows](https://support.microsoft.com/en-us/windows/how-to-use-multiple-monitors-in-windows-329c6962-5a4d-b481-7baa-bec9671f728a#ID0EDDBBDBF)
- [SLI](https://docs.nvidia.com/gameworks/content/technologies/desktop/sli.htm)
  - kw: SLI-*certified* motherboard; *multiple* PCI-Express x16 slots and are *specifically* engineered for SLI configurations; *external* SLI bridge connectors; the *driver* is properly installed for all the GPUs, SLI rendering must be enabled in the NVIDIA *control panel*; treat both GPUs as *one logical* device, and divide rendering workload *automatically depending on the selected mode*.
- [coherent or noncoherent PCI-Express](https://www.quora.com/What-is-coherent-and-non-coherent-traffic-related-to-PCIe-transactions) both keep cache-coherence while the latter just skip the cache when transaction ("marked *non-cacheable* ... no need to snoop any of the caches").
- ["Aperture"](https://en.wikipedia.org/wiki/Aperture_(computer_memory)) is related with "a particular *peripheral* device or a memory unit".
  In newer GPU, PCIE [replaced](https://tech-fairy.com/history-of-graphics-card-motherboard-slots-pci-vs-agp-vs-pci-express-vs-integrated-graphics/) AGP which may be used in [2006](https://forums.tomshardware.com/threads/what-is-graphics-aperture-size.850830/).
- [shader](https://en.wikipedia.org/wiki/Shader#:~:text=Vertex%20shaders%20describe%20the%20attributes,one%20(updated)%20vertex%20out.) just add attributes.
- ["Rasterizer"](https://en.wikipedia.org/wiki/Rasterisation) is related with [this](#graphic_image)
- B-10
  This based on this [paper][Tesla_ARCHITECTURE]
  - ["texture filtering"](https://en.wikipedia.org/wiki/Anisotropic_filtering)
    - ["raster operations" p3](https://web.pdx.edu/~jduh/courses/geog475f09/Students/W5_Raster%20presentation%2010-27-09.pdf) is similar to [convolution](https://pro.arcgis.com/en/pro-app/3.0/help/analysis/spatial-analyst/performing-analysis/cell-size-and-resampling-in-analysis.htm) while the latter may change the shape size.
    - [anti-aliasing](https://en.wikipedia.org/wiki/Anti-aliasing) avoid [Aliasing](https://en.wikipedia.org/wiki/Aliasing) (i.e. frequency *overlap* See signal processing). This is similar to [aliasing](#compiler_anti_aliasing) in the compiler.
      So it can [drop high-frequency signals "Filters"](https://www.selecthub.com/resources/what-is-anti-aliasing/#:~:text=Anti%2Daliasing%20is%20a%20technique,to%20make%20visuals%20look%20natural.)
- B-11
  - "64-bit-wide DRAM" -> cacheline [block size](https://electronics.stackexchange.com/a/152086/341985).
  - [constant cache](https://forums.developer.nvidia.com/t/do-7-x-devices-have-a-readonly-constant-cache/220844/5) designed for "accessed *uniform*ly"
  - [`FMAD`](https://forums.developer.nvidia.com/t/why-ffma-instructions-are-still-there-even-if-fmad-false-is-set/179934/2)
  - SFU is [simplified](https://forums.developer.nvidia.com/t/fermi-and-kepler-gpu-special-function-units/28345/2) version of some functions `cos()`
    1. *single* precision numbers only.
    2. have *limited* precision
    3. [Transcendental function "not satisfy a *polynomial* equation"](https://en.wikipedia.org/wiki/Transcendental_function) related with taylor series
      These are implemented by hardware in ["Transcendentals (SFU)"](https://www.informit.com/articles/article.aspx?p=2103809&seqNum=3)
    4. In newer CUDA doc, "Table 7" -> "Table 9"
    5. TODO "perform several FMAD instructions"
  - [TPC](https://www.geeks3d.com/20100318/tips-what-is-a-texture-processor-cluster-or-tpc/) include [SMC: SM controller][Tesla_ARCHITECTURE]
  - other abbr see [this](https://people.cs.pitt.edu/~melhem/courses/3580p/gpu.pdf) or [Tesla_ARCHITECTURE]
  - "geometry controller" is related with "recirculation" in "FIGURE B.2.4" to *reuse* the SM.
- [Cg and HLSL](https://en.wikipedia.org/wiki/Cg_(programming_language)) are same thing. Also [see](https://forum.unity.com/threads/i-dont-know-the-difference-between-cg-and-hlsl-in-my-custom-shader-noob.1169453/#post-7495772)
#### Directx 10 (2023 newest is 11)
better view 11 doc which is referenced in 10 (like "Input-Assembler Stage" in 18)
- FIGURE B.3.1
  - Input-Assembler
    - "to read *primitive data* (points, lines and/or triangles) from user-filled buffers" -> input
      "*assemble* vertices into several different *primitive* types (such as line lists, triangle strips"
      - [triangle strips](https://learn.microsoft.com/en-us/windows/win32/direct3d9/triangle-strips) Also see [directx_9]
        - "degenerate triangle" is realized by *same* vertexes.
  - Vertex Buffer
    - TODO how ["texture coordinate"](https://learn.microsoft.com/en-us/windows/win32/direct3d9/texture-coordinates) mapped in [3D](https://learn.microsoft.com/en-us/windows/win32/direct3d9/cubic-environment-mapping).
  - vertex shader
    - ["skinning"](https://cseweb.ucsd.edu/classes/sp16/cse169-a/readings/3-Skin.html) -> relative rotate
    - ["Morph"](https://en.wikipedia.org/wiki/Morph_target_animation) change the base *shape*.
    - ["screen-space *derivatives*"](https://gamedev.stackexchange.com/questions/130888/what-are-screen-space-derivatives-and-when-would-i-use-them)
  - Texture
    - ~~TODO~~ how [mipmap](https://en.wikipedia.org/wiki/Mipmap) implemented to "reduce aliasing artifacts".
      See [paper](https://en.wikipedia.org/wiki/Mipmap#Origin)
      Better see [this](https://www.3dgep.com/learning-directx-12-4/#Mipmapping)
  - TODO detailed infos about Sampler more than ["addressing and filtering"](https://vfxdoc.readthedocs.io/en/latest/textures/sampling/#:~:text=Texture%20sampling%20is%20the%20process,these%20textures%20using%20different%20algorithms.)
  - Geometry Shader See [directx_11] for "output topologies" and " inputs are the vertices for a full primitive"
    - pointlist see [directx_9]
      - materials vs Textures: ["Textures can be *one* of those things that can be contained in a material"](https://artisticrender.com/what-is-the-difference-between-materials-shaders-and-textures-in-blender/)
        TODO how used in the software.
  - "Stencil" see [directx_9] 
  - depth buffer See [directx_9], more [detailed](http://archive.gamedev.net/archive/reference/programming/features/occlusionculling/)
  - ["Render Target"](https://en.wikipedia.org/wiki/Render_Target) is "intermediate memory buffer".
- B-14
  - "fragments are *potential* contributions to pixels" -> ["produce *multiple* fragments from the same triangle per-pixel"](https://stackoverflow.com/questions/31173002/what-is-the-difference-between-a-sample-a-pixel-and-a-fragment)
  - ~~"sampled and filtered" may mean same by above "addressing and filtering".~~ 
    here "filtered lookups" may mean "An *offset* can be applied to the position before lookup" which is similar to how buffer accessed in [directx_11] "Vertex Buffer".
    ~~better see [directx_11] "1D Textures",etc.~~
  - [`w`](https://stackoverflow.com/questions/2422750/in-opengl-vertex-shaders-what-is-w-and-why-do-i-divide-by-it) in `x, y, z, w` is used to calculate "`(x, y, z)` screen position"
  - ["high dynamic range"](https://developer.nvidia.com/high-dynamic-range-display-development) compared with normal ...
- B-16
  - ["language construct" -> "flow-control constructs"](https://developer.download.nvidia.com/CgTutorial/cg_tutorial_chapter01.html) like loop,etc.
  - ["subsurface scattering"](https://therealmjp.github.io/posts/sss-intro/) -> [BRDF](https://en.wikipedia.org/wiki/Bidirectional_reflectance_distribution_function)
- "throughput computing" -> [HTC](https://en.wikipedia.org/wiki/High-throughput_computing#High-throughput_vs._high-performance_vs._many-task) which "over a *long period* of time instead of how fast"
  "*loosely*-coupled tasks" and "grid computing" -> GPU

  MPC: "over short periods"; "both dependent and independent tasks"; "coupled via *file system* operations"
- ["PCs, workstations, and servers"](https://techdifferences.com/difference-between-server-and-workstation.html)
  the 2nd may not has GUI
  and the 3rd is for "dedicated task"s.
#### Cg
better view [nvidia_doc](https://developer.download.nvidia.com/cg/Cg_language.html) or [pdf][nvidia_Cg], [wikibook](https://en.wikibooks.org/wiki/Cg_Programming/Vector_and_Matrix_Operations)
- B-15
  - [environment mapping](https://en.wikipedia.org/wiki/Reflection_mapping)
  - `float2` see wikibook
  - `out` and `uniform` is used to instruct the compiler. See nvidia_doc
    kw of `uniform`: Non-static global; the *initial* value of the variable/parameter is expected to be *constant* -> "*do not vary* from one pixel instance (thread) to the next" in B-15
  - TODO how `texCUBE` and `tex2d` implemented.
    they return [color](https://forum.unity.com/threads/shaders-whats-the-return-value-of-tex2d.592699/#post-3959776), also [see](https://gamedev.stackexchange.com/questions/56494/what-range-of-values-can-hlsls-tex2d-function-return#:~:text=The%20tex2D%20function%20usually%20returns,the%20latter%20is%20full%20intensity.)
    Or see this [example `lerp(main_color, secondary_color, _Blend)`](https://www.ronja-tutorials.com/post/009-interpolating-colors/)

    "Sampler to lookup." means `sampler2D`, etc., which is handler to the texture. 
    - `clamp` in `Cg` means [definite range](https://docs.unity3d.com/Packages/com.unity.shadergraph@6.9/manual/Lerp-Node.html)
#### CUDA
From B.3, most of the book contents are copied verbatim from its [reference][Scalable_CUDA] and [Tesla_ARCHITECTURE]
- B-19
  - [`dim3`](https://icl.utk.edu/~mgates3/docs/cuda.html)
  - `__syncthreads()` see [CUDA_doc] 10.6
- why CPU is [high](https://forums.developer.nvidia.com/t/high-host-cpu-load/198104/2) when running CUDA
- TODO
  - ["queue pointer"](https://learn.microsoft.com/en-us/windows-hardware/drivers/display/gpu-hardware-queue)
- Also see [One kernel only one grid](https://stackoverflow.com/a/26059511/21294350) which is also shown by "interkernel barrier"
- [local mem](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#memory-hierarchy) ~~["just part of global memory"](https://forums.developer.nvidia.com/t/thread-local-memory/41141/2)~~ "physically separate memories" in B-21.
- B-22
  - here "each kernel" -> P in SPMD
    "convenient degree of parallelism" -> *variable* number instead of "the same number of threads"
  - TODO "nested data parallelism" with [quicksort](https://www.classes.cs.uchicago.edu/archive/2016/winter/32001-1/papers/nepal.pdf)
- check [SM count](https://superuser.com/a/198309/1658455)
  SP is same as [CUDA core](https://www.cgdirector.com/cuda-cores-vs-stream-processors/#:~:text=Stream%20Processors%20and%20CUDA%20Cores,use%20their%20own%20unique%20architecture.) also see ["500 CUDA Cores and the other had 500 Stream Processors ... distinctive way"](https://qr.ae/pyc1fu)
- [Dedicated/Shared GPU Memory](https://superuser.com/a/1763829/1658455)
- "GPU thread has its own private registers ..." is similar to the CPU counterpart. The former's "private per-thread memory" corresponds to "stack" in csapp p1029 instead of the latter shared virtual memory.
- Register File is said before with [verilog](http://cs.middlesexcc.edu/~schatz/csc264/handouts/mips.datapath.html)
  physically they are based on SRAM with [2 more MOSs](https://en.wikipedia.org/wiki/Register_file#Array) to offer *more ports* while [SRAM](https://en.wikipedia.org/wiki/Static_random-access_memory#Design) use only one port by $BL$/$\overline{BL}$.
  - TODO "Write bit lines may be *braided*", "This optimization increases the speed of the write."
- "fast barrier synchronization" because of independent -> no lock needed [p9](https://sci-hub.ru/10.1109/IPDPS.2010.5470477)
- ~~"limiting each SP to 32 threads"~~ "supporting up to 64 threads": with my gtx 1650, it should be 16 <a id="deviceQuery"></a>
  ```bash
  $ /opt/cuda/extras/demo_suite/deviceQuery
    (14) Multiprocessors, ( 64) CUDA Cores/MP:     896 CUDA Cores
    Maximum number of threads per multiprocessor:  1024
  $ ipython -c "1024/64"
  Out[1]: 16.0
  ```

  "limiting each SP to 32 threads," because of *RF size*.
- "warp size of 32 threads" is same as mu [gpu "Warp size"](#my-gpu-parameters)
- how `warp` implies [`SI` (see the figure)][cuda_warp] in `SIMT` where it implies multiple lanes (threads).
  "data-level parallelism among threads at *runtime*" because the thread num may change due to `offset` size.
- notice grid size can be [*larger*](https://forums.developer.nvidia.com/t/does-cuda-run-more-threads-than-physical-threads-transparently/261485) than physical thread size.
  This is also said in this [Q&A](https://superuser.com/a/1801197/1658455) where it is achieved by "puts a *new* work block into the processor block when another block *finishes*." which is same as nvidia post "use spare thread when one thread finishes".
- "executing four threads in each of the eight SP cores over four *clocks*" because *single issue* and ["because each core is effectively *a scalar ALU*"](https://stackoverflow.com/questions/5891082/simt-warp-question).
  This says one warp (32 threads) with [one instruction cache](https://en.wikipedia.org/wiki/Thread_block_(CUDA_programming)) -> 4 (thread per core) *8 (core num) threads

  Notice: from [this](#deviceQuery) my gpu is 16 threads / core.
  It means same as "SP *scalar processor core* executes an instruction ... using *four clocks*"
- "data lanes" -> one ALU (think AVX) but "multiple independent threads" -> maybe multiple ALUs in different threads in different cores.
- "branch diver-gence" See [Tesla_ARCHITECTURE] and [Branch_Divergence]
  - [Branch_Divergence] from [this](https://stackoverflow.com/questions/17223640/is-branch-divergence-really-so-bad#comment35866340_17223640) where "distinct" means ["clear"](https://www.merriam-webster.com/dictionary/distinct) like [`jmp`](https://www.javatpoint.com/branch-instruction-in-computer-organization)
    Here due to SIMT ["not possible to carry out *different* instructions on different threads within the *same warp* at the same time"](https://stackoverflow.com/questions/29896422/cuda-avoiding-serial-execution-on-branch-divergence) -> ["synchronously broadcast to all SIMT cores from a single unit with a *single* instruction cache ... using a *single Program Counter*"](https://en.wikipedia.org/wiki/Single_instruction,_multiple_threads)

    So "warps are much narrower" in B-29 -> imply *less* threads needed to execute the same instruction -> less divergent.

    It is also dependent on count of [instruction dispatch units](https://stackoverflow.com/questions/29896422/cuda-avoiding-serial-execution-on-branch-divergence#comment48677732_29897366) and can also "*completely different* group of 32 physical cores". And the [warp in the whitepaper](https://web.archive.org/web/20150627190401/http://www.nvidia.com/content/pdf/kepler/nvidia-kepler-gk110-architecture-whitepaper.pdf) also imples they issue the *same* instruction.
    - many places have said "all threads within a warp must execute the *same* instruction at any given time". So "receive instructions from *a single issue unit*", then `-` in "Figure 2" may mean *nothing issued* to that thread.
    - Also see one [optimization](https://forums.developer.nvidia.com/t/solved-ptx-isa-predicated-execution-and-the-warp-divergence-issue/31957) about branch which is similar to conditional move.
    - based on the compiler:
      1. "predicated instructions" 
    - based on software 
      1. "Iteration delaying" mainly due to *independent*. So they can be delayed and reordered.
        "preserves the order of iterations" -> only combine *adjacent* loops with *common* true/false by "delaying favors *fast-changing* branch directions which requires *fewer number of iteration delays*"
      2. "round-robin" mainly "not starve threads"
        ```c
        cond_for_all = ( counter >= num_zeros );
        // remove idle iteration
        cond_for_all = cond_for_all ?
        __any ( cond ) : __all ( cond );
        ```
        `counter >= num_zeros` implies `cond_for_all=0` `num_zeros` times, then `__all ( cond )` implies only **all** `cond=1` will `=1`, otherwise `0` -> `else`.

        Then after `num_zeros` times, `__any ( cond )` implies only when **all** `cond=0` will `=0`,otherwise `1` -> `if`.
      3. Branch distribution is similar to [Loop-invariant code motion](https://en.wikipedia.org/wiki/Loop-invariant_code_motion) which is also said [above](#loop_invariant_optimization) (all compiler [optimization](https://en.wikipedia.org/wiki/Optimizing_compiler#Specific_techniques))
        "reduce the level of paral-lelism" maybe because *not fused* muladd because mul is moved out of the conditional block.
    - ["dynamic instruction"](https://stackoverflow.com/a/13458277/21294350)
      just means not fixed instruction which is implied by *condition*.
    - kw: “cold” path
- "B-29" 
  "analogous" is only based on that they "can be *safely ignored* ... but must be considered in the code structure when designing for *peak performance*.".
  - "2-by-2 pixel quad" is to calculate [Derivatives](http://www.aclockworkberry.com/shader-derivative-functions/) referenced [here](https://www.gamedev.net/forums/topic/700823-how-fragment-derivatives-are-actually-evaluated-within-the-2x2-group/5399275/)
    Also [see](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/deriv-rtx-coarse--sm5---asm-)
  - "If the number of active warps times the clocks per warp exceeds the pipeline latency, the programmer can ignore the pipeline latency" means *independent* warps in parallel *hides* the pipeline latency.

    As book says "Different warps execute independently", "a round-robin schedule of eight warps has a period of 32 cycles between successive instructions for the same warp" due to ($4*8=32$ where 8 is due to round-robin (i.e. interleaved execution) ) may be due to *only one dispatch unit* to schedule the instructions.
    "keep 256 threads active" -> $256/32=8$ (i.e. eight threads per core)

    Notice: "*pipeline* uses *several clocks* of latency to complete each instruction." So above latency is mainly due to *pipeline* because scheduler can always *schedule* the instruction to the idle thread.
- B-30
  - "an *IPC of 1.0* per processor core" implies [this](#scalar_unit_gpu)
  - ["register dependency scoreboard"](#scoreboard)
    How "warps" are qualified, see examples in the above referenced pdf.
  - "(CTAs)" can be thought same as CUDA thread block which consists of *multiple warps*.
    influence whether can "at *full* multiprocessor performance."
  - kw: "accumulates and *packs*"
- B-31
  - "shader programs are becoming longer and more *scalar*" where scalar means we only manipulate with *part* of the vector indicated by "scalar code per thread".
  - "*combining subvectors* of work to gain efficiency) but that complicated the scheduling hardware" because vectors needs to be packed and unpacked instead of each element just manipulated by *one* thread without many overheads.
  - "different binary microinstruction formats" means their ~~microarchitecture~~ ISA encoding may totally differ.
  - ["Direct3D vector instructions"](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dp3---ps)
  - [IR (Intermediate representation)](https://en.wikipedia.org/wiki/Intermediate_representation) just its literal meaning.
    - shift in `shift + add` mean multiply like `rdi*4` in `add dword [rbx + rdi*4]`.
  - ["optimizes SIMT branch diverge and *converge point*"][speculativereconvergence]
    - `A` is [post-dominator](https://en.wikipedia.org/wiki/Dominator_(graph_theory)#Postdominance) of `B` ~~just means~~ doesn't `A` is dominated by `B` (i.e. in the graph, *all* paths to `B` are though `A` -> dominated).
      because "all paths to the *exit* node of the graph starting at n must go through z" (i.e. n *out* must to z) may mean `n` *out* is only a *part* of *in* to `z` which is not "every path from the entry node *to n* must go through d"
      more explicitly, here not "*every* path from the entry node to" z "must go through" n -> not `n >> z`.
      ```bash
      entry --> n ->  z -> exit
            |        /|\ 
            |-> n'----|
      ```

      "immediate dominator" just literally *no other intermediate* dominator by "does not strictly *dominate any other node* that strictly dominates n".

      "strictly dominate" only excludes self from all dominators by viewing the graph.

      dominance frontier-> "where d's dominance *stops*".
      - So "post-dominator (PDOM) of the divergent region" (i.e. these branches) is the 1st instruction out of the branches which they *must execute after* (i.e. "all paths to the exit node" in wikipedia and "guaranteed to arrive" in the paper) the branches.
    - ["short-circuit"](https://www.geeksforgeeks.org/short-circuit-evaluation-in-programming/) implies "*removes* a thread from the specified convergence barrier"
      `BSSY` construct one barrier joined *list* and `BSYNC` (synchronize) `BREAK` (manipulate list members) are based on the 1st instruction.

      "non-standard convergence points" by "collects multiple threads *across different iterations*" or others means not "*standard* reconvergence logic collects all threads at the *post-dominator*"
    - In short `converge point` can be "at earlier points of execu-tion" to be parallel (see 1st figure).
    - "inner loop *post-tail*" -> "post-dominator".
    - Figure 2(c) "Common function call" is more direct to "recognize" than (a) "Divergent condition".
    - "may prefer to reconverge for *expensive* paths while *allowing diverged* execution of *less* expensive paths" because "Threads *wait* at the start of the expensive region for all threads to arrive". So only expensive thread may *amortize* this overhead.
    - TODO "insert a `RejoinBarrier` in BB3 where the barrier b0 was cleared by a WaitBarrier" because  it needs "*waits* on a barrier that it has *already cleared* rejoins the barrier"
    - ~~TODO~~ "increase serialized executions of other portions" because of ~~*wait*~~ changes of "reconvergence point" moving the *prolog/Epilog* locations. See figure 3(b).
      This means same as "maximizing convergence may not always be the best choice. ... we can also increase serialized executions of *other portions*"
      
      Notice: here only the time to execute each instruction differs, but these instructions are same by `accumulate_neutron_cross_sections()`.
      here same color interpret same instructions maybe with *different data sources* -> So (b)(iii) has red color and black color can't be at the same line. And (ii) can't be real (i.e. Ideal) because of the overheads between iterations. (Also see ["to load and store from *divergent addresses* ... the threads of a warp execute the *same instruction sequences* together"][cuda_warp])
    - p4 "does not *conflict*
    with the compiler inserted reconvergence point at the post-
    dominator, nor does it affect convergence properties of the
    code outside the function body." See 4.3 Deconfliction ("overlap" may cause the "deadlock" ("wait for each other") ).
    - "masking off" in p2 means same as "predication".
      "*branch* independently depending on the evaluation of the branch condition ... *serializes* the execution of the taken and not-taken paths ... resume *parallel* execution" just see figure 3(b) where prolog is parallel but `accumulate_neutron_cross_sections()` is serial (As [this](https://stackoverflow.com/questions/76798409/does-conditional-evaluation-at-the-alu-always-imply-no-branch-divergence#comment135398286_76798806) says, it not means predication just means "diverging branches" -> running *different paths*.)
    - How to implement 
      1. compiler: "reconvergence *hints*"
    
    - in Figure 4, `b1` should be "branch post-dominators." Then probably `BB5` is the "post-dominator".
    - 4.1 Reconvergence point
      - "predicted location for reconvergence." -> `L1:` by "via a label". 
        From "where all threads wait before" -> ` WaitBarrier(b0)`.
      - "The *region* of code where this prediction should apply." -> `JoinBarrier(b0),CancelBarrier(b0)` by "threads that leave the re-gion are *no longer considered candidates*"
        `Predict(L1)` -> "*start* of the prediction region"
    - 4.2
      - TODO "prior to the synchro-nization pass" may means before synchronization takes effect.
      - "waits on a barrier that it has already cleared rejoins the barrier" just means need to rejoin for waiting.
      - "exits the region *without waiting* on a barrier that it has joined" ~~may mean although running `WaitBarrier<barrier>` but ~~no~~ all other threads joined and then quickly `CancelBarrier<barrier>` because of *not taken* branch.~~
        Same as "a CancelBarrier in BB5 where threads that joined bar-rier b0 may *escape without clearing* the barrier"
        Here not waiting because of not taken branch -> not running `WaitBarrier(b0)` which is same as "describes *which* threads are considered to be *candidates* for reconvergence"

        "so other threads do not wait forever." beacuse `WaitBarrier(b0)` will wait for the *joined member* if it *not clear* the barrier.
      - "orthogonal barrier register" can be seen as independent. [See](#orthogonal)

      - "(1) whether a thread is part of an uncleared barrier, and (2) whether a thread expects to wait on the barrier." just correspond to `CancelBarrier` and `RejoinBarrier` each.
        |                       |                                                                                                                                        |
        | --------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
        | WaitBarrier\<barrier> | Threads wait on all participating threads to arrive **before clearing** the barrier and continuing execution. Implemented using BSYNC. |
      - "where the barrier b0 was *cleared* by a WaitBarrier" So it needs `RejoinBarrier` to "reconverge" well in the *subsequent loops*.
      - dead -> "it has no further uses" means same as [this](#dead_code)
      - [Heuristic](https://en.wikipedia.org/wiki/Heuristic_(computer_science)) just means take *samples* and select the best by "*ranks* alternatives in search algorithms at each *branching step*".
      - "result in poor performance." because one convergence is explicitly eliminated "`b1` are removed thereby eliminating the conflict" and one is implicitly eliminated "the *newly defined* convergence point is never, or *rarely*, en-tered,"
      - "Loop Merge" in p3 -> col-lecting threads *across iterations*
        This is same as "Iteration Delay" and also referenced in this [paper][Branch_Divergence]
      - "soft barriers" means not hard to reconverge at the "user-defined convergence point" *every time*.
        - "exit barrier `bPdom` to allow the remaining threads to continue execution." may be redundant because `WaitBarrier(bTemp)` has almost synchronized (i.e. "`bAll` collects all threads at the loop exit"), So no need to ensure no delay with `WaitBarrier(bPdom)`.
      - ["parallelizing compilers"](https://en.wikipedia.org/wiki/Automatic_parallelization) just function similar to GPU kernel function.
      - "barriers and warp synchronous instructions may affect the correctness of modifying the convergence properties" -> 4.3 Deconfliction
        4.5 doesn't say detailedly how the compiler implemented for "Automatic Detection of Reconvergence Point" (as it says, " challenging problem for the compiler to solve unaided, particularly when there are *conflicting* locations")
    - TODO
      p2 compiler algorithm; 
      is `BB5` out of the kernel?
      what do `IN (BB)` and `OUT (BB)` mean? reread after discrete mathematics.
- [Cooperative Groups](https://developer.nvidia.com/blog/cooperative-groups)
  - TODO
    - "intra-block Cooperative Groups functionality"
    - what does `thread_sum` sum? and what is its `blockDim` and why `i < n / 4;`
  - here `reduce_sum` function same as `__shfl_down_sync`
  - memset [vs](https://stackoverflow.com/a/1373422/21294350) `std::fill`
  - [`cudaMallocManaged` "Unified Memory"](https://developer.nvidia.com/blog/unified-memory-cuda-beginners/) vs [`cudaMalloc` where distinct between the host and device](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html?highlight=cudaMalloc#memory-allocation-and-lifetime)
    Notice the [migration](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#data-migration-and-coherency) of `cudaMallocManaged` may [decrease][Maximizing_Unified_mem] the performance (link from [this](https://stackoverflow.com/a/21990899/21294350)).
    Used in [jetson](https://docs.nvidia.com/cuda/cuda-for-tegra-appnote/index.html#id1) to "reduce the readImage() time".

    Also see [vs](https://forums.developer.nvidia.com/t/difference-between-cudamallocmanaged-and-cudamallochost/208479/2) [`cudaMallocHost`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__HIGHLEVEL.html#group__CUDART__HIGHLEVEL_1gd5c991beb38e2b8419f50285707ae87e) where "pinned memory" [p6](https://engineering.purdue.edu/~smidkiff/ece563/NVidiaGPUTeachingToolkit/Mod14DataXfer/Mod14DataXfer.pdf) means [same](https://saturncloud.io/blog/cuda-and-pinned-page-locked-memory-not-page-locked-at-all/#:~:text=Page%2Dlocked%20memory%20is%20a,about%20the%20overhead%20of%20paging.) as page-locked memory.
    kw: "moves the resident location of an allocation to the processor that needs it. Pinned memory *does not*"
    - [Maximizing_Unified_mem]
      better to see "Get Started with Unified Memory in CUDA" at the end
      > In this post I’ve aimed to provide *experienced* CUDA developers the knowledge needed to optimize applications to get the best Unified Memory performance. If you are *new* to CUDA and would like to get started with Unified Memory, please *check out the posts* An Even Easier Introduction to CUDA and Unified Memory for CUDA Beginners.
      - "Page Migration Mechanism" says how Migration in `cudaMallocManaged` is done which implies "copies".
      - ["zero-copy access"](#zero_copy)
      - "Considering that Unified Memory introduces a *complex page fault handling* mechanism, the on-demand streaming Unified Memory *performance is quite reasonable*"
      - "generate many faults *concurrently*" because of delay of synchronization.
      - kw: density prefetching; "page fault groups"; "this overlap is severely limited *due to the SM stalls* caused by page fault handling."; "because the CPU’s page tables *cannot be updated asynchronously*"; hardware access counters
      - "merge nearby smaller pages into larger pages" may means same as [this](#hugepage)
      - po "Instead of having multiple hardware warps *accessing the same* page, we can divide pages between warps"
        so less conflict miss -> performance better.
        - TLB update is implied by [page fault](#soft_hard_page_fault)
          
          Also see [this][unified_memory] 
          - "see the *virtual address and reason* for every migration event" and "2MB page is *evicted* to free space"
            "do not correlate back to the *application code*."
          - It also says how to "*automate* this process." "if you have hundreds or thousands of page faults in *different parts* of your application" by `CUPTI` and `sqlite`.
          - "once we hit the GPU memory limit, the driver starts *evicting old* pages"
            "First, the page fault processing takes a significant amount of time. Second, the migration latency is completely exposed" the 2 things just means same (i.e. 1st caused 2rd).
          - Optimizing Performance with Prefetching and Usage Hints:
            
            "prefetching operation can be issued in a *separate CUDA stream* and *overlapped* with some compute work ... *non-blocking* stream to enable concurrent" says why `Prefetch` better. See [cuda_stream]
            - "prefetches are scheduled while GPU is working on the other AMR levels to *avoid any conflicts*" See Figure 9.
              Notice the `3` is unevicted due to `least-recently-used`.
            - TODO read more about [async](https://docs.nvidia.com/cuda/cuda-runtime-api/api-sync-behavior.html#api-sync-behavior__memcpy-async) from [this](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1ge8dc9199943d421bc8bc7f473df12e42)
            - "the CPU could still be *involved* as it needs to initiate *page migration* and update page mappings" means `cudaMemPrefetchAsync` needs to wait (i.e. synchronous) for cpu to complete.
              - "for better overlap with GPU kernels we need to make sure enough GPU work is *scheduled in advance*"
                TO keep `cudaMemPrefetchAsync` busy most of time which is synchronous with CPU so CPU is also busy. Then CPU overheads of `page migration`,etc., can be hidden. (Here also assumes the *spacial locality* to take effects).
                "a prefetching operation can be submitted to a separate stream *after* all GPU levels are scheduled but *before* we synchronize GPU" just *early* prefetching.
            - `cudaMemAdvise(ptr, size, cudaMemAdviseSetPreferredLocation, cudaCpuDeviceId); cudaMemAdvise(ptr, size, cudaMemAdviseSetAccessedBy, myGpuId);` is to "pin regions to *CPU* memory and establish a direct mapping from the *GPU*" (i.e. used by GPU). Then less *page faults*.
            - `cudaMemAdviseSetReadMostly` "automatically *duplicates* data on a specified processor." -> ["read-duplicated *copies* of the data ... the *collapsed* copy will be the *preferred* location"](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1ge37112fc1ac88d0f6bab7a945e48760a)
              "Writing to such memory is allowed and doing so will *invalidate* all the copies"
              
              Usage: "*constant throughout* the application execution and *shared*"
              "isolate and *eliminate* the remaining CPU page faults and keep the Unified Memory profile *clean* during GPU memory oversubscription." because no page faults and overheads related with these *constants* due to *read-only*.
              - TODO 
                - read "more sophisticated prefetching solution that *splits* the grid into multiple parts can help improve performance even further, but this a good topic for *another* post."
                - "OpenACC"
          - "the *compiler directives* approach provides a great option for *portability* to various architectures"
        - [unified_memory_basic]
          - > First, because Pascal GPUs such as the NVIDIA Titan X and the NVIDIA Tesla P100 are the *first* GPUs to include the Page *Migration* Engine, which is *hardware* support for Unified Memory page faulting and migration
            > it is only supported on Pascal and newer GPUs
            See [GPU_list]
          - "it may only be populated *on access* (or prefetching)." -> on-demand which is said in other blogs.
          - footnote-2 says "the stream *the kernel is launched on*. By default, managed allocations are *attached to all streams* so any kernel launch will trigger migrations" and "*all* pages previously migrated ... back to the device memory of the device running the *kernel*"
            Here `cudaStreamAttachMemAsync()` just one "specific CUDA stream" instead of "all streams".
          - notice here `nvprof` differences between pre-Pascal and post-Pascal
            - pre-Pascal
              > On systems with pre-Pascal GPUs like the Tesla K80, calling cudaMallocManaged() *allocates* size bytes of managed memory on the *GPU* device that is active when the call is made
              > Since the pages are *initially resident in device* memory, a page fault occurs on the CPU for each array page to which it writes, and the GPU driver *migrates* the page from device memory *to CPU* memory.
              1st migration when init.
              > the CUDA runtime must migrate all pages *previously migrated to host* memory or to *another GPU* *back* to the device memory of the device running the kernel
              2rd migration when usage in kernel.
              > Since these older GPUs *can’t page fault*, all data must be *resident on the GPU* just in case the kernel accesses it
              So implicit prefetch -> "kernel run time *separate* from the migration time, since the migrations happen *before* the kernel runs."
              So `ms` magnitude in `1.154720ms  Host To Device`
            - post-Pascal
              > Unlike the pre-Pascal GPUs, the Tesla P100 supports *hardware page faulting* and migration. So in this case the runtime *doesn’t automatically* copy all the pages back to the GPU *before* running the kernel. The kernel launches *without any migration overhead*, and when it accesses any absent pages, the GPU *stalls* execution of the accessing threads, and the Page Migration Engine migrates the pages to the device before resuming the threads.
              here "stall" implies "the cost of the migrations is *included* in the kernel run time"
              So "why the *kernel* time measured by the profiler is longer" -> `us` in `860.5760us  Host To Device`

              So "get a more *accurate* measurement" *without mixing* kernel running time and migration time.
              1. Initialize the Data in a Kernel
                > If we move initialization from the CPU to the GPU, the add kernel *won’t page fault*
                because they are both in *device mem*.

                This works because in `main` `x[i]/y[i]` are only inited, ~~but *not used*.~~ which corresponds to host to device causing *device* page faults and then delay.
              2. Run It Many Times may be worse than 1st method.
                `4.000000MB  339.7760us  Device To Host` corresponds to `maxError = fmax(maxError, fabs(y[i]-3.0f));`
              3. `cudaMemPrefetchAsync` copy large block like `2.0000MB` instead of *maybe small* units when normal migration.
            - "hardware page faulting, so coherence can’t be guaranteed" may means [soft page fault](#soft_hard_page_fault), i.e. other processor in ["handles page faults by bringing the page from disk or *other processor*'s memory"](https://pages.cs.wisc.edu/~sschang/OS-Qual/distOS/sharedVM.htm)
              "segmentation fault" maybe due to hardware un-support.
            - `cudaDeviceSynchronize` is important for asynchronous kernel
              > In our simple example, we have a call to cudaDeviceSynchronize() after the kernel launch. This *ensures* that the kernel runs to *completion* before the CPU tries to read the results from the managed memory pointer.
            - "The Page Migration engine allows GPU threads to *fault on non-resident* memory accesses" i.e. implement "hardware page faulting".
            - "49-bit virtual addressing" similar to Memory paging which includes secondary memory, i.e. disks.
              i.e. [Unified Virtual Address Space "a single address space is used for *the host and all the devices*"](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#unified-virtual-address-space)
            - "oversubscribing GPU memory" ~~i.e. "out-of-core computations"~~ means use too many GPU memory. ~~Maybe evict page or ~~
              This may be due to frequent eviction due to weird data pattern or just [out-of-core computations "*too large to fit* into a computer’s main memory."](https://machinelearning.wtf/terms/out-of-core/#:~:text=The%20term%20out%2Dof%2Dcore,(relatively)%20small%20performance%20penalty.)
              - TODO [read](https://developer.nvidia.com/blog/improving-gpu-memory-oversubscription-performance/)
            - [performance_metrics]
              > The function cudaEventSynchronize() blocks CPU execution *until the specified event is recorded*.
              `cudaEventSynchronize()` just wait for Event.
              means same ["Waits until the completion of all work currently *captured* in event."](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__EVENT.html#group__CUDART__EVENT_1g949aa42b30ae9e622f6ba0787129ff22) (similar to consumer in release-consume model)
              better understood with `cudaEventElapsedTime(&milliseconds, start, stop);`.
              - Theoretical Bandwidth
                $1546 * 10^6 * 2$ -> transaction times / s (2 due to DDR)
                $(384/8)$ -> transaction unit
                $/ 10^9$ -> transform to GB
                Above is same as "In this calculation, we convert the memory ..."
              - `N*4*3` just as blog says.
                $4$ -> 4 bytes / int
                $3=1+2$ 1 write and 2 reads
              - computational throughput -> "single multiply-add instruction (2 FLOPs)"
              - "A large percentage of kernels are memory bandwidth bound ... a good *first step*"
        - [unified_memory_cuda_6]
          > The key is that the system automatically *migrates* data allocated in Unified Memory between host and device so that it *looks like* CPU memory to code running on the CPU, and like GPU memory to code running on the GPU.

          > by making device memory management an *optimization*, rather than a requirement.
          > uses *streams and cudaMemcpyAsync* to efficiently overlap execution with data transfers may very well perform better than a CUDA program that only uses Unified Memory.
          So has above [Maximizing_Unified_mem]
          - compared with "Unified Virtual Addressing (UVA)"
            1. "UVA does *not automatically migrate*"
            2. "UVA enables “Zero-Copy” memory, which is *pinned* host memory" while Unified Memory migrate to *nearest* mem.

            > enables pointers to be accessed from GPU code *no matter where* in the system they reside
            > cudaMemcpy to be used *without specifying where exactly* the input and output parameters reside
            [Copies data *between* host and device.](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1gc263dbe6574220cc776b45438fc351e8)
            > but none of the performance, because it is always *accessed with PCI-Express’s low bandwidth* and high latency.
            ~~TODO what~~ Unified Memory ~~uses~~ copys *once* and access GPU memory.
            - `cudaMemcpy(d_elem, elem, sizeof(dataElem), cudaMemcpyHostToDevice);` is done by ["Copy data from the CPU to the GPU;"][Maximizing_Unified_mem]
            > *Porting* code with existing *complex* data structures to the GPU used to be a daunting exercise, but Unified Memory makes this so much easier
              just let the *hardware* do the complex migration.
            - TODO in `c++`, maybe use *overloaded* `new`, `delete` and "copy constructor" to make all *inherited* classes also using *Unified memory* by `dataElem *data = new dataElem;`.
              > A copy constructor is a function that knows how to create an object of a class, allocate space for its members, and copy their values from another object.

              TODO `// Deriving from “Managed” allows pass-by-reference` and `  // Unified memory copy constructor allows pass-by-value`
              Maybe `  void *operator new(size_t len) {` implies pass-by-value, so no need to reimplement , then just implement pass-by-reference `  String (const String &s) {` is enough.
              ```c++
              // Pass-by-reference version
              __global__ void kernel_by_ref(dataElem &data) { ... }
              ```

              `String (const String &s) {` implies *deep* copies.
              > Note that You need to make sure that *every class in the tree* inherits from Managed, otherwise you have a hole in your memory map.
              So `  String name;` -> `class String : public Managed {`
          - "Our first release is aimed at making CUDA programming *easier*, especially for beginners."
        - [cuda_stream]
          > streams, sequences of commands that execute *in order*. Different streams may execute their commands *concurrently* or *out of order* with respect to each other
          > the *default* stream which *implicitly synchronizes* with all other streams
          - "the very small bars for the *dummy* kernels on the default stream, how they cause all of the other streams to *serialize*." See [this code profiler data](../CUDA/codes/nvidia_blogs/streams/stream_test_no_default.nvvp) after removing the dummy.
          - here use compiler `default-stream per-thread`
            1. "*each host thread* its own default stream" -> this is reflected in the 2rd example.
            2. "regular streams ... may run *concurrently* with commands in *non-default* streams" which is opposite of the legacy streams.
              This is reflected in 1st example.
            These 2 properties correspond to "as far as *synchronization and concurrency* goes"
          - Notice `cudaStreamLegacy` and `cudaStreamPerThread` differences which can be seen from Figure 3,4.
            Just see "More *Tips*"
        - [cuda_async] to Overlap Data Transfer
          Here is mainly by non-blocking with async by "`cudaMemcpyAsync()` is non-blocking on the host".
          - "The default stream" limits "because it is a *synchronizing* stream with respect to operations on the device: no operation in the *default* stream will begin until all *previously* issued operations in *any* stream on the device have completed" (just as [cuda_stream] says)
            - "asynchronous behavior of kernel" makes "executes `myCpuFunction()`, *overlapping* its execution" possible 
              But since `cudaMemcpy(a, d_a, numBytes, cudaMemcpyDeviceToHost);` has data dependency `d_a` in `increment<<<1,N>>>(d_a)`, So this asynchronous can't influence `cudaMemcpy`
              So it only "overlap kernel execution in the *default* stream with *execution of code*"
          - non-default
            - here the order is limited by the *~~issue~~ engine unit number* of "C1060".
            > For the first asynchronous version of our code the *order* of execution in the copy engine is: H2D stream(1), D2H stream(1), H2D stream(2), D2H stream(2), and so forth.
            > in an order that *precludes* any overlap of kernel execution and data transfer
            - C2050 has 2 engines. So 1st async works.
              
              Notice: here "*concurrently* run multiple kernels" implies *no defined order*. -> "*delays* a signal that normally occurs *after* each kernel completion" to keep the *correct* results. 
              Then "performance *degradation*" compared with C1060.
            - "should use *non-default* streams ... This is especially important when writing *libraries*."
          - TODO [read](https://developer.nvidia.com/blog/how-access-global-memory-efficiently-cuda-c-kernels/)
        - [data_transfers](https://developer.nvidia.com/blog/how-optimize-data-transfers-cuda-cc/)
          - "As we port more of our code, we’ll remove intermediate transfers" may means no need to report the same kernel since "code can be ported to CUDA *one kernel at a time*".
            "as you write more *device* code you will eliminate some of the *intermediate* transfers, so any effort you spend optimizing transfers early in porting may be wasted" because `__global__` function as one intermediate, so multiple parallel device `__device__` code amortize the overheads from `__host__` to `__global__`.
          - optimization
            1. use "Pinned" mem to skip one step which is similar to zero-copy.
              This is also said in [unified_memory] "pin pages to system memory and enable zero-copy access"
            2. "Batching Small Transfers" just like [COD_RISCV_2nd_A_appendix] 5.15 cache blocking
              This "take care to *minimize* transfers"
            3. Use `nvpp` or `nvprof`.
      - why `cudaMemPrefetchAsync` and `cudaMemcpyAsync` better
        because "manually tiling your data into *contiguous* memory regions" while threads *order* is undefined which caused "on-demand access" may cause higher overheads.
        - `cudaMemcpyAsync` *not update page table* but only "only needs to *submit copies* over the interconnect"
          TODO read SASS to understand the differences "requires the application to maintain host and device memory allocations *separately*".
      - "The exact scenarios under which the driver may decide to *defer* can *vary from driver to driver*." (here defer because "prefetch operation has to execute *in stream order*" ([stream p3](https://developer.download.nvidia.com/CUDA/training/StreamsAndConcurrencyWebinar.pdf)) )
      - "out-of-core matrix multiplication" means use gpu-outside memory 
      - How to overlap the prefetch
        1. Since "For *idle* streams, the driver has a choice to either defer the operation or not, but the driver *typically does not defer* because of the associated overhead" -> So " the stream *should not be idle* when calling cudaMemPrefetchAsync."

          See "Let’s look at a simple example."
          Here `cudaDeviceSynchronize();` manually make the streams *idle*, so next iteration the 1st `cudaMemPrefetchAsync` blocks.
          TODO "if you use the same CPU path (*either deferred or non-deferred*) for device-to-host and host-to-device prefetches they are *likely to be serialized*"

          So to optimize
          "we have the device-to-host prefetch issued in a *busy* stream while the host-to-device prefetch is issued in an *idle* stream" just to *match the driver design*.
          Here use `cudaEventRecord` and `cudaEventSynchronize` to contro the path.
          1. `cudaStreamSynchronize(s2);` make stream *idle*, then do `cudaMemPrefetchAsync(... 0 ...)` (HtoD).
          2. `cudaMemPrefetchAsync(... cudaCpuDeviceId ...)` has no synchronization -> probably stream *busy*.
          Then see "Figure 4" where DtoH has been defered.
          Here also `// rotate streams and swap events` to make 
      - [`cudaMemAdvise`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1ge37112fc1ac88d0f6bab7a945e48760a)
    - [cuda_introduction]
      - ["grid-stride loop"](https://developer.nvidia.com/blog/cuda-pro-tip-write-flexible-kernels-grid-stride-loops/) is to ~~avoid~~ ensure "a single large grid of threads to process the entire array *in one pass*" therefore keep the *independence*.
        But also ["memory coalescing" -> spacial locality](https://developer.nvidia.com/blog/how-access-global-memory-efficiently-cuda-c-kernels/).
        > *Rather than* assume that the thread grid is *large enough* to cover the entire data array, this kernel loops over the data array *one grid-size* at a time.
        - benefits
          1. "support any problem size"
            
            "a *multiple* of the number of multiprocessors on the device, to *balance* utilization" -> "threads are *reused for multiple* computations" and "amortizes thread *creation and destruction cost*, etc."
          2. "Debugging" -> Serializing
            "eliminate numerical *variations* caused ... your numerics are correct *before tuning the parallel* version."
          3. "more like the original sequential loop" -> readability
            TODO [hemi](https://developer.nvidia.com/blog/simple-portable-parallel-c-hemi-2/)
            Portability -> "a kernel launch when compiled for CUDA, *or* a function call when compiled for the CPU."
  - kerenl param [`<<<nBlocks, blockSize, sharedBytes>>>`](https://stackoverflow.com/a/26774770/21294350)
  - `thread_group tile4 = tiled_partition(tile32, 4);` is runned in 
- TODO read [cuda c++ 11](https://developer.nvidia.com/blog/power-cpp11-cuda-7/)
##### [Benchmarking_thread_divergence_CUDA]
- p4
  - `&& !P0` because it corresponds to `pc+1` which is case: not taken.
- [`SSY`](https://cseweb.ucsd.edu/classes/wi15/cse262-a/static/cuda-5.5-doc/html/cuda-binary-utilities/index.html) -> Set *synchronization* point
  So `SSY 0x128;` just means synchronize *divergent* branches at `0x128`.
  TODO `BSSY` may just barrier added to `SSY`.
- `ISETP` is [chained](https://forums.developer.nvidia.com/t/cuda-sass-question/62334) by `PT` at 2rd pos and `PT/Px` at 5th pos (`x` is `0,1,...`).
  so `ISETP.LT.AND P0, PT, R0, 0x20, PT;` means if `R0<0x20` (i.e. `LT`) then `PT` is set to `P0` and chained by `AND`.
  
  Also [see](https://stackoverflow.com/a/19370940/21294350)
  - "since the compiler used a clever transformation" -> "into `((i < 4) & (i >= 0))`" with implied `>=0` -> "a *single* ISETP".
  - find out by examining additional usage examples. :)
  - "I have not had a need to look at this instruction closely, as it *does not seem to occur very often*"
  - "chain with `PT`" may means only *true* predicate will be in the `AND` (This is related how hardware designed See [COD_RISCV_2nd_A_appendix] "FIGURE A.3.3" and [this](#truth_table_hardware) where only take `true` in account when calculating `AND`). 
  - `PSETP.AND.AND P0, PT, !P0, PT, PT;` just puts `!P0 & PT(true) = !PT` to `PT`.
- `CS2R` [vs](https://forums.developer.nvidia.com/t/how-costly-is-the-s2r-instruction-reading-a-special-register/50472/6) `S2R`
  Also see [throughput table](https://forums.developer.nvidia.com/t/how-costly-is-the-s2r-instruction-reading-a-special-register/50472)
- [`@pred/@!pred`](https://stackoverflow.com/a/30289191/21294350)
- "active threads" just means idle threads which can *execute* -> So used in `and` by `active_mask && P0`.
- "stack Unwinding" just functions as `ret` in `x86`.
  Better see "Fig 3" where `NOP.S;` is used to execute the branch *not taken* by `token.mask ← active_mask && !P0` and `push(token)`.
- ["RAII"](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) just means constructor (i.e. initialization) to do "Resource allocation" and destructor to "resource deallocation". (the *coupled* relation is similar to acquire-release model in c++ (So it is similar to [Stack unwinding](https://stackoverflow.com/a/2331413/21294350)) -> implies "*Scope*-based Resource Management" but it is normally related with "*automatic* variables"). -> "if there are no object leaks, there are *no resource leaks*."
  above implies "Constructor Acquires, Destructor Releases (CADRe)".
  - whether "free store" and "heap" "in the same area" is ["*compiler* specific".](https://stackoverflow.com/a/9193170/21294350)
    The former implies "constructor and destructor".

    Better see [this](https://stackoverflow.com/questions/1350819/c-free-store-vs-heap#comment57565753_1350833) heap may be one old terminology and `free store` can be seen one 
    (~~TODO~~ one more common terminology of Encapsulation in csapp) ~~Encapsulation~~ wrapper of original `free` -> '[finished goods' supplier](https://stackoverflow.com/questions/1350819/c-free-store-vs-heap#comment110106618_1350833). 
    Or they are just [same p2](https://web.archive.org/web/20190712222152/https://www.stroustrup.com/Programming/17_free_store.ppt)
##### my GPU parameters
```bash
$ /opt/cuda/extras/demo_suite/deviceQuery
/opt/cuda/extras/demo_suite/deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "NVIDIA GeForce GTX 1650"
  CUDA Driver Version / Runtime Version          12.2 / 12.2
  CUDA Capability Major/Minor version number:    7.5
  Total amount of global memory:                 3725 MBytes (3906076672 bytes)
  (14) Multiprocessors, ( 64) CUDA Cores/MP:     896 CUDA Cores
  GPU Max Clock rate:                            1515 MHz (1.51 GHz)
  Memory Clock rate:                             6001 Mhz
  Memory Bus Width:                              128-bit
  L2 Cache Size:                                 1048576 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1024
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 3 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Device supports Compute Preemption:            Yes
  Supports Cooperative Kernel Launch:            Yes
  Supports MultiDevice Co-op Kernel Launch:      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 1 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 12.2, CUDA Runtime Version = 12.2, NumDevs = 1, Device0 = NVIDIA GeForce GTX 1650
Result = PASS
```
##### TODO
- [Occupancy Calculator](https://docs.nvidia.com/nsight-compute/NsightCompute/index.html#occupancy-calculator) from [this](https://stackoverflow.com/a/9986071/21294350)
##### [Scalable_CUDA]
- p13
  - "low-cost barriers in making coopera-tion" related with "Parallel reduction" maybe because they are one *huge cross-grid* reduction.
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
  <a id="Reduction_verilog"></a>
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
  [check](https://superuser.com/questions/837970/is-there-a-way-to-know-the-size-of-l1-l2-l3-cache-and-ram-in-ubuntu#comment2554233_837989) in linux directly (L1 cache [per core](https://www.quora.com/In-a-multi-core-system-does-each-core-have-a-cache-memory-for-itself-or-does-it-have-to-share-the-same-cache-with-other-cores) and [relation](https://unix.stackexchange.com/questions/468766/understanding-output-of-lscpu) among thread,core,socket ) <a id="cpu_socket"></a>
  from the following, L2 is 64 byte (cacheline size per way) <a id="cacheline_byte"></a>:
  ```bash
      # cache size infos
  $ lscpu --cache
  NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL SETS PHY-LINE COHERENCY-SIZE
  L1d       32K     256K    8 Data            1   64        1             64
  L1i       32K     256K    8 Instruction     1   64        1             64
  L2       512K       4M    8 Unified         2 1024        1             64
  L3         4M       8M   16 Unified         3 4096        1             64
  $ for i in $(ls /sys/devices/system/cpu/cpu0/cache/index0);do echo $i;cat /sys/devices/system/cpu/cpu0/cache/index0/$i;echo -e '';done # view by file https://stackoverflow.com/questions/1922249/c-cache-aware-programming ;  Or see https://unix.stackexchange.com/a/419672/568529
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
  - [__builtin_expect](https://stackoverflow.com/questions/7346929/what-is-the-advantage-of-gccs-builtin-expect-in-if-else-statements) just use *prefetch* and **branch prediction**. Then L1i cache miss should be decreased at least because of fetching less instructions. <a id="__builtin_expect"></a>
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
      - also see [zen2_wikichip][zen_2]. The shadow tags also function between CCXs by 'exclusive to this CCX' and 'CCXs are not directly connected'.
      - Better see this [patent][shared_tag_patent].
      - not totally same as [shadow memory](https://electronics.stackexchange.com/questions/240248/cache-memory-vs-shadow-ram) beacuse it adds some infos like 'state' and 'allocation property'.
      - also see this [slide](https://my.eng.utah.edu/~cs7810/pres/14-7810-12.pdf) 
        - p20 'partial tags' is same as patent says 'at least a portion of an address'.
        - p~~4~~7 die layout.
      - ~~TODO~~ no relation with [Shadow memory](https://en.wikipedia.org/wiki/Shadow_memory) better see valgrind [paper][shadow_memory].
## perf doc use [epyc 7713](https://en.wikichip.org/wiki/amd/cores/milan) which should share the same model `0x01` in one location of [19h](https://en.wikichip.org/wiki/amd/cpuid#Family_25_.2819h.29) just as [renoir](https://en.wikichip.org/wiki/amd/cores/renoir) including 4800h does in [17h](https://en.wikichip.org/wiki/amd/cpuid#Family_23_.2817h.29) 
- TODO [QoS Monitoring and Enforcement](https://www.amd.com/system/files/TechDocs/56375_1.03_PUB.pdf) in [L3 cache][zen_2]
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
  - notice: from [this](https://community.intel.com/t5/Software-Tuning-Performance/Which-perf-list-events-support-Precise-Event-Based-Sampling-PEBS/td-p/1198098), better use PEBS/[IBS "the instruction indicated **versus** the one causing the interrupt"](https://web.eece.maine.edu/~vweaver/projects/perf_events/sampling/pebs_ibs_sampling.pdf)
    - also see retirement [travisdowns "two cycles of retiring blocks of 4 nop instructions" TODO read more detailedly](https://travisdowns.github.io/blog/2019/08/20/interrupts.html) which may caused the above imprecision.
    - PEBS is just to use processor instead of interrupt which may have delay (also see above travisdowns blog). It uses the PEBS buffer, so not all events are supported.
    - [LBR](https://easyperf.net/blog/2018/06/08/Advanced-profiling-topics-PEBS-and-LBR) just means as it literally says. So it only cares about branch miss but not cache miss. 
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

## AMDuProf
- from [uprof_doc] chapter 3,4,5. Zen2 17h 60h ryzen 7 4800h not support many features.
- from [this](https://stackoverflow.com/questions/67959438/linux-perf-to-measure-memory-bandwidth-on-amd-epyc-2nd-gen#comment120569435_67959438), it may offer more than `perf` can offer.
### installation 
- recommend using dkms, so should run `sudo dkms autoinstall` instead of `sudo ./AMDPowerProfilerDriver.sh install` as [uprof_doc] says.
  - maybe has problem like `assignment of read-only member ‘vm_flags’`. See [this](https://forums.developer.nvidia.com/t/driver-470-182-03-fails-to-compile-with-linux-6-3-1/251992/4). This [patch](https://gist.github.com/vejeta/9078219f082d2bfd62b08b6eada780e6) works or just use `vma->__vm_flags       |= VM_RESERVED;` by viewing `vm_flags_set` source code with `compile_commands.json` generated by `bear -- make ARCH=x86` although not recommended (see [below](#vm_flags_set)).
- if manually build, maybe not use `sudo` if using rust (if system has rust, it may be only installed with the user but not root.). Also see [rust supported host](https://rust-lang.github.io/rustup-components-history/)
  rust config: [rustup](https://stackoverflow.com/questions/44303915/no-default-toolchain-configured-after-installing-rustup)

  ~~Notice: **Not use manually build** which may destroy the ``~~ 
<a id="vm_flags_set"></a>

```bash
$ rustup show                              
Default host: x86_64-unknown-linux-gnu
rustup home:  /home/czg/.rustup

stable-x86_64-unknown-linux-gnu (default)
rustc 1.70.0 (90c541806 2023-05-31)
# https://stackoverflow.com/questions/26581161/make-modules-install-restarts-configuration-process-for-cross-compile
[/var/lib/dkms/AMDPowerProfiler/10.0/source]$ sudo bear -- make ARCH=x86
...
error: rustup could not choose a version of rustc to run, because one wasn't specified explicitly, and no default is configured.
help: run 'rustup default stable' to download the latest stable release of Rust and set it as your default toolchain.
crypto/Kconfig:1393: can't open file "arch/arm/crypto/Kconfig" # weird read arm ... ;https://bbs.archlinux.org/viewtopic.php?id=286563
...
make[1]: *** [include/config/auto.conf] Deleting file 'include/generated/rustc_cfg'
make[1]: *** [include/config/auto.conf] Deleting file 'include/generated/autoconf.h' # Notice here `/usr/lib/modules/6.4.1-arch2-1/build/include/generated/autoconf.h` has been destroyed. So `bcc` will not be available.

[/var/lib/dkms/AMDPowerProfiler/10.0/source]$ bear -- make ARCH=x86 # works fine
make -C /lib/modules/6.4.1-arch2-1/build M=/var/lib/dkms/AMDPowerProfiler/10.0/source  EXTRA_CFLAGS="-I/var/lib/dkms/AMDPowerProfiler/10.0/source/inc -mpopcnt -DKERNEL_MODULE" modules
# the above one will not generate new `/usr/lib/modules/6.4.1-arch2-1/build/include/generated/autoconf.h`

# https://nanxiao.me/en/install-bcc-on-archlinux/
$ /usr/share/bcc/tools/execsnoop                                                                                            
In file included from <built-in>:1:
././include/linux/kconfig.h:5:10: fatal error: 'generated/autoconf.h' file not found
#include <generated/autoconf.h>
...

# need reinstall headers to repair.
$ yay -S linux-headers --noconfirm
```
- msr with amd: 1. from [this](https://lore.kernel.org/linux-pm/20201007161439.312534-5-kim.phillips@amd.com/T/), linux developer just use `intel_rapl` with amd cpu ("especially to allow existing tools to seamlessly run on AMD"). But maybe it is not used.
```bash
$ lsmod | grep msr
intel_rapl_msr         20480  0
intel_rapl_common      36864  1 intel_rapl_msr
$ modinfo msr     
name:           msr
filename:       (builtin)
license:        GPL
file:           arch/x86/kernel/msr
description:    x86 generic MSR driver
author:         H. Peter Anvin <hpa@zytor.com>
$ cat /sys/class/powercap/intel-rapl/intel-rapl:0/enabled
0
$ systool -v -m intel_rapl_msr                           
Module = "intel_rapl_msr"

  Attributes:
    coresize            = "20480"
    initsize            = "0"
    initstate           = "live"
    refcnt              = "0"
    srcversion          = "79D2BA6F3CAE9071A919E63"
    taint               = ""
    uevent              = <store method only>
```
### bcc
- bcc source compilation needs [flex](https://www.oreilly.com/library/view/flex-bison/9780596805418/ch01.html#:~:text=One%20of%20the%20nicest%20things,handle%20comments%2C%20using%20%2F%2F%20syntax.) which is based on regex,etc.,to output infos about input and [bison][aquamentus_flex_bison] (~~TODO~~ ~~where~~ `g++ snazzle.tab.c lex.yy.c -lfl -o snazzle` will error "/usr/bin/ld: /usr/lib/gcc/x86_64-pc-linux-gnu/13.1.1/../../../../lib/libfl.so: undefined reference to `yylex'", [see](https://stackoverflow.com/a/57061573/21294350) method 1 is valid.) 
  <a id="bison"></a>
  flex [only support `/**/`](https://www.cs.virginia.edu/~cr4bd/flex-manual/Comments-in-the-Input.html) but not `//` C-style comments at the file **begin location**.
  [skenz][skenz_flex_bison]
  - flex and bison are just based **regex** (they are mostly connected by **tokens**, [see](#token)), see [skenz_flex_bison] first example and this [concrete repo](https://github.com/czg-sci-42ver/Lex-FLex) which has `%s/%x` concrete examples.
    - from the above repo, flex also has one *Prologue section* as bison has.
  - highly recommend this [Q&A](https://stackoverflow.com/questions/34495544/using-flex-and-bison-together) which explains **lex(scanner/lexer) and yacc(parser)** (i.e. flex and bison) relation (also see [this](https://www.capsl.udel.edu/courses/cpeg421/2012/slides/Tutorial-Flex_Bison.pdf)). Based on the following, reread the 'bison_flex/skenz' codes. They are more understandable now. <a id="parser"></a>
    > A file such as exercise4.l is the input to flex which defines the **mapping** from lexemes to tokens, and exercise4.y would be the input to bison which defines the **order** of the tokens in a grammar. 
    
    So we use `%option header-file="lex.yy.h"` to generate header to use `yyin` in other *source codes* to let lexer process the file.

    miscs :If having redundant time and nothing to do, read the related [book](https://web.iitd.ac.in/~sumeet/flex__bison.pdf) (Better to learn coding instead this.)
    - viewing the generated codes to see the flex and bison relation. (All related funcs description can be also seen from [skenz_flex_bison])
      ```bash
      $ rm ./main;\          
      gcc -g -c -o scanner.o lex.yy.c;
      gcc -g -c -o parser.o parser.tab.c -DYYDEBUG=1;
      gcc -g -c -o main.o main.c;
      gcc -g -o main parser.o scanner.o main.o;./main example.txt
      ```
      `lex.yy.c`
      ```c
      extern int yylex (void);
      #define YY_DECL int yylex (void)
      ...
      case 1:
      YY_RULE_SETUP
      #line 15 "scanner.l"
      {return AV;}
      	YY_BREAK
      ```
      the above `AV` is *defined in `parser.tab.h`* which is generated by `parser.y`. This is the **main relation**. Also [see](https://www.reddit.com/r/learnprogramming/comments/qdtkcq/comment/hhoszk8/?utm_source=share&utm_medium=web2x&context=3) and also `info flex` "To use 'flex' with 'yacc', one specifies ..." <a id="token"></a>
      ```h
      enum yytokentype
      {
        AV = 270,                      /* AV  */
      ...
      };
      typedef enum yytokentype yytoken_kind_t;
      ```
      In `parser.tab.c`. Here just use one huge predefined array `yytranslate[YYX]` to translate *token* shared by `flex` and `bison` to *YYSYMBOL_AV* which will be used by `bison` inside.
      ```c
      #   define YY_CAST(Type, Val) ((Type) (Val))
      ...
      enum yysymbol_kind_t
      {
        YYSYMBOL_AV = 15,                        /* AV  */
      ...
      };
      typedef enum yysymbol_kind_t yysymbol_kind_t;
      ...
      #define YYTRANSLATE(YYX)                                \
        (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
         ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
         : YYSYMBOL_YYUNDEF)
      ...
          yychar = yylex ();
        }

      if (yychar <= YYEOF)
        {
          yychar = YYEOF;
          ...
      else
        {
          yytoken = YYTRANSLATE (yychar);
      ```
    - `yywrap` see `lex.yy.c`. So maybe just as this [quora](https://www.quora.com/What-is-noyywrap-in-Lex) says, to "stop lexing when the first end-of-file is reached." (i.e. **only process one file**.)
      ```c
      if ( yywrap(  ) )
      ...
      else 
          {
			if ( ! (yy_did_buffer_switch_on_eof) )
				YY_NEW_FILE;
			}
      ```
  - [aquamentus_flex_bison] on my archlinux `uname -r`->'6.4.1-arch2-1' with `gcc version 13.1.1 20230429 (GCC)` has one weird exclamation symbol output.
    ```bash
    $ g++ -fno-pie -no-pie -DYYDEBUG=1 snazzle.tab.c lex.yy.c -o main -g;./main
    ...
    !bison found a string: text
    ...
    ```
    after viewing assembly codes, some strange things happened. See [here](#ioputs_debug)
    - here `INT snazzle` or `snazzle INT` all works. Just see the original web link.
  - [debug](https://stackoverflow.com/questions/50821203/how-can-i-debug-my-flex-bison-grammar) bison and flex
    ```bash
    $ flex -d snazzle.l;bison -d snazzle.y -t;g++ snazzle.tab.c lex.yy.c -o main;./main
     # or
    $ flex -d snazzle.l;bison -d snazzle.y;g++ -DYYDEBUG=1 snazzle.tab.c lex.yy.c -o main;./main
     # the following won't have bison debug output 
    $ flex -d snazzle.l;bison -d snazzle.y;g++ snazzle.tab.c lex.yy.c -o main;./main
    $ bison -V    
    bison (GNU Bison) 3.8.2
    $ flex -V
    flex 2.6.4
    ```
    - notice: maybe in newer `bison`, we should use `#if YYDEBUG` because in `snazzle.tab.h` it has:
      ```h
      #ifndef YYDEBUG
      # define YYDEBUG 0
      #endif
      ```
      - also bison doesn't have `Next token is token ...` (just see the generated source code. It is explicit).
    - also see the official manuals referenced in the link. From [this](https://flex.sourceforge.net/), [this](https://westes.github.io/flex/manual/) is the official flex manual. (same as `info`).
      So bison can use `-v` to get `*.output` debug infos.
    - `nonterminal` just means matching maybe *nonterminal*, also see [manual "syntactically equivalent *groupings*" ](https://www.gnu.org/software/bison/manual/html_node/Symbols.html)
      Also [see the figure](https://en.wikipedia.org/wiki/Context-free_grammar) 
      ```bash
      [/mnt/ubuntu/home/czg/csapp3e/bison_flex/bison]$ flex -d snazzle.l;bison -d snazzle.y;g++ -DYYDEBUG=1 snazzle.tab.c lex.yy.c -o main;./main
      ...
      Entering state 5
      Stack now 0 1 5
      Reducing stack by rule 1 (line 40):
         $1 = token INT ()
         $2 = nterm snazzle ()
      bison found an int: 90
      -> $$ = nterm snazzle ()
      ```
- above two links are enough to understand what are flex and bison and their relations. Todo more [see](https://www.usna.edu/Users/cs/roche/courses/f18si413/lab/04/).
### `AMDuProfPcm`
```bash
$ /opt/amduprof/bin/AMDuProfPcm -m memory
Missing configuration file - unsupported processor model.
```
### `AMDuProfSys`
```bash
$ . ~/.virtualenv/misc/bin/activate
$ /opt/amduprof/bin/AMDPerf/AMDuProfSys.py collect --config l3 -a sleep 5
Unable to open file  /opt/amduprof/bin/AMDPerf/data/0x17_0x6/configs/l3/l3_config.yaml # view the python script, it just means not supported.
```

## perf <a id="perf"></a>
### commands
- see this [perf_cache_misses]. Here not use [--call-graph dwarf](https://stackoverflow.com/questions/59307540/profiling-my-program-with-linux-perf-and-different-call-graph-modes-gives-differ) beacuse it generate much bigger file.
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
    - no `pp` modifier listed in `man perf-list` available because [PEBS](https://easyperf.net/blog/2018/06/08/Advanced-profiling-topics-PEBS-and-LBR). Also see from [source code](https://elixir.bootlin.com/linux/v5.6.14/source/tools/perf/pmu-events/arch/x86/skylakex/cache.json#L630) referenced [here](https://stackoverflow.com/a/62059796/21294350).
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
    - So [PPR_17h_60h] p167 just means not to fetch into L2cache. But just use L2cache to offer service to L1 cache. So [Core](https://github.com/torvalds/linux/blob/995b406c7e972fab181a4bb57f3b95e59b8e5bf3/tools/perf/pmu-events/arch/x86/amdzen2/cache.json#L184C26-L184C30) means `L1`. (Also see [this](https://unix.stackexchange.com/questions/326621/what-are-kernel-pmu-event-s-in-perf-events-list) related with intel)
  - `l2_request_g1.cacheable_ic_read` related PMCx060 and PMCx061 are ~~not~~ related with L1 miss. ~~So ignore them.~~ Only use `l2_request_g2.ic_rd_sized(_nc)` to test whether avx fetch *sized* data *cacheline*.
    - also see [uprof_doc] p38 for **metric group**.
  - `ls_hw_pf_dc_fill.ls_mabresp_rmt_cache` here shoule be 0, because my cpu only has one numa. This can be seen from [lstopo](#lstopo) and cmds <a id="numa"></a>:
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
  - `ls_refills_from_sys.ls_mabresp_lcl_cache` '**Home Node** is on this thread's die'. Better also see [PPR_17h_60h] doc. It is similar to above `ls_hw_pf_dc_fill`, only different in the aspect of whether demand (by instruction or explicit fetch) or prefetch (**implicit** fetch -> hardware prefetch).
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
# continue above [perf](#perf) test
record list
- [x] `L1-...` (5 events)
- [x] `(d/i)TLB-load(...)` (4)
- [x] ls_refills_from_sys (5 items)
- [x] ls_hw_pf_dc_fill (5)
- [x] ls_sw_pf_dc_fill (5)
- [x] `ls_st_commit_cancel2.st_commit_cancel_wcb_full`
- [ ] `l2_request_g1` (6)
  - [x] `change_to_x`
  - [x] `prefetch_l2_cmd`
  - [x] `l2_request_g1.ls_rd_blk_c_s`
  - [x] `l2_request_g1.rd_blk_l/x` (2)
  - [x] `l2_request_g1.l2_hw_pf`
- [x] `l2_request_g2.group1` and `l2_request_g1.group2` ignored because they contains multiple small events
- [x] `de_dis_uops_from_decoder.opcache_dispatched` and `de_dis_uops_from_decoder.decoder_dispatched`
- [x] `l2_request_g1.all_no_prefetch` ignored because ["UMask": "0xf9"](https://github.com/torvalds/linux/blob/1c7873e3364570ec89343ff4877e0f27a7b21a61/tools/perf/pmu-events/arch/x86/amdzen2/cache.json#L53C5-L53C20)
- [ ] `l2_cache_req_stat.ls...` (ls(load/store) unit) (5 except `ls_rd_blk_l_hit_x`)
- [x] `l2_pf_miss...` (2)
- [ ] `l2_wcb_req` (4 except `wcb_close/wcb_write`)
- [x] `l2_request_g2.ls_rd_sized...` (2)
- [ ] ic
  - [x] `l2_cache_req_stat.ic_fill_hit_x`
  - [x] `l2_cache_req_stat.ic_access_in_l2`
  - [ ] ``
---

- use this python script [perf_post_py_script] or 
  `awk` by `awk 'FNR >= 12 || FNR <=41 {for(i=22;i<=42;i++) $i=""; print $0}' ~/perf_log/almost_all_cache.log.report | less` (this will make the output format change by make all delimiters ' '. How to select [row and column](https://stackoverflow.com/questions/1506521/select-row-and-element-in-awk)). Also can try [cut](https://stackoverflow.com/questions/2626274/print-all-but-the-first-three-columns). `sed` may be difficult to select [column](https://stackoverflow.com/questions/59326355/how-to-get-third-column-first-row-with-sed-in-linux)
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
## TODO what `l2_request_g2.group1` and `l2_request_g1.group2` measures. See this [Q&A_1](https://stackoverflow.com/questions/76601866). Also see [this Q&A](https://unix.stackexchange.com/posts/750399/timeline#history_8a66734e-9ee0-40e4-bdeb-9e4ff000021e) and [miscs_py_script] script.
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
 here also cause `group1` fails to sample.
$ perf report -i ~/perf_log/group2.log -n --group --stdio
...
 Total Lost Samples: 0
```
- Answering the above Q&A_1, from [PPR_17h_60h] p163, they are just *OR* relation in **most situations**. The unit0 probably just means **reset** state. And from [OCRR_17h] p160, it means that "Miscellaneous events covered in more detail by" in [PPR_17h_60h] "PMCx061" refers to all group1 events.
  Also note as the [PPR_17h_60h] says "result in misleading counts", sometimes if sum up, we may get not consistent result. See [#750399 post "Not sum. 0xf9:  5091787060.0 , while mask sum:  5150956350.0"](https://unix.stackexchange.com/posts/750399/timeline#history_8a66734e-9ee0-40e4-bdeb-9e4ff000021e) which can be also seen in [miscs_py_script]. 
  From this [llvm review "doesn't really count the 6 pipes."](https://reviews.llvm.org/D94395?id=341995), the [0xc8](https://github.com/torvalds/linux/blob/a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451/tools/perf/pmu-events/arch/x86/amdzen2/recommended.json#L31) shown in the above #750399 post may be not accurate just as the post says.
```bash
$ perf stat -e r0aa,r1aa sleep 1 

 Performance counter stats for 'sleep 1':

                 0      r0aa                                                                  
         1,815,971      r1aa
```
### so ignore `l2_request_g2.ls_rd_sized` and `l2_request_g2.ls_rd_sized_nc`
## `l2_request_g1.all_no_prefetch` is sum of other small events. Ignore it.
## ic related events ~~`ic_cache_fill_l2`~~ ~~from here use new perf data~~
```bash
$ cd;perf record -g --call-graph fp -e l2_cache_req_stat.ls_rd_blk_c,l2_cache_req_stat.ls_rd_blk_cs\
,l2_cache_req_stat.ls_rd_blk_l_hit_s,l2_cache_req_stat.ls_rd_blk_l_hit_x\
,l2_cache_req_stat.ls_rd_blk_x\
 ~/matrix-matrix-multiply/build/src/dgemm;\
mv perf.data ~/perf_log/l2_cache_req_stat_ic_cache_fill_etc.log
 can also use `--no-children` to compare and choose the preferred 
$ perf report -i ~/perf_log/l2_cache_req_stat_ic_cache_fill_etc.log --group --stdio -n --hierarchy
...
$ 
```
### viewing the value `ic_cache_fill_l2/ic_cache_fill_sys`
  normally, they are all around 0.2. And more bigger store units implies less instruction fetch.
  ```bash
  func               dgemm_basic:   358,  1619,   0.221124; 
  func       dgemm_basic_blocked:   133,   740,    0.17973; 
  func              dgemm_avx256:    69,   352,   0.196023; 
  func     dgemm_unrolled_avx256:    39,   220,   0.177273; 
  func          dgemm_openmp_256:    23,   157,   0.146497; 
  func      dgemm_blocked_avx256:    23,    91,   0.252747; 
  ```
### `l2_cache_req_stat.ic_fill_hit_x` is probably 0, since no ["modifiable line in L2"](https://github.com/torvalds/linux/blob/1c7873e3364570ec89343ff4877e0f27a7b21a61/tools/perf/pmu-events/arch/x86/amdzen2/cache.json#L166C120-L166C141) with instructions.
### `l2_request_g1.cacheable_ic_read/l2_cache_req_stat.ic_access_in_l2` are almost $1$, meaning that all fetch from L2.
### TODO `ic_dc_hit_in_l2/ic_dc_miss_in_l2` almost 1 and `ls_rd_blk_l_hit_x` is almost same as `ic_dc_hit_in_l2` (seems that `ic` no hit counts). <a id="ic_dc_miss_in_l2"></a>
The relation between funcs see other description. The reasons are same.
```bash
$ git rev-parse HEAD                                   
0d9693ff32151c0c96d35f0145a55301f04e9a32
$ cat sample_num_no_prefetch_l2_opcache_quotient.report                               
10:
func               dgemm_basic: 11666, 11669,   0.999743; 11660, 11668,   0.999314;   990,  7723,   0.128189;  4902,  4775,     1.0266; 
func      dgemm_blocked_avx256:   901,   775,    1.16258;   914,   760,    1.20263;    95,   358,   0.265363;   320,   295,    1.08475; 
func              dgemm_avx256:  3035,  3020,    1.00497;  3004,  2974,    1.01009;   298,  1906,   0.156348;  1264,  1114,    1.13465; 
func     dgemm_unrolled_avx256:   905,   905,          1;   910,   908,     1.0022;   100,   653,   0.153139;   478,   437,    1.09382; 
func       dgemm_basic_blocked:  6900,  6913,   0.998119;  6858,  6899,   0.994057;   652,  3177,   0.205225;  2838,  2225,    1.27551; 
func          dgemm_openmp_256:  1461,  1318,     1.1085;  1698,  1366,    1.24305;   115,   485,   0.237113;   623,   264,    2.35985;
```
### `l2_cache_req_stat.ic_fill_hit_s/l2_cache_req_stat.ic_fill_miss` is smaller because they are all fetched into L1. See [above](#ic_dc_miss_in_l2)
- `dgemm_openmp_256`'s `L1-icache-loads/L1-icache-load-misses` is higher because all threads may be assigned same works (i.e. same instructions which can be reused.)
### `l2_request_g1.cacheable_ic_read` func relation same as others.
- here `dgemm_openmp_256` is similar to `dgemm_blocked_avx256`. Maybe it has reached the threshold where hot instructions can be fit in cache. 
### `ic_cache_inval.l2_invalidating_probe`
- the main idea 
- notice it is not included in my cpu PPR [PPR_17h_60h] but it exists in [17h_18h].
  From [this topic](https://community.amd.com/t5/processors/does-ppr-list-all-available-events/m-p/617681#M55000)
  better "prioritize the information provided in the PPR documentation".
  But "the Linux source code can also provide valuable insights ... expose *additional* events or utilize *specific* names for events"
  - here [SMC](https://web.inf.ufpr.br/mazalves/wp-content/uploads/sites/13/2020/03/jcvht2020.pdf) and [CMC](https://cr.openjdk.org/~jrose/jvm/hotspot-cmc.html) are just as they literally mean.
  - From [Intel doc](https://stackoverflow.com/questions/10989403/how-is-x86-instruction-cache-synchronized), it should only invalidate icache when *code segment*/[text segment](https://en.wikipedia.org/wiki/Data_segment#Code) changed.
    And may also invalidate when "different linear address" (i.e. different addressing mode.)

    But PowerPC always "flush of deeper data processing units" (consistent with *data memory*) even when "caches are disabled".
    - Then use [`objdump -h`](https://stackoverflow.com/a/26701642/21294350) to verify. From the output, no data segment in the [code segment "CODE" ](https://stackoverflow.com/a/11196894/21294350).
      ```bash
      $ objdump -h ~/matrix-matrix-multiply/build/src/dgemm| less
       11 .init         0000001b  0000000000003000  0000000000003000  00003000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
       12 .plt          00000390  0000000000003020  0000000000003020  00003020  2**4
                        CONTENTS, ALLOC, LOAD, READONLY, CODE
       13 .text         000040cb  00000000000033b0  00000000000033b0  000033b0  2**4
                        CONTENTS, ALLOC, LOAD, READONLY, CODE
       14 .fini         0000000d  000000000000747c  000000000000747c  0000747c  2**2
                        CONTENTS, ALLOC, LOAD, READONLY, CODE
      ```
    - [TSX](https://en.wikipedia.org/wiki/Transactional_Synchronization_Extensions) in p406 is related with programming based on the transactional memory.
  - with [`0x8d` not supported](https://github.com/search?q=repo%3Atorvalds%2Flinux+0x8d+language%3Ajson+path%3Atools%2Fperf%2Fpmu-events%2Farch%2Fx86%2Famdzen2&type=code) and `0x8c` test, my cpu may not support since C [not auto](https://stackoverflow.com/a/43162641/21294350) supports self modifying code.
    Then both shows counts when `perf stat ...`, which implies maybe both is unvalid.
- L2 invalidating probe
  - related with L2 is inclusive of L1 and the former has [Back invalidation](https://en.wikipedia.org/wiki/Cache_inclusion_policy). See [this](https://cs.stackexchange.com/questions/29136/back-invalidation-to-maintain-inclusion-in-inclusive-cache) for more details.
    - TODO [Bloom Filter](https://brilliant.org/wiki/bloom-filter/#:~:text=A%20bloom%20filter%20is%20a,is%20added%20to%20the%20set.) just use hash. See how probability is calculated.
    - "compression coherence directory" -> [this][icpp07]
      TODO why this decompression "approximate filter". and section 3.

      It use independent "PROTOCOL CORE" to help compression.
      Here " if at least ... using the second *algorithm*" all to simplify implementation, and "which of the four *subschemes* is used for each 64-bit chunk"
    - [a directory coherence entry p10](http://www.cs.cmu.edu/afs/cs/academic/class/15418-s19/www/lectures/13_directory.pdf) to record all cpu cache state per cache line. It just explains "use one bit per L1 cache".
    - Also see [comment](https://cs.stackexchange.com/questions/29136/back-invalidation-to-maintain-inclusion-in-inclusive-cache#comment58755_29141)
      - Better see codes how to implement 
      - That "SOME *core* owns a cache line." but not thread implies "approximate" knowledge. and "inclusion" implies "no knowledge".
- overwriting fill response
  - [fill](http://mertboru.com/?tag=cache-line-fill) just means fetch. "a write misses the cache ... a cache line fill," implies the fill is just init by reading the upper level memory.
    Setting the [CD](https://xem.github.io/minix86/manual/intel-x86-and-64-manual-vol3/o_fe12b1e2a880e0ce-76.html) flag will influence.
  - so "overwriting fill response" maybe just means fetching wrongly (maybe misprediction of branch ).
## `l2_request_g1`; better view `ls_refills_from_sys`. (The following also has `ls_sw_pf_dc_fill` and `ls_hw_pf_dc_fill`)
### `l2_request_g1` related cmds
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
- `change_to_x`: only `dgemm_basic` and `dgemm_basic_blocked` shows one small value. (The `dgemm_unrolled_avx256` shows 1, ignore it) Because they not use somewhat parallel method like avx, so ~~cpu may schedule a new thread to help running it with original threads~~ it may change cache state. See [SOG_17h] doc p18, it use "Linear address utag" (i.e. ~~at least virtually indexed. ~~ to accelerate selecting way with **hash** after using VIPT,etc.,to [select **set**](https://en.wikipedia.org/wiki/CPU_cache#Cache_entry_structure).). So it may conflict.
  - Since avx256 is 32 byte (256=32*8), it corresponds to 'L2 to L1 data path is 32 bytes wide.' in [SOG_17h] p19. So perform better (both load and invalidation less). <a id="data_path"></a>
    - it is just  and also not exceed [cacheline size](#cacheline_byte). 
    - Also see [SOG_17h] p17 it conforms to "natural **alignment** boundary". so `__m256d` use `__vector_size__ (32),` in `g++` header.
    - kw: "two 128-bit loads",
    - Since it is **loaded together** (So `dgemm_basic_blocked` still has `change_to_x`), it may less possible to cause hash conflict.
  - [PPR_17h_60h] p164 LS meaning see [SOG_17h] p33.
    - [PPR_17h_60h] `EX` should be the execution stage. `DE` decoder (Then will 'Dispatch Resource'), `BP` -> 'Branch Prediction' (related with `IC`(Instruction Cache), so put together)
  - [AGQ][zen_2] in [SOG_17h] p27. `DE` may means ['directory entry'](https://wiki.osdev.org/Paging)
- [Overhead](https://perf.wiki.kernel.org/index.php/Tutorial) proportion may be not same as `Samples` proportion due to precison of 2. Use `Samples` better.
- DAT,WCB(~~maybe~~ WC(write-combining) buffer, can be seen in `perf list`),MAB,STP meaning in [SOG_17h] p34.
- From the close relation between L1 `L1-*` and L2 `l2_request_g1` in `perf annotate`. They may not use uncachable store buffer. So 
### view the `rate1=l2_request_g1.rd_blk_l/l2_request_g1.rd_blk_x`, here obviously avx `rate1` is higher because store one **packet** with four data instead of one data 
- (although with `-O3` `basic` get use `xmm` 128 bit but not use `vfmadd231pd`).
  Here `dgemm_unrolled_avx256` use multiple `ymm` register because of **small** `unroll` size which is optimized by compiler. <a id="ymm"></a>

  here cpu probably uses WCB,(sometimes `dgemm_blocked_avx256` is higher than `dgemm_unrolled_avx256` which is more obvious because the former store unit is bigger.)
  Notice: WCB is directly to L2, not through L1. just see the [figure](https://en.wikichip.org/wiki/File:amd_zen_hc28_memory.png) which is from [SOG_17h] as [this](https://stackoverflow.com/a/49961612/21294350) says.
  intel use WCB from L1 to L2, and [others](https://stackoverflow.com/questions/49959963/where-is-the-write-combining-buffer-located-x86#comment86939708_49961612) call "superqueue". "Write Combining Buffers" may be just same as LFBs as the reference in the former link says, but maybe not in the comments of that.

  Here `dgemm_avx256` wcb is more than `dgemm_unrolled_avx256`, but the former's `rd_blk_x` (write counts of wcb and others) is more because [SOG_17h] p37 says "one efficient 64-byte memory write" which is 512bit and *up to 7* from one thread. So the latter combines more efficiently *within the WC range*. Then `dgemm_blocked_avx256` maybe uses *too large* store unit, so it will use more wcb and then `rd_blk_x` is less.

  [PCI posted](https://en.wikipedia.org/wiki/Posted_write) is similar to WC and not "*wait* for the done" in this [doc](https://download.intel.com/design/PentiumII/applnots/24442201.pdf).

  dgemm_openmp_256 is lower, because they are split into different threads and WCB is *related with L2 cache* per core.
  ```bash
  10:
  func dgemm_basic: 15836, 12430, 1.27401
  func dgemm_avx256: 3773, 113, 33.3894
  func dgemm_unrolled_avx256: 1202, 10, 120.2
  func dgemm_basic_blocked: 9368, 3089, 3.0327
  func dgemm_blocked_avx256: 1362, 51, 26.7059
  func dgemm_openmp_256: 2610, 1534, 1.70143
  ```
### `l2_request_g1.ls_rd_blk_c_s` just similar to `l2_cache_req_stat.ls_rd_blk_cs` 
- the former including prefetches is higher than the latter except for `dgemm_openmp_256`.
- notice `l2_request_g1.ls_rd_blk_c_s/l2_cache_req_stat.ls_rd_blk_cs` (same as others how to get this data) may be changed largely because sometimes the latter of `dgemm_unrolled_avx256`,etc.,doesn't share data except prefetching. see:
  ```bash
  $ git rev-parse HEAD
  54bd59d29b60647ab676f8d4e82343669a7fd93d
  ```
### `l2_request_g1.change_to_x` is similar to `l2_cache_req_stat.ls_rd_blk_x`, see [this](#ls_rd_blk_x)
### `l2_request_g1.l2_hw_pf` is just similar to `ls_refills_from_sys.ls_mabresp_lcl_l2` which is also similar to [`ls_hw_pf_dc_fill.ls_mabresp_lcl_l2`](#ls_refills_from_sys)
- first 3 columns: why openmp and blocked showed `0.673953`,etc.,is same as [here](#non_modifiable) "split" and "unit size".

  2nd 3 columns: still because unit size -> `dgemm_avx256` > `dgemm_unrolled_avx256` > `dgemm_blocked_avx256` (here similar `ls_mabresp_lcl_dram` with less `ls_mabresp_lcl_cache` is better.)
  openmp split -> more share inside *home node*.
```bash
$ cat /mnt/ubuntu/home/czg/csapp3e/debug/debug_block.sh | grep events= -A 5
events=l2_cache_req_stat.ls_rd_blk_c\
,l2_request_g1.l2_hw_pf\
,ls_refills_from_sys.ls_mabresp_lcl_cache,ls_refills_from_sys.ls_mabresp_lcl_dram\
,ls_refills_from_sys.ls_mabresp_lcl_l2\
$ cat /mnt/ubuntu/home/czg/csapp3e/debug/debug_block.sh | grep select_column_str=     
-v select_column_str="3,5;3,4" \
$
10:
func               dgemm_basic: 16447, 16402,    1.00274; 16447, 11362,    1.44754; 
func              dgemm_avx256:  3861,  3847,    1.00364;  3861,   812,    4.75493; 
func       dgemm_basic_blocked:  9516,  9349,    1.01786;  9516,  3361,     2.8313; 
func     dgemm_unrolled_avx256:  1186,  1189,   0.997477;  1186,   398,     2.9799; 
func          dgemm_openmp_256:  1449,  2150,   0.673953;  1449,   351,    4.12821; 
func      dgemm_blocked_avx256:   862,  1205,   0.715353;   862,   836,     1.0311; 
```
### `ls_sw_pf_dc_fill`
- notice: on 4800h with only **one numa**, `ls_sw_pf_dc_fill.ls_mabresp_rmt_cache` and `ls_sw_pf_dc_fill.ls_mabresp_rmt_dram` show $0$. But `ls_mabresp_lcl_cache` >  `ls_mabresp_lcl_l2` >`ls_mabresp_lcl_dram`. So obviously implicitly using multiple threads.
  Here, why `dgemm_unrolled_avx256`'s `ls_mabresp_lcl_cache`,etc.,are less than `dgemm_avx256` is probably because ~~it use multiple [ymm](#ymm)~~. ~~So the former may use write combining buffer to write together which is not viewed from the assembly code.~~ (Compared with `ls_hw_pf_dc_fill` and `ls_refills_from_sys`, `ls_sw_pf_dc_fill` can be ignored based on **Amdahl's law**.)
  Since most of `l2_request_g1` are not $0$, so it use cacheable write buffer. Then `ls_st_commit_cancel2.st_commit_cancel_wcb_full` is $0$.

  Here, `ls_refills_from_sys.ls_mabresp_rmt_cache` and `ls_refills_from_sys.ls_mabresp_rmt_dram` is 0, because only one [numa](#numa) node. <a id="ls_refills_from_sys"></a>
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
### `ls_hw_pf_dc_fill`
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
## `l2_cache_req_stat` (not including L2 Prefetch) and `de_dis_uops_from_decoder`, `l2_pf_miss_l2_hit_l3`,`l2_pf_miss_l2_l3`, `l2_wcb_req`
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
### `l2_cache_req_stat.ls_rd_blk_c`
- similar to above, `dgemm_basic_blocked` use block to cache and `dgemm_avx256` use ymm to cache which is better because it has corresponding instructions like `vfmadd` to help. And `dgemm_unrolled_avx256` has one factor of nearly `UNROLL` over `dgemm_avx256`.
  From [this](https://stackoverflow.com/a/59868861/21294350), "bumped up to (at least on Intel CPUs) L3 cache" implies why `dgemm_openmp_256`'s ls_rd_blk_c is higher than `dgemm_blocked_avx256` (view the `l2_pf_miss_l2_hit_l3/l2_pf_miss_l2_l3` difference). Here "cache might be guessing" ~~may be not possible to guess how ~~ is probably based on consecutive access. Since multithread split the access, so they are *not consecutive on every core*, then also make `ls_rd_blk_c` higher. Also see "drop hints" to control how to tweak cache prefetch. <a id="l2_pf_miss_l2_hit_l3"></a>
  ```bash
  $ git rev-parse HEAD                                                        
  6d7767c463ff8e069e6ee5d5be7d88ce7e8a5330
  $ . /mnt/ubuntu/home/czg/csapp3e/debug/debug_block.sh
      # change events to l3 
  $ cat ../sample_num_no_prefetch_l2_opcache_10.report
  # Samples: 157K of events 'l2_cache_req_stat.ls_rd_blk_c, l2_cache_req_stat.ls_rd_blk_cs, l2_cache_req_stat.ls_rd_blk_l_hit_s, l2_cache_req_stat.ls_rd_blk_l_hit_x, l2_cache_req_stat.ls_rd_blk_x, l2_pf_miss_l2_hit_l3, l2_pf_miss_l2_l3'
     29625       20479       18437       29845       13018       27928       18627        dgemm_10
         28768       19026       16707       29224       11750       27314       17842        dgemm_10            
            13455        8656        7891       13439        8355       12890        8119        [.] dgemm_basic
            3534        2375        1713        3571         199        3515        2469        [.] dgemm_avx256
             996         325         423        1002           2         924         509        [.] dgemm_unrolled_avx256
             8037        5568        3721        8023        1771        6856        4077        [.] dgemm_basic_blocked
             1815        1153        2227        1955        1272        2116        1271        [.] dgemm_openmp_256
             917         722         588        1103           5         852         671        [.] dgemm_blocked_avx256
  ```
### `l2_cache_req_stat.ls_rd_blk_cs` is just opposite of `ls_rd_blk_c`. Since more **consecutive** access implies cache hit -> less cache miss and **less** *required* share hits. 
Notice: `dgemm_openmp_256` is split into too sparse into 16 threads -> less consecutive and more share hits because of multi threads than `dgemm_blocked_avx256`.
### `ls_rd_blk_l_hit_s` [has been solved](https://stackoverflow.com/questions/76646899)
from the below `l2_cache_req_stat.ls_rd_blk_cs/l2_cache_req_stat.ls_rd_blk_l_hit_s`, *openmp* split into threads so it has more owned states of cache which make others "non-modifiable" in [17h_A0h](this is one [new](https://review.coreboot.org/c/coreboot/+/60984/2) ~~cpu~~ [soc](https://cs50.harvard.edu/ap/2020/assets/pdfs/cpu_and_soc.pdf). It use [Mendocino](https://wccftech.com/amd-zen-4-and-mendocino-cpus-receive-cpu-temperature-driver-patch-in-linux/) codename. It is [succeeder](https://forums.anandtech.com/threads/amd-bristol-stoney-ridge-thread.2463487/page-61) of 20h which is also [soc](https://en.wikichip.org/wiki/amd/cores/dali)), then the denominator is bigger. <a id="non_modifiable"></a>
small store unit size but larger than `dgemm_basic` (i.e. `dgemm_avx256` and `dgemm_basic_blocked`) just more efficiently used the [cache line](#cacheline_byte).

`dgemm_unrolled_avx256` *store unit size* may be too big just as [this](#store_size) said.

`dgemm_blocked_avx256` sometimes higher / lower than `dgemm_unrolled_avx256`.
```bash
$ cat sample_num_no_prefetch_l2_opcache_quotient.report
10:
func               dgemm_basic:  2965,  1903,    1.55807; 
func              dgemm_avx256:  1321,   406,    3.25369; 
func       dgemm_basic_blocked:  1360,   522,    2.60536; 
func     dgemm_unrolled_avx256:    68,    54,    1.25926; 
func          dgemm_openmp_256:   618,  2250,   0.274667; 
func      dgemm_blocked_avx256:   146,    84,     1.7381; 
```
### `ls_rd_blk_l_hit_x/ls_rd_blk_c` are all almost $1$. Why all similar? TODO
- ~~after all, this quotient is not the main part to optimize. Just to decrease the miss count is .~~
### `ls_rd_blk_x` better compare with store miss, but perf with my cpu not support that.
- [store hit p6](https://cseweb.ucsd.edu/classes/wi02/cse141/c16moreCache.pdf) just means data is in cache (maybe dirty).
  - 'store hit' of `dgemm_unrolled_avx256` and `dgemm_blocked_avx256` are low because their store block is large. And `dgemm_openmp_256` split it, so it is higher. <a id="store_size"></a>
- Also see [this](#non_modifiable) why `dgemm_openmp_256` higher (related with MOESI).
  Notice `ls_rd_blk_x` of `dgemm_basic` and `dgemm_basic_blocked` because they store counts are high. (`change_to_x` not includes store but only `state change requests`) <a id="ls_rd_blk_x"></a>
```bash
$ cat ../sample_num_no_prefetch_l2_opcache_10.report
# Samples: 55K of events 'l2_cache_req_stat.ls_rd_blk_c, l2_request_g1.change_to_x, l2_cache_req_stat.ls_rd_blk_x, l2_cache_req_stat.ls_rd_blk_l_hit_s'
...
          16080          15        8436        1740        [.] dgemm_basic
          3638           1           2         253        [.] dgemm_avx256
           9205           3         328         409        [.] dgemm_basic_blocked
           1182           0           3          48        [.] dgemm_unrolled_avx256
           1187           0           1          55        [.] dgemm_blocked_avx256
           2315        1169        1466        2487        [.] dgemm_openmp_256
```
### `l2_pf_miss_l2_hit_l3/l2_pf_miss_l2_l3`
relation between the funcs of each events are same as L2 related.

from the following, `dgemm_openmp_256` is higher (just see [above](#l2_pf_miss_l2_hit_l3)). Same as above, bigger blocks caused less fetch from L3 (numerator smaller), so more L3 *compulsory* *miss* proportion (denominator larger). 
also see locality and successful prefetch [inverse proportion "generate a lot of L2 misses, and often a lot of L3 hits"][miss_rate] relation with L3 hit
- TODO BFS relation with cache in the above link.
```bash
$ git rev-parse HEAD                                   
5baa17aeddab268007100aa3ed68f360fee165ff
$ . /mnt/ubuntu/home/czg/csapp3e/debug/debug_block.sh 
$ cat sample_num_no_prefetch_l2_opcache_quotient.report
func dgemm_basic: 8144, 4669, 1.74427
func dgemm_avx256: 2150, 1369, 1.57049
func dgemm_unrolled_avx256: 573, 397, 1.44332
func dgemm_basic_blocked: 4399, 2947, 1.4927
func dgemm_openmp_256: 1395, 867, 1.609
func dgemm_blocked_avx256: 626, 470, 1.33191
```
### `l2_wcb_req.cl_zero` just means something like clearing cache "repeated zero-ing of the same memory buffer".
It and `l2_wcb_req.zero_byte_store` are probably $0$.

relation between the funcs of each events are same as ~~ above `l2_pf_miss_l2_hit_l3` and~~ L2 related.

TODO `wcb_close` may be to cancel write.
Then `wcb_close/wcb_write < 1` normally but almost near 1. Why?
```bash
$ cat ../sample_num_no_prefetch_l2_opcache_10.report
# Samples: 40K of events 'l2_cache_req_stat.ls_rd_blk_c, l2_wcb_req.cl_zero, l2_wcb_req.wcb_close, l2_wcb_req.wcb_write, l2_wcb_req.zero_byte_store'
  32898           0        3433        3985           0        dgemm_10
      32296           0        2901        3174           0        dgemm_10            
        14878           0        1312        1443           0        [.] dgemm_basic
        3853           0         348         364           0        [.] dgemm_avx256
          1112           0          88          69           0        [.] dgemm_unrolled_avx256
          8897           0         795         828           0        [.] dgemm_basic_blocked
          2420           0         253         352           0        [.] dgemm_openmp_256
          1125           0         102         114           0        [.] dgemm_blocked_avx256
$ cat sample_num_no_prefetch_l2_opcache_quotient.report
10:
func dgemm_basic: 1312, 1443, 0.909217
func dgemm_avx256: 348, 364, 0.956044
func dgemm_unrolled_avx256: 88, 69, 1.27536
func dgemm_basic_blocked: 795, 828, 0.960145
func dgemm_openmp_256: 253, 352, 0.71875
func dgemm_blocked_avx256: 102, 114, 0.894737
```

### `de_dis_uops_from_decoder`
DSB also [see](https://llvm.org/devmtg/2016-11/Slides/Ansari-Code-Alignment.pdf) TODO p14 32B->32bit/[bytes](https://stackoverflow.com/questions/5983389/how-to-align-stack-at-32-byte-boundary-in-gcc)(both align to 32bit but not 32 bytes)?
- there seems no related doc about 17h 60h model opcache implementation by "AMD doc "OpCache" site:amd.com". 
  [zen2 ~~implementation~~ opcache performance](https://chipsandcheese.com/2021/07/03/how-zen-2s-op-cache-affects-performance/) (TODO 'the Twitterverse',)
- [opcache Q&A][opcache] in intel, **amd** seems to not have many people knowing it.
  - As it says, it is mainly used in "(speculative) execution" and not store unnecessary things like `0x90 NOP`. 
    - kw: "doesn't try to populate the uop cache ... ", "has multiple jump entries", maybe "virtually addressed (VIVT)", "This is guesswork"
    - TODO `0xcc int3` may just use `0xcc` as one *mark*, see "replace the first byte ... without overwriting other instructions".
  - [MITE,LSD][LSD_DSB_MITE]
    - as paper p3 says "mis-prediction occurs" and "exceeds the limit", LSD will not be used (also see the figure).
    - [LSD_DSB_MITE] p3 also says " two threads mutually affects the micro-op decoding". So above Q&A says "decodes the same bytes two different ways.". This implicitly means "forces DSB evictions of micro-ops of the **first thread** to occur" as paper says (i.e. "can't cache both ways at the same time ... throw out the uop cache ways " in Q&A). <a id="thread_opcache"></a>
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
        - p13 "OC Microtag " is to **predict**. which is also said in [zen_2_Memory_Hierarchy] "predict the way where the instruction block".
          But [zen_2_Memory_Hierarchy] says "Bypassing the clock-gated fetch and **decode** units" while [opcache_patent] says "the OC data array is read and **decoded**". (Wrong)
            the latter says decode OC entry and get op,imme,uop,etc. But not decode the instruction.
      - tested with correction from `UNROLL * 8` to `UNROLL * 4`
        changing `BLOCK_DENOMINATOR`:
        ```bash
          $ cat /mnt/ubuntu/home/czg/csapp3e/debug/debug_block/quotient/sample_num_no_prefetch_l2_opcache_quotient.report 
          1:
          func dgemm_unrolled_avx256: 961, 464, 2.07112
          func dgemm_blocked_avx256: 1118, 633, 1.76619
          2:
          func dgemm_unrolled_avx256: 946, 462, 2.04762
          func dgemm_blocked_avx256: 1048, 584, 1.79452
          4:
          func dgemm_unrolled_avx256: 921, 436, 2.11239
          func dgemm_blocked_avx256: 1071, 402, 2.66418
          5:
          func dgemm_unrolled_avx256: 936, 542, 1.72694
          func dgemm_blocked_avx256: 943, 498, 1.89357
          10:
          func dgemm_unrolled_avx256: 905, 384, 2.35677
          func dgemm_blocked_avx256: 1009, 585, 1.72479
          20:
          func dgemm_unrolled_avx256: 963, 519, 1.85549
          func dgemm_blocked_avx256: 889, 708, 1.25565
          40:
          func dgemm_unrolled_avx256: 906, 461, 1.96529
          func dgemm_blocked_avx256: 858, 722, 1.18837
        ```
        - With respect to `dgemm_blocked_avx256`:
        from above, the peak is at `BLOCK_DENOMINATOR=4` where the block is `n/4`.
        So from [opcache_patent] fig3, when `BLOCK_DENOMINATOR=1/2` it may be too large, then the most inner loop can't be stored efficiently in opcache because the hot path has some `mov/add`,etc.,to change `k/r` .

        - Notice sometimes **`BLOCK_DENOMINATOR=1/2/4/5`** all may be also large, but `BLOCK_DENOMINATOR=40` quotient must be small because it **only run each nested loop once** and run the whole 4-level loop which must cause the opcache refreshed. So the hot path is 3-level loop instead of 1-level loop (i.e. the most inner loop). See intel [vtune](http://portal.nacad.ufrj.br/online/intel/vtune2017/help/GUID-143D1B76-D97F-454F-9B4B-91F2D791B66D.html) (more elegant [official][vtune_online]) <a id="4-level"></a>
          Then reread the [opcache], based on the above "run each nested loop once" and "caches uops that get decoded along the path of (speculative) execution" in the link, the speculative execution is probably not reused, although they are all not taken, but their tags are different.
          
          Moreover, if with more threads, it maybe can be worse. See the [figure](../debug/no_prefetch_l2_opcache.svg). But sometimes not.
          ```bash
          $ git rev-parse HEAD                                                                                
          375452b9ef5f84af09159e307597adc45f745d1e
          $ ./debug_block.sh
          ```
          Notice: from [this](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Individual_Core) opcache should be separately contained in the core same as L1 cache. Also [see](https://www.anandtech.com/show/10578/amd-zen-microarchitecture-dual-schedulers-micro-op-cache-memory-hierarchy-revealed) and [this where also says "don't think AMD/Intel generally disclose the size of uOps"](https://www.reddit.com/r/hardware/comments/12smvw9/comment/jh6918m/?utm_source=share&utm_medium=web2x&context=3) 
          ```bash
              # https://stackoverflow.com/questions/35071321/set-number-of-cores-in-openmp
          $ export OMP_PLACES="{0,1}"
          $ ./debug_block.sh # this will show that `dgemm_openmp_256` is a little lower than `dgemm_blocked_avx256` because cpu0-1 share L1 cache. see `7b1ff8da81e6bb59d69c60558e43326b04712d99` for svg view.
          $ git rev-parse HEAD
          7b1ff8da81e6bb59d69c60558e43326b04712d99
          $ env OMP_PLACES="{0:3}" ./debug_block.sh # this may be similar to above.
             # https://stackoverflow.com/questions/10856129/setting-an-environment-variable-before-a-command-in-bash-is-not-working-for-the
          $ OMP_PLACES="{0:3}" eval 'echo ${OMP_PLACES};. /mnt/ubuntu/home/czg/csapp3e/debug/debug_block.sh'
          $ env OMP_PLACES="{0:4}" ./debug_block.sh # this will make `dgemm_openmp_256` higher than `dgemm_blocked_avx256`
          ```

          TODO check 'div use up a whole way of the uop cache' influence in [opcache]

          Maybe have one *extra buffer for opcache* between it and the decoder 'IDK if there's some kind of buffering for non-branching uop fetch.'. The above buffer is "merge buffer" in "uop cache into some merge buffer.".
          - Also see intel vtune doc.
            From [this](https://www.intel.com/content/www/us/en/docs/vtune-profiler/user-guide/2023-0/cpu-metrics-reference.html#id-d33822e1302), [MS "microcode to implement ones that take **multiple** clock cycles to complete." ](https://en.wikipedia.org/wiki/Microsequencer#:~:text=In%20computer%20architecture%20and%20engineering,alone%20generator%20for%20address%20ranges.) switch may cause *more overheads then* DSB and MITE (i.e. the above `de_dis_uops_from_decoder` events)
            - microcode are *mostly* stored in [ROM](https://en.wikipedia.org/wiki/Microcode#Micro-operations). 
            - TODO: code *restrictions* for caching in the DSB
            - ["when two *reads map to the same bank*, we have a bank conflict."](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5ed3fe8b0f9332b03f4e61ea5f7a25a406c08ccb#:~:text=Thus%2C%20caches%20in%20processors%20are,we%20have%20a%20bank%20conflict.) -> so influence bandwidth because not all data transmit lines related with banks are used.
        2. Because as [perf_cache_misses] says, the **PMC counters** aren't accurately related with assembly codes, so it may be difficult to know opcache infomation with *each counter*. Then it may be not easy to give one *accurate* explanation to why the above decoder and opcache data show as they are.

        However, the **speed** is not same as the above trend (which is almost monotonically increasing). So maybe we can just ignore these two metrics.
        Maybe above only running 4-level loop once in each call decrease the loop dependency in some way and **no need to predict** the branch. So it is faster although the opcache is always refreshed. 
        ```bash
        # after running dgemm
        $ 
        $ cat debug_block_log/speed_etc.log
        BLOCK_DENOMINATOR: 1
                 dgemm_unrolled_avx256:  elapsed-time=     29333     speed-up=   12.2435
                  dgemm_blocked_avx256:  elapsed-time=     31841     speed-up=   11.2792
        BLOCK_DENOMINATOR: 2
                 dgemm_unrolled_avx256:  elapsed-time=     27729     speed-up=   13.5138
                  dgemm_blocked_avx256:  elapsed-time=     29398     speed-up=   12.7466
        BLOCK_DENOMINATOR: 4
                 dgemm_unrolled_avx256:  elapsed-time=     27758     speed-up=   13.2672
                  dgemm_blocked_avx256:  elapsed-time=     26863     speed-up=   13.7092
        BLOCK_DENOMINATOR: 5
                 dgemm_unrolled_avx256:  elapsed-time=     27299     speed-up=   14.4009
                  dgemm_blocked_avx256:  elapsed-time=     27655     speed-up=   14.2155
        BLOCK_DENOMINATOR: 10
                 dgemm_unrolled_avx256:  elapsed-time=     27401     speed-up=   13.8638
                  dgemm_blocked_avx256:  elapsed-time=     30401     speed-up=   12.4957
        BLOCK_DENOMINATOR: 20
                 dgemm_unrolled_avx256:  elapsed-time=     26033     speed-up=    13.958
                  dgemm_blocked_avx256:  elapsed-time=     23261     speed-up=   15.6214
        BLOCK_DENOMINATOR: 40
                 dgemm_unrolled_avx256:  elapsed-time=     25894     speed-up=   13.7683
                  dgemm_blocked_avx256:  elapsed-time=     22291     speed-up=   15.9937
        ```
      - instruction op list see Agner doc p102 with zen2.
        `lea    r10,[r9+rax*1]` -> 1 1-2
        `vfmadd231pd ymm1,ymm0,YMMWORD PTR [r12+rax*8]` -> v,v,v/m 1
        ...
        - in this blog about zen2, Mop can be guessed to be something like m(a/i)cro cache. It should be explicitly be [macro ops](https://community.arm.com/support-forums/f/architectures-and-processors-forum/48877/mops-macro-ops-uops-micro-ops)
      - based on [intel_SOM] which is referenced in [vtune_online]
        - p103 
          - "less than about 750 instructions" explains [this](#4-level)
          - "Decoded ICache *residency*" means whether [invalidate it](https://xem.github.io/minix86/manual/intel-x86-and-64-manual-vol3/o_fe12b1e2a880e0ce-430.html). It is related with hyper-threading because hyper-threading will change the context and may change virtual memory map which is related with CR3
            - Adaptive Mode: just not "competitively shared" (i.e. which may cause invalidation) when CR3 and [paging mode (similar riscv hugepage)](https://en.wikipedia.org/wiki/Intel_5-level_paging) are unchanged. <a id="hugepage"></a>
            - loop-fission is just the opposite of loop-unrolling. The former is to [achieve better utilization of *locality* of reference](https://en.wikipedia.org/wiki/Loop_fission_and_fusion) while the latter is to avoid too frequent branching.
            - "to about 1500 instructions." implies one opcache per core if two threads per core (this is the normal case). 
            - ~~"among two different 32-byte chunks"~~ "adding multiple byte NOPs" is used in the *above codes*
              ```bash
              $ git rev-parse HEAD                                                                                 
              634c69e2bb639ded35537635811024381aa7babc
              $ less -R /mnt/ubuntu/home/czg/csapp3e/debug/debug_annotate/no_prefetch_l2_opcache_10_annotated.report
                  #  in dgemm_basic_blocked
              4450:   test   edi,edi
              ...
              44cd:   nop    DWORD PTR [rax]
              44d0:   mov    edi,DWORD PTR [rbp-0x3c]
              $ ipython -c "0x44d0/32-0x4450/32"
              Out[1]: 4.0
              ```
              - 'Align the code' is also probably done by adding nop. See:
                ```bash
                $ gcc no_align.c -o no_align.o
                $ d2c "objdump -d no_align.o" "objdump -d align.o" | diffr
                +    1139:      0f 1f 80 00 00 00 00    nopl   0x0(%rax)
                ...
                +    1194:      66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
                +    119b:      00 00 00 00 
                +    119f:      90                      nop
                +
                +00000000000011a0 <add5>:
                +    11a0:      55                      push   %rbp
                $ ipython -c "0x11a0/16"
                Out[1]: 282.0
                ```
          - see this for jump table [without switch](https://godbolt.org/z/n6c3q6sPc) which use stack and `call` from [this](https://www.sanfoundry.com/c-tutorials-jump-tables/) 

            since the above codes not used "jump tables and switch declarations", so the nops used in the above codes are not related with them.
            But here "unconditional branches are too *dense*" and the following "Dense branches in a 32 byte aligned chunk," can explain why above `BLOCK_DENOMINATOR=40` is the worst.

            and this one with [switch](https://godbolt.org/z/1o7K8bczY) based on [this](https://stackoverflow.com/a/48033/21294350) where [`goto`](https://en.wikipedia.org/wiki/Branch_table#Other_uses_of_technique) is unconditional (if without something like `state++;`, just optimize by combining `case` and `goto` to one conditional jump.)
            [switch with break,etc](http://books.gigatux.nl/mirror/cinanutshell/0596006977/cinanut-CHP-6-SECT-5.html) implies [unconditional jump](https://godbolt.org/z/PKvEbbMh5).
            - [.zero](https://stackoverflow.com/questions/65641034/what-is-zero-in-gnu-gas#comment116055951_65641122)
            - TODO view detailedly how virtual table is [dynamic in 'learncpp'](https://www.learncpp.com/cpp-tutorial/the-virtual-table/) or [this](https://pabloariasal.github.io/2017/06/10/understanding-virtual-tables/)
              - here the Virtual Destructors are probably done by [`_Unwind_Resume`](https://refspecs.linuxfoundation.org/LSB_3.1.0/LSB-Core-S390/LSB-Core-S390/baselib--unwind-resume.html) because they are [same](https://godbolt.org/z/3zn9G8Eqz)
            - view virtual table in gdb `13.1`

              also can viewed by [compiler](https://stackoverflow.com/a/7678464/21294350)

              also see the vtbl [layout](https://en.wikipedia.org/wiki/Virtual_method_table#Example) 
              [link_1](https://stackoverflow.com/q/37213562/21294350): 1st on use; 2nd maybe too many if using causal `info variables .*p`; 3rd **useful**; 4th not convenient used in gdb script.
              [this](https://stackoverflow.com/a/7965579/21294350) is much better
              ```bash
              >>> p /a (*(void ***)p)[0]@10 # here `*` and `[]` derefereence two times. -> void*; this is similar to how to get the vtbl in the cpp code https://stackoverflow.com/a/5101754/21294350; 
              $7 = {[0x0] = 0x4012e0 <Derived::~Derived() at virtual_method.cpp:20>...
              # p -> vtable for Derived -> Derived::~Derived; so `void ***`; also see the following 
              >>> p p[0]
              $13 = (Derived) {
                <Base> = {
                  _vptr.Base = 0x402040 <vtable for Derived+16>
              ...
              >>> x (void*)p[0]
              0x402040 <vtable for Derived+16>:       0x4012e0 <Derived::~Derived() at virtual_method.cpp:20>
              # https://stackoverflow.com/a/63404160/21294350
              >>> ptype ((*(void **)p))
              type = void *
              ```
              - cpp ~~not~~ uses unconditional jump with `call` for virtual table. With [this code](../self_test/miscs_test/jump_table/virtual_method/virtual_method.cpp), `operator new` first return a `p` without `_vptr.Base` init. Then update `_vptr.Base` in `Derived::Derived(int)` (the vtbl addr is hardcoded, at least without `-O`).
                notice: [old 8085 processors](https://www.geeksforgeeks.org/branching-instructions-8085-microprocessor/) has conditional call (is substituted by [conditional jmp](https://godbolt.org/z/eWEdbWM83) in x86-64)
                ```bash
                  # here use `rbp` to save arg.
                $ g++ -fno-pic -no-pie -fno-pie virtual_method.cpp -o virtual_method_no_pie.o -g
                $ gdb virtual_method_no_pie.o -x debug.gdb
                   0x0000000000401287 <+9>:     mov    QWORD PTR [rbp-0x18],rdi # rdi is 1st param: ptr p,[rbp-0x18] stores `this`
                   0x000000000040128b <+13>:    mov    DWORD PTR [rbp-0x1c],esi
                   0x000000000040128e <+16>:    mov    rax,QWORD PTR [rbp-0x18] # the two lines just make `rax` -> `this`
                   0x0000000000401292 <+20>:    mov    rdi,rax
                   0x0000000000401295 <+23>:    call   0x401266 <Base::Base() at virtual_method.cpp:3>
                   0x000000000040129a <+28>:    mov    edx,0x402040
                   0x000000000040129f <+33>:    mov    rax,QWORD PTR [rbp-0x18]
                => 0x00000000004012a3 <+37>:    mov    QWORD PTR [rax],rdx  # store `0x402040` addr to `[rax]` (i.e. this[0])
                ...
                   0x00000000004012bd <+63>:    jmp    0x4012d9 <Derived::Derived(int)+91 at virtual_method.cpp:18>
                    ...
                   # use this to get to addr
                   0x00000000004011c0  main()+58 mov    rdx,QWORD PTR [rax]
                   0x00000000004011c3  main()+61 add    rdx,0x8
                   0x00000000004011c7  main()+65 mov    rdx,QWORD PTR [rdx]
                   0x00000000004011ca  main()+68 mov    rdi,rax
                   0x00000000004011cd  main()+71 call   rdx # call Derived::~Derived()
                $ gdb virtual_method_no_pie.o -x debug.gdb
                $ cat 
                disassemble /r *(long*)((void*)p[0]+0x8) # this implies " the entry for function2 points to D2::function2()." in above learncpp link.
                $ git rev-parse HEAD                                      
                6f3cf370460a4413ac1be0f0a33931e43bd76bec
                ```
                The above `ptr_uninit` is inited by compiler when `_start`.
          - ~~TODO why~~ unconditional branch *may* consume [five bytes](https://www.felixcloutier.com/x86/jmp) if displacement is one somewhat [too negative number](https://godbolt.org/z/eWEdbWM83).
          - here `only three` is probably based on one somewhat worst condition from "up to *seven* of them can be associated with a 32-byte chunk": think of the instruction in the branch is at least 5 bytes.
          - Here guess: probably opcache loads one small code block (i.e. 32 byte aligned chunk) at least every time loading by "prohibit *all* the micro-ops of the instructions in the chunk" and "the unconditional branches are too *dense* in each 32Byte-aligned chunk".
          - Conclusion: make sure "hot code block" *fit in* opcache by 1. spliting complex instruction (m1,i.e. method 1 in the doc) or loops (m0.2) 2. aligning by adding nop *outside* (m1.2,m2 "among the branches" but "not executed",m3 " are not part of hot code") or in the loop (m1.3) 3. change ordering (m3.) 4. limit unroll (m0.1) 5. tweak based on 1/2 threads running per core (m0.3).
          - see p88 for "Local impact",etc.,with "M impact, M generality" meaning. 
            - "Avoid putting explicit references to *ESP* in a sequence" may means above *virtual table method* should not use frequently the *stacks* which will increase the overheads because these functions are recommended to be small to *fit in* the opcache.
### `l2_cache_hits_from_l2_hwpf` (here is [L2 prefetch from L3](https://github.com/torvalds/linux/blob/06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5/tools/perf/pmu-events/arch/x86/amdzen2/recommended.json#L84C48-L84C52))
- most of time, it is equal to `l2_pf_miss_l2_hit_l3` means [prefetch][#miss_rate] always right.
- 
# perf miscs
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
- [lstopo](https://unix.stackexchange.com/questions/113544/interpret-the-output-of-lstopo) <a id="lstopo"></a>
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
- some perf lists may be disabled ["because of errata"](https://unix.stackexchange.com/questions/733053/unable-to-use-perf-to-find-l3-cache-miss-rate#comment1391228_733053)
  - also see [SKL150](https://lists.debian.org/debian-devel/2017/06/msg00308.html) which is seen from one blog.
- something not has one valid PMC counter may be due to that it is [software event](https://www.brendangregg.com/perf.html#SoftwareEvents) ([search](https://github.com/search?q=repo%3Atorvalds%2Flinux+0x0b+language%3Ajson+path%3Atools%2Fperf%2Fpmu-events%2Farch%2Fx86%2Famdzen2&type=code) of linux codes).
- the `[46.17%]` shown in `perf stat` is probably unused. See the source [codes](https://github1s.com/torvalds/linux/blob/master/tools/perf/util/stat-shadow.c#L688-L689).
  - `print_metric` is one func pointer, it may be [`script_print_metric`](https://github1s.com/torvalds/linux/blob/master/tools/perf/builtin-script.c#L2043-L2044) where the unit like `"%c/sec"` is output at last.
  - TODO see `perf_stat__print_shadow_stats_metricgroup`
- manual_1
  - Group leader by `{}`
  - `perf script -g python`.
  - `perf test`
  - ... TODO
- better use something like [`ocperf.py`](https://stackoverflow.com/questions/49027207/where-to-find-perf-event-document#comment85061775_49027207) to understand `perf`.
  - TODO how to read the [perf C source](https://stackoverflow.com/questions/49027207/where-to-find-perf-event-document#comment85061775_49027207), there seems to be [no zen2 counterpart](https://github.com/search?q=repo%3Atorvalds%2Flinux+zen2+path%3Aarch%2Fx86%2Fevents%2Famd%2F&type=code).
    - See [this](https://stackoverflow.com/questions/63653406/using-the-perf-events-from-perf-list-programatically)
## TODO
- Why does `l2_cache_accesses_from_dc_misses` not include `l2_request_g1.ls_rd_blk_c_s` in zen2, see [this](https://stackoverflow.com/questions/76646899) and also [this](https://unix.stackexchange.com/questions/750399)
  - "Read Shared Hit" can be also seen from [here p146](https://scholarworks.utrgv.edu/cgi/viewcontent.cgi?article=1307&context=etd) (it corresponds to shared if MESI) and also [related](https://www.gamedev.net/tutorials/_/technical/general-programming/cache-in-a-multi-core-environment-r4098/) with False Sharing
# awk miscs
Develop the habit of [#! /bin/awk -f](https://www.gnu.org/software/gawk/manual/html_node/Executable-Scripts.html) which is [shebang](https://stackoverflow.com/a/50144357/21294350)
Better read more [examples](https://sites.cs.ucsb.edu/~sherwood/awk/array2html.awk.txt) to get one scratch and how to use `awk`.
- [gnu doc](https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html) is similar to `info gawk`
- see [this](https://stackoverflow.com/a/15969962/21294350) to pass parameter.
- [matches](https://stackoverflow.com/questions/17001849/awk-partly-string-match-if-column-word-partly-matches): `($0 ~ func_list[Index])` and `(match($0,func_item) != 0)` both work to match regex substr. (can be see from `man`)/
  - notice not mistakenly **redirect** output and not knowing write the output.
- ~~in new gawk, not type "number" but "strnum" with `typeof()`~~ input num maybe `strnum` from `info`
  - [regexp type](https://stackoverflow.com/questions/46662790/how-to-check-the-type-of-an-awk-variable)
- [concatenation](https://stackoverflow.com/questions/11534173/how-to-use-awk-variables-in-regular-expressions) of str when using regex
- can [ignore the `-e`](https://unix.stackexchange.com/questions/46715/piping-from-grep-to-awk-not-working) to run script.
- use pipe to pass arg with [$0](https://stackoverflow.com/questions/59726081/pipe-command-output-into-awk)
- `-v`: as doc says, it should be only used in `BEGIN` to **init**. This may be not convenient to *directly* use it in main loop. But it is more explicit and more understandable from how codes should be written.
  - reading for different files [different parameters](https://unix.stackexchange.com/questions/503047/writing-an-awk-script-that-reads-variable-from-command-line)
  - more [ways](https://unix.stackexchange.com/questions/496869/how-to-assign-value-at-run-time-in-awk-command) related with bash
- `nawk` is [not same](https://www.gnu.org/software/gawk/manual/html_node/Scanning-an-Array.html) as `gawk`.
- [SYMTAB](https://unix.stackexchange.com/questions/549540/awk-how-to-use-a-variable-as-part-another-variables-name) like `ARGV`
- `-o` to [stdout](https://stackoverflow.com/questions/55745956/is-it-possible-to-pretty-print-awks-code)
- [different subs](https://opensource.com/article/19/11/how-regular-expressions-awk): `sub` -> first; `gsub` -> global (all); `gensub` select *group*.
- better use `print > ` [instead of `>` in command (also see the 2rd answer)](https://stackoverflow.com/a/14660111/21294350) 
- bash use ['\n' by `$''`](https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh) in str (zsh doesn't has this problem).
## notice
- notice not use `#` comments mistakenly inside the command when writing one multiple line bash command with `\`
- `FS = ","`: recommend not to change this because it's global
- `>` will only flush the file when first used in the awk script, but not flush after the first flush. (here flush means clearing the file).
- `for (i in array)` is not store array element in `i` but [store **index**](https://www.gnu.org/software/gawk/manual/html_node/For-Statement.html).
- not to be stuck in how to use something like `${i*2}` to select the field. After all, in assembly it probably just do `tmp=i*2,${tmp}`. The gnu dOC [doesn't offer one related example of this case](https://www.gnu.org/software/gawk/manual/html_node/Fields.html).
### use awk for simple manipulation.
- The following may be a little complex.
  - one [complex pipe](https://unix.stackexchange.com/questions/631947/read-full-pipe-input-from-awk). Maybe `echo` is enough for daily usage.
  - read from [file](https://www.gnu.org/software/gawk/manual/html_node/Readfile-Function.html) -> just passing filename from cmdline may be better.
- multiline [comments](https://stackoverflow.com/questions/11575210/multiline-comment-in-awk). 
  not comment no-use codes.
## TODO
- use [debugger](https://www.gnu.org/software/gawk/manual/html_node/Debugger-Invocation.html)
## cmds
- [extract str](https://stackoverflow.com/questions/72854794/how-to-extract-substring-in-the-double-quotes-by-using-awk-or-other-methods)
- print [single quote](https://unix.stackexchange.com/questions/593212/awk-print-apostrophe-single-quote)
- better use [bash variable with quotes](https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-bash-passing-variables-to-awk/) and feed to awk by `-v`, although offcinal shows using [escape](https://www.gnu.org/software/gawk/manual/html_node/Quoting.html)
- use `system` to call at least bash func.
## debug
- `(FILENAME=- FNR=1) fatal: division by zero attempted` may be not use quote with the path mistakenly.
# cmake miscs
- simple [overview](https://preshing.com/20170522/learn-cmakes-scripting-language-in-15-minutes/)
# ioputs_debug
```bash
$ git rev-parse HEAD 
93a5a9c9497b26121cc0e21deb35793229d262d3 # this commit has changed `snazzle.tab.c` and `lex.yy.c` which are used in debug.
$ cp ~/.gdbinit ~/.gdbinit.bk;cp ~/.gdbinit_py_orig.py ~/.gdbinit # pwndbg still can't use `rr` with `2f3438ddb245dfdcc8e1a65548f858966cb1011e`
$ cd /mnt/ubuntu/home/czg/csapp3e/bison_flex/bison # must change dir, because `FILE *myfile = fopen("a.snazzle.file", "r");` in `snazzle.y`
$ git rev-parse HEAD
06e04ff4fc958d5749f90fe7484688facc3bcd93
# use `2>&1` to redirect stderr to pipe
$ g++ -fno-omit-frame-pointer -fno-pie -no-pie -DYYDEBUG=1 snazzle.tab.c lex.yy.c -o main -g;./main 2>&1 | grep !
# show nothing

# then change to original weird code by uncommenting `ECHO;` in `lex.yy.c`
$ cat debug.gdb
# this where 'text' got outputed -> `printf("%s\n",test_str);` in 'snazzle.tab.c'
br *yyparse+2068
# catch when the 'stdout->_IO_write_end' was changed
watch *(char*)stdout->_IO_write_end!='!'
disable 2
c
enable 2
awd stdout->_IO_write_end
rc
$ g++ -fno-omit-frame-pointer -fno-pie -no-pie -DYYDEBUG=1 snazzle.tab.c lex.yy.c -o main -g;rr record ./main
/mnt/ubuntu/home/czg/csapp3e/bison_flex/bison $ rr replay # use gdb dashboard; use `rr replay -x debug.gdb` the running order is unexpected.
>>> source ./debug.gdb
...
─── Stack ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
[0] from 0x00007f85b887fb54 in __memcpy_avx_unaligned_erms+84 at ../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S:325
[1] from 0x00007f85b87a7e0c in _IO_new_file_xsputn+54 at fileops.c:1235
[2] from 0x00007f85b87a7e0c in _IO_new_file_xsputn+92 at fileops.c:1196
[3] from 0x00007f85b879c279 in __GI__IO_fwrite+201 at /usr/src/debug/glibc/glibc/libio/libioP.h:946
[4] from 0x00000000004026e6 in yylex()+801 at /mnt/ubuntu/home/czg/csapp3e/bison_flex/bison/snazzle.l:27
# here snazzle.l:27 -> showed where stdout end changed.
$ grep "27 " -r *.c -A 2
lex.yy.c:#line 27 "snazzle.l"
lex.yy.c-ECHO; # this is the significant location
lex.yy.c-// ;
--
```
- the above `#line` is to [change](https://learn.microsoft.com/en-us/cpp/preprocessor/hash-line-directive-c-cpp?view=msvc-170) `__LINE__` etc.,macro
- FILE may be can be known more by reading [`man fcntl`](https://stackoverflow.com/questions/29731672/getting-the-file-mode-from-the-file-struct)
- how to debug the above codes
  - view the same version glic [codes](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/libioP.h#L519) as [`ldd -v`](https://iq.opengenus.org/find-glibc-version/#:~:text=Method%201%3A%20Use%20ldd,-Use%20the%20following&text=The%20output%20will%20give%20the,2020%20Free%20Software%20Foundation%2C%20Inc.) used.
- Also see [log](../bison_flex/bison/debug_symbol_puts.log) (Just reverse running to see how data passed to `write`).
## _IO_fwrite
- gdb has limited number of breakpoints.
- above [_IO_fwrite](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/iofwrite.c#L35-L36) mainly `written = _IO_sputn (fp, (const char *) buf, request);`
  - [_IO_sputn](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/libioP.h#L177-L178) is `#define _IO_XSPUTN(FP, DATA, N) JUMP2 (__xsputn, FP, DATA, N)` (better view the gdb stack with **debuginfod**)
    - Or just see [**codebrowser**](https://codebrowser.dev/glibc/glibc/libio/iofwrite.c.html#39) which can expand all define (linux source codes always use `#define` to avoid too many calls).
    - see this for detailed infos about `_IO_new_file_xsputn`
      - So this func will **not always flush** the output. This is why `ioputs` use [_IO_putc_unlocked](https://codebrowser.dev/glibc/glibc/libio/ioputs.c.html#41) then which is also said in `man 3 puts` "puts() writes the string s and a trailing newline to stdout.". Also [see](#_IO_new_file_xsputn)
      - here [`f->_IO_write_ptr = __mempcpy (f->_IO_write_ptr, s, count);`](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/fileops.c#L1235-L1236) is what `man fwrite` "The file position indicator for the stream is *advanced* by the number of bytes successfully read or written." means. <a id="_IO_write_ptr"></a>
      - real write generates when [_IO_do_write (f, f->_IO_write_base,f->_IO_write_ptr - f->_IO_write_base)](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/fileops.c#L783-L784) with `awd stdout->_IO_write_end` to get this.
        ```bash
        ─── Stack ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
        [0] from 0x00007f85b87a6bea in new_do_write+170 at fileops.c:456
        [1] from 0x00007f85b87a8859 in _IO_new_do_write+25 at fileops.c:425
        [2] from 0x00007f85b87a8cf3 in _IO_new_file_overflow+259 at fileops.c:783
        [3] from 0x00007f85b879d5ba in __GI__IO_puts+506 at ioputs.c:41
        [4] from 0x0000000000401dd2 in yyparse()+2076 at /mnt/ubuntu/home/czg/csapp3e/bison_flex/bison/snazzle.y:62
        ```
        normally, the `_IO_write_...` should be same. But with `fwrite` changing `_IO_write_ptr` maybe, it is [not the case](#_IO_write_ptr).
        ```bash
        ─── Expressions ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
        stdout->_IO_write_base = 0x5f6540 "bison found a string: is\nt\n\n": 0x62
        stdout->_IO_write_end = 0x5f6540 "bison found a string: is\nt\n\n": 0x62
        stdout->_IO_write_ptr = 0x5f6540 "bison found a string: is\nt\n\n": 0x62
        ```
  - [`_IO_fwide (stdout, -1) == -1`](https://codebrowser.dev/glibc/glibc/libio/ioputs.c.html#39): see `man fwide`
    - See [this](https://learn.microsoft.com/en-us/cpp/c-runtime-library/byte-and-wide-streams?view=msvc-170),"wide-character oriented" just means something like utf, "byte oriented" just means ascii.
    - notice [here link_1](https://codebrowser.dev/glibc/glibc/libio/libio.h.html#253) not use nested macro, but use [`_IO_fwide` func](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/iofwide.c#L46)
      - better see [bootlin](https://elixir.bootlin.com/glibc/glibc-2.29/C/ident/_IO_fwide) which tells where is prototype and function, etc.
      - ~~from the link_1, ~~
      - it controls [whether `f->_IO_write_end = f->_IO_write_ptr;`](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/fileops.c#L772-L773) which is called in `_IO_new_file_overflow` (It may be not runned by some optimization. See the following) <a id="overflow"></a>
        ```bash
        $ 
        => 0x00007f85b87a8c13 <_IO_new_file_overflow+35>:       0f 84 67 01 00 00       je     0x7f85b87a8d80 <_IO_new_file_overflow+400 at fileops.c:744>
        0x00007f85b87a8c19 <_IO_new_file_overflow+41>:       48 8b 57 28             mov    rdx,QWORD PTR [rdi+0x28]
        0x00007f85b87a8c1d <_IO_new_file_overflow+45>:       83 fd ff                cmp    ebp,0xffffffff
        0x00007f85b87a8c20 <_IO_new_file_overflow+48>:       0f 84 a2 00 00 00       je     0x7f85b87a8cc8 <_IO_new_file_overflow+216 at fileops.c:775>
        ...
        0x00007f85b87a8cc8 <_IO_new_file_overflow+216>:      48 8b 73 20             mov    rsi,QWORD PTR [rbx+0x20]
        0x00007f85b87a8ccc <_IO_new_file_overflow+220>:      48 89 df                mov    rdi,rbx
        0x00007f85b87a8ccf <_IO_new_file_overflow+223>:      5b                      pop    rbx
        0x00007f85b87a8cd0 <_IO_new_file_overflow+224>:      5d                      pop    rbp
        0x00007f85b87a8cd1 <_IO_new_file_overflow+225>:      41 5c                   pop    r12
        0x00007f85b87a8cd3 <_IO_new_file_overflow+227>:      48 29 f2                sub    rdx,rsi
        0x00007f85b87a8cd6 <_IO_new_file_overflow+230>:      e9 65 fb ff ff          jmp    0x7f85b87a8840 <_IO_new_do_write at fileops.c:423>
        ```
        the above code just corresponds to [(f->_flags & _IO_CURRENTLY_PUTTING) == 0 || f->_IO_write_base == NULL](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/fileops.c#L739-L740) (with `stdout`,this should be false because stdout probably used to write out to something like the terminal and by [man setvbuf](https://stackoverflow.com/questions/61842165), stdout "(as stdout normally does), it is *line buffered*.")
        here [EOF -> -1](https://stackoverflow.com/questions/1782080/what-is-eof-in-the-c-programming-language)

## _IO_puts
- [_IO_new_file_xsputn](https://github1s.com/bminor/glibc/blob/glibc-2.37/libio/fileops.c#L1196)
  - here `if (to_do + must_flush > 0)` is probably zero because no ` if (*--p == '\n')` (because data probably has no trailing '\n'. Then `must_flush` is 0) and `to_do` is also 0 because `f->_IO_write_ptr = __mempcpy (f->_IO_write_ptr, s, count);` probably succeeds. <a id="_IO_new_file_xsputn"></a>
  - So above `_IO_fwrite` not flush.
- [`(__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) ('\n'))`](https://codebrowser.dev/glibc/glibc/libio/ioputs.c.html#41) shows why the original `ECHO` causing "`_IO_write_ptr` > `_IO_write_end`" will cause output *more* than the input parameter of `puts`(here `__overflow` will call [`_IO_new_file_overflow`](#overflow)). Also [see](#__builtin_expect)
```bash
$ git rev-parse HEAD
27aeba06225cc5e6b8ac730dae666386d2948121
$ rr replay
>>> source ./debug_puts_no_dive_in.gdb
...
stdout->_IO_write_ptr = 0x5f6541 "et str text copyed to text\n": 0x65
stdout->_IO_write_end = 0x5f6540 "!et str text copyed to text\n": 0x21

$ rr replay
>>> source ./debug_puts.gdb
─── Expressions ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
stdout->_IO_buf_end = 0x5f6940 "": 0x0
stdout->_flags = 0xfbad2a84
stdout->_IO_write_base = 0x5f6540 "!texttr text copyed to text\n": 0x21
stdout->_IO_write_ptr = 0x5f6545 "tr text copyed to text\n": 0x74
stdout->_IO_read_ptr = 0x5f6540 "!texttr text copyed to text\n": 0x21
stdout->_mode = 0xffffffff
stdout->_IO_write_end = 0x5f6540 "!texttr text copyed to text\n": 0x21
# view the most original write to `stdout->_IO_write_ptr` with '!'
$ git rev-parse HEAD                                                                                 
1f3ca96356b0c8fdf95b935bc375808c6bde2ef4
$ rr replay
>>> source ./debug.gdb
─── Expressions ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
stdout->_IO_write_end = 0x5f6540 "!et str text copyed to text\n": 0x21
stdout->_IO_write_base = 0x5f6540 "!et str text copyed to text\n": 0x21
stdout->_IO_write_ptr = 0x5f6541 "et str text copyed to text\n": 0x65
```
## TODO learn more about [endl](https://stackoverflow.com/questions/213907/stdendl-vs-n) after learning *c++ primer*.
## miscs
- [`a[-1]`](https://stackoverflow.com/questions/9861713/does-array-1-give-the-last-element-in-the-array#:~:text=If%20you%20are%20referring%20to,last%20element%20of%20the%20array.) in array index just means `*(a-1)` (notice pointer expression default with reference size, i.e. if a is `int *`, then `a-1` -> `a-sizeof(int)`.)
- new `rr` may not be use passing multiple parameters at one time `rr replay -o -nx -iex "source ~/.gdbinit_py_orig.py"`. Need something like `rr replay -o '-nx' -o '-ix=~/.gdbinit_py_orig.py'`.
```bash
$ rr replay -o '-nx -ix=~/.gdbinit_py_orig.py'       
gdb: unrecognized option '-nx -ix=~/.gdbinit_py_orig.py'
$ gdb -nx -ix=~/.gdbinit_py_orig.py
  File "/home/czg/.gdbinit_py_orig.py", line 2332
    source ~/gdb_scripts/func.gdb
           ^
SyntaxError: invalid syntax
# not use gdb syntax in `.py`. gdb may just think of it as python script instead of gdb because of the suffix.
$ mv ~/.gdbinit_py_orig.py ~/.gdbinit_py_orig.gdb
$ gdb -nx -ix=~/.gdbinit_py_orig.gdb
>>> 
```
# Operating Systems
## textbook selection
see [this](https://www.zhihu.com/question/27871198) (maybe [this](https://www.cnblogs.com/cxuanBlog/p/13320810.html)), [this](https://www.reddit.com/r/compsci/comments/1wazdm/looking_for_a_good_book_on_operating_systems/) , 
- "Operating Systems by Deitel, and Choffnes edu" -> not many universities use it.
- OSTEP recommended by [learn_self], free [chapters](https://pages.cs.wisc.edu/~remzi/OSTEP/#book-chapters) or [combination v1.00](http://diliev.com/Home/applications/Library/Programing%20Books/OS/Operating_Systems_Three_Easy_Pieces_by_R.pdf)
  Notice it not recommends the "Operating System Concepts (the *“Dinosaur* book”) and Modern Operating Systems are the “classic” books on operating systems"

  Also it not recommends "CLRS and Sedgewick" because of "proof-heavy".
- ["Operating System Concepts edu"](https://os-book.com/OS10/index.html) nothing
  This [edu](https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/index.html) use it.
- "Tanenbaum's Modern Operating Systems book and Operating System Concepts " may be [similar](https://www.quora.com/What-are-the-essential-differences-between-Tanenbaums-Modern-Operating-Systems-book-and-Operating-System-Concepts-the-dinosaur-book).
  The author Andrew S. Tanenbaum writes *MINIX*
  Tanenbaum used by [this](http://www.cs.columbia.edu/~nieh/teaching/w4118_f03/)
- ["operating system Tom Anderson"](https://ospp.cs.washington.edu/) has too many volumes.
- better to view [the codes](https://www.zhihu.com/question/27871198/answer/1821996217).
  
# Algorithms and Data Structures
- ["solving around 100 random leetcode"](https://teachyourselfcs.com/#algorithms)
## Discrete Mathematics 
- see [1](https://qr.ae/pyWj8a) or [2](https://qr.ae/pyWjGR).
  Also [math stackexchange](https://math.stackexchange.com/questions/1533/what-is-the-best-book-for-studying-discrete-mathematics) (ignore the [1st ans](https://math.stackexchange.com/questions/1533/what-is-the-best-book-for-studying-discrete-mathematics#comment2598012_1535))
- 黑皮书 使用 
  1. ["Discrete Mathematics and its Applications"](https://www.suning.com/item/0071487071/12406300968.html) as this [edu](https://www.engineeringonline.ncsu.edu/course/csc-226-discrete-mathematics-for-computer-scientists/)
  2. ["Discrete Mathematics for Computer Scientists"](https://item.jd.com/10037867743124.html) which is [1st](https://www.amazon.com/Discrete-Mathematics-Computer-Scientists-Cliff/dp/0132122715) edition.
- Or try [this](https://csci.williams.edu/discrete-mathematics-preparation/)
# C++
- not to read c++ primer plus both [1](https://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list) and [2](https://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list), [3](https://qr.ae/pyWjiD)

# computer graphic
## tutorial
- [3dgep](https://www.3dgep.com/category/math/)
- [GPGPU](https://web.archive.org/web/20120229133252/http://www.gpgpu.org/wiki/FAQ#Where_can_I_learn_about_OpenGL_and_Direct3D.3F) from [this](https://stackoverflow.com/questions/5709023/what-exactly-is-a-floating-point-texture)
- [unity](https://shadowmint.gitbooks.io/unity-material-shaders/content/support/syntax/lerp.html)
### Cg
- [1](https://developer.download.nvidia.com/CgTutorial/cg_tutorial_chapter03.html)
### CUDA
- [error checking](https://leimao.github.io/blog/Proper-CUDA-Error-Checking/) from [this](https://forums.developer.nvidia.com/t/maximum-number-of-threads-on-thread-block/46392/2)
- [optimization](https://stackoverflow.com/a/19041467/21294350)
  it also says about SASS which is "PTX will be compiled into device assembly code, called SASS"

  it also reference [this](https://stackoverflow.com/questions/12388207/interpreting-the-verbose-output-of-ptxas-part-i) which says about "register spilling" and "Constant memory".
# CUDA here I use `12.2` version
[GPU_list] and compatibility like `compute_xx` comparison
```bash
$ nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Tue_Jun_13_19:16:58_PDT_2023
Cuda compilation tools, release 12.2, V12.2.91
Build cuda_12.2.r12.2/compiler.32965470_0
```
- check infos by `/opt/cuda/extras/demo_suite/deviceQuery` or by [table](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compute-capabilities) referenced in [this](https://stackoverflow.com/a/72075628/21294350)
- docs see [Exercises](https://developer.nvidia.com/blog/even-easier-introduction-cuda/)
## `cuobjdump`
[doc](https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html?highlight=ptx#) with other binary utilities
- output [interpretation](https://stackoverflow.com/a/57851949/21294350).
- use [`cuobjdump -sass`](https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html#usage)
### `nvdisasm`
- TODO inline in [`nvdisasm -gi`](https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html#nvdisasm) [usage by `nvcc -gencode arch=compute_75,code=sm_75 single_loop.cu --cubin`](https://forums.developer.nvidia.com/t/nvdisasm-says-binary-is-not-a-supported-elf-file/238918/2)
## `SASS` and `PTX` *scalar* instructions
- better read [`PTX`](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#extended-precision-arithmetic-instructions-mad-cc) (or [pdf][PTX]) [then](https://stackoverflow.com/a/35055749/21294350) `SASS`
  - `c[0x0][0x24]` -> [constant](https://forums.developer.nvidia.com/t/the-meaning-of-cuda-disassemly/60924/3) mem bank
  - default var at the 1st pos is *dst*.
- `SASS` [ISA](https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html?highlight=ISETP#turing-instruction-set)
  - [uniform register](https://forums.developer.nvidia.com/t/whats-uniform-register-in-turing/65406/2) is to not corrupt the *floating* data path.
- from [COD_RISCV_2nd_A_appendix] B-31 "different binary microinstruction formats", it implies why SASS less documented than `PTX` because `PTX` is more *portable* similar to the high-level language.
### PTX detailed see [doc][PTX]
- `ftz` -> flush to zero
## miscs
- why use [scalar processor "takes up more space than a scalar unit ... not be fully used ... equiring more chip area for the instruction *decoder*"](https://forums.developer.nvidia.com/t/why-scalar-processors/10337/2) -> to improve *hardware* design and increase parallel. <a id="scalar_unit_gpu"></a>
### `nsight-graphics`
- comment `install -Dm644 "${srcdir}/${pkgname}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop ...` two lines based on [this](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nsight-graphics)
  Then run `makepkg -si --skipinteg` (Just use `yay -Rsn` to uninstall).
  See [modified PKGBUILD](../CUDA/nsight-graphics/PKGBUILD)
## optimization
- CUDA [occupancy](https://forums.developer.nvidia.com/t/does-cuda-run-more-threads-than-physical-threads-transparently/261485/5?u=czgf2v) tested with [Occupancy Calculator "Launching from the Profiler Report"](https://docs.nvidia.com/nsight-compute/NsightCompute/index.html#occupancy-calculator)
  [definition](https://docs.nvidia.com/gameworks/content/developertools/desktop/analysis/report/cudaexperiments/kernellevel/achievedoccupancy.htm): "the ratio of active warps on an SM ..."
  - [installation](https://aur.archlinux.org/packages/nsight-graphics#comment-927000) of nsight_compute
    Then launch Nsight Compute which is part of [nvtx](https://docs.nvidia.com/gameworks/index.html#gameworkslibrary/nvtx/nvidia_tools_extension_library_nvtx.htm) `/opt/cuda/nsight_compute/ncu-ui` connect -> profile. See `cudaSaxpy.report.ncu-rep` file.
    - Also see "Higher occupancy *does not always result* in higher performance, however, low occupancy always reduces the ability to hide latencies, resulting in overall performance degradation" in the `ncu-ui`.
### Nsight Compute
- show [`SASS`](https://forums.developer.nvidia.com/t/how-to-see-ptx-cu-source-code/220043/2?u=czgf2v) by `nvcc async.cu -g --generate-line-info`.
## API
- [doc](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1ge37112fc1ac88d0f6bab7a945e48760a)
- [extended API](https://nvidia.github.io/libcudacxx/extended_api/thread_groups.html) with `ThreadGroup`
## `cuda-gdb`
- need to be in kernel to view the [GPU assembly codes](https://developer.download.nvidia.com/GTC/PDF/1062_Satoor.pdf).
```bash
$ cuda-gdb a.out -ex "start" -ex "br kernel" -ex "c" -ex "disass"
Dump of assembler code for function _Z6kernelPfi:
   0x00007fffe3e34200 <+0>:     MOV R1, c[0x0][0x28] 
   0x00007fffe3e34210 <+16>:    MOV R2, RZ 
   0x00007fffe3e34220 <+32>:    LDC.64 R2, c[0x0][R2+0x160] 
   0x00007fffe3e34230 <+48>:    MOV R16, R2 
   0x00007fffe3e34240 <+64>:    MOV R2, R3 
   0x00007fffe3e34250 <+80>:    MOV R16, R16 
   0x00007fffe3e34260 <+96>:    MOV R2, R2 
   0x00007fffe3e34270 <+112>:   MOV R0, 0x8 
   0x00007fffe3e34280 <+128>:   LDC R0, c[0x0][R0+0x160] 
   0x00007fffe3e34290 <+144>:   MOV R0, R0 
   0x00007fffe3e342a0 <+160>:   MOV R16, R16 
   0x00007fffe3e342b0 <+176>:   MOV R2, R2 
   0x00007fffe3e342c0 <+192>:   MOV R0, R0 
=> 0x00007fffe3e342d0 <+208>:   S2R R3, SR_TID.X
```
## `nvcc`
[doc](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#cuda-compilation-trajectory__cuda-compilation-from-cu-to-executable)
- how to generate the `ptx` shown with `cuobjdump -ptx main`, [See](https://forums.developer.nvidia.com/t/ptx-is-not-embedded-in-the-binary/201858) -> must have [`compute_50` SO answer](https://stackoverflow.com/a/47909204/21294350) (this question has been asked [many times][gencode_mul_refs] in SO) with `-code` to generate `ptx` and `sm_50` to generate `sass`.
  This can also be seen from the [official doc](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-architecture-arch-native-all-all-major-arch).
  > 4.2.7.2. --gpu-code code,... (-code)
  > Specify the name of the NVIDIA GPU to assemble and *optimize PTX for*.
  > nvcc *embeds a compiled code image* in the resulting executable for each specified code architecture, which is a *true binary load image* for each real architecture (such as sm_50), and *PTX code* for the virtual architecture (such as compute_50).
  This means `--gpu-code` means what to *generate* from `PTX`.
  > During runtime, such embedded PTX code is dynamically compiled by the CUDA runtime system if *no binary* load image is found for the current GPU.
  `PTX` may be used in [JIT](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#just-in-time-compilation).
  > For instance, --gpu-architecture=compute_60 is not *compatible* with --gpu-code=sm_52, because the earlier compilation stages will *assume* the availability of compute_60 features that are not present on sm_52.
  Here `PTX` is mainly to support higher *real architecture* just as above SO says.

  `--gpu-architecture` can
  1. not shorthand
    > must be a virtual architecture ... Normally, this option alone does *not trigger assembly* of the generated PTX for a real architecture (that is the role of nvcc option --gpu-code, see below); rather, its purpose is to control *preprocessing* and compilation of *the input to PTX*.
  2. shorthand
    > If no value for option --gpu-code is specified, then the value of this option defaults to the value of --gpu-architecture. ... the value specified for --gpu-architecture *may be a real* architecture (such as a sm_50)
    This implies *real architecture* implies virtual but not vice versa.
    > For example, nvcc --gpu-architecture=sm_50 is equivalent to nvcc --gpu-architecture=compute_50                                        --gpu-code=sm_50,compute_50.
    Notice: So `--gpu-architecture=sm_50` may be better if only targetted to one ~~machine~~ GPU.
  > -arch=native ... *no PTX* program will be generated for this option.
  > for all supported *major* versions (sm_*0)

  - Above means same as [this](https://stackoverflow.com/a/17599585/21294350)
    > The *virtual* architecture (e.g. compute_20, whatever is specified by -arch compute...) determines what type of *PTX* code will be generated. The additional switches (e.g. -code sm_21) determine what type of SASS code will be *generated*. SASS is actually executable object code for a GPU (machine language). An executable can *contain multiple versions of SASS and/or PTX*, and there is a *runtime loader* mechanism that will pick appropriate versions based on the GPU actually being used.

    These 2 steps can be seen more intuitively [here](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architectures). 
    Also see [gencode_mul_refs] "then yes, it means that: ... ".
    - > The cuobjdump tool can be used to *identify what components exactly are in* a given binary.

  > This option provides a generalization of the --gpu-architecture=arch --gpu-code=code,... option *combination* for specifying nvcc behavior with respect to code generation.
  > Where use of the previous options generates code for *different real* architectures with the PTX for the *same virtual* architecture, option --generate-code allows *multiple* PTX generations for *different virtual* architectures.
  > --generate-code options may be *repeated for different virtual* architectures.
  `generate-code` is mainly to generate more *groups* of virtual and real architectures.
  
  - old version can use [`cubin`](https://stackoverflow.com/a/65499046/21294350)
# How to read papers
- see [this](https://www.scientifica.uk.com/neurowire/gradhacks-a-guide-to-reading-research-papers)
  kw: 8. Write a succinct ... ; 4. Identify how this paper fits ; 2. *Skim all* of the sections ; 1. Check the publish date ; 2. Read *critically*

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
    - [COD_RISC_V_Orig]
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
<!-- wikipedia -->
[Sequential_consistency]:https://en.wikipedia.org/wiki/Consistency_model#Sequential_consistency
[Wl_1]:https://en.wikipedia.org/wiki/Causal_consistency#cite_note-10
[Cache_Consistency_def]:https://en.wikipedia.org/wiki/Cache_coherence#Definition
[CHS]:https://en.wikipedia.org/wiki/Logical_block_addressing#CHS_conversion
[dec_64]:https://en.wikipedia.org/wiki/Decimal64_floating-point_format#cite_note-ISO-60559_2011-2
[dec_32]:https://en.wikipedia.org/wiki/Decimal32_floating-point_format#Representation_of_decimal32_values
[binary32]:https://en.wikipedia.org/wiki/Single-precision_floating-point_format#IEEE_754_standard:_binary32
[pipeline_scheduling]:https://en.wikipedia.org/wiki/Instruction_scheduling
[bisection_wikipedia]:https://en.wikipedia.org/wiki/Bisection_bandwidth#:~:text=Bisection%20bandwidth%20gives%20the%20true,better%20than%20any%20other%20metric.
[SIMD_category]:https://en.wikipedia.org/wiki/Flynn%27s_taxonomy#Single_instruction_stream,_multiple_data_streams_(SIMD)
[PLD_FPGA]:https://en.wikipedia.org/wiki/Programmable_logic_device#FPGAs
[SOP]:https://en.wikipedia.org/wiki/Canonical_normal_form
[Classical_D_flip_flop]:https://en.wikipedia.org/wiki/File:Edge_triggered_D_flip_flop.svg
[latch_flip_flops_diff]:https://en.wikipedia.org/wiki/Flip-flop_(electronics)#Implementation
[Gated_D_latch]:https://en.wikipedia.org/wiki/Flip-flop_(electronics)#Gated_D_latch
[hamming_table]:https://en.wikipedia.org/wiki/Hamming_code#General_algorithm

<!-- blog -->

[aquamentus_flex_bison]:https://aquamentus.com/flex_bison.html
[utmel_EPROM]:https://www.utmel.com/blog/categories/memory%20chip/introduction-to-eprom-and-eeprom

[Memory_Barriers]:https://preshing.com/20120710/memory-barriers-are-like-source-control-operations/
[Weak_vs_Strong_Memory_Models]:https://preshing.com/20120930/weak-vs-strong-memory-models/
[ac_rel]:https://preshing.com/20120913/acquire-and-release-semantics/

<!-- tutorialspoint -->
[hamming_tutorialspoint]:https://www.tutorialspoint.com/hamming-code-for-single-error-correction-double-error-detection

---

[sequential_consistency]:https://spcl.inf.ethz.ch/Teaching/2017-dphpc/assignments/sequential_consistency_sol.pdf
[Similarity_TSO_IBM_370]:https://en.wikipedia.org/wiki/Processor_consistency#Similarity_to_SPARC_V8_TSO,_IBM-370,_and_x86-TSO_Memory_Models
<!-- class lecture -->
[sc_tso_cis601]:https://www.cis.upenn.edu/~devietti/classes/cis601-spring2016/sc_tso.pdf
[cs61_07]:https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture7.pdf
[register_allocation_18]:../references/lecture/w14_01-register-allocation_18.pdf
[truth_table]:https://cseweb.ucsd.edu/classes/su06/cse141/slides/s06-1cyc_control-1up.pdf
[fp_multi_cycle]:http://ece-research.unm.edu/jimp/611/slides/chap3_6.html

[PC_orig]:../references/other_resources/COD/references/memory_consistency/TR1006_PC_orig.pdf
[lec_17]:http://www.cs.cmu.edu/afs/cs/academic/class/15418-s11/public/lectures/lect17.pdf
[SC_orig]:https://www.microsoft.com/en-us/research/uploads/prod/2016/12/How-to-Make-a-Multiprocessor-Computer-That-Correctly-Executes-Multiprocess-Programs.pdf
<!-- [MEMORY_CONSISTENCY_DETAILED]:https://typeset.io/pdf/memory-consistency-models-for-shared-memory-multiprocessors-3fuice3vg8.pdf -->
[MEMORY_CONSISTENCY_DETAILED]:../references/other_resources/COD/references/memory-consistency-models-for-shared-memory-multiprocessors-3fuice3vg8.pdf
[sparcv9]:../references/other_resources/COD/references/sparcv9.pdf
[TSO_PC_PSO]:http://15418.courses.cs.cmu.edu/spring2013/article/41#:~:text=Partial%20Store%20Ordering%20(PSO)%20is,be%20in%20order%20at%20all.
[stanford_149_09_consistency]:https://gfxcourses.stanford.edu/cs149/winter19content/lectures/09_consistency/09_consistency_slides.pdf
[isca90_GLL_90]:../references/other_resources/COD/references/gharachorloo.isca90.pdf

<!-- wikipedia referenced books -->
[Scalable_Shared_Memory_Multiprocessors_libgen]:../references/other_resources/COD/references/Scalable_Shared_Memory_Multiprocessors_libgen.pdf
[muller2010]:../references/other_resources/COD/references/books/muller2010.pdf

<!-- riscv book -->
[RISC_V_Custom_OCR]:../references/other_resources/COD/COD_RISCV_OCR.pdf
[COD_RISC_V_Orig]:../references/other_resources/COD/Computer_Organization_RiscV_Edition.pdf
<!-- https://dokumen.pub/computer-organization-and-design-risc-v-edition-the-hardware-software-interface-2nbsped-0128203315-9780128203316.html -->
[COD_RISC_V_2nd]:../references/other_resources/COD/COD_RISCV_2nd.pdf
[COD_RISCV_2nd_A_appendix]:../references/other_resources/COD/COD_RISCV_2nd_A_appendix.pdf
[COD_RISC_V_2nd_companion]:https://www.elsevier.com/books-and-journals/book-companion/9780128203316
[RISC_V_Custom]:../references/other_resources/COD/COD_RISCV.pdf
[CAAQA_companion]:https://www.elsevier.com/books-and-journals/book-companion/9780128119051
[COD_RISC_V_Orig_companion]:https://www.elsevier.com/books-and-journals/book-companion/9780128122754/advanced-content-and-appendices#Advanced%20Content
[MIPS_COD]:../references/other_resources/COD/MIPS/dokumen.pub_computer-organization-and-design-mips-edition-the-hardware-software-interface-6nbsped-9780128226742.pdf
[chap_1_13]:../references/other_resources/COD/online_resources/Ch01_e1.pdf
[chap_2_24]:../references/other_resources/COD/online_resources/Ch02_e2.pdf
[openmp_ref]:../references/other_resources/COD/references/openmp/OpenMPRefCard-5-2-web.pdf
[openmp_example]:../references/other_resources/COD/references/openmp/openmp-examples-5.2.1.pdf
[omp_greeencard_3_0]:https://www.openmp.org/wp-content/uploads/OpenMP3.0-SummarySpec.pdf
[omp_Tutorial]:https://www.openmp.org/resources/tutorials-articles/
[MapReduce]:../references/other_resources/COD/references/miscs/MapReduce.pdf
[TPU_3]:../references/other_resources/COD/references/papers/jouppi2020_TPUv3.pdf
[Amdahl_1967]:../references/other_resources/COD/references/papers/Amdahl-1967.pdf
[hill2020]:../references/other_resources/COD/references/papers/hill2020_spectre.pdf
[FLUSH_RELOAD]:../references/other_resources/COD/references/papers/FLUSH_RELOAD.pdf
[bouknight1972]:../references/other_resources/COD/references/papers/bouknight1972.pdf
[via_analysis_VI_interface]:../references/other_resources/COD/references/papers/via-analysis_VI_interface.pdf
[Asanovic]:../references/other_resources/COD/references/papers/EECS-2006-183.pdf
[arxiv_Meltdown]:../references/other_resources/COD/references/papers/arxiv_Meltdown.pdf
[chen2016]:../references/other_resources/COD/references/papers/chen2016.pdf
[Putnam_2016]:../references/other_resources/COD/references/papers/putnam2014.pdf
[Genome_Sequencing_508c]:../references/other_resources/COD/references/papers/Genome-Sequencing-508c.pdf
<!-- https://www.studocu.com/row/document/jamaa%D8%A9-almnsor%D8%A9/computer-organization-and-design/appendix-a-computer-organization-and-design/46431812 -->
[appendix_A_exercise_ans]:../references/other_resources/COD/exercise_ans/appendix-a-computer-organization-and-design.pdf
[shifter]:https://www.princeton.edu/~rblee/ELE572Papers/Fall04Readings/Shifter_Schulte.pdf
[SRAM_DRAM]:https://web.cs.umass.edu/~weems/homepage/335-Notes/ewExternalFiles/Lecture%209.pdf
[iolts_2009]:../references/other_resources/COD/references/papers/iolts-2009.pdf

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

<!-- riscv -->
[riscv_spec]:../references/other_resources/RISC-V/riscv-spec-20191213.pdf
[riscv_privileged]:../references/other_resources/RISC-V/riscv-privileged-20211203.pdf
[riscv_V_ext]:../references/other_resources/RISC-V/riscv-v-spec-1.0-rc2.pdf

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
[17h_A0h]:../references/AMD/PPR/17_A0/57243-A0-PUB_3.00.pdf
[17h_18h]:../references/AMD/PPR/17_18/55570-B1-3.16_PUB_NRV.pdf

<!-- wikichip -->
[wikichip_cpuid]:https://en.wikichip.org/wiki/amd/cpuid
[shared_tag_patent]:../references/AMD/shared_tag.pdf
<!-- https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Memory_Hierarchy WO 2018/106736 A1. -->
[opcache_patent]:../references/patents/opcache_WO2018106736A1.pdf
[zen_2]:https://en.wikichip.org/wiki/amd/microarchitectures/zen_2
[zen_2_Memory_Hierarchy]:https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Memory_Hierarchy

<!-- paper -->
[shadow_memory]:../references/papers/shadow-memory2007.pdf
[LSD_DSB_MITE]:../references/papers/opcache_LSD_DSB_MITE_etc_2105.12224.pdf
[icpp07]:../references/papers/icpp07.pdf
[mosberger93memory]:https://www.cse.psu.edu/~buu1/teaching/spring07/598d/_assoc/CCBD250576DD4E41ABC1EC82207C66A0/mosberger93memory.pdf
[robin]:../references/papers/robin.pdf
[spectre]:../references/papers/spectre.pdf
[spectre_origin_arXiv]:../references/other_resources/COD/references/papers/spectre_origin_arXiv.pdf
[Tesla_ARCHITECTURE]:../CUDA/doc/papers/lindholm08_tesla.pdf
[Branch_Divergence]:../CUDA/doc/papers/Branch_Divergence.pdf
[Benchmarking_thread_divergence_CUDA]:../CUDA/doc/papers/Benchmarking_thread_divergence_CUDA.pdf
[speculativereconvergence]:../CUDA/doc/papers/speculativereconvergence.pdf

<!-- script -->
[miscs_py_script]:../debug/bfloat16_half.py
[perf_post_py_script]:../debug/perf_report_post.py

<!-- stackoverflow Q&A -->
[perf_cache_misses]:https://stackoverflow.com/q/76593928/21294350
[miss_event_blame]:https://stackoverflow.com/questions/65906312
[perf_delay]:https://stackoverflow.com/a/65907314/21294350
[opcache]:https://superuser.com/questions/1368480/how-is-the-micro-op-cache-tagged
[miss_rate]:https://stackoverflow.com/a/50035058/21294350
[move_elimination]:https://stackoverflow.com/a/75204602/21294350
[gencode_mul_refs]:https://stackoverflow.com/a/35657430/21294350

<!-- repo -->
[mat_mat_mul]:https://github.com/czg-sci-42ver/matrix-matrix-multiply

[skenz_flex_bison]:https://www.skenz.it/compilers/flex_bison

<!-- webdoc -->
[vtune_online]:https://www.intel.com/content/www/us/en/docs/vtune-profiler/user-guide/2023-0/cpu-metrics-reference.html

<!-- manual -->
[intel_SOM]:../references/x64_ISA_manual_intel/intel_Software-Optimization-Manual.pdf
[intel_64]:../references/x64_ISA_manual_intel/intel_64.pdf

<!-- c-jump -->
[EFLAGS]:http://www.c-jump.com/CIS77/ASM/Instructions/I77_0070_eflags_bits.htm

<!-- osdev -->
[Segment_Selector]:https://wiki.osdev.org/Segment_Selector#Segment_Selector

<!-- llvm -->
[def_use]:https://llvm.org/docs/ProgrammersManual.html#iterating-over-def-use-use-def-chains

<!-- tutorialspoint -->
[single_Multiple_Cycle]:https://www.tutorialspoint.com/differences-between-data-paths

<!-- markdown doc -->
[verilog_md]:../COD/verilog/README.md

<!-- book recommendation -->
[learn_self]:https://teachyourselfcs.com/

<!-- quora -->
[hardware_thread_scheduler]:https://www.quora.com/Is-thread-scheduling-done-by-the-CPU-kernel-or-both

<!-- electronics -->
[Transmission_gate]:https://www.electronics-tutorials.ws/combination/transmission-gate.html

<!-- geeksforgeeks -->
[geeksforgeeks_hamming]:https://www.geeksforgeeks.org/hamming-code-in-computer-network/
[geeksforgeeks_latches]:https://www.geeksforgeeks.org/latches-in-digital-logic/

<!-- naver -->
[naver_EPROM]:https://blog.naver.com/beahey/220375952430

<!-- electronic stackexchange -->
[electronic_stackexchange_EPROM_EEPROM]:https://electronics.stackexchange.com/questions/675556

[CUDA_doc]:../CUDA/doc/CUDA_C_Programming_Guide.pdf
[nvidia_Cg]:../CUDA/doc/Cg/Cg-3.1_April2012_ReferenceManual.pdf
[PTX]:../CUDA/doc/ptx_isa_8.2.pdf
[cuda_cpp_Best_Practices_Guide]:../CUDA/doc/CUDA_C_Best_Practices_Guide.pdf
<!-- directx -->
<!-- [directx_9]:../CUDA/doc/directx/windows-win32-direct3d9.pdf too big -->
[directx_11]:../CUDA/doc/directx/windows-win32-direct3d11.pdf

<!-- nvidia blog -->
[cuda_warp]:https://developer.nvidia.com/blog/using-cuda-warp-level-primitives/
[Maximizing_Unified_mem]:https://developer.nvidia.com/blog/maximizing-unified-memory-performance-cuda/
[cuda_introduction]:https://developer.nvidia.com/blog/even-easier-introduction-cuda/
[cuda_stream]:https://developer.nvidia.com/blog/gpu-pro-tip-cuda-7-streams-simplify-concurrency/
[cuda_async]:https://developer.nvidia.com/blog/how-overlap-data-transfers-cuda-cc/
[unified_memory]:https://developer.nvidia.com/blog/beyond-gpu-memory-limits-unified-memory-pascal/
[unified_memory_basic]:https://developer.nvidia.com/blog/unified-memory-cuda-beginners/
[unified_memory_cuda_6]:https://developer.nvidia.com/blog/unified-memory-in-cuda-6/

[GPU_list]:https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/