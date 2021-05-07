%option noyywrap
%{
    #include "y.tab.h"
    extern int yylval;
%}
%%
"void" return VOID;
"int" return INT;
"float" return FLOAT;
"double" return DOUBLE;
"char" return CHAR;
"unsigned" return UNSIGNED;
"long" return LONG;
"return" return RET;
"for" return FOR;
"if" return IF;
"else" return ELSE;
"," return COMMA;
"(" return LPAREN;
")" return RPAREN;
"{" return LBRACE;
"}" return RBRACE;
";" return ENDL;
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
[a-zA-Z_][a-zA-Z_0-9]* return ID;
[0-9]+ return NUM;
. ;
\n ;
'~' return 0;
%%