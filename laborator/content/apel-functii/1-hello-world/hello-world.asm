%include "../utils/printf32.asm"

section .data
    msg db 'Hello, world!', 0
    sec_msg db 'Go Yummy, GO!', 0

section .text

extern puts
global main
main:
    push ebp
    mov ebp, esp

    push sec_msg
    call puts
    add esp, 4

    leave
    ret
