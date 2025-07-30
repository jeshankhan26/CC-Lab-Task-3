%option noyywrap

%{
#include "ifelse.tab.h"
#include <stdlib.h>
#include <string.h>
%}

digit [0-9]
number ({digit}+)
alpha [A-Za-z]
undr [_]
ident ({alpha}|{undr})({alpha}|{undr}|{digit})*

%%

[ \t\n]+                  { /* skip whitespace */ }

"int"                    { return INT; }
"main"                   { return MAIN; }
"if"                     { return IF; }
"else"                   { return ELSE; }
"printf"                 { return PRINTF; }

{ident}                  { yylval.sval = strdup(yytext); return ID; }
{number}                 { yylval.ival = atoi(yytext); return NUM; }

"%"                      { return MOD; }
"=="                     { return EQ; }
"="                      { return ASSIGN; }

";"                      { return SEMI; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
"{"                      { return LBRACE; }
"}"                      { return RBRACE; }

\"[^\"]*\"               { yylval.sval = strdup(yytext); return STRING; }

.                        { /* ignore unrecognized characters */ }

%%
