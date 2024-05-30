#include <stdio.h>

void helper(void *a, void *b);

int main() {
    helper(0x2a, 0x58);
    return 0;
}