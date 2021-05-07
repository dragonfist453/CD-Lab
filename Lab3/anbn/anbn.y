%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}
%%
S: 'a'S'b'
|
;
%%
int main() {
    printf("Input a string: ");
    yyparse();
    printf("Valid string\n");
}

int yyerror() {
    printf("Invalid string\n");
    exit(0);
}