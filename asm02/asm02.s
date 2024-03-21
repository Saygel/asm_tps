section .data
    message db '1337', 0xA  
    msg_len equ $ - message  

section .text
    global _start

_start:
    mov rdi, [rsp]          
    cmp rdi, 2              
    jne .exit_failure       

    mov rsi, [rsp + 16]     
    movzx rax, word [rsi]   
    cmp ax, '42'            
    jne .exit_failure       

   
    mov rax, 1           
    mov rdi, 1             
    mov rsi, message       
    mov rdx, msg_len       
    syscall                 

    ; Sortir avec succès
    mov rax, 60             
    xor rdi, rdi            
    syscall                 

.exit_failure:
    mov rax, 60             
    mov rdi, 1              
    syscall               