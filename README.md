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
## [More](https://teachyourselfcs.com/) to read from [this](https://news.ycombinator.com/item?id=22286340)
- In "What about AI/graphics/pet-topic-X?" it recommends 3 topics although I don't plan to learn them.
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