%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  void yyerror(const char *s);
  int yylex(void);
  int findOrError(char *s, int i);
  int unaryOp(char *id, int k);
  int assign(char *id, int val);
  int uassign(char *id, char op, int val);

  extern char *yytext;
  extern int yylineno;
  extern FILE *yyin;

  extern char table[200][50];
  extern int values[200];
  extern int n;

  extern int search(char key[]);
  extern void insert(char name[], int value);
%}

%union {
  int num;
  char *str;
  char op;
}

%token <num> NUMBER
%token <str> STRING ID
%token WHATIS BELIEVE EXIT INVALID
%token INCREMENT DECREMENT
%token <op> UASSIGN

%type <num> expr term fact
%type <str> string

%destructor { free($$); } <str>

%start prog

%%

prog:
  stmt ';'
  | prog stmt ';'
  | EXIT'('')'  { printf("Thanks for using SuperAnandLang !"); exit(0); }
  ;

stmt:
  output
  | assign
  | unary
  ;

output:
  WHATIS expr { printf("%d\n",$2); }
  | WHATIS string  { printf("%s\n",$2); free($2); }
  ;

assign:
  BELIEVE ID '=' expr { if(!assign($2,$4)) YYERROR; }
  | BELIEVE ID { if(!assign($2,0)) YYERROR; }
  | ID '=' expr { if(!findOrError($1,$3)) YYERROR; }
  | ID UASSIGN expr { if(!uassign($1, $2, $3)) YYERROR; }
  ;

unary:
  ID INCREMENT  { if(!unaryOp($1, 1)) YYERROR; }
  | ID DECREMENT { if(!unaryOp($1, -1)) YYERROR; }
  ;

string:
  STRING '+' string {
    char *temp = realloc($1,strlen($1) + strlen($3) + 1); 
    $$ = strcat(temp, $3);
    free($3);
  }
  | STRING '+' expr {
      char str[20];
      snprintf(str, sizeof(str), "%d", $3);
      char *temp = realloc($1,strlen($1) + strlen(str) + 1);
      $$ = strcat(temp, str);
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
      char error[200];
      sprintf(error, "Undefined Variable '%s'",$1);
      yyerror(error);
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

int findOrError(char *s, int i){
  int index = search(s);

    if(index != -1)
      insert(s,i);
    else{
      char error[200];
      sprintf(error, "Undefined Variable '%s'",s);
      yyerror(error);
      //free(s);
      return 0;
    }
    free(s);
    return 1;
}

int unaryOp(char *id, int k){
  int i = search(id);

  if(i != -1)
    findOrError(id,values[i] + k);
  else{
    char error[200];
      sprintf(error, "Undefined Variable '%s'",id);
      yyerror(error);
      free(id);
      return 0;
  }
  return 1;
}

int assign(char *id, int val){

  int index = search(id);

  if(index == -1)
    insert(id, val);
  else{
    char error[200];
    sprintf(error, "'%s' already Declared - Remove 'believe' !",id);
    yyerror(error);
    free(id);
    return 0;
  }

  return 1;

}

int uassign(char *id, char op, int val){
  int i = search(id);

  if(i == -1){
    char error[200];
    sprintf(error, "Undefined Variable '%s'",id);
    yyerror(error);
    free(id);
    return 0;
  }

  switch(op){
    case '+':
      insert(id, values[i] + val);
      break;
    case '-':
      insert(id, values[i] - val);
      break;
    case '*':
      insert(id, values[i] * val);
      break;
    case '/':
      if(val != 0)
        insert(id, values[i] / val);
      else{
        yyerror("Division by Zero !");
        free(id);
        return 0;
      }
      break;
  }

  free(id);
  return 1;
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