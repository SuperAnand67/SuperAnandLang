%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  void yyerror(const char *s);
  int yylex(void);
  void findOrError(char *s, int i);
  void unaryOp(char *id, int k);

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
%token WHATIS BELIEVE INVALID INCREMENT DECREMENT

%type <num> expr term fact
%type <str> string

%destructor { free($$); } <str>

%start prog

%%

prog:
  stmt ';'
  | prog stmt ';'
  ;

stmt:
  WHATIS expr { printf("%d\n",$2); }
  | WHATIS string  { printf("%s\n",$2); free($2); }
  | BELIEVE ID '=' expr { insert($2,$4); free($2); }
  | ID '=' expr { findOrError($1,$3); }
  | ID INCREMENT  { unaryOp($1, 1); }
  | ID DECREMENT { unaryOp($1, -1); }
  ;

string:
  STRING '+' string {
     $1 = realloc($1,strlen($1) + strlen($3) + 1); 
     $$ = strcat($1, $3);
     free($3);
  }
  | STRING  { $$ = $1; }
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
      yyerror("Undefined Variable !");
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

void findOrError(char *s, int i){
  int index = search(s);

    if(index != -1)
      insert(s,i);
    else{
      yyerror("Undefined Variable !");
      //free(s);
      //YYERROR;
    }
    free(s);
}

void unaryOp(char *id, int k){
  int i = search(id);

  if(i != -1)
    findOrError(id,values[i] + k);
  else{
    yyerror("Undefined Variable !");
    free(id);
  }

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