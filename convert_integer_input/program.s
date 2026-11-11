; The input from the user using the syscall read (No. 0) is done as a string - list of bytes (chars)
; This program implements the convertion of this string to an integer assuming the user has intered a valid integer
; Convert, store it in a register (maybe something like rcx or r8) then print it using syscall write (No. 1)
; Works for up to a 9 digit number
default rel 

section .data
    message db 10 dup ('n')

section .text

global _start

_start:
    ; Get the user input number - set maximimum length of the number as 9 (Keeping it small for simplicity)
    mov rax, 0 ; syscall read 
    mov rdi, 0 ; read from stdin (arg0)
    mov rsi, message ; Buffer to read to
    mov rdx, 10 ; Read 10 bytes (inclusive of any '\n' at the end)
    syscall

    ; Now the message address has 10 digits as chars
    ; Let's use rbx to store the number
    ; Let's use rcx as a helper
    ; Start from the first
    mov rcx, 0
    xor rbx, rbx ; Clear out rbx if at it contains any values
    jmp loop

loop:

    ; Use RCX as the counter for the index
    ; Use RBX to store the converted number
    ; Use RDX to store each digit as a byte with zero extension (to move add to RBX)
    
    movzx rdx, byte [message+rcx] ; This byte will be in ascii - so subtract it by 48 to get the actual digit
    
    ; Conditions for the loop to terminate 
    cmp rdx, 10 ; Also check if that byte is '\n' which has the ASCII 10
    je exit
    cmp rdx, 'n' 
    je exit

    sub rdx, '0'

    imul rbx, 10 ; Multiply the value in rbx, with 10 ; Multiply only if it is a valid digit

    add rbx, rdx

    ; If rcx is 9, jump to exit
    cmp rcx, 9
    je exit

    ; If it did not jump, then increment rcx, then jmp back to loop
    inc rcx ; This is the same as doing `add rcx, 1`
    jmp loop

exit:
    ; Exit the program

    mov rax, 60
    mov rdi, rbx
    syscall