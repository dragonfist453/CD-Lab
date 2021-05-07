%option noyywrap
%{
    #include <stdio.h>
%}
%%
"a" return 'a';
"b" return 'b';
"c" return 'c';
. return yytext[0];
\n return 0;
%%