#lab8.asm
#John Vue

.intel_syntax noprefix
.data

Name:
        .ascii "My Name is John Vue\n"
MagicWords:
        .ascii "You concentrate hard on the spell and say the magic words...\n"
WakeyWakey:
        .ascii "WakeyWakey\n"
Horcruxes:
        .ascii "Well, that was easy! I guess for Summer Break, I'll hunt for horcruxes!\n"

.text
.global _start

_start:
        mov rax, 1
        mov rdi, 1
        lea rsi, Name
        mov rdx, 20
        syscall

        mov rax, 1
        mov rdi, 1
        lea rsi, MagicWords
        mov rdx, 61
        syscall

        call Wakey
        call Wakey

        mov rax, 1
        mov rdi, 1
        lea rsi, Horcruxes
        mov rdx, 72
        syscall

        call Exit

Wakey:
        mov rax, 1
        mov rdi, 1
        lea rsi, WakeyWakey
        mov rdx, 11
        syscall
        ret

Exit:
        mov rax, 60
        syscall
