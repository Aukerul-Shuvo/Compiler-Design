.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1: Ptr Byte, printlist: VARARG
scanf PROTO arg2: Ptr Byte, inputlist: VARARG

.data 
msg byte "Voltage =", 0
msg2 byte "Current =", 0
msg3 byte "Resistance =", 0
output_msg_format byte "%s %d", 0Ah, 0
input_msg_format byte "%s", 0
input_format byte "%d", 0
number sdword ?
num1 sdword ?
num2 sdword ?
.code 
main proc
    INVOKE printf, ADDR input_msg_format, ADDR msg2
    INVOKE scanf, ADDR input_format, ADDR num1
    INVOKE printf, ADDR input_msg_format, ADDR msg3
    INVOKE scanf, ADDR input_format, ADDR num2
    mov eax, [num1]
    mul num2

    mov [number], eax
    INVOKE printf, ADDR output_msg_format, ADDR msg, number
    ret

main endp
end