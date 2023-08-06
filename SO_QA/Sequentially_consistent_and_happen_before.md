The following contents use many levels of markdown item lists which may be difficult to view on the **mobile devices**. 

Recently I also read the same cppreference section and has the same question as you at first and got the idea after viewing related SO QAs and papers. I hope this answer can also help you understand what the cppreference says.

---

Your question seems to be a *duplicate* of [QA_1][1] and [QA_2][2], but both QAs seem to not read the original [paper_1][3] which is referenced in the [cppreference_1][4] and [paper_2][5]. So here I will give one answer mainly based on the paper_1 and partly based on its reference [paper_3](https://dl.acm.org/doi/10.1145/2837614.2837637) from perspective  of **mathematics** which may help grasp the inner ideas if having mathematics basic knowledge. 

These are based on my understanding of the papers and related links. *Please point out errors if any*, thanks beforehand.

#### Short answer:
1. View the quote in QA_1 question, you will get the occasion where the above **conflict** occurs based on the **old c++11** standard.\
   And the QA_1 answer says how this can occur in the real world (can be due to the cache **consistency** which cause different threads see different order of **different** variables).
2. More specifically, view the **Figure 3 with its context**, (S1fix) context and related terminology definitions in the paper_1
   - "A happens-before C" corresponds to `S(k, m)`
      - A is **sequenced before** (sb) B (This is because they are in the same thread by [cppreference_2][6])\
         B **synchronized with** (sw) C about the variable `y` but not about `x`, so A happens before C.
         (This is definition of "happens before": a sequence composed of sb and sw.)
   - the total modification order "C-E-F-A" corresponds to `S(m, o, p, k)` (here I coalesced different `S(,)` by order).
      - here `S(p,k)` is due to "reads-before" (IMO, this means "reads-before-write" due to ![](https://latex.codecogs.com/svg.image?rf%5E%7B-1%7D;mo). It is to solve with the WAR hazard).
   - Then the above causes the **cycle**, so in the paper_1 it says "What Went Wrong and How to Fix it" context and it **redefines** in (S1fix). The **c++20** standard is now based on it as the paper_2 says. 
     - Here you can think that it splits the original cycle (i.e. **old c++11** total modification order) into two parts `S(k, m)` and `S(m, o, p, k)` where the former stays "happens-before" and the latter is the **new** total modification order.
   - To be more specific, the original question can have one observation order `(A)-B-C-E-D-F-A` (here "(A)" means it runs before but **observed later**.)
     - here A not synchronizes with C, so there is no must that A needs to be observed by C.

Notice: *maybe* the above optimized memory model introduced in c++20 is still flawed. However, I'm not one compiler/computer architecture expert, so it's beyond my abilities to find the flaws.

   <!-- https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Set_and.2For_logic_notation -->
#### Detailed answer mainly based on the paper_1:
The following needs some knowledge of discrete mathematics and I add some description for someone temporarily not familiar with them.

##### If you don't want to be stuck with the "math", then view the following "non-math" part is enough.
Notice: here only some symbols are rephrased, you may better **view the original papers** if has some questions about some terminology.
1. math\
   Part of the following primitive symbol definitions (mainly about relation) can be seen from "Notation 1" in the paper_1 like  and "Definition 8" in the like `(;)` paper_3 which is referenced in the paper_1.
   - Here I **assume** that they take same math **primitive** symbols in their the papers because paper_1 "Remark 1" says:
     > The reason we **use Batty et al.’s version** here is that it provides a **cleaner** starting point for our discussion, and our solution to the problems with C11’s SC semantics will build on it.
     
     And after viewing the paper_3 footnotes in p5, it is mainly based on the ISO standard and maps them to the *pure math* which may be more intuitive if having better mathematics knowledge.
   - ![](https://latex.codecogs.com/svg.image?%5BA%5D;R;%5BB%5D=R%5Ccap(A%5Ctimes%20B)) (`x` [meaning](https://en.wikipedia.org/wiki/Set_(mathematics)#Basic_operations).)\
      Here `;` is [composition of relations](https://en.wikipedia.org/wiki/Composition_of_relations#Definition)\(i.e. ![](https://latex.codecogs.com/svg.image?%5BA%5D;R;%5BB%5D) means one pipeline like `[A] -> R -> [B]`).\
      This means one AB pair has the relation R.
2. happens-before definition:
   - non-math
      - See [this](http://eel.is/c++draft/intro.races#9) (better than cppreference ones because of the 2 levels) which is referenced in both above 2 QAs.
         > A is dependency-ordered before B, or

         This implies including **consume**.
      - As the paper_1 says:
        > Besides the new SC and NO -THIN - AIR conditions, RC11 differs in a few other ways from C11. 
        > It does **not support consume** accesses

        So the above cppreference definition may be more general than the following math definitions from the paper_1.
   - math\
      ![](https://latex.codecogs.com/svg.image?hb%5Ctriangleq(sb%5Ccup%20sw)%5E&plus;)
      > Next, we say that one event happens before (hb) another event if they are connected by **a sequence of `sb` or `sw` edges**

      - `+` means transitive (i.e. **sequence**) and `U` means "or".
      
      above `S(k,m)` has the "happens-before" relation because of the `S(l,m)` synchronization(This is due to `l,m` have data dependency implied (i.e. m read the write of l))
      - definition of `sw`
        - non-math\
           think as the `rel`,`acq` sequence like the other [section](https://en.cppreference.com/w/cpp/atomic/memory_order#Synchronizes_with) of cppreference_1 says.
           > If an atomic store in thread A is a **release** operation, an atomic **load** in thread B from the **same** variable is an acquire operation, and the load in thread B **reads** a value written by the store in thread A, then the store in thread A synchronizes-with the load in thread B.
        - math (see the paper_1 for more details)\
           ![](https://latex.codecogs.com/svg.image?sw%5Ctriangleq%5BE%5E%7B%5Csqsupseteq%20rel%7D%5D;(%5BF%5D;sb)%5E?;rs;rf;%5BR%5E%7B%5Csqsupseteq%20rlx%7D%5D;(sb;%5BF%5D)%5E?;%5BE%5E%7B%5Csqsupseteq%20acq%7D%5D)
           > Next, a release event a synchronizes with (sw) an acquire event b, whenever b (**or**, in case b is a fence, some sb-prior read) reads from the release sequence of a (or in case a is a fence, of some sb-later write).

           - From above, the reflexive symbol `?` implies "or" relation.
           - The ![](https://latex.codecogs.com/svg.image?%5Csqsupseteq) means partial order with equal, so ![](https://latex.codecogs.com/svg.image?%5Csqsupseteq%20rel) **includes the `sc`** from the bottom-right figure in p7 of the paper_1.
           - And the `[F]` is always explicity placed by **weak** architecture like POWERPC referenced in the paper_1 which is related with `rel` or `acq`,etc (see this [link](https://www.cl.cam.ac.uk/~pes20/cpp/cpp0xmappings.html) from the paper_2 for how the compiler adds these fences).
           - `rs; rf` is implied by `rel` and `acq`
           - ![](https://latex.codecogs.com/svg.image?%5BR%5E%7B%5Csqsupseteq%20rlx%7D%5D) is to take RAR (read after read) in account.
           - definition of `rs`\
              in the definition of `rs`, `rf; rmw` is to get the sequence like "write,read,write".
            - **In summary**, the above means "rel_event,(fence-sync),release_relation,read-from,relaxed_read,(fence-sync),acq_event"
               - here "relaxed_read" exists because it doesn't influence the relation between `rel` and `acq`.
   - definition of `sb`. Here I take the definition in the paper_3 to highlight that they are in the **same thread**.
      - non-math\
         From cppreference_2:
         > Sequenced before is an **asymmetric**, **transitive**, pair-wise relationship between evaluations within the **same** thread.
      - math\
         ![](https://latex.codecogs.com/svg.image?I%5Csubseteq%20E;thd%5Csubseteq(E%5Csetminus%20I)%5E2;sb%5Csubseteq%20thd)\
         Then `sb` means:
         > a **strict partial order** (i.e., irreflexive and transitive) between events from the **same** thread, that captures the program order.

         - "strict" [meaning](https://mathworld.wolfram.com/StrictOrder.html)

         and the `thd`:
         > an equivalence relation on **non-initial** events that relates events from the same thread.

         `I`:
         > a set of **initial** events. Every initial event ![](https://latex.codecogs.com/svg.image?e%5Cin%20I) is a **non-atomic write of zero**; that is, kind (e) = Wna and wval (e) = 0.Moreover, there is exactly one initial event per location.
3. definition of the single total order (`S` in the paper_1)
   - non-math\
      as the paper_1 says:
      > there should be a strict **total** order, S, over all **SC** events, intuitively corresponding to the order in which these events are **executed**.
   - math from the paper_3
      > the S relation relates, in a **strict total** order, **all and only** the SC events in an execution; that is,
      > 
      > ![](https://latex.codecogs.com/svg.image?acy(S)%5Cquad%20and%5Cquad(S%5Ccup%20S)=(SC%5Csetminus%20id))
      
      - here `id` is "identity relation"
      - the ![](https://latex.codecogs.com/svg.image?(S%5Ccup%20S%5E%7B-1%7D)) implies the `S` order is **runtime** defined.
      - the `acy(S)` (S is acyclic) is significant because this caused the above example failure.
4. relations of "the single total order" and "happens-before" and reasons for changes
   - original version in c++11 from the paper_1:
     > (S1) S must include hb restricted to SC events
     > 
     > (formally: ![](https://latex.codecogs.com/svg.image?%5BE%5E%7Bsc%7D%5D;hb;%5BE%5E%7Bsc%7D%5D%5Csubseteq%20S));
     > 
     > [...] (these with no problems found by the paper unchanged)

      non-math: `S` needs to be conform to the hb (happens-before) order\
      math: see the above equation.
      - How this make problems -> see above "A happens-before C".
   - why the original c++11 model fails with specific examples?\
      Because it **drops of `sync` fences**. Then it implies the [weaker](https://preshing.com/20120930/weak-vs-strong-memory-models/) memory model.
      - quotes in the paper_1 "Fixing the Model":
        > Conversely, if we follow the leading sync convention, the hb-path (in Fig. 3) from k to m ending with an sw edge **avoids the fence** placed before m.

        And see paper_2:
        > On the other hand, this outcome is **allowed** by the Power implementation. Power normally uses the "leading fence" convention for sequentially consistent atomics. ( See http://www.cl.cam.ac.uk/~pes20/cpp/cpp0xmappings.html ) This means that there is **only an lwsync** fence between Thread 1's instructions. This does **not** have the "cumulativity"/**transitivity** properties that would be required to make the store to x visible to Thread 3 under these circumstances.

          - notice: here "this outcome" is that **cycled** outcome (which is not allowed by original language specification expectation but occurs on the machine)
          - Here it says POWER not has transitivity about memory fence, this [depends](https://stackoverflow.com/a/58018828/21294350) on the architecture.\
          (the above references [`isync`](https://stackoverflow.com/q/43944411/21294350) which probably used at the end to ensure the right context and avoid "intra-process reordering" by [refetching](https://www.ibm.com/docs/en/aix/7.1?topic=set-isync-ics-instruction-synchronize-instruction). I never programmed POWERPC, so I only offer the related reference links and it's not from my experiences).
      
      The above 2 quotes mean same about how drops of synchronization fences occurs. (i.e. `hwsync` by "Store Seq Cst" by `sc` is avoided and only `lwsync` exists)

   from the paper_1:
   > So, if requiring that hb (on SC events) be included in S is **too strong** a condition, what should we require instead?
    - So based on the above, it has the following changes:
       - non-math
          > The essential insight is that, according to either compilation scheme, we know that a **sync fence** will necessarily exist between SC accesses a and b if the hb path from a to b **starts and ends with an sb edge**. Second, if a and b access the **same location**, then the hardware will preserve the ordering anyway.

          See above "[F]" about the sync fence.
          > (S1fix) S must relate any two SC events that are related by hb, **provided** that the hb-path between the two events **either** starts and ends with sb edges, or starts and ends with accesses to the **same location**

          - The above "either" cases plus implied same-thread `sb` (because this won't cause cycle by the program order) are allowed now in c++20 **instead of** the whole `hb` (happens-before).
          - "same location" is implied by synchronization.
       - math
          > (formally: ![](https://latex.codecogs.com/svg.image?%5BE%5E%7Bsc%7D%5D;(sb%5Ccup%20sb;hb;sb%5Ccup%20hb%7C_%7Bloc%7D);%5BE%5E%7Bsc%7D%5D%5Csubseteq%20S), where ![](https://latex.codecogs.com/svg.image?hb%7C_%7Bloc%7D) denotes hb edges between accesses to the same location).
          
          `hb` -> `sb...` (i.e. the total modification order `S` doesn't take the whole `hb` in account now in c++20)
   - how changes make work:\
      After changing, the example pattern `sb;hb` is dropped. (view Figure 3: `S(k,l)` is `sb`) (Specifically to say, `hb=sw`). So the old happens-before `A,C` is **not take in account now** in the total modification order.
      - There are other examples also work after changes, try them if you are interested.

[1]: https://stackoverflow.com/q/73446334/21294350
[2]: https://stackoverflow.com/questions/70554277/what-is-the-significance-of-strongly-happens-before-compared-to-simply-happ
[3]: https://plv.mpi-sws.org/scfix/paper.pdf
[4]: https://en.cppreference.com/w/cpp/atomic/memory_order#Sequentially-consistent_ordering
[5]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0668r5.html
[6]: https://en.cppreference.com/w/cpp/language/eval_order#Ordering