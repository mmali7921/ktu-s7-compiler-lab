
%{
#include <stdio.h>

int lines = 0, chars = 0, words = 0;
%}

%%
\n              { lines++; chars++; }
[ \t]+         { chars += yyleng; }
[^ \t\n]+      { words++; chars += yyleng; }
%%

int main()
{
    yylex();

    printf("\nLines = %d\n", lines);
    printf("Chars = %d\n", chars);
    printf("Words = %d\n", words);

    return 0;
}

int yywrap()
{
    return 1;
}
