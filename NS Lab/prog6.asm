.686 
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
msg1fmt byte "%s", 0Ah, 0
msg2fmt byte "%d", 0Ah, 0

msg1 byte "Enter the number: ", 0
msg2 byte "Answer: ", 0

in1fmt byte "%d", 0

val1 dword ?
val2 dword ?
answer dword ?


.code 
main proc
    INVOKE printf, ADDR msg1fmt, ADDR msg1
    INVOKE scanf, ADDR in1fmt, ADDR val1

    INVOKE printf, ADDR msg1fmt, ADDR msg1
    INVOKE scanf, ADDR in1fmt, ADDR val2

    push val2
    push val1
    call AddTwo
    pop val1
    pop val2
    ret
main ENDP

AddTwo proc
    push ebp
    mov ebp, esp
    mov eax, [ebp+12]
    add eax, [ebp+8]
    mov answer, eax
    INVOKE printf, ADDR msg1fmt, ADDR msg2
    INVOKE printf, ADDR msg2fmt, answer
    pop ebp
    ret
AddTwo ENDP
 
END main