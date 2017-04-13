%option noyywrap
%option noinput
%option nounput

%{

#include <stdio.h>
#include <math.h>
%}

DIGIT [0-9]

ID [a-z][a-z0-9]*

%%
{DIGIT}+ 	{printf("We found a number, string format: %s, number format:%d\n", \
					 yytext,atoi(yytext));}
{DIGIT}+\.{DIGIT}+ 	{printf("We found a floating point number string format: %s, number format:%g\n", \
 						yytext, atof(yytext));}
if|then|begin|end|procedure|function { printf("Keyword found: %s\n", yytext);}

[ \t\n]+ 	{ /* if you encounter whitespace, eat it*/}

"{"[^}]*"}" 	{ /* if we find comments, eat them*/}

{ID} 	{ printf("Identifier: %s\n", yytext);}

[-+/*] 		{printf("Operator found: %s\n", yytext);}


. 	{printf("Unrecognized character found: %s", yytext);}




%%

int main(){

	yylex();
	return 0;
}