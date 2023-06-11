#### TODO
- use [qverilog](https://tenthousandfailures.com/blog/2014/6/8/display-monitor-and-strobe-in-systemverilog#:~:text=The%20Difference%20Between%20Strobe%20and%20Display&text=The%20operand%20%24display%20works%20just,executes%20once%20per%20time%20unit.) in questasim, maybe [this](https://wiki.archlinux.org/title/Intel_Quartus_Prime)
- learn systemverilog with `always_ff`,etc
- [Verilator](https://www.embecosm.com/appnotes/ean6/embecosm-or1k-verilator-tutorial-ean6-issue-1.html)
- `PULLUP` in verilog same as meaning in circuits?
- [monitor array](https://www.edaplayground.com/x/2527) like memory conveniently in Systemverilog
- how to [dump memory](https://stackoverflow.com/questions/20317820/icarus-verilog-dump-memory-array-dumpvars), at least to dump [element](https://sourceforge.net/p/iverilog/bugs/829/) of memory
  - how to run this [EDA playground](https://www.edaplayground.com/s/4/520)
  - workaround: just use some wire to view in simulator like gtkwave...
    - or [write](https://stackoverflow.com/questions/75926901/dumping-a-2d-register-array-into-a-text-file) to file
- try using [struct](https://stackoverflow.com/questions/25396647/understanding-function-return-values) as return of function
## blog
### verilog
- [chipverify](https://www.chipverify.com/verilog/verilog-generate-block) (also have [systemverilog](https://www.chipverify.com/systemverilog/systemverilog-tutorial) version)
- [asci-world](http://www.asic-world.com/tidbits/blocking.html)
- manual [recommended](https://iverilog.fandom.com/wiki/FAQ#:~:text=Verilog%20has%20a%20standard%20dump,and%20below%20the%20test%20module.)
- [fpgatutorial](#fpga)
- [xilinx](https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/Verilog-Macros)
- basic [doc](https://verilogams.com/quickref/basics.html)
- TODO try [online](https://www.edaplayground.com/x/5gGE)
## verilog
- [generate](https://www.chipverify.com/verilog/verilog-generate-block) ~~used to init *hardware* based on parameter po. (no influence to vvp program running)~~ usde to initiate multiple *modules*
- display [based on change](https://stackoverflow.com/a/33653849/21294350), similar to monitor.
- must use [`dumpvars`](https://peterfab.com/ref/verilog/verilog_renerta/mobile/source/vrg00056.htm) with `dumpfile` to choose variables to dump, [example](https://mohduzir.uitm.edu.my/digital/Using%20Icarus%20Verilog.pdf)
  - better use [lxt2](https://iverilog.fandom.com/wiki/GTKWave)
- [`timescale`](https://www.chipverify.com/verilog/verilog-timescale) just influence how unit *shown*, not influence how the simulator run.(i.e. the running speed), 'delay specifications in the design are not synthesizable and *cannot be converted* to hardware logic.'
  - so better use `$finish` to control
- task [vs](https://fpgatutorial.com/verilog-function-and-task/) function <a id="fpga"></a>
- recommended [workflow](https://raveeshagarwal.medium.com/free-and-simple-verilog-simulation-1-first-run-1c4cbbb66de5), [similar](https://medium.com/macoclock/running-verilog-code-on-linux-mac-3b06ddcccc55).
  - compiler [comparison](https://hackernoon.com/top-4-hdl-simulators-for-beginners)
    - also [see ‘What Verilator Does’](https://www.veripool.org/verilator/)
  - [ncsim](https://en.wikipedia.org/wiki/List_of_HDL_simulators) not opensource
- macro ['``'](https://www.design-reuse.com/articles/45979/system-verilog-macro-a-powerful-feature-for-design-verification-projects.html) used usually, also similar to [systemverilog](https://www.systemverilog.io/verification/macros/)
- [modulus](https://web.engr.oregonstate.edu/~traylor/ece474/beamer_lectures/verilog_operators.pdf) operator which is not listed in [wikipedia](https://en.wikipedia.org/wiki/Verilog#Operators)
- init array with [for loop](https://stackoverflow.com/questions/29053120/initializing-arrays-in-verilog), maybe unable to directly `= {...}`
  - 'Assignment to an entire array or to an array slice requires SystemVerilog' -> TODO try in SystemVerilog
- [multiple return](http://www.yang.world/podongii_X2/html/TECHNOTE/TOOL/MANUAL/15i_doc/fndtn/ver/ver5_2.htm)
### error debug
- `Elaboration task '$display' requires SystemVerilog.`: `display` needs to be something like `module`, many other variable also same. Similar to what [this](https://stackoverflow.com/questions/23272054/prevent-systemverilog-compilation-if-certain-macro-isnt-set) say 'The $display still needs to be inside an always block'
- [`Port declarations without direction error`](https://stackoverflow.com/questions/23037206/port-declarations-without-direction-error), `input a,b` only valid if `a,b` are same size.(i.e. `input a,[4:0]b` is wrong)
- `sd0/sd11`,etc mainly results from variable syntax error. TODO see iverilog source code.
- show weird `zz` maybe: 1. didn't initiate the value at all. 2. [race condition](https://stackoverflow.com/questions/69511094/why-are-the-bits-in-this-verilog-wire-assigned-as-z)