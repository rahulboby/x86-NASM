section .text

global _start

_start:
    mov rax, 0
    mov rbx, 0
    jmp loop 

loop:
    inc rax
    inc rbx

    cmp rax, 100000000
    jge exit 
    jmp loop

exit:
    mov rax, 60
    mov rdi, 0
    syscall