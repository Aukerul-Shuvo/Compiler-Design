; Roll: 1603061
; Qus1: B = 10; Y = 120; A = B + Y + 10; print(A);

.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1: Ptr Byte, printlist: VARARG
scanf PROTO arg2: Ptr Byte, inputlist: VARARG

.data 
msg byte "A= ", 0

output_msg_format byte "%s %d", 0Ah, 0
input_msg_format byte "%s", 0
input_format byte "%d", 0
B sdword 10
Y sdword 120
A sdword ?
.code 
main proc
    
    mov eax, B 
    add eax, Y
    add eax, 10
    mov [A], eax
    INVOKE printf, ADDR output_msg_format, ADDR msg, A 
    ret

main endp
end