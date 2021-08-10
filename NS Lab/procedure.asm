.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data 
msg byte "A =", 0
msg2 byte "B =", 0
msg3 byte "Sum is =", 0
output_msg_format byte "%s %d", 0Ah, 0
input_msg_format byte "%s", 0
input_format byte "%d", 0
result sdword ?
a sdword ?
b sdword ?

.code 
main proc
    INVOKE printf, ADDR input_msg_format, ADDR msg
    INVOKE scanf, ADDR input_format, ADDR a
    push a
    INVOKE printf, ADDR input_msg_format, ADDR msg2
    INVOKE scanf, ADDR input_format, ADDR b
    push b

    call sum_
    pop b 
    pop a 
    ret

main endp

sum_ proc
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, [ebp+12]
    mov [result], eax
    INVOKE printf, ADDR output_msg_format, ADDR msg3, result
    pop ebp
    ret
sum_ endp
end