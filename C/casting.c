#include <stdio.h>


main() {
    char data[12] = "some string";
    const void *a;

    printf("%s\n", data);

    a = *(const void **)data;
}
