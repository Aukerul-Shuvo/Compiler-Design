%{
#include <stdio.h>
#include <stdlib.h>
#include "lab2.tab.h"
%}

delim [ \t]
ws ({delim})+
digit [0-9]
number ({digit})+

%%
{ws} { }
{number} {return (NUM);}
"+" {return (ADD);}
"-" {return (SUB);}
\n {return (EOL);}
%%

int yywrap()
{
    
}