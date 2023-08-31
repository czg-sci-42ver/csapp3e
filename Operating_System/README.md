- See [Online notes](https://www.josehu.com/assets/file/ostep-note/operating-systems-ostep.html#advancedrelated-topics)
# How to read this book
- > While it’s generally good to trust this book, remember too that the authors have *opinions*; those opinions may *not (always) be as widely shared as you might think.*
- read the not understanded introduction parts of each chapter after reading the whole chapter.
- Many things of the book has been said in csapp and COD.
- read this book "Javascript: The Good Parts".
- posix related docs better see [opengroup_doc] which is more detailed than `man`
## also applies to other books
- > Well, hopefully those using this book actually do look at this part *earlier*, all throughout the course.
  So better read the *appendix when reading* the book.
- > always look for *O’Reilly books* on topics you are interested in; they are almost always of high quality.
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
# valgrind
## miscs
- naming
  val -> [valid](https://en.wikipedia.org/wiki/Valgrind)
  hel -> [hell](https://inheritance.fandom.com/wiki/Helgrind#:~:text=for%20the%20peak.-,Etymology,means%20%22gates%20of%20death%22.)?
  - TODO
    - `WRK` in mutex_lock_WRK linux
## helgrind
- TODO
  - > This approximate information consists of two stacks, and the earlier access is guaranteed to have occurred *somewhere between* program points denoted by the two stacks.
    meaning
# Virtualization part 1 virtualizing CPU
> The kernel does so by setting up a *trap table at boot* time.
- "direct execution" is to minimize the overhead of OS when running one program.
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
  1. why use one `<` and one `<=` instead of two `<`/`<=`.
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
- Figure 7.7 "Round Robin" implies fair.
  > More generally, any policy (such as RR) that is *fair*, i.e., that evenly di-vides the CPU among active processes on a small time scale, will perform *poorly on metrics such as turnaround* time.
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
# Virtualization part 2 virtualizing the memory
## Address Spaces
- [time sharing](https://www.codingninjas.com/studio/library/multiprogramming-vs-time-sharing-operating-system) -> many users instead of many processes like multiprogramming.
  > However, time-sharing refers to the usage of a computing facility by multiple *users* who desire to use it at the same time.
- See [asm_md] "Batch processing".
  It implies
  > long (and hence ineffec-tive) program-debug cycles.
- memory address [space with threads](https://juniway.github.io/Operating-System/os-share-data-threads/)
- > Some modern OS’s take iso-lation even further, by *walling off* pieces of the OS from other pieces of the OS. Such microkernels [BH70, R+89, S+03] thus may provide *greater reliability* than typical monolithic kernel designs.
  See [this figure](https://en.wikipedia.org/wiki/Microkernel) for "walling off".
  And this for why [more secure](https://www.geeksforgeeks.org/microkernel-in-operating-systems/) -> "greater reliability".
## Memory API
- robust and reliable software
  the former is 
  > Robustness is inexact and *subjective*. It *cannot be measured* or proven, and it cannot be automated (beyond a few static analysis tricks). It is equally the concern of software developers, who must provide it, and stakeholders, *whose experiences* of the software system *define* it.
- TODO
  - `man 3 malloc` meaning of "private memory allocator".
  - how `free` gets the size. [See](https://github.com/bminor/glibc/blob/4290aed05135ae4c0272006442d147f2155e70d7/malloc/malloc.c#L3346)
    Also [see](https://stackoverflow.com/a/851976/21294350)
    and this related with [header](https://stackoverflow.com/a/3083006/21294350)
- > In fact, you don’t really need to even do this, as the *C library*, which all C programs link with by default, has the code for malloc() inside of it
  ```bash
  $ gcc --print-file-name=libc.a # https://stackoverflow.com/a/36103882/21294350
  /usr/lib/gcc/x86_64-pc-linux-gnu/13.1.1/../../../../lib/libc.a
  $ nm $(gcc --print-file-name=libc.a) | grep malloc # https://stackoverflow.com/questions/11927459/what-standard-library-function-does-libc-a-contain#comment15885241_11927459
  ...
  ```
  - > adding the header just lets the compiler check whether you are *calling malloc() correctly*
    header usage.
- [compile-time operator](https://en.cppreference.com/w/c/language/operator_precedence) includes `sizeof`.
- `sizeof` functions not same with stack and heap.
  > However, when we use sizeof() in the next line, it returns *a small value*, such as 4 (on 32-bit machines) or 8 (on 64-bit machines).
  > there is enough *static* information for the compiler to know that *40 bytes* have been allocated.
  - with str maybe works 
    or not (TODO)
    > Using sizeof() may lead to trouble here.
    ```bash
    $ gdb ~/matrix-matrix-multiply/build/debug_block/dgemm_10
    >>> set $a="sdasd"
    >>> p sizeof($a)
    $2 = 0x6
    ```
- `strcpy` needs aforehand allocation which can be seen `man strcpy` "EXAMPLES".
  it also shows why we prefer `strlen` to `sizeof` because of only one ending `NULL` when using `strcat`.
- [dangling pointer](https://www.geeksforgeeks.org/dangling-void-null-wild-pointers/) can be seen as sometimes valid while *sometimes* not.
  the link also says wild -> uninitialized pointer.
  - they [both](https://en.wikipedia.org/wiki/Dangling_pointer#:~:text=Dangling%20pointers%20and%20wild%20pointers,resolve%20to%20a%20valid%20destination.) point to one invalid destination.
  - the link also says about `NULL` and `void*` pointer.
- it isn't allowed to write to one freed memory.
  ```bash
  $ gcc memory-user.c -o memory-user.o -DDANGLING_POINTER
  $ ./memory-user.o 2 1                                  
  pid: 17229
  zsh: segmentation fault (core dumped)  ./memory-user.o 2 1
  ```
  TODO why
  > or overwrite valid memory
  - Notice: `free` depends on the [compiler implementation](https://stackoverflow.com/a/2558777/21294350).
- from [this](https://www.geeksforgeeks.org/swap-space-management-in-operating-system/)
  anonymous memory region implies swap space.
  > heap and stack pages that comprise each process (sometimes called anonymous memory, because there is no named file underneath of it, *but rather swap space*)
- ~~TODO~~ where the book says disadvantages of "linked list". See [ostep_book] p106 "Red-Black Trees".
  reread after the algorithm.
  - why "A SIDE : D ATA STRUCTURE — THE F REE L IST" not use the "Red-Black Trees".
    maybe here is just *boolean* list -> not many things to compare.
- "Figure 15.3" is mainly related with `trap` and the status word.
- Notice here hardware support is just the base not the whole.
  > Of course, the hardware alone cannot virtualize memory, as it just pro-vides the *low-level mechanism* for doing so efficiently. The OS must get involved *at key points* to set up the hardware so that the correct trans-lations take place;
  See corresponding chapter pdf p9.
## Address Translation
- > Thus, the OS, with a little hardware support, tries its best to get out of the way of the running program
  from the part 1, it uses `trap`. See [ostep_book] p75.
  Also it uses when switching contexts.
  > are saved to and restored from (by the hardware) when *transitioning into* and out of the kernel.
- hardware-based address translation
  > keeping track of which locations are *free* and which are *in use*
  is also said in COD and csapp.
- > almost any *well-defined interface can be interposed upon*, to add new functionality or improve some other aspect of the system
  see csapp "wrapper".
- dynamic vs static
  > Because this relocation of the address *happens at runtime*
- > initialize process table
  with `xv6`, it just runs `initlock(&ptable.lock, "ptable");`.
- > In this chapter, we have extended the concept of limited direct exe-cution with a specific mechanism used in virtual memory, known as ad-dress translation.
  - > and the other the bounds (sometimes called a limit register)
    po Here "limited" -> protection in "address translation"
  - > performed by the hardware to redirect application memory references to their actual locations in memory.
    "direct execution" -> can use the *whole* address space without thinking too much about the physical memory.
## Segmentation
- From the example above the 16.2, it explains why we separate the *offset* and the segment.
  because it is better for address translation.
- > a seg-ment can be *4KB*, and thus the correct negative offset is 3KB minus 4KB which equals -1KB.
  Notice this is not shown in "Figure 16.1".
- > the first valid byte is actually 28KB *minus 1*.
  Maybe because `0xfff` is always less than the limit `4KB` by `1`.
- > Supporting many segments requires even further hardware support,
  the "hardware support" is only to accelerate. It doesn't influence the function.
- > and thus utilize main memory more effectively.
  TODO maybe prefetching?
- > A fringe benefit arises too: code sharing.
  because segments are not limited inside one "address space" as the older "base and bounds" method.
- > The second and perhaps more important problem is that segmentation still *isn’t flexible enough* to support our fully generalized, sparse address space.
  This may mean that the segment size isn't large enough.
## Free Space
- > the free space gets chopped into *little pieces* of different sizes and is thus *fragmented*
  fragmentation terminology.
- > internal fragmentation (because the waste occurs inside the allocated unit)
  internal fragmentation terminology
- the p3 footnote
  > it is generally *difficult to determine all references* (pointers) to that region
  says why the "compaction of free space" is not reasonable.
  - [strongly-typed](https://en.wikipedia.org/wiki/Strong_and_weak_typing) languages
    > Generally, a strongly typed language has *stricter typing rules at compile* time, which implies that errors and exceptions are more likely to happen during compilation.
    So "JAVA" may need more infos to track the memory -> 
    > enable compaction as a technique to combat fragmentation.
- magic number in malloc
  > a magic number to provide additional *integrity checking*, and other information.
  TODO [this](https://www.cliffsnotes.com/tutors-problems/Information-Security/51292857-Sometimes-referred-to-as-Magic-Numbers-different-types-of-files/) need VIP.
  1. maybe to [avoid overflow](https://www.cs.usfca.edu/~benson/cs326/pintos/pintos/src/threads/malloc.c).
  2. mark [the state](https://en.wikipedia.org/wiki/Magic_number_(programming)#Debug_values).
    [This](https://stackoverflow.com/a/47885/21294350) says the same which is about "integrity checking".
    >  whether the magic number matches the expected value as a san-ity check
- `MAP_ANON|MAP_PRIVATE` is to initialize 0 and use the "copy-on-write" to avoid waste of the memory with the *private* property.
- Basic Strategies
  - > Thus, we will *not describe a “best” approach*, but rather talk about some basics and discuss their pros and cons.
    these Strategies has their *specific* application ranges.
  - > Worst fit tries to thus *leave big chunks free* instead of lots of small chunks that can arise from a best-fit approach
    ~~maybe because "best-fit" will split.~~
    ~~Also it implies "Worst Fit" not splits.~~
    See "Examples".
  - > how the allocator manages the free list’s *order becomes an issue*.
    ~~because when change the ~~
    > keeping the list ordered by the address of the free space, *coalescing becomes easier*, and fragmentation tends to be reduced.
    because no needs to search for the candidates for "coalesce".
  - performance
    Best/Worst Fit search time `O(n)`
    First/Next Fit search time `O(1)`
- [slab allocator](https://www.kernel.org/doc/gorman/html/understand/understand011.html)
  > Each cache maintains blocks of contiguous pages in memory called *slabs* which are *carved up into small chunks* for the data structures and objects the cache manages.
  its pros
  1. > The better utilisation of hardware cache by aligning objects to the *L1 or L2 caches*.
    > Slab coloring is a scheme which attempts to have objects in different slabs use *different lines* in the cache. By placing objects at a *different starting offset* within the slab, it is likely that objects will use different lines in the CPU cache helping ensure that objects from the same slab cache will *be unlikely to flush each other*. With this scheme, space that would *otherwise be wasted* fulfills a new function.
    it implicitly helps the internal fragmentation.
  2. > The caching of commonly used objects so that the system *does not waste time allocating, initialising and destroying* objects.
    > When an object is freed, it is *left in its initialised* state so that object *allocation will be quick*.
  - codes related
    [`gfporder`](https://elixir.bootlin.com/linux/latest/source/include/linux/slab_def.h#L29) which means 
    > the hardware also needs to know *which way the segment grows*
  - implementation
    something like `size-64(DMA)` will allocate one region with each object of 64 bytes (TODO) fixed size .
  - large stabs [vs](https://en.wikipedia.org/wiki/Slab_allocation#Slab_sizes) small slabs
    from [this](https://people.eecs.berkeley.edu/~kubitron/courses/cs194-24-S14/hand-outs/bonwick_slab.pdf)
    the former
    > The required slab and bufctl data structures come from *their own (small-object!) caches*.
- "binary buddy allocator" is related with the [binary tree](https://www.geeksforgeeks.org/buddy-system-memory-allocation-technique/).
  Also see [asm_md] "Buddy systems"
  - TODO why 
    > This recursive coa-lescing process *continues up the tree*, either restoring the entire free space or stopping when a buddy is found to be in use.
    maybe better.
    Maybe due to
    > think carefully enough, you’ll see that the address of each buddy pair *only differs by a single bit*;
- [B+00]
  - Blowup
    - > we reduce $u_i$ by at most (1-f)S but reduce $a_i$ by S 
      here `(1-f)S` because the $u_i$ is probably scattered among these superblocks, so there is probably some superblock whose usage proportion is less than `(1-f)S`
    - > blowup is the increase in memory consumption caused when a concurrent allocator reclaims memory freed by the pro-gram but *fails to use* it to satisfy future memory requests.
      So 
      > This free does not cause heap 1 to *cross the emptiness threshold*, but the next free (of x9) does. Hoard then *moves the completely-free superblock* from heap 1 to the *global heap*.
  - False Sharing
    - > Re-leased superblocks are guaranteed to be at least f empty, so the opportunity for false sharing of lines in each superblock is reduced
      the "f empty" is based on the above "move" to avoid the "Blowup".
      Here global heap is the *shared* heap.
    - > the allocator may then *passively induce* false sharing after a free by *letting each processor reuse* pieces it freed, which can then lead to false sharing.
      i.e. passive false sharing needs the future `malloc` to cause the real false sharing.
  - > We show that worst-case synchronization for the growing phases is in-versely proportional to the superblock size and the empty fraction
    because when "superblock size" increases, superblock number is less -> less synchronization
    then when empty fraction `f` increases, `1-f` is less, so less frequent to move the block to the global heap which may cause synchronization overheads due to "acquisition of the global heap *lock*".
  - > Each malloc and each free will be *serialized*.
    > This slowdown is not desirable but it is *scalable* as it does *not grow with the number* of processors
    scalability -> can scale with parallel
    So the paper uses the somewhat independent *Per-processor Heap*.
## Paging
- paging vs segmentation
  - > the simplicity of free-space management
    because it doesn't need coalesce (obviously paging can't do that).
  - > we won’t, for example, make assump-tions about the direction the heap and stack grow and how they are used.
    because the map is different from the segmentation which is continuous.
    While paging is one discrete map based on the page table.
  - See "Summary".
    "enabling the sparse use" this is both supported with segmentation and paging.
  - they [don't conflict](https://qr.ae/py6LEx)
    > Paging, on the other hand, is *not a substitute* for segmentation. Its main use is to *swap* memory out easily to devices that have a higher storage capacity than the available RAM.
    > Segmentation doesn't help you with upper segment boundaries, as segmentation normally *only has one upper bound*
    - Also see [mapping_logical_addr](#mapping_logical_addr)
- > the OS and hardware must combine to translate it into a meaningful physical address
  OS needs to switch the process with their own page tables. (at least *update* page tables)
  hardware use specific circuit to accelerate the process like TLB. (at least *store* page tables)
- ["sparse address space"](https://gateoverflow.in/20962/why-large-hole-between-stack-heap-part-virtual-address-space#:~:text=Virtual%20address%20spaces%20that%20include,link%20libraries%20during%20program%20execution%20%22.)
  > Virtual address spaces that include *holes* are known as sparse address spaces.
  means same as the book
  > The biggest potential cost is internal fragmentation, i.e., a page that is large but *sparsely used*.
- PTE [contents][x86_paging]
  See the [figure](https://wiki.osdev.org/File:Paging_Structure.gif)
  - TODO po "Page Directory" entry specifies the property of the page table, while "Page Table" entry specifies the 4K page block.
    See `PTE = AccessMemory(PTEAddr)`.
  - "protection bit" -> `R/W`
  - ~~TODO~~ where is no the "valid bit" in x86.
    See "A SIDE : W HY N O V ALID BIT ?", it is manipulated by the OS instead of the hardware.
  - PAT see [intel_64] "Table 12-10" p3470.
  - > G, or 'Global' tells the processor *not to invalidate the TLB entry* corresponding to the page upon a MOV to CR3 instruction. Bit 7 (PGE) in CR4 must be set to enable *global pages*.
    keep some entry cached persistently.
  - Needs [`PSE-36`](https://en.wikipedia.org/wiki/PSE-36#Activation_and_use) to use the "4-MiB aligned" when `PS=1`.
- p8 
  TODO should be `movl (21), %eax`
- `40000` -> 40K ->VPN=39.
- "Figure 18.7" shows 5 points each iteration in the topmost subgraph.
## TLB
- `TLB_Insert(VPN, PTE.PFN, PTE.ProtectBits)` where `PTE.ProtectBits` is included implies "TLB Hit" must be *Valid*.
- > Finally, once the TLB is up-dated, the hardware *retries* the instruction;
  Notice the retry -> reuse.
- `round(100/16)` -> "VPN=06".
- > Any large cache by definition is slow,
  because of [the distance](https://qr.ae/py60kb).
- > the hardware would “walk” the page table
  not totally walk, just extract the corresponding `VPN` related page table `PTEAddr = PTBR + (VPN * sizeof(PTE))`.
- [PCID](https://en.wikipedia.org/wiki/Control_register#CR3) in CR3 when `PCIDE=1` is related with ["kernel page-table isolation (KPTI)"](https://en.wikipedia.org/wiki/Kernel_page-table_isolation).
  > which allow retaining TLB entries for multiple linear-address spaces, with *only those that match the current PCID* being used for address translation
  > rely heavily on performance-impacting TLB flushes and benefit greatly from hardware-enabled *selective* TLB entry management such as PCID
  - when `PCIDE=0` See [intel_64] p3121 "Table 4-12" which is related with PAT.
  - Notice `M–1:12` when `M<=52` make the `32` bits in the wikipedia figure available.
- microcode -> [COD_md] "corresponds to uop".
- > not to cause an infinite chain
  i.e. infinite miss in the handler self.
- Notice p8 the differences between "other bits" in "page table" and "TLB".
- > P1 maps this page into the 10th page of its address space,
  > as a trans-lation could *end up in any of these locations* (in hardware terms, the TLB is known as a fully-associative cache)
  i.e. it may map from vaddr to paddr or the other direction.
### 19.7 A Real TLB Entry
- How `ASID` uses [less bits](https://stackoverflow.com/a/52880865/21294350) than  `PID`
  > First, the ASID space is used more efficiently since mostly *dormant processes do not unnecessarily consume* ASIDs. Second, all the currently allocated ASIDs are stored in the same data structure, which could be made small enough to *fit within a few cache lines*. In this way, finding new ASIDs can be done *efficiently*.
  > ASIDs are allocated to processes *dynamically* at the time when they need to execute.
  Notice intel use 12 bits for the former instead of 8.
- > over n + 1 pages with a TLB of size n;
  the `+1` will always miss because of it is accessed after the *whole loop* when using the LRU.
- ["Global" bit][x86_paging]
  is to control [share](https://en.wikipedia.org/wiki/Control_register#CR4) and [flush](http://www.rcollins.org/articles/2mpages/2MPages.html) of the PTEs.
  Also see [intel_64] p3144 although it doesn't explain the "global" meaning.
  - [linear address](https://stackoverflow.com/a/62998232/21294350)
    here "Logical Address" may be something like `cs:0xab`.
    > Logical Addresses -> Virtual Addresses -> Physikal Addresses
    where `->` means convert. <a id="mapping_logical_addr"></a>
    - Also see "Figure 20.1".
    the 1st step implies segmentation, 2nd step implies paging.
  - > We see a global bit (G), which is used for pages that are globally-shared among processes. Thus, if the global bit is set, the ASID is *ignored*.
    x86 global bit is similar to MIPS.
- Coherence bits See [H93_MIPS_R4000] p114
  they are similar to [x86][x86_paging] `PAT,PCD`, etc.
- > RAM isn’t always RAM.
  because it may incur *TLB miss overheads* -> "as quickly as another" not works.
- > A wired register can be set by the OS to tell the hardware how many slots of the TLB to reserve for the OS
  it is similar to `wire` in verilog, i.e. the register contents are *fixed*.
  > where a TLB miss would be problematic (e.g., in the TLB miss handler).
  i.e. store the related infos about the "TLB miss handler".
### "Summary" says
1. why use "larger page sizes" -> because TLB storage can be used more efficiently.
- See [asm_md] "virtually-indexed"
  physically-indexed cache is similar to use the physical addr to index the location in the page table. So needs "address translation has to take place before".
- [Interaction_Between_Caching_Translation_Protection]
  See [asm_md] "Homonyms and Synonyms"
  - [Homonyms](https://stackoverflow.com/a/76982064/21294350)
  - "3.1 Synonym avoidance" corresponds to this [method][geeksforgeeks_aliasing].
  - "3.2 A single global address-space" separate the mapping of the cache and the page table.
  - > ASIDs *handle the homonym* problem by transforming it into a synonym prob-lem.
    in the same address space, the V/V cache is determined. So no ["Same VA corresponds to several PAs"][Homonym_Synonym].
    And the ASID makes the same VA in different address spaces different.
  - [Homonym_Synonym]
    - > multiple mappings of a frame *within an address space*
    - ~~TODO~~ maybe TLB allows different VPNs -> same PFN.
      See the above [geeksforgeeks_aliasing] two different `mmap`.
      Here the cache size determines whether aliasing occurs.
  - TODO read after "3.3 Reverse maps".
  - "Physically-indexed, virtually-tagged cache" is similar to "Virtually-indexed" ones.
    They both have the synonym problem due to the multiple mapping of the TLBs. 
  - "Physically-indexed, physically-tagged" can avoid the "synonyms"
    because "Figure 5" `PFN` will select the *unique* cache address to cache the physical address.
    Also [see](https://stackoverflow.com/a/76982064/21294350)
  - So intel uses [VIPT](https://stackoverflow.com/a/22571006/21294350), reasons are similar to the above and the book
    > Because of this potential problem, people have looked into all sorts of clever ways to access caches with virtual addresses, thus *avoiding the expensive step of translation* in the case of a cache hit
## Smaller Tables
- ["linear page table"](https://users.cs.duke.edu/~narten/110/nachos/main/node8.html) is similar to segmentation implementation by spliting the address into *two parts*.
- > our page table is 4MB in size
  > with 4KB (212 byte) pages and a *4-byte* page-table entry.
  ~~See "Figure 19.2". Here size is not the page table which stores the mappings, instead it is the *data stored in the memory* corresponding to the page table.~~
  TODO it seems to be 8 bytes by "Figure 19.4".
  > Finally, some of the *64 bits* are unused (shaded gray in the diagram).
- > The bounds register is used to indicate the end of the page table
  *bounds* in segmentation can limit the *unused* space.
- > our hybrid approach realizes a *significant memory savings* compared to the linear page table
  > As you can see from the picture, most of the page table is unused, *full of invalid entries*. What a *waste*!
- > seg-mentation is *not quite as flexible* as we would like, as it assumes a *certain usage pattern* of the address space
  i.e. continuous.
  So 
  > Thus, finding free space for them in memory is *more complicated*.
  because it *can't connect* the discrete pages to offer bigger space like original paging.
  - "multi-level page table" can solve this problem because its inherent mapping property.
    > the OS can *simply grab the next free page* when it needs to allocate or grow a page
    From "Figure 20.3", it just *coalesces* the invalid pages.
    - Compared with "page directory", it just has more *nest levels* of page tables.
      So 
      > *each portion* of the page table *fits neatly* within a page
      i.e. have mapping to different "portions of the page table" -> somewhat solving the *internal fragmentation*.
- > each page can hold 16 PTEs.
  here means that the *whole PTE mappings* of the 16KB address space needs another 16 PTEs to *store* them.
  -> "per page of the page table".
  - [page directory](https://en.wikipedia.org/wiki/Page_table#Multilevel_page_tables)
    here "16 PTEs." -> PTE number of the page directory.
    - just think it as one *directory* filled with page ~~mappings~~ tables. (See the encoding of the VPN).
- > T IP : B E WARY O F C OMPLEXITY
  i.e. tuned for specific hardwares.
- `PTEAddr = (PDE.PFN << SHIFT) + (PTIndex * sizeof(PTE))`
  the `SHIFT = bit_number(PTIndex)` -> 4
  which is to avoid the overlap of the address when addition.
- the goal of "multi-level page tables"
  > our goal of making *every piece* of the multi-level page table *fit into a page* vanishes.
- "Figure 20.6" is two-level.
- "inverted page tables"
  not has "per process"  overheads and limited the size to the *physical* property.
- > With a hundred active processes (not uncommon on a modern system), we will be *allocating hundreds of megabytes* of memory just for page tables
  > the bigger the table, the faster a TLB miss can be serviced
  po here the "faster" may mean that less TLB misses because TLB translation number is smaller.
## Mechanisms
- > such as a Flash-based SSD.
  See [asm_md] "flash_diff_dram" for why FLASH is slower than DRAM.
- "A SIDE : S WAPPING T ERMINOLOGY AND O THER T HINGS"
  > it is *odd* that we call what is definitely a *legal* access (to a page mapped into the virtual address space of a process, but simply not in physical memory at the time) a *“fault”* at all;
  So not be too stuck in the terminology.
  - > which is raise an *exception*, and the OS takes over from there
    the trap handler implies “fault”.
    > known as a page-fault handler
- > how to issue I/Os to the disk
  may be a little beyond the CPU ability.
- `PTE.DiskAddr`
  See [x86_paging]
  > This means the *contents of the PTE or PDE* can be used to indicate a *location* of the page saved on mass storage and to quickly load it.
- > the algorithm would instead simply check if there are *any* free pages available.
  po should be "at least LW pages".
- > it would inform the background paging thread that free pages are needed;
  i.e. process switch (background is directly saved when start without running much).
## Policies
- > Given that main memory holds some subset of all the pages in the system, it can rightly be viewed as a cache for virtual memory pages in the system.
  virtual memory
  L1 cache -> main mem
  L2 cache -> disk or other variants like SSD, RAID.
- > Note you always pay the cost of accessing the data in memory; when you miss, however, you must *additionally* pay the cost of fetching the data from disk.
  This may differ from the original CPU L1,L2 cache (depends on how L1,L2 implemented)
  where either L1 or L2 is taken in account.
- > Assuming the cost of accessing memory (TM ) is around 100 nanoseconds
  TODO here maybe take the whole 10 times in account.
- > AMAT is 10.1 microseconds,
  Notice the [differences](https://convertlive.com/u/convert/nanoseconds/to/milliseconds) between "millisecond" and "microsecond".
  $0.01ms+100ns=0.0101ms=10.1us$ (here ms -> millisecond, so $1ms=1e+6ns$)
- "T IP : C OMPARING AGAINST O PTIMAL I S USEFUL"
  says about the usage of the *unrealistic* policy.
- `85.7%` should be `6/8=-0.75` if "ignore the first miss to a given page".
  ~~take the condition that 2rd access may be same as 1st access, so the denominator only minus one.
  then `6/10`~~
- queue 
  See [Introduction_to_Computing_Systems_book] p294 where the front is the oldest member.
  -> here "tail".
- `36.4%` -> `4/11`
- [BNS69](https://dl.acm.org/doi/pdf/10.1145/363011.363155)
  here 4 pages
  4 misses -> h,h,
  -> m (2,3,4,5)
  -> m (3,4,5,1)
  -> 2,3,4 (all misses because of evicting exactly the next page to access) (1,2,3,4) 
  -> m
  Also see [this](#Belady_Anomaly)
- TODO ["LRU stack"](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=4a58e3066f12bb86d7aef2776e9d8a2a4e4daf3e) in [M+70]
  > a cache of size N + 1 naturally *includes the contents* of a cache of size N .
  See the above paper "Figure 4"
  TODO why LRU has the stack property.
  - maybe because of the LRU *memorability*.
    > *stateless* policies such as Random or FIFO
- "Figure 22.3" -> total reference number is 11.
- > As we did with scheduling policy, to improve our guess at the future, we once again *lean on the past* and use history as our guide.
  MLFQ use the history to update the *priority*.
- [D70]
  > Informally, locality means that during any interval of execution, a program *favors a subset* of its pages, and this set of favored pages *changes membership slowly*
  "prin-ciple of locality"
- > If each miss is very costly (not uncommon), then even a small increase in hit rate (reduction in miss rate) can make a huge difference on performance
  because here miss time takes *the most* of the whole time, so if the miss rate decreases a little, then the whole time will decrease a lot.
  for example, $t_{miss}=0.8*t_{whole}$, then if miss rate decrease 
  $0.2$ -> $t_{whole}$ decreases 
  $0.16*t_{whole}$
  while if $t_{miss}=0.1*t_{whole}$ -> 
  $0.02*t_{whole}$
- > Contrast this to FIFO, where the FIFO list of pages is only accessed when a page is evicted (by removing the first-in page) or when a new page is added to the list (to the last-in side).
  i.e. not update at each access.
- "a circular list" in p12 is similar to the list in "Figure 22.5".
- ["scan resistance"](https://misfra.me/2017/01/03/caching-and-crashing-in-lm2/)
  not make the cache too messy.
  > This approach is scan resistant because a single, full collection scan *won’t destroy* the cache. 
  > lm2 uses *probability to insert* elements into the cache.
  This is similar to random.
  > Scan resistance is about *keeping the cache “good”* when faced with large scans. A scan will access lots of elements, but many will *not be accessed again*.
- > no matter how good your replacement algorithm was, if you were performing frequent re-placements, your system became unbearably slow.
  i.e. *even one paging may dominate* the time when added to the memory access time.
- [SS10]
  - [slides](https://www.usenix.org/legacy/event/atc10/tech/slides/saxena.pdf)
    - > *Disk‐based* write caches for *streamed* I/O
      which will decrease the pressure of the FLASH.
  - ~~TODO~~ how to solve with "wearout"
    See "5.3.2 Wear Management"
    - > uniformly skipping 1 in 100 dirty pages for write back
      This may be due to *overwrite*, so some write-back *may be no use* if no others use this result.
    - [zero-page sharing](https://lwn.net/Articles/517465/)
      > One zero-filled page looks a lot like another, so there is little value in making too many of them.
    - Page Sampling
      > skipping dirty pages for write-back leads to more fre-quent page faults, because younger clean pages must be evicted.
  - kw: Discard, 
## Complete Virtual Memory Systems
- > Second, the OS reduces memory pressure even further by placing user page tables (for P0 and P1, thus two per process) in kernel virtual mem-ory.
  > The upper-half of the address space is known as *system space (S)*, although *only half* of it is used.
  The purpose may be to ~~reduce the context switch overheads and ~~ use the unused kernel space.
- > however, the hardware may first have to consult the *system page table*
  > the hardware can learn the address of *the page of the page table*, and then finally learn the address of the desired memory access.
  See chapter 20, it is just similar to the 2-level page table where the page directory is the "system page table" here.
  "the page of the page table" -> page which *points to* the starting entry of the page table.
  system page table -> process page table -> translation of the VA (virtual address).
- here "A Real Address Space" is not related with x86 real mode.
- > it is easy to copy data from that pointer to its own structures. The OS is naturally written and compiled, *without worry of where* the data it is accessing comes from. 
  because they are in the same address space where the *virtual address* (i.e. used in the original C program) can be directly used.
- > If in contrast the kernel were *located entirely in physical memory*, it would be quite hard to do things like swap pages of the page table to disk
  the difficulty is that *translation* from virtual to physical, and then use the *difficult to use* physical addresses.
  See [this](https://stackoverflow.com/questions/72951878/os-how-does-kernel-virtual-memory-help-in-making-swap-pages-of-the-page-table-e#comment128947345_72963711)
  > If kernel code exists entirely in physical memory, it *cannot understand the virtual* address and has to translate it into physical address,
  - problem:
    1. "not contiguous in physical memory"
    2. > Even with our many tricks to reduce the size of page tables, it is still possible, however, that they *may be too big to fit into memory all at once*. Thus, some systems place such page tables in kernel *virtual* memory,
  - extra step:
    1. > ... and ensure the data is actually in RAM itself.
      This maybe doesn't use the page table property to check the valid/present.
    - Notice due to Spectre
      > One avenue to increasing kernel protection was thus to *remove as much* of the kernel address space from each user process
      So not all necessary kernel space is in the process virtual space.
- > With this construction (now used widely), the kernel appears almost *as a library* to applications, albeit a protected one.
  important
- > the OS does not want user applications *reading* or writing OS data or code.
  TODO from `vmmap` in `pwngdb`, it seems `r` is always allowed.
- "demand zeroing" -> zero when demand (more specifically used like writing).
  > at this point, the OS does the needed work of *finding a physical page*, zeroing it, and mapping it into the process’s address space
  > it puts an entry in the page table that marks the page inaccessible.
  i.e. when adding one page, it is just one *nonsense entry*.
  "finding a physical page" -> [demand paging](https://en.wikipedia.org/wiki/Demand_paging)
  Also see chapter 23 p14.
  - > us-ing memory-mapping of *the /dev/zero device*
    notice the *unique* source zero page.
- "copy-on-write" shows why virtual address is valuable.
  because the duplicate mapping in *different address spaces* to the same physical address from different VAs.
- From the `man 3 exec`
  > The exec() family of functions replaces the current process image with a new process image
  it ~~means same as~~ [implies](https://stackoverflow.com/a/36705730/21294350)
  > *over-written* by a subsequent call to exec()
  - here (Also [see "A process image is really the same as a *process*."](https://stackoverflow.com/a/36706241/21294350))
    > When I'm concerned about a process image, I'm pretty much concerned with the stuff that comes from the *executable file*
    So image with the loader must contains the address infos.
    > Much of the time, when I'm concerned about address space, I just want to know whether some particular *address* is valid for that process
- ["Kernel Stack"](https://www.baeldung.com/linux/kernel-stack-and-user-space-stack) is used when syscall which is similar to the normal stack.
- why DMA needs [contiguous physical memory](https://stackoverflow.com/a/56850126/21294350)
  > I/O devices that can only work with continuous ranges are built that way in order to *simplify the design* of the device
  This says why split into "kernel virtual address" and "kernel logical address".
- 32-bit -> 4GB
  So 
  > enable the kernel to address more than (roughly) 1 GB of memory
  > because the kernel is not confined to only the last 1 GB of the virtual address space
  po just means the "kernel virtual addresses" can offer 1GB more based on the user space.
- "Virtual memory" at least (advantages)
  1. allows more space than physical
  2. sharing.
  based on [this](https://stackoverflow.com/a/19349645/21294350)
  1. allow *same* addresses from different processes.
  2. isolation / protection.
    > a memory error in one program (for example, reading a bad pointer) could *destroy* memory being used by *the other process*
  3. protection (similar to 4 which reads/writes the physical address *directly*)
  4. decrease paging overheads (isolation)
  5. Memory-mapped I/O
  After all, this make *the OS can manipulate* these addresses from many places.
  - So
    > Virtual memory makes it easy to program systems
    because it doesn't need to care about other programs or devices.
- > 4-KB page size
  [See `getconf PAGESIZE`](https://stackoverflow.com/a/12672012/21294350)
- > However, fewer page-table entries is not the driving force behind huge pages; rather, it’s better TLB behavior
  po "fewer page-table entries" will cause the "better TLB behavior".
- [B+13]
  > map contiguous virtual memory regions directly to *contiguous physical* memory
  to help with the conditions
  >  data-base buffer pools
- >  there is a shorter TLB-miss path
  because table level is less.
  > allocation can be quite fast (in certain scenarios)
  TODO maybe not allocate once instead of many times for smaller blocks.
- mmap [diff](https://stackoverflow.com/a/21311462/21294350) shmget
  TODO 
  - diff [madvise](https://stackoverflow.com/questions/30470972/using-mmap-and-madvise-for-huge-pages)
    - > In this way, most applications would be unaffected (and continue to use only 4-KB pages;
      maybe the former is specific to one process while the latter is specific to one address.
  - [examples](https://rigtorp.se/hugepages/)
- > Overhead of allocation can also be bad (in some other cases).
  [See](https://lwn.net/Articles/839737/)
  > In Song's patch set, this work is *deferred to a workqueue* so that the necessary pages can be allocated in a relatively relaxed setting. This work adds some *compute-time overhead* to both the allocation and freeing of huge pages;
- ["page cache"](https://en.wikipedia.org/wiki/Page_cache) is cache for the swap space.
  > The operating system keeps a page cache in *otherwise unused portions of the main memory (RAM)*
- ["Userland"](https://unix.stackexchange.com/questions/137820/whats-the-difference-of-the-userland-vs-the-kernel) means *user space* programs.
- > The strcpy() function does not stop *until it sees a zero*
  So [this](https://web.ecs.syr.edu/~wedu/seed/Book/book_sample_buffer.pdf) can cause buffer overflow
- similar XD bit -> [Execute Disable Bit](https://www.intel.com/content/www/us/en/support/articles/000005771/processors.html)
- [Return-to-libc](https://en.wikipedia.org/wiki/Return-to-libc_attack) attack
  > A "return-to-libc" attack is a computer security attack usually *starting with a buffer overflow* in which a subroutine *return address* on a call stack is replaced by an address of a subroutine that is *already present in the process executable memory*
  > Although the attacker could make the code return anywhere, *libc is the most likely target*, as it is almost always linked to the program, and it *provides useful calls* for an attacker (such as the system function used to *execute shell* commands).
  i.e. libc is always in the address space and it can help running many useful instructions.
  So program may be preferred to be redirected there.
- > Spectre is considered the more problematic of the two.
  [because](https://portswigger.net/daily-swig/meltdown-and-spectre-one-year-on-feared-cpu-slowdown-never-really-materialized#:~:text=Meltdown%20was%20largely%20restricted%20to,makers%2C%20including%20AMD%20and%20ARM.)
  > Meltdown was *largely restricted to Intel* processors. Spectre – which is harder to exploit but potentially even more damaging – impacted a *much wider range* of processor makers, including AMD and ARM.
- > Structures like the *multi-level table* are perfect in this sense; they only create table space when the user needs a portion of the address space, and thus there is *little waste.*
  just more segments than what the "base and bounds register" can offer which make the *internal fragmentation* less frequent.
### two problems
1. no reference bit!
2. memory hogs
- From "22.8 Approximating LRU", the "reference bit" can be *multiple bits*.
- "E MULATING R EFERENCE B ITS"
  just from pair "protection,reference" -> "reference,reserved".
- [second-chance lists](https://inst.eecs.berkeley.edu/~cs162/sp21/static/lectures/16.pdf)
  here both "clean-page free list and dirty-page list" are second-chance lists
  They are just somewhat *buffers*.
  - [cs162](https://inst.eecs.berkeley.edu/~cs162/sp21/)
  - > Split memory in two: Active list (RW), SC list (Invalid)
    just same as "segment" meaning in ["seg-mented FIFO" p2 right "into two segments"](https://dl.acm.org/doi/pdf/10.1145/1010629.805473)
  - for 1st problem, LRU helps
    2nd, the buffer may help
- > The bigger these global second-chance lists are, the closer the segmented FIFO algorithm performs to LRU
  because it make *reusing the swapped-out* page available.
- "clustering." may help 2nd but not 1st.
- [`pdflush`](http://books.gigatux.nl/mirror/kerneldevelopment/0672327201/ch15lev1sec4.html) -> Dirty Page FLUSH.
- "2Q replacement algorithm" is still similar to the buffer.
  This solves with the specific problem before "*cyclic* large-file access"
  > but notably handles the case where a cyclic large-file access occurs by *confining the pages of that cyclic access to the inactive* list
# Concurrency
## Introduction
- > the OS can promote the illusion that *many virtual CPUs exist* when in fact there is only one physical CPU (or a few). This basic technique, known as *time sharing* of the CPU
  here assumes conventionally, one physical CPU runs one process sequentially.
- > Perhaps another way to think of this is that each thread is very much like a separate process, *except for one difference*: they share the same address space and thus can access the same data.
  process vs thread.
- > the exception being in pro-grams that make heavy use of recursion).
  This implies why CUDA recommends to use *one loop each thread* instead of the whole loop.
- > web servers, database management ... make use of threads in their implementations.
  because they are I/O-intensive.
- > The process-context switching takes more time and is done by the operating system whereas thread-context switching takes less time and does *not require an operating system call*.
  So thread highly [depends](https://medium.com/javarevisited/process-and-thread-context-switching-do-you-know-the-difference-updated-8fd93877dff6) on the hardware.
  So
  > the *CPU scheduler* can switch to other threads.
- > in either of the cases mentioned above
  1. *split* the work and schedule directly to different threads.
    This is similar to CUDA does.
    (The scheduling is more static.)
  2. overlap the I/O (The scheduling is more dynamic.)
    po where maybe some background thread is running.
- share data [between processes](https://stackoverflow.com/a/7108031/21294350)
  is similar to thread
  > However, threads *share an address space* and thus make it easy to share data
  > Processes are a more sound choice for *logically separate* tasks where little sharing
- Although the CPU scheduler makes the threads in one core not totally parallel but [very fast swapping](https://stackoverflow.com/a/24646546/21294350).
  [multiple cores](https://stackoverflow.com/a/71005116/21294350) with different physical schedulers *can be totally parallel*.
- `pthread_join` [blocks](https://stackoverflow.com/questions/30733684/blocking-in-pthread-join).
- > executing this code can result in a race con-dition, we call this code a *critical section*.
  this is a bit different from the critical path which cares about *time*.
- Transaction processing -> [atomicity](https://en.wikipedia.org/wiki/Transaction_processing#Atomicity).
- ["atomic compare-and-swap"](https://en.wikipedia.org/wiki/Copy-on-write#Examples) in Copy-on-write (COW).
  - in "journal" it just use the history where each unit is based on one block which *can't be splitted* due to atomicity.
    > The changes are thus said to be atomic (*not divisible*) in that they either succeed (succeeded originally or are replayed completely during recovery), or are *not replayed at all* (are skipped because they had *not yet been completely written* to the journal before the crash occurred).
- > when an interrupt occurs, either the instruction has not run at all, or it has run to completion;
  This is ensured by hardware at least [in x86](https://stackoverflow.com/a/55186668/21294350). See [intel_64] p3196.
- Here "Dijkstra" also works out ["Dijkstra's algorithm"](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).
- TODO How inode is encoded.
  maybe can be thought as one [pointer](https://unix.stackexchange.com/a/106871/568529) which points to some [structures](https://www.kernel.org/doc/html/latest/filesystems/ext4/inodes.html?highlight=inode) like `i_flags`.
  > inodes point to blocks on disk
- [Allocation Bitmap](https://www.ntfs.com/exfat-allocation-bitmap.htm)
## API
- [`void *(*start_routine)(void *)`](https://stackoverflow.com/questions/1352426/why-does-start-routine-for-pthread-create-return-void-and-take-void)
  here the 2nd `void *` -> `void *restrict arg`
  - restrict is to avoid ["pointer aliasing"](https://stackoverflow.com/a/745877/21294350) (said in csapp) from [this](https://stackoverflow.com/a/6688127/21294350)
    Also see [this](https://en.cppreference.com/w/c/language/restrict)
    > is the same as any of the objects read through *q
  - the 1st is used by `pthread_exit` which return to the parent thread which may call `pthread_join`
    from `man pthread_exit`
    > available to another thread in the same process that *calls pthread_join(3)*
- `pthread_t` can be [redefined](https://github.com/JoakimSoderberg/pthreads-win32/blob/master/pthread.h) like (from [this](https://stackoverflow.com/a/33285994/21294350))
  ```c
  typedef struct {
    void * p;                   /* Pointer to actual object */
    unsigned int x;             /* Extra information - reuse count etc */
  } ptw32_handle_t;
  ```
  although in the header ( This is said in COD and csapp *the data type doesn't matter* for the CPU because they are binary.)
  ```bash
  $ declare -f search_C_header # expand the aliases and then print the func def
  search_C_header () {
          echo "#include <$1>" | gcc -march=znver2 -pipe -E - | grep --color=always $2 -A $3
  }
  $ search_C_header pthread.h pthread_t 0           
  typedef unsigned long int pthread_t;
  ```
  - ~~The above means same as~~
    ~~> Second, if we are just passing in a single value (e.g., a long long int), we *don’t have to package it up* as an argument.~~
- `pthread_setschedparam` -> "scheduling priority of the thread".
- [why](https://stackoverflow.com/a/11560129/21294350) use `void` and `void *`
  1. `void` -> "no parameters"
    So not use it as *generic*.
  2. "store/pass pointers around *without actually using* them"
  3. > mark a value as deliberately *unused*
  - `void *` -> [generic and backward compatibility](https://stackoverflow.com/a/1025692/21294350)
    po this may help the compiler and programmer because *everything can be generic* which can be casted to anything. But something like `int *` may be ambiguous whether real `int *` or generic.
    - as book says
      > pass in any type of argument
      > Because the routine can *return anything*, it is defined to return a pointer to void
    - abstract data types (ADTs)
- > a pointer to the return value
  here return type of `pthread_create` is `void*`, so `void**` in `pthread_join(pthread_t thread, void **retval)`.
- > changes the value of the passed in argument
  See `man` 
  > If the target thread was canceled, then *PTHREAD_CANCELED is placed in the location* pointed to by retval.
- > If retval is not NULL, then pthread_join() copies the *exit status* of the target thread (i.e., the value that the target thread *supplied to pthread_exit(3)*) into the  lo‐cation pointed to by retval.
  From `man pthread_exit`
  > using the function's *return value*  as the thread's exit status.
  So `void *` in `void *(*start_routine)(void *)` -> `void *retval` in `void pthread_exit(void *retval)`, (i.e. exit status of `pthread_exit`) -> `*(void ** retval)` (i.e. type `void *`) in `pthread_join(pthread_t thread, void **retval)`.
- p5 footnote -> `-Wreturn-local-addr`.
- `pthread_mutex_t` [type](https://stackoverflow.com/a/30585409/21294350)
  See the [source codes](https://sourceware.org/pub/pthreads-win32/dll-latest/include/pthread.h) `PTHREAD_RECURSIVE_MUTEX_INITIALIZER`, etc.
- > Both of these versions should generally be avoided;
  because they may cause the *race condition*.
- [Why is memory split up into stack and heap?](https://stackoverflow.com/questions/8173353/why-is-memory-split-up-into-stack-and-heap)
  - [1](https://stackoverflow.com/a/7124033/21294350)
    heap is more tunable than the stack.
  - [2](https://stackoverflow.com/a/80113/21294350)
    > The stack is always reserved in a *LIFO* (last in first out) ... This makes it really *simple to keep track* of the stack
    > Unlike the stack, there's *no enforced pattern* to the allocation and deallocation of blocks from the heap ... there are many *custom heap allocators* available to tune heap performance for different usage patterns.

    > Each thread gets a stack, while there's typically only one heap for the application (although it isn't uncommon to have multiple heaps for different types of allocation).
    - multiple heap may be just [allocate *multiple heap blocks*](https://stackoverflow.com/a/19984988/21294350) where each block can function as one small independent heap.
      > you could just *free the entire heap* you allocated and you don't need to bother with freeing all the object allocated there.
      > then you could allocate all the nodes in a *smaller dedicated heap* and the app will gain performance because there will be *less cache misses*
    > The size of the stack is set when a *thread* is created. The size of the heap is set on *application* startup, but can grow as space is needed (the allocator *requests more memory from the operating system*).
    So has stack overflow, but not heap overflow (while has the memory leak due to the heap deallocation failure)
    And stack -> thread while heap -> application.
    > Another performance hit for the heap is that the heap, being mostly a *global resource*, typically has to be *multi-threading safe*, i.e. each allocation and deallocation needs to be - typically - synchronized with "all" other heap accesses in the program.
- `man pthread_cond_wait`
  > if another thread is able to acquire the mutex after the *about-to-block* thread has *released it*
  So it will release the `mutex` and then wait until `cond` is signaled.
  - `pthread_mutexattr_setrobust`
    is to solve the *special* condition
    > the behavior of the mutex when the owning thread *dies without unlocking* the mutex
    where `PTHREAD_MUTEX_STALLED`
    > the mutex *remains* locked afterwards
    while `PTHREAD_MUTEX_ROBUST`
    > return EOWNERDEAD to indicate that the original owner no longer exists and the mutex is in an *inconsistent* state.
    > If the next owner unlocks the mutex using pthread_mutex_unlock(3) *before making it consistent*, the mutex will be *permanently unusable* and any subsequent attempts to lock it using pthread_mutex_lock(3) will fail with the error *ENOTRECOVERABLE*
    - `pthread_mutex_consistent`
      > It is the *application's responsibility to ensure that the shared data has been restored* to a consistent state before calling pthread_mutex_consistent().
      So maybe it will do the *left unfinished work* of the dead thread.
  - > Upon successful return, the mutex shall *have been locked* and shall be *owned by the calling* thread
    So p7 `while (ready == 0) Pthread_cond_wait(&cond, &lock);` can recall `Pthread_cond_wait` to release the `mutex`.
    - This is also said in p8.
  - here two `lock` is to [control the order](https://stackoverflow.com/a/4567919/21294350) between `signal` and `wait`.
- `pthread_cond_init`
- > Either way works, but we usually use the dynamic (latter) method.
  why dynamic is prefered? (Maybe to avoid accident pass the stack address?)
  - [because](https://stackoverflow.com/a/15925014/21294350) 
    > you're supposed to initialize a *statically* allocated mutex i.e. it is going to *live until the application ends*, at which point it will be *destroyed by the system*, presumably that's what the author meant. That applies to mutex/cond variables that is *dynamically initialized as well*, the system will clean those up as well.
    So `pthread_mutex_destroy` may be not one must just like `free` if you know your program will *not last very long*.
    - From the [codes](https://github1s.com/bminor/glibc/blob/master/nptl/pthread_mutex_destroy.c#L39) `atomic_store_relaxed (&(mutex->__data.__kind), -1);`, it is to set the *invalid* state.
    Also the *static property* that the variable last *until the program ends* may not be preferred because that's not highly tuneable.
    - the mutex must be [static](https://stackoverflow.com/a/20617227/21294350) or in the heap which can be *accessed globally*.
- > It is safer thus to view waking up as a hint that something might have changed, rather than an absolute fact.
  because `pthread_cond_wait` in [opengroup_doc]
  > When using condition variables there is always a *Boolean predicate involving shared variables associated with each condition* wait that is true if the thread should proceed. Spurious wakeups from the pthread_cond_timedwait() or pthread_cond_wait() functions may occur. Since the return from pthread_cond_timedwait() or pthread_cond_wait() *does not imply anything about the value of this predicate*, the predicate should be re-evaluated upon such return.
  maybe due to *reordering*.
  - here `Boolean predicate` is check whether shared variables `ready` has changed by `while (ready == 0)`
    they are associated due to `ready = 1; Pthread_cond_signal(&cond);` in the other thread.
- [X+10]
  - ["interlocked operations"](https://www.gamedeveloper.com/programming/programming-multi-threaded-architectures-interlocked-operations) are just atomic operations.
    TODO so what is "*interlocked* or nested goto loops"
  - source code -> patch -> bugzilla.
  - ad hoc synchroniza-tion problems
    1. > Ad hoc synchronization can easily introduce *deadlocks* or hangs
      This is also shown in csapp (i.e. one infinite endless loop between threads without progressing).
      See Figure 3,2 bold texts. 
      - "Figure 8" solves this problem
      - This is the book example problem
        where `while (ready == 0); // spin` may *hold the mutex* forever which cause the another thread *deadlock* then it can't update `ready = 1` and also make the former thread *deadlock*.
      - The main issue is that the mutex *can't be unlocked* if not using something like `pthread_cond_wait`.
    2. > an ad hoc synchroniza-tion fails to guarantee an expected order
      because it doesn't synchronize at all with just the *scheduler controls the order*.
      it is implied by
      > have prob-lems interacting with modern hardware’s *weak memory consistency model*
    3. > ad hoc synchronizations can also introduce performance issues
      just avoid *too quick* spin by "Figure 6".
  - "loop invariant hoisting" see [asm_md]
    here
    > avoid such optimizations on sync variables
    just ensures "loop invariant" is not the bare invariant.
  - > need to use wrapping vari-able accesses with function calls
    This is just [tricking](https://wiki.sei.cmu.edu/confluence/display/c/DCL17-C.+Beware+of+miscompiled+volatile-qualified+variables) the *current* compiler by forcing using one *seemingly abundant function* to wrap.
- `-pthread` or `-lpthread` can be ignored because of `--enable-threads=posix` in `gcc ... -v`.
- > no other thread can (easily) access it
  This may be wrong (Also implied in the ostep).
  > otherwise some locale that is globally accessible.
  See csapp, we can deliberately pass one stack address to access.
  But obviously the stack will be *automatically invalid* when exiting from one thread (This is error-prone).
- 
### TODO
- [symbol table](https://www.geeksforgeeks.org/symbol-table-compiler/)
- what is the [usage](https://stackoverflow.com/a/52240195/21294350) of `SDT probes`
  which can be [shown](https://www.ece.villanova.edu/VECR/doc/gdb/Static-Probe-Points.html) in `gdb`
- > First, it performs poorly in many cases (*spinning for a long time* just wastes CPU cycles).
  But it seems that `ROS` intro doc use this frequently.
# appendix
## book recommendation
- "Debugging with GDB: The GNU Source-Level Debugger" 10th is offered [officially](https://sourceware.org/gdb/current/onlinedocs/gdb.html/) when [12th](https://www.amazon.com/Debugging-GDB-GNU-Source-Level-Debugger/dp/1680921436#:~:text=gdb%20can%20do%20four%20main,when%20your%20program%20has%20stopped.) is available.
## labs
### Tutorial
- [signature](https://en.wikipedia.org/wiki/Type_signature) of the C routine
  just similar to *declaration*.
  Also see [`main`](https://stackoverflow.com/a/2108208/21294350)
- > and the last of which is null.
  null (notice this is *somewhat buggy* code because access `*argv[1]` will fault. It is just for representation) and then maybe env.
  ```bash
  $ gcc argv.c -o argv.out;./argv.out
  hello, world
  argv[1]:(null)
  argv[2]:BEMENU_BACKEND=wayland
  ```
  - > it is stored in the status vari-able
    ```bash
    $ echo $?
    0 # check return
    ```
- See [asm_md] "cc_vs_gcc".
- [com-piler driver](https://stackoverflow.com/a/58392562/21294350)
- [check](https://unix.stackexchange.com/a/77783/568529) `cc1` by `gcc -print-prog-name=cc1`
- > the OS will set argc and argv properly
  just see the shell project (which is also in csapp).
- `-lm` -> libm.a
```bash
$ cat /usr/lib/libm.a 
/* GNU ld script
*/
OUTPUT_FORMAT(elf64-x86-64)
GROUP ( /usr/lib/libm-2.38.a /usr/lib/libmvec.a )
$ sudo find / -name "libimvec.a"                                                   
find: ‘/proc/1475/task/1475/net’: Invalid argument
find: ‘/proc/1475/net’: Invalid argument
```
  TODO where is `/usr/lib/libmvec.a`.
  - Maybe `gcc` just use the `libm.so` instead of `libm.a`
  - [examine](https://stackoverflow.com/a/34796/21294350) so file
  - [`AS_NEEDED`](https://sourceware.org/binutils/docs/ld/File-Commands.html#index-AS_005fNEEDED_0028files_0029) avoids loading "ELF shared libraries".
    ```bash
    $ cat /usr/lib/libm.so  
    /* GNU ld script
    */
    OUTPUT_FORMAT(elf64-x86-64)
    GROUP ( /usr/lib/libm.so.6  AS_NEEDED ( /usr/lib/libmvec.so.1 ) )
    ```
- `-lm` [defaults](https://stackoverflow.com/a/49038236/21294350) `libm.so`
  ```bash
  $ ldd argv.out 
    linux-vdso.so.1 (0x00007fff20bee000)
    /usr/lib/liblua5.4.so (0x00007fbddd050000)
    libm.so.6 => /usr/lib/libm.so.6 (0x00007fbddcf3f000)
    libc.so.6 => /usr/lib/libc.so.6 (0x00007fbddcc00000)
    /lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fbddd09d000)
  ```
- [directly](https://stackoverflow.com/a/6578558/21294350) using `libm.a`
  ```bash
  $ gcc argv_math.c -o argv.out -Wl,-Bstatic -lm -v;./argv.out # from above, libm.a lack something -> fault
  ...
  /usr/bin/ld: cannot find -lgcc_s: No such file or directory
  /usr/bin/ld: cannot find -lgcc_s: No such file or directory
  ...
  ```
- > Note that the -I flag should go on a compile line, and the -L flag on the link line.
  ~~TODO meaning?~~
  `gcc argv_math.c -o argv.out -Wl,-Bdynamic -lm -v -L. -I.;./argv.out` works
  - > this line is often called the “link line”
    i.e. one *specific* command line to link.
  - > By compiling each *individually*, you can save time by only re-compiling those files that *have changed* during your editing
    This is important.
    > hw.c has been modified more recently than hw.o has been created, make will know that hw.o is *out of date* and should be generated anew
    So better *separate* object files compilation. <a id="separate_object"></a>
- [why](https://retrocomputing.stackexchange.com/a/20293) `make` use `tab` indentation
  just the original author flavor.
  - now accept [overloading](https://stackoverflow.com/a/21920142/21294350) this convention from [this](https://stackoverflow.com/questions/2131213/can-you-make-valid-makefiles-without-tab-characters)
    [usage](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html)
- notice here "command" implies user shell command like `zsh/bash`.
- [`$(SRCS:.c=.o)`](https://stackoverflow.com/a/26133509/21294350) 
- `makedepend` may be [not reliable](https://en.wikipedia.org/wiki/Makedepend#Usage).
  > so the output may be incorrect.
- `man 3type void` to check types in C.
- [`echo '' | cpp --include "sys/time.h" | less`](https://stackoverflow.com/questions/65538395/how-to-retrieve-the-real-definition-of-a-type-variable-macro-etc-from-the-c-l#comment115871689_65538595) or `echo "#include <sys/time.h>" | gcc -E - | less`.
  To get the `struct timeval` definition.
- TODO try [emacs](https://www.reddit.com/r/emacs/comments/9hen7z/what_are_the_benefits_of_emacs_over_vim/) where org support [direct conversion to latex](https://orgmode.org/features.html).
  > Emacs ain't just an editor.
  `Meta-x info` -> vim `:! info`.
### Systems Projects
- > We also use the Moss tool [M94] to look for this kind of *“sharing”*.
- > compresses the output via gzip
  by compressing *duplicate characters*.
- > Memory-allocation Library
  this has been done in csapp.
### xv6
- > how a context switch takes place
  by `swtch(&(c->scheduler), p->context);`
  and patch can skip the loop by [something](https://github.com/czg-sci-42ver/ostep-hw/blob/3c63eee8e7517c1069e04636f99bb63d05c7c334/projects/scheduling-xv6-lottery/scheduling-xv6-lottery_comment.patch#L216C8-L216C30) before switching to select which to switch.
- TODO
  - > how to make processes *return a proper error code* when exiting, and to be able to *access that error* code through the wait() system call.
  - > returns the translated physical address
    this seems not to be included in the [README.md](https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/vm-xv6-intro/README.md)
  - "H.4" and "H.5" has not been included
### miscs tips
- > don’t turn on optimization (-O); *though this may work*, it may also lead to confusion during debugging.
  `-g` not with `-O`.
- Above "separate_object".
# papers to read
- Hints for Computer Systems Design
- read Stevens and Rago [SR05]
- such as spawn() [B+19]
  - From `man posix_spawn`
    > The  posix_spawn()  and  posix_spawnp() functions provide the functionality of a combined fork(2) and exec(3), with some optional *housekeeping* steps in the child process before the exec(3)
    housekeeping just means like in the book
    > because it lets the shell run code *after* the call to fork() but *before* the call to exec(); this code can *alter the environment* of the about-to-be-run program, and thus enables a variety of interesting features to be readily built.
- Atlas [K+61,L78]
- [LM+89] maybe old book is better.
  > The later versions of this book, while more up to date, *don’t quite match the beauty of this one.*
- Bouron [B+18] -> CFS.
- [N+07] which is related with "a *system* that automatically corrects heap-based memory errors".
- [S15]
- [CP78]
- [N+02]
- [W+21]
- [C03] for why DEC's demise
  [C93]
- [LL82]
- [D68]
- [B89, B97, B+96, K+96]
  they are all old before 2000.
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
## Virtualization part 1
### C4
1. just as the README shows
2. 4 CPUs -> 1 I/O
3. yes
4. time length same as 2.
5. same as 3
6. obviously not.
7. better than 6.
`-I IO_RUN_IMMEDIATE -S SWITCH_ON_IO` is the better option.
### C5
1. trivial
2. trivial
  try `./fork.py -s 10 -a 100 -f 100 -c -F` and `./fork.py -s 10 -a 100 -f 0.01 -c -F`, compare.
1. similar to 1
4~6 similar to above.
1. > In which can’t you tell?
    when using `exit`.
    See [ostep_hw]
    > but orders are not.
#### Codes
1. Maybe [this](https://en.wikipedia.org/wiki/Exec_(system_call)#C_language_prototypes)
  > The *base* of each is exec (execute), followed by one or more letters:
  Just to mix these bases.
  Also [see](https://stackoverflow.com/a/37558902/21294350)
1. is included in 3.
### C7 (C6 only has codes without the simulation homework)
1. obviously same
2. same as 1.
3. similar to the book example.
4. with the increasing order.
5. same length of each workload and same slice time as the workload time.
6. longer; 
  This implies "job length" means the time length.
1. longer; the longest time slice as the longest one length of the workloads.
  See [this](https://github.com/czg-sci-42ver/ostep-hw/blob/master/7/README.md) for correct answer of 7 where `(n - 1) * jt`.
### C8
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
### C9
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
1. The above doc is purely by python with using `random` and `wpass`.
  the random property of lottery causes it not to achieve 1 while the stride will always *interleave*.
  samller quantum size allows interleave -> more fair.
## Virtualization part 2
### C13
1. not totally match by substracting `free` column number in `free` because of some overheads.
2. not totally match. `[heap]` size is `132` when `./memory-user.o 100 100`.
  - maybe better than "a linked list" because it can allocate one block of data instead of one when adding one node to the list.
- here [`vdso`](https://en.wikipedia.org/wiki/VDSO) is to avoid overhead of context switches from the user mode to the kernel mode.
  - others like [`vsyscall`](https://stackoverflow.com/a/19942352/21294350) is similar.
    > just a function which reads the time saved into vsyscal
  - `vvar` stores the [kernel data](https://lwn.net/Articles/615809/) (referenced [here](https://stackoverflow.com/questions/42730260/unable-to-access-contents-of-a-vvar-memory-region-in-gdb))
    > The Linux vDSO implementation on x86_64 offers four of these *virtual system calls*: *__vdso_clock_gettime*(), __vdso_gettimeofday(), __vdso_time(), and __vdso_getcpu().
    > If you look at the code of the four *virtual system calls*, you'll notice that three of them fetch the kernel data they need *from a vvar variable* called vsyscall_gtod_data of type struct vsyscall_gtod_data.
- TODO `valgrind` failed in the infinite loop
```bash
$ valgrind ls
$ uname -r
6.4.11-arch2-1
$ valgrind --version
valgrind-3.21.0
```
### C14
2. [`kill -l `](https://stackoverflow.com/a/29383998/21294350) to check the signal number and `man 7 signal` to get the detailed infos.
  - Use [`/bin/kill -L`](https://forums.gentoo.org/viewtopic-p-7533822.html?sid=caddea015137c286957f10ee0fcdeaa2#7533822) to get the table which is also shown in `man kill` NOTES.
3. `Address 0x0 is not stack'd, malloc'd or (recently) free'd`
4. here `total heap usage: 2 allocs, 1 frees, 1,028 bytes allocated` is due to [`printf`](https://stackoverflow.com/questions/74019895/valgrind-many-allocated-bytes#comment130694195_74019895)
  where `--run-libc-freeres=no` avoids free when `exit` which will run after the `main`.
  > Memcheck therefore tries to run __gnu_cxx::__freeres *at exit*.
  Also see [asm_md] "Still reachable".
  - related with [OSX](https://stackoverflow.com/a/29810040/21294350).
    > The issue with standard streams (*stdout, stderr*), is one normally doesn't close them, as a result this buffer will normally never be freed.
    > This is a *fixed sized* buffer which is not going to grow in size, so it is *not a "leak"* as such.
5. ~~`Address 0x4bf91d0 is 224 bytes inside an unallocated block of size 4,194,032 in arena "client"`~~
  ~~implies VA -> physical address.~~
  See [ostep_hw], this has excessed too much
  with `data[25]=0;`, the error output may be more understandable.
8. TODO <a id="algorithm_1"></a>
  maybe linked list creation is faster because of no `malloc` overheads.
  - [perf table](https://en.wikipedia.org/wiki/Dynamic_array#Performance)
    here "insert" at "Beginning/Middle" is `O(n)` because of the array property.
    - TODO "amortized"?
      "Excess space"
### C15
from [this](https://github.com/czg-sci-42ver/ostep-homework/blob/master/vm-mechanism/README.md), how the stack and heap are located in the address space is just defined manually. This is also said in the chapter summary footnotes.
1. `python ./relocation.py -s 1 -n 10 -l 100 -b 16285 -a 1k -p 32k -c`
### C16
from the homework python script `paddr = nbase1 + (vaddr - asize)`, the offset should be based on the address space instead of the *limit*.
  So `0x1254-(512-(0x00000322&0x1ff))` in python -> `4470`
  ```bash
  $ python segmentation.py -c
  ...
  Virtual Address Trace
    VA  0: 0x0000020b (decimal:  523) --> SEGMENTATION VIOLATION (SEG1)
    VA  1: 0x0000019e (decimal:  414) --> VALID in SEG0: 0x00001c88 (decimal: 7304)
    VA  2: 0x00000322 (decimal:  802) --> VALID in SEG1: 0x00001176 (decimal: 4470)
    VA  3: 0x00000136 (decimal:  310) --> VALID in SEG0: 0x00001c20 (decimal: 7200)
    VA  4: 0x000001e8 (decimal:  488) --> SEGMENTATION VIOLATION (SEG0)
  ```
  - Notice here `0x0000020b` should be also in SEG1 because of the topbit.
    ```bash
    $ ipython
    [ins] In [14]: 512-(523&0x1ff) < 450
    Out[14]: False
    ```
  - the positive just plus.
    `0x00001aea+414` -> `7304`
1. [x] similar to the above.
2. [ ] `-A` is based on `vaddr` by `for vstr in addrList:`.
3. [x] `./segmentation.py -a 16 -p 128 -A 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 -b 0 -l 2 -B 32 -L 2 -c`
  here `-B` can be tweaked to `-B 64` or others.
1. [x] `./segmentation.py -a 160 -p 1280 -A 74,75,76,84,85,86 -b 0 -l 75 -B 32 -L 75 -c`
  set the limit where `75=160*90%/2`.
  - po the [ostep_hw] maybe wrong.
1. [x] similar to 4, limit -> 0.
### C17
- the `-H 4 -a 4` make the 1st `1008`
  here not coalesced
  ```bash
  $ ./malloc.py -S 100 -b 1000 -H 4 -a 4 -l ADDRSORT -p BEST -n 5 -c
  ptr[0] = Alloc(3) returned 1004 (searched 1 elements)
  Free List [ Size 1 ]: [ addr:1008 sz:92 ]

  Free(ptr[0])
  returned 0
  Free List [ Size 2 ]: [ addr:1000 sz:8 ][ addr:1008 sz:92 ]

  ptr[1] = Alloc(5) returned 1012 (searched 2 elements)
  Free List [ Size 2 ]: [ addr:1000 sz:8 ][ addr:1020 sz:80 ]

  Free(ptr[1])
  returned 0
  Free List [ Size 3 ]: [ addr:1000 sz:8 ][ addr:1008 sz:12 ][ addr:1020 sz:80 ]

  ptr[2] = Alloc(8) returned 1012 (searched 3 elements)
  Free List [ Size 2 ]: [ addr:1000 sz:8 ][ addr:1020 sz:80 ]
  ```
1. similar to above but not with the alignment.
2. More fragments because the *small* fragment is *skipped*.
3. time.
  `time ./malloc.py -n 10 -H 0 -p FIRST -s 0 -c` about half of `time ./malloc.py -n 10 -H 0 -p WORST -s 0 -c`
4. although `time ./malloc.py -n 10 -H 0 -p WORST -s 0 -l SIZESORT- -c` not takes less time (because of the sorting overheads.), it should take less time on the real machine.
5. not matters because it only cares about the free property instead of the size or the addr of each one.
  Why `./malloc.py -n 1000 -r 30 -c -l SIZESORT+ -p BEST -C -s 0` is less efficient.
  because the python script simulation is not real which can't coalesce *adjacent addresses*.
  See the [ostep_homework] script comment.
7. See 5.
  All without `-C` will generate the fragments.
### C18
- `./paging-linear-translate.py -v`
  ```bash
  $ ./paging-linear-translate.py -v
  Virtual Address Trace
    VA 0x00003229 (decimal:    12841) --> PA or invalid address?
    VA 0x00001369 (decimal:     4969) --> PA or invalid address?
    VA 0x00001e80 (decimal:     7808) --> PA or invalid address?
    VA 0x00002556 (decimal:     9558) --> PA or invalid address?
    VA 0x00003a1e (decimal:    14878) --> PA or invalid address?
  ```
  1. [x]`0x00003229` here the high bit of `229` is 0 -> in the range
  2. [ ] `0x00003a1e` ... 1 -> not in the range -> invalid. Wrong
  3. [x] others in the 1,2 obviously invalid because of the page table `[       1]  0x00000000`.
1. `1m/1k=1024` -> entry number size.
  because the cost increases when "use *big* pages in general".
  See the [ostep_hw]
2. See the introduction example.
3. See [ostep_hw] where the page size influences the overhead
  too small -> access too frequent
  too big -> See 1.
4. See [ostep_hw]
  where `0` is related and 
  the size relation between address space, page size and phys mem.
### C19
4. TODO always weird curve `python ./plot.py 10 10000000 --single_cpu`.
5. So `-O0`.
6. [`pthread_setaffinity_np`](https://stackoverflow.com/a/32657755/21294350) and [`sched_getcpu`](https://www.nas.nasa.gov/hecc/support/kb/processthread-pinning-overview_259.html#:~:text=Pinning%2C%20the%20binding%20of%20a,percentage%20of%20local%20memory%20accesses.) (They are the top results of "pinning a thread")
  weird curve.
TODO use [cpuid](https://unix.stackexchange.com/a/113595/568529) which is [not part of msr-tools](https://stackoverflow.com/a/72107145/21294350) to check TLB.
Also [see](https://unix.stackexchange.com/a/746813/568529).
### C20
```python
def get_contents(page,index):
  contents = hex(page>>((32-index-1)*2*4)&0xff)
  num = int(contents,0x10) & 0x7f
  return contents,num
pde_page = 0x83fee0da7fd47febbe9ed5ade4ac90d692d8c1f89fe1ede9a1e8c7c2a9d1dbff
vaddr = 0x611c
pde_index = vaddr >>10&0x1f
pte_index = vaddr >>5&0x1f
offset = vaddr & 0x1f
pde_contents = hex(pde_page>>((32-pde_index-1)*2*4)&0xff)
pde_pfn = -1
if (int(pde_contents,16) & 0x80): pde_pfn = int(pde_contents,16) & 0x7f
if pde_pfn != -1:
  # this needs dynamic changes
  pte_page = 0x7f7f7f7f7f7f7f7fb57f9d7f7f7f7f7f7f7f7f7f7f7f7f7f7f7ff6b17f7f7f7f
  pte_contents,pte_pfn = get_contents(pte_page,pte_index)
paddr = (pte_pfn << 5) | offset
"""
From `memoryDump` and `getValue` the physical memory just *consists of pages*. 
"""
# continues the above. get the physical memory data
physical_offset = paddr & 0x1f
physical_page = paddr >> 5
physical_page_mem = 0x0f0c18090e121c0f081713071c1e191b09161b150e030d121c1d0e1a08181100
mem_contents,ignore_num = get_contents(physical_page_mem,physical_offset)
mem_contents
```
notice `ptPtr   = (pde & 0x7f)` implies the topbit -> valid bit
1. still one.
2. 3 for 2-level.
3. "lots of cache hits" if cache is bigger than the TLB.
### Ç21
1. See `id,us` changes.
2. Yes.
  ```bash
  $ vmstat 1
  ...
    1  0      0 5518196  46572 5016832    0    0     0     0  968 1510  1  1 99  0  0
    2  0      0 5202048  46572 5016832    0    0     0     0 1358 2035  1  2 97  0  0
    2  0      0 4467352  46572 5016832    0    0     0     0 1595 1696  7  2 91  0  0
  $ ipython
  [ins] In [3]: (5518196-4467352)/1024
   Out[3]: 1026.21484375
  ```
  - > swpd (the amount of virtual memory used)
    should be swap. So -> `0`
3. Just similar.
  They are all swapped out in the 1st loop.
  - TODO
    How highmem related with ["maximum size of virtual memory"](https://docs.kernel.org/mm/highmem.html)
    > High memory (highmem) is used when the size of physical memory *approaches or exceeds* the maximum size of virtual memory.
    Since from the [kernel `/proc` doc](https://www.kernel.org/doc/html/latest/filesystems/proc.html?highlight=memfree) which is from [this](https://lore.kernel.org/linux-mm/YmmenecCDr6kGvUj@cmpxchg.org/)
    > Highmem areas are for use by *userspace* programs, or for the pagecache.
    - This means same as [this](https://unix.stackexchange.com/a/5151/568529)
  - [`sudo swapoff -a && sudo swapon -a`](https://askubuntu.com/questions/1357/how-to-empty-swap-if-there-is-free-ram) clear swap.
4. "CPU utilization" only changed by the process count. (i.e. `./mem 10000` or `./mem 100` both use `us=7`)
  `bo` is almost same as `so`, but sometimes bigger when taking other operations than swap in account.
5. both conditions (bigger or smaller than physical) will take longer at the 1st loop
  while much shorter afterwards.
  - `performance` is similar with `6680.47 MB/s` without swapping by `./mem 10000` and `6977.95 MB/s` with swapping by `./mem 100`.
    loop0: `2612.17 MB/s` vs `4257.87 MB/s`
6. not to arbitrarily run like `./mem 19000` which may close all programs to allocate ...
7. > How close can you get to in-memory performance
  From 5, it seems that the SSD performs almost same as the memory.
  Maybe due to the *cache*. -> This also explains why the 1st loop always takes longer.
### Ç22
`./paging-policy.py -C 4 -a 1,2,3,4,1,2,5,1,2,3,4,5 -c` explains "Belady’s Anomaly" <a id="Belady_Anomaly"></a>
2. as the book says, just enough to *hold all* accesses.
  `UNOPT` is opposite of `OPT` which replace the nearest access (This is weird just as its name shows).
  - From `addrList.append(n)` -> `addrList` stores the addresses to access.
  - From `if count == cachesize:` -> `count` stores cache filled size.
    - So `memory[pageIndex]` stores the current cache states.
  - `whenReferenced = futureIdx` -> stores the *duplicate* index with current *contents in the cache* in the future.
    - `whenReferenced < minReplace` implies replace the *nearest* instead furthest future index.
## Concurrency
### C26
- [HLT](https://www.felixcloutier.com/x86/hlt.html) [resume](https://en.wikipedia.org/wiki/HLT_(x86_instruction))
  > execute a HLT instruction to cut power usage *until the next hardware interrupt*.
- [`.main`](https://stackoverflow.com/a/20830684/21294350)
- Use `-R` in `./x86.py -p looping-race-nolock.s -t 2 -a bx=1 -M 2000 -i 2 -c -R ax` to check the register.
3. No because they don't share anything.
4. `./x86.py -p looping-race-nolock.s -t 1 -M 2000 -c -R ax,bx` all regs init 0.
6. obviously matters.
  when the critical section is not interrupted (i.e. two `mov` in one thread are not interrupted).
  - > before get reset.
    means "get interrupted" in the README.md in [ostep_hw]
8 is same as 7. (TODO this is not same as [ostep_hw])
9. `ax` not changed which just differentiates between threads.
10. originally not efficiently.
  just needs thread 1 to init memory.
### C27
3. maybe threads wait for each other to unlock.
4. the `helgrind` offers the solution implicitly which is also said in csapp.
  > Thread #3: lock order "0x10C060 before 0x10C0A0" violated
  i.e. keep the acquire order same among threads.
```bash
$ for i in $(seq 1 1 10000);do echo $i;./main-deadlock;done
...
# maybe stuck somewhere
117

```
5. obviously not because it conforms to the above solution somewhat.
  TODO Should be "No.Yes."
```bash
$ for i in $(seq 1 1 10000);do echo $i;./main-deadlock-global;done
...
10000
```
6. > Why is this code inefficient?
  TODO maybe it is unable to schedule by doing something more useful when the `main` keeps checking the unnecessary `while (done == 0)`.
  - Notice this is not totally same as [X+10] "Figure 3,2" where it will acquire lock before doing the work.
  - TODO does `Pthread_cond_wait` avoid above "unnecessary loop".
7. TODO Here only one write. So despite data race, it will always function right.
```bash
$ for i in $(seq 1 1 10000);do echo $i;./main-signal;done
...
10000
this should print first
this should print last
```
8. based on 7, just performance.
## TODO
- read "APUE".
# Projects
## xv6
try reading [this](https://github.com/YehudaShapira/xv6-explained/blob/master/Explanations.md) for better understanding
- Linker Relocate Stabs
  - here [`N_SLINE`](https://sourceware.org/gdb/current/onlinedocs/stabs.html/Line-Numbers.html) should not be relocated as [`N_RBRAC`](https://sourceware.org/gdb/current/onlinedocs/stabs.html/Block-Structure.html).
- expect
  - [`expect`](https://www.geeksforgeeks.org/expect-command-in-linux-with-examples/) is to expect input
    From `man expect`
    > waits  until  one  of  the  patterns  matches the output of a spawned process
    So when launching the `qemu`, the `expect "init: starting sh\r"` will wait until it outputs this message and then it goes forward.
- miscs with git
  - [`git clean -f -x -d`](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-use-the-git-clean-command) remove untracked directories and files.
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
- [`traps.h`](https://github.com/czg-sci-42ver/ostep-hw/blob/master/projects/vm-xv6-intro/README.md) defines the error code.
- `argint` or `argptr` See `syscall.c`.
  - From `(uint)i+size` the `size` corresponds to size of `n`th parameter.
- `P2V` is [specific](https://stackoverflow.com/questions/50073792/whats-the-mechanism-behind-p2v-v2p-macro-in-xv6) to the xv6 memory space. 
  See the figure.
- here assume page table bits same as [x86](https://pekopeko11.sakura.ne.jp/unix_v6/xv6-book/en/Page_tables.html).
- How `write` [works](https://stackoverflow.com/questions/49971604/how-does-xv6-write-to-the-terminal).
### scheduling-xv6-lottery
- this has no `tests` dir, so no tests offered by the instructor.
- this [video](https://www.youtube.com/watch?v=vR6z2QGcoo8) has no cc
  most of this is similar to the [doc][background_md].
- TODO
  - why `ps.c` is in `EXTRA`. This is not explained in [xv6_book].
  - "Linear congruential generator".
    This is a ~~very~~ somewhat not *fair* random generator because it *doesn't show the differences* between ticket number. See `plot.py` generated figure although some orders may change in one cycle, e.g., sometimes "30,20,10" while sometimes "20,10,30".
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
#### tests ( here only simple tests)
- > You'll need two new system calls
  we have met this need
- > Most of the code for the scheduler is quite localized and can be found in proc.c
  `scheduler` is in it and we have added many self-defined functions.
- > You'll need to assign tickets to a process when it is created
  `p->tickets = 1;`
- > You'll also need to figure out how to generate random numbers in the kernel
  See above "Linear congruential generator"
- > Finally, you'll need to understand how to fill in the structure pstat in the kernel
  by `def.h`, `user.h` and `pstat.h`.
- > Good examples of how to pass arguments into the kernel are found in existing system calls
  `argint`, etc.
- `ps` works
  - TODO `ticks` meaning.
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
### vm-xv6-intro
- `test2.c` is the [`null`](https://github.com/czg-sci-42ver/ostep-hw/blob/master/projects/vm-xv6-intro/README.md) program.
  So
  > Thus, if you dereference a null pointer, you will not see an exception (as you might expect)
  may be not that case.
- `i386-elf-gas` not exists
  So
  ```diff
  -AS = $(TOOLPREFIX)gas
  +AS = $(TOOLPREFIX)as  
  ```
  However, it is not used in `Makefile`.
- TODO
  - `alloc` meaning in `walkpgdir(curproc->pgdir, a, 0)`.
- why `sz = PGSIZE;`
  othewise with `sz = 0`
  ```bash
  test 1: passed
  test 2: 2.out incorrect
    what results should be found in file: tests/2.out
    what results produced by your program: tests-out/2.out
    compare the two using diff, cmp, or related tools to debug, e.g.:
    prompt> diff tests/2.out tests-out/2.out
    See tests/2.run for what is being run
  [czg ~/ostep-projects/vm-xv6-intro]$ diff tests/2.out tests-out/2.out
  --- tests/2.out 2023-08-29 16:29:01.942459722 +0800
  +++ tests-out/2.out     2023-08-29 16:39:30.146201478 +0800
  @@ -1 +1 @@
  -pid 3 test_2: trap 14 err 4 on cpu 0 eip 0x1000 addr 0x0--kill proc
  +pid 3 test_2: trap 6 err 0 on cpu 0 eip 0x1005 addr 0x0--kill proc
  ```
  - because
    > If you change xv6 to *make the first page invalid*, clearly the entry point will have to be somewhere else (e.g., the next page, or 0x1000)
    So also `|| (uint)i < PGSIZE`
    - This is achieved by `$(LD) $(LDFLAGS) -N -e main -Ttext 0x1000 -o $@ $^`.
  - when `0` is in `sz` -> "trap 6" illegal because of NULL.
    while not, -> "page fault".
- Here we define the functions in `vm.c`.
#### tests
```bash
[~/xv6-public]$ grep -r -w "pipewrite" . # get code infos.
```
1. TODO
  why due to `sz = PGSIZE;`
1. 
  - here `stdout` [->](https://unix.stackexchange.com/questions/597623/what-does-it-mean-when-a-file-descriptor-is-a-link-to-a-pipe) `FD_PIPE`.
    ```bash
    $ ls -l /proc/3272/fd/1 
     l-wx------ 1 czg czg 64 Aug 29 17:58 /proc/3272/fd/1 -> 'pipe:[42661]'
    ```
  - TODO how `p->data[p->nwrite++ % PIPESIZE] = addr[i];` return `-1`.
2. Here `*(int *)4096` will always init the same value.
3. `np->pgdir = copyuvm(curproc->pgdir, curproc->sz)` implies the inheritance.
## shell and lottery
- shell related chapters
  - 5,
  - TODO
    - try using processes to implement parallel.
  - [POSIX.1‐2017](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/)
- lottery
  - 9
# TODO after reading the algorithm book
[W+95]
- > balanced bi-nary trees, splay trees, or partially-ordered trees
- > a hash table is often built over the base structure to speed up lookups.
  >  page tables are *just data structures*. You can do lots of crazy things with data structures, making them smaller or bigger, making them slower or faster.
  > What *new struc-tures* can you come up with? What problems do they solve?
- concurrent B-tree
- [This](#algorithm_1)
## C9
- Red-Black Trees to search
  - In short, it is based on the [binary cut](https://www.geeksforgeeks.org/introduction-to-red-black-tree/). See "Algorithm:".
- reread this chapter green highlights.

# TODO
- read the Multi-CPU Scheduling after "Concurrency".
- use `valgrind` with chapter 14,22 homework.
  - read [SN05]
## related with security
- > lets the attacker inject arbitrary data into the target’s address space.
# OSTEP 1.01 chpaters in the [ostep_book]
Just all use the pdf from the [web](https://pages.cs.wisc.edu/~remzi/OSTEP/#book-chapters), it seems that 1.01 is not issued all at one time but with many discrete times.
- chapter 6,19,23,26,28,40,
# miscs
- [LinuxForums.org](https://en.wikipedia.org/wiki/LinuxForums.org) has been shutdown which is [shown here](https://stackoverflow.com/questions/851958/where-do-malloc-and-free-store-allocated-sizes-and-addresses#comment660519_851958).
## the English grammar
- [grammar](https://english.stackexchange.com/a/432025) to answer "We don't want that, do we?" in chapter 12.
  just care about the answer is enough without caring the questions "do" or "don't".
- when ["the"](https://www.englishteachermelanie.com/grammar-when-not-to-use-the-definite-article/#:~:text=Articles%20are%20not%20used%20before,I%20live%20in%20Canada.) not needed.
  > Things in general
  So in the [ostep_book]
  > this pro-cess’s address space has been placed *in memory*
- "You’re welcome" -> [welcome](https://english.stackexchange.com/a/152945) your help or others.
- > peeking into the future, if it were possible, does a much better job of replacement.
  [subjunctive mood](https://www.scribbr.com/verbs/subjunctive-mood/#:~:text=The%20subjunctive%20mood%20is%20a,types%20of%20subjunctive%20verb%20forms.)
  > The past subjunctive is typically used to refer to past or *present* actions or situations.
  - TODO here "infinitive form" ~~isn't same as "to be"~~ is the ["Bare infinitive"](https://www.grammarly.com/blog/infinitives/) which may function as "adjective"/noun.

---

<!-- ostep related -->
[Introduction_to_Computing_Systems_book]:./Introduction_to_Computing_Systems/Introduction_to_Computing_Systems.pdf
[ostep_hw]:https://github.com/czg-sci-42ver/ostep-hw
[ostep_book]:./Operating_Systems_Three_Easy_Pieces_by_R.pdf
[background_md]:https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/initial-xv6/background.md
[ostep_homework]:https://github.com/czg-sci-42ver/ostep-homework/blob/master/vm-freespace/README.md

[xv6_book]:https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf
[asm_md]:../asm/README.md
[COD_md]:../COD/README.md

<!-- paper -->
[Decay_Usage]:./Ostep_papers/Decay_Usage.pdf
[B+19]:./Ostep_papers/fork-hotos19.pdf
[B+00]:./Ostep_papers/asplos-2000.pdf
[SS10]:./Ostep_papers/Saxena.pdf
[Interaction_Between_Caching_Translation_Protection]:./Ostep_papers/Interaction_Between_Caching_Translation_Protection.pdf
[B+13]:./Ostep_papers/isca13_direct_segment.pdf
[X+10]:./Ostep_papers/Xiong.pdf

[intel_64]:../references/x64_ISA_manual_intel/intel_64.pdf
[H93_MIPS_R4000]:../references/other_resources/COD/MIPS/R4400_Uman_book_Ed2.pdf

[x86_paging]:https://wiki.osdev.org/Paging#Page_Directory
[Homonym_Synonym]:http://www.cse.unsw.edu.au/~cs9242/02/lectures/03-cache/node8.html
[geeksforgeeks_aliasing]:https://www.geeksforgeeks.org/virtually-indexed-physically-tagged-vipt-cache/

[opengroup_doc]:https://pubs.opengroup.org/onlinepubs/9699919799/