
%{
#include <stdio.h>
%}

%token A B NL

%%

S : A B
  | A S B
  ;

%%

int main()
{
    printf("Enter the string:\n");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Invalid string\n");
    return 0;
}

