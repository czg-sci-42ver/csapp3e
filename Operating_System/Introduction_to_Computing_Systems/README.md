# Preface
- [information hiding](https://en.wikipedia.org/wiki/Information_hiding)
  > a module designed with information hiding in mind would *protect* the remainder of the program from such a change.
  > information hiding is the principle of *segregation* of the design decisions in a computer program that are most likely to change, thus protecting other parts of the program *from extensive modification* if the design decision is changed.
  i.e. independent.
  Also see [Introduction_to_Computing_Systems_book] xvi where just means hide the information.
- ["deposit, examine"](https://www0.mi.infn.it/~calcolo/OpenVMS/ssb71/4538/4538p007.htm) in debugging.
- value is probably rhs, while constant can be lhs, and variable is probably lhs although it can be rhs.
  [See](https://stackoverflow.com/a/41272494/21294350)
  > assign a new value to a variable as many times as you want
- ["variable-length arrays"](https://www.geeksforgeeks.org/variable-length-arrays-in-c-and-c/) still uses dynamic allocation.
- stack frames is part of the run-time stack, [See](https://stackoverflow.com/a/28038967/21294350)
- [dynamic declaration](https://dotnettutorials.net/lesson/dynamic-declaration-in-cpp/) just *limit the local variable range* by `if (int c = a + b; c > 10)`.
- shift [implementation](https://stackoverflow.com/a/36883711/21294350) by AND and NOT
  `BYTE(x&0x01)` checks the *set* bit to *shift*.
  `y|=bit[b]` sets the shifted bit
  and `b=inc[b]` which is not included in the `if` block controls the shift value based on the update from `BYTE(x&0x01)` to `BYTE(x&0x02)`.
# chapter 1
- [turing machine](https://en.wikipedia.org/wiki/Turing_machine#Equivalent_models) can be thought as one PDA with *two different directional* stacks. See the figure
  >  by using one stack to model the tape *left of the head* and the other stack for the tape to the right.
## 1.7 is very important.
- "The Statement of the Problem" in 14 may mean better use the *mathematics* which is more definite.
- ["expert system"](https://en.wikipedia.org/wiki/Expert_system) -> making *decisions*. 
  [Examples](https://www.metalevel.at/prolog/expertsystems)
  > emulating the *decision-making* ability of a human expert
  > represented mainly as *if–then* rules
- > The instruction set architecture (ISA) is the complete specification of the interface between pro-grams that have been written and the underlying computer hardware that must carry out the work of those programs.
  i.e. program -> ISA -> hardware
  > The translation from the unique *assembly language of a computer to its ISA* is done by an assembler.
  ISA is the binary codes.
- > two dozen addressing modes.
  probably contains AVX/AVX2/AVX512 related ones.
- x86 architecture [definition](https://en.wikipedia.org/wiki/X86#Overview)
  > the term x86 usually represented any *8086-compatible* CPU
- [gallium arsenide field-effect transistor](https://www.techtarget.com/whatis/definition/gallium-arsenide-field-effect-transistor-GaAsFET#:~:text=A%20gallium%20arsenide%20field%2Deffect,up%20to%20the%20infrared%20band.)
# chapter 3
- TODO
  - is there one way similar to "Figure 3.7" that is better than "Figure 3.6"?
- Figure 3.7
  - IMHO, here the circuit can't be implemented with the output voltage as the table shows.
    Here is only to show that the output voltage can't be as low/high as expected because of *misusing the source*. Also see [this 6:28,](https://www.youtube.com/watch?v=uUo9IOiizHA)
    The $V_{GS}$ controls the output voltage (i.e. source) differences (i.e. 0.5V) with the gate voltage.
    Also see [this](https://web.stanford.edu/class/archive/engr/engr40m.1178/slides/transistors.pdf) $V_{th}$
- [gated latch](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#Gated_latches_and_conditional_transparency)
  here gate is gate with one Enable signal
- > A Problem with Gated Latches as Storage Elements
  because it has no clock delay.
# C6
- program bugs [origin](https://en.wikipedia.org/wiki/Software_bug#:~:text=Operators%20traced%20an%20error%20in,in%20a%20program%20a%20bug.)
  > Operators traced an error in the Mark II to a *moth trapped in a relay*, coining the term bug.
# C8 (chapter 8)
- Figure 8.14
  - `STR R7,R6,#0` is fine, because `R7` has no backup.
  - TODO but `STR R0,R6,#0` may be redundant because `STR R1,R6,#0` has saved the old `R1` and before `RET`, it will pop back by `LDR R1,R6,#0`.
    Also see Figure 8.15.
  - > we first note how many instructions are executed and *how much time is wasted pushing and popping* elements off the stack.
    This decides whether to use the recursion.
  - Figure 8.16 is just similar to unroll to avoid the call overhead.
- Figure 8.19,18 is very similar to before, but the 18 has more call subroutines and 19 is similar to start from 0 to n instead of n to 0.
  `ADD R1,R1,#1 ; We begin the iteration of FIB(i)` ~~at the 1st step -> `FIB(2)=2`.~~ here `R1` is to control the loop by `ADD R5,R1,R0`.
- p291
  - here "or if" just means "i.e.".
- > Recursion allows us to not have to keep track of the paths at all!
  > Fibonacci is simply that the *iterative algorithms are simple enough* to understand without the horrendous execution time penalty of recursion.
  This shows when to use recursion (ans: when the recursion overhead is less than others like traverse or iteration).
- use not [$~$](https://stackoverflow.com/a/31151236/21294350) in python
  ```bash
  $ ipython
  [ins] In [5]: hex(0xFFFF-(0x7FFB-1))
  Out[5]: '0x8005'
  ```
- > Our answer is to allow a queue to *store only n-1 elements* if space for n ele-ments has been allocated.
  To make
  > there is *no ambiguity* between a full and an empty queue since if the queue is empty,
- > some basic interaction between the processor and the *operating system*. We introduce the notions of priority and privilege
  See p314. i.e. "privilege" is owned by the *operating system* while other user programs probably not have the privilege.
- > A simple way to handle this would be to *disable all interrupts* while polling was going on.
  So polling may have very low privilege then will always be interrupted
  while INT from "9.4.4.3 The INT Signal" has the PL comparison.
  - > The STI of the loop body writes, but since DDR is not ready, the write does not occur.
    The INT may interfere the `DDR` which in turn interferes the original `STI` write.
- > An interrupt would have to wait for *the three-instruction sequence* LDI, BRzp, STI to execute, rather than for the entire polling process to complete.
  So `POLL STI R1,PSR` which make the delay *available minimal*.
# C15
- Semantic Error is part error while the Algorithmic Error may be one *general* error.
  15.2.2 lists 3 subtypes of Semantic Errors.
  1. mistakenly use the *wrong types of syntax* although valid.
    ```c++
    for (i = 0; i <= 10; i++)
        j = i * 7;
        printf("%d x 7 = %d\n", i, j);    
    ```
  2. `int result;` mistakenly doesn't conform to the *coding habit of initialization*.
    See p531. Use the compiler to avoid this.
  3. `scanf("%d", in);` doesn't conform to the *API* of `scanf`. 
  - more specifically, Semantic Error may happen to all problems while the Algorithmic Error only happens to one specific range of problems.
- > The software worked as specified, but the specification itself was flawed.
  the Specification Error is less about mathematics than the Algorithmic Errors.
- > For example, knowing that the code consists of *several different functions* and testing *each function* in isolation (perhaps as a *black box*) is a *white-box* process
  The white-box is somewhat part of the black-box.
  1. `printf` which can be disabled by compilation or others.
  2. assertions.
- "15.5" says about how to write the codes better.
- from p519, "spot check" in p530 means checking "awry" spots.
- 15.6
  - "finding and fixing bugs" where finding by 15.3 Testing.
- > it would be much more *difficult* for printf and scanf to *discern the location of the format string* parameter
  ~~TODO this is done by the compiler, so why difficult to discern?~~
  because
  > In version (a), the *offset* of the format string from the stack pointer will always be *zero*
- > *Literals are constant values assigned* to constant variables.
  from [this](https://www.simplilearn.com/tutorials/java-tutorial/literals-in-java#:~:text=Literals%20are%20constant%20values%20assigned,particular%20values%20in%20the%20program.)
- [Execution model](https://en.wikipedia.org/wiki/Execution_model) is what every operators mean.
  > The execution model specifies the *behavior of elements* of the language.
# Ç20
- > careful use of the *dereference operator* within the AddFlight function
  See "Figure 19.8".
- p639
  - TODO differences between `malloc` and `new` are always forgotten.
  - From [this](https://ptolemy.berkeley.edu/publications/papers/01/run-time/run-time.pdf)
    > Run-time models are usually operating system (OS) concepts; for example, they may appear as part of *real-time* operating systems (RTOS) or virtual machines
    Run-time models are just as they literally mean.
- Figure 20.5
  - `LDR R0, R6, #0` which loads from `R6=R5+3` after 3 `ADD R6, R6, #1` which stores return value `R1` by `STR R1, R5, #3`.
    here the first 2 `ADD R6, R6, #1` correspond to `ADD R6, R6, #-1` before 2 pushes like `STR R5, R6, #0`.
  - TODO why `STR R0, R5, #1` corresponds to `p1 = t1.perimeter();`.
  - `ADD R6, R6, #2` because 3 `ADD R6, R6, #-1` and 1 `ADD R5, R6, #-1` only have 1 `ADD R6, R5, #1` and 2 `ADD R6, R6, #1` corresponded in the `perimeter` which lacks 1 `ADD R6, R6, #1`.
    So plus the `ADD R6, R6, #-1` in the `main` -> `ADD R6, R6, #2`.
# TODO
- read "its misuse" in [Introduction_to_Computing_Systems_book] xviii based on assembly and C.
- see "Figure 3.20" referenced in xviii.
- all green highlights in Preface.

[Introduction_to_Computing_Systems_book]:./Introduction%20to%20Computing%20Systems.pdf