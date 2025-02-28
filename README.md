Delete Q1 (maybe my english comprehension is clumsy. The wikipedia doesn't mean CC is opposite of )
# csapp3e
Source code from [*Computer Systems: A Programmer's Perspective*, 3rd Edition](http://csapp.cs.cmu.edu/3e/home.html) (2015) by [Randal E. Bryant](http://www.cs.cmu.edu/~bryant) and [David R. O'Hallaron](http://www.cs.cmu.edu/~droh).
I read global edition although with small errors in that book.
## book code location
- Figure 12.26: `rw1.c`.
##  [two's complement](https://en.wikipedia.org/wiki/Two%27s_complement#Theory)(where also says term origin 'The 'two' in the name' and one's complement 'all 1s') also see p132
## miscs
- round to zero -> keep negative number division similar behavior as its absolute (i.e. abs(-5/4)=5/4)
### tools
- pdf [OCR](https://tools.pdf24.org/en/ocr-pdf)
  - [This](https://avepdf.com/pdf-ocr) is better but it has the timeout limit.
- libgen 1k file torrent part search using [aria `aria2c --show-files ~/Downloads/r_963000.torrent | grep 13`](https://github.com/aria2/aria2/issues/843) or TODO by [calibre](https://www.reddit.com/r/libgen/comments/lxt7gu/ive_got_1000_books_now_what/)
  - or [this calibre search](https://www.reddit.com/r/Piracy/comments/wq03z7/a_calibre_plugin_that_allows_you_to_search_for/)
#### how to find books
- Use [annas](https://zh.annas-archive.org/) although it is just one mirror web.
- Use [ebooksworld](https://dl.ebooksworld.ir/books/Artificial.Intelligence.A.Modern.Approach.4th.Edition.Peter.Norvig.%20Stuart.Russell.Pearson.9780134610993.EBooksWorld.ir.pdf)
- zlib notice [not use the scam websites](https://www.reddit.com/r/zlibrary/comments/16xtm67/if_you_cannot_download_any_books_then_youre_on/)
  - TODO I2P
#### SE(Stack Exchange)
- check [MathJax](https://math.stackexchange.com/a/671193/1059606)
#### proofwiki
- some [symbols](https://proofwiki.org/wiki/Symbols:LaTeX_Commands/ProofWiki_Specific) may be needed to in [one line](https://proofwiki.org/wiki/Infinite_Set_has_Countably_Infinite_Subset/Proof_2)
- notice its timeline may be based on [GMT+0](https://24timezones.com/time-zone/gmt)
#### lsp (language server protocal)
- [See](https://microsoft.github.io/language-server-protocol/implementors/servers/)
#### where to find codes
- https://rosettacode.org/wiki/Rosetta_Code
### learning path
- [This](https://metacademy.org/graphs/concepts/deep_belief_networks) from [this](https://sharmaeklavya2.github.io/theoremdep/about.html)
### valuable websites
- [math communitys](https://forum.snap.berkeley.edu/t/derivatives-of-the-busy-beaver-function/13109/2)
- [list](http://www.computersciencestudent.com/) from [this](http://williamstallings.com/OperatingSystems/OS9e-Student/) [read](https://stackoverflow.com/search?q=user%3A1131904+operating) by favq
### github
- its code search is [not very good](https://www.reddit.com/r/github/comments/t6w4km/comment/hze0msr/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button).
### interesting community
- [icourse ustc](https://icourse.club/)
## [More](https://teachyourselfcs.com/) to read (from [this](https://news.ycombinator.com/item?id=22286340))
- In "What about AI/graphics/pet-topic-X?" it recommends 3 topics although I don't plan to learn them.
- For the starting language, C++ is [fine](https://stackoverflow.com/a/713735/21294350)
  > I found myself actually not starting with C++... because I showed them *BF* first.
  > An experienced C++ coder can do e.g. *Java* at full speed in a matter of weeks.
  > But if you build on a foundation of C++, you will always be on a *secure* footing.
  - [Stop Teaching C](./references/Stop%20Teaching%20C%20-%20Kate%20Gregory%20-%20CppCon%202015.pptx) just means C should be one prerequisite of C++
    > Just because you can learn C++ as an add-on to C doesn’t mean those who know neither should learn C first
  - [compared with rust](https://users.rust-lang.org/t/is-it-a-good-idea-to-learn-rust-as-a-first-language/46476) (although most is about C)
    > The difference is in C you often don't find the mistake until you run the program and trigger a bug, where Rust would have *pointed it out to you with extremely detailed error messages* and suggested a fix.
    - The discussion between gbutler69 and ZiCog [strays](https://users.rust-lang.org/t/is-it-a-good-idea-to-learn-rust-as-a-first-language/46476/14)
    - Also said by [this "编译器"](https://ramsayleung.github.io/zh/post/2023/rspotify_%E4%B8%80%E4%B8%AA%E7%94%A8%E7%88%B1%E5%8F%91%E7%94%B5%E4%BA%94%E5%B9%B4%E7%9A%84%E5%BC%80%E6%BA%90%E9%A1%B9%E7%9B%AE/) (We can use translate to read this)
      > 我*用C++已经混了三年的饭吃*了，但还只能看到C++的门槛，没法说入了C++的门。
      > 
      > 同理，虽然距离我学习Rust已经过去6年了，我*依然感觉我还不会Rust，都是编译器教我写代码*。
    - > And very important, something I read earlier on my career on Stroustrup’s book : focus on programming techniques, not language features.
      [see](https://www.stroustrup.com/bs_faq.html)
      > Focus on concepts and techniques rather than language-technical details.
    - 
## most of notes in this [md](./asm/README.md)
> how do I know [csapp](https://www.zhihu.com/question/19627054?utm_id=0)
## exercises
- This is the 1st time I self-study one CS book. I wrote notes of those exercises with solutions in the book in one *paper notebook* which is already *lost*. Although it is a pity, I have learnt from all these exercises.
## TODO
https://www.cs.cmu.edu/~213/index.html and homework https://github.com/exajobs/university-courses-collection?tab=readme-ov-file 18-447
> Grading	Composed from total lab performance (50%), total written assignment performance (20%) and final exam performance (30%).
- do all labs (at least [those in 15-213](https://www.cs.cmu.edu/~213/labs.html))
  Read [style including *GIT*](https://www.cs.cmu.edu/~213/codeStyle.html), https://www.cs.cmu.edu/~213/faq.html
  - TODO 
    - Cord Lab, Shark File System are not in [the official list](https://csapp.cs.cmu.edu/3e/labs.html)
    - "Malloc (*checkpoint*)" meaning
  - Buffer Lab, Architecture Lab, Architecture Lab (Y86), Performance Lab  are dropped in 15-213
- From [syllabus (I give one brief reading based on headings)](https://www.cs.cmu.edu/~213/syllabus/syllabus.pdf)
  > The only graded assignments in this class will be a set of eight labs and a set of eleven *written assignments*.
  But I [can't access written assignments](https://www.cs.cmu.edu/~213/assignments.html). Part of them are [here](https://www.studocu.com/en-us/document/carnegie-mellon-university/introduction-to-computer-systems/written-assignment-7-solutions-1/21912728?origin=course-trending-7) needing VIP to full view (probably also for [this](https://www.coursehero.com/file/106613346/WA7pdf/))

  maybe [due to](https://www.cs.cmu.edu/afs/cs/academic/class/15213-s12/www/assignments.html)
  > Sharing written assignments or exams: Looking at, copying, or supplying an assignment or exam.
- I skipped [sample exams](https://www.cs.cmu.edu/~213/exams.html).
- To read
  - https://csapp.cs.cmu.edu/3e/students.html Chapter ...
# code review
- Skip `12_19.c` (I don't remember the logic of that buggy codes).
# log
- I updated something all to something like `hervey` except for files in `.git,Windows.vim,*.pem,RECORD,*.reg,*.ipynb,*.code-workspace,*.eps,flypy_phrase.dict.yaml`
  - `*.code-workspace` needs updates.