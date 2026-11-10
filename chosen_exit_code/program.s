; We will do it for a one digit user-input for the exit code

default rel

section .data
    buffer db 0; Initialize a byte to get the code

section .text

global _start

_start:

    mov rax, 0x00 ; For syscall read
    mov rdi, 0x00 ; 0 is for the stdin (Where the input should be taken from)
    lea rsi, [buffer] ; have to put byte here to tell the computer how much you want to read from the address
    mov rdx, 0x01 ; How many bytes it has to read from the input source (max)
    syscall

    mov rax, 0x3c ; Exit syscall number 60 in hex
    movzx rdi, byte [buffer] ; Exit code received from the user
    sub rdi, 48
    syscall
    