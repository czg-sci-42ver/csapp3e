%{
  /* This is the prologue section. This code goes
  on the top of the parser implementation file. */
  #include <stdio.h>
  extern int yyerror(char *message);
  extern int yylex(void);
  /* https://stackoverflow.com/questions/50821203/how-can-i-debug-my-flex-bison-grammar with `--debug` */
  #ifdef YYDEBUG
  // yydebug = 1;
  #endif
%}
 
/* Declarations of terminals */
%token  FILE_SEPARATOR COMMA ID S COLON 
        ARROW INTEGER LETTER ISBN LI LS
        BO AV SO DATE SC;
 
%%
/* Grammar rules */
file: writer_section FILE_SEPARATOR user_section
{printf("File correctly parsed.\n");};
writer_section: writer_section writer| writer;
writer: ID ARROW book_list SC;
book_list: book_list COMMA book | book;
book: ISBN COLON ID COLON INTEGER COLON collocation;
collocation:  /* Optional */
            | lit_gen INTEGER LETTER
            | lit_gen INTEGER;
lit_gen: LI AV | LI SO | LS AV | LS SO | LS BO;
user_section: user_section user | user;
user: ID COLON loan_list SC;
loan_list: loan_list COMMA loan | loan;
loan: DATE ISBN
