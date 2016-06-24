#include <stdio.h>

int chars(char *a) {
    char a1;
    char a2;
    char *a_ptr;

    a1 = *a;
    printf("a1: %c\n", a1);

    a2 = a[1];
    printf("a2: %c\n", a2);

    a_ptr = a;
    printf("a_ptr*: %s\n", a_ptr);

    printf("a*: %s\n", a);
}

int ints(int *a) {
    int a1;
    int a2;

    a1 = *a;
    printf("a1: %d\n", a1);

    a2 = *(a + 1);
    printf("a++: %d\n", *(a + 1));
}

main() {
    printf("Begin\n");

    printf("chars\n");
    chars("abc");

    printf("ints\n");
    int my_ints[2] = { 123, 456 };
    ints(my_ints);
}
