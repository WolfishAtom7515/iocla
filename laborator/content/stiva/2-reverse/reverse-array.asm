%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:
    ; TODO push the elements of the array on the stack
    push ARRAY_LEN
    pop ecx
s_push:
    push dword [input + (ecx - 1) * 4]
    loop s_push


    ; TODO retrieve the elements (pop) from the stack into the output array
    push ARRAY_LEN
    pop ecx
s_pop:
    pop dword [output+ (ecx - 1) * 4]
    loop s_pop


    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
