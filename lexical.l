%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser.tab.h"
    void yyerror(const char *s);
    char* parse_string(const char *str);
%}

%option noyywrap

%x COMMENT

number [0-9]+
string \"(\\.|[^\"\\])*\" 

%%

"whatis"  { return WHATIS; }
"believe"   { return BELIEVE; }

{number}   { yylval.num = atoi(yytext); return NUMBER; }
{string}   { yylval.str = parse_string(yytext); return STRING; }

[ \t\n]+  ;

[+\-*/();]  { return *yytext; }

"$" { BEGIN(COMMENT); }
<COMMENT>"$"    { BEGIN(INITIAL); }
<COMMENT>\n { yylineno++; }
<COMMENT>.  ;

.   { yyerror("Invalid Syntax!");
    return INVALID; }

%%

char *parse_string(const char *str){

    char *str_out = malloc(strlen(str));
    int j = 0;

    for(int i = 1; str[i + 1] != '\0'; i++){
        if(str[i] == '\\'){
            i++;
            switch(str[i]){
                case 'n':
                    str_out[j++] = '\n';
                    break;
                case 't':
                    str_out[j++] = '\t';
                    break;
                case '"':
                    str_out[j++] = '"';
                    break;
                case '\\':
                    str_out[j++] = '\\';
                    break;
                default:
                    str_out[j++] = str[i];
                    break;
            }
        } else
            str_out[j++] = str[i];
    }

    str_out[j] = '\0';
    return str_out;
}
