%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB EOL ID SEMI ASSIGN IF LP RP EQUAL LB RB 
%start pro
%left ADD SUB
%%
pro: IF LP exp1 RP LB exp2 RB {printf("parsing matched");}
    ;

exp1: NUM { $$= $1; printf("exp1: NUM %d\n", $$);}
    |exp1 ADD NUM {$$= $1+$3; printf("exp1: exp ADD NUM %d\n", $$);}
    |exp1 SUB NUM {$$= $1-$3; printf("exp1: exp SUB NUM %d\n", $$);}
    |exp1 EQUAL NUM { printf("number condition\n");}
    |ID {printf("Identifier\n");}
    ;
exp2: ID ASSIGN exp1 SEMI
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