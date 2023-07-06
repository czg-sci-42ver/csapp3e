%option noyywrap
digit [0-9]
letter [^\n\r\\/:*?"<>|{digit}]
id ({digit}|{letter})+
newLine \n|\r|\r\n
%%
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
