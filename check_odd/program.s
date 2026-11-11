; Program to check if the number is even or odd
; Input and convertion of input to integer taken from convert_integer_input/program.s
; Keep the digit to less than 10 digits for simplicity
; exit code would be 1 if odd, else even
; We will be doing this using div instruction in this program

default rel 

section .data
    message db 10 dup ('n')

section .text

global _start

_start:
    mov rax, 0 ; syscall read 
    mov rdi, 0 ; read from stdin (arg0)
    mov rsi, message ; Buffer to read to
    mov rdx, 10 ; Read 10 bytes (inclusive of any '\n' at the end)
    syscall

    mov rcx, 0
    xor rbx, rbx ; Clear out rbx if at it contains any values
    jmp loop

loop:
    movzx rdx, byte [message+rcx] ; This byte will be in ascii - so subtract it by 48 to get the actual digit
    
    ; Conditions for the loop to terminate 
    cmp rdx, 10 ; Also check if that byte is '\n' which has the ASCII 10
    je exit
    cmp rdx, 'n' 
    je exit

    sub rdx, '0'
    imul rbx, 10 
    add rbx, rdx

    cmp rcx, 9
    je exit

    inc rcx
    jmp loop


exit:
    ; Number is stored in rbx
    ; Check if that number is odd

    xor rdx, rdx ; clear out rdx because it would be used in div
    mov rax, rbx
    mov rbx, 2 
    div rbx ; Answer stored in RAX, and reminder stored in RDX

    ; Exit the program

    mov rax, 60
    mov rdi, rdx
    syscall