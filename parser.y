%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(const char *s);
  int yylex(void);
  extern char *yytext;
  extern int yylineno;
  extern FILE *yyin;
%}

%union {
  int num;
  char *str;
}

%token <num> NUMBER
%token <str> STRING
%token INVALID WHATIS BELIEVE COMMENT

%type <num> expr term fact

%start prog

%%

prog:
  stmt ';'
  | prog stmt ';'
  ;

stmt:
  WHATIS expr { printf("%d\n",$2); }
  | WHATIS STRING  { printf("%s\n",$2); free($2); } 
  ;

expr:
  expr '+' term { $$ = $1 + $3; }
  | expr '-' term { $$ = $1 - $3; }
  | term  { $$ = $1; }
  ;

term:
  term '*' fact { $$ = $1 * $3; }
  | term '/' fact { if($3 != 0) $$ = $1 / $3; else { yyerror("Divide By Zero Error !"); YYERROR; } }
  | fact  { $$ = $1; }
  ;

fact:
  '(' expr ')'  { $$ = $2; }
  | NUMBER  { $$ = $1; }
  ;

%%

void yyerror(const char *s){
  if (yytext[0] == '\0')
    fprintf(stderr, "Syntax error at line %d near end of file (did you forget a ';'?): %s\n", yylineno, s);
  else
    fprintf(stderr, "Syntax error at line %d near '%s': %s\n", yylineno, yytext, s);
}

int main(int argc, char *argv[]){

  if(argc > 1){

    yyin = fopen(argv[1], "r");

    if(!yyin){
      perror("Could Not Open File !\n");
      return 1;
    }

  }
  return yyparse();
}