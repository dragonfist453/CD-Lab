%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ADD SUB MUL DIV INC DEC
%token LT GT LTE GTE EQ NEQ ASSIGN
%token VOID INT DOUBLE FLOAT CHAR
%token LONG UNSIGNED
%token COMMA LPAREN RPAREN LBRACE RBRACE
%token ENDL
%token FOR RET IF ELSE WHILE
%token NUM ID

%start function_definition

%%
type_modifier: LONG
             | UNSIGNED
             ;

type_specifier: VOID
              | CHAR
              | INT
              | FLOAT
              | DOUBLE
              | type_modifier type_specifier
              ;

argument: type_specifier ID
        ;

argument_list: argument
             | argument COMMA argument_list
             ;

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

type_expr: type_specifier ID
		;

assignment_expr: unary_expr ASSIGN unary_expr
               | unary_expr ASSIGN boolean_expr
			   | type_expr ASSIGN unary_expr
			   | type_expr ASSIGN boolean_expr
               ;

expression: unary_expr
          | boolean_expr
          | assignment_expr
		  | type_expr
          ;

for_expr: FOR LPAREN statement statement expression RPAREN statement
        | FOR LPAREN statement statement RPAREN statement
        ;

while_expr: WHILE LPAREN expression RPAREN block
          | WHILE LPAREN RPAREN block
          ;

if_expr: IF LPAREN expression RPAREN block
       | IF LPAREN expression RPAREN block ELSE block
       | IF LPAREN expression RPAREN block ELSE if_expr
       ;

block: LBRACE statement block_cont
     ;

block_cont: statement block_cont
          | RBRACE
          ;

statement: RET expression ENDL
         | expression ENDL
         | block
         | for_expr
         | if_expr
         | while_expr
         | ENDL
         ;

function_definition: argument LPAREN argument_list RPAREN block
                   | argument LPAREN RPAREN block
                   ;
%%

int main() {
    yyparse();
    printf("valid expression\n");
}

int yyerror(char *s) {
    printf("error: %s\n", s);
    exit(0);
}