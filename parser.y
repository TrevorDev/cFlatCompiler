%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "nodes.h"
#include "scanner.h"


void yyerror(const char* msg) {
      fprintf(stderr, "%s on line %d\n", msg, yylineno);
}
StmtListNode * rootNode;
int yylex();

// global variables set by command line arguments
int syntaxAnalysisOutput, symbolTableOutput, intermediateOutput, asmOutput;

%}
%token-table

%union {
	int ival;
	char *sval;
	float fval;
	StmtListNode * stmtList;
	StmtNode * stmt;
}

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
%token <sval> IDENTIFIER
%token <ival> INT
%token <fval> FLOAT
%token TYPEDEF
%token STRUCT
%token END_OF_FILE

%type <stmtList> stmt_list
%type <stmt> stmt

%% /* Grammar rules and actions follow */

program:	stmt_list
			{
				printf("Done!\n");
				rootNode = $1;
				return rootNode;
			}
;

stmt_list:	stmt
			{
				$$ = createStmtListNode(NULL, $1);
			}
			|
			stmt_list stmt
			{
				$$ = createStmtListNode($1, $2);
			}
;

stmt:	INT
		{
			printf("int\n");
			$$ = createStmtNode((void*)&$1, INTVAL);
		}
		|
		FLOAT
		{
			printf("float\n");
			$$ = createStmtNode((void*)&$1, FLOATVAL);
		}
		|
		IDENTIFIER
		{
			printf("sstr\n");
			$$ = createStmtNode((void*)$1, STRVAL);
		}
;
%%

int main(int argc, char *argv[])
{
	int x;

	syntaxAnalysisOutput = 0;
	symbolTableOutput = 0;
	intermediateOutput = 0;
	asmOutput = 0;

	if (argc > 2) { // only one command line argument permitted
		fprintf(stderr, "Usage: cflatc -[asic]\n");
		return 1;
	}
	if (argc == 2) { // validate the second argument if one exists
		if (strlen(argv[2]) > 2) {
			fprintf(stderr, "Usage: cflatc -[asic]\n");
			return 1;
		}
		switch (argv[2][2]) {
			case 'a':
				syntaxAnalysisOutput = 1;
				break;
			case 's':
				symbolTableOutput = 1;
				break;
			case 'i':
				intermediateOutput = 1;
				break;
			case 'c':
				asmOutput = 1;
				break;
			default:
				fprintf(stderr, "Usage: cflatc -[asic]\n");
				return 1;
				break;
		}
	}
	/*
	while((x = yylex()) != END_OF_FILE){
		//printf("%s ", yytext);
		//printf("%s\n", yytname[x-258+3]);//SCANNER_VALS[x]);
	}
	*/
	while(!feof(stdin)){
		yyparse();
	}
	return 0;
}