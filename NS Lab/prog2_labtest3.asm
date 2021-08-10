;Roll: 1603061
;Qus2: int main() { int i = 1 ; int j = 1; while (i<10) { j = j * i; i = i + 1;} printf("%d ", i); return 0; }

.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data 
i sdword 1
j sdword 1
output_msg_format byte "%d", 0Ah, 0

.code 
main proc

    WHILE_:
        cmp i, 10
        jge EXIT_
        mov eax, [j]
        mul i
        add i, 1
        jmp WHILE_
    jmp EXIT_
    EXIT_:
        INVOKE printf, ADDR output_msg_format, i
        ret

main endp
end