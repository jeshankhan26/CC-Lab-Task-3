%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *s);
int yylex();
%}

%union {
    int ival;
    char *sval;
}

%token <sval> ID STRING
%token <ival> NUM
%token INT MAIN WHILE RETURN PRINTF
%token ADD ASSIGN LT SEMI LPAREN RPAREN LBRACE RBRACE

%start program

%%

program:
    INT MAIN LPAREN RPAREN LBRACE decls while_stmt ret_stmt RBRACE {
        printf("parsing finished\n");
    }
    ;

decls:
    INT ID ASSIGN NUM SEMI
    ;

while_stmt:
    WHILE LPAREN ID LT NUM RPAREN LBRACE stmt_list RBRACE
    ;

stmt_list:
    stmt_list stmt
    | stmt
    ;

stmt:
    print_stmt
    | ID ASSIGN ID ADD NUM SEMI
    ;

print_stmt:
    PRINTF LPAREN STRING RPAREN SEMI
    ;

ret_stmt:
    RETURN NUM SEMI
    ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
