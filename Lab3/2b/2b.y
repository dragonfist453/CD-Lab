%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int result;
%}
%token NUM
%left '+''-'
%left '*''/'
%%
R: T {result = $$;;
    return 0;
}
T: T '+' T { $$ = $1 + $3; }
    | T '-' T { $$ = $1 - $3; }
    | T '*' T { $$ = $1 * $3; }
    | T '/' T { $$ = $1 / $3; }
    | '-' NUM { $$ = -$2; }
    | '(' T ')' { $$ = $2; }
    | NUM { $$ = $1; }
%%
int main() {
    printf("Input an expression: ");
    yyparse();
    printf("Result: %d\n", result);
}

int yyerror() {
    printf("Invalid string\n");
    exit(0);
}