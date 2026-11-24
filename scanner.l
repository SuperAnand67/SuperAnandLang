%{
    #include <stdio.h>
%}

%option noyywrap

id [a-zA-Z][a-zA-Z0-9_]*
num [0-9]+
keywords believe|whatis|giveme
ops "+"|-|=
comment $.+$

%%

{keywords} {printf("Keyword : %s\n",yytext);}

{ops} {printf("Operator : %s\n",yytext);}

{id} {printf("Identifier : %s\n",yytext);}

{num} {printf("Number : %s\n",yytext);}

{comment} {printf("%s\n",yytext);}

; {printf("Seperator : %s\n",yytext);}

. ;

%%


int main(){
    yylex();
}