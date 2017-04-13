/*
We are making rules for our lex interpreter, we put them in between and so do the actions %% %%
. reads everything up to the newline character
*/
%option noyywrap
%option nounput
%option noinput

%{
#include <stdio.h>
#include <stdlib.h> 
int numLines = 0, numChars = 0;
%}

%%
\n 	{numLines++; numChars++;}
. 	{numChars++;}


%%

int main(){
	yylex();

	printf("%d is the number of lines, %d is the number of characters\n", numLines,numChars);

	return 0;
}




