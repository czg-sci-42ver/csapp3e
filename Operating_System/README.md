- See [Online notes](https://www.josehu.com/assets/file/ostep-note/operating-systems-ostep.html#advancedrelated-topics)
# markdown modification
- `( >.*\n)([^\n])` (to avoid already modified quotes `>` which has newline departed from the subsequent contents) or `( >.*\n)([.*])` to `$1\n$2`.
# How to read this book
- > While it’s generally good to trust this book, remember too that the authors have *opinions*; those opinions may *not (always) be as widely shared as you might think.*

- read the not understanded introduction parts of each chapter after reading the whole chapter.
- Many things of the book has been said in csapp and COD.
- read this book "Javascript: The Good Parts".
- posix related docs better see [opengroup_doc] which is more detailed than `man`
- xv6 version `2012-01-30-1-g1c41342` in [ostep_book] "p499/709".
- > Don’t just read academic papers; also read about recent advances in the popular press (e.g., [V12]).
  read web "anandtech".
## also applies to other books
- > Well, hopefully those using this book actually do look at this part *earlier*, all throughout the course.

  So better read the *appendix when reading* the book.
- > always look for *O’Reilly books* on topics you are interested in; they are almost always of high quality.

# maxim
- > Not everything worth doing is worth doing well”, which is a terrific engineering maxim

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
  See [this](https://lwn.net/Articles/576276/) from [this](https://unix.stackexchange.com/a/634056/568529) where journaling can be seen as `journalctl`. <a id="COW_btrfs"></a>
  > When data is *overwritten* in an ext4 filesystem, the new data is written on top of the existing data on the storage device, *destroying* the old copy. Btrfs, instead, will *move overwritten blocks elsewhere* in the filesystem and write the *new data there*, leaving the older copy of the data in place.

  > So, among other things, a COW filesystem does *not need to implement a separate journal* to provide crash resistance.

  - [`--reflink=always`](https://btrfs.readthedocs.io/en/latest/Reflink.html) implies COW.
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
  - And this for why [more secure](https://www.geeksforgeeks.org/microkernel-in-operating-systems/) -> "greater reliability".
    Also "Security" because less codes are assigned the "kernel mode". Also see [S03](http://nooks.cs.washington.edu/nooks-tocs.pdf) where "address-space based protection" mainly by isolation.
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
- mmap [diff](https://stackoverflow.com/a/21311462/21294350) [`shmget` (id) -> `shmat` (mem_addr)](https://github.com/czg-sci-42ver/code-for-blog/blob/289b20976d4fcff85cf52a9b2ec57109a29a93a7/2018/futex-basics/futex-wait-timeout.c#L56C16-L56C22)
  - See [this](#shm_open_mmap) for [`shm_open`](https://stackoverflow.com/questions/71806449/relation-between-shm-open-and-mmap#comment126894511_71806449)
    > does to shm_opened object the same as it does to opened file

    - direct `mmap` to share, See [ostep_book] or "sem_init_across_processes_mod_direct_mmap.c".
  - TODO 
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
TODO find one specific book about Concurrency to read.
- why OS lock needs hardware support
  1. [atomic](https://cs.stackexchange.com/a/132120/161388)
  2. OS needs to protect itself from [interrupts](https://cs.stackexchange.com/a/132134/161388)
    - and other cores (Also [see](https://cs.stackexchange.com/questions/132115/why-do-os-locks-require-hardware-support#comment278150_132115)).
  3. speed mentioned in the 2rd link. Also [see](https://cs.stackexchange.com/questions/132115/why-do-os-locks-require-hardware-support#comment278143_132115)
  4. worse if not "consistent view of memory" (maybe if lock is stored probably in mem)
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
- Transaction processing -> [atomicity](https://en.wikipedia.org/wiki/Transaction_processing#Atomicity). <a id="Transaction_atomicity"></a>
- ["atomic compare-and-swap"](https://en.wikipedia.org/wiki/Copy-on-write#Examples) in Copy-on-write (COW).
  - in "journal" it just use the history where each unit is based on one block which *can't be splitted* due to atomicity.
    > The changes are thus said to be atomic (*not divisible*) in that they either succeed (succeeded originally or are replayed completely during recovery), or are *not replayed at all* (are skipped because they had *not yet been completely written* to the journal before the crash occurred).

- > when an interrupt occurs, either the instruction has not run at all, or it has run to completion;

  This is ensured by hardware at least [in x86](https://stackoverflow.com/a/55186668/21294350). See [intel_64] p3196.
- Here "Dijkstra" also works out ["Dijkstra's algorithm"](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).
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
    - the *static property* that the variable last *until the program ends* may *not be preferred* because that's not highly tuneable.
    - miscs
      - > you're supposed to initialize a *statically* allocated mutex i.e. it is going to *live until the application ends*, at which point it will be *destroyed by the system*, presumably that's what the author meant. That applies to mutex/cond variables that is *dynamically initialized as well*, the system will clean those up as well.

        So `pthread_mutex_destroy` may be not one must just like `free` if you know your program will *not last very long*.
        - From the [code and comments](https://github1s.com/bminor/glibc/blob/master/nptl/pthread_mutex_destroy.c#L39) `pthread_mutex_destroy` is first try getting the lock and then invalidate *without freeing the memory*. 
          And `atomic_store_relaxed (&(mutex->__data.__kind), -1);`, it is to set the *invalid* state .
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
    - This means [lock-free](https://www.1024cores.net/home/lock-free-algorithms/introduction) from [this](https://stackoverflow.com/questions/2528969/lock-free-multi-threading-is-for-real-threading-experts#comment24239144_2528969)
      po it just *encapsulates the lock inside*.
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
## locks
This is mainly about atomic instructions which has been discussed in [COD_md].
- [why use](https://stackoverflow.com/questions/2821263/lock-a-mutex-multiple-times-in-the-same-thread#comment2861220_2821263) `PTHREAD_MUTEX_RECURSIVE`
  from [doc](https://pubs.opengroup.org/onlinepubs/7908799/xsh/pthread_mutexattr_settype.html) it just allow multiple locks done when lock *isn't released at all*. 
  > A thread attempting to *relock* this mutex *without first unlocking* it will succeed in locking the mutex

  - TODO ~~"before another thread can acquire the mutex" seems to conflict with "relock".~~
  - > Multiple locks of this mutex require the *same number of unlocks* to release the mutex before *another thread* can acquire the mutex.

    Recursive Lock (Mutex) [vs](https://stackoverflow.com/a/189778/21294350) Non-Recursive Lock 
    > non-recursive mutexes, there is *no sense of ownership* and any thread can *usually release the mutex* no matter which thread originally took the mutex.

    This means same as `man pthread_mutex_lock`
    > the mutex is currently *owned by the calling thread*

    - So it has
      > the mutex shall maintain the concept of a *lock count*

    - It is related with *recursion* where the deadlock is avoided because it knows *all* the unlock will be called all after calling *all* `lock`. <a id="recursive_mutex"></a>
      > Otherwise after the first recursion, there will be instant deadlock because the lock *cannot be acquired a second time*.

      > and that's why non-recursive mutexes *deadlock if the same thread locks twice without a free*

      > they will be freed assuming *proper RAII* and the process terminates gracefully

    - This also implies [why use](https://stackoverflow.com/a/9305970/21294350) `pthread_mutex_trylock`
    - [Notice](https://en.wikipedia.org/wiki/Reentrant_mutex) from [this](https://stackoverflow.com/a/26656022/21294350)
      > because the final m.lock() will succeed *without blocking*.

      Although [this](https://stackoverflow.com/a/50138902/21294350)
      > a different thread attempts to acquire that mutex which *gets blocked* because it's held by a different

  - We can use helgrind to understated it.
    ```bash
    $ gcc MUTEX_RECURSIVE.c -DMUTEX_DEFAULT -o MUTEX_RECURSIVE.out
    ...
    ==92634== Thread #1: Attempt to re-lock a non-recursive lock I already hold
    $ gcc MUTEX_RECURSIVE.c -o MUTEX_RECURSIVE.out                
    [czg /mnt/ubuntu/home/czg/csapp3e/Operating_System/code_test/Concurrency]$ valgrind --tool=helgrind ./MUTEX_RECURSIVE.out -s
    ==92697== Helgrind, a thread error detector
    ==92697== Copyright (C) 2007-2017, and GNU GPL'd, by OpenWorks LLP et al.
    ==92697== Using Valgrind-3.21.0 and LibVEX; rerun with -h for copyright info
    ==92697== Command: ./MUTEX_RECURSIVE.out -s
    ==92697== 
    3628800
    ==92697== 
    ==92697== Use --history-level=approx or =none to gain increased speed, at
    ==92697== the cost of reduced accuracy of conflicting-access information
    ==92697== For lists of detected and suppressed errors, rerun with: -s
    ==92697== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
    $ ipython -c "import math;math.factorial(10)"
    Out[1]: 3628800
    ```
- > the state of the lock is simply changed to *free*

  means same as `man pthread_mutex_lock`
  > When the lock count *reaches zero*, the mutex shall become available for other threads to acquire.

- "coarse-grained locking" is not same as [COD_RISCV_2nd_A_appendix] "Coarse-grained multithreading".
  but the basic idea is similar.
- > hardware primitives have been added to the instruction sets

  ISA is closely related with the hardware.
  - [`lock`](https://stackoverflow.com/questions/980999/what-does-multicore-assembly-language-look-like) just use simple `mov`, etc., to implement. See "ARM minimal runnable baremetal example".
- intel atomic by prefix `LOCK`. See [intel_64] p149 and [also](https://stackoverflow.com/questions/1527305/disable-hardware-software-interrupts#comment126115840_1527305)
  - but it is [not recommended p8](https://www.cs.unc.edu/~porter/courses/comp530/f16/slides/locking.pdf)
  - more detailed about "atomic read-modify-write" see [COD_RISCV_2nd_A_appendix].
- > By *turn-ing off interrupts* (using some kind of special hardware instruction)

  [`sti`](https://stackoverflow.com/a/1581729/21294350). The single instruction ensures the atomicity somewhat.
  - Notice [intel_64] p762, `cti` will *not disable all interrupts*.
- interrupt flag [only to one CPU](https://en.wikipedia.org/wiki/Interrupt_flag#Multiprocessor_Considerations)
- > turning off interrupts for extended periods of time can *lead to interrupts becoming lost*,

  This depends on how the hardware is [implemented](https://www.embeddedrelated.com/showthread/comp.arch.embedded/272867-1.php).
  > The interrupt controller will have *lots of interrupt flags*, but generate a few general interrupts of different priorities.

  > For example, the interrupt controller might not have flags for all the different sources (UART, SPI, Timers, etc.), but have *a single flag* and an "interrupt number" register which holds the number or vector of source of the interrupt

  - TODO but [this](https://stackoverflow.com/a/31493261/21294350) "interrupts do not get lost".
- From [this](https://web.stanford.edu/class/cs111/spring22/lectures/threads/) "changing the thread currently running on a core" <a id="whether_thread_real_concurrent"></a>
  > e.g. execute one thread while the other is *waiting on a cache miss*

  the core *can't actually totally simultaneously* run multiple threads in one core. See CUDA architecture [image](https://fabiensanglard.net/cuda/tesla2.svg) or TURING from [this](https://fabiensanglard.net/cuda/) where register file may be not totally shared (After all, The GPU architecture changes more frequently than CPU. See [asm_md] and [COD_md])
  - So 
    > where the thread that the waiter is waiting for cannot even run (at least, until a context switch oc-curs)!

    the spin will *continue until* the context switch which is somewhat a waste.
  - Also see
    > each of those threads will spin for the duration of a *time slice* before giving up the CPU, a waste of CPU cycles.

  - So
    > The problem gets worse with N threads contending for a lock; *N − 1* time slices may be wasted in a similar manner

    maybe we can run *more threads than the physical threads*, and let the scheduler give us *illusion* that they are concurrent.
    i.e. [ostep_book] section 1 virtualization.
  - After all, even the hardware has *independent threads in different cores*
    > Even if you have four cores and four working threads, your process and it threads will constantly be being *switched out* for other *processes and threads*

    The OS maybe [can't schedule concurrently to all cores](https://stackoverflow.com/questions/3126154/multithreading-what-is-the-point-of-more-threads-than-cores/3126400#3126400). Although maybe they are left running insied the hardware when switching out.
    - TODO
      > you might if it's running *real-time*, if you're using a realtime OS 

- `new = TestAndSet(old_ptr,new)` will does [`xchg`](https://www.felixcloutier.com/x86/xchg)
- p7
  here `turn` will be only valid in one thread (because of instruction atomicity) -> mutex.
  > assuming they are atomic with respect to each other, which was true on early hardware

  But the `spin` is still the problem.
  - when one `unlock`, the `&&` with `flag[1-self] == 1` will exit the `while`.
  - > algorithms like the ones above don’t work on mod-ern hardware (due to **relaxed memory consistency models**)

    because the `while` and `turn = 1 - self;` may be reordered.
    - TODO how the final solution avoids this problem.
      - at least `TestAndSet` avoids the loadstore reorder.
- the `Set` in `TestAndSet` obviously solves the interrupt problem in "Figure 28.2".
  - The key is that it offers *atomicity* (imply mutex), So it can function as one lock.
- > as a thread spinning on a CPU will never relinquish it

  as section 1 says, it has no interrupt, etc., to let the OS take control.
- "Figure 28.5"
  `LoadLinked` hides the set of link bit, See [MIPS_DOC] p319.
  - although the book
    > if it fails, the value at ptr is not updated and *0 is returned*.

    while in [MIPS_DOC] p320
    > The success or failure of the SC is *indicated in the target register* of the store.

    i.e. `r3=0?`
- > If the same people had twice as much time

  because
  > go back, *rewrite*, and make the code as clear and con-cise as possible.

  So they
  > produce as good of a system in *half the code*.

- > Once a thread is assigned its ticket value, it will be *scheduled at some point* in the future

  because of the `FetchAndAdd` atomic property, each thread will get one *unique* `myturn`.
  And then `unlock` will schedule them ~~evenly~~ sequentially -> "FIFO service" in [MS91].
- main problem with "priority inversion" is 
  > T1 only runs when T2 is not able to do so

  where T2 *can't be switched out*.
- > If T2 starts to run, it will have higher priority than T1, and thus it will run.

  ~~maybe due to the scheduler which schedules T2 *instead of* T3 although priority of T3 is higher than T2 after T1 released.~~
  This is due to T2 [doesn't acquire the lock](https://en.wikipedia.org/wiki/Priority_inversion) which is implied by "Just *avoiding* the use of spin locks".
  > M being higher in priority than L, preempts L (since M does *not depend on R*),

  -> priority *inversion*
  - T3 -(blocked due to spinlock)> T1 -(blocked due to priority)> T2
  - Here [M15](https://mjtsai.com/blog/2015/12/16/osspinlock-is-unsafe/) only says about the existence of problems on MACOS, but not detailed about definition of "priority inversion".
  - above means same as [R97](https://www.cs.unc.edu/~anderson/teach/comp790/papers/mars_pathfinder_long_version.html)
    > The higher priority bc_dist task was blocked by the much lower priority ASI/MET task that was holding a shared resource. The ASI/MET task had acquired this resource and then been *preempted by several of the medium* priority tasks.

    This ends up
    > declared the error that initiated the *reset*.

  - solved by 
    1. [Priority inheritance](https://en.wikipedia.org/wiki/Priority_inheritance)
       > With priority inheritance, L will execute its critical section at H's high priority whenever H is blocked on the shared resource. As a result, M will be *unable to preempt L* and will be blocked.

    2. > A last solution is simplest: ensure all threads have the same priority.


      ~~although no inversion, but deadlock seems to be *still* there.~~
      So the scheduler can *switch normally*.
    3. > avoid us-ing spin locks

- [OS's](https://www.reddit.com/r/asklinguistics/comments/hj66gp/comment/fwkhoax/?utm_source=share&utm_medium=web2x&context=3) although [this](https://www.techtarget.com/whatis/feature/Which-is-correct-OSs-OSes-or-OSs)
### "28.14 Using Queues"
- maybe same as the "ticket lock" because of FIFO.
- `m->guard` ensures the atomicity of operations done in `lock` and `unlock`.
  `m->flag` controls the queue.
  - > (just a few instructions inside the lock and unlock code, instead of the user-defined critical section)

    - here `m->guard = 0` is called at the end both in `lock` and `unlock`
      So no spinlock.
    - and `m->flag` and `(un)park` function as the original mutex. See "Figure 28.3".
    - Here `m->guard = 0;` before `park()` 
      because the thread has done the *critical section before `park()`* and now its sleep can be interrupted *without influencing the correctness*.
      - > What would happen if the release of the guard lock came after the park()

        If not before, `m->guard` won't be released.
- > might be interrupted while acquiring or releasing the lock

  i.e. interrupted when `beq` after the atomic `TestAndSet`.
- > just pass the lock directly from the thread releasing the lock to the next thread acquiring it

  i.e. the unparked thread continues after its original `park`.
  not return from interrupt to `PC` like other interrupts but to `PC+4` if park instruction is 4 bytes where `PC=PC(park)`.
- > perceived race condition

  i.e. the thread process *order* may matter.
  - > wakeup/waiting race.

    due to the unatomicity of `queue_add(m->q, gettid()); ... park();`
    if `queue_add(m->q, gettid());` -> `unpark(queue_remove(m->q));` -> `park();` <a id="bad_queue"></a>
    then the added queue member is *no use at all* because `unpark` -> `park();` 
    instead of the expected `park();` -> `unpark`.
    - means same as
      > another thread calls unpark before park is actually called

    - > take precautions to atomically release the lock and de-queue the running thread

      TODO this seems to not solve with the above queue [problem](#bad_queue).
### 28.15 Different OS, Different Support
- [XSI](https://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap02.html)
- futex [futex_example]
  - [`IPC_CREAT | 0666`](https://stackoverflow.com/a/49718138/21294350) more detailed see [`man 2 shmget`](https://man7.org/linux/man-pages/man2/shmget.2.html) (from [this](https://stackoverflow.com/questions/40380327/what-is-the-use-of-ipc-creat-0666-flag-in-shmget-function-in-c#comment91515155_40380327)) and `man 2 shmctl`
  - TODO [`CLOCK_REALTIME`](https://stackoverflow.com/a/3527632/21294350) may be influence by [timezone](https://smallbusiness.chron.com/change-system-date-time-linux-79090.html)
  - relation with `lock`
    > It then may pass the *lock's flag* as a futex *word*

    > The *uaddr* argument points to the futex word

  - example 1 `wait_on_futex_value`
    Notice: here still has the spinlock.
    - `int futex_rc = futex(futex_addr, FUTEX_WAIT, val, NULL, NULL, 0);` will always return error if `*futex_addr` not set to `val`
      > If the futex value  does  *not  match val*, then the call fails *immediately with the error EAGAIN*.

      Then `while (1)` spinlock.
    - > if so, then sleeps waiting for a FUTEX_WAKE operation on the futex word.

      and the blog
      > The waiting is efficient - the waiters are suspended by the kernel and are *only scheduled anew* when there's a wake-up signal.

      This makes the scheduler more efficient because of no time slice limit, i.e. it can switch immediately after sleep and 
    - > if the other thread executed a FUTEX_WAKE operation (or similar wake-up) *after the value change* and before this FU‐TEX_WAIT operation, then the calling thread will observe the value change and will not start to sleep.

      because `FU‐TEX_WAIT` is not one signle atomic instruction, it may have the above similar [behavior](#bad_queue), So the **re**observation of "the value" is important.
  - example 2 "Using a futex to implement a simple mutex"
    - `cmpxchg`: 
      [`atomic_compare_exchange_strong`](https://en.cppreference.com/w/cpp/atomic/atomic_compare_exchange)
      > Otherwise, loads the actual value pointed to by obj *into *expected* (performs load operation)

      - So if comparison with `expected` succeeds, 
        `cmpxchg` *return* `*ep` which is original input `expected`
        `atom -> desired`.
        - otherwise, *return* `atom`.
      - summary of `ret = cmpxchg(std::atomic<int>* atom, int expected, int desired)`:
        1. comparsion equal (`*atom=expected`)
          `ret=expected,*atom=desired` i.e. `ret=0` for `cmpxchg(&atom_, 0, 1)`.
        2. unequal
          `ret=*atom!=expected` i.e. `ret!=0` for `cmpxchg(&atom_, 0, 1)`.
        From above `ret=*old_atom`
      - then 1st thread go outside `if (c != 0)`
        NOTICE: here `thread` is count `lock` call instead of the real thread counts.
        here `*atom_=1` means
        > 1:  acquired with no waiters

        - 2nd `if (c == 2 || cmpxchg(&atom_, 1, 2) != 0)` fails but due to short-circuiting boolean, 
        `atom_ -> 2` and `cmpxchg(&atom_, 1, 2) != 0` will only succeed when `*atom_=0` which seems to Only
        work when `atom_.store(0)`.
          - here `atom_ -> 2`
            > >1: acquired, possibly with waiters

            then it will enter sleep because of `*atom_=2`
          - `atom_.fetch_sub(1)` will make `atom_=0` if originally `1`
            - otherwise (i.e. here `atom_=2`), `atom_.store(0)` to make it reinitialized.
              then `FUTEX_WAKE` to wakeup the waiting thread.
              - `0, 0, 0` in `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` due to
                > The arguments timeout, uaddr2, and val3 are ignored.

            - Then `c = cmpxchg(&atom_, 0, 2)` will work
              Although it may do more work when no other threads are waiting,
              but if using `c = cmpxchg(&atom_, 0, 1)`, then `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` won't run when other threads are waiting by `syscall(SYS_futex, (int*)&atom_, FUTEX_WAIT, 2, 0, 0, 0);`. So incorrectness.
              ~~here `2` because `int c = cmpxchg(&atom_, 0, 1);` will set `atom_` to `1`, so~~
              ~~`c = cmpxchg(&atom_, 0, 1)` is also fine.~~
              - it also updates `*atom_` to `2` to make subsequent `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` available.
        - 3rd ~~is same as above 2nd~~
          ~~due to `int c = cmpxchg(&atom_, 0, 1);` where `c=,*atom)=1` for `*atom_!=0`~~
          when the above 2 not exits
          `int c = cmpxchg(&atom_, 0, 1);` will make `c=*atom_=2`, then "shortcut checks" and `syscall(SYS_futex, (int*)&atom_, FUTEX_WAIT, 2, 0, 0, 0);`.
        - above 3rd all same as 3rd.
        - dequeue 
          - before 2 threads
            Here "thread_{n-1}" is just one assumption.
            `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` -(exit one "thread_n")> `c = cmpxchg(&atom_, 0, 2)` -("thread_{n-1}" exit lock and into critical section; update `*atom_` to 2)> `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` due to `*atom_=2` -> ... loop as before.
          - same as above, but here at last `atom_.store(0);` restore to init which won't be modified by `c = cmpxchg(&atom_, 0, 2)` and `syscall(SYS_futex, (int*)&atom_, FUTEX_WAKE, 1, 0, 0, 0);` wakeup nothing (i.e. return `0`).
      - TODO
        [1](https://github.com/eliben/code-for-blog/blob/master/2018/futex-basics/mutex-using-futex.cpp)
        > (a) the mutex was in fact unlocked (by an intervening thread).

  - [relation](https://news.ycombinator.com/item?id=30276144) with mutex (i.e. lock)
    > Since it's not a lock, *the value of the flag is not guaranteed* to be certain value when futex() returns.

    not 0 or 1 definitely, So above 0,1,2.
    - [Also](https://qr.ae/pyE9Nu) see
      > it is a basic synchronization primitive which is *used to construct complicated synchronization constructs* like mutex, condition variables,

  - [why](https://www.collabora.com/news-and-blog/blog/2022/02/08/landing-a-new-syscall-part-what-is-futex/#:~:text=Futex%3A%20fast%20userspace%20mutex,design%20feature%20of%20the%20futex.) use it
    > doing syscalls requires *expensive context switches*

    So above use `shmat` to bring into the "the address space of the calling process".
    > Most of the time, it *doesn't need the kernel*, so we have less context switch and can have a lightweight mutex implementation.

    - it offers one example without the waiting queue but just the lock.
- > more in-kernel functionality

  TODO does it mean that [futex_example]
  > a queue the *kernel manages* for userspace convenience.

  i.e. "per-futex in-kernel queue" in the [ostep_book].
- Figure 28.10
  - > First make sure the futex value ...

    because the scheduler may interrupt the `mutex_lock` in thread_2 after the 2rd `atomic_bit_test_set (mutex, 31) == 0` and then `atomic_add_zero (mutex, 0x80000000)` in thread_1.
    So we need to retest `v = *mutex;`
  - `lowlevellock.h` in glibc-2.9 which is [issued in 2008](https://sourceware.org/glibc/wiki/Glibc%20Timeline) [github](https://github.com/bminor/glibc/blob/glibc-2.9/nptl/lowlevellock.h) or [bootlin](https://elixir.bootlin.com/glibc/glibc-2.9/source/nptl/lowlevellock.h) (the following based on bootlin to explain)
    - [`lll_futex_timed_wait`](https://elixir.bootlin.com/glibc/glibc-2.9/source/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.h#L211) or [github](https://github.com/bminor/glibc/blob/f52bb4d77eee0b7805ad57c069f29b544baa2db7/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.h#L211)
      - TODO
        ~~- `__to` meaning~~
        - [`__typeof`](https://github1s.com/bminor/glibc/blob/glibc-2.9/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.h#L208)
      - [`__asm`](https://stackoverflow.com/questions/3323445/what-is-the-difference-between-asm-asm-and-asm#comment72722149_3323445) is similar to `asm`
      - `"0" (SYS_futex)` [meaning](https://stackoverflow.com/a/57485860/21294350) and [doc](https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Input-Operands) <a id="asm_extended_input_digit"></a>
        > The resulting asm will print the *same register name twice*, for both %0 and %1

        here `SYS_futex` is also stored in `a` register like `rax` same as`__status`.
      - `register` for [Local Variables](https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html)
      - [`asmSymbolicName`](https://stackoverflow.com/a/32132496/21294350) is to help human understanding.
      - `__status;` just [ignore](https://stackoverflow.com/a/45576794/21294350) it.
      - `"r11"` in [Clobbers](https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1) are just in the potential modified register list.
        - [`"cx"`](https://stackoverflow.com/a/7215151/21294350) -> [this](https://github.com/gcc-mirror/gcc/blob/80907b03c8e72cdcd597f1359fda21163ec22107/gcc/config/i386/i386.h#L1978)
      - after all, it just calls the `man futex` function with [`FUTEX_WAIT|FUTEX_PRIVATE_FLAG`](https://elixir.bootlin.com/glibc/glibc-2.9/source/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.h#L63) although `LLL_SHARED` seeems to be conflict with `FUTEX_PRIVATE_FLAG`
        > It tells the kernel that the futex is process-private and *not shared with another process*

        [See](https://github.com/bminor/glibc/blob/d2123d68275acc0f061e73d5f86ca504e0d5a344/sysdeps/nptl/lowlevellock.h#L46C29-L46C52)
      - [newer version](https://github1s.com/bminor/glibc/blob/master/sysdeps/nptl/lowlevellock.h#L94-L95) is similar to this [example][futex_example]
        - `atomic_compare_and_exchange_bool_acq` -> [`! __sync_bool_compare_and_swap (mem, oldval, newval)`](https://gcc.gnu.org/onlinedocs/gcc-4.1.2/gcc/Atomic-Builtins.html)
          - return `0` if equal otherwise 1.
          - This ret same as the `cmpxchg(&atom_, 0, 1)` from the perspective of boolean.
        - [`__lll_lock_wait`](https://github1s.com/bminor/glibc/blob/master/nptl/lowlevellock.c#L40-L41) just use the different ~~flags~~ options from `__lll_lock_wait_private`
          - [`__atomic_exchange_n`](https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html#index-_005f_005fatomic_005fexchange_005fn)
          - `atomic_exchange_acquire (futex, 2) != 0` is same as `cmpxchg(&atom_, 1, 2) != 0` but the former doesn't care about whether it is 1 
            because 
            1. `atomic_load_relaxed (futex) == 2` has excluded `futex=2`
            2. `__glibc_unlikely (atomic_compare_and_exchange_bool_acq (__futex, 1, 0)))` has excluded `futex=0`.
            3. `futex` can be only 0,1,2 from the `lowlevellock.h` -> it must be `1`.
          - TODO `__NR_futex` meanging which depends on the syscall cfg similar to xv6.
          - [`__builtin_constant_p`](https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005fconstant_005fp)
        - [`## __VA_ARGS__`](https://stackoverflow.com/a/52891776/21294350) Also [see](https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html)
        - diff with glibc-2.9
          it doesn't count but just *let the kernel manipulate* the waiting queue.
          - the count implies ["two-phase lock"](https://en.wikipedia.org/wiki/Two-phase_locking#Two-phase_locking)
            - IMO it is more like "Figure 28.9" instead of "Figure 28.10" where only uses `while` to avoid spurious wakeup.
              This is implied in the book
              > The Linux lock above is a form of such a lock, but it *only spins once*;

              - the "Figure 28.9" has "Queues" -> count
                and `while (TestAndSet(&m->guard, 1) == 1)` spining to get the lock to sleep or get the flag.
              - > spin in a loop for a *fixed amount of time before* using futex support to sleep.

                maybe avoid the frequent *context switch overheads*.
              - > where combining two good ideas

                i.e. spin and sleep & wakeup.
              - > including the hard-ware environment, number of threads, and other workload details.

                threads on different cores are probably not influenced by context switches on one CPU.
                workload vs sleep & wakeup overhead, i.e. whether the former can amortize the latter.
            - TODO Here in the book both phases are related with `acquire` while the above wikipedia are one for acquire and the other for release.
          - TODO [M82](https://www.smecc.org/The%20Architecture%20%20of%20the%20Burroughs%20B-5000.htm)
### 16 two-phase lock
- here "spinning" may refer to "futex_wait (mutex, v)" which sleeps waiting for the wakeup.
- Also above "two-phase lock"
## Lock-based Concurrent Data Structures
- see [asm_md] for "thread safe".
- ["monitor"][monitor_synchronization] which references [H74] same as the before "Figure 28.9" where uses signal to wakeup.
  Notice from [this](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Solving_the_bounded_producer/consumer_problem), "monitor" is not one primitive but one which the programmer can manually ~~tune~~ design.
  - the 2rd link is the detailed implementation of 1st.
  - here `queue` implies "general semaphores".
  - definition
    > a monitor is a synchronization construct that allows threads to have both mutual exclusion and the ability to wait (block) for a certain condition to become false. 

    this is trivial by just using `m` and `cv`
    > A monitor consists of a mutex (lock) object and condition variables. A condition variable is essentially a *container* of threads that are waiting for a certain condition. 

    implied by `wait(m, cv);`. "move this thread to cv's //			// wait-queue so that it will be notified"
    - > Monitors also have a *mechanism* for signaling other threads that their condition has been met. 

      `signal(cv2); // Or: broadcast(cv2);`
    - `wait`
      > Monitors provide a mechanism for threads to *temporarily give up* exclusive access in order to wait for some condition to be met, before regaining exclusive access and resuming their task.

      "// release(m) 		// Atomically release lock "m" so other" and then "*Context switch*".
      - > At some future time ... wake this thread up

        "// This thread is switched back to on some core." implies maybe
        > // During this time, other threads may cause the condition to

        > // become *false again*

        So we need "re-check the "while" loop condition".
        i.e.
        > *between* the time that I was woken up *and* the time that I re-acquired

        > // the lock inside the "wait" call in the last iteration of this loop

        - [ostep_book]
          > While this does not seem strictly necessary per the logic of the program, it is always a good idea, as we will see below.

          avoid weird check failures.
      - so more specifically, "unlock->wait->lock"
        also see [ostep_book] C30-5.
      - > either from before entering the monitor

        means before calling `wait` to wait for monitors to wake.
      - ~~TODO~~ "the monitor *semantic* type being used.".
        maybe whether `broadcast` or `signal`
        See [ostep_book]
        > hold the lock when calling wait, is not just a tip, but rather *mandated by the semantics* of wait

        i.e. API of `wait`.
  - above wikipedia references [BH73](https://en.wikipedia.org/wiki/Monitor_(synchronization)#cite_note-:0-1)
- `counter_t *c` should be unique to every thread and `NUMCPUS=thread_num_per_CPU`.
- `pwndbg` source code references [this](https://github.com/giampaolo/psutil/pull/1727#issuecomment-707624964) which recommends `cat /sys/devices/system/cpu/cpu0/topology/core_cpus_list` to get thread_id relation instead of [`cat /sys/devices/system/cpu/cpu0/topology/thread_siblings_list`](https://stackoverflow.com/a/7812183/21294350).
  ~~This implies using `threadID % NUMCPUS;` to get thread_id in the core.~~
- "List_Insert" inserts *before* the list.
- "Figure 29.8" avoids using `pthread_mutex_unlock(&L->lock)` in conditional statement `if ...`
- [S+11]
  - From "Table 2", here just the higher failure probability will incur *higher probability* that "Aborting a process, inconsistent file-system state, and unusable file system" occur.
  - See "2.3.1 Summary" for "code paths" relation 
    > *propagate the error up* to the appropriate error-handling location

    So the *shorter code path* will be *safer*.
  - modified `List_Insert` similar to "Figure 2" but the latter will 
    > transparently *redirected to use the pre-allocated* chunks

  - `List_Lookup` is not related with memory allocation. So no relation with the paper.
    It just *avoids frequent call to kernel*.
    > decreases the chances of accidentally introducing bugs (such as forget-ting to unlock before returning)

  - > assuming that malloc() itself is thread-safe

    important property to move outside the critical section.
- > you instead add *a lock per node* of the list

  just similar to 
  > numerous local physical counters, *one per CPU core*

- > first grabs the next node’s lock and then releases the current node’s lock

  the order is important to *continue traversing* to avoid exiting too early.
- `queue` add `tail` based on the `list`
- "Figure 29.9"
  - here `Queue_Dequeue` can be similar to `Figure 29.8` by using `rv=-1;goto label` but needs to skip `free(tmp);`.
  - at least `Queue_Enqueue` and `Queue_Dequeue` can be parallel
    > to enable concurrency of enqueue and dequeue operations.

    but multiple `Queue_Dequeue`s can't except that these operations are combined TODO.
  - > Because of the dummy node, enqueuers never have to access Head, and dequeuers never have to access Tail, thus avoiding deadlock problems that might arise from processes trying to acquire the locks *in different order*

    just means same as the book *two different locks*.
    "different order" is also implied in csapp "Figure 12.44".
    >  allows more concurrency by keeping a *dummy node at the head* (dequeue end) of a singly linked list

    the "dummy" is based on "list". See "Figure 29.8" where *only one* end node exists.
    - "compare-and- swap " is read-modify-write. So it avoids [ABA](https://en.wikipedia.org/wiki/ABA_problem)
## Condition Variables
this chapter only shows how to use `Pthread_cond_wait(&c, &m);` which is important for "synchronization" based on *Mesa semantics*, but not shows how `c` is implemented detailedly.
- in [linux](https://github1s.com/bminor/glibc/blob/master/sysdeps/nptl/bits/pthreadtypes.h#L75-L76). Use `gdb` to check the definition between 2 options when `F12`
  ```c
  typedef union
  {
    struct __pthread_cond_s __data;
    char __size[__SIZEOF_PTHREAD_COND_T];
    __extension__ long long int __align;
  } pthread_cond_t;
  ```
  - TODO detailed
    maybe `atomic_fetch_add_release (cond->__data.__g_refs + g, -2)` implies queue.
- > hardware and OS support.

  "hardware primitives" i.e. atomic instruction and OS data structures which stores the lock state.
- > whether a condition is true before continuing its execution

  ~~like predicate~~
- > hugely inefficient as the parent spins

  similar to before, maybe sleep instad of spin.
- > useful for a thread to wait for some condition to become true before proceeding

  i.e. synchronization in CUDA.
- > waiting on the condition

  similar to `futex_wait` before.
- `pthread_cond_wait(pthread_cond_t *c, pthread_mutex_t *m);` is ~~similar to~~ same as the internal sematics of[monitor_synchronization] `wait(m, cv);`.
  - it has been said in "Locks" section because of the waiting operation.
- > the state variable done

  implies the order because of the predicate `while (done == 0)`.
- > sleeping, waking, and locking

  where lock is implied by sleep.
- > What problem could occur here? Think about it1

  child thread may not finish when the parent thread finishes.
  i.e. `done = 1;` -> `if (done == 0)` block is skipped and then "parent thread finishes" but `Pthread_cond_signal(&c);` doesn't run.
  - the book offers one example where `wait->wake` order is violated same as "Figure 30.4".
- Notice project "processes-shell" doesn't have have pipe function.
  - although in the [ostep_hw] it uses pipe with `fork` in section 1
    where `read(first_pipefd[0], NULL, 0);` implies wait which causes the context switches then implied by OS.
    See [table 2](https://www.linuxtoday.com/blog/blocking-and-non-blocking-i-0/#:~:text=By%20default%2C%20read()%20waits,if%20no%20bytes%20are%20available.) which shows `read` relation with `fd` flags (whether `O_NONBLOCK` which can be controlled by `fcntl` is enabled). <a id="O_NONBLOCK"></a>
    - `O_NONBLOCK` influences
      1. "Reading from Empty Pipes"
        - TODO
          > and is not present if the file is blocking.

      2. > but the semantics of opening device files can also change when O_NONBLOCK is specified

        i.e. `man 2 open`
        > that is, I/O operations will (*briefly*) block when device activity is  required ... Since O_NONBLOCK semantics might eventually be implemented

      3. > If O_NONBLOCK is specified when opening a named pipe for writing, the open() will return *immediately*

    - [mode](https://www.gnu.org/software/libc/manual/html_node/Opening-and-Closing-Files.html)
- "in-kernel bounded buffer" can be implemented by `pipe`
- why "Figure 30.6" use `assert` to directly exit when failure?
  because
  > Now we need to write some routines that know when it is OK to access the buffer to either put data into it or get data out of it.

  lock is manipulated outside.
- > However, putting a lock around the code doesn’t work; we need something more.

  because deadlock (See Figure 30.8). similar to [this](#P_V_deadlock) but not totally same.
  But after all, they are both due to [this](#deadlock_circular_wait).
  ~~Here `consumer` may be stuck at `Pthread_cond_wait` while `producer` is stuck at `Pthread_mutex_lock`.~~
  - > if we have more than one of these threads (e.g., two consumers), the solution has two critical problems

    ~~1. deadlock, one consumer release the lock when `Pthread_cond_wait` while the other consumer locks it but won't signal. Then the producer is also locked.~~
    ~~2. same for 2 producers and 1 consumer.~~
    Notice `Pthread_cond_wait` implies release of the lock.
  - ~~They both correspond to~~ the book *2rd problem* ~~(i.e. lack `m->guard`).~~
    > It has something to do with the fact that there is *only one condition* variable.

    See "Figure 30.11" "Oops"
  - The book *1st problem* is failure to check the count which *may be modified by another consumer* between `Pthread_cond_signal` and its self `get()` due to *undetermined context switches*.
    See "The problem arises for a simple reason ..."
    > but there is no guarantee that when the woken thread runs, the state will still be as desired.

    i.e. wakeup may be interrupted.
    - ["Mesa semantics"](https://samuelsorial.tech/mesa-vs-hoare-semantics) -> from waiting to ready *instead of running*.
      "Hoare semantics" -> atomic so from waiting to running.
      So
      > using a while loop is *always correct*; using an if statement only might be, de-pending on the semantics of signaling.

- "Figure 30.12" relation with [EWD_35] figure 3.
  `fill,empty` -> `LA,LB` and `AP` -> `mutex` (but `mutex` has no alternation function because the always pair `lock,unlock`)
  - Since "Figure 30.8" has `mutex` and figure 1 in [EWD_35] has used `while`
    their improvement process has no overlap.
    because "figure 1" -(change lock location to acquire early)> "figure 2" -(add mutex/AP)> "figure 3"
    "Figure 30.8" -(use while to avoid *spurious* wakeup)> "Figure 30.10" -(differentiate cond to avoid wakeup to the *wrong* target)> "Figure 30.12"
- [spurious wakeups](https://stackoverflow.com/questions/8594591/why-does-pthread-cond-wait-have-spurious-wakeups#comment135830591_11517091). See [this](https://stackoverflow.com/a/77050523/21294350) for more.
  > The second was that it wasn't difficult to abstractly imagine machines and implementation code that could *exploit this requirement to improve* the performance of average condition wait operations through optimizing the synchronization mechanisms.

  i.e. sometimes if we know there is no possibility for "spurious wakeups" then we can *skip* the check.
  if the check is just in the `pthread_cond_wait` then the skip may be difficult.
  > making condition wakeup *completely predictable* might substantially slow all condition variable operations.

- "Figure 30.14" probably has redundant `Pthread_cond_signal`s sometimes because the `while` condition is stricter to meet.
  So
  > as it reduces context switches

  - > with multiple producers or consumers (or both)

    i.e. ~~multiple `mutexes`~~ switch to another `producer` or `consumer` before into next for-loop -> concurrency.
- > Unfortu-nately, when it calls signal to wake a waiting thread, it might *not wake the correct waiting* thread

  means in [LR80]
  > If, however, the monitor calls some other procedure which is outside the monitor module, the *lock is not released*, even if the other procedure is in (or calls) another monitor and *ends up doing a WAIT*.

  - > with a call to pthread_cond_broadcast(), which wakes up all waiting threads

    means [LR80]
    > On the other hand, there are times when a BROADCAST is correct and a NOTIFY is not

  - > covering condition, as it covers all the cases where a thread needs to wake up (conservatively);

    means `pthread_cond_broadcast()` covers all cases
    Also see [LR80]
    > It is better to use NOTIFY if there will typically be several processes waiting on the condition, and it is known that *any* waiting process can respond properly.

- > see the producer/consumer problem with only a single condition variable

  i.e. See "Figure 30.10" binary `count` -> so only one choice then `pthread_cond_broadcast` functions same as `pthread_cond_signal`.
### [LR80]
same as above "samuelsorial" says.
TODO As the introduction says, it solves many problems.
- Hoare semantics
  > This definition allows the waiter to assume the truth of some predicate stronger than the monitor invariant

  here assume the atomic while ["the monitor invariant"](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Condition_variables_2) is ~~only what needs to be checked which has no constraint of check time/latency.~~ ~~only the `lock` but not what to do after the `lock`.~~ the atomicity which ensures the enqueue into "sleep-queue" and *lock*, but *not exact their running time.*
  > but is given priority over threads on the entrance queue.

  - > several additional process switches

    i.e. switch to the wait thread after the scheduler didn't schedule the wait thread as expected.
  - From the [H74], it uses one [`s` queue](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Blocking_condition_variables) to ~~ensure the signal order.~~ *first schedule the signaled* ones then the unsignaled ones in the queue.
    And `restart t` ensures the above "from waiting to running" semantics. So
    > the woken thread will run *immediately* upon being woken

  ```bash
  [czg /mnt/ubuntu/home/czg/csapp3e/Operating_System/code_test/pseudo_code]$ diff Nonblocking_Mesa_cv.c blocking_Hoare_cv.c
  +schedule:
  +    if there is a thread on s
  +        select and remove one thread from s and restart it
  +        (this thread will occupy the monitor next)
  +    else if there is a thread on e
  $ cat blocking_Hoare_cv.c 
  enter the monitor:
      enter the method
      if the monitor is locked
          add this thread to e
          block this thread
      else
          lock the monitor
  ...
  wait c:
      add this thread to c.q
      schedule
      block this thread
  ```
  here block means sleep from `wait c`.
  - > With a blocking condition variable, the signaling thread must *wait outside the monitor* (at least) until the signaled thread relinquishes occupancy of the monitor by either returning or by again waiting on a condition variable.

    here outside means "unoccupied".
    and the `restart t ... block this thread` in `signal c` is just manually designed to ensure *immediate* switch.
  - `signal and return` avoids `block this thread` in `signal` to add more threads to the queue `s` which will adds the overhead of `schedule`. So maybe better.
- "the monitor invariant" [detailed](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Blocking_condition_variables)
  ~~here `P_c` depends on what to do ~~
  > Thus each condition variable c is *associated with an assertion Pc*. While a thread is waiting on a condition variable, that thread is not considered to occupy the monitor, and so other threads may *enter the monitor to change the monitor's state*

  Then this [example](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Sample_Mesa-monitor_implementation_with_Test-and-Set)
  where `!c.waitingThreads.isEmpty()` in `signal` is $P_c$ (in bounded-buffer `!c.waitingThreads.isFull()` in `wait` may exist) and `testAndSet(threadingSystemBusy)` is `I` (i.e. *lock* -> monitor invariant)
  - in summary, `I` is more general constraint while $P_c$ is *more specific* to the target problem.
  - So
    > Hence nothing more than the monitor invariant may be assumed after a WAIT

    i.e. when it really is about to run, it *only ensures getting the lock* but the $P_c$ not ensured.
### [D68] with "private semaphores"
- ~~TODO~~ private means mutual in "private semaphores" ?
  maybe means it can be [only manipulated](https://pages.mtu.edu/~shene/NSF-3/e-Book/SEMA/basics.html) with `wait`,`wake`, So similar to the private member in c++ class.
  Also see [this](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Monitor_implemented_using_semaphores)
  - See [this](#private_semaphore) for the exact definition.
- > The semaphores are essentially *non-negative integers*; *when* only used to solve the mutual exclusion problem, the range of their values will even be restricted to "0" and "1"

  same as csapp
  this imply queue 
  > called "number of queuing portions".

- > The Producer/Consumer (Bounded Buffer) Problem

  the former is "a producer and a consumer coupled via a buffer with *unbounded capacity*.".
  the bouneded is due to `number of empty positions:= N;` which is also shown in csapp.
- > either a lock or a condition variable

  i.e. "binary semaphores" and "general semaphores"
### [D01]
#### interrupt
in summary, interrupt *increases efficiency of concurrency* when waiting for thread complete.
- "probe instructions" ~~is similar to~~ aims to function as `Pthread_cond_signal` but with less efficiency.
  > test whether a concurrent activity it had started earlier had, in the mean time, been completed

  because it is based on *definite* frequency
  - problems
    1. > Say that you would like to probe every 100 instructions, do you insert a probe instruction into a loop body of 10 instructions

       here 100 is based on the *binary program file* which obviously *can't know some runtime count*, so inserted inside the loop will make it running at higher frequency.
    2. > introduce each subroutine in two versions

  - solution by interrupt.
    > a piece of *dedicated* hardware monitors the outside world for completion signals from communication devices.

    > thus instantaneously freeing

    So *dynamic frequency*.
    > restore enough of the machine state so that, after the servicing of the interrupt, under all circumstances the interrupted computation could be *resumed* correctly.

  - How got
    > Halfway the functional design of the X1, I guess early 1957, *Bram and Carel confronted me* with the idea of the interrupt, and I remember that I panicked, *being used to machines with reproducible* behaviour.

#### EWD1303_semaphore
> generalize the one-character output register to an output buffer of any size.
- symmetry means
  > The exciting discovery was one of symmetry: just as the computer could be temporarily frozen because the typewriter *wasn't ready for the next type action*, so could the typewriter be temporarily frozen because the computer was not ready yet for the next type action;

  i.e. here small "output register" will blocks when filled
  so computer will block when "typewriter" is filled and vice versa.
  > just as the computer could have to wait until the output buffer was empty, the typewriter could have to wait until the output buffer was filled.

  - This highly shows the relation between `P` (decrement) and `V` (increment).
  - channel -> "dedicated hardware monitor"
    > our channels could be active concurrently with the CPU and as a rule their *activity was synchronized with the peripheral* they served.

  - > the one semaphore, indicating the length of the queue, was *incremented* (in a V) by the CPU and decremented (in a P) by the channel, the other one, counting the number of unacknowledged completions, was incremented by the channel and decremented by the CPU.

    i.e. V(S_1) -> P(S_1),V(S_2) -> P(S_2)
##### [terminology EWD-35][EWD_35] by [this](https://en.wikipedia.org/wiki/Semaphore_(programming)#Operation_names)
maybe [EWD74 (TODO english)](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD00xx/EWD74.html) better "*try* to reduce"
- TODO
  - > You should not ask me what's what, because I can not remember that, since having discovered that the logical problems, that they evoke by the non-sequentiality of the process definition, are in both cases exactly the same.

  - > provided we hereby state that the operation falsify, in spite of its sequential definition should be considered as a elementary instruction of the repertoire of machines.

    "elementary" -> atomic.
- Figure 1
  - problem
    > If *both machines are outside* their critical section – say somewhere in the block left blank – then both LA and LB false. If now *simultaneously they enter in their upper block*, they both find that the other machine does not impose any obstacle in their way, and they both go on and arrive *simultaneously in their critical section*.

- Fig. 2
  similar to "Figure 1" will "*simultaneously*" deadlock. <a id="P_V_deadlock"></a>
- solution to above 2 Figs.
  > Due to the *asymmetric* significance of this logical variable

  explicitly make them *unable* to process *totally* concurrently.
  i.e. here `AP` controls the order like `m->guard` and `LA,LB` control critical sections like `m->flag`. (similar to Figure 28.9)
- `non falsify (SX)` -> [`!p`](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Monitor_usage)
- `"LXi: if non falsify (SX) then goto LXi; TXi; SX := true; process Xi; goto Lxi"` lack how `SX` is manipulated (i.e. count machines)
  > We can play this with one common logical variable, say SX indicating that *none* of the machines is *executing its critical* path.

  > note, that in the programs for the separate machines Xi nowhere is it stated, *how many machines Xi actually exist*:

  - > The programmed wait cycle that exists herein, is of course very nice, but it did little to what our goal. A tiny wait cycle is indeed the way to keep a machine busy "without effect" .

    i.e. figure 1,2 `LA,LB?` loop
    same as [ostep_book] says.
    especially when multiple machines wait for only one machine which may cause the bottleneck.
    > at the expense of the effective speed of the other machines

    - So
      > To express this we introduce a *statement* instead of wait cycle

      Here `P` means *pass outside* instead of useless wait
      `V` release to dequeue.
      - Then
        > The operation V can now be considered as a combination of assigning the value true to a semaphore, *plus alerting* the central alarm clock on this event.

        > With the introduction of the P-operation as we more or less achieved, that we say to a machine, which *temporarily has to stop*, "Go to sleep, we will wake you up when you can progress."

        They are implied by
        > Because, when we still had the wait cycle using the operation falsify, the individual machines had the duty to detect the equalization to true of the common logical variables, which were waiting for the event and in that sense *waiting was a fairly active* business for a relatively neutral event.

      - in summary, `P()/V()` can be thought as `pthread_cond_wait()/pthread_cond_signal()`.
- > They have even invented different names for it, one called "parallel programming" and the other called “multi programming”.

  - the former implies concurrency
    > In the first case I mentioned the increasing complexity of machines, which now are composed of *a number of more or less autonomous working parts* with the assignment to work *together* to execute one process.

  - the latter implies context switch
    > In the second case, where we looked at the machine in a *so-called "real-time application"*, then we had a view of a *single device* that had the possibility, in case of a change in the external urgency situation, to *switch to the now most urgent* of its possible tasks.

    here real-time is what said in section 1 that no big latency.
#### [EWD6] which may be implied [here](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD10xx/EWD1000.html)
In summary, stack is used for recursion.
- terminology
  > I vividly remember my conscious search for a good name for the device, good in the sense that it would *yield both a noun and a verb.*

  > At the time, I worked in *Dutch* and came up with the noun "stapel" and the verb "stapelen",

- [anonymous variable](https://stackoverflow.com/a/47825583/21294350) may be one address in the *global data* region ~~like `.bss`~~ to store const data allocated when the program starts.
  - TODO meaning in EWD6
    maybe meaning it's not returned recursively, so anonymous from the top level.
- here link is just what [`jal`](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#jal) does.
## Semaphores
- > needs both locks and condition variables to solve a broad range

  the former mainly as the outer lock for mutual exclusion
  the latter is for synchronization.
- > one can use semaphores as both locks and condition variables

  so csapp only introduces `sem`.
- [EWD215](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD02xx/EWD215.html)
  - > The unbridled use of the go to statement has as an immediate consequence that it becomes terribly hard to find a *meaningful set of coordinates* in which to describe the process *progress*.

    > The go to statement as it stands is just *too primitive*, it is too much an invitation to *make a mess of one's program*.

    - solution -> `case`
      > Like the conditional, it mirrors the dynamic structure of a program *more clearly* than go to statements and switches

      i.e. the targets are more direct to view and understand.
    - [TODO](https://dl.acm.org/doi/pdf/10.5555/63445.C1104358)
      > The switch *declaration and the switch designator* have been abolished. Their place has been taken by the case construction, applying to both expressions and statements

      maybe drop [`switch I := (D₁, D₂, ..., Dₙ)`](https://eev.ee/blog/2016/09/18/the-curious-case-of-the-switch-statement/)
    - recommended usage.
      > I remember having read the explicit recommendation to restrict the use of the go to statement to *alarm exits*

  - > In [2] Guiseppe [sic] Jacopini seems to have proved the (logical) superfluousness of the go to statement

    although above
    > did I become convinced that the go to statement should be abolished from all "higher level" programming languages (i.e. everything *except —perhaps— plain machine code*)

    `jmp` is always there.
- ~~[D72] reference EWD instead of directly by EWD, so I ignored it.~~
- Also [see](#ewd1303_semaphore) and [see](#d68-with-private-semaphores)
- the [origin](https://news.ycombinator.com/item?id=8761539) of `P()/V()`
  - torvalds [with](https://yarchive.net/comp/linux/semaphores.html) semaphores
    [spinlock](https://www.baeldung.com/cs/spinlock-vs-semaphore) is just `lock` with `spin` as [ostep_book] shows. Also [see](https://stackoverflow.com/a/17221568/21294350)
    > one that is implemented by busy waiting ("spinning")

    - > I think the official explanation is that P and V are the first letters in some Dutch words, but I personally find the drug overdose story much more believable

      :)
  - [passering](https://news.ycombinator.com/item?id=8761654) begin
- ~~TODO~~ in csapp "1039" excludes the negative conditions because ~~it *only has two* threads to `P()/V()`~~ ~~, so if both stuck at ~~ ~~maybe because it ignores the context switches~~ ~~it just not allows this unsafe (but maybe valid) conditions by `if (sem_wait(sem) < 0) unix_error("P error");` and then `exit`.~~ `sem_wait` excludes it. (Not see "Figure 12.21" which has no sem protection.)
  > If  the  semaphore  currently  has the value zero, then the call *blocks* until either it becomes possible to perform the decrement

  See "Figure 12.44" for deadlock (where both threads block at the bottom-left corner of the "overlapping forbidden regions", i.e. both `sem` is `-1` as Figure 12.22 shows) which is not same as "Forbidden region".
  So "Forbidden region" can be avoided by `sem_wait` and it is *not one big problem* while deadlock can't be avoided *directly* by `sem_wait` without changing the *order*.
  - > wait if value of semaphore s is negative

    and [D68b] both allows "negative semaphore value".
    They means *implicit negative* (not truly negative due to the above `sem_wait` block semantics) by one waiting queue.
- `man sem_post`
  > If the semaphore's value consequently becomes greater than zero

  so if calling `sem_post` first, then no `sem_wait` wakeup.
  or more specifically and obviously, only `sem=0` implies the possible queue.
- >  assume that the actions they make are performed atomi-cally

  i.e. [D68b] indivisible actions
- [`sem_wait`](https://github1s.com/bminor/glibc/blob/master/nptl/sem_wait.c#L24)
  newer one first run `__pthread_testcancel` to directly [return and not scheduled recently in the future](https://stackoverflow.com/questions/27374707/what-exactly-is-a-cancellation-point#comment43199960_27374707) [because](https://www.austingroupbugs.net/view.php?id=1076)
  > the POSIX requirement that sem_wait should be a cancellation point regardless of whether it blocks

  - [Cancellation Points](https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xsh_chap02.html)
    > where a thread has to act on any *pending cancellation request* when cancelability is enabled

    - `pthread_cleanup_push` also take this in account.
  - [old ones](https://github1s.com/bminor/glibc/blob/master/nptl/sem_wait.c#L61-L62)
    1st check `atomic_decrement_if_positive (futex) > 0` but it will `return` if `__val <= 0`, so `sem<0` is *impossible*. (this is done by `(d & SEM_VALUE_MASK) == 0)` in the newer one) <a id="sem_neg_impossible"></a>

    then if `sem>0` fails, then just `lll_futex_wait_cancel` waits for wakeup.
  - `atomic_compare_exchange_weak_acquire` will use relaxed order by [`__atomic_compare_exchange_n ((mem), (expected), (desired), 1,__ATOMIC_ACQUIRE, __ATOMIC_RELAXED); }`](https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html#index-_005f_005fatomic_005fcompare_005fexchange_005fn) because there is no interested store at all (i.e. only write to the not interested `expected` but not `mem`. If `*mem== *expected`, then needs `acq` to ensure the real equal relation).
  - as the [comment](https://github1s.com/bminor/glibc/blob/master/nptl/sem_waitcommon.c#L123-L124) says, `__new_sem_wait_fast` won't sleep and it will return `-1` when failure so that `__new_sem_wait_slow64` will be called and may sleep.
    - TODO why `uint64_t d = atomic_fetch_add_relaxed (&sem->data,(uint64_t) 1 << SEM_NWAITERS_SHIFT);`
      maybe for understandable reading that highlight waiter number by `SEM_NWAITERS_SHIFT`?
- Figure 31.6
  - ~~TODO `sem_wait(&s)` should be before `Pthread_create` to ensure the `post` signal can be captured.~~
    `X` should be 0, then when `wait` 1st, it will be stuck and when `wait` 2rd it will decrease and return.
- > With the ordering case, it was 0, because there is nothing to give away at the start;

  with `lock`, `sem_wait` will hold the resource and *run 1st*.
  while `cond_t`, `sem_wait` won't hold the resource (because none of resources) and *run later*.
- Figure 30.11 has no `count` compared with Figure 30.11 because it is implied in `sem` which will *increase/decrease* and check the condition.
- > waits for a buffer to become empty in order to put data into it

  means stuck when `empty=0`.
  "become empty" -> `empty>0` implies `true`.
- Figure 31.10
  - the `sem_wait` and `sem_post` pair ensures the order of the sequences of critical sections excluding the race conditions because only one producer/consumer can wakeup.
    Here *scheduler can't* wakeup `sem_wait(&full);` ~~even between `put(i);` and .~~ and only corresponding `sem_post(&full)` can.
  - > You can try this same example with more threads (e.g., multiple pro-ducers, and multiple consumers). It should still work.

    TODO so why [this](#undesirable_bounded_buffer)
- > We now have a problem: a race condition

  maybe `buffer`.
- Figure 31.11
  deadlock similar to [this](#deadlock_circular_wait)
  one hold the `mutex` waiting for `&empty` while others which can signal `&empty` is blocked due to `mutex`.
  same as p10.
- > as long as we can guarantee that no insert is on-going, we can allow many *lookups to pro- ceed concurrently*.

  This is the difference between Reader and consumer.
- The Reader-Writer Lock in [CHP71] is just one specific application of `sem` and we can tune the `sem` as we expect. So I ignore the paper [CHP71]
  "Figure 31.13" is same as csapp "Figure 12.26". But the former is better because it explicity manipulates with the only structure `rwlock_t`.
  here only the first lock `sem_wait(&rw->writelock);` -> readers can be concurrent.
  And `sem_wait(&rw->lock);` locks access to `rw->readers`.
- > This approach works (as desired), but does have some negatives, espe-cially when it comes to *fairness*.

  same as the csapp 12.20 homework. See two [12.20_fair*](https://github.com/czg-sci-42ver/CSAPP-3e-Solutions/blob/master/site/content/chapter12/code/12.20_fair_only_two_sem.c) codes and my [comments](https://dreamanddead.github.io/CSAPP-3e-Solutions/chapter12/12.20/#comment-6273427059).
  > prevent more readers from entering the lock *once a writer is waiting.*

  similar to csapp 12.19 homework (See my [fix code](https://github.com/czg-sci-42ver/CSAPP-3e-Solutions/blob/master/site/content/chapter12/code/12.19_fix.c)), but "stronger priority to writers" instead of readers.
- "Big" meaning in "Big and dumb is better" in [H87](https://www2.eecs.berkeley.edu/Pubs/TechRpts/1987/CSD-87-381.pdf)
- > The contention for these forks, and the *synchronization* problems that *ensue*

  i.e. ~~synchronization -> `P (mutex);` in [D71] to ensure the atomic modification of state variable related with the *contention*~~
  > We’ll also need some semaphores to solve this problem. Let us assume swe have five, one for each fork: sem t forks[5].

  similar to `P(prisem[w]);` but the latter is based on philosopher instead of the fork lock.
  - TODO 
    > indeed, this is how Dijkstra himself solved the problem

    Dijkstra all use the same `test` and it use philosopher lock to implicitly lock the two forks.
- > Following Downey’s solutions [D08]

  but `return (p + 1) % 5;` is already shown in [D71].
- > Think through the ramifications of this solution

  - obviously the deadlock is only possible to happen when all philosophers hold only one lock
    otherwise, if one holds two, it can proceed and release to avoid the deadlock (i.e. one endless waiting cycle)
    - so the deadlock implies the `P0~P2` hold the left forks and
      only `P4` and `P0` will contend to break the waiting cycle.
      then `P3` will be always able to hold the `f4` after holding the `f3` and proceed -> the waiting cycle is broken.
- > decide upon a threshold for “too many”

  ~~Maybe see my [optimized code](https://github.com/czg-sci-42ver/CSAPP-3e-Solutions/blob/c5eb9b45f5fc86c0b74f4464f9347b0cd4e24924/site/content/chapter12/code/12.20_fair_only_two_sem.c#L25)~~
  [T99](https://yarchive.net/comp/linux/semaphores.html) just use the *bounded* buffer (i.e. throttling mechanism).
- Figure 31.17 is similar to [D08] p265
  but it has no `wakeup`.
  just care about `s->value` is enough to protect based on the following semantics which excludes the negative condition.
  - > we don’t maintain the invariant that the value of the semaphore, when negative, reflects the number of waiting threads

    by `while (s->value <= 0)` holds the state `s->value=0`.
  - > never be lower than zero ... matches the current Linux implementation

    See [this](#sem_neg_impossible).
  - ~~TODO~~ linux `sem_t` [implementation](https://github1s.com/bminor/glibc/blob/master/sysdeps/nptl/internaltypes.h#L160-L161) just adds more states
    ```c
    struct new_sem
    {
    #if __HAVE_64B_ATOMICS
      /* The data field holds both value (in the least-significant 32 bits) and
         nwaiters.  */
    # if __BYTE_ORDER == __LITTLE_ENDIAN
    #  define SEM_VALUE_OFFSET 0
    # elif __BYTE_ORDER == __BIG_ENDIAN
    #  define SEM_VALUE_OFFSET 1
    # else
    # error Unsupported byte order.
    # endif
    # define SEM_NWAITERS_SHIFT 32
    # define SEM_VALUE_MASK (~(unsigned int)0)
      uint64_t data;
      int private;
      int pad;
    #else
    # define SEM_VALUE_SHIFT 1
    # define SEM_NWAITERS_MASK ((unsigned int)1)
      unsigned int value;
      int private;
      int pad;
      unsigned int nwaiters;
    #endif
    };
    ```
### [D68b]
here "COROLLARY 1" allows negative semaphore value. -> so can be "private semaphores" with ~~"one (or more) blocked processes"~~ "its waiting list"
- > V-operation represents the re-moval of a barrier

  allow *delayed* operation to resume, so somewhat synchronize
- > conditional V(private semaphore)

  i.e. similar to `&fill` and `&empty` which are specific to this producer and consumer pair but `mutex` can be used for all routines which access shared data like `buffer` by `put(i);`.
  > possibly one (or more) *blocked* processes should now get permission to continue

  - Notice here `Note 1.` assumes atomic by "indivisible actions", so then it can implement `pthread_cond_t` but with *different parameter semantics* which has *no lock* although their functions are same that pair the wait and the wakeup.
    So it doesn't conflict with [this](#b04_summary) because there is no atomic there to ensure the atomic operation with the *lock and wait*.
- > Each sequential process has associated with it a num-ber of private semaphores and *no other process* will ever perform a P-operation on them. <a id="private_semaphore"></a>

  So maybe `pshared` in `sem_init`
- harmonious cooperation
  take "producer and consumer" for example.
  1. obviously one producer can produce many data which can be consumed by multiple consumers.
    init -> just init the `cond` and `mutex`.
    > (If a  process needing a  segment from the drum has gener-ated a  task for the segment controller,  special precautions have  been  taken  to  ensure  that    the  segment  asked  for remains  in  core  at  least  until  the  requesting  process  has effectively accessed  the  segment  concerned.

    i.e. consumer request will always be met by the producer.
    > Without  *this precaution*  finite  tasks could  be forced  to generate  an *infinite* number of tasks for the segment controller, and the system could get stuck in an unproductive page flutter.

    maybe just one constraint that finite generates finite.
  2. > When a cyclic process leaves its homing position "it accepts a task"

    > It is proved that after the acceptance of an initial task all processes eventually will be (again) in their hom-ing position.

    So homing position maybe sleep or others?
    So 
    > It is proved that it is impossible that all processes have returned to their honfing position while somewhere in the system there is still *pending* a generated but unae-eepted task.

    TODO ~~means no deadlock (i.e. when one sleeps all others sleep)~~
  3. > Each process *blocked* in the course of task execution relies on the other processes for removal of the *barrier*.

    `P()` may fail -> block. The counterpart `V()` -> remove the block/barrier.
    - implies "circular waits" (i.e. deadlock) not allowed. <a id="deadlock_circular_wait"></a>
- [ostep_book] "both locks and condition variables."
  i.e. above "mutual exclusion" and "private semaphores" (the latter implies Mesa semantics by the paper pseudocode)
### [D72]
similar to "Figure 30.12" but it has $r_i$ which ensures the minimal available data num.
here `f` counts empty slots and `n` counts the available data num.
- TODO
  - how "undesirable properties" occur. <a id="undesirable_bounded_buffer"></a>
- TODO weird the `f>0` condition:
  Here assume consumption and production are all protected by the lock
  then they have no overlap, so `f<=tot` always hold (IMO this should be the condition)
- ~~so maybe many consumers make the `f=0` (i.e. swap the init state of `f` and `n`)~~
  ~~and above "undesirable properties" cause the `f=0` can't be modified (Very weird).~~
  ~~then production is also stopped by `f=0`~~
  production maybe `f=0`
- "undesirable properties" may be same as the [ostep_book] "memory-intensive region"
- so in p2, if $n_i\le r_i$, then `f` keeps *unchanged* (i.e. $f=tot-\sum\limits_{i} max(n_i,r_i)$) (Then the above problem is *solved*)
  but `n` will change
  so the producer will always be able to produce and then $n_i>0$ always holds -> stuck/stopped consumer less. And when $n_i> r_i$, it becomes normal, so a) and b still hold and the buffer won't *overflow*. The $n_i>0$ always ensures no *underflow*.
### [CB08]
- > Because the number of readers must be updated atomically, acquiring the lock as a reader requires the same bus transaction—a read-to-own—as acquiring a mutex

  > in the *absence* of a more sophisticated (and *less space-efficient*) synchronization primitive, a readers/writer lock will use a single word of memory to store the number of readers.

  ~~TODO~~ i.e. mutex and reader_lock may invalidate each other when cached when not aligned (i.e. although more space-efficient but may be harmful to the cacheline) carefully.
- > the lock implementation blocks new readers when a writer is blocked

  ~~deadlock? TODO but why must blame it on "readers/writer lock"?~~
  > if a writer blocks between the initial acquisition as reader and the recursive acquisition as reader

  See [this](#recursive_mutex)
  > All of this is not to say that readers/writer locks shouldn’t be used

  Not forbidden to use, but just take car\e because the concurrent readers *may* be recursive.
- [hash chain](https://www.geeksforgeeks.org/c-program-hashing-chaining/) -> table implemented with a list `table[i]`.
  - TODO "per-chain hash-table locks"
### [D71]
[wikipedia](https://en.wikipedia.org/wiki/Dining_philosophers_problem) doesn't says about "very Hungry" and "secretary".
- the 3 `test` ensures the [ostep_book]
  > concurrency is high (i.e., as many philosophers can eat at the same time *as possible*).


- why separate `P(1eft hand fork);` will fail, beacuse:
  > that has to be eaten with *two* forks

  > *each* will grab his *left* hand fork and from that moment onwards the group is stuck

- See (2) for allowable condition that 1->2 (so unstable).
  (1) is one invariant.
- unstable situation
  1. by `C[w]:= 1; test (w) ;`.
  2. 2->0 will allow adjacent philosophers to eat by `C[w]:= 0; test [(w+l) mod 5];test [(w-1) mod 5];`.
  See "In words:".
- here `C[w]:= 1` means sleep.
- `P(prisem[w]); eat` will be stuck except when `V(prisem[K])` has been called either by `test (w)` self or by `test [(w+l) mod 5]` from adjacent philosophers.
  So it is similar to `pthread_cond_t`.
- > for the following reasons.

  1. highlight the help with the addition of "the private semaphore".
    instead of using one long queue (i.e. a general semaphore)
    > the latter directly with the aid of a general semaphore

  3. > inclusive the need for the introduction of the intermediate state called "hungry"

    to wakeup *conditionally*.
- > we shall show how (using *only single* P-operations and binary semaphores)

  > This was another reason not to introduce the parallel P-operation: for the solution with the parallel P-operation we did not see an automatic way of *avoiding* the danger of *individual* starvation.

  i.e. parallel P-operation has more limits so that it is more difficult to debug.
- solving with starvation.
  - > This can be overcome by more sophisticated rules (introducing besides the state "hungry" also the state "very hungry")

    i.e. in the 1st cycle, (Notice the `P (mutex);`) 1st philosopher `P(prisem[w]); eat` -(switch)> 2nd philosopher `C[w]:= 1; test (w) ;` fails and stuck at `P(prisem[w]);` -> 3rd `P(prisem[w]); eat`, and then 4,5 all stuck at `P(prisem[w]);`
    then `2nd` starved
    - maybe solution
      ```c
      hungry_cnt[0:4] initially = 0
      procedure test (integer value K);
      /*
      If C[K]=0, then it has eaten, not taken in account.
      not eat if adjacent people are very Hungry
      */
        if C[K] =3 // this first to avoid recheck after the "C[K]:=3".
          if C[(K-1) mod 5] ≠ 2
            and C[(K+1) mod 5] ≠ 2
            do begin
              C[K]:= 2; V(prisem[K]);hungry_cnt[K] = 0
            end
        if C[K]= 1
          if C[(K-1) mod 5] = 3 or C[(K+1) mod 5] = 3 // avoid too many state 3
            return
          if C[(K-1) mod 5] ≠ 2
            and C[(K+1) mod 5] ≠ 2
            do begin
              C[K]:= 2; V(prisem[K]);hungry_cnt[K] = 0
            end
          else
            hungry_cnt[K]++ // important, otherwise 1 state won't exist.
            do begin
              if hungry_cnt[K] ==2 do begin
                C[K]:=3 // very Hungry.
                hungry_cnt[K] = 0
              end
            end;
      
      P (mutex);
          C[w]:= 1;
          /*
          Set the priority.
          ignore this: This is already achieved by above "C[(K-1) mod 5] ≠ 2,3". but not very good, because it will probably frequently from 1 to 3 and then no priority.
          */
          // if C[w-1] =3 do begin
          //   test(w-1);
          // end
          // if C[w+1] =3 do begin
          //   test(w+1);
          // end
          test (w) ;
      V(mutex);
      ```
      with the above patch, 
      in the 1st cyle simlar to above original with no one "very Hungry", it will end up "(2,0),(1,1),(2,0),(1,1),(1,1)" ("(2,0)" means state 2 with hungry_cnt=0).
      ~~But here the 1st finishes eating earlier, 1st `C[w]:= 0` -> 5th `test (w) ;` success and then `P(prisem[w]); eat`. -(state from 1st to 5th: 0,3,2,3,2)> 1st `test [(w+l) mod 5];` fails due to 3rd is eating and `test [(w-1) mod 5];` no action because 5th is eating (state 2) ->~~
      then 2nd cycle,
      maybe "(2,0),(1,1),(2,0),(1,1),(1,1)" -> "(0,0),(3,0),(2,0),(1,1),(2,0)" -> "(0,0),(2,0),(0,0),(3,0),(2,0)" -> "(0,0),(0,0),(0,0),(3,0),(2,0)" -> "(0,0),(0,0),(0,0),(2,0),(0,0)"
      - or "(2,0),(1,1),(2,0),(1,1),(1,1)" -> "(1,1),(3,0),(2,0),(1,1),(2,0)" -> "(1,1),(3,0),(2,0),(3,0),(1,1)" (notice here 1st (1,1) not changed due to adjacent (3,0)) -> "(1,1),(2,0),(1,1),(2,0),(1,1)"

        with original ones, "2,1,2,1,1" same as before
        2nd cycle, "2,1,2,1,1" -> "1,1,2,1,2" (1st finish `C[w]:= 0; test [(w+l) mod 5]; ...` and then `C[w]:= 1; test (w) ;`) -> "2,1,2,1,1" () -> "1,1,2,1,2" ...

        So my patch avoids this livelock (one special deadlock, i.e. always wait for something).
- TODO
  - > Secondly we could have made a more crude solution: the procedure "test" has a parameter indicating for which philosopher the test *has to be done*;

  - > suggest that it should be done automatically, because in real life, whether we like it or not, the situation can be more complicated.

    Does it mean that we need automatic test scripts?
- secretary
  - why use it
    > This places our processes in a hierarchy which *avoids deadly embraces* as far as mutual exclusion is concerned in exactly the same way in which mutual exclusion semaphores would need to *be ordered* in the case of nested critical sections.

    because the order is more direct and easy to maintain.
    Same as the chapter p11 footnote
    > it may have been more natural to place the mutex acquire/release *inside* the put() and get()

  - similar to subroutines
    > Instead of N equivalent processes, we now have N directors served by a common secretary.

    > shows great resemblance to the relation between a set of mutually independent programs and a *common library*

    > similar to the relation between main program and *subroutines*.

    > identified a process to which the "*common* variables" belong: they belong to the common secretary.

    - differences from subroutines (IMO there is no difference, it is only different from the special subroutines where no sleep in the subroutines).
      subroutines:
      > we *can* regard the main program "asleep"

      while secretary:
      > the secretary *may decide* to keep him asleep

      > when she signals a release —analogous to the return of the normal subroutine— she will supply the *identity of the process* to be *woken* up.

      - So the director may be really asleep for long time (similar to `futex_wait`)
        > b) "calling", i.e. he has tried to initiate a call on a secretary, but the call *could not be honoured*, e.g. because the secretary was busy with another call

        or short time -> c).
      i.e. director's a) -> secretary's b) while director's b),c) -> a).
      - notice the state is *relative* (i.e. *recursive* calls)
        > may be *simultaneously* busy with respect to her directors and calling or sleeping with respect to one of her *subsecretaries*.

    - embellishments
      1. "masking bit" (similar to CUDA)
      2. "parameter passing" dynamic with different types of directors. (maybe similar to c++ overload?)
  - TODO so what is "It is this *collection of observations* that was an incentive to redo"?
  - "semi-sequential"
    > but in an undefined order, i.e. depending on *the calls of her directors*.

    while "fully sequential"
    > in an order determined by the evolution of this *process*.

  - > a bunch of *non-reentrant* routines

    i.e. has states inside (similar to sequential circuits.)
### [D08]
- p265
  - ignore the following (`mutex` excludes the following switch condition):
    here `do{}while` is to keep the order of `semaphore - > wakeups` and `cond_wait/cond_signal` same for `sem_signal` and `sem_wait`.

    otherwise the `cond_signal` original useful may be no use and the `P/V` pair is no longer balanced.
    i.e. `semaphore - > wakeups ++;` -(switch to `sem_wait`)> `( semaphore - > wakeups < 1)` failure -> `semaphore - > wakeups - -;` -(switch back)> `cond_signal ( semaphore - > cond );`

  - here `do{}while` just ensures `sem_wait` not to use the old possible `cond_signal` and `semaphore - > wakeups` which *signals nobody* and then weirdly *skips* the `cond_wait ( semaphore - > cond , semaphore - > mutex );` when `semaphore - > value < 0` (obviously forbidden).

    i.e. it ensures `semaphore - > value < 0` ~~always~~ only *accepts the future* wakeups instead of history.

    more specifically if using `while()`, assume that  (v,w)/(value,wakeup):(-1,0) -(`semaphore - > value ++;`)> (0,0) -> (0,1) -> `cond_signal` (assume nobody gets wakeup) -(after *unlock*, switch to `sem_wait`)> (-1,1) -> *skip* `cond_wait` -> (-1,0) -> after unlock, `value=-1` state *mistakenly enters the critical session* which is protected by `sem_wait`.

    TODO how to achieve the above assumption.
### [B04]
- "wake-up waiting race"
  i.e. the interrupted case function as expected
  more specifically, if atomic, then `wait` and `wakeup` and A proceeds.
  But here non-atomic case *also achieve* the same result. same as the following "controls the *order*".
- TODO
  - > will not get stranded enqueued incorrectly on s.

    so mutual exclusion?
#### Getting Started modification_1 See [mod_1.cpp](./code_test/pseudo_code/cond_based_on_sem/mod_1.cpp)
- > This mean that the next thread to call c.Wait() will just decrement s.count and drop through

  just above "old possible `cond_signal`".
  - > You can fix it by counting the calls of c.Wait() and the matching calls of c.Signal()

    controls the *order*.
    here `x` is lock so init `x.count = 1`
#### Fixing things up See [mod_2.cpp](./code_test/pseudo_code/cond_based_on_sem/mod_2.cpp)
1. add *queue* property
2. the `signal` can't totally *correspond* to the `wait`.
  > and one of the 7 threads would end up enqueued on s.

  - here `h.V();` implies the `s.P()` has finished (similar to some type of resources).
    > The thread in c.Signal waits on h.P() until a thread has made a matching call of h.V() inside c.Wait().

    TODO but it still has *no correspondence ensure*.
    it only ensures `Broadcast()` will block at `h.P();` until all waiters finish `h.V();`.
- TODO
  - So does this
    > give the wrong answer

    > So eventually we gave up on the idea that we should build locks and condition variables out of semaphores

    Does the mutex around `m.Release(); s.P();` can achieve the atomic to ensure the solution working?
    IMO it works
    ~~above strike-through not works because one `wait` will block others which is obviously.~~
    > using the hardware test-and-set instructions to get atomicity with spin-locks

    So why the paper not use it?
#### Optimising Signal and Broadcast
i.e. calls the `Wait` instead of `Signal` immediately after `Signal` done by the scheduler.
#### B04_summary
problem list:
1. [atomic](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Condition_variables_2)
  which will cause "wake-up waiting race".
2. correspondance (IMO the paper solution is no use, maybe needs waiter queue in "The Sequel" which is also use in ).
  - TODO does linux `sem_post` [based](https://github1s.com/bminor/glibc/blob/master/nptl/sem_post.c#L56-L57) on `futex_wake` has this correspondance?
  - solution "has a fundamental *performance* problem".
3. "Optimising Signal and Broadcast" which is the kernel scheduler's obligation.
## Concurrency bugs
- [C+71](https://people.cs.umass.edu/~mcorner/courses/691J/papers/TS/coffman_deadlocks/coffman_deadlocks.pdf)
  - FIG. 1 i.e. [this](#deadlock_circular_wait)
  - FIG. 2 same as csapp and 
    [ostep_book] Figure 32.6, "presence of a cycle"
    also [above](#deadlock_circular_wait)
- "Atomicity-Violation Bugs" can be solved by mutex obviously.
  - > but not always

    maybe deadlock due to the outside *order* of `proc_info_lock` with other locks which has been said in csapp.
- "Order-Violation Bugs" obviously by `pthread_cond_t`
  - here `pthread_cond_wait(&mtCond, &mtLock);` can't receive *already released* signals, so we need one `mtInit` to control the order.
  - here `while (mtInit == 0)` can be also `if (mtInit == 0)` if no other threads will modify the `mtInit`.
    But `while` is more general and has not very large overheads (just one simple check of `mtInit`), o it is preferred. And it is *more portable* if the future codes are changed and maybe `mtInit` can be reset somewhere after `free`.
  - > Note that we could likely use mThread as the state variable itself

    easier if the system init `0`, otherwise maybe difficult to tell whether one *arbitrary* address is valid.
- > the design of locking strategies in large systems must be carefully done to avoid deadlock in the case of *circular dependencies* that may occur *naturally* in the code.

  ~~TODO~~ maybe one more lock outside?
  See p8 "Hold-and-wait" which avoids the race of hold, so *no wait* then.
- Conditions for Deadlock: 1->2->3 and 4 ensures the cycle *not to be changed* by the system -> the endless waiting cycle.
- Prevention
1. Circular Wait
  "partial *ordering*" just less stricter ordering which only cares one *subset*.
  similar to math [counterpart](https://en.wikipedia.org/wiki/Partially_ordered_set)
  > Partial orders thus generalize total orders, in which *every* pair is comparable.\

2. Hold-and-wait
  See above 
3. "No Preemption" avoids wait by `pthread_mutex_trylock`
  > doesn’t really add preemption

  not lock (like minus one when using semaphore) and wait
   - > it skirts around the hard parts of using a trylock approach

    i.e. Does it mean that it doesn't show the hard part of implementation?
     - > One point about this solution: ... The first problem

       1. the back point may be outside of current scope if stuck in one *subroutine*.
       2. if back point is long before, the locks and memory *between that and the current point* are difficult to know exactly.
         this is one common problem of `goto`.
       - > in limited circumstances (e.g., the Java vector method mentioned earlier),

         they are in the *same small* scope, so *easy* to back and know what to release.
  - > back out of lock ownership (i.e., preempt their own ownership)

    it means to *preempt the whole two* locks as one whole instead of only one.
    > for the same resources (again, locks L1 and L2),

    So 
    > Resources (e.g., locks) cannot be forcibly removed

    is solved.
4. just atomic so no need for lock.
  - `int old = *value;` can be implemented by only one instruction in x86.
    ```c
    do {
     int old = *value; // a
     } while (CompareAndSwap(value, old, old + amount) == 0) // b
    ```
    Think of two `AtomicIncrement` interleaved
    a_1 -> a_2 -> b_1 -> b_2, then b_1 success (return) and b_2 failure, the next try of thread_2 b_2 will works (return).
  - > has a race condition

    i.e. multiple 5 -> multiple 6, then only the last `head = n` is valid and inserts only one node.
    > for example, about the call to malloc()

    i.e. as the [ostep_book] has said, `MT-Safe`
    - `CompareAndSwap(&head, n->next, n)` ensures the sequential property.
      this is similar to something like `AtomicInsert`
- > If more intricate repair of data structures is first required, a human being may be involved to ease the process.

  i.e. need repair before .
### [L+08]
- "Figure 3" inappropriate `timeout` parameter or lack checking `MAX_THREAD`.
- `syscall` can be thought as one callback.
  where `func_1(func_2)` may call `syscall(func_2)`
  See the [example](https://en.wikipedia.org/wiki/Callback_(computer_programming)#C) where "callback" is *func pointer*.
  Also can be seen as ["a function that is called repeatedly"](https://towardsdatascience.com/control-the-training-of-your-neural-network-in-tensorflow-with-callbacks-ba2cc0c2fbe8#:~:text=A%20callback%20is%20a%20function,end%20of%20a%20training%20epoch.)
  - So "callback function of PBReadAsync" means it is called by `PBReadAsync ( &p)` where `p` is probably some type of func pointer.
  - "making S1 and S2 atomic." is similar to [B04] `m.Release();s.P();`.
- > tries to acquire a resource held by itself

  lock one lock duplicately which is already locked but not unlocked.
- "Figure 6" just needs thread 2 to finish modification of the three variables *without interrupts* and then thread 1 can call `putc` to print.
  > it is not wrong for thread 1 to read mContent *either before or after* thread 2’s modifi- cation to all of three variables

- > 90% (67 out of 74) of the examined non-deadlock bugs can deterministically manifest, if certain orders among *at most four* memory accesses are enforced.

  i.e. they only *depend on* "at most four memory accesses"
- "Finding (9)" is due to "Finding (2)".
- > but it may introduce other non-deadlock bugs.

  because `lock` implies order sometimes and at least atomicity.
- "Figure 9(a)" obviously lacks atomicity.
  it thoughts `state = LANDING` implies `js_UnpinPinnedAtom (...)`, but it is not that case.
  - (b) ~~seems to be still wrong.~~ add one more implicit lock (i.e. spinlock) by `while(gcLevel>0)` waiting for `gcLevel = 0` which either means `ret` then no `js_MarkAtom (...)` or `gcLevel = 0;` after `js_MarkAtom (...)` *done*.
    So the order is ensured.
    - "race window between S1 and S2" i.e. which one of S1/S2 continues to run after `state = LANDING`.
- Transactional memory can be implemented by hardware or software.
  > combining software and hardware TMs.

- > some of the *roll-back* concerns can be addressed using system supports

  reduce the syscall overheads like duplicately accessing the mem by combining them together then *only one* overhead.
  The "roll-back" implies the temporal locality so the combination is very useful to be reused and then combination overhead can be amortized.
  - failure conditions to work
    > As operations like I/O are hard to roll back

- > too large memory footprint to be effectively handled by hardware-TM.

  > Here, a trans-action (with abort, *rollback* and replay)

  maybe not enough space to rollback for *some types* of hardware TM.
- > programmers do not want B to wait for A.

  So the pair wait/wakeup fails to meet the feature request.
- [stack trace](https://github.com/brendangregg/FlameGraph)
- > mentioned that they got help from Valgrind, Purify

  `helgrind` can help ~~now~~.
  It exists from `72a784f3b192a4cc4d9f8a55e7cab80dbbeb1aae` which is `git-svn-id: svn://svn.valgrind.org/valgrind/trunk@2` by `helgrind/Makefile.am                  |   80 +++` in `git log --stat`.
#### 5. Bug fix study
- 1. `COND` similar to spinlock
  1. `Switch` needs programmer's logic
  2. `design` just reconstruction
  3. `lock` has been said in the [ostep_book] and see Table 2
  1,4 has been said in [ostep_book], 3 is implicitly said in [ostep_book] "Lock-based Concurrent Data Structures" chapter and 2 is more implicitly said in [ostep_book] "possible ordering" contexts.
- 1. `GiveUp` has potential harm which will cause non-deadlock bugs
  So the "Figure 32.6" can be avoided but non-deadlock bugs are probably caused then.
  1. `Split` just shorten the mutex time and therefore less races.
  2. `AcqOrder` similar to `Switch`
  obviously "Figure 32.6" can be avoided without bad side effects.
- See Table 2 for more
- "Table 1" has been said later in different sections.
  "Section 4" is to guide testing, concurrency bug detection, etc.
#### summary
- Finding (1,2) -> cause/reasons
- Finding (3) *pairwise* threads
  - (4) only one thread
- (5,6,7) variable
  although *one is common* case, but also needed to take "above one" in account.
  and above 2 is *rare*.
- Finding (8) accesses at most 4.
## Event-based Concurrency
- `man pselect`
  - > shall modify the objects pointed to by the readfds, writefds, and errorfds arguments

    i.e. the book
    > select() replaces the given descriptor sets with subsets

  - > File descriptor *masks* of type fd_set can be initialized and tested with FD_CLR(), FD_ISSET(), FD_SET(), and FD_ZERO()

    > shall return the total number of bits set in the bit *masks*

    i.e. 
    > returns the total number of ready descriptors in all the sets

- po `poll` See [daniel](https://daniel.haxx.se/docs/poll-vs-select.html)
  advantages:
  1. has more expansibility by "event flag".
    i.e. in daniel
     > offers somewhat more flavors of events to wait for

  disadvantages:
  1. all fds has no differences. They are represented by `(struct pollfd) foo.fd`.
  - TODO 
    > select() only uses (at maximum) *three* bits of data per file descriptor, while poll() typically uses 64 bits per file descriptor. In each syscall invoke poll() thus needs to copy a lot more over to kernel space.

  - more [detailed](https://stackoverflow.com/a/3951845/21294350)
    `select`
    1. > then the *bitmask* passed to select() has to be large enough to accomodate that *highest* descriptor

      ~~TODO~~ ~~because~~ meaning. 
      - based on [this `i < fds.size()`](https://hechao.li/2022/01/04/select-vs-poll-vs-epoll/) (although it not sticks to the [API](https://www.tutorialspoint.com/unix_system_calls/_newselect.htm)) and `man poll` -> `i<2` they all traverse the `fds`.
        But the bitmask implies if two fds where one small and one *very big*, the bitmask length is very big although we *only needs two bits* at all.
      - i.e. 
        > The select() API with a "max fds" as first argument of course *forces a scan* over the bitmasks to find the exact file descriptors to check for, which the poll() API avoids

        poll just only one scan.
      - [scotdoyle](http://scotdoyle.com/python-epoll-howto.html)
        - i.e. 
          > because the Python program does *not have to inspect each* socket for events of interest

    2. > has to loop over all three bitmasks

      similar to 1
    3. > they are *ruined* and are no longer marked

      `poll` just always check all `nfds` number of `fds`.
      i.e. `poll`
      > keep re-using the same data structure.

    - `epoll`
      - from [this](https://suchprogramming.com/epoll-in-3-easy-steps/), basic usage is similar to `poll`
        where `events` corresponds to `pollfd.events`
        - `epoll_ctl`
          "file description" see `man 2 open` -> "the file offset and the file status flags"
      - [`O(1)`](https://www.hackingnote.com/en/versus/select-vs-poll-vs-epoll/) complexity due to [devarea "epoll_wait returns only the objects with ready file descriptors"](https://devarea.com/linux-io-multiplexing-select-vs-poll-vs-epoll/)
        - devarea
          - ["level triggered or edge triggered"](https://en.wikipedia.org/wiki/Epoll#Triggering_modes)
          - maybe also avoids frequent context switches by "manage the context in the *kernel*"
- > these basic primitives give us a way to build a non-blocking event loop

  - `select`
    nonblock is done by setting `struct timeval       timeout;` to not `-1` instead of by [`fcntl(fd, F_SETFL, flags | O_NONBLOCK);`](https://cboard.cprogramming.com/linux-programming/109694-select-o_nonblock.html#post811382). See "select_poll/O_NONBLOCK_select*" ?
    So [this](https://stackoverflow.com/questions/28851639/select-with-non-blocking-reads#comment69602213_28851750) is wrong.
  - ~~TODO~~ by the `man poll`, it doesn't care about `fd` properties which includes `O_NONBLOCK`.
  - the above `poll/select` relations with `O_NONBLOCK`
    See `man 2 open`
    > *Neither* the open() nor any *subsequent* I/O operations on the file descriptor which is returned  will  cause the calling process to *wait*

    > Note  that  the  setting of this flag has *no effect* on the operation of poll(2), select(2), epoll(7), and similar ... meaning that an I/O operation performed on the file descriptor with the O_NONBLOCK flag *clear* would *not block*.

    i.e. file can be safely operated with I/O *without delays*. <a id="poll_wait_O_NONBLOCK"></a>
  - `ioctl` more [detailed](https://www.daemon-systems.org/man/ioctl.2.html) than linux `man`
- `select(maxFD+1, &readFDs, NULL, NULL, NULL);` may be enough to use `select(maxFD, &readFDs, NULL, NULL, NULL);` because of `fd < maxFD`. See `O_NONBLOCK_select.c` ?
- the [ostep_book]
  > open and set up a bunch of sockets (not shown)

  See csapp 982 or `O_NONBLOCK_select_ibm.c`
  where the latter uses `ioctl` and `sockaddr_in6` instead of `struct addrinfo` use by the former.
- "out-of-band data"
  [1](https://en.wikipedia.org/wiki/Out-of-band_data#Implementations)
  > routes the data to the *normal* reception endpoint if it is in-band, and to a *separate* mechanism if it is out-of-band

  [2](https://www.gnu.org/software/libc/manual/html_node/Out_002dof_002dBand-Data.html)
  > Typically the reason for sending out-of-band data is to send *notice* of an exceptional condition

- 33.8
  1. shows "event-based approach" *only applies to one-core*.
    > on modern multicore systems, simple event handling without locks is no longer possible

    So probably we can **ignore its usage** if wanting to use **multiple cores**.
  2. 33.6 may fails with the event handler self "an event-handler page faults".
    because no other valid works to do like thread switches.
    po This is mainly due to 1 that thread switch is not available.
  3. See "rip is to ..."
- readable SIGSEGV handler [example](https://stackoverflow.com/q/2663456/21294350)
- TODO
  - [nodejs](https://www.freecodecamp.org/news/understanding-node-js-event-driven-architecture-223292fcbc2d/) "EVENT-BASED" CONCURRENCY
    maybe probably due to that its process has internal high dependency, so it can't proceed until I/O finishes (or partly finishes).
### [O96]
- why TCL [no use](https://news.ycombinator.com/item?id=14945434)
  TK used to implement [GUI](https://www.tutorialspoint.com/tcl-tk/index.htm#:~:text=Tcl%20is%20a%20general%20purpose,building%20GUI%20in%20many%20languages.) in [`python`](https://realpython.com/python-gui-tkinter/)
- > Kernel calls, window systems not multi-threaded.

  This depends on the OS [choices](https://stackoverflow.com/questions/1652799/multiple-ui-threads-on-the-same-window#comment1549737_1670193)
- > Often don't want concurrency anyway (e.g. window events)

  See acolyer [blog](https://blog.acolyer.org/2014/12/09/why-threads-are-a-bad-idea/#:~:text=They%20are%20%E2%80%9Ctoo%20hard%20for,end%20up%20with%20corrupted%20data.)
  > susceptible to deadlock, partially because of the *unfortunate interaction* between *input* event processing and any sensible *object-oriented* modeling of the GUI components

  - TODO Distributed systems related
### [A+02]
- ["tail call optimization"](https://stackoverflow.com/a/9814654/21294350)
  the main problem with `n * acc` is that it is not easy to be unfolded.
  but `fac_tailrec(n * acc, n - 1)` is easy when directly *nested in itself*.
  so no stack overheads.
- here rip is to split functions to ensure nonblocking property of the event handler.
## TODO
### introduction
- TODO How inode is encoded.
  maybe can be thought as one [pointer](https://unix.stackexchange.com/a/106871/568529) which points to some [structures](https://www.kernel.org/doc/html/latest/filesystems/ext4/inodes.html?highlight=inode) like `i_flags`.
  > inodes point to blocks on disk

### API
- [symbol table](https://www.geeksforgeeks.org/symbol-table-compiler/)
- what is the [usage](https://stackoverflow.com/a/52240195/21294350) of `SDT probes` which is related wtih `LIBC_PROBE`
  which can be [shown](https://www.ece.villanova.edu/VECR/doc/gdb/Static-Probe-Points.html) in `gdb`
- > First, it performs poorly in many cases (*spinning for a long time* just wastes CPU cycles).

  But it seems that `ROS` intro doc use this frequently.
### locks
- > Hardware support alone cannot solve the problem

  maybe because
  > what to do when a context switch occurs in a critical section

  context switch is controlled by OS, so it needs OS to handle problems caused by "context switch".
- po "atomic exchange" may be implemented in the hardware by *Enable bit*.
  - Or as [COD_RISCV_2nd_A_appendix] says, use one specific instruction [`LL/SC`](https://stackoverflow.com/a/14761049/21294350) which *can't be interrupted*
  - imply ["bypass the store buffer"](https://stackoverflow.com/a/43837970/21294350) which references [this](https://yarchive.net/comp/linux/store_buffer.html).
  - Also related with [MESI](https://stackoverflow.com/a/25350342/21294350) to make *visible*.
### Condition Variables
# persistence
## I/O
- NVMe [based](https://www.crucial.com/articles/about-ssd/m2-with-pcie-or-sata#:~:text=NVMe%20(Non%2DVolatile%20Memory%20Express,to%20connect%20high%20speed%20components.) on PCIE is [faster](https://www.enterprisestorageforum.com/hardware/pcie-vs-nvme/#:~:text=NVMe%20(Non%2DVolatile%20Memory%20Express,1.0%20was%20released%20in%202003.) than ~~PCIe~~ SATA.
  SCSI is [old](https://www.simms.co.uk/tech-talk/sas-sata-or-pcie-know-your-interface/) and [faster](https://book.huihoo.com/pc-architecture/chapter43.htm#:~:text=The%20SCSI%20bus%20can%20transfer,with%20very%20fast%20hard%20disks.) than PCI and the former usage range is [stricter](https://stackoverflow.com/a/17339865/21294350).
  See "Figure 37.5".
  - TODO SCSI vs PCIE
- proprietary [DMI](https://en.wikipedia.org/wiki/Direct_Media_Interface)
- SATA vs PATA
  based on this [reference](https://en.wikipedia.org/wiki/Parallel_ATA#cite_note-13) ([i.e.][URPCs])
  p464
  > causes some of the data lines to run *parallel or adjacent to each other* at random, thereby causing *crosstalk and noise* and resulting in signal errors.

  p472
  > sends data only a *single bit* at a time ... This eliminates problems with airflow compared to the wider Parallel ATA ribbon cables. 

  - esata [similar](http://www.differencebetween.net/technology/difference-between-ata-and-sata/) to USB
- > The first problem you might notice in the protocol is that polling seems inefficient; specifically, it wastes a great deal of CPU time *just waiting* for the (potentially slow) device to complete its activity

  similar to concurrency where it uses sleep to solve the problem (here also solved with interrupts in 36.4).
- ISR(interrupt service routine) [same](https://stackoverflow.com/a/29401460/21294350) as interrupt handler
- disk defragmentation tool [not needed probably](https://askubuntu.com/a/674874/1682447) by linux but highly needed by windows.
  - defragmentation [reasons](https://web.archive.org/web/20081028061054/http://geekblog.oneandoneis2.org/index.php/2006/08/17/why_doesn_t_linux_need_defragmenting)
    > All files are placed right *next to each other*, so any time a file is enlarged, it fragments.

    i.e. "H e l l o , _ w o r l d!!" is splitted.
    - here `a e l e` shows the file contents location.
    - > observe how much trouble it causes:

      here index is modified to `h n u n` which won't influence other indexes.
      - > The first filesystem tries to put all files as close to the start of the hard drive as it can,

        means the "approach one" and two before.
      - > when a disk is so full that there just aren't any gaps a large file can be put into without splitting it up.

        i.e. internal fragmentation which is said in COD.
      - > due to the nature of hard drive geometry, fragmentation may still be present: A typical hard drive actually has multiple disks, AKA platters, inside it.

        i.e. platters are *not continuous* with each other -> fragmentation
        See
        > this ignores the fact that the stylus will have to *move from the very end* of the platter to the very *beginning* in order to read this file.

  - [`sudo lsblk -no name,fstype`](https://unix.stackexchange.com/questions/53313/how-to-show-the-filesystem-type-via-the-terminal#comment1162784_53314) check all the file system type.
- [Dispatch table](https://en.wikipedia.org/wiki/Dispatch_table#JavaScript_implementation) is just *map* of functions which can implement [Interrupt vector table](https://en.wikipedia.org/wiki/Interrupt_vector_table#) which only cares about interrupt handlers instead of all possible functions.
  - Interrupt vector table
    where "interrupt vector" is "the *address* of an interrupt handler"
    and "interrupt 0 is stored from 0000:0000 to 0000:0003" because at least 32-bit -> 4 bytes.
    - compared with ["polled interrupt"](https://en.wikipedia.org/wiki/Vectored_interrupt#) which similar to polling handles all interrupt in some order.
      one specific application is [PIO](https://en.wikipedia.org/wiki/Polling_(computer_science)#) in the [ostep_book].
    - so vector means *multiple* "interrupt service routine"s.
### [network][MR96]
- [Host-based routing](https://docs.continuent.com/tungsten-clustering-6.1/connector-routing-host.html#:~:text=Host%2Dbased%20routing%20uses%20specific,created%20on%20each%20connector%20host.)
  is based on hostnames.
- ["Promiscuous mode"](https://en.wikipedia.org/wiki/Promiscuous_mode) is allow receiving *all* packets.
  > In promiscuous mode, however, the NIC allows *all* frames through

- livelock see "4.2. Receive livelock".
  - See 5 for solutions.
    - >  in which the system polls only when triggered by an interrupt, and interrupts happen only while polling is suspended

      i.e. poll is in interrupt handler which implies "intervals".
      ~~each interrupt will poll so that all interrupts can be served~~
      ~~when poll is preempted by others, interrupt will help it out.~~
      > During low loads, packet arrivals are unpredictable and we use interrupts to *avoid latency*. During high loads, we know that packets are arriving at or near the system’s *saturation* rate, so we use polling to ensure progress and fairness, and only re-enable interrupts when no more work is pending.

      i.e. poll only when interrupts too frequent, and re-interrupt when no polls pending( running/runable ).
      This is same as [ostep_book] says:
      >  occasionally use polling to better control what is happening in the system and allow the web server to *service some requests* before going back to the device to *check for more packet arrivals.*

      - > Simply polling at fixed intervals

        so poll will imply batch interrupts so less overheads.
      - the "interval" also implies 
        > given input rate), but does not prevent livelock.

      - this poll is not preempted by interrupts
        while the book hybrid ones can
        >  polls for a little while and then, if the device is *not yet finished, uses interrupts*

    - > The polling thread can be interrupted at most once by each device

      i.e. once after the polling thread re-enables the device interrupt.
      - higher IPL means the [higher](https://en.wikipedia.org/wiki/Interrupt_priority_level#OpenVMS_IPLs) priority.
        > The software interrupt is taken at a *lower* IPL, and so this protocol processing *can be preempted* by subsequent interrupts.

      - > Either approach eliminates the need to queue packets between the device driver and the higher-level protocol software

        the 1st won't be preempted so no need for the queue.
        TODO the 2rd where the polling thread will solve with all pending input requests.
        - > although if the protocol stack must block, the incoming packet must be queued at a later point. 

          TODO the block implies "queued". 
    - 5.4
      - "In summary"
        1,2 -> 5.2
        3,4 -> 5.1
      - "maintain"
        2 -> "has sufficient buffering of its own"
        3 -> 5.3
      - > lowering the MLFRR of the system and hence increasing the likelihood that livelock will occur

        the lower MLFRR is easier to achieve so livelock is more possible to occur.
  - 6.2
    mainly due to the lower priority of the forwarding layer than `ipintrq`.
    - the quota which can be replaced by the *feedback* in 6.6.2. is similar to queue size in the producer-consumer model.
  - 9 summary for solutions
    where 4 -> 5.4 "summary" 3
- "batch interrupts." is to process *multiple* interrupts each time.
  i.e.
  > waits for a bit before delivering the interrupt to the CPU

### device drivers based on xv6 `ide.c`
- `0x1F7` see `idewait` where "Status Register" is 8 bits.
- `idestart`
  - here `LBA` is block index.
  - here `rep outsl` specifies [three](https://www.felixcloutier.com/x86/rep:repe:repz:repne:repnz) register locations.
    - here [`b,w,l`](https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm#:~:text=As%20you%20may%20have%20noticed,'b'%20is%20for%20byte.) in att -> [`b,w,d`](https://www.felixcloutier.com/x86/outs:outsb:outsw:outsd) in intel
      implies `/4` in `BSIZE/4`.
    where `ecx` will be [modified](https://www.felixcloutier.com/x86/rep:repe:repz:repne:repnz#operation)
    64-bit implies [`RSI`](https://www.felixcloutier.com/x86/outs:outsb:outsw:outsd#description)
- TODO
  - where `B_DIRTY` assigned to `b->flags`.
  - where `IDE_CMD_READ`, etc. defined.
  - `outb(0x3f6, 0)` not equal `0x08`.
  - `0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f)` where `0xe0` relation with `LBA`.
- `ideintr`
  is to update `idequeue`.
  - TODO what call this `ideintr`.
    maybe by the hardware which signals the completion by `b->flags &= ~B_DIRTY;`.
  - `struct buf * b` passed to `wakeup(b);` which depends on how processes sleep on this *generic pointer* (i.e. `sleep(b, &idelock);`).
  - `if(!(b->flags & B_DIRTY) && idewait(1) >= 0)` ~~waits~~ check for read ~~finish~~ once.

- See "Figure 36.6".
- "Error Register" is not used in xv6
## disks
- > one such head per surface

  [See](https://en.wikipedia.org/wiki/File:Innansicht_Festplatte_512_MB_von_Quantum.jpg) this where one platter -> two heads.
  or [multiple](https://superuser.com/a/260628/1658455) disk platters ~~where the "spindle" is "a single disk arm".~~
- > we want to be able to read or write those sectors

  so the minimum unit "sector" in the book is more specifically ["(C) Disk sector"](https://en.wikipedia.org/wiki/Disk_sector#).
- from "Figure 37.3", the *represented* sector is based on the "angular velocity" to ensure the consistency between tracks.
  but in reality not,
  > hat outer tracks tend to have *more* sectors than inner tracks

- [track skew](https://www.seasip.info/Cpm/skew.html) just modify the original *map* of sector numbers with sector hardware locations.
  > can be properly serviced even when crossing track boundaries

  - So
    > First, the drive *geometry* is not available to the host OS

    and "nearest-block-first" maybe not nearest in the hardware level.
  so in Figure 37.4, when head seeks from 11 to 12, the track may *has been rotated* some angles, no need for another total rotation if no skew. i.e.
  > but the desired next block would *have already rotated* under the head

- 37.3 equation
  $4/125=0.032ms=32us$
  > Assuming each 4 KB read occurs

  - here probably 4KB is consecutive, so at least less seeks but maybe *not exactly one seek*, so here take the average seek time
  - TODO rotation time depends on track size
- 37.5 equation
  also takes "seek to self" in account.
- F-SCAN can avoid [183](https://www.geeksforgeeks.org/difference-between-scan-and-cscan-disk-scheduling-algorithms/) to be the last to be served.
  SCAN prevent the *closer* ones to strave others.
  - > they ignore rotation

    because they only cares about the *track* number which is same as SSTF.
- > imagine if seek is quite a bit faster than rotation

  then seeking to the outer track can be *before* rotation. So it is preferred.
  This is also due to the *rotation direction*.
- > does not have a good idea where track boundaries

  only knows the sector number but not track ones
  so needs the direct hardware support.
  > the disk then uses its *internal* knowledge of head position and detailed track layout information to service said requests in the best pos-sible (SPTF) order

- > deciding when to wait, and for how long, can be tricky;

  similar to xv6 ide and [this](https://sysplay.in/blog/linux-kernel-internals/2015/12/waiting-blocking-in-linux-driver-part-3/), it may use one queue to implement wait
  but the former doesn't do *the selection* by `idequeue = b->qnext`.
  - TODO wait time decision. 
## raid
- "Nonvolatile memory" by either independent [power](https://en.wikipedia.org/wiki/Nonvolatile_BIOS_memory) or by flash which use floating to ensure "non-volatile" (see ["pull the electron out of the floating gate"](https://www.utmel.com/blog/categories/memory%20chip/introduction-to-eprom-and-eeprom) from [this](https://electronics.stackexchange.com/questions/675556) and [asm_md] "Floating_isolator").
  See [ostep_book]
  > includes a small amount of non-volatile RAM (e.g., battery-backed)

- ["Specialized software"](https://qr.ae/pK7QZT) is optimized for one specific purpose.
- silent error [definition](https://people.cs.umass.edu/~phillipa/papers/fast10.pdf) (i.e. latent sector errors)
  > i.e. errors that are unknown to the system *until it tries to access* the affected sector,

  > The timestamps in our data refer to the time when the error was *detected*, not necessarily when it first *happened*

  i.e. detected when accessing.
  - So 
    > becoming inaccessible upon an otherwise working disk 

    means if we doesn't access, then all works well.
- See [asm_md] "not_use_raid_3" and 
  TODO see [CAAQA] "Figure D.4" at least for why not use RAID 2.
- round-robin can be seen as [cyclic](https://www.google.com/search?q=round-robin+equal&oq=round-robin+equal&aqs=chrome..69i57.3756j0j7&sourceid=chrome&ie=UTF-8) (in "featured snippets") -> [this](https://www.techtarget.com/whatis/definition/round-robin#:~:text=A%20round%20robin%20is%20an,is%20about%20%22taking%20turns.%22).
  > usually from the top to the bottom of a list and *then starting again at the top*

- striping [definition](https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_0)
  > with A1:A2 as the first stripe, A3:A4 as the second one,

- with chunk
  `stripe_size=(number_of_disks*chunk_size)`
  `Disk=(A % stripe_size / chunk_size)`
  `Offset=2*(A % stripe_size)+A % 2`
- > because the positioning time for the entire request is determined by the maximum of the positioning times of the requests across all drives.

  for example, `0,1` will only be all in the disk 0 with chunk size 2 but in 2 disks if chunk size 1. i.e.
  > a single file fits within a chunk

  - > multiple concurrent requests

    here needs request to other disks to be concurrent
- bandwidth [calculation "Website Bandwidth Calculator"](https://www.calculator.net/bandwidth-calculator.html?pageviews=5000&pageviewsunit=day&pagesize=500&pagesizeunit=KB&redundancyf=2&ctype=3&x=48&y=12#website)
- "transactional workload" from [different users](https://aerospike.com/glossary/transactional-workload/#:~:text=A%20transactional%20workload%20means%20that,in%20banking%20or%20accounting%20systems.)
- ~~Notice the differences between~~ "To compute S/R" -> Figure 37.6.
- See [asm_md] where RAID 01 is 0 (stripe) and then 1 (copy).
- $\frac{N}{2}*S$ refers to the *useful* bandwidth, so it is divided by 2.
- > While it is rotating over the *skipped* block, it is not delivering useful bandwidth to the client.

  here we assume that the block data are *all* transferred, due to that the skipped ones are unnecessary, so only $\frac{S}{2}$ rate at all -> 
  $\frac{S}{2}*N$.
  - > Thus, for random reads, RAID-1 delivers N · R MB/s.

    because RAID-1 *maybe* always seek for a different track when accessing one block, so no *rotational overheads* (i.e. skipped) as sequential does.
  - > Even though a write to logical block x turns into two parallel writes to two different physical disks 

    because the real physical block write requests are twice as sequential does.
- > Imagine the column labeled C2 is lost

  this can be assumed because
  > would assume that the RAID controller hardware (or software) can *immediately observe* when a disk has failed

- > what is the cross-over point?

  when sequential then parity only read once. See [this](#consecutive_read_RAID_4) "additive parity".
- > has to perform *two I/Os (one read, one write)* per logical I/O ... computing the parity disk’s performance on those *two I/Os*, and thus we achieve (R/2) MB/s.

  ~~if using more independent writes on *different stripes* like number $N$, then the speed will be $\frac{R}{N}$ MB/s~~
  original writes only one I/O (i.e. one write) to two -> $(R/2)$ speed.
- > Also, when updating the parity disk in RAID-4/5, the first read of the old parity will likely cause a full seek and rotation, but the second write of the parity will *only result in rotation*. Finally, sequential I/O to mirrored RAIDs pay a 2× performance penalty as compared to other approaches

  because two reads/writes to adjacent disks of mirrored ones has no relations -> higher penalty.
- [Hot Spare](https://community.boschsecurity.com/t5/Security-Video/What-is-the-difference-between-RAID-5-RAID-5-plus-a-Hot-Spare/ta-p/11521) i.e. dependability as said in COD.
  > When a drive fails, the hot spare automatically *takes its place*, *rebuilding* the data without manual intervention

## Files and Directories
- Capability provides "a *single* mechanism" to "address both hardware and software resources". See [p4](https://homes.cs.washington.edu/~levy/capabook/Chapter1.pdf)
  > Conceptually, a capability is a *token*, ticket, or key that gives the possessor permission to access an entity or object in a computer system
- notice `fadvise64(3, 0, 0, POSIX_FADV_SEQUENTIAL) = 0` in `strace cat foo` to use sequential read as the raid chapter says.
- `dd if=foo of=bar` also uses `dup2(3, 0)`
- See `man stdin` for stdin fd number.
- "open file table" see csapp 944/1122 and xv6 `ftable`.
- `F_SETOWN` sets
  > set the *process ID or process group ID* specified to receive SIGURG signals when out‐of‐band  data

- > (if fsync() is correctly implemented, that is)

  maybe means as said in man where it may be interrupted by some faults or power failures:
  > In the middle ground between these extremes, fsync() might or might not actually cause data to  be written  where  it  is  safe from a power failure

- > Because the stack is persistent, data push’d by one invocation of pstack can be pop’d by the next.

  i.e. no delay like disk files which needs `fsync` to solve.
- `mv` syscalls
```bash
renameat2(AT_FDCWD, "foo", AT_FDCWD, "bar", RENAME_NOREPLACE) = -1 EEXIST (File exists)
# check not replace dirs
openat(AT_FDCWD, "bar", O_RDONLY|O_PATH|O_DIRECTORY) = -1 ENOTDIR (Not a directory)
newfstatat(AT_FDCWD, "foo", {st_mode=S_IFREG|0644, st_size=56, ...}, AT_SYMLINK_NOFOLLOW) = 0
newfstatat(AT_FDCWD, "bar", {st_mode=S_IFREG|0644, st_size=56, ...}, AT_SYMLINK_NOFOLLOW) = 0
# check the permission
geteuid()                               = 1000
faccessat2(AT_FDCWD, "bar", W_OK, AT_EACCESS) = 0 # Perform access checks using the "effective" user and group IDs
renameat(AT_FDCWD, "foo", AT_FDCWD, "bar") = 0
```
- [`struct stat`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/arch/alpha/include/uapi/asm/stat.h#L5-L6) in linux and see `man 3type stat`
- book `struct dirent` -> `struct linux_dirent` in `man getdents64`
- > a program may want to call stat() on each file to get more information on each, such as its length or other detailed information.

  It uses `statx`
```bash
$ strace ls -l
...
openat(AT_FDCWD, "/", O_RDONLY|O_CLOEXEC|O_PATH|O_DIRECTORY) = 4                                                
statx(4, ".", AT_STATX_SYNC_AS_STAT, STATX_TYPE|STATX_INO|STATX_MNT_ID, {stx_mask=STATX_ALL|STATX_MNT_ID, stx_at
tributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|0755, stx_size=312, ...}) = 0
```
- > for fear that you will create a cycle in the directory tree)

  e.g.
  `a->a/foo` then `ln a/foo .` will make the endless loop `a->a/foo->a->a/foo`.
- [dangling reference](https://stackoverflow.com/a/17997314/21294350) -> invalid reference.
  so soft-link points to the original file while hard points to the *inode*.
- execute bit for [directory](https://superuser.com/a/169418/1658455)
- "transactional file system" uses [atomicity](#Transaction_atomicity) to solve with TOCTTOU.
- > per-process entity, which refers to an *entry* in the open file table

  See xv6 source codes
```c
sys_open(void)
...
if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){

filealloc()
...
for(f = ftable.file; f < ftable.file + NFILE; f++){

fdalloc(struct file *f)
...
curproc->ofile[fd] = f;
```
  so `struct file` pointers `f` (i.e. entry) in `ftable` are shared across processes.
- ~~can't be~~ [removed](https://unix.stackexchange.com/a/29572/568529) from the `wheel` group which is related with [`sudo`](https://en.wikipedia.org/wiki/Wheel_(computing)#Wheel_group) (this is just one convention and needs [visudo](https://superuser.com/a/1082668/1658455) modification to take effect)
```bash
$ sudo gpasswd -d czg_arch wheel
Removing user czg_arch from group wheel
gpasswd: user 'czg_arch' is not a member of 'wheel'
[czg_arch ~/czg_tmp]$ id
uid=1000(czg_arch) gid=1004(czg_arch) groups=1004(czg_arch),964(docker),991(lp),998(wheel)
[czg_arch ~/czg_tmp]$ id czg_arch 
uid=1000(czg_arch) gid=1004(czg_arch) groups=1004(czg_arch),991(lp),964(docker) # weird: different from above.
[czg_arch ~/czg_tmp]$ whoami 
czg_arch

$ sudo -i
$ visudo
...
## Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL:ALL) ALL
%wheel ALL=(ALL:ALL) NOPASSWD: ALL # no need for passwd to use the "sudo"

# after roobot, the czg_arch has no sudo permission even with the password.
```
## File System Implementation
- > unlike our development of CPU and memory virtualization, we will not be adding hardware features

  CPU virtualization -> needs "hardware-specific trap instruction" in [ostep_book] 72/709.
  memory virtualization -> "including hardware features such as TLBs" in [ostep_book] 144/709.
- `blk` in p5 means the block location in the inode region.
- [`btrfs_inode`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/btrfs/btrfs_inode.h#L73)
  general [`inode`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/include/linux/fs.h#L639-L640)
- "dou-ble indirect pointer" similar to multi-level page tables.
- > they are akin to segments in the discussion of virtual memory

  TODO po segment is fixed size which is similar to but not same as the length in "extents".
- p8 `strlen` is different from the lib function `strlen` which excludes the ending `'\0'`.
- > contains inode number 2 (the *first inode* block)

  TODO p4 d-map is the block 2.
- > , one to the *data of the directory* (to link the high-level name of the file to its inode number), and one *read and write* to the directory inode to update it

  i.e. foo data write (modify directory contents) "data of the directory" -> foo inode write (here read has been done before "foo data write") to modify the *metadata* of the directory.
  - > one read to the inode bitmap (to find a free inode), one write to the inode bitmap (to mark it allocated), one write to the new inode itself (to initialize it)

    in the figure also "bar inode" read before write.
- > must not only allocate an inode, but also allocate space within the directory containing the new file.

  this is based on *already needing* file contents allocation.
  - "file creation" mainly implies possible directory modification so more I/O.
  - Figure 40.4 the last three big blocks -> "writing to the file" without creating (although here is after creation).
    - > two more to read and then write the inode (which is updated with the new block’s location)

      is splitted by the "read the data bitmap" , "write the bitmap" and "one to write the actual block itself." (i.e. bar data [n]).
- See chapter 22 LRU comparison with others.
- > by delaying the write after the first update

  i.e. delaying the write of the *inode bitmap*.
- > then schedule the subsequent I/Os

  i.e. See chapter 37.
## Fast File System
- differentiate BSD author [Bill Joy](https://en.wikipedia.org/wiki/Bill_Joy) which is also the author of `vi` from the UNIX author Ken Thompson.
- ["Record-based storage systems"](https://en.wikipedia.org/wiki/Record-oriented_filesystem) maybe based on [lines](https://en.wikipedia.org/wiki/Storage_record)
- "ASIDE: FFS FILE CREATION" same as the previous chapter create a file.
- > just a (relatively) little time seeking between chunks of the block.

  See chapter 39
  So although seek inside the disk may be high, but the seek time between disks or different groups in the disk is smaller.
  Then in total, less time somewhat.
- Figure 41.2 seems to be wrong.
```python
import matplotlib.pyplot as plt 
import numpy as np
t2 = np.arange(0.0, 1.0, 0.1)
plt.figure()
plt.plot(t2, 20*t2/(1-t2),'r--')
plt.show() 
```
- > every 1024 blocks of the file (4MB) were placed in separate groups, the lone exception being the first 48KB of the file as pointed to by direct pointers

  See "The Multi-Level Index"
  1024 refers to indirect ones instead of direct ones.
- > would buffer writes and then issue them in 4KB chunks to the file system

  So will *know* at that time whether 4KB or sub-blocks then copy *avoided*.
- With "track buffer", the "staggered layout scheme" is not needed.
- > Long file names, symbolic links, and a rename operation that worked atomically all improved the utility of a system

  From 40.7, use cache to help "Long file names".
  And see the following in p12.
## FSCK and Journaling
- > 8 total, numbered 0 to 7, and spread across four blocks

  this is different from "a 4-KB block can hold 16 inodes," said in [ostep_book] 534/709.
- > ensuring that no directory is linked to more than once

  i.e. the soft/symbolic link is not taken in account for the *link count*.
- > With write buffering enabled (sometimes called immediate reporting

  maybe due to:
  the write doesn't need wait -> *immediate* reporting
  - This also applies to CPU cache where write actual order may differ from the *issue* order.
- > only after these writes *complete* can the file system send the transaction-end block to disk ... usually an extra rotation is incurred (think about why)

  because these data is probably adjacent and the send after completion has probably *skipped* the write at *the 1st rotation*.
- > during recovery, the file system sees a mismatch in the computed checksum versus the stored checksum in the transaction

  so five original writes -> one single write with the *checksum*.
- > one should make it a single 512-byte block.

  to ensure it *not combined with later* other writes.
- > ensures that the on-disk structures are consistent

  i.e. between the log and the disk data.
- > minimally including: the inode bitmap (to allocate a new inode), the newly-created inode of the file, ...

  See "Figure 40.4" four writes in "create" row.
- > logically commit all of this information to the journal for each of our two file creations; ... end up writing these same blocks over and over

  i.e. logical logging.
  write two times because "two file creations"
- > thus reduces recovery time as well as enables re-use of the log in a circular fashion

  here "circular" doesn't mean replace the head after *reaching across the end*.
- p14: "Data write" first to ensure *no need to recover the user data* and "never point to garbage".
  - Notice same as before and `free` function implementation, the free space is *not reset* but only removed from the *allocation range*.
    > mark the transaction free in journal superblock

- See [p33,34](https://compas.cs.stonybrook.edu/~nhonarmand/courses/fa17/cse306/slides/18-fs_consistency.pdf)
  unordered refers to order of data w.r.t. metadata.
- > any such revoked data is never replayed

  i.e. the record *right before the revoke* record.
- COW see [this](#COW_btrfs)
  > This technique never overwrites files or directories in place

  So there is *no intermediate state* for the old copy.
## Log-structured File Systems
- > places chunks of the inode map right *next to* where it is writing all of the other new information

  > The checkpoint region contains pointers to (i.e., addresses of) the latest pieces of the inode map

  So why not just make CR points to inodes?
  See "43.8 What About Directories?" where both the dir and the file need to be tracked.
  - Also see the homework 1 `./lfs.py -n 3` where data location can be kept with *just updating the imap*.
- > whenever an inode is updated, its location on disk changes. If we hadn’t been careful, this would have also entailed an update to the directory that points to this file

  Without the imap, there would be *two* locations for the same *inode number*, so the single inode number isn't enough for the lookup.
  With the imap, it ensures the *one-to-one* map.
- > the LFS cleaner works on a segment-by-segment basis

  > write out a new set of segments with *just the live* blocks within them

  ~~TODO So needs all segments are old which may be not the case sometimes.~~
- > find its inode number N and offset T. 

  based on the 2nd picture in p9, imap only maps `N` to the latest inode block.
  So only one data block is valid.
- > Worse, we *never overwrite in place*, and thus the latest version of an inode (i.e., the one we want) keeps moving.

  > more and more blocks are getting over-written (in new segments) and thus being freed for use

  i.e. the hot segment may have *more free* blocks in the future so that delay it.
  "hot" -> changing more frequently.
- > keeps two CRs, one at either end of the disk

  as the backup of each other.
- The log may be specific to the [*interval between checkpoints* "A long interval between ..."](https://web.stanford.edu/~ouster/cgi-bin/papers/lfs.pdf), so more efficient in some way than the previous chapter.
  the basic replay is probably [same](http://cs.williams.edu/~jannen/teaching/s20/cs333/meetings/LFS.pdf) as the previous chapter.
  Roll forward: it is [based on the checkpoints](https://elfi-y.medium.com/operating-systems-101-persistence-log-structured-file-system-and-flash-based-ssd-vi-e9620d79668b) as the book says.
## Flash-based SSDs
- why use NAND See [asm_md] "NAND_FLASH_SSD".
  - It shows
    1. > (by setting each bit to the value 1)

      is the reset operation to the floating gate.
      - Also implies
        > the level of charge trapped within the transistor is mapped to a binary value. 

        because the electron means 0.
- > it can be erased *only a block* at a time

  From [this](https://en.wikipedia.org/wiki/Flash_memory#Block_erasure) referenced by [this](https://community.st.com/t5/stm32cubeprogrammer-mcus/why-it-s-necessary-erase-the-flash-before-write-in-code-time/td-p/127616#:~:text=%3E%20Why%20in%20code%20time%20we,hardware%20limitation%20of%20FLASH%20memory.)
  - ~~maybe~~ due to as books says
    > The erase command is quite expensive, taking a few milliseconds to complete

    or from wikipedia
    > Because erase cycles are slow, the large block sizes used in flash memory erasing give it a *significant speed advantage* over non-flash EEPROM when writing large amounts of data. As of 2019, flash memory costs greatly less than *byte-programmable* EEPROM

- > it is possible that some bits get flipped in neighboring pages

  It is also said in ~~csapp~~ COD "row hammer".
- > the costly read-modify-write of the direct-mapped

  > read in the entire block (costly), erase it (quite costly), and then program it (costly).

  here read intended to move the data elsewhere.
- > read in the entire block (costly), erase it (quite costly), and then program it (costly).

  log in the on-disk memory.
  > Because of the log-structured nature of the device, overwrites create garbage blocks

  i.e. not overwrite in place but elsewhere.
- "checkpointing" avoids the *entire* search of "a large SSD".
- > find a block that contains one or more garbage pages, read in the live (non-garbage) pages from that block, write out *those live* pages to the log, 

  same as lfs chapter p10
  > the LFS cleaner reads in a number of old (partially-used) *segments*, determines which blocks are live within these segments, and then write out a new set of segments with *just the live* blocks within them

- > it is highly useful to know that a block is no longer needed, as the SSD can then remove this information from the FTL and *later reclaim* the physical space during garbage collection.

  `trim` *accelerates* the reclamation without consulting the map to know whether dead-block.
- > Adding more capacity also increases internal bandwidth, which can be used for cleaning and thus *not harm* perceived bandwidth to the client

  because the banks can be in *parallel* which is different from the hard disks.
- > This data copying increases write amplification greatly

  so the optimal "amplification" is `1`.
- "Hybrid Mapping" guess based on Block-Based Mapping
  i.e. small writes -> page mapping
  large writes -> block version.
- switch merge
  1. switch: the "log block" from block 0 -> 2
  2. merge: 4 log pointers -> 1 data pointer
  - > Why is it more challenging to handle? 

    i.e. unable to switch and merge
    so 2 logs plus one data 
    and if next is block write, block 1 will be used and there is fragmentation inside the block 0.
- > Logical blocks 2000, 2001, 2002, and 2003 all have the same chunk number (500)

  $500=2000/4$ where 4 is the page num in one block.
- > logical blocks 1002 and 1003 are read from physical block 2, and then *appended to the log*. 

  ~~the "log" is for recovery while it doesn't need for "switch merge"?~~
  > The resulting state of the SSD is the *same as the switch merge* above; however, in this case, the FTL had to perform extra I/O to achieve its goals

  ~~TODO~~ ~~so why must make the log block erased~~ ~~since same as "switch merge", then how to use the advantage of the log block? only acquiring the advantages when writting to the log block?~~
  > For example, imagine that logical blocks 0, 4, 8, and 12 are written to log block A. ... the log block A can be freed.

  the log block is just one *temporary* block which stores the recent pages to write.
  So p16 top figure will then copy `c,d` to block `0` -> p15 3rd figure.
  - See
    > thus the FTL must read 1, 2, and 3 from *elsewhere* and then write out 0, 1, 2, and 3 together.

    it is to ensure block 1 is *consecutive*.
    here "0, 1, 2, and 3 together" to the assigned block for 0.
- > The basic *log-structuring* approach does a good initial job of spreading out write load, and *garbage collection* helps as well

  these two imply the *sequential* write.
- > SSD random read performance is not as good as SSD random write performance

  because
  > transforms random writes into sequential ones

  while the random reads can't be transformed. 
  - "Sequential writes" better because *less* overhead of the mapping log. See "switch merge".
    - "Sequential read" better than "Sequential writes" is obvious because exactly *no* "overhead of the mapping log".
- ["Request Scale"](https://pages.cs.wisc.edu/~jhe/eurosys17-he.pdf) means write-buffering in some way.
- > Most FTLs are log-structured, which reduces the cost of writing
  as before said, sequential and write elsewhere accelerates this process.
### write amplification
1. Wear Leveling
  > periodically read all the live data out of such blocks and re-write it elsewhere

  - This is for the lifetime of the SSD.
2. > excessive *garbage collection* drives up write amplification

3. in block-based mapping 
  > This *data copying* increases write amplification greatly 

  > perform *extra I/O* to achieve its goals, thus increasing write amplification.

  - maybe better using "working set of necessary translations" with the "page-mapped FTLs".
### Block-Based Mapping
- > the FTL must read in 2000, 2001, and 2003, and then write out all four logical blocks in a new location,

  because here the minimal unit is "block", so although only one page is modified, the whole block is written.
## Data Integrity
- > if the disk head touches the surface for some reason (a head crash
  [See](https://acsdata.com/hard-drive-read-write-heads/#:~:text=The%20heads%20do%20not%20touch,as%20the%20%E2%80%9Cflying%20height%E2%80%9D.)
  > This is essentially air pressure that is *generated by the rotation* of the platters, and it creates *lift* on the heads.
  - The read/write is based on transform between [electric current and the magnetic field](https://en.wikipedia.org/wiki/Disk_read-and-write_head#Traditional_head). 
- > log-structured nature of the NetApp WAFL file system
  i.e. snapshots
- "RAID-DP" better see [this](https://community.netapp.com/t5/Tech-ONTAP-Articles/Back-to-Basics-RAID-DP/ta-p/86123) or [pdf](https://www.netapp.com/pdf.html?item=/media/19939-tr-3298.pdf) version where diagnoal will *drop one disk* so allow detection of two-disk errors.
  TODO [math][C+04]
- ~~TODO~~ "XOR-based checksums" is just the *multi-bit* parity.
- > disk sector or block
  as ssd chapter says, "block" terminology meaning depends on the context.
- "Checksum" is used to *detect*, so no strong need for correction offered by error codes like the hamming code.
## Summary Dialogue
- [erasure code](https://www.techtarget.com/searchstorage/definition/erasure-coding#:~:text=Erasure%20coding%20(EC)%20is%20a,different%20locations%20or%20storage%20media.) is more redundant version.
## TODO
- 38
  - > then our total bandwidth for small writes will be $\frac{N}{4}*R$ MB/s

    because based on the book example, `1,10` will occupy four slots and make the following requests *block*
    if one of `1/10` finished, still only 3 slots (including one parity slot) avialable, so still somewhat block.
    so only when both `1` and `10` finished, the bandwidth will be normal -> division of 4 in $\frac{N}{4}*R$
    - since here no bottleneck -> $*N$
  - [RAID-6 encoding](https://en.wikipedia.org/wiki/Standard_RAID_levels#General_parity_system)
- 39
  - > This last step *atomically* swaps the new file into place, while concurrently deleting the old version of the file

    How implemented in [`do_renameat2`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/namei.c#L4898-L4899)
  - > you are making a structure (the inode) that will track virtually all relevant infor-mation about the file

    how inode data struct defined.
- 42
  - > until the delete of said blocks is checkpointed out of the journal.

  i.e. after really delete? so the said blocks can't be seen.
- 43
  - > simply by comparing the on-disk version number with a version number in the imap

    how does this version show the specific information about one *specific file*?
### 44
- "latency of reads, programs, and erases" shown where in [V12]?
### 45
- > Only if the writes to both the inode and the data
  overheads maybe higher than one read and one write, so how do ZFS help this problem with the write complexity?
- >  because the copy is needed anyhow (e.g., to copy the data from the kernel page cache into a user buffer), combined copying/checksumming can be quite effective.
  > combine data copying and checksumming
  i.e. avoid the context switches?
# distribution
## Distributed Systems
- "Figure 48.4" is just [TCP](https://www.geeksforgeeks.org/differences-between-tcp-and-udp/).
  i.e.
  > The most commonly used reliable communication layer is known as TCP/IP, or just TCP for short
- "sequence counter." space `O(1)`
  "unique ID " space `O(n)`
- > internally, the code in the client stub for func1() does this
  the stub is like high-level language code generated by the compiler.
- > The RPC layer achieves the desired level of responsibility by using timeout/retry and acknowledgments much like we described above
  then achieve the same result with no transfer overheads by *internal* `ack`.
- ["End-To-End Arguments"](https://web.mit.edu/Saltzer/www/publications/endtoend/endtoend.pdf) meaning?
  i.e. highest level because it is where the data is used?
  - > This paper articulates the argument explicitly, so as to examine its nature and to see how general it really is.
    "argument" means something like opinions.
  - > The simple strategy outlined above, transmitting the file and then checking to see that the file arrived correctly, would perform more poorly as the length of the file increases. The *probability* that all packets of a file arrive correctly *decreases exponentially* with the file length, and thus the expected time to transmit the file *grows exponentially* with file length.
    > Thus the amount of effort to put into reliability measures within the data communication system is seen to be an *engineering tradeoff* based on performance
    due to the checksum no ability to correct the errors, the file may be needed to re-transfer. -> higher overheads than low-level where only one packet needs to be transferred.
- "big-endian"
  - here "endian":
    > describing the impact of the "first" bytes, meaning at the *smallest address or sent first*
  - "big":
    > A big-endian system stores the *most significant* byte of a word at the smallest memory address
- > it thus *calls back* into the RPC layer
  implies the stub abstraction.
- RPC has less communication overheads compared with DSM due to less communication counts, etc.
## NFS
- generation number
  i.e. if one file is deleted and one new is created, maybe inode is reused to refer to one *new* file, so *new generation*.
- ~~TODO po~~ `NFSPROC_WRITE` means `return` "attributes" based on other info formats.
  See
  > The READ protocol message requires the protocol to pass along the file handle of the file *along with* the offset within the file *and* number of bytes to read
  ~~- "attributes" -> return code~~
  - `NFSPROC_GETATTR` is to ensure *stateless* available.
- > how this protocol is turned into a file system across the client-side file system and the file server.
  "client-side file system" issues requests and ~~the file server uses its saved state to manipulate with.~~
- based on "Figure 49.5" and description before, only the `/` info is shared which minimizes the recovery overheads and `FH` is only maintained by the server. 
  -> so client crashes are solved.
  - > the *client tracks all* relevant state for the file access
    so server crashes are solved.
  - So `fd` (client) -> `FH` (server) -> inode (server)
    instead of originally "`fd` (server) -> inode (server)"
    - > the file handle (and attributes) for foo.txt will be returned.
      "attributes" i.e. `struct stat` also (server)
- ["Idempotence"](https://en.wikipedia.org/wiki/Idempotence) -> reentrant in csapp.
- >  Specifically, after sending the request, the client sets a timer to go off after a specified time period
  same as the previous chapter "timeout/retry".
- "49.8 Improving Performance: Client-side Caching" similar to the before technology but the disk and memory is *substituted* by the network and memory/disk.
  - > Adding caching into any sort of system with multiple client caches introduces a big and interesting challenge which we will refer to as the cache consistency problem
    think as multiple-core CPU as COD says.
    - So needs above "generation number"?
    - similar to COD, maybe need one protocal to broadcast (maybe solves "update visibility") and invalidate to others (solves "stale cache"), etc
      however above is stateful which stores *states in the clients* instead of all maintained by the servers.
      - So 
        - > the client invalidates the file, thus removing it from the client cache
          invalidate to *self*
- > a flush-on-close (close-toopen) approach ensures that when a file is closed
  because the modification of one file is *atomic w.r.t. each close*.
- > the second trick is to use a file system design specifically designed to write to disk quickly when one finally needs to do so [HLM94, RO91]
  i.e. tuned w.r.t. the physical storage devices like LFS which referenced in [RO91] does.
- > Sun introduced the VFS/Vnode interface, enabling multiple file system implementations to coexist in the same operating system.
  maybe one layer *above* the NFS "Client-side File System".
- "update visibility" -> C2's data is in its *memory* which may not be visible to others.
  "stale cache" -> C2's data is in the *server* while others may use the *old its cache*. 
## AFS
- > the server will inform the client when a file that the client is caching has been modified.
  > notice the analogy to polling versus interrupts.
  similar to the invalidate in MESI. See COD.
  > thus ensuring that the server would notify the client of a change in its cached state
  callback -> interrupt handler.
- > a file identifier (FID) (*similar to* the NFS file handle) 
  > An FID in AFS consists of a volume identifier, a file identifier, and a “uniquifier” (to enable reuse of the volume and file IDs when a file is deleted)
  here the basic idea is same but with different names.
- compare "Figure 49.5" with "Figure 50.2",
- "callbacks" can solve the "cache staleness" obviously because of the immediate update
  and "update visibility" indirectly because of "flush-on-close".
  > Finally, upon close(), the file (if it has been modified) is flushed back to the server
- > writes to a file are immediately visible to other local processes 
  at least achieved by the shared memory. This is ensured by [POSIX specification](https://stackoverflow.com/a/64093650/21294350).
- > in NFS, writes of *individual blocks* may be flushed out to the server
  See the previous chapter p14.
- > treat all of its cache contents as suspect
  here is in the cache disk.
- > with NFS, clients hardly noticed a server crash
  because the clients just retry and don't care about the server crash.
- > however, those writes are buffered by the local (client-side) file system cache and thus said costs are likely hidden.
  i.e. delayed so that overlaps with the following operations.
- > because the client first fetches the old file in its entirety, only to subsequently overwrite it. NFS, in contrast, will simply overwrite blocks and thus avoid the initial (useless) read
  See the previous chapter p14 where each block is just overwritten.
  Here since AFS updates each file as one minimal unit, so it needs to fetch the newest one to update *based on it*.
- > were not frequently shared
  so "overwrite" across clients is not frequent.
- > NFS, in contrast, allows each client to mount NFS servers in any way that they please
  See
  > indeed, this would be obtained through the NFS *mount protocol*, which is how clients and servers first are connected together
  - while for AFS
    > The server, in order to access the file, must perform a full pathname traversal, *first looking in the root* directory to find home
    so
    > AFS provides a true global namespace to clients
    i.e. root dir.
- > includes facilities for flexible user-managed access control
  > incorporates mechanisms to authenticate users
  See [ostep_book] p495/709.
- > adds server state
  See 50.4, i.e. immediate invalidate.
## TODO
- 48
  - > when you’re in a data center with thousands of machines, failure is happening all the time. 
    maybe every machine can function as either a client or a server.
- 49
  - > NFS ensures that a subsequent open from another node will see the latest file version.
    So unable to open concurrently?
  - > where details of an implementation serve to define user-observable semantics, instead of the other way around.
    i.e. instead of "user-observable semantics serve to define details of an implementation"?
- 50
  - why v1 compared with NFS, no `CREATE,REMOVE` and DIR related.
  - > load was not balanced across servers
    `NFS` may use `FH` to spread the load.
    > the server used a single distinct process per client
    `NFS` may be multi-thread.
  - ~~Why $P_2$ doesn't write to the server on `close()` in Figure 50.3.~~
    because it is after `read`.
  - "Figure 50.4"
    ~~here (NFS,AFS)-7 should be $(N_L · L_{net},L_{net})$~~
# Security
## Intro Security
- [enclave](https://en.wikipedia.org/wiki/Enclave_and_exclave) is something totally surrounded by self.
- scheduling policy relation with security in the operating system
  See
  > We might have an availability goal stating that one process run-ning on the system cannot hog the CPU and *prevent other processes from getting* their share of the CPU
- [IPC](https://en.wikipedia.org/wiki/Inter-process_communication)
  - related with networks like [TCP](https://security.stackexchange.com/questions/146522/secure-tcp-traffic-for-inter-process-communication)
- > nor operating system services
  i.e.
  > *System calls* offer the operating system another opportunity
- > determine which process made the system call
  [this](https://unix.stackexchange.com/a/364505/568529)
  Also see the next chapter
  > Associated with the calling process is the OS-controlled data structure that describes the process,
## Authentication
- page [frame](https://stackoverflow.com/a/42263132/21294350)
  > Logical pages are mapped to page frames using page tables.
  [relations](https://cs.stackexchange.com/a/11670/161388) with page
  >  a page may *not be backed* by a page frame (it could be a zero-fill page which hasn't been accessed, or paged out to secondary memory), and a page frame may back *multiple* pages
- Password [Salting](https://cyberhoot.com/cybrary/password-salting/)
  Also see p8,9/19
- [zero-day exploits](https://en.wikipedia.org/wiki/Zero-day_(computing)#Window_of_vulnerability) means
  the exploit is before the patch. Also [see](https://usa.kaspersky.com/resource-center/definitions/zero-day-exploit)
  > which means they have “zero days” to fix it.
- why linux echo name but [not](https://askubuntu.com/a/331472/1682447) password
  > it is very common that someone will *copy* text from the command line and make it available to untrusted persons
- [typing patterns](https://en.wikipedia.org/wiki/Keystroke_dynamics) [codes](https://www.typingdna.com/docs/how-to-record-typing-patterns.html)
- [phoneme](https://en.wikipedia.org/wiki/Phoneme) means something like phonetic symbols.
- IOT [related](https://dataconomy.com/2022/08/23/ubiquitous-computing-pervasive-computing/) with pervasive computing
  > ubiquitous computing will fall under *human-machine* interaction. IoT will fall under machine-to-machine interaction
- PIN [vs](https://learn.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-why-pin-is-better-than-password) password
  > A PIN can be a set of *numbers*, but enterprise policy might enforce complex PINs that include special characters and letters
  > That PIN is useless to anyone without that specific hardware.
## Access Control
- > We could have one big access control list that specifies allowable access to *every* room, but that would get *unmanageable*
  because we need to ensure "least privileges".
- > understand that the namespaces are different – that’s what we do with process IDs, for example
  similar to cpp namespace
  [See](https://man7.org/linux/man-pages/man7/pid_namespaces.7.html)
  > PID namespaces isolate the process ID number space, meaning that processes in different PID namespaces can have the *same* PID.
- > maybe it can just generate that bit pattern and successfully give itself the desired access to the file
  ACL needs privilege to change so this problem gets solved.
  > the ability to copy a capability would suggest we can’t take access permission away,
  ACL *relates* itself with the file so maybe not easy to copy although it can.
  - So simialrly for the "capability"
    > The *operating system* controls and maintains capabilities,
- > With capabilities, it’s easy to determine which system resources a given principal can access. Just look through the principal’s capability list
  this is the cons of the ACL.
  So
  > On the other hand, determining the entire set of principals who can access a resource becomes more expensive
  this is the pros of the ACL :)
- > Simple methods for making capability lists short and manageable have not been as well developed as the Unix method of providing short ACLs
  because files are difficult to be classified in groups.
- > you also run some degree of mandatory access control. If not, in the example of sudo above, the user running under the Programmer identity could run a command to change the access permissions on files
  i.e. reset to the original state after `setuid` back to the original user, etc.
- > Security failures due to poorly designed policies implemented by those mechanisms are not.
  because these policies are *designed* by the users.
## crypto
- how does [POW](https://www.forbes.com/advisor/investing/cryptocurrency/proof-of-work/) verify. [Also](https://www.fool.com/terms/p/proof-of-work/)
  > For the block to be confirmed, a crypto miner must generate a target hash that's less than or equal to that of the block.
  See [this](https://medium.com/coinmonks/how-preventing-spam-emails-led-to-proof-of-work-46a294b2435) related with the spam.
  > but mass spam emailers will have *difficulty* generating the required *proofs*, which would require huge computational resources.
  i.e.
  > Since each hash operation takes some time, submitting a proper request will require a *predictable amount of work*
- [Heartbleed](https://www.csoonline.com/article/562859/the-heartbleed-bug-how-a-flaw-in-openssl-caused-a-security-crisis.html#:~:text=Heartbleed%20works%20by%20taking%20advantage,allowing%20the%20attacker%20access%20to)
  bound `payload` in `memcpy(bp, pl, payload);` isn't checked.
- [Forward](https://en.wikipedia.org/wiki/Forward_secrecy) secrecy
  > Forward secrecy protects *past* sessions against *future* compromises of keys or passwords. By generating a unique session key for *every session* a user initiates, the compromise of a single session key will not affect any data other than that exchanged in the specific session protected by that *particular key*
  > This by itself is not sufficient for forward secrecy which additionally requires that a *long-term secret* compromise does not affect the security of past session keys.
  i.e.
  > If you use random chance to generate keys, though, figuring out one of them *won’t help* your opponent figure out any of your *other* keys
- gathering [entropy](https://en.wikipedia.org/wiki//dev/random)
  > The Linux kernel *generates entropy* from keyboard timings, mouse movements, and integrated drive electronics (IDE) timings
  > Embedded systems have difficulty gathering enough entropy as they are often very simple devices with *short boot* times
- at-rest data / Data at [rest](https://en.wikipedia.org/wiki/Data_at_rest)
- [SQL injection](https://en.wikipedia.org/wiki/SQL_injection) just the [literal](https://en.wikipedia.org/wiki/Code_injection) meaning.
## Distributed
- [bootstrap](https://en.wikipedia.org/wiki/Bootstrapping#Software_loading_and_execution) means 
  > It became a self-sustaining process that proceeded *without external help*
- > Best cryptographic practice calls for you to use a brand new key to encrypt the bulk of your data for each connection you set up
  ~~TODO~~ same as "Forward secrecy" before.
- [primitive mod](https://en.wikipedia.org/wiki/Primitive_root_modulo_n)
  > The remainders in the period, which are 3, 2, 6, 4, 5, 1, form a rearrangement of *all nonzero remainders* modulo 7
  > if for *every* integer a coprime to n, there is some integer k for which $g^k ≡ a (mod n)$.
- [discrete logarithm](https://en.wikipedia.org/wiki/Discrete_logarithm#Powers_of_10) means integer version.
  ~~TODO~~ [related](https://en.wikipedia.org/wiki/Discrete_logarithm#Modular_arithmetic) with the book Modular arithmetic.
  here the attacker needs to get the [index](https://en.wikipedia.org/wiki/Discrete_logarithm#) `x` by `X,g,n`
- `k` is the "secret key" shared, i.e. `18` [here](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange#Cryptographic_explanation).
- > like preventing an eavesdropper from simply using a cookie that was copied as it went across the network
  because they are encrypted.
- > up will pop a message warning you of the danger and asking if you want to go ahead despite the risk
  maybe same as "Diffie-Hellman", authentication will help with this problem.
## TODO after reading the security books
1. How SHA-1 cracked.
### Intro Security
### Authentication
- > having to store the access control information somewhere near the file and dealing with potentially expensive searches of long lists.
  seems to have been solved by
  > And instead of a search of an arbitrary sized list, a little simple logic on *a few bits* would provide the answer to the access control question.
### Distributed
- SSH SSL [diff](https://managewp.com/blog/ssh-vs-ssl#:~:text=SSH%20uses%20a%20username%2Fpassword,connection%20between%20servers%20and%20browsers.)
# hardware
## TODO
- SCSI disks vs IDE disks / ATA.
# appendix
## book recommendation
- "Debugging with GDB: The GNU Source-Level Debugger" 10th is offered [officially](https://sourceware.org/gdb/current/onlinedocs/gdb.html/) when [12th](https://www.amazon.com/Debugging-GDB-GNU-Source-Level-Debugger/dp/1680921436#:~:text=gdb%20can%20do%20four%20main,when%20your%20program%20has%20stopped.) is available.
## Virtual Machines
most of these have been said in COD.
- [`int 0x80`](https://stackoverflow.com/a/1817579/21294350)
- trap means switch / [capture](https://softwareengineering.stackexchange.com/a/419126) the interrupt.
- Figure B.1 just same as Figure 6.2.
- TODO
  - > the VMM installs its desired VPN-to-MFN mapping
    > the VMM must track the *physical*-to-machine mappings for each virtual machine it is running
    So PPN or VPN?
  - > are not particularly meant to make the hardware easier to use.
    because of more overheads?
## projects-systems
- TODO
  - [where](https://github.com/remzi-arpacidusseau/ostep-projects/tree/master/initial-reverse) is "G.4 Intro to Concurrency"?
    - Also
      1. G.7 File System Defragmenter
      2. G.8 Concurrent File Server
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
  - where is
    1. H.7 Advanced Kernel Threads
    2. H.8 Extent-based File System
- ["H.11 File System Checker"](https://github.com/remzi-arpacidusseau/ostep-projects/tree/master/filesystems-checker)
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
- [D+13]
- [T+94]
- [H01, H91, H93]
- [PDZ99, WCB01]
  - [PDZ99] See highlights for how IPC is used for switching between threads and the event loop.
- "recent advances" with `fsck` [M+13]
- Soft Updates [GP94]
- [C+12]
- potential harms, see Mogul [M94].
- how to do better [MR+97]
- [J10] which needs the access rights.
- [A+08, M+14]
- [M+14]
- [HLM94, RO91]
## history
- [S08]
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
this [issues](https://github.com/xxyzz/ostep-hw/issues/19#issuecomment-1636791448): IMHO just comparison based on the same benchmark is enough, similar to `perf` benchmark when reading the COD.
1. obviously same
2. same as 1.
3. similar to the book example.
  [TODO meaning](https://github.com/xxyzz/ostep-hw/pull/6)
1. with the increasing order.
2. same length of each workload and same slice time as the workload time.
3. longer; 
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
See [some problems](https://github.com/xxyzz/ostep-hw/pull/3#issuecomment-652352748)
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
1. [`kill -l `](https://stackoverflow.com/a/29383998/21294350) to check the signal number and `man 7 signal` to get the detailed infos.
  - Use [`/bin/kill -L`](https://forums.gentoo.org/viewtopic-p-7533822.html?sid=caddea015137c286957f10ee0fcdeaa2#7533822) to get the table which is also shown in `man kill` NOTES.
2. `Address 0x0 is not stack'd, malloc'd or (recently) free'd`
3. here `total heap usage: 2 allocs, 1 frees, 1,028 bytes allocated` is due to [`printf`](https://stackoverflow.com/questions/74019895/valgrind-many-allocated-bytes#comment130694195_74019895)
  where `--run-libc-freeres=no` avoids free when `exit` which will run after the `main`.
  > Memcheck therefore tries to run __gnu_cxx::__freeres *at exit*.

  Also see [asm_md] "Still reachable".
  - related with [OSX](https://stackoverflow.com/a/29810040/21294350).
    > The issue with standard streams (*stdout, stderr*), is one normally doesn't close them, as a result this buffer will normally never be freed.

    > This is a *fixed sized* buffer which is not going to grow in size, so it is *not a "leak"* as such.

1. ~~`Address 0x4bf91d0 is 224 bytes inside an unallocated block of size 4,194,032 in arena "client"`~~
  ~~implies VA -> physical address.~~
  See [ostep_hw], this has excessed too much
  with `data[25]=0;`, the error output may be more understandable.
1. TODO <a id="algorithm_1"></a>
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
### C28
1. here `sub  $1, %bx` changes the thread private register, so not in the critical section.
2. `./x86.py -p flag.s -M flag -c -R ax,bx`
3. `./x86.py -p flag.s -M flag,count -c -R ax,bx -a bx=2,bx=2`
4. 
```bash
$ ./x86.py -p flag.s -M flag,count -c -R ax,bx -a bx=3,bx=3 -i 4 # this may cause weird interleave
    0     1       0     3                            1001 test $0, %ax
    0     1       1     3   ------ Interrupt ------  ------ Interrupt ------  
    0     1       1     2   1008 sub  $1, %bx
    0     1       1     2   1009 test $0, %bx
    0     1       1     2   1010 jgt .top
    0     1       0     2   1000 mov  flag, %ax
    0     1       0     3   ------ Interrupt ------  ------ Interrupt ------  
    0     1       0     3                            1002 jne  .acquire
    1     1       0     3                            1003 mov  $1, flag
    1     1       1     3                            1004 mov  count, %ax
    1     1       2     3                            1005 add  $1, %ax
    1     1       0     2   ------ Interrupt ------  ------ Interrupt ------  
    1     1       0     2   1001 test $0, %ax
    1     1       0     2   1002 jne  .acquire
    1     1       0     2   1003 mov  $1, flag
    1     1       1     2   1004 mov  count, %ax
    1     1       2     3   ------ Interrupt ------  ------ Interrupt ------  
```
here `.acquire` is *splitted* which causes both threads run `mov  $1, flag`.
`./x86.py -p flag.s -M flag,count -c -R ax,bx -a bx=3,bx=3 -i 8` works by makeing the lock and "critical section" as the whole entity.
- TODO math proof what number with `-i` works.
5. `xchg` ensures the `flag/mutex` is changed with just one instruction.
6. always work. `./x86.py -p test-and-set.s -M mutex,count -R ax,bx -c -a bx=10,bx=10 -i 1`
   Yes due to the loop of `.acquire`
   The `count` is `20`
7. `./x86.py -p test-and-set.s -M mutex,count -R ax,bx -c -a bx=10,bx=10 -P 0011` no abundant interrupts at the end.
  "Fairness" depends on the scheduler.
8. `turn == 1 - self` in "Peterson’s algorithm" must make one thread spin because of `self` is *unique* in each thread while in the former examples, `flag` is always tested with `0`.
  - `jne .fini` implements the "short-circuiting".
  - `./x86.py -p peterson.s -M flag,count -R ax,bx -c -a bx=1,bx=0 -i 1`
    here after "critical section" no loop occurs. So `count` should be `2`.
  - here `turn = 1 - self;` or `turn = self;` all are fine becasue the mutex is implemented with `turn == 1 - self`. See "peterson_mod.s".
9. 
10. similar to 7 where the atomic property ensures the correctness.
11. same as "Figure 28.7".
12. obviously yes.
13. same as 12
14. `yield` only works more efficiently when interrupt cycle is large so that the thread can yield the CPU before the schedule ends.
```bash
$ ./x86.py -p yield.s -M mutex,count -R ax,bx -c -a bx=10 -i 10 -c -t 3 | wc -l
505
[czg ~/ostep-homework/threads-locks]$ ./x86.py -p test-and-set.s -M mutex,count -R ax,bx -c -a bx=10 -i 10 -c -t 3 | wc -l
554
```
15. avoid one more `xchg %ax, mutex     # atomic swap of 1 and mutex` sometimes.
  "avoid unnecessary writing." especially when writing to mem.
### C29
[Benchmark_IA_64]
- problem list
  1. "Register Overwriting" can be solved in C6
  2. OoO by `LFENCE` or `cpuid`, etc
    however the latter is [not preferred](https://stackoverflow.com/a/12634857/21294350) due to
    > since virtual machine platforms often trap and *emulate* the cpuid instruction

    Also see [intel_64] p3294 footnote 7
  4. See [cflush_rdstc_check_overhead].
- appendix code
  - `spurious` only applies when
    > It is a useful index in case we are evaluating a function whose *complexity is increasing* along the external loop: a more complex function has to take more cycles to be executed; if the minimum measured value is *smaller* than the one measured on the ensemble for the *less complex* function, there is something wrong

    - It is related with [Ergodic](https://en.wikipedia.org/wiki/Ergodic_process) (i.e. each test doesn't influence each other).
      - This is one *expected property of benchmarking self* because it is called many times.
- problems with the calculation of time of *benchmarking self*.
  - > that he cannot benchmark functions whose execution is shorter than 139 clock

    i.e. *benchmarking overhead can't be ignored* in this case.
  - "the variance of the variances" tests "ergodic" of each *ensemble loop* (i.e. `for (i =0; i<SIZE_OF_STAT; i++) ` loop).
- `RDTSCP`
  - > It *cannot, however, guarantee* that  for optimization purposes  the CPU *will not execute,   before the RDTSCP call*, instructions that, in the source code, are *placed after the   RDTSCP function* call itself.

    So better `RDTSCP,lfence`. See the figure in p16
  - "3.2.1"
    - here `RDTSCP` *avoids the overhead of `CPUID`* and also imply the serializing.
      But due to substraction, only the last `CPUID` matters which avoid external influences from functions outside the `RDTSC` block.
    - > since there is a *logical dependency* between RDTSCP and the register edx and eax

      this is the data hazard (if reordered, stall is implied) which is said in [asm_md] csapp and COD.
    - > the other can introduce a variance in terms of clock cycles that is too high to guarantee an acceptable measurement resolution.

      maybe the `CPUID` latency is highly variable to *ensure serializing* although its original goal is just getting the CPU infos.
  - > the total variance (the *average* of the variances in each row);

    it is `tot_var/BOUND_OF_LOOP` of `tot_var` in the appendix code
  - > the standard error on the measure is 1,414 cycles 

    i.e. `1.414` instead `,`.
- Alternative Method
  - See [intel_64] p3294 by [`mov`](https://www.felixcloutier.com/x86/mov-1) doc
    where "*Privileged* serializing instructions" implies
    > not as good as the one presented in Section 3.2.1

    - both `CR8` not serializing and `CR1`, etc., reserved in *x86-64* is [manual designed](https://stackoverflow.com/a/61067408/21294350) without many detailed reasons.
      - Notice x86 registers -> [32-bit](https://wiki.osdev.org/Talk:CPU_Registers_x86-64) which are different from x86-64. Also [see](https://superuser.com/a/96854/1658455)
- serializing instructions
  from [intel_64] p3283 and 3294, "serializing instructions" seems to include `mfence` property.
  > *Reads or writes* cannot be *reordered* with I/O instructions, locked instructions, or serializing instructions.

  > Like the I/O instructions, locked instructions, the LOCK prefix, and serializing instructions *force stronger ordering*

  - Also [see](https://stackoverflow.com/questions/50480511/what-does-serializing-operation-mean-in-the-sfence-documentation#comment87986374_50480511) related with "the store buffer"
    > the processor waits until *all previous instructions have been completed* and all *buffered writes have been drained* to memory before executing the serializing instruction.

    - Also see `mfence` [doc](https://www.felixcloutier.com/x86/mfence)
      "serializing instructions" care about "all previous instructions" instead of only instructions related with memory and "serializing instructions" (implied by "stronger ordering").
      > *Nothing can pass* a serializing instruction and a serializing instruction *cannot pass* any other instruction (read, write, instruction fetch, or  I/O).

      here pass means reorder.
      - po just SC (Sequential	Consistency).
  - [amd_64] p137
    - "flush" -> ["discard" p9](https://courses.cs.washington.edu/courses/cse378/09wi/lectures/lec13.pdf)
      which similar to [`CLFLUSH`](https://www.felixcloutier.com/x86/clflush) to Invalidate cache line but the latter will *flush to memory* ("written back to memory") and the former just discards.
    - p659,
  - > because the results of *speculatively executed instructions are discarded*

    So
    > *prefetching* the destination of a branch instruction ... instruction execution is *not deterministically serialized when a branch instruction* is executed.

    because "prefetching destination of a branch instruction" is executed earlier.
  - > The processor does not write back the contents of modified data in its data cache to external memory

    so "drained to memory" -> drain to cache which may be to memory.
  - [intel_64] p3345 [PML4](https://wiki.osdev.org/CPU_Registers_x86-64#CR3) is why
    > the next instruction is fetched *using the translation tables* that correspond to the new value of CR3

- "3.2.3" is probably wrong.
  1. here `mov %%rax, %%cr0\n\t` functions same as `CPUID\n\t` before 2rd `RDTSC` in the appendix code.
  2. it doesn't have ending `CPUID` which avoids reordering across the 2rd `RDTSC`
    because above "cannot pass" property.
- 3.3.1
  - here 
    1. "total number of spurious min values is zero"
      means the *deviation in each ensemble* in one iteration of j-loop is very *small*.
      So that the min number in each ensemble is *strictly* increasing.
    2. "the total variance"
    3. > meet real-time constraints 

      because "real-time" implies not caring average but caring about each time.
    4. > the variance of the minimum values is completely meaningless

      because complexity is increasing
      This also implies why using the two-level loop. (See "Summary" steps)
  - > minimum variation in the code complexity that *can be revealed*

    i.e. instruction number with variation of 1 *may not be differentiated* maybe due to parallelism.
- relation with [BIOS](https://stackoverflow.com/questions/77034591/what-is-the-relation-between-bios-and-the-benchmark-instruction-pair-cpuid-and?noredirect=1#comment135818245_77034591)
  - SMI in BIOS will [influence the interval](https://stackoverflow.com/a/25778592/21294350) where [SMM](https://en.wikipedia.org/wiki/System_Management_Mode) is what the "firmware" runs which *suspends* the "normal execution".
    > If you see a *long gap* between two timestamp readings

  ```bash
  [czg ~/ostep-hw/29]$ sudo turbostat ./btree_1.out
      # not show SMI column https://www.mankier.com/8/turbostat#
  $ perf stat -a -A -e r02B -- sleep 2
      # all 0
  ```
    - So it will influence the above test
      > low-variance timing for the some work *with interrupts disabled*


---

related with [Benchmark_IA_64] but more focus on `rdstc` self
- IA-64 can [use IA-32](https://stackoverflow.com/a/40689914/21294350)
- [amd specific](https://stackoverflow.com/questions/51844886/is-lfence-serializing-on-amd-processors) and related with `LFENCE`
  - TODO "rev_17h_guide_tmp_no_17h_60h.pdf" has no `LFENCE` description.
  - based on the patches updated with MSR in the kernel and the AMD doc
    - based on [this patch](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/x86/kernel/cpu/bugs.c?h=v4.15.10#n263) from [bbs](https://stackoverflow.com/review/suggested-edits/34938249), my CPU is 17H family and can use the above feature which is also said [here](https://stackoverflow.com/a/12634857/21294350)
      ```bash
      $ journalctl -b > /tmp/test.txt

      $ cat /tmp/test.txt | grep -i "LFENCE"
      # nothing
      ```
    - Also see [`rdstc` doc][intel_rdstc] where `LFENCE` can control although it originally [control](https://www.felixcloutier.com/x86/lfence) "load operations"
      > Specifically, LFENCE does not execute *until all prior instructions* have completed locally, and no later instruction begins execution *until LFENCE completes*.

      This implies `rdstc`
      > executed only after all previous instructions have executed

      - > data can be brought into the caches speculatively just before, during, or after the execution of an LFENCE instruction.

        `LFENCE` doesn't influence the cache order.
      - > stores are globally visible

        implies [cflush_rdstc_check_overhead] `sfence`.
    - [`mfence`](https://stackoverflow.com/a/46123600/21294350) avoids storeLoad reorder which has been said in [asm_md].
      So although [this](https://hadibrais.wordpress.com/2019/02/26/the-significance-of-the-x86-sfence-instruction/#:~:text=The%20LFENCE%2C%20SFENCE%2C%20and%20serializing,can%20serialize%20CLFLUSH%20is%20MFENCE.) said `SFENCE` is ok for intel but `mfence` is [better][cflush_rdstc_check_overhead].
      >  software can insert an SFENCE instruction between CFLUSHOPT and that operation.

      - TODO
        > However, on most Intel processors, mfence is *cheaper* than lfence.

      - > doesn't prevent the core from "hiding" the stores from MESI

        the hiding is due to store buffer,
        So `sfence` doesn't "flush the store buffer" while `mfence` can.
        > It effectively flushes the store buffer before proceeding.

        - notice the AMD and intel implements [differently](https://stackoverflow.com/questions/50480511/what-does-serializing-operation-mean-in-the-sfence-documentation#comment96156889_50500786).
    - `C001_1029` [detailed](https://lore.kernel.org/lkml/20170425114541.8267-1-dvlasenk@redhat.com/) from [this](https://hadibrais.wordpress.com/2018/05/14/the-significance-of-the-x86-lfence-instruction/)
    - [Why isn't](https://stackoverflow.com/a/12065803/21294350) RDTSC a serializing instruction? 
      > it seems that they *decided* to keep it non-serializing, which is OK for *general-purpose* time measurements

      to help reorder in some conditions.
      - RDTSCP
        1. > *unsynced* TSCs across cores

          Also shown [here][detailed_get_cycle]
          > This is why rdtscp produces a core-ID as an extra output, so you can detect when start/end times come *from different clocks*

          where how [`__rdtscp`](https://learn.microsoft.com/en-us/cpp/intrinsics/rdtscp?view=msvc-170) implements `TSC_AUX` depends on the machine [and](https://stackoverflow.com/a/22369725/21294350)
          > OS should write core id into IA32_TSC_AUX

        2. same as `lfence; rdtsc` which also shown in the [intel doc](https://www.felixcloutier.com/x86/rdtscp)
          > wait until all previous instructions have executed and all previous loads are globally visible

          which is also shown in the bullet 1 in [intel_rdstc].
          - > The RDTSC instruction is not a serializing instruction. ... The following items may guide software *seeking to order executions* of RDTSC:

            imply [detailed_get_cycle] which also references 
            > using *lfence (or cpuid)* to improve repeatability of rdtsc and control exactly which instructions are / aren't in the timed interval by *blocking out-of-order execution*

    - [TSC](https://en.wikipedia.org/wiki/Time_Stamp_Counter)
    - [`__builtin_ia32_rdtscp`](https://www.spinics.net/lists/gcchelp/msg52804.html) see the [Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#text=_rdtsc&ig_expand=5351) because of x86 specific instruction.
      - Also ~~[see](https://patchwork.ozlabs.org/project/gcc/patch/CAMe9rOpJbem4tnkdDX0NwpyMMLLzcakaij120aNCDXsW=wjRww@mail.gmail.com/#2658058)~~
        The above link seems [not to be applied](https://github.com/gcc-mirror/gcc/blob/master/gcc/config/i386/ia32intrin.h#L112)
      - [`#pragma intrinsic`](https://stackoverflow.com/a/5723581/21294350) tells the compiler to use "faster assembly instructions" which *depends on the architecture* [instead of inline functions](https://learn.microsoft.com/en-us/cpp/preprocessor/intrinsic?view=msvc-170&redirectedfrom=MSDN) on some architectures.
- [avoid compiler reorder](https://stackoverflow.com/a/9030194/21294350) by `: "memory"`
- `CLFLUSHOPT` [vs](https://community.intel.com/t5/Software-Tuning-Performance/My-summary-of-clflush-and-clflushopt/td-p/1093920) `CLFLUSH`
  - > Neither of these is likely to become public in any useful detail....

    :)
  1. > a store buffer *only needs to be flushed* if it holds data from the *same cache line*

  2. (3) Write operations to *different* addresses
  3. (1) CLFLUSH operations to different addresses, (2) CLFLUSHOPT operations to different addresses
    which is same as [this](https://en.wikichip.org/wiki/x86/persistent_memory_extensions#Overview) to keep "Persistent Memory" which TODO maybe similar to consistency.
    - TODO NVM
- [check](https://stackoverflow.com/a/6577896/21294350) `clflush` inspired by [this](https://stackoverflow.com/questions/51818655/clflush-to-invalidate-cache-line-via-c-function/51830976#comment120428630_51818806)
```bash
# https://stackoverflow.com/questions/51818655/clflush-to-invalidate-cache-line-via-c-function/51830976#comment120428630_51818806
[/mnt/ubuntu/home/czg/csapp3e/Operating_System/code_test/miscs] $ gcc clflush_test_availability.c -o clflush_test_availability.out
took 116 ticks
took 87 ticks
flush: took 58 ticks
took 87 ticks
took 87 ticks
# notice the result may differ largely each time but flush time is always same as the before one or the next one
$ sudo cpuid                     
Leaf     Subleaf    EAX            EBX            ECX            EDX            
00000000 00000000:  00000010 ....  68747541 Auth  444d4163 cAMD  69746e65 enti
00000001 00000000:  00860f01 ....  00100800 ....  7ed8320b .2.~  178bfbff ....
$  ipython -c "bin(0x178bfbff)[-19]"
Out[1]: '0' # not support clflush
```
  - notice [newer gcc](https://stackoverflow.com/a/14737642/21294350) default std is `gnu17` by `info gcc`.
1. this has been asked before.
  See C19 where we prefer `clock_gettime` than `gettimeofday` because of precision.
  See C6 for `rdtsc`
1. here `sizeof(pthread_mutex_t): 40` which comforms to the alignment of 8 bytes. See [amd_64]
  > aligned 64-byte region of WC memory type

  maybe it can be controlled see [amd_64] p1162 "Number of bytes fetched".
- Here `threadID % NUMCPUS` is to make each CPU can run one specific thread which has been said before that the CPU can only schedule one thread in the core each time.
- more specifically, here `j % i` just based on 16 threads instead of 8 CPU cores.
- > Does this number impact your measurements at all

not too much because "32 threads" still works when only 16 physical threads available.
- [reasons](https://stackoverflow.com/a/154138/21294350) for `do { ... } while (0)` in `#define`
is to avoid expansion error when used in `if` with *semicolon after* or similar.
where `f(corge), g(corge)` or `if(1){...}else` also work.
- On my machine, "1024 threshold" is the best among all thresholds.
- Same as the [README](https://github.com/czg-sci-42ver/ostep-hw/blob/master/29/README.md), contrary to the book, `Approximate` is worse maybe due to the data size isn't large enough.
their call nums are similar. So obviously the overheads may be *too high compared with acquiring the lock*.
- So
  > A *rough* version of an approximate counter

  ?  
```bash
$ gprof ./approximate_counter_comparison.out 
 Flat profile:

 Each sample counts as 0.01 seconds.
   %   cumulative   self              self     total           
  time   seconds   seconds    calls  ms/call  ms/call  name    
  85.83      3.36     3.36 116660721     0.00     0.00  update
  13.32      3.88     0.52                             thread_function
   0.51      3.90     0.02       16     1.25     1.25  get
   0.51      3.92     0.02                             _init
   0.00      3.92     0.00       16     0.00     0.00  init
$ gprof ./simple_counter_comparison.out 
 Flat profile:

 Each sample counts as 0.01 seconds.
   %   cumulative   self              self     total           
  time   seconds   seconds    calls  ms/call  ms/call  name    
  69.43      1.49     1.49 119974919     0.00     0.00  increment
  21.90      1.96     0.47                             thread_function
   5.59      2.08     0.12                             _init
   3.26      2.15     0.07       16     4.38     4.38  get
   0.00      2.15     0.00       16     0.00     0.00  init
```
- with `./approximate_counter_check_threashold.out`, the fastest is nearly `1.413304` while `./simple_counter_comparison.out` is `0.675848`.
```bash
$ cat Makefile
...
    # from csapp_global.pdf p599; -pg doesn't help inside the function
 approximate_counter_comparison.out: approximate_counter.c
         $(CC) -o $@ $^ $(CFLAGS) -lm $(OSFLAG) -DONE_THRESHOLD -DONE_MILLION=${LARGE_NUM}
 approximate_counter_check_threashold.out: approximate_counter.c
         $(CC) -o $@ $^ $(CFLAGS) -lm $(OSFLAG) -DCOMPARE_THRESHOLD
...
 simple_counter_comparison.out: simple_concurrent_counter.c thread_helper.h
         $(CC) -o $@ $< $(CFLAGS) $(OSFLAG) -DUSE_ONCE_MANY_THREADS -DONE_MILLION=${LARGE_NUM}
```
3. Same as the book says, maybe not.
4. with `PROGRAM=standard_list.out;for i in $(./${PROGRAM} 10 16 0 | awk '/threads/{print $5}');do echo -n $i,;done;echo -e -n "\n"` to get output data list.
  Here, lock overheads can be amortized by the thread main body.
  So Yes when threads num increases.
5. ~~TODO~~ try using c++ implement to solve the weird one-entry memory leak in `btree.c`.
- Use 
```bash
####################
# https://valgrind.org/docs/manual/manual-core-adv.html#manual-core-adv.gdbserver-simple inspired by https://stackoverflow.com/a/38253367/21294350
# in the new terminal
#####
# 1. monitor: https://sourceware.org/gdb/onlinedocs/gdb/Server.html
#####
# allow restarting valgrind by using extended-remote by https://stackoverflow.com/a/346019/21294350. and https://electronics.stackexchange.com/a/28515/341985
$ gdb -nx ./btree_1.out -ex 'set remote exec-file ./btree_1.out' -ex 'set sysroot /' -ex 'target extended-remote | vgdb --multi --vargs -q' -ex 'start' -ex 's' -ex 'r'
#####
# notice both pwngdb and dashboard has some small errors when rendering the extended-remote
# and pwngdb even can't run with the normal mode just like how it with rr.
#####
#####
# gef works only when extended-remote.
#####
####################
####################
$ valgrind --vgdb=yes --vgdb-error=0 ./btree.out
$ gdb ./btree.out -ex 'target extended-remote | /usr/local/libexec/valgrind/../../bin/vgdb' -ex 'br 315' -ex 'c'
>>> s_mon 0x4bf9130 # keep try with the interested addr until leak
$ cat ~/gdb_scripts/func.gdb | grep s_mon -A 5
define s_mon
  s
  monitor leak_check full definiteleak increased
  monitor who_points_at $arg0
end
####################

# gdb show mem https://stackoverflow.com/a/23231859/21294350
```
  or more direct
```bash
# https://unix.stackexchange.com/a/98766/568529 notice here `2>file` no space inside.
$ valgrind_l ./btree.out 2>~/bfree_valgrind_l.txt;less_n ~/bfree_valgrind_l.txt
```
6. See `btree.c`
#### valgrind (Also see the above program debug log)
- track all local malloc variables `return` to ensure it is *freed before* the first time it is *not returned*.
  This can be partly shown in `valgrind` but it *may overlap* the reasons (i.e. [chained](https://github.com/xxyzz/ostep-hw/pull/20/files#diff-c29bf7afaaad874ebab95c6703ea8266f61bf4417581ffecf4aeabd175a6ff9dR162) memory leaks) So we needs to find the *root*.
### C30
- `#define Malloc(s) ({ void *p = malloc(s); assert(p != NULL); p; })` shows how `p;` without `return` used.
- `./main-two-cvs-while -l 1 -m 2 -p 1 -c 1 -P 1 -C 0 -v` also fine.
2. only make sense after using sleep. (here check num lines `| wc -l` maybe no use for the performance)
>  What would you predict num_full to be with different buffer sizes (e.g., -m 10) and different numbers of produced items (e.g., -l 100),
only make the buffer behavior different.
- when the buffer size `-m` less than loop size `-l`, the performance should increase when the buffer size increases if wait has sleep otherwise the difference may be not viewed easily.
```bash
$ pro_num=2;str="0,0,0,0.1,0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=10;./main-two-cvs-while -p ${pro_num} -c 1 -m ${size} -v -l 10 -t -P ${pro_sleep} | tail -n 1
Total time: 0.10 seconds
$ pro_num=2;str="0,0,0,0.1,0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=1;./main-two-cvs-while -p ${pro_num} -c 1 -m ${size} -v -l 10 -t -P ${pro_sleep} | tail -n 1
Total time: 1.91 seconds
# without -P delay
$ pro_num=2;str="0,0,0,0.1,0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=1;./main-two-cvs-while -p ${pro_num} -c 1 -m ${size} -v -l 10 -t | tail -n 1
Total time: 0.00 seconds
$ pro_num=2;str="0,0,0,0.1,0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=10;./main-two-cvs-while -p ${pro_num} -c 1 -m ${size} -v -l 10 -t | tail -n 1
Total time: 0.00 seconds
```
3. I don't have Mac... although I can install MacOS but I didn't.
4. similar to 2, many consumers will be stuck at wait.
5. ~~similar to 2, it will improve.~~
in 2, producers are constrained by the buffer size too small (i.e. they can't add more sometimes)

~~here, consumers are more than producers and then the buffer size is always 0 -> consumer stuck.~~
~~increase the buffer size can't improve but increase both the buffer size and producers can work.~~
Need increase `-m` very large so that the buffer can contain many data and the consumer will 
```bash
# read from pipe to the variable https://unix.stackexchange.com/a/365222/568529
# dup str https://stackoverflow.com/a/56836378/21294350
$ pro_num=10;con_num=3;str="0,0,0,0.1,0,0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=10;./main-two-cvs-while -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} | tail -n 1 | awk '{print $3}' | read time;ipython -c "$time/$pro_num"
Out[1]: 0.081
$ pro_num=1;con_num=3;str="0,0,0,0.1,0,0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=10;./main-two-cvs-while -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} | tail -n 1 | awk '{print $3}' | read time;ipython -c "$time/$pro_num"
Out[1]: 0.0 # sometimes 0.3, etc
# book example
$ pro_num=1;con_num=3;str="0,0,0,0.1,0,0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=3;./main-two-cvs-while -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} | tail -n 1 | awk '{print $3}' | read time;ipython -c "$time/$pro_num"
Out[1]: 0.7
```
here `sleep` will hold the lock, so no overlap
```bash
$ pro_num=1;con_num=3;delay=0.1;str="0,0,0,${delay},0,0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=3;./main-two-cvs-while -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} > /tmp/test_time.txt;grep "c3" /tmp/test_time.txt | wc -l | read count;ipython -c "$count*$delay";tail -n 1 /tmp/test_time.txt

Out[1]: 0.9
Total time: 0.90 seconds
```
6. different from 5, this will unlock and then sleep, so sleep can overlap. This also implies `nanosleep` ~~only makes one CPU sleep.~~ [not makes the CPU idle "CPU time isn't wasted"](https://tldp.org/HOWTO/IO-Port-Programming-4.html).
This is why original `wait` without delay has little overhead.
7. here alawys 13 not influenced by `-m`, because it is decided by `1*10+3` which is addition of data produced by producers and `END_OF_STREAM` of consumer count.
```bash
$ ./main-two-cvs-while -p 1 -c 3 -m 10 -C 0,0,0,0,0,0,1:0,0,0,0,0,0,1:0,0,0,0,0,0,1 -l 10 -v -t > /tmp/test_time.txt;grep "c6" /tmp/test_time.txt | wc -l | read count;ipython -c "$count";tail -n 1 /tmp/test_time.txt

Out[1]: 13
Total time: 5.00 seconds
```
8. No. As the book says in p16.
9. ~~TODO weird stick at `c2`~~
here `count` is 0.
Ç1 waits for P0 to change `count` to 0 while P0 waits for C1 to change `count` to 0.Then both wait. -> deadlock
- similar to "Figure 30.11,10" where all unlocks in `wait` instead of here by direct `unlock` at `p6/c6`.
- here doesn't proceed to C0->c1 maybe due to the Linux's scheduler choice.
```bash
$ ./main-one-cv-while -p 1 -c 2 -m 1 -P 0,0,0,0,0,0,1 -v -t
 NF         P0 C0 C1
...
  1 [*  0 ] p6
...
  0 [*--- ]    c6
  0 [*--- ]       c3
  0 [*--- ]       c2
```
10. Again as the book says, one consumer's filled state won't be changed to empty by others.
- "there is more than one" consumers
```bash
$ pro_num=1;con_num=2;delay=0.1;str="0,0,0,0,${delay},0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=1;./main-two-cvs-if -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep}
$ pro_num=1;con_num=2;delay=0.1;str="0,0,0,${delay},0,0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));size=1;./main-two-cvs-if -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep}
```
add more delay when *not holding the lock*, then the order can be *more dynamic*.
so both `p3` and `p0` are ok. But `p3` is better because it implies `num_full=max`, so *the `num_full == 0` stuck won't happen* and then the condition that more consumers consume can happen.
```bash
# `p0` sometimes work.
# linux scheduler probably switches thread when `p4` or `p2` and `c0` (lock failure) or `c4/c2`
$ pro_num=1;con_num=2;delay=0.1;str="0,0,0,0,${delay},0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));pro_str="${delay},0,0,0,0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=1;./main-two-cvs-if -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} -P ${pro_sleep}
...
  1 [*  6 ] p2
  1 [*  6 ]    c3
  0 [*--- ]    c4
0,100000000
will begin nanosleep
end nanosleep 1st time
check whether sleep suspends all CPUs
  0 [*--- ]    c5
  0 [*--- ]    c6
  0 [*--- ]    c0
  0 [*--- ]    c1
  0 [*--- ]    c2
  0 [*--- ]       c3
error: tried to get an empty buffer
# above is similar to Figure 30.9, but it avoids frequent context switches so that only switches after `wait` (c2) and others are same as Figure 30.9.
$ pro_num=1;con_num=2;delay=0.1;str="0,0,0,0,${delay},0,0";con_sleep=$(printf "$str:%.0s" $(seq "${con_num}"));pro_str="0,0,0,${delay},0,0,0";pro_sleep=$(printf "$str:%.0s" $(seq "${pro_num}"));size=1;./main-two-cvs-if -c ${con_num} -p ${pro_num} -m ${size} -v -l 10 -t -C ${con_sleep} -P ${pro_sleep}
...
# similar to above
  1 [*  9 ] p6
  1 [*  9 ]       c3
  0 [*--- ]       c4
0,100000000
will begin nanosleep
end nanosleep 1st time
check whether sleep suspends all CPUs
  0 [*--- ]       c5
  0 [*--- ]       c6
  0 [*--- ]       c0
  0 [*--- ]       c1
  0 [*--- ]       c2
  0 [*--- ]    c3
error: tried to get an empty buffer
```
11. race condition. But although no lock, the linux won't overlap them maybe due to the high overheads of thread context switch.
`./main-two-cvs-while-extra-unlock -p 1 -c 2 -m 10 -l 10 -v -C 0,0,0,0,1,0,0:0,0,0,0,0,0,0` will set the priority implicitly.
### C31
- duplicate inclusion of headers are [*avoided*](https://stackoverflow.com/a/9748310/21294350) in many header implementation.
  [`#pragma once`](https://en.wikipedia.org/wiki/Pragma_once) also [fine](https://stackoverflow.com/a/69293444/21294350)
  - ~~TODO how this [happens](https://stackoverflow.com/questions/7881021/how-to-avoid-duplicate-inclusion-of-a-header-file)~~ Notice this [only avoids](https://stackoverflow.com/questions/7881021/how-to-avoid-duplicate-inclusion-of-a-header-file#comment135874972_7881178) the duplicate inclusion in the header instead of source codes.
    So that `gcc` may warn related with [ODR](https://en.wikipedia.org/wiki/One_Definition_Rule)
    Also see "avoid_dup_include".
1. here use `sem_open` ~~instead of~~ is different from `sem_init` due to the former make process share more convenient. The child *process* [doesn't share (This compares the comparison of their usages when sharing between processes)](https://blog.superpat.com/semaphores-on-linux-sem_init-vs-sem_open) the `sem`. <a id="shm_open_mmap"></a>
  here `sem_open` (fd) -> `ftruncate` controls size to avoid weird behaviors (TODO how weird) -> `mmap` from fd to mem_addr.
  See [ostep_hw] for why the author use it since here only threads are used instead of processes.
- `sem_open`
  > If O_CREAT is specified, and a semaphore with the given name *already* exists, then mode and value are *ignored*

  `man 7 sem_overview`
  > Two processes can operate on the same named semaphore by passing the *same  name*  to sem_open(3)

  So [usage](https://stackoverflow.com/a/8359403/21294350)
  - `sem_unlink` (to destruct) is used after `sem_close` (to remove references).
    > will *destruct* the semaphore once its *reference* count is 0

- `sem_init` doesn't initialize.
  by viewing the assembly difference, 
  1. when `#define USE_INIT_POINTER`
    it only moves one 8 byte pointer, but the pointer may point to nothing
    ```asm
    mov    QWORD PTR [rbp-0x8],rax
    ...
    mov    rax,QWORD PTR [rbp-0x10]
    ...
    mov    rdi,rax
    call   1090 <sem_init@plt>
    ```
  2. when not `#define USE_INIT_POINTER`
    it will use the stack to store the data, then all behavior is defined and won't access weird mem locations.
    ```asm
    // others except "..." same as above
    lea    rax,[rbp-0x30]
    ```
  [summary](https://stackoverflow.com/a/74716788/21294350) (same as [this](https://stackoverflow.com/a/61669391/21294350)) and source code just [cast](https://github1s.com/bminor/glibc/blob/master/nptl/sem_wait.c#L39-L40).
  > It *doesn't allocate* an object, double ptr would be needed for that.

3. is similar to CUDA thread synchronization that *all* threads need to achieve *one point* and then one thread can proceed.
- ~~TODO~~ *sometimes* `mmap` fails when `htop` shows only `5.1G/16G` mem usage.
  After reboot, same parameters always work fine with `4.88G/16G`.
  `pthread_create` -> `allocate_stack` -> [`mem = __mmap (NULL, size, (guardsize == 0) ? prot : PROT_NONE,MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);`](https://github1s.com/bminor/glibc/blob/master/nptl/allocatestack.c#L366-L367) fails
```c
 ►0x7ffff7c8d474<pthread_create+2276>   call   mmap64                <mmap64>
        addr: 0x0 
        len: 0x801000
        prot: 0x0 
        flags: 0x20022
        fd: 0xffffffff
        offset: 0x0 
```
  - This is due to the too many recursive calls in with `if (errno==EEXIST)` where `errno` is not cleared across recursive calls so `if (errno==EEXIST)` always `true`.
    either by reset `errno = 0;` to default after `Sem_unlink(name)`
    or nested in `if(sem == SEM_FAILED)`.
5. Also see csapp 12.19,20 where not use `sleep` for starvation (so not good for reproduction) and use `read_first` and something similar to `count` to control.
6. Here `Sem_wait(m->t1);` will make many threads stuck in room 1 if they flood in between `m->room2++;` and `Sem_wait(m->mutex);`.
  state: `m->room1=n,m->t1=-n`

  then the one `thread_0` in room 2 will `Sem_post(m->t1);` to let one into room 2 and then stuck at `Sem_wait(m->t2);` and the new one `thread_1` into room 2 will let another into room 2 and stuck same as  `thread_0` and *loop* until all into room 2 by `m->room1 == 0` (then `m->t1=0`)
  then let one in room 2 into the critical session by `Sem_post(m->t2)`.
  state: (n-1 + `thread_0`=n) `Sem_post(m->t1);` make `m->t1=0` and one `Sem_post(m->t2);` to let `thread_0` continue.

  Then after the critical session, `Sem_post(m->t2);` will let another thread in room 2 into the critical session which make the *one-by-one sequence*.
  If the one exiting the critical session reenter the loop to acquire the lock, it will be stuck at `Sem_wait(m->t1);` because `m->t1=0` (this ensures no race conditions with `Sem_post(m->t2);` so that the critical session is *protected*)

  - in summary, it use binary semaphore to implement many levels of buffers like room 1/2.
  - more visually,
    `thread_n` enters room 1 with `m->room1++;` then it waits for exit because `m->t1` init 1 which only allows one thread out of room 1 into room 2.
    then one thread out of room 2 (`m->room2++`) into room 1 (`m->room1--`)
    and let one thread into room 2 (`Sem_post(m->t1)`) if room 1 is *not empty* (This *implies* **all** threads must enter room 2 for one to proceed.) and waits (`Sem_wait(m->t2);`) **or** just exit room 2 (`Sem_post(m->t2);Sem_wait(m->t2);m->room2--;`).
    From room 2 to **room_critical**, similar to before, let another one out of room 2 (`Sem_post(m->t2)`) into room_critical if room 2 is not empty (still above **all** must enter room_critical), otherwise `Sem_post(m->t1)` to let one cycle back to room 1 for the next iteration.
    
    The above statement that we *wait* for *all* to *enter one point* so that we can *proceed* is how starvation is avoided.
7. TODO
  like variants of barbershop, cigarette_smokers and dining_savages.
### C32
1. although `./vector-deadlock -n 2 -l 1 -d -v` can deadlock, but maybe rare for 2 threads.
2. See 1, still rare on my machine. `./vector-deadlock -n 2 -l 10000000 -d -v` will but `./vector-deadlock -n 2 -l 100000 -d -v` not.
3. Yes not not clearly; 1.
  notice here unlock order doesn't matter because it will help out of the stuck state, so any order is fine. 
4. IMHO here `vector_0` is always different from `vector_1`.
  maybe the `vector-global-order.c` is targeted for general cases.
5. it needs more threads to amortize the thread overhead, also limited by physical thread num 16. 
```bash
$ max_threads=99;for i in $(seq ${max_threads});do total=900000;threads=$i;python -c "print(${total}%${threads})" | read skip;if [ ${skip} -eq 0 ];\
 then echo $i threads;python -c "print(${total}/${threads})" | read loop;./vector-global-order -t -n ${threads} -l ${loop} -d;fi;done
1 threads
Time: 0.08 seconds
2 threads
Time: 0.10 seconds
3 threads
Time: 0.12 seconds
4 threads
Time: 0.22 seconds
5 threads
Time: 0.22 seconds
6 threads
Time: 0.27 seconds
8 threads
Time: 0.26 seconds
9 threads
Time: 0.31 seconds
10 threads
Time: 0.31 seconds
12 threads
Time: 0.29 seconds
15 threads
Time: 0.23 seconds
16 threads
Time: 0.16 seconds
18 threads
Time: 0.17 seconds
20 threads
Time: 0.17 seconds
24 threads
Time: 0.17 seconds
25 threads
Time: 0.17 seconds
30 threads
Time: 0.20 seconds
32 threads
Time: 0.18 seconds
36 threads
Time: 0.21 seconds
40 threads
Time: 0.20 seconds
...
```
6. here not limited by physical thread num 16.
  so the above is limited actually by contention/race instead of thread switch overheads.
```bash
$ max_threads=99;for i in $(seq ${max_threads});do total=9900000;threads=$i;python -c "print(${total}%${threads})" | read skip;if [ ${skip} -eq 0 ];\
 then echo $i threads;python -c "print(${total}/${threads})" | read loop;./vector-global-order -t -n ${threads} -l ${loop} -d -p;fi;done
1 threads
Time: 0.50 seconds
2 threads
Time: 0.52 seconds
3 threads
Time: 0.44 seconds
4 threads
Time: 0.34 seconds
5 threads
Time: 0.32 seconds
6 threads
Time: 0.24 seconds
8 threads
Time: 0.20 seconds
9 threads
Time: 0.17 seconds
10 threads
Time: 0.19 seconds
11 threads
Time: 0.17 seconds
12 threads
Time: 0.17 seconds
15 threads
Time: 0.13 seconds
16 threads
Time: 0.13 seconds
18 threads
Time: 0.11 seconds
20 threads
Time: 0.11 seconds
22 threads
Time: 0.09 seconds
24 threads
Time: 0.10 seconds
25 threads
Time: 0.09 seconds
30 threads
Time: 0.08 seconds
32 threads
Time: 0.08 seconds
33 threads
Time: 0.08 seconds
36 threads
Time: 0.08 seconds
40 threads
Time: 0.08 seconds
44 threads
Time: 0.08 seconds
45 threads
Time: 0.08 seconds
48 threads
Time: 0.07 seconds
# the rest same as 48
```
7. maybe the 1st `pthread_mutex_trylock` is to avoid too heavy contention so that livelock.
  TODO why the professor adds "the first call to pthread mutex trylock()".
  really slow because the always *useless loops*. increase most of time.
8. always contends for shared pointer `&global`.
  TODO [ostep_hw] seems to be wrong.
  slightly slower than `vector-global-order` but really faster than `vector-try-wait`.
9. 
10. ~~obviously better.~~ `./vector-try-wait` < `./vector-nolock` < `./vector-avoid-hold-and-wait` < `./vector-global-order`.
```bash
$ max_threads=99;for i in $(seq ${max_threads});do total=100000;threads=$i;python -c "print(${total}%${threads})" | read skip;if [ ${skip} -eq 0 ];\          
 then echo $i threads;python -c "print(${total}/${threads})" | read loop;./vector-nolock -t -n ${threads} -l ${loop} -d ;fi;done
1 threads
Time: 0.07 seconds
2 threads
Time: 0.09 seconds
4 threads
Time: 0.33 seconds
5 threads
Time: 0.17 seconds
8 threads
Time: 0.18 seconds
10 threads
Time: 0.20 seconds
16 threads
Time: 0.15 seconds
20 threads
Time: 0.15 seconds
25 threads
Time: 0.13 seconds
32 threads
Time: 0.14 seconds
40 threads
Time: 0.13 seconds
50 threads
Time: 0.14 seconds
80 threads
Time: 0.13 seconds
```
### C33
6. maybe time?
#### debug
- [`Can't open file anon_inode:[io_uring] which was expanded to anon_inode:[io_uring] during file-backed mapping note processing`](https://stackoverflow.com/a/73814664/21294350)
  i.e. can't reconstruct the file map.
- `pgrep -f "server_.*"` notice the [quote](https://gist.github.com/BigOokie/fea128a063e6e4e870cb4a246967a419) in `zsh` because `zsh` will expand `.*` when feeding them to `pgrep`.
- why always has server threads left.
```bash
$ filename=test2.txt;num_reqs=10;trials=100;for j in $(seq ${trials});do for i in $(seq ${trials}); do\
 touch /tmp/server_out /tmp/server_err
 ./server_epoll.out ${num_reqs} 1>/tmp/server_out 2>/tmp/server_err &
 server_pid=$(jobs -p | awk '{print $3}')
 ./client.out ${filename} ${num_reqs} 1>/dev/null
 cat /tmp/server_out
done | grep -E "[0-9]+" | wc -l;done
100
100
100
100
100
100
100
100
100
100
# but sometimes less than 100
$ pgrep -f "server_.*" | wc -l
24
# if while the above two-level loop runs, we run another loop
$ filename=test2.txt;num_reqs=10;trials=100;for i in $(seq ${trials}); do\
 touch /tmp/server_out /tmp/server_err
 ./server_io_uring.out ${num_reqs} 1>/tmp/server_out 2>/tmp/server_err &
 ./client.out ${filename} ${num_reqs} 1>/dev/null
 cat /tmp/server_out
done
...
recv: Connection reset by peer # also shown in the two-level loop
```
  above "less" maybe due to `SO_REUSEPORT` so that multiple sockets can use the same server, this also avoids the problem "*bind*: Address already in use" which is "TIME_WAIT" ([this](https://serverfault.com/a/23529/1032032) no use) when [`netstat -tulpna | grep 8080`](https://stackoverflow.com/a/24824688/21294350). Also see [this](https://stackoverflow.com/questions/10070567/how-many-ways-to-reduce-the-number-of-time-wait-as-soon-as-possible-in-client#comment12894104_10070770)
  - the above "bind" problem not solved by [this](https://superuser.com/a/668155/1658455)
  - TODO but from [this](https://www.baeldung.com/linux/close-socket-time_wait), `SO_REUSEADDR` should solve with the problem.
    maybe due to [socket is actively listening](https://serverfault.com/a/329847/1032032).
  - [no pid](https://unix.stackexchange.com/a/106562/568529) scheduled for "TIME_WAIT"
    so [config](https://www.unix.com/302433223-post2.html) parameter
    [TODO](https://serverfault.com/a/839399/1032032)
- similar to [Benchmark_IA_64], the overhead needs to be substracted when using `./bench.sh` but it's enough for comparison.
```bash
$ ./bench.sh test2.txt 10 10 0
file io_uring
6
io_uring average_time: 779179.44ns/request
file epoll
6
epoll average_time: 664083.0ns/request
file libevent
6
libevent average_time: 598955.25ns/request
$ python ./bench.py test2.txt 10 10
io_uring: 146140.99 nanoseconds/request
epoll: 155767.91 nanoseconds/request
libevent: 152840.86 nanoseconds/request 
```
#### miscs
- [`__INLINE_SYSCALL_NARGS_X`](https://github1s.com/bminor/glibc/blob/master/sysdeps/unix/sysdep.h#L99-L100) excludes the 1st arg from the count range for something like `SYSCALL_CANCEL (pselect6_time64, nfds, readfds, writefds, exceptfds,pts64, NULL);`.
  so SYSCALL_CANCEL(pselect6_time64) -> `__INLINE_SYSCALL0`
  See how this is [implemented](https://renenyffenegger.ch/notes/development/languages/C-C-plus-plus/preprocessor/macros/__VA_ARGS__/count-arguments) in "COUNT_ARGUMENTS".
- [`SYSCALL_CANCEL`](https://sourceware.org/glibc/wiki/SyscallWrappers) is to respond to something like the cancellation [*signal*](https://stackoverflow.com/questions/5684265/implementing-cancellable-syscalls-in-userspace#comment6497273_5686698)
  This also implies `EINTR`
  The blocking property implies synchronous.
  - Also see improvement to [share](https://patchwork.ozlabs.org/project/glibc/patch/1492200452-4653-1-git-send-email-ynorov@caviumnetworks.com/#1634769) the `INLINE_SYSCALL_CALL (__VA_ARGS__)`.
  - TODO [AS-safe](https://github1s.com/bminor/glibc/blob/master/nptl/cancellation.c#L28-L29)
  - Also see [`man pthread_cancel`](https://github1s.com/bminor/glibc/blob/master/nptl/cancellation.c#L24-L25)
- From `aio_gist/aio_read-test_mod.c`, `lseek/fseek` is a must to use *consecutive* calls of `read,write` with the same `fd/FILE*`.
  So after [`read`](https://unix.stackexchange.com/a/208900/568529) in `server_select.c`, offset is at EOF.
##### bash
- [`&-`](https://stackoverflow.com/a/68721033/21294350)
#### [libevent](https://libevent.org/) vs event
- > libevent is meant to replace the event loop found in event driven network servers. An application just needs to call event_dispatch() and then *add* or remove events *dynamically* *without having to change the event loop*.

  it also allows [other threads](https://stackoverflow.com/a/12394499/21294350) to modify the loop.
- vs [libev](https://github.com/envoyproxy/envoy/issues/4952#issue-376972421)
- TODO by [this](#poll_wait_O_NONBLOCK), libevent calling `epoll` should block always.
#### io_uring
[io_uring]
##### diff with aio
- [offload](https://blog.cloudflare.com/io_submit-the-epoll-alternative-youve-never-heard-about/) similar to background.
1. system calls related with [meltdown](https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability)#Overview).
  > This occurs between memory access and *privilege checking* during instruction processing

  So
  >  allows a process to *bypass the normal privilege checks*

  - So `man io_uring_setup`
    > the application can submit and reap I/Os *without doing a single system call*

#### epoll
- `O_CLOEXEC` is to avoid file accessed by unintended processes.
  Also avoids race condition by `man 2 open`.
  > attempts to set its close‐on‐exec flag using fcntl(2) at the same time as another thread does a fork(2) plus execve(2)

  here `fork` implies "file leak".
- `recv` [vs](https://stackoverflow.com/a/1790778/21294350) `read`
  [also](https://stackoverflow.com/questions/1790750/what-is-the-difference-between-read-and-recv-and-between-send-and-write#comment71511794_1790778)
- TODO
  1. `NOT_PENDING_ZERO_DATAGRAM` and `READ_TO_BUFFER_BUT_SEND_ZERO_CONTENT_BUFFER`
#### network basics 
TODO Reread after learning the network.
- [`SO_REUSEADDR`](https://stackoverflow.com/a/14388707/21294350) mainly differentiates between `0.0.0.0` and other specific addresses.
  TODO [1](https://stackoverflow.com/a/3233022/21294350)
  - `SO_REUSEPORT` is mainly to reuse the *totally same* address and port.
- [`setsockopt`](https://github1s.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/setsockopt.c#L95-L96)
  option is implemented in [syscall which means whether enable](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/net/core/sock.c#L1131-L1132) by [search](https://github.com/search?q=repo%3Atorvalds%2Flinux+%2FSYSCALL_DEFINE.*setsockopt%2F&type=code).
  - find [syscall definition](https://stackoverflow.com/a/45205822/21294350) [also](https://github.com/0xAX/linux-insides/blob/master/SysCall/linux-syscall-1.md)
    So search by `SYSCALL_DEFINE.*dup` for `dup` syscall.
    - `dup2`
      - [`struct fdtable`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/include/linux/fdtable.h#L27-L28)
      - it will close `fd` by [`filp_close`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L1140-L1141) which calls `filp_flush` called by [`close`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/open.c#L1566-L1567) before return as man says:
        > it is closed before being reused

      - it inc [ref count](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/include/linux/fs.h#L1042-L1043) with [`struct file`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/include/linux/fs.h#L992-L993) <a id="dup_inc"></a>
      - [`__releases`](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59856) by [this](https://stackoverflow.com/a/21019180/21294350) is to let the compiler check the lock state where [`in` supported here](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L1160-L1161) and `out` [supported](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L1137-L1138) here.
        - it can function as [one sequence](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L170-L171) by first [release](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L175-L176) and then [acquire](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/fs/file.c#L184-L185)
- `listen` [vs](https://stackoverflow.com/a/34073929/21294350) `accept`
- use [io_uring](https://developers.redhat.com/articles/2023/04/12/why-you-should-use-iouring-network-io)
- always weird `` 
    maybe due to [this](https://serverfault.com/a/23529/1032032) related with this
##### TODO
- from `man 7 socket`
  > it is *not possible* to bind to this port for any local address

- same as csapp, `recv: Connection reset by peer`
## persistence
### disks
It uses `tkinter` to implement the GUI.
4. similar to "anticipatory disk scheduling" by `./disk.py -a 7,30,8 -G -p SSTF`
5. > When seek time is shorter then rotate time.

  because `SATF` cares about `seek+rotate` so when `seek<rotate`, `rotate` can *influence* the result, so that when `seek_1<seek_2`, `seek_1+rotate_1>seek_2+rotate_2` may happen.
  - `./disk.py -a 31,6 -c -p SATF -S 40 -R 1` the `6` can't be served because init needs time.
    here seek time of 6 is 0 so always wait for the unnecessary rotation time when `SSTF`.
6. `rack-distance(40) / seek-speed) * rotation-speed` is the rotation angle
7. 
```bash
$ ./disk.py -z 10,20,30 -a -1 -A 5,-1,0 -c
track 1 angle 0
Block:  45  Seek: 40  Rotate:310  Transfer: 20  Total: 370
track 1 angle 260
Block:  40  Seek:  0  Rotate:240  Transfer: 20  Total: 260
track 0 angle 40
Block:  22  Seek: 40  Rotate: 85  Transfer: 10  Total: 135
track 0 angle 310
Block:  13  Seek:  0  Rotate:260  Transfer: 10  Total: 270
track 0 angle 90
Block:  27  Seek:  0  Rotate:130  Transfer: 10  Total: 140

# corresponding to the ostep-hw README
outer: 3/(260+130+(40+85))=0.005825242718446602
...
```
8. `-a` defaults to be `-1`, so omitted.
The following set the max which is same as the `-A` parameter
```python
if self.currWindow <= -1:
  return len(self.requestQueue)

# -A
self.requests     = self.MakeRequests(self.addr, self.addrDesc)
...
for index in range(len(self.requests)):
  self.AddQueueEntry(int(self.requests[index]), index)
```
9. With `SATF`, the window seems to update when one is finished (based on `IO_LOG=1` infos). so `-w 2` no use, only `-w 1` works.
  With `BSATF` and based on `LOG_BSATF=1` infos, only when `self.requestCount % self.fairWindow == 0` the `currWindow` will be updated, so no starvation with `./disk.py -a 24,10,11,12,13 -o 2 -w 2 -p BSATF -c`. 
```bash
$ ./disk.py -a 24,10,11,12,13 -o 2 -p SATF -G # starve 24
```
  - ans:
    - > How does it perform, as compared to SATF

      depends whether miss so that more rotation
      e.g. here with `SATF`, `24` has more rotation -> slower although it makes `11~13` faster.
```bash
# here BSATF faster
$ ./disk.py -a 24,10,11,12,13 -o 2 -w 2 -p SATF -c | tail -n 2
  TOTALS      Seek: 80  Rotate:445  Transfer:150  Total: 675
$ ./disk.py -a 24,10,11,12,13 -o 2 -w 2 -p BSATF -c | tail -n 2
TOTALS      Seek:200  Rotate:295  Transfer:150  Total: 645
# here SATF faster because some time of Rotate is used for overlap with Transfer
$ ./disk.py -a 24,10,11,12,13,14,15,16 -o 2 -w 2 -p SATF -c | tail -n 2 
TOTALS      Seek: 80  Rotate:355  Transfer:240  Total: 675
$ ./disk.py -a 24,10,11,12,13,14,15,16 -o 2 -w 2 -p BSATF -c | tail -n 2
TOTALS      Seek:200  Rotate:295  Transfer:240  Total: 735
```
10. the [ostep_hw] ones use the *miss* and *overlap* between rotation and peek
  - `./disk.py -a 9,20 -G`
    the `20` rotation time is somewhat included when rotation to `9`
  - `./disk.py -a 9,20 -c -p SATF`
    the `9` is just missed so more rotation time which is *not included* in other rotation (included partly in the *seek*).
### raid
RAID-1 choices, notice by `LOG_RAID_1_off=True`, it is based on the offset even or odd, instead of logical address even or odd.
> for *even*-numbered logical blocks, the RAID chooses the *even*-numbered disk in the pair; the odd disk is used for odd-numbered logical blocks.
1. [left-asymmetric](https://misc.openbsd.narkive.com/CZgMVNjF/why-left-asymmetric-layout-for-raid-5#post3) can avoid some overlap (See the [figure](https://www.reclaime-pro.com/posters/raid-layouts.pdf)) (i.e. `3,4` use two disks in left-symmetric but 3 in left-asymmetric -> the latter more parallel in some way)
  default `ARG numDisks 4`.
- here `16` is 17th logical address, so `17/3=5,17%3=2` -> disk `2-1=1` (beacuse first is disk 0) and offset 5.
```bash
$ ./raid.py -R 20 -n 5 -L 5 -w 100 -c -5 LA
...
16 1
LOGICAL WRITE to  addr:16 size:4096
  read  [disk 1, offset 5]    read  [disk 2, offset 5]  
  write [disk 1, offset 5]    write [disk 2, offset 5]
```
  - See above narkive pdf for how symmetric type shows.
2. `./raid.py -L 5 -5 LS -c -W seq -C 8192` (`8192=2*4096`) just 2 blocks before changing the disk.
3. 
4. TODO here not take the wait of completion in account. <a id="consecutive_read_RAID_4"></a>
```bash
$ ./raid.py -L 4 -S 16k -c -W seq
0 4
LOGICAL READ from addr:0 size:16384
  read  [disk 0, offset 0]    read  [disk 1, offset 0]    read  [disk 2, offset 0]    read  [disk 0, offset 1] 
$ ./raid.py -L 4 -S 12k -c -W seq -t -w 100
$ ./raid.py -L 4 -S 16k -c -W seq  -w 100
0 4
LOGICAL WRITE to  addr:0 size:16384
# here all disks are written, so use additive parity
  write [disk 0, offset 0]    write [disk 1, offset 0]    write [disk 2, offset 0]    write [disk 3, offset 0]  
  read  [disk 0, offset 1]    read  [disk 3, offset 1]  
  write [disk 0, offset 1]    write [disk 3, offset 1]  
```
5. 
- `t = r.go()` -> `t = self.disks[d].go()` -> `return self.utilTime` 
  so always one disk has `utilTime` which equals `totalTime` although it *may not runs from start to the end*.
  So the `totalTime` means `total_util_Time` instead of the total running time.
- `-L 4` is the longest as expected.
6. based on [ostep_hw], the more disks *amortize* the penalty of one entire parity disk.
```bash
$ ./raid.py -L 4 -t -n 200 -c -D 8 | tail -n 2
STAT totalTime 343.70000000000005
$ ./raid.py -L 5 -t -n 200 -c -D 8 | tail -n 2
STAT totalTime 259.8999999999999

```
7. from the [ostep_hw] result
- `./raid.py -L 1 -t -n 100 -c -w 100       // 509.8` compared with the read, shows "Figure 38.8" sequential read only shows the penalty `/2` when reading a lot which may make the [unused read](https://superuser.com/q/1809675/1658455).
- TODO `100 * 10 / 4` in [ostep_hw]
maybe "seek" counts?
```bash
[czg_arch ~/ostep-homework/file-raid]$ ./raid.py -t -n 100 -c -w 100 -L 0 | grep seekTime | wc -l
92
[czg_arch ~/ostep-homework/file-raid]$ ./raid.py -t -n 100 -c -w 100 -L 1 | grep seekTime | wc -l
190
```
- `(N − 1) · S` with the Sequential Write of RAID-5 is only the *worst case* (where always read the different track so that *different parity disks*) in "Figure 38.8".
  so `./raid.py -L 5 -t -n 100 -c -w 100       // 497.4` better than RAID-4.
8. 
- > How does the performance vary with RAID level, and when doing reads versus writes

  not many differences.
- > How about when varying the size of each request

the sequential property *amortizes* somewhat.
```bash
$ ./raid.py -L 4 -t -n 100 -c -w 100 -W seq | tail -n 2
STAT totalTime 13.399999999999988

[czg_arch ~/ostep-homework/file-raid]$ ./raid.py -L 4 -t -n 1000 -c -w 100 -W seq | tail -n 2
STAT totalTime 43.40000000000037

[czg_arch ~/ostep-homework/file-raid]$ ./raid.py -L 4 -t -n 10000 -c -w 100 -W seq | tail -n 2
STAT totalTime 343.4000000000096
```
- TODO make `$ ./raid.py -L 4 -t -n 40000 -c -w 100 -W seq | tail -n 2` work.
- why `12k`
always scales up so all numbers of requests are reasonable.
```bash
$ for i in $(seq 6);do num=$(python -c "print($i*5000)");./raid.py -L 4 -t -n ${num} -c -w 100 -W seq | tail -n 2;done
STAT totalTime 176.69999999999425

STAT totalTime 343.4000000000096

STAT totalTime 510.00000000004746

STAT totalTime 676.7000000000853

STAT totalTime 843.4000000001232

STAT totalTime 1010.0000000001611
```
### Files and Directories
1. TODO not changes which is different from [ostep_hw]. 
- `40755` [meaning](https://stackoverflow.com/a/46748199/21294350)
4. 
```bash
$ sudo ls -al sed  
total 4
dr--r--r-- 1 root     root      10 Jul 27 10:07 .
$ ./myfind.out -d 1 -n 'c' ~/czg_tmp/sed/
optind:3
optind:5 pattern:c
/home/czg_arch/czg_tmp/sed/

# the 'x' mode doesn't influence read of the dir, but the 'r' does.
$ sudo chmod o-r sed
$ sudo ls -al sed   
total 4
dr--r----- 1 root     root      10 Jul 27 10:07 .
...
$ ./myfind.out -d 1 -n 'c' ~/czg_tmp/sed/
optind:3
optind:5 pattern:c
/home/czg_arch/czg_tmp/sed/
myfind: '/home/czg_arch/czg_tmp/sed/': Permission denied
```
### File System Implementation
- `refCnt = 2` makes the dir default "r:2", but `stat` with dir is not this case, also after creating the subdir.
1. 
```bash
$ ./vsfs.py -n 6 -s 17
...

# ans
create /u dir
create /a file
unlink /a
create /z dir
create /s dir
create /z/f file
```
2. inode number increment and decrement.
See [ostep_hw] better.
3. dir; `mkdir`
  `./vsfs.py -d 2 -n 100 -p -c -s 3` will fails with `write`.
  `if self.dbitmap.numFree() == 0:` makes crash when no free.
4. 3 plus `create`,
  ~~based on Figure 40.3,`open/read` doesn't add to inodes -> succeeds.~~
  From `rc = self.doAppend()` there is no separate `read` operation.
  ~~TODO different from [ostep_hw].~~
  - Use `str="read";for i in $(seq 10000);do echo $i; ./vsfs.py -i 2 -n 100 -p -c -s $i | grep $str;done > ~/log_inode.log 2>&1` to debug.

### Fast File System
3. here `59=40+20-1`.
```bash
$ ./ffs.py -f in.largefile -L 100 -T -c -S
group inodes    data
    0 /a-------- /aaaaaaaaa aaaaaaaaaa aaaaaaaaaa
    1 ---------- aaaaaaaaaa a--------- ----------
...
a            1  /a           regular    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 

span: files
  file:         /a  filespan:  59
               avg  filespan:  59.00
```
4. 
5. `./ffs.py -f in.manyfiles -c -T` avoid the defragmentation.
6. `./ffs.py -f in.manyfiles -L 100 -v -T -c -i 5` larger.
7. ~~same as 5.~~
  avoid the defragmentation somewhat.
9. 2 and above is same; increase mostly.
### 42
- notice obviously the data block addr is different from the inode block addr.
- "[z] [] [] [g]" is included when run on my computer.
```bash
$ ./fsck.py -S 1
Final state of file system:

inode bitmap 1000100010000001
inodes       [d a:0 r:4] [] [] [] [d a:12 r:2] [] [] [] [d a:6 r:2] [] [] [] [] [f a:-1 r:2] [] [f a:-1 r:1]
# based on `self.inodes[parentInum].incRefCnt()`, here / has 2 sub-directories -> r:4
data bitmap  1000001000001000
data         [(.,0) (..,0) (g,8) (w,4) (m,13) (z,13)] [] [] [] [] [] [(.,8) (..,0) (s,15)] [] [] [] [] [] [(.,4) (..,0)] [] [] [] 
...
Can you figure out how the file system was corrupted?
# here the 13th bit (when 1st is 0th) of the inode is wrong when 13th block has been allocated.
```
  ~~here accumulative `refCnt` of `f` is 3 corresponding to 3 files -> no error with inode `refCnt`.~~
  here `(m,13) (z,13)` implies `[f a:-1 r:2]`
  `(s,15)` means it is in the inode block 15.
- Here I use `python 3.11.5` which influences the `seed`.
- The following based on `fsck` instead of `journaling`.
1. similar to README
```bash
$ ./fsck.py -D
data         [(.,0) (..,0) (g,8) (w,4) (m,13) (z,13)] [] [] [] [] [] [(.,8) (..,0) (s,15)] [] [] [] [] [] [(.,4) (..,0)] [] [] [] 
# dir: /g,/w by viewing `(.,8)`, etc. ## wrong without /
# file: /g/s,/m,/z
```
2. based on `fsck`, prefer the inode state than the inode bitmap. See p5 "Free blocks" 
4. data is wrong.
  ```bash
  CORRUPTION::INODE 8 with directory [('.', 8), ('..', 0), ('s', 15)]:
     entry ('s', 15) altered to refer to different name (y)
  ```
  38 -> possible because conventional `..` See "Directory checks" in p6.
   ```bash
   CORRUPTION::INODE 4 with directory [('.', 4), ('..', 0)]:
     entry ('..', 0) altered to refer to different name (b)
   ```
  642 -> detectable but unable to fix.
   ```bash
   CORRUPTION::INODE 0 with directory [('.', 0), ('..', 0), ('g', 8), ('w', 4), ('m', 13), ('z', 13)]:
     entry ('g', 8) altered to refer to different name (w)
   ```
- TODO "Add a 1 to the folder name." in [ostep_hw]
5. use the data block.
6. same as 5.
7. same as 5.
- TODO why "All data will be lost."
  since the crash only writes the inode partly which may not have modified the data blocks.
8. ~~Yes as the always case for redundancy.~~
  As [ostep_hw] says, no need for redundancy here.
9. scan the data block.
  - See `./vsfs.py -n 10 -p -c -s 6`, where `[f a:2 r:2]` in `inodes` means the file contents are in data block 2.
    So here no data block which is not a directory, then it is ok if *either* inode or data is corrupted.
    i.e. `[f a:7 r:2]` -> `[f a:-1 r:2]`
    ```bash
    $ ./fsck.py -S 16 -c
    RANDINT 4
    CORRUPTION::INODE 13 points to dead block 7
    ...
    inodes       [d a:0 r:4] [] [] [] [d a:12 r:2] [] [] [] [d a:6 r:2] [] [] [] [] [f a:7 r:2] [] [f a:-1 r:1] 
    ```
### 43
1. create -> write -> create
```bash
$ ./lfs.py -n 3
...
FINAL file system contents:
[   0 ] ?    checkpoint: 14 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
[   1 ] ?    [.,0] [..,0] -- -- -- -- -- -- 
[   2 ] ?    type:dir size:1 refs:2 ptrs: 1 -- -- -- -- -- -- -- 
[   3 ] ?    chunk(imap): 2 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
[   4 ] ?    [.,0] [..,0] [ku3,1] -- -- -- -- -- 
[   5 ] ?    type:dir size:1 refs:2 ptrs: 4 -- -- -- -- -- -- -- 
[   6 ] ?    type:reg size:0 refs:1 ptrs: -- -- -- -- -- -- -- -- 
[   7 ] ?    chunk(imap): 5 6 -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
[   8 ] ?    z0z0z0z0z0z0z0z0z0z0z0z0z0z0z0z0
[   9 ] ?    type:reg size:8 refs:1 ptrs: -- -- -- -- -- -- -- 8 
[  10 ] ?    chunk(imap): 5 9 -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
[  11 ] ?    [.,0] [..,0] [ku3,1] [qg9,2] -- -- -- -- 
[  12 ] ?    type:dir size:1 refs:2 ptrs: 11 -- -- -- -- -- -- -- 
[  13 ] ?    type:reg size:0 refs:1 ptrs: -- -- -- -- -- -- -- -- 
[  14 ] ?    chunk(imap): 12 9 13 -- -- -- -- -- -- -- -- -- -- -- -- -- 
$ ./lfs.py -n 3 -o -c
...
write file  /ku3 offset=7 size=4 
contents ['z0z0z0z0z0z0z0z0z0z0z0z0z0z0z0z0', 'v1v1v1v1v1v1v1v1v1v1v1v1v1v1v1v1', 'x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2', 'i3i3i3i3i3i3i3i3i3i3i3i3i3i3i3i3']
...
```
  - live: 12->11
    9->8
    13
    - lack 0,14
  - `type:reg size:8 refs:1 ptrs: -- -- -- -- -- -- -- 8` because
    1. `new_inode['size'] = max(current_offset, inode['size'])` will use the `current_offset` (i.e. 8) as `size` here (here `while current_offset < NUM_INODE_PTRS and current_offset < offset + len(contents):` make only part of the contents written to the disk). 
    2. `new_inode_address = self.log(new_inode)` will add the contents to the disk.
3. Here `write file  /us7 offset=4 size=0` may be a little redundant.
4. Too many requests. The basic idea is same as above.
6. continuous -> faster.
  See [ostep_hw] for more.
7. See 1
8. the `..` increase the `refs` of `/`.
  See [ostep_hw]
9. No
  just increase `refs`
10. `-a r` -> `[kg5,205]`
  imap too many empty slots.
11. data loss.
  possible data loss.
  replay and update the checkpoint. See [ostep_hw] it depends on the log contents as the previous chapter says.
### 44
- `ideal` -> direct memory instead of SSD.
  > The first is what we'll call an "ideal" SSD, which actually isn't much an SSD at all; it's more like a perfect memory.
  So it doesn't have the `E` state.
- `update_cursor` will `self.current_page = -1` when all pages in one block are used.
- `for block in (x for y in (range(self.gc_current_block, self.num_blocks), range(0, self.gc_current_block)) for x in y):`
```python
# init
gc_current_block=1
num_blocks=3
# test the most inner
for y in (range(gc_current_block, num_blocks), range(0, gc_current_block)):
# or "for y in [range(gc_current_block, num_blocks), range(0, gc_current_block)]:"
  print(y)
######## output
# range(1, 3)
# range(0, 1)
########
k = [x for y in (range(gc_current_block, num_blocks), range(0, gc_current_block)) for x in y]
k
######## output
# [1, 2, 0]
########
for block in (x for y in (range(gc_current_block, num_blocks), range(0, gc_current_block)) for x in y):
  print(block)
######## output
# 1
# 2
# 0
########
```
4. $4*(40+10)+1000=1200$
```bash
$ ./ssd.py -T log -s 1 -n 10 -C
...
# erase
cmd   0:: write(12, u) -> success
cmd   1:: write(32, M) -> success
cmd   2:: read(32) -> M
cmd   3:: write(38, 0) -> success
cmd   4:: write(36, e) -> success
cmd   5:: trim(36) -> success
cmd   6:: read(32) -> M
cmd   7:: trim(32) -> success
cmd   8:: read(12) -> u
cmd   9:: read(12) -> u
...
```
5. ~~`./ssd.py -T direct -s 1 -n 10 -C` no overwrite -> same.~~
  wrong -> ~~two~~ erase (See p7, it will erase each time when writting by default), so
  - here `self.physical_program(old_page, old_data)` will count each page write -> `Writes   0          1          0          6          0          0          0          Sum: 7` where `6=3+0+1+2` (See "write_cnt plus 1 due to old pages" for `1+2` meaning)
  - less earse and related read, write.
7. See README instead of [ostep_hw]
  By viewing `LOG_GC_SKIP` infos, when encountering
```bash
$ ./ssd.py -T log -n 1000 -C -G 4 -g 3 -J -F | less
...
cmd  98:: write(4, U) -> success

FTL     0: 63   2: 17   4: 20   5: 35   6: 30   9: 64  12: 65  15: 68  16: 10  17: 39 
       18: 11  19: 62  24: 19  25: 38  27: 61  28: 18  29: 66  30: 16  31: 67  32: 12 
       33: 14  34: 15  35: 60  37: 33  40: 31  42: 37  43: 69  45: 34  46: 32  47: 13 
       48: 36 
Block 0          1          2          3          4          5          6          
Page  0000000000 1111111111 2222222222 3333333333 4444444444 5555555555 6666666666 
      0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 
State EEEEEEEEEE vvvvvvvvvv vEEEEEEEEE vvvvvvvvvv EEEEEEEEEE EEEEEEEEEE vvvvvvvvvv 
Data             CxtzZ1zrKj U          wS1qXg3ljS                       TW5PZkrIdh 
Live             ++++++++++ +          ++++++++++                       ++++++++++ 

blocks_in_use 4
begin garbage_collect
x first in  [0,7)
x secondly in  [0,0)
skip 0 due to STATE_ERASED
skip 1 due to all live block inside it
skip current block 2
skip 3 due to all live block inside it
skip 4 due to STATE_ERASED
skip 5 due to STATE_ERASED
skip 6 due to all live block inside it
# notice above although 4 blocks are used, but due to no free candidate, so free delayed.
cmd  99:: write(42, Y) -> success

FTL     0: 63   2: 17   4: 20   5: 35   6: 30   9: 64  12: 65  15: 68  16: 10  17: 39 
       18: 11  19: 62  24: 19  25: 38  27: 61  28: 18  29: 66  30: 16  31: 67  32: 12 
       33: 14  34: 15  35: 60  37: 33  40: 31  42: 21  43: 69  45: 34  46: 32  47: 13 
       48: 36 
Block 0          1          2          3          4          5          6          
Page  0000000000 1111111111 2222222222 3333333333 4444444444 5555555555 6666666666 
      0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 
State EEEEEEEEEE vvvvvvvvvv vvEEEEEEEE vvvvvvvvvv EEEEEEEEEE EEEEEEEEEE vvvvvvvvvv 
Data             CxtzZ1zrKj UY         wS1qXg3ljS                       TW5PZkrIdh 
Live             ++++++++++ ++         +++++++ ++                       ++++++++++ 

blocks_in_use 4
begin garbage_collect
x first in  [0,7)
x secondly in  [0,0)
skip 0 due to STATE_ERASED
skip 1 due to all live block inside it
skip current block 2
gc 12:: read(physical_page=30)
gc 12:: write()
gc 12:: read(physical_page=31)
gc 12:: write()
gc 12:: read(physical_page=32)
gc 12:: write()
gc 12:: read(physical_page=33)
gc 12:: write()
gc 12:: read(physical_page=34)
gc 12:: write()
gc 12:: read(physical_page=35)
gc 12:: write()
gc 12:: read(physical_page=36)
gc 12:: write()
gc 12:: read(physical_page=38)
gc 12:: write()
gc 12:: read(physical_page=39)
gc 12:: write()
All pages used in the current block. Begin check.
current_block 2 num_blocks 7
check block 2
check block 3
check block 4
gc use block 4
erase  3
gc 12:: erase(block=3)
# here block 3 isn't all live, so we can free it. but obviously, it seems to be redundant
```
  From above weird behavior, `gc_high_water_mark` may be better to count the page instead of the block. So that no need to move *many pages* as [ostep_hw] says.
8. ~~[ostep_hw] maybe based on the old script~~
- default no gc
- much erase overheads.
  - Much read and write failures make `log` time less.
- almost all ways
- With gc by `-G 4 -g 3`
  - See 5 -> direct has more overheads of erase and as a side-effect more ones of read and write.
```bash
$ ./ssd.py -T direct -n 1000 -C -G 4 -g 3 -J -F -S
...
Times
  Erase time 520000.00
  Write time 188960.00
  Read time  50480.00
  Total time 759440.00
$ ./ssd.py -T log -n 1000 -C -G 4 -g 3 -J -F -S
...
Times
  Erase time 465000.00
  Write time 184880.00
  Read time  44760.00
  Total time 694640.00
# ideal no GC, so less Write,Read
$ ./ssd.py -T ideal -n 1000 -C -G 4 -g 3 -J -F -S
...
Times
  Erase time 0.00
  Write time 20800.00
  Read time  3740.00
  Total time 24540.00
```
9. erase much less.
  - From `address = random_randint(0, int(hot_target * (max_page_addr - 1)))` the random range applies to *logical* addresses
  - `./ssd.py -T log -s 1 -n 1000 -G 6 -g 8 -S -K 80/20 -J -C -F` will move `valid` more frequently instead of appending `valid`, so less frequent to achieve the `high_water_mark`.
```bash
$ ./ssd.py -T log -s 1 -n 1000 -G 6 -g 8 -S -J -C -F | grep "erase(" | wc -l
129
$ ./ssd.py -T log -s 1 -n 1000 -G 6 -g 8 -S -K 80/20 -k 50 -J -C -F | grep "erase(" | wc -l
72
$ ./ssd.py -T log -s 1 -n 1000 -G 6 -g 8 -S -K 80/20 -J -C -F | grep "erase(" | wc -l
57
```
TODO With `direct`, the behavior is opposite because the hot region will imply higher erase although cold is same.
maybe due to more `read` when no `-K 80/20 -k 50`.
```bash
$ ./ssd.py -T direct -s 1 -n 1000 -G 6 -g 8 -S -K 80/20 -k 50 -J -C -F | grep "erase in write_direct" | wc -l
509
$ ./ssd.py -T direct -s 1 -n 1000 -G 6 -g 8 -S -J -C -F | grep "erase in write_direct" | wc -l             
492
```
### 45
- [Fletcher](https://en.wikipedia.org/wiki/Fletcher%27s_checksum#Example_calculation_of_the_Fletcher-16_checksum) example -> ~~the book code seems to be wrong.~~
  where `CB0` first plus `C0` then `C1` -> `0xFF` so `0xFF%0xFF=0x00`,
  simialr to `CB1`
3. See [ostep_hw]
5. overflow
6. TODO is there one specific pattern for this coincidence?
7. Fletcher cares about order.
  bacause of above `C1`
8. See [ostep_hw]

#### codes
3. performance: former; checking: latter (with small number, they are similar)
  See the before comparison in `./checksum.py`
4. similar to XOR, faster than Fletcher based on `./compare.sh`.
5. there are 4 checksum methods referenced above in the code homework and also in the book.
  Here use the simplest method `XOR`.
### 48
- here no need for [`accept`](https://stackoverflow.com/a/14904296/21294350) for `UDP` because `recvfrom(sfd, buffer, BUFFER_SIZE, 0, peer_addr, peer_addr_len)` will tell the source remote addr "with every incoming UDP datagram".
- `server` uses `NULL` to accept all addresses with one port, so it needs `peer_addr`, etc., in `UDP_Read(sfd, buf, (struct sockaddr *) &peer_addr, &peer_addr_len)` to know what address to send while the client doesn't need.
  See `man`
  > accept connections on any of the host’s network addresses
- `bind` [vs](https://stackoverflow.com/a/27015017/21294350) `connect`
- `sem_open` -> Shared memory ([`/dev/shm`](https://buddy.works/docs/on-premises/solving-problems/shared-memory))
1. `struct sockaddr` is just one general type for `sockaddr_in` and [`sockaddr_storage`](https://stackoverflow.com/a/16010670/21294350) is one more general one for both `struct sockaddr_in` and `struct sockaddr_in6`.
```c
struct sockaddr_in{
...
unsigned char sin_zero[sizeof (struct sockaddr)
			   - __SOCKADDR_COMMON_SIZE
			   - sizeof (in_port_t)
			   - sizeof (struct in_addr)];
}
```
3. by [`err = do_futex_wait (sem, clockid, abstime);`](https://github1s.com/bminor/glibc/blob/master/nptl/sem_waitcommon.c#L183-L184) and [this](https://stackoverflow.com/a/11263910/21294350), `sem_timedwait` won't spin.
4. TODO 5 diff with 4
5. 
6. Use "sequence counter" with the client and the server reorders it.
  Use [io_uring](https://stackoverflow.com/a/65077224/21294350)
  - the client seems to send all requests well.
    TODO `recvfrom` seems to read weird results (Maybe due to the UDP server will read all requests by *only one socket*, so there is Congestion) and [`io_uring_prep_recvfrom`](https://github.com/axboe/liburing/issues/397#issuecomment-1003056318) is not supported but `sendto` is supported.
    So `*_async*` is not totally functional. <a id="async_UDP"></a>
  - TODO
    1. `sendto` [queue](https://stackoverflow.com/a/43622014/21294350)?
```bash
$ ./UDP-server_async.out
read tmp_buf �д��
not read begin_str; tmp_buf �д��
zsh: segmentation fault (core dumped)  ./UDP-server_async.out
$ ./UDP-client_async.out localhost
Send: first hello
read 11 bytes
transmit the message in pieces
send 0begin
to send tmp_buf 0begin_0
prep_send_to send 0begin_0 with len 9
send 1th str:first 
to send tmp_buf first _1
prep_send_to send first _1 with len 9
too many requests
```
- Notice, UDP [doesn't need one server "Second, using unconnected one:"](https://blog.cloudflare.com/everything-you-ever-wanted-to-know-about-udp-sockets-but-were-afraid-to-ask-part-1/) to `connect` so `connect` always succeeds. Also [see](https://stackoverflow.com/a/7818961/21294350)
```bash
# no server is running
$ ./UDP-client.out localhost
Send: first hello
```
7. 
- a.b. just division and compare.
- based on whether timeout if blocking and 
  TODO retry counts (order wrong so needs re-transmit) if async.
### 49
- from the `~/ostep-homework/download/dist-nfs/README`
  1. TODO `awk '(n == 0) {n=1; t0 = $1} (n == 1) {t = $1} END {print t - t0}' sample` is to get the time of the 1st request instead of "the first and last timestamps".
- [`gz`](https://linuxize.com/post/how-to-unzip-gz-file/) by `gzip -dk` or others.
2. `retry` is highly used in NFS.
3. 
4. `read` seems to be more sequential which is different from what [ostep_hw] says.
```bash
$ awk -f ./q4.awk anon-deasna-021016-1300.txt

read_seq_usr_cnt 3446
read 1949 seq skipped
actual seq_cnt:412151
read rnd/seq:111177/408879 with
seq_rnd_max_diff(seq-rnd):50011 by (58992-8981)
seq_rnd_min_diff(seq-rnd):-2475 by (345-2820)

write_seq_usr_cnt 2555
write 1425 seq skipped
actual seq_cnt:188456
write rnd/seq:127211/185030 with
seq_rnd_max_diff(seq-rnd):76130 by (76442-312)
seq_rnd_min_diff(seq-rnd):-31145 by (1355-32500)

$ awk -f ./q4_skip_resend.awk anon-deasna-021016-1300.txt

read_seq_usr_cnt 437
read rnd/seq:109191/408349 with
seq_rnd_max_diff(seq-rnd):50013 by (58992-8979)
seq_rnd_min_diff(seq-rnd):-2460 by (345-2805)

write_seq_usr_cnt 581
write rnd/seq:125162/184631 with
seq_rnd_max_diff(seq-rnd):76133 by (76442-309)
seq_rnd_min_diff(seq-rnd):-31135 by (1355-32490)
```
5. count similar to `check_sub_arr_size` in 4
6. here `!` just to [propagate the error status](https://stackoverflow.com/a/367075/21294350) in the pipeline.
  use `set -e` to ["exit immediately"](https://stackoverflow.com/a/47265582/21294350).
- based on `~/ostep-homework/download/dist-nfs/README`, use `%6` to track the pair.
- avg, etc., see `max_pair,min_pair,rnd_cnt/len` in `q4.awk` (here `len` is not used in the awk script)
7. See [ostep_hw] 2
8. TODO cache.
#### awk
- [concatenate](https://www.gnu.org/software/gawk/manual/html_node/Strings-And-Numbers.html#:~:text=The%20exact%20manner%20in%20which,s%20default%20value%20is%20%22%25.) strs
- str to num [quickly](https://stackoverflow.com/a/45868358/21294350)
### 50
- `self.cache.decref(fname)` when `close` so `'refcnt': 0`
```bash
$ ./afs.py -C 2 -n 1 -s 12 -S 111000 -d 1
      Server                         c0                          c1
...
                                                        open:a [fd:0]
                                                        read:0 -> value?
                                                        close:0
                            open:a [fd:0]
                            write:0 value? -> 1
                            close:0
                                                        invalidate file:a cache: {'a': {'data': 0, 'dirty': False, 'refcnt': 0, 'valid': True}}
```
- `a1` in `oa1` means `fname, fd = a[1], int(a[2])`
- `write` default increment 1 by `self.value += 1`.
- Notice here only when `getfile(self, fname)` will update the cache while `invalidate` only invalidates by `self.cache[fname] = dict(data=self.cache[fname]['data'], dirty=self.cache[fname]['dirty'],refcnt=self.cache[fname]['refcnt'], valid=False)`.
  po this isn't one flaw because it truly shows the file contents which corresponds to when it is `open`ed.
- each client increments the `fd` when `open` each file.
1. `$ ./afs.py -s 12 -f 3 -C 3 -r 0.3 -n 4 -c`
2. check `open:b`, etc., to understand. I only checked partly but the basic idea is same.
  when one client writes one file when `close` which is also `open`ed by other clients.
3. track `close` and `write` which will modify the cache state. (Same as above only checked partly)
4. only when `open` of client 1 after `close` of client 0.
```bash
$ ./afs.py -A oa1:w1:c1,oa1:r1:c1 -c -S 001011
...
                                                        read:1 -> 0
```
5. See 4
6. final `close` decides the result.
  ~~both is `1` similar to 4.~~
  due to write order influencing the write data, so both is 2 due to the ending `00` or `11` is *not splitted*.
```bash
$ ./afs.py -A oa1:w1:c1,oa1:w1:c1 -S 001110 -c | tail -n 1
file:a contains:1
[czg_arch ~/ostep-homework/dist-afs]$ ./afs.py -A oa1:w1:c1,oa1:w1:c1 -S 000111 -c | tail -n 1
file:a contains:2
```
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
```diff
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
the above patch at least works with `qemu v8.0.4/v5.0.1/v4.0.1`
  - with `x86_64-elf-gcc`, it doesn't work even with `2020-09-15 11:27:07 -0500  (tag: v5.0.1, origin/stable-5.0)` or `origin/stable-4.0`. <a id="stuck_x86_64"></a>
  ```bash
  $ git log --tags --simplify-by-decoration --pretty="format:%ci %d" # https://stackoverflow.com/a/13208822/21294350
  ...
  2019-10-17 15:15:33 -0500  (tag: v4.0.1, origin/stable-4.0)
  ```
    - TODO spend more time on the real OS like Unix instead of this simulation.
#### debug with installation of `qemu`
```bash
$ ps aux | grep qemu   
czg_arch  146986  0.2  0.0  15528  4352 pts/5    S+   12:13   0:00 make qemu-nox
czg_arch  146997  117  0.4 1100496 77684 pts/5   Sl+  12:13   0:08 qemu-system-i386 -nographic -drive file=fs.img,index=1,media=disk,format=raw -drive file=xv6.img,index=0,media=disk,format=raw -smp 1 -m 512
czg_arch  147176  0.0  0.0  11288  3072 pts/7    S+   12:13   0:00 grep --color=always qemu
[czg_arch ~/xv6-public]$ gdb -p 146997
...
   41 #ifdef __ASSUME_TIME64_SYSCALLS
 ► 42   return SYSCALL_CANCEL (ppoll_time64, fds, nfds, timeout, sigmask,
   43                          __NSIG_BYTES);
...
pwndbg> p nfds
$1 = 0x5
pwndbg> p fds
$2 = (struct pollfd *) 0x56292d980340
pwndbg> p *fds
$3 = {
  fd = 0x0,
  events = 0x1,
  revents = 0x0
}
```
- remove the [`extern "C"`](https://stackoverflow.com/a/1041880/21294350) wrapper.
- installation [recommendation](https://wiki.qemu.org/Hosts/Linux#Simple_build_and_test) with `--enable-debug`
  Since archlinux only support downgrading from [cache](https://unix.stackexchange.com/a/103868/568529). Also [see](https://unix.stackexchange.com/a/313526/568529)
  - `=` in [`pacman -S package=1.2.3-1`](https://bbs.archlinux.org/viewtopic.php?pid=1841068#p1841068) no use.
### Codes
- based on this [video](https://www.youtube.com/watch?v=vR6z2QGcoo8)
  1. "17:45" the `UPROGS` can be without leading `_`
    This can be also seen from the code in `mkfs` which make the executable (Also see the comments for reasons why they did this):
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
- `argint` or `argptr` See `syscall.c` related comments.
  - so `argptr` return `pp` (`void **`) which points to some memory `void *`.
    > Fetch the nth word-sized system call argument as a *pointer to a block of memory* of size bytes

    - here `(char*)` and `void *` size is same, so both is ok
    - by `argptr(int n, char **pp, int size)`, `*pp = (char*)i;` and **`(uint)i+size > curproc->sz`** etc 

      `*pp` ~~points to one memory range of~~ with size `size`. <a id="argptr_size"></a>
  - From `(uint)i+size` the `size` corresponds to size of `n`th parameter.
    `fetchint((myproc()->tf->esp) + 4 + 4*n, ip)` implies `0` corresponds to the 1st parameter.
- `P2V` is [specific](https://stackoverflow.com/questions/50073792/whats-the-mechanism-behind-p2v-v2p-macro-in-xv6) to the xv6 memory space. 
  See the figure.
- here assume page table bits same as [x86](https://pekopeko11.sakura.ne.jp/unix_v6/xv6-book/en/Page_tables.html).
- How `write` [works](https://stackoverflow.com/questions/49971604/how-does-xv6-write-to-the-terminal).
- memory allocation init by `kinit1(end, P2V(4*1024*1024)); // phys page allocator`.
  So we can use `kalloc(void)` then.
  And `if((p->kstack = kalloc()) == 0){` means allocation failure.
- TODO trapframe is to store current function state by [this](https://github.com/YehudaShapira/xv6-explained/blob/a0f15f4c3427238c54ec090528f9b32ff32c7e4c/Explanations.md).
  > When we return from an interrupt (or, in our case, start the process for the first time), we do the following:

#### Kernel Threads
- `trapframe` is special `context` which is used in [exception](https://stackoverflow.com/a/47855470/21294350) manipulation.
- `filedup` similar to [`dup2`](https://github1s.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/dup2.c#L29-L30) in csapp which has the `f->ref` count.
  See [this](#dup_inc)
```bash
/mnt/ubuntu/home/czg/csapp3e/conc/homework/tiny_12_35 $ cd cgi-bin;make --always-make;cd ..;make --always-make;gdb -ex 'br dup2' -ex 'r' --args ./tiny 8080
# browser http://127.0.0.1:8080/cgi-bin/adder?1&2 (not use https because not support)
pwndbg> si 2
...
 ►0x7ffff7cff349<dup2+9>    syscall  <SYS_dup2>
```
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
### Kernel Threads
#### patch
- `umalloc.o` maybe due to thread_create needing 
  > This routine should call malloc() ...

  it can be shown by removing `umalloc.o` and see the effects.
- `#include "defs.h"` to use `acquire(struct spinlock *lk)` is no use.
  Also see the `~/ostep-hw/projects/vm-xv6-intro/tests/test_1.c`.
- `_test_thread` is compiled by `_%: %.o $(ULIB)` where `%.o` is compiled by default with `%.c` by `make`.
- `EXTRA= ... test_thread.c` is not needed.
- ld with [`-N`](https://stackoverflow.com/q/48549036/21294350) is to allow RMX.
- by [this](#argptr_size), `if (argptr(0, (char **)&stack, sizeof(void *)) < 0)` should be `if (argptr(0, (char **)&stack, sizeof(void **)) < 0)` although their size is same.
- Since `CPU=1` in `makefile`, here thread is only one concept but not totally based on hardware.
  - it just create one process `if ((np = allocproc()) == 0)` and let the scheduler decide the rest.
- `join` will first `sleep(curproc, &ptable.lock);` if any thread and then `wakeup1` by thread `exit` and 
  (TODO) then maybe `if(p->state == ZOMBIE)` in parent before `curproc->state = ZOMBIE;` in thread. Then the parent may be into sleep again and no other threads will wake up it. (This mainly depends on how scheduler schedules between processes)
- [`__ATOMIC_SEQ_CST`](https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html) enforces total ordering which is seen by *all cores*.
- [x86 Calling Convention](https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/concurrency-xv6-threads/README.md#x86-calling-convention)
  from code `return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);` which is same as [x86](https://www.cs.mcgill.ca/~cs573/fall2002/notes/lec273/lecture15/15_4.htm#:~:text=To%20pass%20parameters%20to%20a,the%20bottom%20of%20the%20stack.) the latter parameter stores at higher address, so the patch
```diff
+  uint *sp = stack + PGSIZE;
+  sp--;
+  *sp = (uint)arg2;
+  sp--;
+  *sp = (uint)arg1;
+  sp--;
+  *sp = 0xffffffff;        // fake return PC
```
  where the last `sp` stores the fake return which corresponds to `fcn`.
  and `+ 4` above is probably to store the syscall return address, which can be seen in `/mnt/ubuntu/home/czg/csapp3e/Operating_System/code_test/miscs/call_arg_stack/call_arg_stack.out`
##### TODO
- How to align `void *stack = malloc(PGSIZE);`?
#### linux and glibc thread implementation
- also based on `clone`
  [this](https://github1s.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/clone-internal.c#L85-L86) calls the syscall [`clone3`](https://github1s.com/torvalds/linux/blob/aed8aee11130a954356200afa3f1b8753e8a9482/kernel/fork.c#L3194-L3195)
  so it is also based on *processes*.
#### debugs
- See [this](#stuck_x86_64) x86_64 always stuck.
  So I switches to `i386` but it doesn't support atomic.
#### i386
- `xadd` [not implemented](https://github.com/confluentinc/librdkafka/issues/212#issuecomment-81481119) in i386 (if implemented, the single instruction must ensure it atomic. If not, we needs `lock`)
  the non-support also see [1](https://www.reddit.com/r/osdev/comments/t92isg/comment/hzw7q1z/?utm_source=share&utm_medium=web2x&context=3)
  See this [example](https://stackoverflow.com/a/130813/21294350)
  With [old gcc](https://gcc.godbolt.org/z/zr6qKxz7n) [>= 4.9](https://stackoverflow.com/a/20326913/21294350), also fails.
  - weird [this](http://fxr.watson.org/fxr/source/i386/include/atomic.h?im=bigexcerpts#L188) still use `xadd`
  - [`adc`](https://stackoverflow.com/a/67326816/21294350) not supports `lock`
  - [`cmpxchg`](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54087#c0) also [not supported](https://www.felixcloutier.com/x86/cmpxchg#ia-32-architecture-compatibility)
- [test 32 bit binary](https://stackoverflow.com/a/27679899/21294350) on the 64-bit machine by `gcc atomic_fetch_add.c -o atomic_fetch_add.out -mtune=i386 -m32`.
  but it still uses `xadd`.
  - archlinux [config](https://www.linuxquestions.org/questions/programming-9/how-to-use-32-bit-c-libraries-on-64-bit-arch-linux-801349/#post3931706) to enable 32-bit compilation.
    Also see [1](https://bbs.archlinux.org/viewtopic.php?pid=1535840#p1535840) or [2](https://bbs.archlinux.org/viewtopic.php?pid=1894569#p1894569) if error.
  ```bash
  $ pacman -Qs lib32
  local/lib32-gcc-libs 13.2.1-3 # avoid "-m32 cannot find libgcc_s.so.1: No such file or directory" error
      32-bit runtime libraries shipped by GCC
  local/lib32-glibc 2.38-3 # https://stackoverflow.com/a/7412698/21294350
      GNU C Library (32-bit)
  ```
  - from this `-m32` is [not totally same](https://stackoverflow.com/q/9467860/21294350) as `i386`
    and [`cmpxchg8b`](https://www.felixcloutier.com/x86/cmpxchg8b:cmpxchg16b#ia-32-architecture-compatibility) atill not supports `i386`
- [`libatomic`](https://stackoverflow.com/a/53300405/21294350) by [`-latomic`](https://stackoverflow.com/questions/30591313/why-does-g-still-require-latomic) only applies to 64-bit. See above "not implemented"
##### solution
- use the lock as the `xv6` does. See `~/ostep-hw/projects/concurrency-xv6-threads/threads_asm.patch`
```bash
[czg_arch ~/xv6-public]$ git rev-parse HEAD
eeb7b415dbcb12cc362d0783e41c3d1f44066b17
# I use qemu 8.1.0
$ yay -Qi qemu-base
Name            : qemu-base
Version         : 8.1.0-2
$ git reset --hard origin/master;git clean -f -x -d .;\
tree > ~/orig_xv6_tree.txt.cmp;diff ~/orig_xv6_tree.txt.cmp ~/ostep-hw/projects/concurrency-xv6-threads/orig_xv6_tree.txt;\
git apply ~/ostep-hw/projects/concurrency-xv6-threads/threads_asm.patch;\
make qemu-nox
...
$ test_thread
Main thread pid: 3
Before thread_create()
First arg: I've tried not to remember no memories, second arg: 69
best_num in thread: 42
thread pid: 4
Returned thread pid: 4
best_num in main: 69
myturn: 0
myturn: 1
number: 300
```
## shell and lottery
- shell related chapters
  - 5,
  - TODO
    - try using processes to implement parallel.
  - [POSIX.1‐2017](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/)
- lottery
  - 9
## pzip
- > what happens if one thread runs more slowly than another? Does the compression give more work to faster threads?

  IMHO, see pzip.c "consecutive".
- TODO
  - > Thus, making the core compression loop as *CPU efficient* as possible is needed for high performance.

    So the code just write in the compression loop instead of calculation.
### align
[wiki](https://en.wikipedia.org/wiki/Data_structure_alignment#Typical_alignment_of_C_structs_on_x86)
- > This may not be true for unaligned accesses to *multiple* memory words, e.g. the first word might be read by one device, both words written by another device and then the second word read by the first device so that the value read is *neither the original value nor the updated value*

  i.e. the value can't be loaded or written as one whole.
- TODO
  > This limitation is not present when compiling for x86.

[catb](http://www.catb.org/esr/structure-packing/) I only read 3,4
- > Storage for the basic C datatypes on a *vanilla ISA doesn’t normally start at arbitrary* byte addresses in memory. Rather, each type except char has an alignment requirement; chars can start on any byte address, but 2-byte shorts must start on an even address, 4-byte ints or floats *must* start on an address divisible by 4

  - > Self-alignment makes access faster because it facilitates generating *single*-instruction fetches and puts of the typed data

    > It is good to know in any application where you really, really care about optimizing your use of memory bandwidth and minimizing cache-line misses.

    these are also said in csapp.
- TODO
  - > Historically, some processors (especially those lacking barrel shifters) have had more restrictive ones

## webserver
- See csapp asm doc "related with tiny interfaces"
- ostep_hw changes
  - `request_read_headers` use one more elegant `do{}while()`
  - `size_t` [better](https://stackoverflow.com/a/73167304/21294350) `%zu`
## concurrency-mapreduce
- Also see this [solution](https://github.com/prabhsuggal/OSTEP/blob/master/projects/concurrency-mapreduce/mapreduce.c)
- See `diff hash_orig.c hash_orig_mod.c` for some comments.
### TODO (this seems to be solved but I didn't update this note, which can be tested by `valgrind`)
- the rest `indirectly` is related with `create_item`.
  But after checking `CHECK_CREATE_ITEM`, all `Ht_item *` pointer by `create_item` are freed.
```bash
==36445== 86,961 (2,520 direct, 84,441 indirect) bytes in 105 blocks are definitely lost in loss record 6 of 6
==36445==    at 0x484178B: malloc (vg_replace_malloc.c:431)
==36445==    by 0x10A0B3: create_item (hash.c:197)
==36445==    by 0x10A487: ht_insert (hash.c:327)
==36445==    by 0x1095A6: MR_Emit (mapreduce.c:56)
==36445==    by 0x109455: Map_FILE (mapreduce.c:18)
==36445==    by 0x109610: Map_wrpapper (mapreduce.c:66)
==36445==    by 0x494D9EA: start_thread (pthread_create.c:444)
==36445==    by 0x49D1C83: clone (clone.S:100)
==36445== 
==36445== LEAK SUMMARY:
==36445==    definitely lost: 2,520 bytes in 105 blocks
==36445==    indirectly lost: 84,441 bytes in 315 blocks
```
## filesystems-check
### patch
- use `%s/\v([^^]) $/\1/g` in `vim` to remove "trailing whitespace".
  notice to regenerate the patch after modifying the source files because the **`index` has changed**.
```bash
$ idi ~/tmp.patch ~/ostep-hw/projects/filesystems-check/xv6_patch/mkfs.c.patch
/home/czg_arch/tmp.patch                                                                  /home/czg_arch/ostep-hw/projects/filesystems-check/xv6_patch/mkfs.c.patch                
+CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -f  +CFLAGS = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -f 
no-omit-frame-pointer                                                                     no-omit-frame-pointer                                                                    
 CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo    CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo  
-fno-stack-protector)                                                                     -fno-stack-protector)                                                                    
 ASFLAGS = -m32 -gdwarf-2 -Wa,-divide                                                      ASFLAGS = -m32 -gdwarf-2 -Wa,-divide                                                    
 # FreeBSD ld wants ``elf_i386_fbsd''                                                      # FreeBSD ld wants ``elf_i386_fbsd''                                                    
diff --git a/mkfs.c b/mkfs.c                                                              diff --git a/mkfs.c b/mkfs.c                                                             
index 8e011a7..00c897b 100644                                                             index 8e011a7..627fa65 100644                                                            
--- a/mkfs.c                                                                              --- a/mkfs.c                                                                             
+++ b/mkfs.c                                                                              +++ b/mkfs.c                                                                             
@@ -231,6 +231,7 @@ ialloc(ushort type)                                                   @@ -231,6 +231,7 @@ ialloc(ushort type)                                                  
   din.nlink = xshort(1);                                                                    din.nlink = xshort(1);                                                                
   din.size = xint(0);                                                                       din.size = xint(0);  
```
### xv6
- `freeblock` controls the data block location.
  So `iappend` just updates the data block.
- `wsect(i, zeroes);` will init all to `0` by default.
- by `nblocks = FSSIZE - nmeta;` -> `FSSIZE` is the block num.
  `int nbitmap = FSSIZE/(BSIZE*8) + 1;` -> `BSIZE` is byte num in each block and `8` is due to each `char` has `8` bits.
  So `assert(used < BSIZE*8);` should always meet because `FSSIZE<BSIZE*8` where what data range `uchar buf[BSIZE];` can contain.
- `balloc(freeblock);` but with `indirect[fbn - NDIRECT] = xint(freeblock++);` which increments `freeblock` after assigning `freeblock`
  so the last `freeblock` used is **fake**.
#### TODO
### contest
- TODO
  1. > We will provide you with an xv6 image that has a number of in-use inodes that are not linked by any directory. 
    temporarily unavailable.
- `memmove` [vs](https://stackoverflow.com/a/1201337/21294350) `memcpy`
- Use `bin_d2c ./fs.img.repair ~/xv6-public/fs.img | less_n` to check whether the right binary generated.
#### test
- by using `mkfs.c.error_img.patch`
```bash
[~/xv6-public]$ make fs.img --always-make
~/ostep-hw/projects/filesystems-check $ git rev-parse HEAD
f043fe385bcacf7d0816b731e74f711b0a9b815d
$ make --always-make
$ rm fs.img.*
$ ./xcheck_contest_3.out -r ~/xv6-public/fs.img
$ bin_d2c ~/xv6-public/fs.img.repair ~/xv6-public/fs.img | less_n
...
     12 @@ -1920,22 +1920,22 @@
     13  000077f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
     14  00007800: 0200 2e00 0000 0000 0000 0000 0000 0000  ................
     15  00007810: 0100 2e2e 0000 0000 0000 0000 0000 0000  ................
     16 -00007820: 0300 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     17 -00007830: 0400 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     18 -00007840: 0500 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     19 -00007850: 0600 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     20 -00007860: 0700 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     21 -00007870: 0800 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     22 -00007880: 0900 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     23 -00007890: 0a00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     24 -000078a0: 0b00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     25 -000078b0: 0c00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     26 -000078c0: 0d00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     27 -000078d0: 0e00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     28 -000078e0: 0f00 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     29 -000078f0: 1000 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     30 -00007900: 1100 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
     31 -00007910: 1200 6c6f 7374 5f69 6e6f 6465 7300 0000  ..lost_inodes...
$ ./xcheck_contest_3.out -r ~/xv6-public/fs.img.repair 
find dir inode 1 size:512
lost_found inum:2
find dir inode 2 size:288
lost_found inum:2 addr[0]:60
lost_found_dir_inum 2byte offset 8
check size 288 with imgp related 288
inodestart 32 lost_found_dir_inum:2
data (1,..)data (3,lost_inodes)data (4,lost_inodes)data (5,lost_inodes)data (6,lost_inodes)data (7,lost_inodes)data (8,lost_inodes)data (9,lost_inodes)data (10,lost_inodes)data (11,lost_inodes)data (12,lost_inodes)data (13,lost_inodes)data (14,lost_inodes)data (15,lost_inodes)data (16,lost_inodes)data (17,lost_inodes)

29a3a5d $ make --always-make
rm fs.img.*
./xcheck_contest_3.out -r ~/xv6-public/fs.img
bin_d2c ~/xv6-public/fs.img.repair ~/xv6-public/fs.img | less_n 2>&1
echo -e "\ncheck repair"
./xcheck_contest_3.out -r ~/xv6-public/fs.img.repair
...

check repair
find dir inode 1 size:512
lost_found inum:2
find dir inode 2 size:288
lost_found inum:2 addr[0]:60
```
- not make input file and output file same, them `int file_fd=open(target_file, O_RDWR|O_CREAT|O_TRUNC, 0666);` to create a new image will delete the original image, then all zero so no data is able to be written to the new image.
- using `mkfs.c.test_contest_1_2.patch`
  `ERROR_REFER` -> 1
  `LOOP_DIRS` -> 2
## kv
- [see](https://github.com/MarwanRadwan7/KV)
- [tips](https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/initial-kv/README.md#tips) are just for general coding
- [`$*`](https://unix.stackexchange.com/a/129077/568529)
## memcached
- `.MAKE` maybe no use, [see](https://stackoverflow.com/a/32480894/21294350)
  - where no prerequisite for `run_debug`, so needs to [force updating](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html).
    > Since it has no prerequisites, clean *would always be considered up to date* and its recipe would not be executed.
    - Also see
      ```bash
      $ make all-recursive -d > ~/memcached.log
      $ less ~/memcached.log
      ...
      Makefile:2176: update target 'all-recursive' due to: target is .PHONY
      ...
      gcc -DHAVE_CONFIG_H -I.  -DNDEBUG   -g -O2 -pthread -pthread -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -MT memcached-memcached.o -MD -MP -MF .deps/memcached-memcached.Tpo -c -o memcached-memcached.o `test -f 'memcached.c' || echo './'`memcached.c
      ...
      gcc  -g -O2 -pthread -pthread -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls   -o memcached memcached-memcached.o memcached-hash.o memcached-jenkins_hash.o memcached-murmur3_hash.o memcached-slabs.o memcached-items.o memcached-assoc.o memcached-thread.o memcached-daemon.o memcached-stats_prefix.o memcached-util.o memcached-cache.o memcached-bipbuffer.o memcached-base64.o memcached-logger.o memcached-crawler.o memcached-itoa_ljust.o memcached-slab_automove.o memcached-authfile.o memcached-restart.o memcached-proto_text.o memcached-proto_bin.o        memcached-extstore.o memcached-crc32c.o memcached-storage.o memcached-slab_automove_extstore.o      -levent 
      ```
      - TODO above many `.o` functions. <a id="memcached_mul_o"></a>
- although `make -d` has
```bash
gcc -DHAVE_CONFIG_H -I.  -DNDEBUG   -g -O2 -pthread -pthread -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -MT memcached-proto_bin.o -M      D -MP -MF .deps/memcached-proto_bin.Tpo -c -o memcached-proto_bin.o `test -f 'proto_bin.c' || echo './'`proto_bin.c
```
  but `complete_incr_bin` -> `write_bin_error` -> `errstr = "Non-numeric server-side value for incr or decr";` doesn't run observed by `printf("c->cmd == PROTOCOL_BINARY_CMD_INCREMENT %d\n",c->cmd == PROTOCOL_BINARY_CMD_INCREMENT);`.
- `process_marithmetic_command` is not used observed by `else if (first == 'i') { ... process_arithmetic_command(c, tokens, ntokens, 1);`.
  similarly, `strncmp(cm, "incr", 4)` in `proxy_request.c` also doesn't run.
### features
- > The first argument should be an existing key
  `do_item_get(key, nkey, hv, c, DONT_UPDATE)`
- > anything else should fail in the same manner that incr fails.
  `NON_NUMERIC`, etc in `do_add_delta`
- > Do little changes to test your understanding
  I added many `printf` to see what functions has been run or not.
  I didn't make `incr` function as `decr`.
- > Determine what you can copy to make mult and div work.
  I just add one parameter to pass `Mul_type mul`.
```bash
$ grep -r -w "Mul_type" *  
grep: memcached: binary file matches
memcached.c:                                    item **it_ret,const Mul_type mul) {
grep: memcached-debug: binary file matches
memcached.h:} Mul_type;
memcached.h:                                    item **it_ret,const Mul_type mul);
memcached.h:                                 uint64_t *cas, Mul_type mul);
proto_text.c:static void process_arithmetic_command(conn *c, token_t *tokens, const size_t ntokens, const bool incr,Mul_type mul) {
thread.c:                                 uint64_t *cas, Mul_type mul) {
```
## filesystems-distributed (finish this from 10-5 13:03 to 10-9 09:07 with 1k+ lines of codes, maybe too long...)
- IMHO, my codes may have some errors and much flexibility as the README doesn't say the detailed implementation (mine was based on my understanding of the related chapter contents).
```bash
$ LD_LIBRARY_PATH=..:$LD_LIBRARY_PATH ./server 10000 fs.img
$ LD_LIBRARY_PATH=..:$LD_LIBRARY_PATH ./client
client:: got reply in MFS_Lookup [ret:0 contents:(0)]
client:: got reply in MFS_Stat [ret:0 contents:(64,DIRECTORY)]
client:: got reply in MFS_Creat [ret:0 contents:(0)]
client:: got reply in MFS_Stat [ret:0 contents:(96,DIRECTORY)]
client:: got reply in MFS_Write [ret:0 contents:(0)]
client:: got reply in MFS_Read [ret:0 contents:(test first
)]
client:: got reply in MFS_Creat [ret:0 contents:(0)]
client:: got reply in MFS_Creat [ret:0 contents:(0)]
client:: got reply in MFS_Write [ret:0 contents:(0)]
client:: got reply in MFS_Read [ret:0 contents:(test second
)]
client:: got reply in MFS_Lookup [ret:0 contents:(3)]
client:: got reply in MFS_Stat [ret:0 contents:(4096,REGULAR_FILE)]
The following one should fail
MFS_Unlink: error
client:: got reply in MFS_Unlink [ret:0 contents:(0)]
The following one should fail
rc -1 MFS_Lookup: error
client:: got reply in MFS_Creat [ret:0 contents:(0)]
client:: got reply in MFS_Write [ret:0 contents:(0)]
client:: got reply in MFS_Read [ret:0 contents:(test third
)]
client:: got reply in MFS_Lookup [ret:0 contents:(1)]
client:: got reply in MFS_Unlink [ret:0 contents:(0)]
client:: got reply in MFS_Unlink [ret:0 contents:(0)]
client:: got reply in MFS_Stat [ret:0 contents:(128,DIRECTORY)]
client:: got reply in MFS_Shutdown [ret:0 contents:(0)]
$ LD_LIBRARY_PATH=..:$LD_LIBRARY_PATH gdb --args ./server 10000 fs.img
pwndbg> br 1089 # after `read_img`
pwndbg> r
pwndbg> p checkpoint # here two imaps same See "23(0x17)->..."
$1 = {
  log_end = {
    block = 0x17,
    offset = 0x200
  },
  imap_addr = {[0x0] = {
      block = 0x17,
      offset = 0x100
    }, [0x1] = {
      block = 0x0,
      offset = 0x0
    } <repeats 255 times>}
}
pwndbg> p *(Inode_Map*)(mmap_file_ptr+4096*(0x17)+0x100)
$2 = {
  inode_addr = {[0x0] = {
      block = 0x17,
      offset = 0x0
    }, [0x1] = {
      block = 0x11,
      offset = 0x0
    }, [0x2] = {
      block = 0x15,
      offset = 0x0
    }, [0x3] = {
      block = 0x13,
      offset = 0x0
    }, [0x4] = {
      block = 0x0,
      offset = 0x0
    } <repeats 12 times>},
  maps = {[0x0] = {
      inum = 0x0,
      index = 0x0
    }, [0x1] = {
      inum = 0x1,
      index = 0x1
    }, [0x2] = {
      inum = 0xffffffff,
      index = 0x2
    }, [0x3] = {
      inum = 0xffffffff,
      index = 0x3
    }, [0x4] = {
      inum = 0x0,
      index = 0x0
    } <repeats 12 times>}
}
pwndbg> p *(Inode*)(mmap_file_ptr+4096*(0x11)+0x00) # baz
$4 = {
  size = 0x0,
  type = REGULAR_FILE,
  data_ptr = {[0x0] = 0x0 <repeats 14 times>},
  align = '\000' <repeats 191 times>
}
pwndbg> p *(Inode*)(mmap_file_ptr+4096*(0x17)+0x00)
$5 = {
  size = 0x80,
  type = DIRECTORY,
  data_ptr = {[0x0] = 0x16, [0x1] = 0x0 <repeats 13 times>},
  align = '\000' <repeats 191 times>
}
pwndbg> p *(MFS_DirEnt_t(*)[6])(mmap_file_ptr+4096*0x16+0x0)
$7 = {[0x0] = {
    name = ".", '\000' <repeats 26 times>,
    inum = 0x0
  }, [0x1] = {
    name = "..", '\000' <repeats 25 times>,
    inum = 0x0
  }, [0x2] = {
    name = "baz", '\000' <repeats 24 times>,
    inum = 0x1
  }, [0x3] = {
    name = '\000' <repeats 27 times>,
    inum = 0xffffffff # stop at 0x80/0x20 (0x20=sizeof(MFS_DirEnt_t))
  }, [0x4] = {
    name = '\000' <repeats 27 times>,
    inum = 0x0
  }, [0x5] = {
    name = '\000' <repeats 27 times>,
    inum = 0x0
  }}
pwndbg> r
### then rerun client without exiting the server
$ LD_LIBRARY_PATH=..:$LD_LIBRARY_PATH ./client
client:: got reply in MFS_Lookup [ret:0 contents:(0)]
client:: got reply in MFS_Stat [ret:0 contents:(128,DIRECTORY)]
client:: got reply in MFS_Creat [ret:0 contents:(0)]
client:: got reply in MFS_Stat [ret:0 contents:(128,DIRECTORY)]
MFS_Write: error with -1
### ^C (stty -a) in the server.
pwndbg> p checkpoint 
$8 = {
  log_end = {
    block = 0x19,
    offset = 0x300
  },
  imap_addr = {[0x0] = {
      block = 0x19,
      offset = 0x200
    }, [0x1] = {
      block = 0x0,
      offset = 0x0
    } <repeats 255 times>}
}
pwndbg> p *(Inode_Map*)(mmap_file_ptr+4096*(0x19)+0x200)
$10 = {
  inode_addr = {[0x0] = {
      block = 0x19,
      offset = 0x100
    }, [0x1] = {
      block = 0x11,
      offset = 0x0
    }, [0x2] = {
      block = 0x19,
      offset = 0x0
    }, [0x3] = {
      block = 0x13,
      offset = 0x0
    }, [0x4] = {
      block = 0x0,
      offset = 0x0
    } <repeats 12 times>},
  maps = {[0x0] = {
      inum = 0x0,
      index = 0x0
    }, [0x1] = {
      inum = 0x1,
      index = 0x1
    }, [0x2] = {
      inum = 0x2,
      index = 0x2
    }, [0x3] = {
      inum = 0xffffffff,
      index = 0x3
    }, [0x4] = {
      inum = 0x0,
      index = 0x0
    } <repeats 12 times>}
}
pwndbg> p *(Inode*)(mmap_file_ptr+4096*(0x19)+0x00)
$11 = {
  size = 0x0,
  type = REGULAR_FILE,
  data_ptr = {[0x0] = 0x0 <repeats 14 times>},
  align = '\000' <repeats 191 times>
}
pwndbg> p *(Inode*)(mmap_file_ptr+4096*(0x19)+0x100)
$12 = {
  size = 0x80,
  type = DIRECTORY,
  data_ptr = {[0x0] = 0x18, [0x1] = 0x0 <repeats 13 times>},
  align = '\000' <repeats 191 times>
}
pwndbg> p *(MFS_DirEnt_t(*)[6])(mmap_file_ptr+4096*0x18+0x0)
$14 = {[0x0] = {
    name = ".", '\000' <repeats 26 times>,
    inum = 0x0
  }, [0x1] = {
    name = "..", '\000' <repeats 25 times>,
    inum = 0x0
  }, [0x2] = {
    name = "baz", '\000' <repeats 24 times>,
    inum = 0x1
  }, [0x3] = {
    name = "foo", '\000' <repeats 24 times>,
    inum = 0x2

```
### ld
- `soname` is [to](https://en.wikipedia.org/wiki/Soname)
  > provide version backwards-compatibility information
  so just `libx.so.1` is enough.
  > they would all have the same soname, e.g. libx.so.1. ... the soname field of the shared object tells the system that it can be used to fill the dependency for a binary which was originally compiled using version 1.2
### API
- > You then consult the inode map again to find the location of inode number k (A1), and finally read the desired data block at address A0.
  `int MFS_Read(int inum, char *buffer, int block)`
  so `inum` -(imap)> `block` -(read)> `buffer`.
- > assume there are a maximum of 4096 inodes
  > your on-disk image just consists of an ever-growing log
  so the img size is always increasing while having one inode num restriction.
- As the LFS chapter says
  > and concerns over cleaning costs [SS+95] perhaps *limited LFS’s initial impact* on the field. However, some modern commercial file systems, including NetApp’s WAFL [HLM94], Sun’s ZFS [B07], and Linux btrfs [R+13], and even modern flash-based SSDs [AD14], adopt a *similar copy-on-write* approach to writing to disk, and thus the intellectual legacy of LFS lives on in these modern file systems
  > NetApp’s WAFL does this with old file contents; by making *old versions available*, WAFL no longer has to worry about cleaning quite so often
  so not implement cleaning as README says.
### make
- [`.PHONY: all` similar to `SUBDIRS`](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html) will always run `all`
  but not recursively for `${PROGS}` which depends on `% : %.o ...`.
### LFS with NFS
- "small-write problem"
  LFS
  > When writing to disk, LFS first buffers all updates (including metadata!) in an inmemory segment; when the segment is *full*, it is written to disk in one long, sequential transfer *to an unused part* of the disk
  > Instead of overwriting files in places, LFS always writes to an unused portion of the disk, and then later reclaims that old space through cleaning. This approach, which in database ystems is called shadow paging [L77] and in file-system-speak is sometimes called *copy-on-write*
  NFS (README)
  > Specifically, *on any change* to the file system state (such as a MFS_Write, MFS_Creat, or MFS_Unlink), *all the dirtied* buffers in the server are committed to the disk.
  - So here we still has "small-write problem" because of using the NFS convention.
  - So in LFS, probably the block with inodes and imaps is stored in the *mem* and stored to the *disk* with many data blocks by reordering them to make all data blocks before the inode, imap similar to chpter 4/16.
    while in NFS, it is not. The inode and imap always use *one new block* with each write, etc, as chapter page 9 and 7 shows. So internal fragmentation.
    Then here we just always write the block with the inode and the imap which is **not full** to the disk.
#### LFS
- > Existing file systems perform poorly on many common workloads
  so non-adjacent block is invalid for lfs.
  This can be also seen from chapter 8/16.
- lfs only ensures "sequential **writes**" not "sequential reads" which can be partly implemented by cleaning and then moving blocks. 
- > System memories are growing
  so use `mmap`.
- > For example, if you are adding a new block to a file, you would write the data block, new version of the inode, and a new piece of the inode map to the end of the log
  Based on chapter 9/16, overwrite will just write the *whole data block* so just take it although maybe not efficient.
  > note that the inode looks as big as the data block, which generally isn’t the case; in most systems, data blocks are 4 KB in size, whereas an inode is much smaller, around 128 bytes
  so Inode and Imap may be in one block **instead of two**. -> Needs `Block_Offset_Addr` to access the address although `README` says "Each entry is a simple 4-byte integer".
  So *no need to copy the whole block* which the inode/imap resides in.
  ```c
  typedef struct __Block_Offset_Addr{
  uint block;
  uint offset;
  } Block_Offset_Addr;
  ```
  so maybe not "sequential reads" because inodes and imaps are scattered.
  - cleaning
    `CR` always updated.
    `Imap` indexed by `CR`, so old ones can be easy to find. similar to
    > LFS increases its version number and records the new version number in the imap
    `Inode` indexed by `Imap`, ...
    `Data` indexed by `Inode`, ...
    - chapter 11/16 
      similar to `SS` and TLB, maybe the cache can store the direct map of `(block,(offset))->whether_valid` (offset is not for data blocks) to accelerate the cleaning.
## filesystems-distributed-ufs
- ~~this should be simpler than above lfs because super block (i.e. above checkpoint), bitmaps, inode tables are all in **fixed location** so less updates.~~
- this is also used by xv6.
### comparison with filesystems-distributed `idi ./README.md ../filesystems-distributed-ufs/README.md | less_n`
```bash
$ declare -f idi    
idi () {
        . ~/.virtualenv/misc/bin/activate
        icdiff $1 $2
}
```
I did `lfs` first because I think of UNIX file system should be more difficult ... but this ufs may be not totally same as the current UNIX one.
- add `nbytes` with `MFS_Write/Read`, just use `size` in the inode to track it.
- > An inode bitmap (can be one or more 4KB blocks, depending on the number of inodes)
  - since no sequential write restriction, so no need frequent copy like `lfs`.
  - when one new block needs to be allocated, just like `lfs`, append to the end.
- > As for directories ...
  same as `lfs`.
- Since they are just using difference data structures, the basic ideas are same for them, so I didn't do this project.
#### `mkfs.c`
It just use the structure in chapter 5/18.
- In `mkfs.c`, `itable.inodes[0].direct[i] = -1;` and `parent.entries[i].inum = -1;` init to `-1` while my lfs implementation doesn't ~~to decrease the creation overheads (both needs `memset` so still has overheads)~~ with the related check functions to solve with the special `root` which looks as invalid entry because `inum`,`pinum` both are `0`. 
- `(void) fsync(fd)`
  See [this](https://stackoverflow.com/a/13954680/21294350) although they are not totally same.
# TODO after reading the algorithm book
[W+95]
- > balanced bi-nary trees, splay trees, or partially-ordered trees

- > a hash table is often built over the base structure to speed up lookups.

  >  page tables are *just data structures*. You can do lots of crazy things with data structures, making them smaller or bigger, making them slower or faster.

  > What *new struc-tures* can you come up with? What problems do they solve?

- concurrent B-tree
- [This](#algorithm_1)
- > lookup, delete, and so forth

  with Linked Lists.
- > hash table that does not resize; a little more work is required to *handle resizing*

- > (such as B-trees); for this knowledge, a database class is your best bet.

- "concurrency-sort"
## Operating System Concepts
- Depth-First Search Tree
## related with data structures
- use non-HashTable struct but similar to HashTable in "concurrency-mapreduce".
## C9
- Red-Black Trees to search
  - In short, it is based on the [binary cut](https://www.geeksforgeeks.org/introduction-to-red-black-tree/). See "Algorithm:".
- reread this chapter green highlights.
## Modern Operating Systems
- why Hash table need [more](https://stackoverflow.com/a/61874924/21294350) space than Doubly linked lists
# TODO after reading the compiler book
- C6 1.c `preempt`, etc.
- TODO reread [this](https://stackoverflow.com/a/16245669/21294350) after learning the compiler.
- [this](#memcached_mul_o)
- inline relations with stack and `call`, See this filesystems-distributed which uses this frequently.
## Modern Operating Systems
- [Printed listing](https://www.ibm.com/docs/en/wsfz-and-o/1.1?topic=translator-printed-listing)
- how Engler et al. (2000) designed the compiler derivatives?
## xv6
- from [this](https://cs.stackexchange.com/questions/160004/why-do-we-use-main-function-in-almost-all-the-programming-languages#comment334807_160008), `_start` needs to be with `-e` to form `-e _start`.
  So `$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o _forktest forktest.o ulib.o usys.o umalloc.o` can't make `_forktest` executable maybe due to the above reasons. So it is followed by `$(OBJDUMP) -S _forktest > forktest.asm`.

# TODO after reading the network book
- C33 homework TODO.
- [MR96] 6.6 and later in 6 better with codes.
- chapter 48
- [this](#async_UDP)
- 57.5 SSL/TLS
# TODO after reading the cryptography book
- [F04](https://pages.cs.wisc.edu/~remzi/OSTEP/Citations/checksums-03.pdf)
- [M13]
- chapter 45 code 4,5
# TODO
- read the Multi-CPU Scheduling after "Concurrency".
- use `valgrind` with chapter 14,22 homework.
  - read [SN05]
- ext4 vs reiserfs
## projects
- `initial-memcached`,`initial-kv`
## related with security
- > lets the attacker inject arbitrary data into the target’s address space.
# OSTEP 1.01 chpaters in the [ostep_book]
Just all use the pdf from the [web](https://pages.cs.wisc.edu/~remzi/OSTEP/#book-chapters), it seems that 1.01 is not issued all at one time but with many discrete times.
- chapter 6,19,23,26,28,40,
# manage dynamic allocation
- whether free is only known [for the OS](https://stackoverflow.com/a/13218840/21294350).
- TODO [trace](https://stackoverflow.com/a/61084515/21294350) memory address
## valgrind
- `"conditional jump or move depends on uninitialized value(s)"` means something [aren't inited](https://stackoverflow.com/a/2612524/21294350).
  try
```bash
$ alias valgrind_l 
valgrind_l=$'valgrind --leak-check=full --show-leak-kinds=all -s --track-origins=yes --trace-children=yes --track-fds=yes\t--run-libc-freeres=no --run-cxx-freeres=no --show-reachable=yes'
```
- [`4 bytes inside a block of size 8 free'd`](https://stackoverflow.com/a/18886984/21294350)
  > accessing memory that has *just been freed*.

- heap can be in the [`anon` region](https://stackoverflow.com/a/49215754/21294350).
  > Any memory can become heap. Diagrams showing a heap area are *pedagogical, rather than real*.

for example the following [anon_7ffff0000] can be also used for heap if requesting too much space for dynamic allocation.
```bash
    0x555555559000     0x55555587b000 rw-p   322000      0 [heap]
    0x7ffff0000000     0x7ffff0021000 rw-p    21000      0 [anon_7ffff0000]
    0x7ffff0021000     0x7ffff4000000 ---p  3fdf000      0 [anon_7ffff0021]
...
```
# miscs
- [LinuxForums.org](https://en.wikipedia.org/wiki/LinuxForums.org) has been shutdown which is [shown here](https://stackoverflow.com/questions/851958/where-do-malloc-and-free-store-allocated-sizes-and-addresses#comment660519_851958).
## QA community
- try [codidact](https://unix.stackexchange.com/users/388654/quas%c3%admodo)
## C/C++
- `static` is [different](https://stackoverflow.com/a/65965050/21294350) from implicit global wrt *link*.
  > only be visible in its translation unit i.e. in file1.c

  > because then b will be a *global variable which has external* linkage.

  - But both
    > The lifetime of a static variable is the *entire run of the program*. You can access the static variable outside of it's scope/translation unit if you have the *address* of that static variable.

    So it is fine to use `static` with reference (i.e. address of the variable) across source code files (i.e. translation unit)
- `asm volatile` ensures [unnecessary writes](https://stackoverflow.com/a/38741832/21294350) always to occur which is just [what gcc says](https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile-1).
  Also
  > *aren't reordered* against each other.

  - [this](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72795#c1)
    global `int` maybe has external "observers", so not discard
    while with `static`, the compiler can know whether it is used in this file and decide whether to discard.
  - use [intel style](https://stackoverflow.com/a/200028/21294350)
- `typeof` is manipulated by the [compiler](https://gcc.gnu.org/onlinedocs/gcc/Typeof.html), so it can only get the parameter declared type but not its original
  e.g. in `pthread_create`, in `start_routine` the `arg` passed in by `(void *)arg` can be only identified as `void *` but not something like how the `arg` declared in the `main`.
- not use *too many* `ifdef` which is hard to track correspondance.
  See `~/ostep-hw/48/UDP-lib_async.h`
### check SEGV
- [this](https://stackoverflow.com/a/15340456/21294350)
  - why `sigsetjmp` is [better](https://stackoverflow.com/a/20755336/21294350)
    > being added to the *signal mask* of the process. This *prevents* subsequent occurrences of that signal from *interrupting* the signal handler.

    > Under FreeBSD 5.2.1 and Mac OS X 10.3, setjmp and longjmp save and *restore* the signal mask.

    > To allow *either* form of behavior, POSIX.1 does not specify the effect of setjmp and longjmp on signal masks.

    so it is to allow the sigmask to be maintained by the user.
  - above example is similar to APUE "Figure 10.8" and csapp corresponding ones.
    where "the "fake" return" checks whether "SIGSEGV" occurs and manipulate correspondingly.
    so when `illegal` the `if else` are both executed.
    > on the "fake" return that occurs after longjmp() or siglongjmp(), the nonzero value specified in val is returne

## awk
- use single-quotes instead of double by `man`.
  > The awk program specified in the command line is most easily specified within single-quotes

  - escape single-quotes [needs](https://stackoverflow.com/questions/9899001/how-to-escape-a-single-quote-inside-awk#comment12630340_9899594)
    > The ' character *closes* the opening ' shell string literal.

- use [pipe command](https://stackoverflow.com/a/15337502/21294350)
- access [row number](https://unix.stackexchange.com/a/89641/568529)
## vim
- [replace](https://stackoverflow.com/questions/19195503/vim-replace-n-with-n1) `n` with `n+1`
## makefile
- See this [template](https://github.com/czg-sci-42ver/CSAPP-3e-Solutions/blob/master/site/content/Makefile) for how to clean recursively.
- [`-rm`](https://www.gnu.org/software/make/manual/html_node/Cleanup.html) to avoid errors which is done in [here](https://github.com/czg-sci-42ver/CSAPP-3e-Solutions/blob/1488b2ece5fbe65d8439095240f2b6e699d7e105/site/content/chapter12/code/12.36/makefile#L19) by other methods.
## linux
- What is the [first](https://unix.stackexchange.com/a/352315/568529) digit in umask value
  - See [this](https://www.scaler.com/topics/special-permissions-in-linux/)
    - `SUID` allows user temporary privilege
      > temporarily assume the privileges of the file's *owner*

    - `SGID` just 
      > temporarily assume the *group* ownership of the file

      > inherit the group ownership of the parent directory

    - Sticky Bit: *sticks* to the file permissions by ignoring the dir permissions
      just opposite of `SGID` which file *inherits* the permission of the dir while here file ignores.
      > even if they have write permissions on the directory.

      ```bash
          # https://superuser.com/a/1370481/1658455 notice the t in "rwt"
      $ ls -al /tmp
      ls: /tmp/.mount_RamboxegeuXu: Transport endpoint is not connected
      total 540
      drwxrwxrwt 20 root     root        720 Sep 10 10:32 .
      ```
- source codes See github or [lxr](http://lxr.linux.no/#linux+v2.6.31/include/linux/types.h#L34) by [this](https://stackoverflow.com/a/1608377/21294350)
## git
- the following [squash](https://stackoverflow.com/a/51516360/21294350) `1,2` to the implicit `0` instead of `3`.
```c
1 s 01mn9h78 The lastest commit
2 s a2b6pcfr A commit before the latest
3 pick 093479uf An old commit i made a while back
```
- show [patch](https://stackoverflow.com/a/11284366/21294350)
### github
- [regex search](https://stackoverflow.com/questions/17595962/github-search-using-regex#comment135841165_72518518)
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
- From [this](https://dictionary.cambridge.org/us/grammar/british-grammar/other-others-the-other-or-another), "another" can replace "The other".
  > Another means *‘one more’* or ‘an additional or extra’, or ‘an alternative or different’.

- > guarantee that any threads that should be woken are

  means ... (woken) by google translate.

## foo bar
- [this](https://softwareengineering.stackexchange.com/a/69815)

# books recommended by OSTEP
- [APUE](http://www.apuebook.com/toc3e.html) which is also used by ostep-hw (See [`grep -r -i "apue" --include \*.c`](https://stackoverflow.com/a/12517022/21294350))

# other OS books
## [Operating System Concepts](https://www.os-book.com/OS10/)
This is about many different operating systems and care more about the concepts but let the implementation inside the projects and problems.
I used the summary and the study-guide to ensure understanding the main ideas at least.

14.7.1,2 have been said in OSTEP which says more detailedly, so I skipped them in this book.
### Preface
- synchronous/asynchronous [vs](https://www.programmr.com/blogs/difference-between-asynchronous-and-non-blocking) blocking/nonblocking
  >  But they are also different because asynchronous calls usually involve a *callback* or an event, to signal that the response is available, while in the case of non-blocking the call returns with whatever is available and the caller might have to *try again* to get the rest of the data
  [i.e.](https://stackoverflow.com/a/2625565/21294350)
  > having started a "background" effort to fulfil your request
  - See p168/1278 where they are same.
  - Also see p634/1278 where another different aspect
    > a nonblocking read() returns immediately with whatever data are available—the full number of bytes requested, fewer, or none at all. An asynchronous read() call requests a transfer that will be performed in its entirety but will complete at some *future* time.
    i.e. nonblocking ~~is not totally non-block which~~ may have received some data when it is called and *reflects* when return.
    While asynchronous doesn't reflect.
- FreeBSD, Mach, and Windows 7 case studies
  the two former [see](https://os-book.com/OSE2/appendices-dir/index.html)
  TODO win 7
### Introduction
- Figure 1.5 See [intel_64] p3192/5062.
- > Typically, these applications are designed so that once each computing node in the *cluster* has solved *its portion* of the problem, the results from all the nodes are *combined* into a final solution
  this is just what CUDA does.
- See [asm_md] "multitasking" -> "before they finish" so
  > the CPU executes multiple processes by switching among them, but the switches occur *frequently*, providing the user with a fast response time
- Spooling just means [buffering](https://www.geeksforgeeks.org/what-exactly-spooling-is-all-about/).
  > stored in a queue at the speed of the computer
  but not using memory. p639/1278
  - Spooling [diff](https://www.geeksforgeeks.org/difference-between-spooling-and-buffering/#) buffering -> The key difference
    > A spool is similar to buffer as it holds the jobs for a device *until* the device is ready to accept the job.
- > Every machine-level instruction that runs natively on the source system must be *translated* to the *equivalent function* on the target system, frequently resulting in several target instructions.
  i.e. [Binary translation](https://en.wikipedia.org/wiki/Binary_translation) in OSTEP.
- [portals](https://en.wikipedia.org/wiki/Portals_network_programming_application_programming_interface)
- [Copyleft](https://www.gnu.org/gwm/libredocxml/x53.html#:~:text=A%20copyright%20infers%20that%20only,community%2C%20provided%20it%20remains%20Libre.) means
  > A Copyleft, on the other hand, provides a method for software or documentation to be *modified*, and distributed back to the community, provided it *remains Libre*.
  > The copyleft ensures that not only is the original source free, *but that all modifications* must be made free, and permission is granted for all who follow in modifying that same program or document, provided they *abide by these terms*.
- > are *multiprocessor* systems in which each CPU contains several computing cores
  based on p46, it should be "Multicore"
### Operating-System Structures
- shell naming [origin](https://www.quora.com/What-is-the-origin-of-the-name-shell-as-in-shell-computing-shell-programming-shell-accounts-C-shell-or-Bourne-Again-shell)
- get process attributes like [PID](https://www.ibm.com/docs/en/psw/2.2.6?topic=linux-process-attributes)
- better use [standardized `O_NONBLOCK`](https://stackoverflow.com/a/1151077/21294350) instead of `FIONBIO`.
- [Character](https://askubuntu.com/a/1021400/1682447) Devices
### Processes
From here, I only read the context of bold/colored texts, etc.
- > Linux systems initially adopted the System V init approach, but recent distributions have replaced it with systemd.
  for archlinux installed by me, it is not this case.
  TODO
```bash
$ ps -el | head
F S   UID     PID    PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
4 S     0       1       0  0  80   0 -  5590 -      ?        00:00:04 systemd
$ cat /proc/1/cmdline 
/sbin/init
$ htop # shows /sbin/init with pid 1                                            
```
- [pipe](https://stackoverflow.com/questions/53313194/how-to-make-parent-and-child-bidirectional-pipe-in-c) is unidirectional.
- Byte-stream-oriented protocol [vs](https://www.researchgate.net/post/What_is_the_difference_between_message-oriented_protocols_and_stream-oriented_protocols#:~:text=The%20TCP%20is%20a%20byte,a%20sequence%20of%20data%20bytes.&text=The%20UDP%20is%20a%20message,a%20stream%20of%20UDP%20datagrams.) Message-stream-oriented protocol
  Also [see](https://stackoverflow.com/a/3017697/21294350)
- Rendezvous implies [wait](https://en.wikipedia.org/wiki/Rendezvous_(Plan_9))
### threads
- Thread-Local Storage [example](https://www.geeksforgeeks.org/thread_local-storage-in-cpp-11/#).
  - i.e. [private storage area](https://stackoverflow.com/a/35701531/21294350)
- as the book says, see `man pthreads` for what to share.
- [Asynchronous cancellation](https://man7.org/linux/man-pages/man3/pthread_cancel.3.html#:~:text=Asynchronous%20cancelability%20means%20that%20the,system%20does%20not%20guarantee%20this).) is not same as the book says "One thread immediately terminates the target thread".
  > Asynchronous cancelability means that the thread can be canceled at any time (usually immediately, but the system does not guarantee this)
- "scheduler activation" uses the LWP as the medium.
### scheduling
- > If a process uses too much CPU time, it will be moved to a lower-priority queue. 
  to give other processes opportunities to run.
  > This scheme leaves I/O-bound and interactive processes—which are typically characterized by short CPU bursts—in the higher-priority queues. In addition, a process that waits too long in a lower-priority queue may be moved to a higher-priority queue.
  interactive will be interrupted more often -> short CPU bursts.
- Linux default [only](https://unix.stackexchange.com/a/287583/568529) [one-to-one](https://man7.org/linux/man-pages/man3/pthread_attr_setscope.3.html#:~:text=The%20PTHREAD_SCOPE_SYSTEM%20contention%20scope%20typically,both%201%3A1%20threading%20implementations.) model, i.e. `PTHREAD_SCOPE_SYSTEM`.
- Notice here Symmetric multiprocessing is not *targeted* with ["a single, shared main memory"](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) which is said in [asm_md].
  > The standard approach for supporting multiprocessors is symmetric mul-tiprocessing (SMP), where each processor is *self-scheduling*
  It is based on [this](https://www.geeksforgeeks.org/difference-between-asymmetric-and-symmetric-multiprocessing/#) which is not related with NUMA.
  - Symmetric and [Asymmetric p11](https://elinux.org/images/1/13/ELCE2007-Asymmetric_NUMA.pdf) NUMA
    although [this](https://qr.ae/pKhdlh) says a bit different description
- [niceness](https://en.wikipedia.org/wiki/Nice_(Unix)#Etymology)
  - `man sched` shows `SCHED_FIFO` is based on niceness.
- See 313/1278 for "nonpreemptive SJF scheduling" example.
- "Little’s formula"
  here 2 seconds per process means the 14 processes will be manipulated in 2 seconds, then the next 14 will be in to fill the queue.
- Rate-monotonic real-time scheduling based on rate -> static.
  > (tasks with *shorter periods*/deadlines are given higher priorities)
- > This illus-trates the inverse relationship between priorities and time quantam
  because lower priority (implying CPU-intensive) means less counts, so for equality, time each is longer.
- [Long/Medium/Short-term](https://en.wikipedia.org/wiki/Scheduling_(computing)#Process_scheduler) scheduling
  do their specific functions.
### Synchronization
- Test-and-set is indeed [set and test](https://en.wikipedia.org/wiki/Test-and-set)
  > The caller can then "test" the result to see if the state was changed by the call
  - hardware
    1. [internal note](https://en.wikipedia.org/wiki/Test-and-set#Hardware_implementation_of_test-and-set)
      > storing the *address* of the memory location in a *special place*
      > If the *test succeeds*, the DPRAM sets the memory location to the value given by CPU 1.
    2. flag value
      > but instead simultaneously *moves* the current value to a special register, while setting the contents of *memory location A* to a special "*flag* value".
  - x86 use [`XCHG`](https://c9x.me/x86/html/file_module_x86_id_328.html) to implement [tsl](https://stackoverflow.com/questions/22424209/tsl-instruction-reference)
  - avoid contention (i.e. Exclusive overheads) by [the prior normal test](https://en.wikipedia.org/wiki/Test_and_test-and-set)
- Figure 6.9
  If `i` is specific to each thread, all but one threads will be stuck at `compare_and_swap`.
  Then `!waiting[j]` will only be true if all other threads are all *only inited*.
  Then `j == i` will be true -> `lock = 0;`.

  Otherwise, ` !waiting[j]` will be probably wrong, so `j = (i + 1) % n;` will select the *consecutive* one to run by `waiting[j] = false`.
- p345/1278 where `temp != compare and swap(v, temp, temp+1)` ensures atomic.
- > the general rule is to use a spinlock if the lock will be held for a duration of less than *two context switches*
  otherwise like OSTEP says, sleep and wake may be better (i.e. the *two context switches*).
- p348/1278 is similar to OSTEP Figure 31.17 where the latter adds the sleep and wakeup.
  `struct process *list` is probably inherent in `Cond_wait`.
- timing errors mean dependent on the execution time of threads.
- monitors are only simply referenced in the OSTEP Figure 29.1 context.
- > the logical condition for which Q was waiting may no longer hold.
  this is probably one compound condition.
- `x.wait` is one specific function, so it has `if (next count > 0) ...`.
- p357/1278 
  >  we must be sure that an uncooperative process does *not simply ignore the mutual-exclusion gateway* provided by the monitor and try to access the shared resource directly,
  so the monitor doesn't built in the mutex in the function, specific to the Figure 6.14 implementation.
- CAS doesn't need to context switch.
- > A solution to the critical-section problem must satisfy the following three requirements: (1) mutual exclusion, (2) progress, and (3) bounded waiting
  1. inherent requirement
  2. to avoid the deadlock/livelock, etc.
  3. to avoid starvation.
- honest programming error may be due to not using [Honest functions](https://functionalprogrammingcsharp.com/honest-functions) from [this](https://stackoverflow.com/q/61015267/21294350)
- for Peterson's Solution, `turn = i;` may be better to indicate the current turn hold by the thread self.
- figure 6.4
  - here turn order can be changed so that process 1 will be stuck and only process 0 runs.
  - this reorder makes turn order is still undetermined as original.
    but also each single flag *can't be ensured all true*, so here
    > it is possible that both threads may be active in their critical sections *at the same time*
### Synchronization examples
- p391/1278 where the numbered lists are same as OSTEP and [wikipedia](https://en.wikipedia.org/wiki/Monitor_(synchronization)#Monitor_usage) monitor description. 
- "Checked vs Unchecked Exceptions" depends on *whether* are checked at compile time.
- TODO probably the Functional Programming manipulates with the race condition [inherently](https://hackernoon.com/functional-programming-an-effective-approach-for-experienced-programmers), but maybe [not totally](https://www.reddit.com/r/functionalprogramming/comments/7z6lz2/comment/dulqjrq/?utm_source=share&utm_medium=web2x&context=3).
  [JS](https://stackoverflow.com/a/75778374/21294350)
  [general](https://softwareengineering.stackexchange.com/a/184457)
- > On single-processor machines, such as embedded systems with only a *single processing core*, spinlocks are *inappropriate* for use and are replaced by enabling and disabling kernel preemption.
  See [this](https://codex.cs.yale.edu/avi/os-book/OS9/practice-exer-dir/5-web.pdf)
  > If the process is not relinquishing the processor, other processes *do not get the opportunity* to set the program condition required for the first process to make *progress*
  because maybe in Linux implementation, user processes can't preempt with each other.
### Deadlocks
- 8.5.1 Mutual Exclusion
  See OSTEP for detailed infos.
- 8.5.2 Hold and Wait
  where OSTEP combines the 2 methods because it has *none* before `prevention` lock and acquires *all* including `L1` and `L2`.
- [Resource-Allocation-Graph Algorithm](https://gateoverflow.in/26520/deadlock#:~:text=Resource%2DAllocation%20Graph%20Algorithm%20%3A%20Works,or%20not%2C%20for%20Deadlock%20Avoidance.) only applies to when *one* instance of each resource
  > if several instances per resource type, possibility of deadlock
- Safety Algorithm
  where 
  1. "Find an index i such that both" implies `n`
  2. "Needi ≤Work" implies `m`
  3. "Go to step 2." implies `n`
- 8.6.3.1 Safety Algorithm is to check the current state
  8.6.3.2 Resource-Request Algorithm is to convert the current state to the next.
- differences between deadlock-detection algorithm in p437/1278 and Banker’s Algorithm.
- "8.5.3 No Preemption" -> livelock See OSTEP.
  > It cannot generally be applied to such resources as mutex locks and semaphores, precisely the type of resources where *deadlock occurs most commonly*
### Main Memory
- is dependent on the [program](https://stackoverflow.com/a/45959845/21294350) instead of OS.
  [example](https://developer.ibm.com/tutorials/l-dynamic-libraries/#dynamic-loading-example)
  - `-rdynamic` is to use [`.dynsym`](https://reverseengineering.stackexchange.com/a/21623/43760)
- "page of page table"
  here page is the minimal unit, where each unit is indeed one page table.
- clustered page tables for sparse address spaces See [p4](https://pages.cs.wisc.edu/~markhill/papers/sosp95_pagetables.pdf)
  the cluster may function as one *cache* for each sparse access which from p12 is from *different processes*.
  - Also see 550/1278
- > If none is found, the hardware walks through the in-memory TSB looking for the TTE that corresponds to the virtual address that caused the lookup
  because TSB is larger than TLB, so it should be searched after TLB.
- > If the process can be moved during its execution from one memory segment to another
  See p4,10,11,16
  mainly due to swap.
  > A process can be swapped into a different memory space.
- [Associative Memory](https://www.geeksforgeeks.org/associative-memory/#), i.e. content-addressable memories ([CAMs](https://www.sciencedirect.com/topics/computer-science/associative-memory#:~:text=An%20associative%20memory%20is%20one,memory%20is%20called%20the%20key.))
  > the associative memory compares the search query with the tags of *all* stored data
  > Associative memory is designed to quickly find matching data, even when the search query is *incomplete* or imprecise
  Also see [Study_Guide]
  > TLB is associative – searched in parallel
- [Segment table](https://www.geeksforgeeks.org/segmentation-in-operating-system/) – maps two-dimensional physical addresses
  one dimension is segment
  one is offset
  while logical memory just offset from 0.
- > Only part of program needs to be in memory for execution → logical address space > physical address space 
  so something can be swapped out, then logical can be larger because some in it are not swapped in.
- > If an instruction accesses multiple pages near each other → less “pain” because of locality of reference
  this means data is not in discrete pages *each*.
- Local replacement -> More consistent performance because they are not dependent on each.
### Virtual memory
10.5.3 to 10.9.2 highlights are lost due to the PDF reader crash.
- p502/1278 says why virtual is reasonable.
  > Users would be able to write programs for an extremely large virtual address space, simplifying the programming task
  > Because each program could *take less physical memory*, more programs could be run at the same time
- p506/1278 the internal table refers to the page table of the process.
- The [Difference](https://stackoverflow.com/a/4856460/21294350) Between fork(), vfork(), exec() and clone()
  - `_exit` is to avoid exit the parent, [See](https://stackoverflow.com/a/21781537/21294350)
  - with copy on write, `fork` is similar to Cvfork`.
    `man vfork`
    > Until that point, the child shares all memory with its parent, including the stack
- > a write to memory (to the time-of-use field in the page table) for each memory access
  here means a *extra* write.
- prove
  > Like optimal replacement, LRU replacement does not suffer from Belady’s anomaly
  See OSTEP related chapter p5
  because LRU larger size will *contain* the smaller size condition. So will always be better, i.e. p521/1278 "subset".
  while FIFO doesn't.
- Linux approximation of LRU by the inactive (victim list) and the active list
  They are dynamic.
  Freshly faulted pages and "accessed multiple times" -> from inactive to active.
- > neither MFU nor LFU replacement is common
  because they care too much about history which may not valid for now.
- 10.4.7 Page-Buffering Algorithms
  here "free-frame pool" is clean ones and victims are always swapped out each time to keep the better free-frame.
  > When a page fault occurs, a victim frame is chosen as before
  > Whenever the paging device is *idle*, a modified page is selected and is written to secondary storage
  - > It can be a useful augmentation to any pagereplacement algorithm, to reduce the penalty incurred if the wrong victim page is selected
    because they function before full which must select the victim.
- file-system services [space allocation](https://en.wikipedia.org/wiki/File_system) which is preparation for creating files, etc.
  > Some file systems permit or require specifying an initial space allocation and subsequent incremental allocations as the file grows
- [page sharing](https://kb.vmware.com/s/article/1021095)
  > Transparent page sharing is a method by which redundant *copies* of pages are eliminated
- > we must adjust each ai to be an integer that is greater than the minimum number of frames required by the instruction set, with a sum not exceeding m
  if each greater, then how to ensure "not exceeding"?
  - `10/137 × 62 ≈ 4` and `10/137*62=4.525547445255474` so not "greater".
- > As a result, CPU utilization drops even further, and the CPU scheduler tries to increase the degree of multiprogramming even more
  they have positive influences to each other from the dashed line to right in Figure 10.20.
  > As they queue up for the paging device, the ready queue empties
  they forms one circle.
- See [p4](https://events.static.linuxfound.org/sites/events/files/slides/slaballocators.pdf) for the history among SLUB, SLOB and SLAB.
- [ARMv8 contiguous bit](https://documentation-service.arm.com/static/5efa1d23dbdee951c1ccdec5?token=)
- > When demand paging is used, we sometimes need to allow some of the pages to be locked in memory
  because the memory range is being updated by I/O which *can't be modified* by others before I/O data is used.
- why LRU must [interrupt](https://www.cs.nott.ac.uk/~pszgxk/courses/g53ops/Memory%20Management/MM14-LRU.html) but FIFO not?
  maybe because it accesses something *not inside the page table*.
- locality diff WORKING SET
  See 535/1278 figure where the former is located at the peak 
  while the latter is dynamic when the time changes.
- p541/1278 is similar to align.
  > each cache is made up of one or more slabs that are divided into chunks the *size of the objects* being represented
- NUMA node see [asm_md] boost.
### Mass-Storage Structure
- [cfq](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/performance_tuning_guide/chap-red_hat_enterprise_linux-performance_tuning_guide-storage_and_file_systems) has 3 priority levels and only "more I/O" can change the priority temporarily.
  - deadline 
    > checks how long write operations have been starved of processor time
    to change the following preference.
    > Read batches take precedence over write batches by default
  - noop FIFO with *merge* because of CPU-bound so no need for scheduling.
- [volume](https://superuser.com/a/1340305/1658455) diff partition
  > When you are working with a volume on a Dynamic Disk, you can choose to *extend* or span that volume across *multiple drives*, you can stripe or mirror, or in server editions you can even use RAID 5.
- > Recoverable soft errors may trigger a device activity in which a copy of the block data is made and the block is spared or slipped.
  maybe due to avoiding the next error because this block is probably bad.
- "Increase the throughput" so "Reduce the response time".
- through the local I/O ports [diff](https://quizlet.com/45799230/02-12-differentiate-between-motherboard-componentspurposeproperties-flash-cards/?__cf_chl_rt_tk=1py4mJ7sSoLBLOwm_SChEBefCflFO.pMWomFa_Ehwww-1697528643-0-gaNycGzNDSU) directly connected to motherboards
  > motherboards commonly *include* USB connections that are connected directly to the motherboard
- LUN masking is just [one mask](https://en.wikipedia.org/wiki/Logical_Unit_Number_masking).
- [LOOK](https://www.geeksforgeeks.org/look-disk-scheduling-algorithm/#)
  > it reverses direction as soon as it reaches the *last* request in the current direction.
  Disadvantages (These are same as SCAN po)
  1. real-time
  2. queued up
  3. starvation
- flash [diff](https://www.ampersandtech.com/2022/12/13/the-quick-differences-between-flash-vs.ssd-storage.html) solid-state disks
  > physically larger than flash storage options
### I/O Systems
- [OSI](https://en.wikipedia.org/wiki/OSI_model#Layer_1:_Physical_layer) layer
  > converts the digital bits into electrical, radio, or optical signals
- [daisy chain](https://www.amazon.com/Snark-SA-2-Pedal-Daisy-Chain/dp/B0052745WK)
- [self-contained](https://stackoverflow.com/a/29395085/21294350) routine
  > the definitions for the data format and *available procedures* for a given type or class of object
  i.e. it defines all available inside it, while others are not permitted.
- modem is [sequential](https://ptolemy.berkeley.edu/eecs20/week2/modems.html)
- [asynchronous](https://electronics.stackexchange.com/a/563020/341985) keyboard
  > So if a device requires the attention of the host, it must wait until the host polls it
- [sharable](https://www.sharemouse.com/features/keyboard-sharing/#:~:text=One%20Keyboard%20for%20multiple%20Computers,pointing%20the%20mouse%20cursor%20at.) keyboard
  > over your existing network connection to the computer you are pointing the mouse cursor at.
- DIMM [diff](https://qr.ae/pKnZkO) NVME
  > To the CPU it does not call an OS function to write data. It just copies into memory.
- cache can hold the history data.
  spool is one directional, from application to device. -> Device Reservation
  buffer is based on different devices.
### File-System Interface
- "index" helps with the search.
- linux [doesn't avoid](https://unix.stackexchange.com/a/99166/568529) link cycle
- [LOFS](https://docs.oracle.com/cd/E18752_01/html/816-5177/lofs-7fs.html#REFMAN7lofs-7fs)
  > Once the virtual file system is created, other file systems can be mounted within it, *without affecting* the original file system
### File-System Implementation
- A linked list can also be used to [decrease](https://qr.ae/pKnm1j) the time required to delete a file
- "WAFL snapshots" are based on copy-on-write where "clones" is "root inode" in Figure 14.13.
- [Fast Directory Sizing](https://syntheway.com/Apple-File-System-APFS-macOS.htm#:~:text=Fast%20directory%20sizing%20works%20by,and%20have%20relatively%20little%20churn.)
  > Fast directory sizing works by *precomputing* the size of directory as content is added and removed. Therefore, it is most appropriate for directories that contain many files and have relatively *little churn*. For example, a user’s Documents folder is a good candidate for fast directory sizing, whereas the /tmp directory would not.
- FAT [relation](https://stackoverflow.com/a/22424829/21294350) with the "linked list". -> adjacent.
- if loop then one page will be accessed always so no Free-behind occurs.
### File-System Internals
- [NIS](https://en.wikipedia.org/wiki/Network_Information_Service#) tracks user related infos.
- diff between Mounts and Cascading mounts.
- XDR [relationship](http://retrogeeks.org/sgi_bookshelves/SGI_Developer/books/IRIX_NetPG/sgi_html/ch04.html) with RPC
### Security
- Trojan horse [diff](https://www.geeksforgeeks.org/difference-between-spyware-and-trojan-horse/#) spyware
- p775/1278 proof of encryption with `mod`.
- security through [obscurity](https://www.okta.com/identity-101/security-through-obscurity/)
  > Security through obscurity seeks to keep a system secure by keeping knowledge of it secret
- authorization [vs](https://www.sailpoint.com/identity-library/difference-between-authentication-and-authorization/#:~:text=So%2C%20what%20is%20the%20difference,a%20user%20has%20access%20to.) authentication in cyber security
- Windows [Subject](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4670)
- p760/1278 says about the "administrator" problem.
  > Windows is the target for most attacks – most common, everyone is administrator
### Protection
- audit [trail](https://csrc.nist.gov/csrc/media/publications/shared/documents/itl-bulletin/itlbul1997-03.txt#:~:text=An%20audit%20trail%20is%20a,%2C%20operational%2C%20and%20technical%20controls.)
- set user or group [ID](https://unix.stackexchange.com/a/58169/568529) on execution by `chmod +s`
  > acquires *all* the file read/write/execute privileges of the *owner*
- 
  1. Reacquisition uses the idle time.
    plus Indirection and keys, they are all applied to all capabilities.
- Notice p777/1278 MAC diffs from p820/1278.
- `CAP_NET_RAW` [usage](https://unix.stackexchange.com/a/447900/568529)
- [`CAP_SETPCAP`](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/linux-capabilities#cap_setpcap)
- futex ... A race condition in its implementation means [this](https://www.collabora.com/news-and-blog/blog/2022/02/08/landing-a-new-syscall-part-what-is-futex/). so
  > the system call itself could not be filtered out entirely.
- [callout](http://www.qnx.com/developers/docs/qnxcar2/index.jsp?topic=%2Fcom.qnx.doc.neutrino.building%2Ftopic%2Fstartup_WRITCALLOUT.html) means *call outside* the kernel.
- See p777/1278 where hash and then encrypt for Code signing.
- need-to-know -> [necessary](https://www.isms.online/glossary/need-to-know-principle/#:~:text=The%20need%20to%20know%20principle,necessary%20to%20undertake%20their%20duties.).
- [keyring](https://askubuntu.com/a/32165/1682447)
- [Bell-LaPadula](https://www.geeksforgeeks.org/introduction-to-classic-security-models/#) model where Layer of Secrecy is significant.
- [library operating system](https://en.wikipedia.org/wiki/Operating_system#Library)
- [separation hypervisor](https://www.lynx.com/embedded-systems-learning-center/what-is-a-separation-kernel) where fixed.
### Virtual Machines
- [VMCS and VT-x](https://en.wikipedia.org/wiki/X86_virtualization#Intel_virtualization_(VT-x))
### Networks and Distributed Systems
- [CFS](https://en.wikipedia.org/wiki/Clustered_file_system)
### The Linux System
many of these are just duplicate of before ...
- [virtual file system](https://en.wikipedia.org/wiki/Virtual_file_system)
  > access different types of concrete file systems in a uniform way
- [PLIP](https://en.wikipedia.org/wiki/Parallel_Line_Internet_Protocol)
- fork [doesn't share](https://unix.stackexchange.com/a/420902/568529) file-system info
- extent is like indirect data pointer p703/1278 but specific to [contiguous](https://www.kernel.org/doc/html/latest/filesystems/ext4/dynamic.html#extent-tree).
  > with extents, the mapping is reduced to a single struct ext4_extent with ee_len = 1000
  [application](https://adil.medium.com/ext4-filesystem-extent-flex-bg-sparse-super-83f172d694c6)
  ![](https://miro.medium.com/v2/resize:fit:720/format:webp/0*mz7fOBTdDNepwmDl.png)
  - [MFT](http://ntfs.com/ntfs-mft.htm)
    - [entry](http://www.c-jump.com/bcc/t256t/Week04NtfsReview/W01_0220_mft_entry_format.htm)
- object handle as the [table-index](https://stackoverflow.com/a/70640752/21294350) windows
- ["external namespace"](https://learn.microsoft.com/en-us/windows/win32/fileio/naming-a-file#win32-device-namespaces) file names Windows
- >  load  a  program  at  *some  memory  address*  and  relocate  it  to  run  there
  i.e. physical and then virtual.
- event [implies](https://softwareengineering.stackexchange.com/a/437696) both synchronous and asynchronous.
### Windows
- [CFG](https://learn.microsoft.com/en-us/windows/win32/secbp/control-flow-guard#how-does-cfg-really-work) See the first object in the figure.
- security reference monitor -> [ACL](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/windows-kernel-mode-security-reference-monitor)
- [ALPC](https://www.oreilly.com/library/view/windows-internals-fifth/9780735625303/ch03s06.html)
- [csrss](https://en.wikipedia.org/wiki/Client/Server_Runtime_Subsystem)
  here more windows abbr terms are skipped.
- Paging file quota exceeded similar to [process quota](https://groups.google.com/g/comp.os.vms/c/2rfSB7S16Fw).
- handle addr may [change](https://en.wikipedia.org/wiki/Handle_(computing)#Comparison_to_pointers) while pointer doesn't.
  > allows the referent to be relocated in memory by the system without invalidating the handle
- how Physical Address Extension [more](https://en.wikipedia.org/wiki/Physical_Address_Extension#Hardware_support) than 4 GB
  > required in the operating system, in the chipset, and on the motherboard
  more [detailed](https://stackoverflow.com/questions/8373944/how-does-pae-physical-address-extension-enable-an-address-space-larger-than-4g#comment10335163_8373944)
  > swap in and out *different* parts of memory into the visible address space to make use of more than 4GB of RAM, but it can only see 4GB at any *single point* in time.
- The [nonpaged pool](https://learn.microsoft.com/en-us/windows/win32/memory/memory-pools), i.e. pinned.
  > guaranteed to reside in physical memory
- [Page file](https://en.wikipedia.org/wiki/Page_table#Translation_failures) just one [back store](https://learn.microsoft.com/en-us/troubleshoot/windows-client/performance/introduction-to-the-page-file).
- [VAD](https://cis.temple.edu/~giorgio/old/cis307s97/readings/virtual.html)
  - related with [Reserved memory](https://www.baeldung.com/native-memory-tracking-in-jvm#:~:text=Reserved%20memory%20represents%20the%20total,app%20is%20using%20right%20now.)
- > it does so because of a page fault, which causes the MM to send a noncached read request to the I/O manager.
  because this is the 1st request which has not been in the *view*, so "noncached".
- [core parking](https://gigperformer.com/docs/ultimate-guide-to-optimize-windows-for-stage/coreparking.html)
- [Throttling](https://www.intel.com/content/www/us/en/support/articles/000088048/processors.html)
- [two-phase](https://hongilkwon.medium.com/when-to-use-two-phase-commit-in-distributed-transaction-f1296b8c23fd#:~:text=Two%2Dphase%20commit%20(a.k.a%202PC,transaction%20manager)%20to%20initiate%202PC.) commit transactional algorithm
- Session 0 [Isolation](https://techcommunity.microsoft.com/t5/ask-the-performance-team/application-compatibility-session-0-isolation/ba-p/372361)
  > only system processes and services run in Session 0
- csrss where `csrss` is server and "win32 application" is client.
  > It's probably makes the most sense for csrss.exe to handle it because it's well positioned to deliver  messages to any win32 application, since all win32 applications run "under" it.
- [VPN](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-vpn#:~:text=A%20VPN%2C%20which%20stands%20for%20virtual%20private%20network%2C%20protects%20its,could%20benefit%20from%20a%20VPN.)
- [DCOM](https://en.wikipedia.org/wiki/Distributed_Component_Object_Model) naming.
- Administrators [diff](https://superuser.com/a/241098/1658455) power users
- Slim Reader/Writer (SRW) Locks -> [a single process](https://learn.microsoft.com/en-us/windows/win32/sync/slim-reader-writer--srw--locks).
- [`BindIoCompletionCallback`](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-bindiocompletioncallback)
  > On *completion* of an I/O request involving this file, a non-I/O worker thread will *execute the specified callback* function.
- commit implies [mapping](https://stackoverflow.com/a/55779517/21294350)
  [`SEC_COMMIT`](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-createfilemappinga)
  > The system must have enough committable pages to hold the entire mapping.
- scatter-gather implies the [mapping](https://en.wikipedia.org/wiki/Gather/scatter_(vector_addressing)#Definitions).
### appendix
#### A
- Dedicated Computer Systems [diff](https://cs.stackexchange.com/a/51622/161388) Shared Computer Systems
  the former
  > used for *one task only*
  which is indicated by
  > *Unloading* the compiler tape
  - the latter uses batch.
- [Process Coordination](http://web.cs.wpi.edu/~cs3013/b02/week2-procco/week2-procco.html)
#### B
skipped because chapter 21
#### C
- [UNIX is a pun on MULTICS](https://www.reddit.com/r/todayilearned/comments/4dbd4e/comment/d1pd6zv/?utm_source=share&utm_medium=web2x&context=3)
- linux creation of [sparse](https://linux.m2osw.com/how-avoid-creating-sparse-file-cc) files by C function with internal holes
- fcntl.h to [append](https://stackoverflow.com/q/12741019/21294350).
  > make each succeeding write() to an open file append to the end
- [job-control](https://www.gnu.org/software/libc/manual/html_node/Concepts-of-Job-Control.html) signal
  > The *processes* belonging to a single command are called a process group or job.
  > A shell that supports job control must arrange to control *which* job can use the terminal at any time.
- linux "quit" [dumps](https://man7.org/linux/man-pages/man5/core.5.html)
- Figure C.6 shows the differences between "user structure" and "process structure".
- [short-term scheduling](https://en.wikipedia.org/wiki/Scheduling_(computing)#:~:text=called%20demand%20paging.-,Short%2Dterm%20scheduling,or%20another%20form%20of%20signal.) -> CPU
- "Section 10.4.5" doesn't have "swept linearly", while 4.2BSD has where `invalid` gives the second-chance.
- "C.7.4" is to store something specific to one process like
  > each such process needs its own offset for the file, keeping the offset in the inode is inappropriate. Thus, the file structure is used to contain the *offset*.
- ["Reliably" delivered message sockets](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.sockettype?view=net-7.0) combines `Dgram` and `Stream` by "connectionless" and "notified if messages are lost".
- [Socket Protocol](https://www.ibm.com/docs/en/aix/7.1?topic=protocols-socket)
- packet [switching](https://en.wikipedia.org/wiki/Packet_switching#Concept) where switching means channel transmission.
- [IMP](https://en.wikipedia.org/wiki/Interface_Message_Processor)
- file Direct access [diff](https://www.baeldung.com/cs/file-access) sequential access
- [jid](https://www.ibm.com/docs/en/zos/2.3.0?topic=descriptions-kill-end-process-job-send-it-signal) in IBM for "Linux signal to job instead of processes".
#### D
- [NoRMA](https://en.wikipedia.org/wiki/NoRMA#:~:text=No%20Remote%20Memory%20Access%20(abbreviated,globally%20accessible%20by%20the%20processors.)
- computer utilities [diff](https://www.geeksforgeeks.org/difference-between-application-software-and-utility-software/) applications
- > Its extensive use of messages as the only communica-tion method ensures that protection mechanisms are *complete and efficient*.
  It uses virtual memory mapping to implement.
### projects
- most of them are codes inside the linux. I skipped all of them since doing the OSTEP projects.
### TODO
1. I almost skipped all JAVA related description because I have not studied it and also I didn't study some general ideas from something like sicp.
2. 
#### Introduction
- Holographic data storage
- [NRAM](https://en.wikipedia.org/wiki/Nano-RAM) [FRAM](https://en.wikipedia.org/wiki/Ferroelectric_RAM)
- network operating system implementation.
#### Operating-System Structures
- logically attach/detach devices diff request/releasedevice
#### Processes
- how sandbox implemented? p162/1278
#### threads
- several *nonfunctional* languages?
- Java `future` object.
#### scheduling
- p232 [bound](https://en.wikipedia.org/wiki/Rate-monotonic_scheduling#Least_upper_bound)
- the O(1) scheduler
#### Synchronization
- > Rather, we have moved busy waiting from the entry section to the critical sections of application programs
  just suspend, so how busy waiting?
#### Deadlocks
- Try [lockdep](https://stackoverflow.com/a/21440835/21294350) which is [faster](https://lwn.net/Articles/537046/) than helgrind.
- p430/1278
  if 
  > Since thread T0 is allocated five resources but has a maximum of ten, it *may request five more* resources. If it does so, it will have to wait, because they are unavailable
  then originally,
  > At time t0, the system is in a safe state. The sequence <T1, T0, T2> satisfies the safety condition
  will be wrong because After `T1` releases, `T2` may request more then `7` which is larger than the available `5`.
- why "Resource-Allocation Graph Algorithm" complexity is `O(mn)`.
- detect cycle in directed graph [complexity](https://www.geeksforgeeks.org/detect-cycle-in-a-graph/) `O(n^2)`
#### Virtual memory
- p519/1278 why reverse -> same?
- > Consider what may happen, though, if the reaper routine is unable to maintain the list of free frames below the minimum threshold. Under these circum-stances, the reaper routine may begin to reclaim pages more aggressively. For example, perhaps it will suspend the second-chance algorithm and use pure FIFO.
  so how does the "second-chance algorithm" fail?
#### Mass-Storage Structure
- what is [SMR](https://www.buffalotech.com/blog/cmr-vs-smr-hard-drives-in-network-attached-storage-nas)?
- > the time required to service reads is uniform but that, because of the properties of flash memory, write service time is not uniform
- >  the mean time to data loss of a mirrored drive system is 100, 000^2∕(2 ∗ 10) 
  the `/2` is due to [2 disks](https://cs.stackexchange.com/a/69474/161388).
  the `/10` [see](http://www.petertribble.co.uk/Solaris/raid.html) where `R/F` is failure probability and `(F/2)/(R/F)` means we have *used up all* life time to fail.
  So why use `lifetime/failure_rate` instead of `lifetime/non_failure_rate`?
#### I/O Systems
- How "STREAMS" implemented?
#### File-System Interface
- contrary
  > Acyclic-graph directory structures enable users to share subdirectories and files but *complicate searching* and deletion
  > The primary advantage of an acyclic graph is the relative *simplicity* of the algorithms to *traverse* the graph
- TODO somewhere in the book: diff between NVM and SSD.
- computer volume table?
#### File-System Internals
- how [active directory](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview) related with [LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol#Add) provide a single name space?
- lightweight directory-access implementation.
#### Security
- two links in p630.
- such as its unique distinguished name and its common (DNS) name?
- TLS implementation. 5:04
- 777/1278 `mod` in digital signature.
#### Protection
- why is "confinement problem" unsolvable?
#### Networks and Distributed Systems
- clustered file system diff cluster-based DFS
#### Windows
- Page-file page-table entry T P V?
- scheduling throttling ratios?
- How [`DuplicateHandle`](https://f3real.github.io/duplicatehandle.html) share the `hSemaphoreCopy`?
- windows variable-priority?
- How is [`phNewWaitObject`](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-registerwaitforsingleobject) used?
- Figure 21.10 meaning?
- pre-committed address space?
- How AWE [related](https://en.wikipedia.org/wiki/Address_Windowing_Extensions) with Physical Address Extension?
#### appendix C
- [`>& errs`](https://unix.stackexchange.com/a/89416/568529)?
#### appendix D
- Mach interoperable among computer systems?
- Why use Precious pages?
- copy-on-reference among multicomputer kernels?
## Modern Operating Systems
1. I only inspected the titles to decide whether to read the related chapter.
2. I skipped chapter 10, 11 because
- they don't have much code related infos and I have seen them (although windows 10) in the book Operating System Concepts.
  since windows 12 is said to come, no need to spend much time to learn one new windows system if not developing the corresponding softwares in it.
- windows is proprietary and no codes are available.
- "tofu" and something others shows the author not like China in some way (I know that China is one country with extreme centralization which has not been changed since the ancient ...).
### PREFACE
- [scheduler activation](https://zhu45.org/posts/2019/Apr/13/scheduler-activations-effective-kernel-support-for-the-user-level-management-of-parallelism/) -> context.
- [Pop-up](https://www.includehelp.com/operating-systems/thread-Implementation.aspx) Threads
### 1
- ~~Unikernels diff exokernel where the former combines all together while the latter doesn't.~~
  > A unikernel is a computer program statically linked with the operating system code on which it depends. Unikernels are built with a specialized compiler that identifies the *operating system services* that a program uses and *links it* with one or more library operating systems that provide them

  so Unikernels don't need the OS
  ![](https://raw.githubusercontent.com/cetic/unikernels/master/MEDIA/vms-containers-unikernels.PNG)
  TODO what is Exokernel [diff](https://news.ycombinator.com/item?id=9846452) Unikernels
### 2
- [RCU](https://en.wikipedia.org/wiki/Read-copy-update#Name_and_overview) where copy ensures consistency.
  "read-side critical sections" are just one specific critical section.
### 3
- [Memory Protection Key](https://www.computer.org/csdl/magazine/sp/2023/03/10077209/1LFQarjNLeo) is 
  > offers *per-thread* memory protection with an affordable overhead
  [Also](https://www.kernel.org/doc/html/next/core-api/protection-keys.html)
- the working set algorithm is just R/M (reference/modified) method with the working set.
- > all pages are in the working set, otherwise at least one write would  have  been  scheduled.
  because
  1. no write ~~means all clean~~ means not "the age is greater than $\tau$ and the page is clean" by 247/1185
    > To  avoid a process switch, the write to nonvolatile storage is  scheduled
    then if it isn't in the working set, it will be evicted before.
    - so it may be "the age is less than $\tau$" but "the page is *dirty*".
  2. > the  hand  comes  all  the  way  around  and  back
     implies all elements conform to the above condition.
- Segmentation implies the [mapping](https://stackoverflow.com/a/28281496/21294350).
  > Again, every process works with its own virtual address space. This is where these segments can exist.
- how Segmentation [sharing](https://codex.cs.yale.edu/avi/os-book/OS9/practice-exer-dir/8-web.pdf) of procedures between users -> 8.6.
- segmentation eliminated "system call" because *local*.
  > even though  it  was  quite  efficient because it eliminated system calls, turning them into lightning-fast procedure calls to the relevant address *within* a protected operating system segment.
- > simplifies linking and sharing
  simplifies sharing so simplifies linking.
### 4
I only read 4.5 figures without caring many of these details because
1. they are old
2. they have no codes at all.
3. Seeing many implementations but not knowing why doesn't help.
### 5
only see contexts of bold words since no codes at all which doesn't help much for the development. 
- > it  is  still  charged  for  a  full  tick,  even though  it  did  not  get  much  work  done
  it also applies for "a  second  timer".
- > albeit with an occasional missed deadline
  i.e. $2\mu s$ events may be enlarged to $10\mu s$.
- USB message pipes and stream pipes are in the [Middleware](https://www.keil.com/pack/doc/mw/USB/html/_u_s_b__endpoints.html)
- USB raw  mode and [cooked mode](https://en.wikipedia.org/wiki/Terminal_mode#:~:text=In%20cooked%20mode%20data%20is,interprets%20special%20meaning%20from%20them.)
- `man termios` -> LNEXT.
- GDI [diff](https://community.khronos.org/t/gui-graphical-user-interface-gdi/21013/4) GUI
- [DIB](https://learn.microsoft.com/en-us/windows/win32/gdi/device-independent-bitmaps)
- [capacitive coupling](https://www.dush.co.jp/english/method-type/capacitive-touchscreen/#:~:text=Operating%20Principle&text=When%20a%20conductive%20material%20such,detected%20as%20the%20touch%20position.) with [capacitive touch](https://fieldscale.com/learn-capacitive-sensing/intro-to-capacitive-touch-sensors/)
- why resistive screen [cannot multitouch](https://electronics.stackexchange.com/a/16827/341985)
  same as the book says
  > The resistance in precisely the same lines has changed, so the software has no way of telling *which of the two* scenarios holds
- [Thin](https://www.baeldung.com/cs/distributed-systems-thin-vs-thick-clients) client
  > Smartphones and browsers for the Internet are two instances of thin clients.
- intel power [P-states](https://doc.opensuse.org/documentation/leap/archive/42.2/tuning/html/book.sle.tuning/cha.tuning.power.html#sec.tuning.power.cpu.pstates)
  [C-state](https://www.intel.com/content/www/us/en/support/articles/000006619/processors/intel-core-processors.html)
- p425 shows slower CPU sometimes is better.
  > A much more attractive  solution  is  to  run  the  network  stack  on  a  slower  core,  so  that  it  is  con-stantly busy (and thus never sleeps)
- Device-independent see 5.3
### 7
- container [diff](https://aws.amazon.com/compare/the-difference-between-containers-and-virtual-machines/) virtual machines
  > Container technology involves building self-sufficient *software* packages
  TODO different from p480
- [`POPF`](https://stackoverflow.com/a/32797308/21294350) is one of sensitive  instructions.
- [straight-line sequence](https://gcekbpatna.ac.in/assets/documents/lecturenotes/module-1.pdf) of instructions
- [paravirt ops](https://wiki.xenproject.org/wiki/XenParavirtOps)
- ballooning just *syncs* between the guest and the hypervisor.
  > In other words, the hypervisor tricks the operat-ing system into making tough decisions *for it*
  so no need for two steps
  > suppose  that  the  hypervisor  pages  out  a  page P
  > the hyper-visor must first page the contents back into memory
  - [deflate](https://www.usenix.org/legacy/publications/library/proceedings/osdi02/tech/full_papers/waldspurger/waldspurger_html/node6.html#:~:text=When%20the%20server%20wants%20to,to%20deallocate%20previously%2Dallocated%20pages.)
- type 1 hypervisor [diff](https://medium.com/teamresellerclub/type-1-and-type-2-hypervisors-what-makes-them-different-6a1755d6ae2c) type 2 hypervisor
- [virtual functions](https://en.wikipedia.org/wiki/Single-root_input/output_virtualization#Details)
  > have a restricted set of configuration resources.
  is a bit different from "do not  offer  such  configuration  options." as the book says.
- [Elasticity](https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.elasticity.en.html)
- [Infrastructure as a Service](https://aws.amazon.com/what-is/iaas/) -> resource share.
- [Function as a service](https://en.wikipedia.org/wiki/Function_as_a_service)
  > *develop*, run, and manage application
- [vendor lock-in](https://www.cloudflare.com/learning/cloud/what-is-vendor-lock-in/#:~:text=Vendor%20lock%2Din%20is%20when,or%20service%20is%20not%20practical.)
  > Vendor lock-in refers to a situation where the *cost* of switching to a different vendor is so *high* that the customer is essentially stuck with the original vendor.
- [application interoperability](https://aws.amazon.com/what-is/interoperability/)
- [VMM VMX](https://kb.vmware.com/s/article/1019471)
- [`popf`](https://www.felixcloutier.com/x86/popf:popfd:popfq) relation with the interrupt.
  > The interrupt flag (IF) is altered only when executing at a level *at least as privileged as the IOPL*
- p513 three bullets just mean the instruction is sensitive.
  where [Real mode](https://en.wikipedia.org/wiki/Real_mode#:~:text=Real%20mode%20is%20characterized%20by,multitasking%2C%20or%20code%20privilege%20levels.) may be due to
  > *unlimited direct* software access to all addressable memory
- [Host-Only](https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/network_hostonly.html#:~:text=Host%2Donly%20networking%20can%20be,through%20a%20physical%20Ethernet%20switch.) Networking, i.e. other guests (bridged) and host (internal).
- notice VMX and VMM run in the user mode and the kernel mode each to keep isolation.
- > a  normal  application  *does  not  have*  the  necessary  hooks  and  APIs necessary  for  a  hypervisor  to  multiplex the  CPU  and  *memory*  resources,
  so VMM is separate from the host OS to offer the capability with the memory, etc.
  > the  VMware  Workstation  installer simply  writes  its  component  files  onto  an  existing  host  file  system,  without  per-turbing  the  hardware  configuration  (no  reformatting  of  a  disk ...)
  so VMX is separate from the VMM to keep the disk safe.
- [SR-IOV](https://www.ibm.com/docs/en/power9?topic=networking-single-root-io-virtualization) -> *one* "PCIe device" to share.
### 8
- "UMA Multiprocessors Using Multistage Switching Networks" is also said in COD.
- [`_mm_mwait`](https://learn.microsoft.com/en-us/cpp/intrinsics/x64-amd64-intrinsics-list?view=msvc-170) [example](https://cpp.hotexamples.com/examples/-/-/_mm_mwait/cpp-_mm_mwait-function-examples.html#0x2106ec03117424c4c99f10e5ae8c2aca36db523979bcd1ce129ac10e91c32bea-24,,32,) corresponding to the book which is for one [range](https://stackoverflow.com/a/72903153/21294350).
- time sharing -> schedule *one* thread each time, so time sharing.
- 4D hypercube is two 3D with corresponding points connected similar to 2D->3D.
- RDMA [avoids overheads](https://core.vmware.com/resource/basics-remote-direct-memory-access-rdma-vsphere)
- [SMT](https://en.wikipedia.org/wiki/Simultaneous_multithreading)
  > In simultaneous multithreading, instructions from more than one thread can be executed in *any given pipeline stage* at a time.
  [Also](https://courses.cs.washington.edu/courses/csep548/00sp/lectures/class4/sld058.htm)
### 9
- `%n` [relation](https://stackoverflow.com/questions/3401156/what-is-the-use-of-the-n-format-specifier-in-c#comment108683120_3401156) with Turing-complete by overwriting -> [possible loop](https://github.com/carlini/printf-tac-toe/issues/1#issuecomment-639591933).
- 9.5.3 should not happen due to the OS protection.
- double fetch vulnerability just one special TOCTOU where
  > the *kernel fetches* data from  user  processes  twice.
- [out-of-band](https://security.stackexchange.com/a/145631) secret-key
  > If you are sending the encrypted messages over the *internet*, calling up the other person on the *phone* and reading the key to them would be transmitting it "out of band"
### 12
- python goals
  - [interviews](https://gvanrossum.github.io//interviews.html)
  - why design ABC
    > Based on this user feedback, ABC's designers tried to develop a different language.
    > Maybe it was too early, *before there was an Internet* to do efficient distribution.
  - python [goal](https://www.artima.com/articles/the-making-of-python)
    1. > I decided to try to design a simple scripting language that possessed some of ABC's better properties, but *without its problems*.
    > I created a simple *virtual machine*
    2. > used *indentation* for statement grouping instead of curly braces or begin-end blocks
    3. > I think my most innovative contribution to Python's success was making it easy to *extend*.
    4. > I already knew we would want to use Python on different platforms
    > I realized that each of those systems had certain functionality that was *consistent everywhere*
    > But we'll also make it easy for third-party programmers to add their *own object types* to the system
    5. > so I decided the module would be one of Python's major programming units
    > You can write modules in Python, but you can also write a module entirely in *C* code.
    > Python's import works slightly different from Java's import, but it has the *same idea* behind it.
    > There's a search path.
    > The way you use a *precompiled* machine code module is, from the Python point of view, exactly the same.
    [part 2](https://www.artima.com/articles/pythons-design-goals)
    > The first sound bite I had for Python was, "Bridge the gap between the shell and C."
    problems of ABC
    > They designed every language detail and there was *no way to add* to it.
    > If you quit your session, all your *global variables* were saved by the system to a disk file.
    > but there was no way to redirect IO to or from a *file*
    > ABC had no concept of a standard *library*.
  - Programming model can be thought as [modules](https://en.wikipedia.org/wiki/Programming_model) like Spark.
  - functions diff procedures whether [return](https://byjus.com/gate/difference-between-function-and-procedure/#:~:text=A%20function%20would%20return%20the,calling%20function%20or%20the%20code.) *values*.
- [model](https://link.springer.com/referenceworkentry/10.1007/978-0-387-30162-4_190#:~:text=The%20Input%2FOutput%20model%20(I,to%20hold%20M%20data%20items.) of I/O
- Inertia means [reproduce](https://ec.europa.eu/programmes/erasmus-plus/project-result-content/ff5c27a4-33e1-4ece-9ff2-5f2e32474127/Understanding%20the%20inertia%20of%20a%20school%20system%20-%20EN.pdf) tendency.
  > The attendance of some teachers in class can reproduce the behaviour they blame on their own students.
- That HTTP itself is [*connectionless*](https://stackoverflow.com/a/13200206/21294350) maybe means reuse the connection.
- [blank check](https://www.investopedia.com/terms/b/blankcheckcompany.asp)
  > Blank check companies are shell companies that are commonly set up to go public, raise funds, and buy a private company
- Linux set two alarm at the same time [impossible](https://stackoverflow.com/questions/49342439/set-two-alarm-and-handle-them-differently-unix-c#comment85685190_49342439)
- system [integration](https://www.indeed.com/career-advice/career-development/system-integration-testing) testing -> interactions
### TODO
#### 3
- > The trouble is, we do not know which of them was referenced  last  in  the  interval  between  tick  1  and  tick  2
  LRU just tracks the counter, so figure (e) is enough to differentiate.
- WSClock also needs scan for each reference, so why only "working set" expensive?
  >  maintaining the shift register and processing it at a page fault would both be prohibitively expensive
#### 5
- POSIX ["LNEXT" "Ctrl-v"](https://news.ycombinator.com/item?id=28146597)
- how to use [`termcap`](https://www.gnu.org/software/termutils/manual/termcap-1.3/html_mono/termcap.html#SEC4)?
#### 7
- all-emulation diff trap-and-emulate
#### 8
- 8.1.1 doesn't say about how uniform is implemented.
#### 9
- how to use Format String Attacks by `fmtme.c`?
  - others
    ```bash
    $ ./owasp.out "Hello World %p %p %p %p %p %p"
    ```
    the link says related with the stack, TODO related with the [source code](https://codebrowser.dev/glibc/glibc/stdio-common/vfprintf-internal.c.html#1178)
    - [Also similar](https://ctf101.org/binary-exploitation/what-is-a-format-string-vulnerability/)
- how [TDX](https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/trusted-domain-security-guidance-for-developers.html) avoids microarchitectural attack?
  [specification](https://www.intel.com/content/dam/develop/external/us/en/documents/intel-tdx-module-1eas.pdf)
- page coloring in the book 
  > it will *not normally affect* the cache activity of process 2
  while the wikipedia [emphasizes](https://en.wikipedia.org/wiki/Cache_coloring)
  > by selecting pages that do *not contend* with neighbor pages.
#### 12
- how clone system call share the  address  space, working directory ...?
  `CLONE_FILES` -> file descriptor
  `CLONE_CLEAR_SIGHAND` -> signal

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
[MS91]:./Ostep_papers/R06-scalable-synchronization-1991.pdf
[S+11]:./Ostep_papers/Sundararaman.pdf
[EWD6]:./Ostep_papers/07_dijkstra.pdf
[LR80]:./Ostep_papers/Monitors_in_Mesa.pdf
[EWD_35]:https://www.cs.utexas.edu/users/EWD/translations/EWD35-English.html
[D68b]:./Ostep_papers/dijkstra-the68.pdf
[D72]:./Ostep_papers/dijkstra1972.pdf
[CB08]:./Ostep_papers/Real-world_Concurrency.pdf
[D71]:https://www.cs.utexas.edu/users/EWD/transcriptions/EWD03xx/EWD310.html
[D01]:https://www.cs.utexas.edu/users/EWD/transcriptions/EWD13xx/EWD1303.html
[D68]:https://www.cs.utexas.edu/users/EWD/transcriptions/EWD01xx/EWD123.html#4.%20The%20General%20Semaphore.
[D08]:./Ostep_papers/LittleBookOfSemaphores.pdf
[B04]:./Ostep_papers/ImplementingCVs.pdf
[L+08]:./Ostep_papers/asplos122-lu.pdf
[A+02]:./Ostep_papers/adyahowell.pdf
[PDZ99]:./Ostep_papers/Flash_web.pdf
[O96]:./Ostep_papers/ousterhout-threads.pdf
[MR96]:./Ostep_papers/mogul96usenix.pdf
[R92]:./Ostep_papers/CSD-92-696.pdf
[C+04]:./Ostep_papers/corbett.pdf

[H93_MIPS_R4000]:../references/other_resources/COD/MIPS/R4400_Uman_book_Ed2.pdf

[x86_paging]:https://wiki.osdev.org/Paging#Page_Directory
[Homonym_Synonym]:http://www.cse.unsw.edu.au/~cs9242/02/lectures/03-cache/node8.html
[geeksforgeeks_aliasing]:https://www.geeksforgeeks.org/virtually-indexed-physically-tagged-vipt-cache/

[opengroup_doc]:https://pubs.opengroup.org/onlinepubs/9699919799/

<!-- books -->
[COD_RISCV_2nd_A_appendix]:../references/other_resources/COD/COD_RISCV_2nd_A_appendix.pdf
[MIPS_DOC]:../references/other_resources/COD/MIPS/R4400_Uman_book_Ed2.pdf
[CAAQA]:../references/other_resources/CAAQA/Computer_Architecture_Sixth_Edition_A_Qu.pdf

<!-- blog -->
[futex_example]:https://eli.thegreenplace.net/2018/basics-of-futexes/

[x86_asm_Constraints]:https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html

<!-- SO -->
[cflush_rdstc_check_overhead]:https://stackoverflow.com/a/51830976/21294350
[detailed_get_cycle]:https://stackoverflow.com/a/51907627/21294350

<!-- intel doc -->
[intel_rdstc]:https://www.felixcloutier.com/x86/rdtsc
[intel_64]:../references/x64_ISA_manual_intel/intel_64.pdf
[Benchmark_IA_64]:../references/x64_ISA_manual_intel/ia-32-ia-64-benchmark-code-execution-paper.pdf

[amd_64]:../references/AMD/amd64.pdf

[osdev_x86_64_reg]:https://wiki.osdev.org/CPU_Registers_x86-64
[monitor_synchronization]:https://en.wikipedia.org/wiki/Monitor_(synchronization)#Monitor_usage

[URPCs]:./reference/books/URPCs_19thEdition.pdf

[Study_Guide]:./other_OS_books/Operating_System_Concepts/Study-Guide.pdf