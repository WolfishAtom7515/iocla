; SPDX-License-Identifier: BSD-3-Clause

BITS 64
section .text

global get_max

get_max:
    push rbp
    mov rbp, rsp

    ; Assuming rsi holds the address of the array, rdx holds the array size, and rcx holds the fourth argument
    
    xor r8, r8            ; Initialize r8 to zero
    mov r9, rsi           ; Copy the address of the array to r9
    mov r10, rdx          ; Copy the array size to r10

    ; Loop through the array and print each element
print_loop:
    mov rdi, print_format  ; Load the format string into rdi
    xor rsi, rsi           ; Clear rsi
    mov rsi, [r9 + 8 * r8] ; Load the current element into rsi
    call printf            ; Call printf
    inc r8                 ; Increment the index
    cmp r8, r10            ; Compare the index with the array size
    jl print_loop          ; Jump to print_loop if the index is less than the array size

    leave                  ; Clean up the stack frame
    pop rbp                ; Restore the previous stack frame
    ret                    ; Return from the function
