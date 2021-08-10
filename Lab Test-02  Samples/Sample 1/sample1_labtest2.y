%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
    
	extern int lineno;
	extern int yylex();
%}
%token INT IF ELSEIF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR MAIN ICONST FCONST CCONST ID FOR INCR DECR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT EGT ELT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%left ADDOP SUBOP
%left MULOP DIVOP
%left LT GT ELT EGT
%left EQUOP INCR DECR
%right ASSIGN
%start main
%%
main: type MAIN LPAREN RPAREN LBRACE code RBRACE ;
code: statements;
statements: statements statement | ;
statement:    declaration
            | if_statement
            | ID ASSIGN exp SEMI
            | ID ASSIGN exp
            |exp INCR SEMI
            |exp DECR SEMI 
            | loop
            ;
declaration: type ID SEMI
            |type ID ASSIGN exp SEMI
            ;
type: INT
    | DOUBLE 
    | CHAR 
    ;
exp: ID
    |constant
    |exp INCR
    |exp DECR
    |exp ADDOP exp
    |exp SUBOP exp
    |exp MULOP exp
    |exp DIVOP exp
    |exp GT exp
    |exp LT exp
    |exp EGT exp
    |exp ELT exp
    |exp EQUOP exp
    |LPAREN exp RPAREN
    ;
constant: ICONST 
        | FCONST
        | CCONST 
        ;
if_statement: IF LPAREN exp RPAREN tail else_if_statement else_statement;
else_if_statement: ELSEIF LPAREN exp RPAREN tail| ;
else_statement: ELSE tail | ;
loop: FOR LPAREN statements exp SEMI statements RPAREN tail;
tail: LBRACE statements RBRACE;

%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}