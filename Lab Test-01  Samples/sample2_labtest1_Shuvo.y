%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%token NUM FNUM ADD SUB EOL ID SEMI ASSIGN IF LP RP EQUAL LB RB DOUBLE MAIN FLOAT INT WHILE
%start pro
%left ADD SUB
%%
pro: INT MAIN LP RP LB FLOAT exp2 INT exp2 WHILE LP number RP LB exp2 RB RB {printf("parsing matched");}
    ;

exp2: ID ASSIGN exp1 SEMI
    ;
exp1: number 
    |exp1 ADD number 
    |exp1 SUB number  
    |exp1 ADD ID 
    |exp1 SUB ID
    |ID 
    ;

number: NUM
        |FNUM
        ;
%%

int main()
{
    printf(">");
    yyparse();
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}