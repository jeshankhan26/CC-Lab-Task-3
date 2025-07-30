%{
#include "cal.tab.h"
%}

%%
"for"       { return FOR; }
"("         { return LPAREN; }
")"         { return RPAREN; }
";"         { return SEMI; }
"<"         { return LT; }
"="         { return ASSIGN; }
"+"         { return ADD; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+    ;  // skip whitespace
.           { return yytext[0]; }
%%

int yywrap() { return 1; }
