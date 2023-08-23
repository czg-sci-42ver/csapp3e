- See [Online notes](https://www.josehu.com/assets/file/ostep-note/operating-systems-ostep.html#advancedrelated-topics)
# How to read this book
- > While it’s generally good to trust this book, remember too that the authors have *opinions*; those opinions may *not (always) be as widely shared as you might think.*
# Introduction
- p30
  - turn off address-space randomization temporarily based on [this](https://gcc.gnu.org/wiki/Randomization) and [this](https://www.tecmint.com/change-modify-linux-kernel-runtime-parameters/)
    ```bash
    $ sudo sysctl -w kernel.randomize_va_space=0
    $ ./mem 1 & ./mem 1 &
    $ sudo sysctl -w kernel.randomize_va_space=2 # based on `sudo sysctl -a | less`
    ```
- "journaling or copy-on-write" is *not same*.
  The COW is same as csapp p871
  See [this](https://lwn.net/Articles/576276/) from [this](https://unix.stackexchange.com/a/634056/568529) where journaling can be seen as `journalctl`.
  > Btrfs, instead, will *move overwritten blocks elsewhere* in the filesystem and write the *new data there*, leaving the older copy of the data in place.
  > So, among other things, a COW filesystem does *not need to implement a separate journal* to provide crash resistance.
  - `--reflink=always` implies COW.
- after comparison of 1.01 and 1.00 of introduction, the code font size is changed.
  Also see [this](https://pages.cs.wisc.edu/~remzi/OSTEP/combined.html) for more changes.
- > to write such a program in a high-level language like C9 without thinking about assembly, to write code in assembly without thinking about logic gates, and to build a processor out of gates without thinking too much about transistors. 
  This is said in [Introduction_to_Computing_Systems_book].
- TODO
  1. p38 relation between Multics, etc. , and UNIX.
    Multics [vs](https://retrocomputing.stackexchange.com/a/15689) UNIX
    1. `mmap`
    2. always "segments".
  2. diff between minicomputer and PC.
# Virtualization part 1 scheduling
## Processes
- [`struct proc`](https://github.com/torvalds/linux/blob/aa9ea98cca3a56869df1dc6347f3e3bfe0c01f44/include/linux/sched.h#L738) in linux from [this](https://unix.stackexchange.com/questions/80038/what-is-the-structure-of-a-linux-process)
- ["Process Control Block"](https://en.wikipedia.org/wiki/Process_control_block#:~:text=A%20process%20control%20block%20(PCB,the%20information%20about%20a%20process.) -> `struct proc` in xv6.
## Process API
- from `man 2 fork`
  > At the time of fork() both memory spaces have the *same* content.
  implies the book
  > rather, it just comes into life as if it had called fork() itself.
- > There are a few cases where wait() returns before the child exits
  maybe just [changing the state](https://stackoverflow.com/a/56006410/21294350) is enough.
  more specifically, it may be one [zombie](https://stackoverflow.com/a/65845499/21294350) which needs `WIFEXITED` with the return `wstatus` of `wait` to check whether the child exited.
- execv execl [diff](https://stackoverflow.com/a/32142863/21294350) from [this](https://stackoverflow.com/questions/9123697/what-is-the-difference-between-execl-and-execv#comment125984579_9123725)
- `pipe`
  from the `man 2 pipe` "EXAMPLES"
  the `fildes[1]` of the parent is piped into the child's `fildes[0]`.
  > connected to an in-kernel pipe (i.e., queue),
  Also see the [ostep_hw] `~/ostep-hw/5/3.c`
- `SIGTSTP` from `man 7 signal` ("Stop typed at terminal") -> suspend
  Also [see](https://askubuntu.com/a/510816/1682447)
- `kill` [vs](https://linuxhandbook.com/kill-vs-killall/#:~:text=you%20use%20them%3F-,Difference%20between%20kill%20and%20killall%20commands,with%20the%20given%20process%20names.) `killall`
  notice `man kill` may be able to specify the process name.
  > possibility to specify processes by command name, are *local extensions*.
- process structure entry [diff](https://stackoverflow.com/a/30426408/21294350) kernel stack
  > The system will usually *only save what it needs to get back to user mode* (and may use that same information to return back to the original process in another context switch, depending upon the system). The change in *process context saves all* the registers.
  i.e. the former may save only one subset of registers and the latter only saves when doing the *context switch*.
  - based on the next point(See the following "kernel registers"), the latter is specific to one process, so 
    > but this time into memory in the *process structure of the process*.
- kernel registers [diff](https://cs.stackexchange.com/a/155769/161388) user registers
  > The interrupt stashes a *copy of all the registers* away in a location *for your process*, then it grabs the *register contents for the kernel mode*, puts it into the same registers, and switches to *kernel mode* - so the kernel continues exactly where it left over.
  So kernel registers are just to save the last register states when the kernel is called.

  TODO "where it left over" may be specific to one process instead of the whole system.
  > The latter action moves the system from running as if it just trapped into the kernel from A to as if it just trapped into *the kernel from B*.
- from new [`swtch.S`](https://github.com/mit-pdos/xv6-public/commit/6710e5589d192789fe1e4b5ad7598309d88ebd79)
  it just uses two different stacks to switch.
## Direct Execution
- > you are executing a procedure call into the *C library*. *Therein*, whether for open() or any of the other sys- tem calls provided, ... and then executes the aforementioned trap instruction. The code in the library *after the trap unpacks* return values and returns control to the program that issued the system call.
  The trap in hidden in the C lib.
  program -> glibc -> trap -> glibc -(return)> program
- [trap table](https://stackoverflow.com/a/63912573/21294350) is similar to other types of tables which *map* something.
  > Rather it *maps a requested service* (typically a small number, search /usr/include for syscall.h) to a *function* that provides that service.
  i.e. map to the trap handler.
  - Above means same as the book 
    >  Clearly, the calling process *can’t specify an address* to jump to (as you would when making a pro-cedure call); doing so would allow programs to *jump anywhere* into the kernel which clearly is a Very Bad Idea1 .
    > The kernel does so by setting up a trap table at boot time

    > The OS *informs the hardware of the locations of these trap handlers*, usually with some kind of special in-struction.

    > but rather must request a *particular service via number*.
- > push the program counter, flags
  [`PUSHF`](https://www.felixcloutier.com/x86/pushf:pushfd:pushfq) to push flags.
  more specifically, it stores [states](http://www.c-jump.com/CIS77/ASM/Instructions/I77_0070_eflags_bits.htm)
  TODO more [detailed examples](https://stackoverflow.com/a/36318373/21294350)
- > explicit yield system call
  here "yield" means "give-up".
- "A Cooperative Approach" may be no use.
- TODO relations between "timer" and "concurrency"
  > The *timer* can *also be turned off* (also a privileged opera-tion), something we will discuss later when we *understand concurrency* in more detail.
- Read the paper referenced in the "T IP : R EBOOT I S U SEFUL".
- TODO "Figure 6.4" seems to use two same `movl 4(%esp), %eax`.
  > in the old and new process’s process structures, respectively.
  in their own stacks.
- sub-microsecond is just one [range](https://stackoverflow.com/a/47545073/21294350)
- `read` implies blocking, see [ostep_hw] `5/3.c`.
## Scheduling
- Jain's fairness is related with [variance](https://en.wikipedia.org/wiki/Fairness_measure#Jain's_fairness_index)
  See the [original paper p10](https://ocw.cs.pub.ro/courses/_media/isrm/laboratoare/new/a_quantitative_measure_of_fairness_and_d.pdf) which is referenced in [this p638](https://www.cin.ufpe.br/~rmfl/ADS_MaterialDidatico/PDFs/performanceAnalysis/Art%20of%20Computer%20Systems%20Performance%20Analysis%20Techniques.pdf) and [this](https://reimbar.org/posts/jain-fairness/#:~:text=Some%20examples%3A,(x%20)%3D1%2Fn)
- [convoy effect](https://www.geeksforgeeks.org/convoy-effect-operating-systems/)
- p8 the true "context switching" cost varies.
## Multi-Level Feedback
- p5
  here how *same* priority queues scheduled *inside* is not solved.
  - ans
    1. starvation
    2. > Finally, a program may change its behavior over time; what was CPU-bound may transition to a phase of interactivity.
      i.e. lack one method to *increase* the priority. -> rule 5 solves it.
    3. game by deliberately frequent unnecessary I/O or others to keep in the highest priority.
    - solution
      - rule 5 -> 1,2
        > Our new rule solves *two* problems at once.
- 3 classes of [scheduling](https://docs.oracle.com/cd/E19455-01/806-5257/6je9h0339/index.html) by Solaris
## Proportional Share
- [Lottery scheduling](https://en.wikipedia.org/wiki/Lottery_scheduling)
  > To have an array where each index represents a ticket, and each location *contains the thread* corresponding to that ticket, may be highly inefficient.
  because thread number may be duplicated.
  > The distribution of tickets need not be uniform;
  high *flexibility*.
- > LRU attains worst-case performance for some cyclic-sequential work-loads.
  i.e. ~~the cycle may be not the LRU cycle, but ~~ the oldest will always be used in one *fixed frequency*.
- why [start at zero](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)
  1. why use one `<` and `<=`
     > The observation that conventions a) and b) have the advantage that the *difference between the bounds* as mentioned *equals the length* of the subsequence is valid.
     > in either convention two subsequences are *adjacent* means that the upper bound of the one *equals* the lower bound of the other.
  2. why not use `<...<=`
    > *Exclusion of the lower bound* —as in b) and d)— forces for a subsequence starting at the *smallest natural number* the lower bound as mentioned *into the realm of the unnatural* numbers.
    this will exclude the "lower bound" -> "smallest natural number"
    - TODO meaning
      > Consider now the subsequences starting at the smallest natural number: inclusion of the upper bound would then force the latter to be unnatural by the time the sequence has *shrunk to the empty* one. That is ugly, so for the upper bound we prefer < as in a) and d).
      since "a) and d)", dooes it mean that "2<=i<=2" will not be empty?
  3. Based on 2, $0\le i \lt N$ is better.
- ["stride scheduling"](https://en.wikipedia.org/wiki/Stride_scheduling)
  ~~is just similar to Figure 7.7 "Round Robin".~~
  > Thus, a process p1 which has *reserved twice the share* of a process p2 will be *allocated twice* as often as p2.
  This is same as
  > For example, if we *divide* 10,000 by each of those ticket values, we obtain the *following stride values* for A, B, and C: 100, 200, and 40.
  > At this point, the algorithm will pick *the lowest pass* value
  the "divide" implies above "twice" relation.
- "ticket currency" is just change the ticket value unit which is similar to RMB to dollar *exchange rate*.
- > this can be challenging to do correctly;
  whether random number is random is based on the distribution which is [not documented](https://stackoverflow.com/a/48454214/21294350).
  [This](https://stackoverflow.com/a/6852396/21294350) is based on the *Poisson* distribution. So it makes sense to generate a list of ~~*buckets*~~ *intervals* and use `x/bin_size;` to generate one *random bin number* which is uniform based on the Poisson distribution.
- > Well, lottery scheduling has one nice property that stride scheduling does not: *no global* state.
  i.e. it only depends on the *current* state.
- See `man 2 nice` or `man 1 nice`
### CFS
- differences from others before
  1. time slice `sched_latency/n` which is dynamicly changed.
    which uses `min_granularity` to control the minimal value.
  2. accounting for `nice`. See eq (9.1)
    it and the eq (9.2) both *cooperate* to make the priority work.
    - Notice `prio_to_weight[i]/prio_to_weight[i+1]` is almost constant.
      > One smart aspect of the construction of the table of weights above is that the table *preserves CPU proportionality ratios* when the difference in nice values is constant
- > Although CFS won’t (quite) be perfectly fair over the target scheduling latency (sched latency) of 48 ms
  From [this](https://opensource.com/article/19/2/fair-scheduling-linux), CFS will take more time than 48ms.
  > In this case, the scheduler would reschedule in 40ms:
- > CFS *tracks vruntime precisely*, which means that over the long haul, it will eventually approximate ideal sharing of the CPU.
  i.e. `vruntime` keeps their relation proportional with the *sorting order* kept based on the multiples of the timer interrupt interval although *not exact* multiples of the time slice.
  > If a job has a time slice that is *not a perfect multiple* of the timer interrupt interval, that is OK;
- > sleep for *short periods of time frequently* do not ever get their fair share of the CPU
  intuitively, it is because the sleep time is *ignored* wrongly.
  - This means same as
    > jobs that *perform I/O* occasionally may not get their fair share of CPU
- "weighted round-robin" based on tweaked `vruntime`.
  > scale and perform well *under load*
  with overload, the `min_granularity` helps.
- My archlinux [not uses](https://unix.stackexchange.com/questions/127110/which-process-scheduler-is-my-linux-system-using#comment203380_127110) the `CFS`.
```bash
$ uname -r
6.4.1-arch2-1
```
  - And CFS may be [deprecated](https://unix.stackexchange.com/a/127113/568529) in the future.
    - related [Clear Linux](https://www.phoronix.com/review/adl-linux516-windows/2)
## summary
- MLFQ like SJF because the former has *higher priority* for shorter jobs. See "Example 2: Along Came A Short Job"
  like round-robin because in 8.6 rule 2.
# papers to read
- Hints for Computer Systems Design
- read Stevens and Rago [SR05]
- such as spawn() [B+19](https://www.microsoft.com/en-us/research/uploads/prod/2019/04/fork-hotos19.pdf)
  - From `man posix_spawn`
    > The  posix_spawn()  and  posix_spawnp() functions provide the functionality of a combined fork(2) and exec(3), with some optional *housekeeping* steps in the child process before the exec(3)
    housekeeping just means like in the book
    > because it lets the shell run code *after* the call to fork() but *before* the call to exec(); this code can *alter the environment* of the about-to-be-run program, and thus enables a variety of interesting features to be readily built.
- Atlas [K+61,L78]
- [LM+89] maybe old book is better.
  > The later versions of this book, while more up to date, *don’t quite match the beauty of this one.*
- Bouron [B+18] -> CFS.
## after learning the algorithms
- [Decay_Usage]
  - "Mach effect"
  - here decay maybe by `D` in $v_{k}(nT):=\frac{v_{k}(nT)}{D}+\delta b_{k}$
    and then influences the priority $q_{k}(t)$ by 
    $q_{k}(t)=\gamma*b_{k}+Rv_{k}(t)$
# Homework
> Each homework included below has a README file that explains what to do
> all that is left in the book are the questions you might *want to answer with the simulator*;
- TODO 
  - meaning of "using the -c flag computes the answers for you"
- `-c` in `./process-run.py -l 3:0 -L 5 -c` will compute the answer of the homeworks.
## C4
1. just as the README shows
2. 4 CPUs -> 1 I/O
3. yes
4. time length same as 2.
5. same as 3
6. obviously not.
7. better than 6.
`-I IO_RUN_IMMEDIATE -S SWITCH_ON_IO` is the better option.
## C5
1. trivial
2. trivial
  try `./fork.py -s 10 -a 100 -f 100 -c -F` and `./fork.py -s 10 -a 100 -f 0.01 -c -F`, compare.
1. similar to 1
4~6 similar to above.
1. > In which can’t you tell?
    when using `exit`.
    See [ostep_hw]
    > but orders are not.
### Codes
1. Maybe [this](https://en.wikipedia.org/wiki/Exec_(system_call)#C_language_prototypes)
  > The *base* of each is exec (execute), followed by one or more letters:
  Just to mix these bases.
  Also [see](https://stackoverflow.com/a/37558902/21294350)
1. is included in 3.
## C7 (C6 only has codes without the simulation homework)
1. obviously same
2. same as 1.
3. similar to the book example.
4. with the increasing order.
5. same length of each workload and same slice time as the workload time.
6. longer; 
  This implies "job length" means the time length.
1. longer; the longest time slice as the longest one length of the workloads.
  See [this](https://github.com/czg-sci-42ver/ostep-hw/blob/master/7/README.md) for correct answer of 7 where `(n - 1) * jt`.
## C8
- introduction 
  - `ioFreq`
    > it begins by running Job 0 for 7 ms until Job 0 issues an I/O
  - `[ time 16 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 74 (of 84) ]`
    means rule 4 in "MLFQ: Summary".
1. `-i 5` in `./mlfq.py -n 3 -q 10 -l 0,175,0:50,25,1 -i 5 -S -c` is not shown explicitly.
  - // Figure 8.5 without priority boost
    `./mlfq.py -n 3 -q 10 -l 0,120,0:100,50,1:100,50,1 -i 1 -S -c` -> `./mlfq.py -n 3 -q 10 -l 0,100,0:100,50,1:100,50,1 -i 1 -S -c`
    - others following are similar to have some small problems.
    - 
      ```pyhton
      // Figure 8.6 with gaming tolerance
      [ time 90 ] Run JOB 1 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 90 (of 100) ]
      [ time 91 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 89 (of 100) ]
      ```
2. > time slice <= (max job length / jobs number)
  i.e. let job stops *before* it ends.
1. ~~the above `./mlfq.py -n 3 -q 10 -l 0,120,0:100,50,1:100,50,1 -i 1 -S -B 50 -c` also works.~~
  more precisely
  ```bash
  $ ./mlfq.py -n 3 -q 100 -l 0,500,0:0,500,99 -i 1 -S -c
    Job  0: startTime   0 - response   0 - turnaround 1000
    Job  1: startTime   0 - response 100 - turnaround 605
  $ ipython -c "500/(605-100)"
    Out[1]: 0.9900990099009901
  ```
1. the python code implement boost by doing one cycle of them with `1s`,etc
  ```bash
  $ ./mlfq.py -n 3 -q 10 -l 0,200,0:0,200,1:0,200,1 -i 1 -S -B 200 -c
  [ time 200 ] IO_DONE by JOB 1
  [ time 200 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 189 (of 200) ]
  [ time 201 ] IO_DONE by JOB 2
  [ time 201 ] Run JOB 1 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 104 (of 200) ]
  [ time 202 ] IO_START by JOB 1
  IO DONE
  [ time 202 ] Run JOB 2 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 104 (of 200) ]
  ```
  if using $\frac{10}{200}=5\%$, then all work.
  But if $\frac{10}{200+10}$, then not work.
1. i.e. I/O with the higher priority.
  ```bash
  [ time 32 ] IO_DONE by JOB 1
  [ time 32 ] Run JOB 1 at PRIORITY 0 [ TICKS 9 ALLOT 1 TIME 38 (of 50) ]
  ```
## C9
See [this doc](https://github.com/czg-sci-42ver/ostep-hw/blob/master/9/README.md)
1. `./lottery.py -j 3 -s 0` by changing `-s 1`, etc.
2. search `Run 0` in `./lottery.py -l 10:1,10:100 -s 0 -c`
  - just "imbalanced"
  - mostly not
  - no exact answer
  - same as 'just "imbalanced"'
3. almost fair; 
4. `$ ./lottery.py -l 10:100,10:100 -s 2 -c -q 10` -> always fair.
  This is wrong.
5. The above doc is purely by python with using `random` and `wpass`.
  the random property of lottery causes it not to achieve 1 while the stride will always *interleave*.
  samller quantum size allows interleave -> more fair.
## TODO
- read "APUE".
# Projects
## xv6
try reading [this](https://github.com/YehudaShapira/xv6-explained/blob/master/Explanations.md) for better understanding
- Linker Relocate Stabs
  - here [`N_SLINE`](https://sourceware.org/gdb/current/onlinedocs/stabs.html/Line-Numbers.html) should not be relocated as [`N_RBRAC`](https://sourceware.org/gdb/current/onlinedocs/stabs.html/Block-Structure.html).
### questions
- ~~why does new `xv6` with less "struct context" registers?~~
  See the comments
- `struct proc`
  - `chan` meaning.
- read about [`alltraps`](https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/initial-xv6/background.md)
- weird installation with `qemu-full-8.0.3-1`.
  ```bash
  [czg ~/xv6-public]$ make TOOLPREFIX=i386-elf- qemu-nox
  Booting from Hard Disk..QEMU: Terminated # this is an endless loop
  ```
  - Most of instruction guides are similar to [this](https://www.assistedcoding.eu/2017/11/06/install-vx6-operating-system/).
  - fixed
    use `git clean -f -x` to remove all generated files.
    Then (Notice both the `CPU` and the `TOOLPREFIX` can't be ignored.)
    ```bash
    $ cat ~/No_Werror.patch 
      diff --git a/Makefile b/Makefile
      index 09d790c..aead744 100644
      --- a/Makefile
      +++ b/Makefile
      @@ -29,7 +29,7 @@ OBJS = \
              vm.o\
       
       # Cross-compiling (e.g., on Mac OS X)
      -# TOOLPREFIX = i386-jos-elf
      +TOOLPREFIX = i386-elf-
       
       # Using native tools (e.g., on X86 Linux)
       #TOOLPREFIX = 
      @@ -76,7 +76,7 @@ AS = $(TOOLPREFIX)gas
       LD = $(TOOLPREFIX)ld
       OBJCOPY = $(TOOLPREFIX)objcopy
       OBJDUMP = $(TOOLPREFIX)objdump
      -CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer
      +CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -fno-omit-frame-pointer
       CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
       ASFLAGS = -m32 -gdwarf-2 -Wa,-divide
       # FreeBSD ld wants ``elf_i386_fbsd''
      @@ -217,7 +217,7 @@ QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
              then echo "-gdb tcp::$(GDBPORT)"; \
              else echo "-s -p $(GDBPORT)"; fi)
       ifndef CPUS
      -CPUS := 2
      +CPUS := 1
       endif
       QEMUOPTS = -drive file=fs.img,index=1,media=disk,format=raw -drive file=xv6.img,index=0,media=disk,format=raw -smp $(CPUS) -m 512 $(QEMUEXTRA)
    $ make qemu-nox
    ```
### Codes
- based on this [video](https://www.youtube.com/watch?v=vR6z2QGcoo8)
  1. "17:45" the `UPROGS` can be without leading `_`
    This can be also seen from the code:
    ```c
    if(argv[i][0] == '_')
      ++argv[i];
    ```
    This is compiled by `_%: %.o $(ULIB)`.
  2. The `$(OBJS)` [implicit rules](https://www.gnu.org/software/make/manual/html_node/Using-Implicit.html) compile the object files.
  3. [`-Ttext`](https://stackoverflow.com/a/34627664/21294350)
  4. `./mkfs fs.img README _cat _echo _forktest _grep _init _kill _ln _ls _test_1 _test_2 _mkdir _rm _sh _stressfs _test_readcount _usertests _wc _zombie ` will make the `test_1` executable in the `fs.img`.
  - TODO read after "20:40".
### scheduling-xv6-lottery
- this has no `tests` dir, so no tests offered by the instructor.
- this [video](https://www.youtube.com/watch?v=vR6z2QGcoo8) has no cc
  most of this is similar to the [doc][background_md].
- TODO
  - why `ps.c` is in `EXTRA`. This is not explained in [xv6_book].
  - "Linear congruential generator".
    This is a very *fair* random generator. See `plot.py` generated figure although some orders may change in one cycle, e.g., sometimes "30,20,10" while sometimes "20,10,30".
- `ticks` just means "cycles" from [xv6_book]
- This project is mainly add 2 syscall which function same as the original `~/ostep-code/cpu-sched-lottery/lottery.c`.
- The 
  ```bash
  $ source tests/1.run
  XV6_TEST_OUTPUT pid: 4, parent: 3, tickets:30, ticks: 0
  XV6_TEST_OUTPUT pid: 5, parent: 3, tickets:20, ticks: 0
  XV6_TEST_OUTPUT pid: 6, parent: 3, tickets:10, ticks: 0
  ```
  implies the `settickets(30);` first called in the `test_1.c`.\
- More infos See `~/ostep-hw/projects/scheduling-xv6-lottery/scheduling-xv6-lottery_comment.patch` and `~/ostep-hw/projects/scheduling-xv6-lottery/scheduling-xv6-lottery.patch`.
### getreadcount
- just
  ```bash
  [czg ~/xv6-public]$ git apply readcount_mod.patch # remove `Werror` based on readcount.patch
  $ diff *.patch                                                       
    --- readcount_mod.patch 2023-08-22 20:36:20.590593632 +0800
    +++ readcount.patch     2023-08-22 20:36:25.077241409 +0800
    @@ -7,19 +7,10 @@
      
      # Cross-compiling (e.g., on Mac OS X)
     -# TOOLPREFIX = i386-jos-elf
    -+TOOLPREFIX =
    ++TOOLPREFIX = x86_64-elf-
      
      # Using native tools (e.g., on X86 Linux)
      #TOOLPREFIX = 
    -@@ -76,7 +76,7 @@ AS = $(TOOLPREFIX)gas
    - LD = $(TOOLPREFIX)ld
    - OBJCOPY = $(TOOLPREFIX)objcopy
    - OBJDUMP = $(TOOLPREFIX)objdump
    --CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer
    -+CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -fno-omit-frame-pointer
    - CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
    - ASFLAGS = -m32 -gdwarf-2 -Wa,-divide
    - # FreeBSD ld wants ``elf_i386_fbsd''
     @@ -178,6 +178,7 @@ UPROGS=\
            _rm\
            _sh\
  $ mkdir ~/ostep-projects/initial-xv6/src
  $ cp ~/xv6-public/* ~/ostep-projects/initial-xv6/src
  $ ./test-getreadcount.sh
  ```
  Or use the `~/ostep-projects/initial-xv6/init_xv6.sh`.
- Run `./test-getreadcount.sh`
  1. "doing one-time pre-test (use -s to suppress)" will use the `pre` file to generate the `Makefile.test`.
- How to create one new syscall
  1. obviously "MAkefile".
  2. update the definitions by "defs.h".
  3. update `main` in "main.c" with some *init* functions.
    - like use `init_readcount_lock` to init lock.
  4. update "syscall.c/h" by [this][background_md]
  5. update the syscall definitions with "sysfile.c" by [this](https://github.com/remzi-arpacidusseau/ostep-projects/blob/435fd356859b2bba933f5ef19671515e08467513/initial-xv6-tracer/README.md?plain=1#L70)
  6. "user.h" is used in `test1.c`.
  7. "usys.S" also by [background_md]
- `lk->cpu = 0;` implies better using the `CPU=1` parameter.
## shell and lottery
- shell related chapters
  - 5,
  - TODO
    - try using processes to implement parallel.
  - [POSIX.1‐2017](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/)
- lottery
  - 9
# TODO after reading the algorithm book
## C9
- Red-Black Trees to search
  - In short, it is based on the [binary cut](https://www.geeksforgeeks.org/introduction-to-red-black-tree/). See "Algorithm:".
- reread this chapter green highlights.

# TODO
- read the Multi-CPU Scheduling after "Concurrency".

---

[Introduction_to_Computing_Systems_book]:./Introduction_to_Computing_Systems/Introduction_to_Computing_Systems.pdf
[ostep_hw]:https://github.com/czg-sci-42ver/ostep-hw
[background_md]:https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/initial-xv6/background.md
[xv6_book]:https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf