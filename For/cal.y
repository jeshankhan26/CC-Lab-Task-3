%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();

%}

%token ID NUMBER ASSIGN LT SEMI LPAREN RPAREN FOR ADD

%start loop

%%

loop:
    FOR LPAREN assign_expr SEMI condition SEMI assign_expr RPAREN SEMI
    {
        printf("Parsing Finished.\n");
    }
    ;

assign_expr:
    ID ASSIGN expr ;

condition:
    ID LT expr ;

expr:
    ID
    | NUMBER
    | ID ADD NUMBER
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
