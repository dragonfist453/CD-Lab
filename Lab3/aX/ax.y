%{
  #include<stdio.h>
  #include<stdlib.h>
%}

%%
S:'a''a''a'X'b';
X:'a'X
 |
 ;
%%
int main()
{
 printf("Enter the string : ");
 yyparse();
 printf("Valid string\n");
}

int yyerror()
{
 printf("Invalid string\n");
 exit(0);
}