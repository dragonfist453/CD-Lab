%option noyywrap
%{
    #include <stdio.h>
    int spaces;
    int words;
    int lines;
    int characters;
%}
%%
([~]) {return 0;}
([ ]) {spaces++;characters++;}
[a-zA-Z]+ {words++;characters+=yyleng;}
. {characters++;}
\n {lines++;characters++;}
%%
int main() {
    printf("Enter the paragraph\n");
    yylex();
    printf("The number of spaces are %d\nThe numver of words are %d\nThe number of lines are %d\nThe number of characters are %d\n", spaces, words, lines, characters);
}