#include <stdio.h>

int some_sub(char *a) {
    printf("%s\n", a);
}

main() {
    printf("Begin\n");
    some_sub("...");
}
