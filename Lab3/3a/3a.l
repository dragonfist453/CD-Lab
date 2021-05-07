%option noyywrap
%{
    #include "y.tab.h"
    extern int yylval;
%}
%%
"++" return INC;
"--" return DEC;
"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"=" return ASSIGN;
"==" return EQ;
"!=" return NEQ;
"<" return LT;
">" return GT;
"<=" return LTE;
">=" return GTE;
";" return ENDL;
"for" return FOR;
[0-9]+ {
    yylval = atoi(yytext);
    return NUM;
};
[a-zA-Z_][a-zA-Z_0-9]* return ID;
. return yytext[0];
\n return 0;
%%