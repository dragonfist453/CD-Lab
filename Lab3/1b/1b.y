%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}
%%
S: A B
|
;
A: 'a'A'b'
|
;
B: 'b'B'c'
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