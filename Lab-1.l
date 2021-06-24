%option noyywrap

%{
#include <stdio.h>
%}

%%
("A"|"E"|"I"|"O"|"U"|"a"|"e"|"i"|"o"|"u") {printf("%s = is a Vowel\n", yytext);}
. {printf("%s = is a Consonent\n", yytext);}
%%

int main()
{
    yylex();
}