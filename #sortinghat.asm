#sortinghat.asm
#John Vue
.intel_syntax noprefix
.data

Welcome:
        .ascii "Welcome to Hogwarts!\n\0"
WelcomeMessage:
        .ascii "The Sorting Hat is being placed upon your head\n\0"
Question1:
        .ascii "Do you desire to have (p)ower or to be (c)reative?\n\0"
Question2:
        .ascii "Do you find contentment in (k)nowledge or (f)riends & community?\n\0"
Question3:
        .ascii "Do you wish to do this for (y)ourself or (o)thers?\n\0"
People:
        .ascii "Hufflepuff\n\0"
Knowledge:
        .ascii "Ravenclaw\n\0"
Others:
        .ascii "Gryffindorr\n\0"
Yourself:
        .ascii "Slytherin\n\0"




.text
.global _start

_start:
        lea rax, Welcome
        call PrintString

        lea rax, WelcomeMessage
        call PrintString

QuestionOne:
        lea rax, Question1
        call PrintString
        call ScanChar
        cmp al, 112             #ascii table lowercase p
        je QuestionThree
        cmp al, 99              #ascii table lowercase c
        je QuestionTwo
        jmp QuestionOne
QuestionThree:
        lea rax, Question3
        call PrintString
        call ScanChar
        cmp al, 121             #ascii table lowercase y
        je AnswerY
        cmp al, 111             #ascii table lowercase o
        je AnswerO
        jmp QuestionThree

AnswerY:
        lea rax, Yourself
        call PrintString
        call Exit

AnswerO:
        lea rax, Others
        call PrintString
        call Exit
QuestionTwo:
        lea rax, Question2
        call PrintString
        call ScanChar
        cmp al, 107             #ascii table lowercse k
        je AnswerK
        cmp al, 102
        je AnswerF              #ascii table lowercase f
        jmp QuestionTwo

AnswerK:
        lea rax, Knowledge
        call PrintString
        call Exit
AnswerF:
        lea rax, People
        call PrintString
        call Exit
