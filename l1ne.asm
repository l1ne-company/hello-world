%define SYSCALL_EXIT 60
section .text
global _start
_start:
    mov rax, SYSCALL_EXIT
    xor rdi, rdi        
    syscall
