#lab1.asm
#John Vue

# 1. Assemble : as -o lab1.o lab1.asm
# 2. Link     : ld -o a.out lab1.o csc35.o
# 3. Execute  : ./a.out

.intel_syntax noprefix          #Use Intel formatting
.data                           #Start the data section
Message:                        #Message is an address
    .ascii "Hello, world!\n\0"  #Create a buffer of ASCII

BeepMessage:
    .ascii "Beep \n\0"

Quote:
    .ascii "The One Piece is Real!\n\0"

BoopMessage:
    .ascii "Boop \n\0"

.text                           #Start the text section
.global Begin                   #Make the Begin label public

Begin:                          #UNIX starts here
    lea rsi, Message            #Put address into rsi
    call PrintString            #Execute the csc35.o subroutine

    lea rsi, BeepMessage
    call PrintString

    lea rsi, Quote
    call PrintString

    lea rsi, BoopMessage
    call PrintString

    call ExitProgram            #Call the csc35.o subroutine
