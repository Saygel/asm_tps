section .data
    number db '1337', 0xA 

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, number
    mov edx, 5
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80