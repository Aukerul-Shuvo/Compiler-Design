.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1: Ptr Byte, printlist: VARARG
scanf PROTO arg2: Ptr Byte, inputlist: VARARG

.data 
msg byte "Enter count =", 0
msg2 byte "Enter number =", 0
msg3 byte "Summation =", 0
output_msg_format byte "%s %d", 0Ah, 0
input_msg_format byte "%s", 0
input_format byte "%d", 0
count sdword ?
num sdword ?
result sdword 0
rem sdword ?
.code 
main proc

    INVOKE printf, ADDR input_msg_format, ADDR msg
    INVOKE scanf, ADDR input_format, ADDR count
    cmp count, 0
    jle EXIT_
    xor ecx, ecx
    mov ecx, count
    SUM_:
        push ecx
        INVOKE printf, ADDR input_msg_format, ADDR msg2
        INVOKE scanf, ADDR input_format, ADDR num
        mov eax, num
        add [result], eax
        pop ecx
        loop SUM_

    EXIT_:
        INVOKE printf, ADDR output_msg_format, ADDR msg3, result
        ret

main endp
end