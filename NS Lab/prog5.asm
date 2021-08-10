; x86 - 32 bit assembly
; x86_64 - 64 bit assembly
; ax = 16 bits
; eax = 32 bits 
; rax = 64 bits
.686 ; Pentium or below processor
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_msg1_format byte "%s", 0Ah, 0
output_msg3_format byte "%d", 0Ah, 0

output_msg1 byte "Enter the count: ", 0
output_msg2 byte "Enter the number: ", 0
output_msg3 byte "Sum: ", 0

input_format byte "%d", 0
number sdword ?
sum sdword 0
count sdword ?


.code 
main proc
    INVOKE printf, ADDR output_msg1_format, ADDR output_msg1
    INVOKE scanf, ADDR input_format, ADDR count
    
    mov ebx, 0    
    ;mov edx, count

LOOP_: 
    cmp count, 0 
    je EXIT_

    INVOKE printf, ADDR output_msg1_format, ADDR output_msg2
    INVOKE scanf, ADDR input_format, ADDR number

    ;mov eax, number
    add ebx, [number]

    ;dec ecx
    sub count, 1
    jmp LOOP_

EXIT_:
    mov sum, ebx
    INVOKE printf, ADDR output_msg1_format, ADDR output_msg3
    INVOKE printf, ADDR output_msg3_format, sum

    ret
main endp
end
