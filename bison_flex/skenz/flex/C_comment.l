%option noyywrap
digit [0-9]
letter [^\n\r\\/:*?"<>|{digit}]
id ({digit}|{letter})+
newLine \n|\r|\r\n
%x comment

%%
({letter}:)?(\\)?({id}\\)*{id}("."{id})? {
  printf("Path Correct: %s\n", yytext);
}
 
.+ {
  printf("Error in path: %s\n", yytext);
}
 
{newLine} {;}
 
"/*" {BEGIN(comment);}
<comment>. {;}
<comment>\n|\r|\r\n {;}
<comment>"*/" { printf("comment end %s\n",yytext);BEGIN(INITIAL);}

%%
int main(int argc, char const *argv[]) {
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}
