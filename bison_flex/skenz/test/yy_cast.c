/*
view 
*/
#include <stdio.h>
#define YY_CAST(Type, Val) ((Type) (Val))
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_FILE_SEPARATOR = 3,             /* FILE_SEPARATOR  */
  YYSYMBOL_COMMA = 4,                      /* COMMA  */
  YYSYMBOL_ID = 5,                         /* ID  */
  YYSYMBOL_S = 6,                          /* S  */
  YYSYMBOL_COLON = 7,                      /* COLON  */
  YYSYMBOL_ARROW = 8,                      /* ARROW  */
  YYSYMBOL_INTEGER = 9,                    /* INTEGER  */
  YYSYMBOL_LETTER = 10,                    /* LETTER  */
  YYSYMBOL_ISBN = 11,                      /* ISBN  */
  YYSYMBOL_LI = 12,                        /* LI  */
  YYSYMBOL_LS = 13,                        /* LS  */
  YYSYMBOL_BO = 14,                        /* BO  */
  YYSYMBOL_AV = 15,                        /* AV  */
  YYSYMBOL_SO = 16,                        /* SO  */
  YYSYMBOL_DATE = 17,                      /* DATE  */
  YYSYMBOL_SC = 18,                        /* SC  */
  YYSYMBOL_YYACCEPT = 19,                  /* $accept  */
  YYSYMBOL_file = 20,                      /* file  */
  YYSYMBOL_writer_section = 21,            /* writer_section  */
  YYSYMBOL_writer = 22,                    /* writer  */
  YYSYMBOL_book_list = 23,                 /* book_list  */
  YYSYMBOL_book = 24,                      /* book  */
  YYSYMBOL_collocation = 25,               /* collocation  */
  YYSYMBOL_lit_gen = 26,                   /* lit_gen  */
  YYSYMBOL_user_section = 27,              /* user_section  */
  YYSYMBOL_user = 28,                      /* user  */
  YYSYMBOL_loan_list = 29,                 /* loan_list  */
  YYSYMBOL_loan = 30                       /* loan  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;
int yychar;
#define YYMAXUTOK   273
#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#endif
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18
};
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)
int main(){
	yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  int start = 258;
	for (; start<258+5; start++) {
    yytoken = YYTRANSLATE (start);
    printf("%d\n", yytoken);
  }
}
