%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "graph.h"
#include "nodes.h"
#include "scanner.h"



void yyerror(const char* msg) {
      fprintf(stderr, "%s on line %d\n", msg, yylineno);
}
Node * rootNode;
int yylex();

// global variables set by command line arguments
int syntaxAnalysisOutput, symbolTableOutput, intermediateOutput, asmOutput;

%}
%token-table

%union {
	int ival;
	char *sval;
	float fval;
	Node * node;
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
%token SQUARE_OPEN
%token SQUARE_CLOSE
%token SEMICOLON
%token CONTROL_BLOCK_OPEN
%token CONTROL_BLOCK_CLOSE
%token <sval> IDENTIFIER
%token <ival> INT
%token <fval> FLOAT
%token TYPEDEF
%token COMMA
%token STRUCT
%token END_OF_FILE

/*%type <node> stmt_list
%type <node> stmt*/

%% /* Grammar rules and actions follow */

program:	type_decl_list// global_var_list function_def_list
			{
				return 0;
			}
;

type_decl_list: type_decl_list type_decl
				{
					printf("bad\n");
				}
				|
				type_decl
				{
					printf("bad1\n");
				}
				|
				/*Empty*/
				{
					printf("ba2\n");
				}
;
type_decl: TYPEDEF type_iden var_name_iden SEMICOLON
			{
				printf("decl found\n");
			}
;

var_name_iden: IDENTIFIER
				{

				}
				|
				IDENTIFIER array_decl
				{

				}
;

array_decl: SQUARE_OPEN INT SQUARE_CLOSE
			{

			}
;

base_type_lit: INT_LIT | FLOAT_LIT | CHAR_LIT
				{

				}

type_iden: 	IDENTIFIER
			{

			}
			|
			struct_def
			{

			}
			|
			base_type_lit
			{

			}
;

struct_def: STRUCT IDENTIFIER CONTROL_BLOCK_OPEN var_list CONTROL_BLOCK_CLOSE
			{

			}
			|
			STRUCT CONTROL_BLOCK_OPEN var_list CONTROL_BLOCK_CLOSE
			{

			}
;

struct_def_alone: struct_def SEMICOLON
				{

				}
;

var_list: var_list var_decl
			{

			}
			|
			var_decl
			{

			}
			|
			/*Empty*/
			{

			}
;

var_decl: type_iden comma_iden_list SEMICOLON
			{

			}
			|
			struct_def_alone
			{
				
			}
;
comma_iden_list: var_name_iden COMMA comma_iden_list 
				{

				}
				|
				var_name_iden
				{

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
		switch (argv[2][1]) {
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


	Node * curPos = rootNode;
	int c = 0;
	while(curPos != NULL){
		curPos = curPos->children[1];
		c++;
	}
	printf("%d\n", c);

	if (syntaxAnalysisOutput){
		printGraphString(rootNode);
	}

	return 0;
}