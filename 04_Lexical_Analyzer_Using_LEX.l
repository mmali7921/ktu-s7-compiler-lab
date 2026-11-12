
%{
#include <stdio.h>
#include <string.h>

char na[100][100], oa[100][100], ka[100][100],
     ia[100][100], ha[100][100];

int n = 0, o = 0, k = 0, i = 0, h = 0;
int a, b, c, d, e;
%}

NU  [0-9]+|[0-9]+"."[0-9]+

OP  "+"|"-"|"/"|"<"|">"|"="|"!"

KE  "int"|"float"|"double"|"char"|"if"|"else"|"switch"|"break"|"continue"|"default"|"do"|"while"|"for"|"return"

ID  [a-zA-Z][a-zA-Z0-9]*

HF  "#include"[\t]*"<".*">"

%%

{HF}    { strcpy(ha[h], yytext); h++; }
{OP}    { strcpy(oa[o], yytext); o++; }
{KE}    { strcpy(ka[k], yytext); k++; }
{NU}    { strcpy(na[n], yytext); n++; }
{ID}    { strcpy(ia[i], yytext); i++; }

[ \t\n]+    ;
.           ;

%%

int main()
{
    yyin = fopen("01_Input_Lexical_Analyzer.c", "r");

    if (yyin == NULL)
    {
        printf("Cannot open input file\n");
        return 1;
    }

    yylex();

    printf("\nHeader Files:\n");
    for (a = 0; a < h; a++)
        printf("%s\n", ha[a]);

    printf("\nOperators:\n");
    for (b = 0; b < o; b++)
        printf("%s\n", oa[b]);

    printf("\nKeywords:\n");
    for (c = 0; c < k; c++)
        printf("%s\n", ka[c]);

    printf("\nIdentifiers:\n");
    for (d = 0; d < i; d++)
        printf("%s\n", ia[d]);

    printf("\nNumbers:\n");
    for (e = 0; e < n; e++)
        printf("%s\n", na[e]);

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}

