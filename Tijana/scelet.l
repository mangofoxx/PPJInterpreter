/*Testing basic flexx patterns and actions
  Rules go in between %% ... %%
  . reads everything up to new line
 */
%option noyywrap
%option nounput
%option noinput

%{
#include<stdio.h>
#include<stdlib.h>

int numRows = 0, numChar = 0;
%}

%%
\n  {numChar++; numRows++;}
.   {numChar++;}
%%


int main(){
    yylex(); //calling lexer

    printf("LINES:%d\nCHARS:%d\n", numRows, numChar);

    return 0;
}