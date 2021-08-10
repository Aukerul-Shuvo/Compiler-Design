.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1: Ptr Byte, printlist: VARARG
scanf PROTO arg2: Ptr Byte, inputlist: VARARG

.data 
msg byte "Input =", 0
msg2 byte "Vowel ", 0
msg3 byte "Consonent ", 0
output_msg_format byte "%s %c", 0Ah, 0
input_msg_format byte "%s", 0
input_format byte "%c", 0
number sdword ?
num1 sdword ?
num2 sdword ?
.code 
main proc
    INVOKE printf, ADDR input_msg_format, ADDR msg
    INVOKE scanf, ADDR input_format, ADDR num1
    mov eax, [num1]
    cmp eax, 'a'
    je vow_
    cmp eax, 'e'
    je vow_
    cmp eax, 'i'
    je vow_
    cmp eax, 'o'
    je vow_
    cmp eax, 'u'
    je vow_
    cmp eax, 'A'
    je vow_
    conso_:
        INVOKE printf, ADDR output_msg_format, ADDR msg3, num1
        jmp ret_
    vow_:
        INVOKE printf, ADDR output_msg_format, ADDR msg2, num1
    ret_:
        ret

main endp
end