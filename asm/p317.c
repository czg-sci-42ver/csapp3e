#include <stdio.h>
char *gets(char *s)

{
  int c;

  char *dest = s;

  while ((c = getchar()) != '\n' && c != EOF) {
    *dest++ = c;
    printf("%d\n",c);
  }
  if (c == EOF && dest == s) /* No characters read */
    return NULL;
  *dest++ = '\0'; /* Terminate string */
  return s;
}
/* Read input line and write it back */
void echo() {
  char buf[8]; /* Way too small! */
  gets(buf);
  puts(buf);
}
int main(){
    echo();
}