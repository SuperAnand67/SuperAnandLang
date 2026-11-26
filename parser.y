%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(const char *s);
  int yylex(void);
  extern char *yytext;
  extern int yylineno;
  extern FILE *yyin;

  extern char table[100][50];
  extern int values[100];
  extern int n;

  extern int search(char key[]);
  extern void insert(char name[], int value);
%}

%union {
  int num;
  char *str;
}

%token <num> NUMBER
%token <str> STRING ID
%token WHATIS BELIEVE COMMENT INVALID

%type <num> expr term fact

%destructor { free($$); } <str>

%start prog

%%

prog:
  stmt ';'
  | prog stmt ';'
  ;

stmt:
  WHATIS expr { printf("%d\n",$2); }
  | WHATIS STRING  { printf("%s\n",$2); free($2); }
  | BELIEVE ID '=' expr { insert($2,$4); free($2); }
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
  | ID  {
    int i = search($1);

    if(i != -1)
      $$ = values[i];
    else{
      fprintf(stderr,"Undefined Variable : %s\n", $1);
      free($1);
      YYERROR;
    }

    free($1);
  }
  ;

%%

void yyerror(const char *s){
  fprintf(stderr, "Error at line %d: %s\n", yylineno, s);
}

int main(int argc, char *argv[]){

  if(argc > 1){

    yyin = fopen(argv[1], "r");

    if(!yyin){
      perror("Could Not Open File !\n");
      return 1;
    }
  }

  int result = yyparse();

  if(argc > 1)
    fclose(yyin);
  
  return result;
}