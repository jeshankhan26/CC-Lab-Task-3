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

%token <sval> ID
%token <ival> NUM
%token INT IF ELSE PRINTF MAIN
%token MOD EQ ASSIGN SEMI LPAREN RPAREN LBRACE RBRACE STRING

%start program

%%

program:
    INT MAIN LPAREN RPAREN LBRACE decls if_stmt RBRACE {
        printf("parsing finished\n");
    }
    ;

decls:
    INT ID SEMI
    ;

if_stmt:
    IF LPAREN ID MOD NUM EQ NUM RPAREN LBRACE print_stmt RBRACE ELSE print_stmt
    ;

print_stmt:
    PRINTF LPAREN STRING RPAREN SEMI
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
