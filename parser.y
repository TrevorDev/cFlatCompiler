/* Reverse polish notation calculator. */

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


#include "scanner.h"

void yyerror(const char* msg) {
      fprintf(stderr, "%s on line %d\n", msg, yylineno);
}

int yylex();

%}
%token-table
%token INT_LIT
%token CHAR_LIT
%token FLOAT_LIT
%token VOID_LIT
%token SINGLE_QUOTE
%token NEW_LINE
%token NULL_CHAR
%token PLUS_PLUS
%token PLUS
%token MINUS_MINUS
%token MINUS
%token STAR
%token SLASH
%token MODULUS
%token EQUALITY
%token INEQUALITY
%token LESS_THAN
%token GREATER_THAN
%token LESS_THAN_OR_EQUAL_TO
%token GREATER_THAN_OR_EQUAL_TO
%token LOGICAL_AND
%token LOGICAL_OR
%token NOT
%token ASSIGNMENT
%token SIZE_OF
%token IF
%token ELSE
%token FOR
%token RETURN
%token WHILE
%token COMMENT_OPEN
%token COMMENT_CLOSE
%token BRACKET_OPEN
%token BRACKET_CLOSE
%token PARENTHESIS_OPEN
%token PARANTHESIS_CLOSE
%token SEMICOLON
%token CONTROL_BLOCK_OPEN
%token CONTROL_BLOCK_CLOSE
%token IDENTIFIER
%token INT
%token FLOAT
%token TYPEDEF
%token STRUCT
%token END_OF_FILE

%% /* Grammar rules and actions follow */

stmt_list:	stmt
			{

			}
			|
			stmt_list stmt
			{

			}
;

stmt:	INT
		{
			printf("wow guys\n");
		}
;
%%
int main(){
	int x;
	/*while((x = yylex()) != END_OF_FILE){
		//printf("%s ", yytext);
		//printf("%s\n", yytname[x-258+3]);//SCANNER_VALS[x]);
	}*/
	while(!feof(stdin)){
		yyparse();
	}
}