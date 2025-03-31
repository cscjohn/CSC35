#lab5.asm
#John Vue

.intel_syntax noprefix
.data

WelcomeMsg:
        .ascii "Welcome to Silly Sentences!\n\0"

PlayerANoun:
        .ascii "Player A, enter a noun. Put an article or possessive pronoun before any object>

PlayerAPreposition:
        .ascii "Player A, type in a preposition (hit return for nothing)\n\0"

EnterNoun:
        .ascii "Enter a noun: \0"

EnterPreposition:
        .ascii "Enter a preposition: \0"

PlayerBVerb:
        .ascii "Player B, Enter any verb (except was <or>  were): \0"

PlayerBNoun:
        .ascii "Player B, enter a noun. Put an article or possessive pronoun before any object>

ANoun:
        .space 256

BNoun:
        .space 256

Preposition:
        .space 256

Verb:
        .space 256

YourSentence:
        .ascii "Your sentence is: \n\0"

Space:
        .ascii " \0"

NewLine:
        .ascii "\n\0"

Thecat:
        .ascii "the cat\n\0"

Acat:
        .ascii "a cat\n\0"
Mycat:
        .ascii "my cat\n\0"

Sacramento:
        .ascii "Sacramento\n\0"

.text
.global Begin

Begin:

        lea rsi, WelcomeMsg
        call PrintString

PANoun:

        lea rsi, PlayerANoun
        call PrintString

        lea rsi, Thecat
        call PrintString

        lea rsi, Acat
        call PrintString

        lea rsi, Mycat
        call PrintString

        lea rsi, Sacramento
        call PrintString

EnterNounInput:
        lea rsi, EnterNoun
        call PrintString

        lea rsi, ANoun          #Stores the noun into the noun buffer
        call ReadString

        call ClearScreen

BVerb:
        lea rsi, PlayerBVerb
        call PrintString

        lea rsi, Verb           #Stores in Verb buffer
        call ReadString

        call ClearScreen

APreposition:
        lea rsi, PlayerAPreposition
        call PrintString

EnterPrepositionInput:
        lea rsi, EnterPreposition
        call PrintString

        lea rsi, Preposition    #Stores in Prep Buffer
        call ReadString

        call ClearScreen

PBNoun:
        lea rsi, PlayerBNoun
        call PrintString

        lea rsi, Thecat
        call PrintString

        lea rsi, Acat
        call PrintString

        lea rsi, Mycat
        call PrintString

        lea rsi, Sacramento
        call PrintString

EnterBNounInput:
        lea rsi, EnterNoun
        call PrintString

        lea rsi, BNoun          #Stores in BNoun buffer
        call ReadString

        call ClearScreen

PrintSentence:
        lea rsi, YourSentence
        call PrintString

        lea rsi, ANoun
        call PrintString

        lea rsi, Space
        call PrintString

        lea rsi, Verb
        call PrintString

        lea rsi, Space
        call PrintString

        lea rsi, Preposition
        call PrintString

        lea rsi, Space
        call PrintString

        lea rsi, BNoun
        call PrintString

        lea rsi, NewLine
        call PrintString

End:
        call ExitProgram
