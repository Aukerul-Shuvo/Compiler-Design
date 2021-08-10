.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data

.code
main proc
    mov edx, 10 ;a
    mov ebx, 0  ;count 

    cmp edx, 0
    jl EXIT_

FOR_:    
    cmp edx, 10
    jge EXIT_

    cmp edx, 5
    je IF_

    cmp edx, 7
    jge ELSEIF_

    jmp ELSE_

IF_:
    inc ebx
    jmp FOR_

ELSEIF_:
    inc edx
    mov ebx, edx
    jmp FOR_ 

ELSE_:
    dec edx
    mov ebx, edx
    jmp FOR_

EXIT_:
    ret
main endp
end
