%option noyywrap
%{
    #include <stdio.h>
    int keyword;
    int operator;
    int identifier;
    int seperator;
%}
%%
auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short {keyword++;fprintf(yyout, "%s - keyword\n", yytext);}
[{};,()] {seperator++;fprintf(yyout, "%s - seperator\n", yytext);}
[+-/=%*] {operator++;fprintf(yyout, "%s - operator\n", yytext);}
([a-zA-Z][0-9])+|[a-zA-Z]* {identifier++;fprintf(yyout, "%s - identifier\n", yytext);} 
.|\n ;
%%
int main(int argc, char* argv[]) {
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    yylex();
    printf("Number of keywords: %d\nNumber of seperators: %d\nNumber of operators: %d\nNumber of identifiers: %d\n", keyword, seperator, operator, identifier);
}