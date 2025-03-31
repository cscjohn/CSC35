#lab4.asm
#John Vue

.intel_syntax noprefix
.data

CaptainMsg:
        .ascii "Captain, enemy tank detected in the distance! What are your orders?\n\0"

TargetPosition:
        .ascii "Target Position: \0"

Behind:
        .ascii "The round landed BEHIND the enemy.\n\0"

Shorter:
        .ascii "The round landed SHORT of the enemy.\n\0"

KaBoom:
        .ascii "KA-BOOM! The enemy was destroyed!\n\0"

KaBooley:
        .ascii "KA-BOOLEY! The enemy's round blows you and your tank away! You lost.\n\0"

EnemyRound:
        .ascii "The enemy round hits \0"

YardsAway:
        .ascii " yards away!\n\0"

.text
.global Begin

Begin:

        lea rsi, CaptainMsg
        call PrintString

EnemyPosition:

        mov rsi, 100
        call GetRandom          #Gets a random generated number
        add rsi, 1              #Can read 0-100 instead of 0-99
        mov rcx, rsi            #Enemy address
        call PrintInteger       #Prints the Random Number 0-100. Comment this out later


#EnemyDistance:

#       mov rsi, 30
#       call GetRandom          #Gets a random generated number
#       add rsi, 1              #Can read 0-30 instead of 0-29
#       mov rdx, rsi            #Enemy shoots at this position
#       call PrintInteger       #Prints the Random Number 0-30. Comment this out later.

Position:

        lea rsi, TargetPosition
        call PrintString

        call ReadInteger        #User's Input
        mov rbx, rsi            #Stores User's Input
        cmp rbx, rcx            #Compares Stored User Input to Stored enemy address

        jg Farther              #If Stored User Input is greater then jump to Farther Label
                                #Else follows through block of code to Front Label
        je YouWin               #If equal to Stored User Input jumps to YouWin Label

Front:

        lea rsi, Shorter
        call PrintString
        jmp EnemyTurn
        #jmp Position

Farther:

        lea rsi, Behind
        call PrintString
        jmp EnemyTurn
        #jmp Position

EnemyTurn:

        mov rsi, 30
        call GetRandom
        add rsi, 1
        mov rdx, rsi

        mov rax, 100
        sub rax, rdx

        cmp rdx, 0
        jle YouLose
        lea rsi, EnemyRound
        call PrintString

        mov rsi, rax


        call PrintInteger

        lea rsi, YardsAway
        call PrintString


        jmp Position
YouWin:

        lea rsi, KaBoom
        call PrintString
        jmp End

YouLose:

        lea rsi, KaBooley
        call PrintString
        jmp End

End:
        call ExitProgram

