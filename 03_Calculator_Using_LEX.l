
%{
#include <stdio.h>
#include <stdlib.h>

int op = 0;
float a, b, n, i;

void digit();
%}

digit [0-9]+|[0-9]+"."[0-9]+
add "+"
sub "-"
mul "*"
div "/"
pow "^"
end "\n"

%%
{digit} { digit(); }
{add}   { op = 1; }
{sub}   { op = 2; }
{mul}   { op = 3; }
{div}   { op = 4; }
{pow}   { op = 5; }
{end}   { printf("result is %f", a); printf("\nenter new equation\n"); }
.       { exit(0); }
%%

int main()
{
    printf("enter the equation\n");
    yylex();
}

int yywrap()
{
    return 1;
}

void digit()
{
    if (op == 0)
    {
        a = atof(yytext);
    }
    else
    {
        b = atof(yytext);

        switch (op)
        {
            case 1:
                a = a + b;
                break;

            case 2:
                a = a - b;
                break;

            case 3:
                a = a * b;
                break;

            case 4:
                a = a / b;
                break;

            case 5:
                i = 1;
                n = a;

                while (i < b)
                {
                    a = a * n;
                    i++;
                }
                break;

            default:
                printf("invalid operation\n");
        }

        op = 0;
    }
}

