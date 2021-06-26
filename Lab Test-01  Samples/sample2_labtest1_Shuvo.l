%{
#include <stdio.h>
#include <stdlib.h>
#include "sample2_labtest1_Shuvo.tab.h"
%}

delim [ \t\n]
ws ({delim})+
digit [0-9]
number ({digit})+
fp [.]
fnumber ({digit})*({fp})(({digit})+)
letter [A-Za-z]
us [_]
letter_ ({us}|{letter})
id ({letter_})({letter_}|{digit})*

%%
{ws} { }
{fnumber} {yylval= atoi(yytext); return (FNUM);}
"double" {return (DOUBLE);}
"main" {return (MAIN);}
"float" {return (FLOAT);}
"int" {return (INT);}
"while" {return (WHILE);}
"if" {return (IF);}
"==" {return (EQUAL);}
"(" {return (LP);}
")" {return (RP);}
"{" {return (LB);}
"}" {return (RB);}
{number} {yylval= atoi(yytext); return (NUM);}
"+" {return (ADD);}
"-" {return (SUB);}

{id} {return (ID);}
";" {return (SEMI);}
"=" {return (ASSIGN);}
%%

int yywrap()
{
    
}