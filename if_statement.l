%{
#include <stdio.h>
#include <stdlib.h>
#include "if_statement.tab.h"
%}

delim [ \t]
ws ({delim})+
digit [0-9]
number ({digit})+
letter [A-Za-z]
us [_]
letter_ ({us}|{letter})
id ({letter_})({letter_}|{digit})*

%%
{ws} { }
{number} {yylval= atoi(yytext); return (NUM);}
"+" {return (ADD);}
"-" {return (SUB);}
\n {return (EOL);}
{id} {return (ID);}
";" {return (SEMI);}
"=" {return (ASSIGN);}
%%

int yywrap()
{
    
}