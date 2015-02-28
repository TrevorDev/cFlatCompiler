%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//#include "graph.h"
#include "nodes.h"

extern int yylineno;
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
	int btype; // int = 0, char = 1, float = 2
}

%token <sval> INT_LIT
%token <sval> CHAR_LIT
%token <sval> FLOAT_LIT
%token <sval> VOID_LIT
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

%type <node> program
%type <node> type_decl_list
%type <node> type_decl
%type <node> var_name_iden
%type <node> struct_def
%type <node> base_type_lit
%type <node> type_iden
%type <node> array_decl
%type <node> var_list
%type <node> var_decl

%% /* Grammar rules and actions follow */

program:	type_decl_list /*global_var_list*/ END_OF_FILE // function_def_list
				{
					rootNode = create_program($1);
					return 0;
				}
;

global_var_list: assign_var_list
				{
					printf("global var list\n");
				}

type_decl_list: type_decl_list type_decl
				{
					printf("typedec list\n");
					$$ = create_type_decl_list($1, $2);
				}
				|
				type_decl
				{
					printf("single typedec\n");
					$$ = create_type_decl_list(NULL, $1);
				}
				|
				/*Empty*/
				{
					printf("empty typedec\n");
					$$ = NULL;
				}
;
type_decl: TYPEDEF type_iden var_name_iden SEMICOLON
				{
					printf("decl found\n");
					$$ = create_type_decl($2, $3);
				}
;

var_name_iden: 	IDENTIFIER
				{
					Node * temp = create_identifier($1);
					$$ = create_var_name_iden(temp, NULL);
				}
				|
				IDENTIFIER array_decl
				{
					Node * temp = create_identifier($1);
					$$ = create_var_name_iden(temp, $2);
				}
;

array_decl: SQUARE_OPEN INT SQUARE_CLOSE
				{
					$$ = create_array_decl($2);
				}
;

base_type_lit: INT_LIT
				{
					$$ = create_base_type_lit($1);
				}
				|
				FLOAT_LIT
				{
					$$ = create_base_type_lit($1);
				}
				|
				CHAR_LIT
				{
					$$ = create_base_type_lit($1);
				}
				|
				VOID_LIT
				{
					$$ = create_base_type_lit($1);
				}
;
type_iden: 		IDENTIFIER
				{
					Node * temp = create_identifier($1);
					$$ = create_type_iden(temp);
				}
				|
				struct_def
				{
					$$ = create_type_iden($1);
				}
				|
				base_type_lit
				{
					$$ = create_type_iden($1);
				}
;

struct_def: STRUCT IDENTIFIER CONTROL_BLOCK_OPEN var_list CONTROL_BLOCK_CLOSE
				{
					Node * temp = create_identifier($2);
					$$ = create_struct_def(temp, $4);
				}
				|
				STRUCT CONTROL_BLOCK_OPEN var_list CONTROL_BLOCK_CLOSE
				{
					$$ = create_struct_def(NULL, $3);
				}
;

struct_def_alone: struct_def SEMICOLON
				{

				}
;

assign_var_list: assign_var_list assign_var_decl
				{

				}
				|
				assign_var_decl
				{

				}
;

assign_var_decl: type_iden comma_iden_assign_list SEMICOLON
				{

				}
				|
				/*Empty*/
				{
					printf("empty var dec\n");
				}
;

comma_iden_assign_list: assign_var_name_iden COMMA comma_iden_assign_list 
				{

				}
				|
				assign_var_name_iden
				{

				}
;

assign_var_name_iden: var_name_iden | var_name_iden ASSIGNMENT expr
				{

				}
;

expr: INT
	{
		//TODO FIX EXPR
	}
;

var_list: var_list var_decl
				{
					$$ = create_var_list($1, $2);
				}
				|
				var_decl
				{
					$$ = create_var_list(NULL, $1);
				}
				|
				/*Empty*/
				{
					$$ = NULL;
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
		if (strlen(argv[1]) > 2) {
			fprintf(stderr, "Usage: cflatc -[asic]\n");
			return 1;
		}
		switch (argv[1][1]) {
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


	// Node * curPos = rootNode;
	// int c = 0;
	// while(curPos != NULL){
	// 	curPos = curPos->children[1];
	// 	c++;
	// }
	// printf("%d\n", c);

	if (syntaxAnalysisOutput){
		printGraphString(rootNode);
	}

	return 0;
}