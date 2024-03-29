%option noyywrap
%{
    #include "y.tab.h"
    extern int yylval;
%}
%%
[0-9]+ {
    yylval = atoi(yytext);
    return NUM;
}
[ \t]+ ;  /*For skipping whitespaces*/ 
\n    { return 0; }
.     { return yytext[0]; }
%%