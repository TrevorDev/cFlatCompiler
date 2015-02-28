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
	char cval;
	float fval;
	Node * node;
	int btype; // int = 0, char = 1, float = 2
}
// Token 
%token <sval> INT_LIT
%token <sval> CHAR_LIT
%token <sval> FLOAT_LIT
%token <sval> VOID_LIT
%token SINGLE_QUOTE
%token NEW_LINE
%token NULL_CHAR
%token <sval> PLUS_PLUS
%token <sval> PLUS
%token <sval> MINUS_MINUS
%token <sval> MINUS
%token <sval> STAR
%token <sval> SLASH
%token <sval> MODULUS
%token <sval> EQUALITY
%token <sval> INEQUALITY
%token <sval> LESS_THAN
%token <sval> GREATER_THAN
%token <sval> LESS_THAN_OR_EQUAL_TO
%token <sval> GREATER_THAN_OR_EQUAL_TO
%token <sval> LOGICAL_AND
%token <sval> LOGICAL_OR
%token <sval> NOT
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
%token <cval> CHAR
%token TYPEDEF
%token COMMA
%token STRUCT
%token END_OF_FILE

// Precedence
%left MINUS PLUS
%left STAR SLASH
%precedence NEG

// Types
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
%type <node> expr
%type <node> assign_var_name_iden
%type <node> comma_iden_assign_list
%type <node> assign_var_decl
%type <node> assign_var_list
%type <node> global_var_list

%% /* Grammar rules and actions follow */

program:	type_decl_list global_var_list END_OF_FILE // function_def_list
				{
					rootNode = create_program($1, $2);
					return 0;
				}
;

global_var_list: assign_var_list
				{
					printf("global var list\n");
					$$ = create_global_var_list($1);
				}
				|
				/*Empty*/
				{
					printf("empty global_var_list\n");
					$$ = NULL;
				}
;

type_decl_list: type_decl_list type_decl
				{
					printf("typedec list\n");
					$$ = create_type_decl_list($1, $2);
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
					$$ = create_assign_var_list($1, $2);
				}
				|
				assign_var_decl
				{
					$$ = create_assign_var_list(NULL, $1);
				}
;

assign_var_decl: type_iden comma_iden_assign_list SEMICOLON
				{
					$$ = create_assign_var_decl($1, $2);
				}
;

comma_iden_assign_list: assign_var_name_iden COMMA comma_iden_assign_list 
				{
					$$ = create_comma_iden_assign_list($1, $3);
				}
				|
				assign_var_name_iden
				{
					$$ = create_comma_iden_assign_list($1, NULL);
				}
;

assign_var_name_iden: var_name_iden 
				{
					$$ = create_assign_var_name_iden($1, NULL);
				}
				| 
				var_name_iden ASSIGNMENT expr
				{
					$$ = create_assign_var_name_iden($1, $3);
				}
;

expr: 			INT
				{
					Node * temp = create_int_val($1);
					$$ = create_expr(temp, NULL, NULL);
				}
				|
				FLOAT
				{
					Node * temp = create_float_val($1);
					$$ = create_expr(temp, NULL, NULL);
				}
				|
				CHAR
				{
					Node * temp = create_char_val($1);
					$$ = create_expr(temp, NULL, NULL);
				}
				|
				expr PLUS expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr MINUS expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr STAR expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr SLASH expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				BRACKET_OPEN expr BRACKET_CLOSE
				{
					$$ = create_expr($2, NULL, NULL);
				}
				|
				MINUS expr %prec NEG
				{
					Node * temp = create_operator($1);
					$$ = create_expr(NULL, temp, $2);
				}
;

var_list: var_list var_decl
				{
					$$ = create_var_list($1, $2);
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