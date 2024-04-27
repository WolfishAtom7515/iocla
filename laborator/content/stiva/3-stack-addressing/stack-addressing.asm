%include "printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov dword [esp] ,ecx
    loop push_nums

    sub esp, 4
    mov dword [esp] , 0

    sub esp, 4
    mov dword [esp] ,"mere"

    sub esp, 4
    mov dword [esp] ,"are"

    sub esp, 4
    mov dword [esp] ,"Ana"

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov eax, ebp
dict:    
    ; TODO 3: print the string
    PRINTF32 `%x -> %x\n\x0`, eax, [eax]
    sub eax, 4
    cmp eax, esp
    jge dict


    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
