%option header-file="lex.yy.h"
%option noyywrap
 
%top{
  /* This goes at the top of the generated file */
  #include "parser.tab.h"
}
isbn [0-9]{2}-[0-9]{2}-[0-9a-fA-F]{5}-[0-9a-fA-Z]
id \"[A-Za-z0-9 .,:]+\"
date {day}\/{month}\/{year}
day 0[1-9]|[1-2][0-9]|3[0-1]
month 0[1-9]|1[0-2]
year [0-9]{4}
%%
AV {return AV;}
BO {return BO;}
SO {return SO;}
LI {return LI;}
LS {return LS;}
[A-Z][A-Z]* {return LETTER;}
[0-9][0-9]* {return INTEGER;}
{isbn} {return ISBN;}
{id} {return ID;}
{date} {return DATE;}
"->" {return ARROW;}
, {return COMMA;}
; {return SC;}
: {return COLON;}
"%%" {return FILE_SEPARATOR;}
"\n"|"\r"|("\r\n") {;}
. {;}
