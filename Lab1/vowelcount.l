%option noyywrap
%{
    #include <stdio.h>
    int v;
    int c;
%}
%%
[aeiouAEIOU] {v++;}
[A-Za-z] {c++;}
"\n" {return 0;}
%%
int main() {
    printf("Enter the string\n");
    yylex();
    printf("The number of vowels are %d and consonants are %d\n", v,c);
}