#use command "make main SHELL=cmd"


main: sample1_labtest1_Shuvo.l
	lex sample1_labtest1_Shuvo.l
	gcc lex.yy.c
	a <input.txt> output.txt 


main2: sample2_labtest1_Shuvo.l sample2_labtest1_Shuvo.y
	yacc -d sample2_labtest1_Shuvo.y
	flex sample2_labtest1_Shuvo.l
	gcc sample2_labtest1_Shuvo.tab.c lex.yy.c
	a <input.txt> output.txt