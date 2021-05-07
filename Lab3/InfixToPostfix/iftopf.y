%{
 #include<stdio.h>
%}

%token NUM
%left '+''-'
%left '*''/'
%right NEGATIVE

%%
S:E {printf("\n");};
E:E'+'E {printf("+");}
 |E'-'E {printf("-");} 
 |E'*'E {printf("*");}
 |E'/'E {printf("/");}
 |'('E')'|'-'E %prec NEGATIVE {printf("-");}
 |NUM {printf("%d",yylval);};
%%

int main()
{
 printf("Enter the expression : ");
 yyparse();
}

int yyerror()
{
 return printf("Error");
}