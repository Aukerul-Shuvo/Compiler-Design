.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data 
a sdword 10
count sdword 0

.code 
main proc

    mov a, 0

    FOR_:
        cmp a, 10
        jge EXIT_
        cmp a, 5
        je IF_
        cmp a, 7
        jge ELSEIF_
        jmp ELSE_

    jmp EXIT_

    IF_:
        add count, 1
        inc a 
        jmp FOR_
    ELSEIF_:
        mov eax, a
        mov [count], eax
        inc a 
        inc a 
        jmp FOR_
    ELSE_:
        mov eax, a
        mov [count], eax
        dec a
        inc a 
        jmp FOR_

    EXIT_:
        ret

main endp
end