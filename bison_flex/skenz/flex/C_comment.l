%option noyywrap
digit [0-9]
letter [^\n\r\\/:*?"<>|{digit}]
id ({digit}|{letter})+
newLine \n|\r|\r\n
%x comment

/* notice here comment will match longest '.+' 
https://stackoverflow.com/questions/6736610/order-of-precedence-for-token-matching-in-flex 
run `flex C_comment.l;gcc -o C_comment.o lex.yy.c;./C_comment.o example.txt`
*/

%%

"/*" {BEGIN(comment);printf("comment: ");}
<comment>. {printf("%s",yytext);}
<comment>newLine {;}
<comment>"*/" { printf("comment end %s\n",yytext);BEGIN(INITIAL);}

({letter}:)?(\\)?({id}\\)*{id}("."{id})? {
  printf("Path Correct: %s\n", yytext);
}
 
.+ {
    printf("Error in path: %s\n", yytext);
}
 
{newLine} {;}

%%
int main(int argc, char const *argv[]) {
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}
