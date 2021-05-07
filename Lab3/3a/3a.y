%{
#include <stdio.h>
#include <stdlib.h>
int forloop;
%}
%token ADD SUB MUL DIV INC DEC
%token LT GT LTE GTE EQ NEQ ASSIGN
%token FOR
%token ENDL
%token NUM ID

%start statement

%%
primary_expr: NUM
            | ID
            ;

postfix_expr: postfix_expr INC
            | postfix_expr DEC
            | primary_expr
            ;

unary_expr: INC unary_expr
          | DEC unary_expr
          | postfix_expr
          ;

boolean_expr: unary_expr LT unary_expr
            | unary_expr GT unary_expr
            | unary_expr LTE unary_expr
            | unary_expr GTE unary_expr
            | unary_expr EQ unary_expr
            | unary_expr NEQ unary_expr
            ;

assignment_expr: unary_expr ASSIGN unary_expr
               | unary_expr ASSIGN boolean_expr
               ;

expression: unary_expr
          | boolean_expr
          | assignment_expr
          ;

block: '{' statement block_cont
     ;
block_cont: statement block_cont
          | '}'
          ;

statement: expression ENDL
         | block
         | for_expr {forloop++;}
         | ENDL
         ;

for_expr: FOR '(' statement statement expression ')' statement
        | FOR '(' statement statement ')' statement
        ;

%%

int main() {
    printf("Enter the for loops\n");
    yyparse();
    printf("Number of for loops: %d\n", forloop);
}     