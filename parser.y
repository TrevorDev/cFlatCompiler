/* Reverse polish notation calculator. */

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "tokens.h"
#include "scanner.h"

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

int yylex();

char * SCANNER_VALS[] = {
	"INT_LIT",
	"CHAR_LIT",
	"FLOAT_LIT",
	"VOID_LIT",
	"SINGLE_QUOTE",
	"NEW_LINE",
	"NULL_CHAR",
	"PLUS_PLUS",
	"PLUS",
	"MINUS_MINUS",
	"MINUS",
	"STAR",
	"SLASH",
	"MODULUS",
	"EQUALITY",
	"INEQUALITY",
	"LESS_THAN",
	"GREATER_THAN",
	"LESS_THAN_OR_EQUAL_TO",
	"GREATER_THAN_OR_EQUAL_TO",
	"LOGICAL_AND",
	"LOGICAL_OR",
	"NOT",
	"ASSIGNMENT",
	"SIZE_OF",
	"IF",
	"ELSE",
	"FOR",
	"RETURN",
	"WHILE",
	"COMMENT_OPEN",
	"COMMENT_CLOSE",
	"BRACKET_OPEN",
	"BRACKET_CLOSE",
	"PARENTHESIS_OPEN",
	"PARANTHESIS_CLOSE",
	"SEMICOLON",
	"CONTROL_BLOCK_OPEN",
	"CONTROL_BLOCK_CLOSE",
	"IDENTIFIER",
	"INT",
	"FLOAT",
	"TYPEDEF",
	"STRUCT",
	"END_OF_FILE"
};

%}

%token NUM

%% /* Grammar rules and actions follow */

input:    /* empty */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\t%.10g\n", $1); }
;

exp:      NUM             { $$ = $1;         }
        | exp exp '+'     { $$ = $1 + $2;    }
        | exp exp '-'     { $$ = $1 - $2;    }
        | exp exp '*'     { $$ = $1 * $2;    }
        | exp exp '/'     { $$ = $1 / $2;    }
      /* Exponentiation */
        | exp exp '^'     { $$ = pow ($1, $2); }
      /* Unary minus    */
        | exp 'n'         { $$ = -$1;        }
;
%%
int main(){
	int x;
	while((x = yylex()) != END_OF_FILE){
		printf("%s ", yytext);
		printf("%s\n", SCANNER_VALS[x]);
	}
	
}