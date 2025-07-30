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
%token INT MAIN SWITCH CASE DEFAULT BREAK RETURN PRINTF
%token COLON SEMI ASSIGN LPAREN RPAREN LBRACE RBRACE

%start program

%%

program:
    INT MAIN LPAREN RPAREN LBRACE decls switch_stmt ret_stmt RBRACE {
        printf("parsing finished\n");
    }
    ;

decls:
    INT ID ASSIGN NUM SEMI
    ;

switch_stmt:
    SWITCH LPAREN ID RPAREN LBRACE case_list default_case RBRACE
    ;

case_list:
    case_list CASE NUM COLON print_stmt BREAK SEMI
    | CASE NUM COLON print_stmt BREAK SEMI
    ;

default_case:
    DEFAULT COLON print_stmt
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
