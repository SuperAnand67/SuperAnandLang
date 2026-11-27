%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser.tab.h"
    void yyerror(const char *s);
    char* parse_string(const char *str);

    char table[200][50];
    int values[200];
    int n = 0;

    int search(char key[]);
    void insert(char name[], int val);
%}

%option noyywrap
%option yylineno

%x COMMENT

number [0-9]+
string \"(\\.|[^\"\\])*\" 
id [a-zA-Z][a-zA-Z0-9_]*

%%

"whatis"  { return WHATIS; }
"believe"   { return BELIEVE; }

{number}   { yylval.num = atoi(yytext); return NUMBER; }
{string}   { yylval.str = parse_string(yytext); return STRING; }
{id}    { yylval.str = strdup(yytext); return ID; }

[ \t\n]+  ;

"++"    { return INCREMENT; }
"--"    { return DECREMENT; }

[+\-*/]=    { yylval.op = yytext[0]; return UASSIGN; }

[+\-*/();=]  { return *yytext; }

"$" { BEGIN(COMMENT); }
<COMMENT>"$"    { BEGIN(INITIAL); }
<COMMENT>\n ;
<COMMENT>.  ;

.   {   fprintf(stderr, "Invalid character: '%s' (ASCII: %d), line: %d\n",
            yytext, (unsigned char)yytext[0], yylineno); 
        yyerror("Invalid Syntax!");
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

int search(char key[]){
    for(int i = 0; i < n; i++){
        if(strcmp(table[i],key) == 0)
            return i;
    }
    return -1;
}

void insert(char name[], int val){

    int index = search(name);

    if(index != -1){
        values[index] = val;
        return;
    }

    if(n >= 100){
        printf("Symbol table full!\n");
        return;
    }

    strcpy(table[n], name);
    values[n] = val;
    n++;
}
