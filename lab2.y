%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB EOL
%start cal

%%
cal: NUM ADD NUM EOL {printf("Parsing + Matched");} 
    |NUM SUB NUM EOL {printf("Parsing - Matched");} 
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