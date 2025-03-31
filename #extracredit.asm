#extracredit.asm
#John Vue


.intel_syntax noprefix
.data
Rumor:
        .ascii "What is the rumor?\n"

Charm:
        .ascii "The Muffliato Charm changes it to: \n"

UserInput:
        .space 200

.text
.global _start

_start:

        mov rax, 1
        mov rdi, 1
        lea rsi, [Rumor]        #Prints out whats in Rumor
        mov rdx, 19
        syscall

        mov rax, 6
        call ChangeTextColor
        mov rax, 0
        mov rdi, 0
        lea rsi, [UserInput]    #User Input
        mov rdx, 200
        syscall
        mov rax, 7
        call ChangeTextColor

        mov r12, 0              #Loop

Loop:

        movb al, [UserInput + r12]      #Load next the next letter

        cmp al, 0               #Checks the end of the string
        je Done

        cmp al, 'A'             #Checks if the letter is uppercase

        jl NextLetter           #Jumps to NextLetter if its not an upppercase letter

        cmp al, 'Z'
        jg NextLetter

        add al, 32              #Converts uppercase letter to lowercase

        movb [UserInput + r12], al      #Store the letter that has been converted back

NextLetter:

        add r12, 1              #Moves to the next letter
        jmp Loop                #If not repeats the loop

Done:

        mov rax, 1
        mov rdi, 1
        lea rsi, [Charm]        #Prints out Charm
        mov rdx, 36
        syscall

        mov rax, 1
        mov rdi, 1
        lea rsi, [UserInput]    #Prints the converted input
                                #Should be 31 letters/characters long
        mov rdx, 31
        syscall

        mov rax, 60             #call Exit
        syscall
