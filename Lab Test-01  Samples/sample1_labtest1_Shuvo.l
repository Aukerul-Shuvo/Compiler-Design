%{
#include <stdio.h>
#include <stdlib.h>

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
{fnumber} {printf("%s = is a floating point number\n", yytext);}
"double" {printf("%s = is a TypeSpecifier\n", yytext);}
"main" {printf("%s = is a Keyword\n", yytext);}
"float" {printf("%s = is a TypeSpecifier\n", yytext);}
"int" {printf("%s = is a TypeSpecifier\n", yytext);}
"while" {printf("%s = is a Keyword\n", yytext);}
"if" {printf("%s = is a Keyword\n", yytext);}
"==" {printf("%s = is EQUAL OPERATOR\n", yytext);}
"(" {printf("%s = is first bracket open\n", yytext);}
")" {printf("%s = is second bracket close\n", yytext);}
"{" {printf("%s = is second bracket open\n", yytext);}
"}" {printf("%s = is second bracket close\n", yytext);}
{number} {printf("%s = is an integer number\n", yytext);}
"+" {printf("%s = is an ADD OPERATOR\n", yytext);}
"-" {printf("%s = is an SUB OPERATOR\n", yytext);}

{id} {printf("%s = is an SUB IDENTIFIER\n", yytext);}
";" {printf("%s = is a SEMICOLON\n", yytext);}
"=" {printf("%s = is an ASSIGN OPERATOR\n", yytext);}
. {printf("Matched Nothing\n", yytext);}
%%

int main()
{
    yylex();
}
int yywrap()
{
    
}