
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp1, *fp2;
    char op, arg1[10], arg2[10], result[10];

    fp1 = fopen("input.txt", "r");
    fp2 = fopen("output.txt", "w");

    if (fp1 == NULL || fp2 == NULL)
    {
        printf("File opening error\n");
        return 1;
    }

    while (fscanf(fp1, "%s %c %s %s",
                  arg1, &op, arg2, result) == 4)
    {
        switch (op)
        {
            case '+':
                fprintf(fp2, "MOV R0, %s\n", arg1);
                fprintf(fp2, "ADD R0, %s\n", arg2);
                fprintf(fp2, "MOV %s, R0\n", result);
                break;

            case '*':
                fprintf(fp2, "MOV R0, %s\n", arg1);
                fprintf(fp2, "MUL R0, %s\n", arg2);
                fprintf(fp2, "MOV %s, R0\n", result);
                break;

            case '-':
                fprintf(fp2, "MOV R0, %s\n", arg1);
                fprintf(fp2, "SUB R0, %s\n", arg2);
                fprintf(fp2, "MOV %s, R0\n", result);
                break;

            case '/':
                fprintf(fp2, "MOV R0, %s\n", arg1);
                fprintf(fp2, "DIV R0, %s\n", arg2);
                fprintf(fp2, "MOV %s, R0\n", result);
                break;

            case '=':
                fprintf(fp2, "MOV R0, %s\n", arg1);
                fprintf(fp2, "MOV %s, R0\n", result);
                break;
        }
    }

    fclose(fp1);
    fclose(fp2);

    printf("Intermediate code generated successfully\n");

    return 0;
}

