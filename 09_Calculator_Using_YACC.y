
%{
#include <stdio.h>
int yylex();
int yyerror();
%}
%token NUMBER NL INVALID
%left '+' '-'
%left '*' '/'
%%
start : E {printf("Result= %d\n",$1);}
      ;

E : NUMBER {$$=$1;}
  | E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E {
        if($3!=0)
        {
            $$=$1/$3;
        }
        else
        {
            printf("divide by zero error");
            YYERROR;
        }
    }
  | '(' E ')' {$$=$2;}
  ;
%%
int main()
{
    printf("Enter the expression: ");
    yyparse();
    return 0;
}
int yyerror()
{
    printf("Invalid expression\n");
    return 1;
}

