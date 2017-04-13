%option noyywrap
%option nounput
%option noinput

%{
#include<stdio.h>
#include<math.h>
%}

DIGIT [0-9]
ID [a-z][a-z0-9]*

%%
{DIGIT}+ {
    printf("Integer in string format %s\nInteger in num format:%d\n",\
    yytext, atoi(yytext));
}

{DIGIT}+\.{DIGIT}+  {
    printf("FPN in string format:%s\nFPN in num format:%g\n",\
    yytext, atof(yytext));
}
if|then|begin|end|procedure|function {
    printf("Key word found: %s\n", yytext);
}

[ \t\n]+ {
    /*Eat whitespace*/
}

"+"|"*"|"/"|"-" {
    printf("Operator found: %s\n", yytext);
}

{ID} {
    printf("Identifier found: %s\n", yytext);
}

"{"[^}]*"}" {
    /*Eat comments*/
}
. {
    printf("Unrecognized character found:%s\n", yytext);
}
%%

int main(){
    yylex();

    return 0;
}