; print "Hello World!"
default rel 

section .data
    message db "Hello World!",10,0 ; Adding 10 - which is the ascii for a new line (\n)

section .text

global _start

_start:
    mov rax, 1 ; The syscall code for write
    mov rdi, 1 ; 1 is for the terminal stdout - where the message should be printed
    lea rsi, [message]
    mov rdx, 13 ; Including the '10' as a byte - 12 + 1
    syscall

    mov rax, 60 ; Syscall exit
    mov rdi, 0 ; Exit code
    syscall