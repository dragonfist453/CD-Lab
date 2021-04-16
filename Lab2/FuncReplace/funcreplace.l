%option noyywrap
%{
    #include <stdio.h>
    int sf;
    int pf;
%}
%%
"scanf"	{ sf++; fprintf(yyout,"readf");}
"printf" { pf++; fprintf(yyout,"writef");}
; {fprintf(yyout, "%s", yytext);}
\n {fprintf(yyout, "%s","\n");}
%%

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	yylex();
	printf("Number of scanf=%d\nNumber of printf=%d\n",sf,pf);
	return 0;
}