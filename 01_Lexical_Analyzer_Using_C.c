
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int isSeperator(char ch)
{
    if (ch == ';' || ch == ',' || ch == '{' || ch == '}' ||
        ch == '[' || ch == ']' || ch == '(' || ch == ')' ||
        ch == ' ' || ch == '\n' || ch == '\t')
    {
        return 1;
    }

    return 0;
}

int isOperator(char ch)
{
    if (ch == '+' || ch == '-' || ch == '/' || ch == '*' ||
        ch == '=' || ch == '<' || ch == '>' || ch == '!')
    {
        return 1;
    }

    return 0;
}

int isKeyword(char *str)
{
    char key[32][10] = {
        "int", "char", "double", "float", "for", "while", "do",
        "switch", "break", "continue", "default", "if", "else", "return"
    };

    for (int i = 0; i < 14; i++)
    {
        if (strcmp(str, key[i]) == 0)
        {
            return 1;
        }
    }

    return 0;
}

int main()
{
    FILE *fp;
    char ch;

    fp = fopen("input.c", "r");

    if (fp == NULL)
    {
        printf("cant open the file");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF)
    {
        if (isSeperator(ch))
        {
            printf("<Seperator, %c>\n", ch);
        }

        else if (isOperator(ch))
        {
            printf("<Operator, %c>\n", ch);
        }

        else if (isdigit((unsigned char)ch))
        {
            char num[20];
            int k = 0;

            do
            {
                num[k++] = ch;
                ch = fgetc(fp);
            }
            while (ch != EOF && isdigit((unsigned char)ch));

            num[k] = '\0';

            if (ch != EOF)
            {
                ungetc(ch, fp);
            }

            printf("<Number, %s>\n", num);
        }

        else if (isalpha((unsigned char)ch) || ch == '_')
        {
            char id[20];
            int l = 0;

            do
            {
                id[l++] = ch;
                ch = fgetc(fp);
            }
            while (ch != EOF && (isalnum((unsigned char)ch) || ch == '_'));

            id[l] = '\0';

            if (ch != EOF)
            {
                ungetc(ch, fp);
            }

            if (isKeyword(id))
            {
                printf("<Keyword, %s>\n", id);
            }

            else
            {
                printf("<Identifier, %s>\n", id);
            }
        }
    }

    fclose(fp);

    return 0;
}
