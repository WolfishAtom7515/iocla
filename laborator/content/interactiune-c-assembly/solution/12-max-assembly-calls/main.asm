; SPDX-License-Identifier: BSD-3-Clause

BITS 64
extern printf
extern get_max

section .data
    arr: dd 19, 7, 129, 87, 54, 218, 67, 12, 19, 99
    len: equ $-arr
    pos: dd 0

    print_format: db "max: %u on position:", 10, 0

section .text

global main 

main:
    push rbp
    mov rbp, rsp

    ; Print max.
    mov rdi, print_format
    xor rsi, rsi
    mov esi, 10
    call printf

    leave
    ret
