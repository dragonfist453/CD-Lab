%option noyywrap
%{
    #include <stdio.h>
    int posint;
    int negint;
    int posfrac;
    int negfrac;
    int numbers;
    int errors;
%}
%%
(\+?[0-9]+\.?[0]*) {posint++;}
(-[0-9]+\.?[0]*) {negint++;}
(\+?[0-9]*\.?[1-9]+)|(\+?[0-9]*\/?[1-9]+) {posfrac++;}
(-[0-9]*\.?[1-9]+)|(-[0-9]*\/?[1-9]+) {negfrac++;}
(\+?[0-9]*\.?-[1-9]+)|(\+?[0-9]*\/?[0]*)|(-[0-9]*\.?-[1-9]+)|(-[0-9]*\/?[0]*) {errors++;}
([ ]) {numbers++;}
. ;
\n {return 0;}
%%
int main() {
    printf("Enter the numbers separated by spaces\n");
    yylex();
    printf("The number of positive integers are %d\nThe numver of negative integers are %d\nThe number of positive fractions are %d\nThe number of negative fractions are %d\nThe number of errors are %d\n", posint, negint, posfrac, negfrac, errors);
}