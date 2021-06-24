#use command "make main SHELL=cmd"


main: file1.l
	lex file1.l
	gcc lex.yy.c
	a <input.txt> output.txt 


main2: lab2.l lab2.y
	yacc -d lab2.y
	flex lab2.l
	gcc lab2.tab.c lex.yy.c
	a <input.txt> output.txt