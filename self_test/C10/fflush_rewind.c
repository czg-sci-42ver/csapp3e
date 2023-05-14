/* https://stackoverflow.com/questions/24903442/i-o-between-input-and-output-in-c-programme */
#include <stdio.h>
int main() {
    FILE *file_p = fopen("new.txt", "r+");
    char buf[1024];
    char *str;

    fputs("hongkong\n", file_p);
    fputs("shanghai\n", file_p);

    fflush(file_p);

    fputs(fgets(buf, 1024, file_p), stderr);

    fclose(file_p);
    return 0;
}
