%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//#include "graph.h"
#include "nodes.h"

extern int yylineno, commentsOn, tokenpos, tokenlen;
void yyerror(const char *msg);

int errorCount = 0;
extern char *linebuf;

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
%token <sval> ASSIGNMENT
%token SIZE_OF
%token IF
%token ELSE
%token FOR
%token RETURN
%token DOT
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
%right ASSIGNMENT
%left LOGICAL_OR
%left LOGICAL_AND
%left EQUALITY INEQUALITY
%left GREATER_THAN GREATER_THAN_OR_EQUAL_TO LESS_THAN LESS_THAN_OR_EQUAL_TO
%left MINUS PLUS
%left STAR SLASH MODULUS
%right SIZE_OF NOT 
%precedence NEG

// Types
%type <node> program
%type <node> type_decl_list
%type <node> type_decl
%type <node> struct_def
%type <node> base_type_lit
%type <node> type_iden
%type <node> array_decl
%type <node> variable
%type <node> param
%type <node> param_list
%type <node> function_def
%type <node> function_body
%type <node> function_def_list
%type <node> non_rec_variable
%type <node> assignment

%type <node> expr
%type <node> global_var_list

%type <node> var_name_iden
%type <node> assign_var_name_iden
%type <node> assign_var_decl
%type <node> assign_var_list
%type <node> comma_iden_assign_list

%type <node> array_defin
%type <node> comma_expr_list
%type <node> function_call

%% /* Grammar rules and actions follow */

program:	type_decl_list global_var_list function_def_list END_OF_FILE 
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

non_rec_variable: IDENTIFIER
				{
					Node *temp = create_identifier($1);
					$$ = create_non_rec_variable(temp, NULL);
				}
				|
				IDENTIFIER array_decl
				{
					Node *temp = create_identifier($1);
					$$ = create_non_rec_variable(temp, $2);
				}
;

variable:		non_rec_variable
				{
					$$ = create_variable($1, NULL);
				}
				|
				non_rec_variable DOT variable
				{
					$$ = create_variable($1, $3);
				}
;

array_decl: SQUARE_OPEN expr SQUARE_CLOSE
				{
					$$ = create_array_decl($2);
				}
;

array_defin: CONTROL_BLOCK_OPEN comma_expr_list CONTROL_BLOCK_CLOSE
				{
					$$ = create_array_defin($2);
				}
;

function_call:  IDENTIFIER BRACKET_OPEN comma_expr_list BRACKET_CLOSE
				{
					Node * temp = create_identifier($1);
					$$ = create_function_call(temp, $3);
				}
				|
				IDENTIFIER BRACKET_OPEN BRACKET_CLOSE
				{
					Node * temp = create_identifier($1);
					$$ = create_function_call(temp, NULL);
				}
;

function_def_list: function_def function_def_list
				{
					$$ = create_function_def_list($1, $2);
				}
				|
				function_def
				{
					$$ = create_function_def_list($1, NULL);
				}
;

function_def: type_decl IDENTIFIER BRACKET_OPEN param_list BRACKET_CLOSE CONTROL_BLOCK_OPEN function_body CONTROL_BLOCK_CLOSE
				{
					Node * temp = create_identifier($2);
					$$ = create_function_def($1, temp, $4, $7);
				}
;

function_body: global_var_list RETURN expr SEMICOLON
				{
					$$ = create_function_body($1, $3);
				}
;

param_list: param COMMA param_list
				{
					$$ = create_param_list($1, $3);
				}
				|
				param
				{
					$$ = create_param_list($1, NULL);
				}
;

param: type_iden IDENTIFIER
				{
					Node * temp = create_identifier($2);
					$$ = create_param($1, temp);
				}
;

comma_expr_list: expr
				{
					$$ = create_comma_expr_list($1, NULL);
				}
				|
				expr COMMA comma_expr_list
				{
					$$ = create_comma_expr_list($1, $3);
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

struct_def: STRUCT IDENTIFIER CONTROL_BLOCK_OPEN assign_var_list CONTROL_BLOCK_CLOSE
				{
					Node * temp = create_identifier($2);
					$$ = create_struct_def(temp, $4);
				}
				|
				STRUCT CONTROL_BLOCK_OPEN assign_var_list CONTROL_BLOCK_CLOSE
				{
					$$ = create_struct_def(NULL, $3);
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

assignment: variable ASSIGNMENT expr
 				{
 					$$ = create_assignment($1, $3);
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
				array_defin
				{
					$$ = create_expr($1, NULL, NULL);
				}
				|
				function_call
				{
					$$ = create_expr($1, NULL, NULL);
				}
				|
				variable
				{
					$$ = create_expr($1, NULL, NULL);
				}
				|
				assignment
				{
				 	$$ = create_expr($1, NULL, NULL);
				}
				|
				expr LESS_THAN expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr LESS_THAN_OR_EQUAL_TO expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr GREATER_THAN expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr GREATER_THAN_OR_EQUAL_TO expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				NOT expr
				{
					Node * temp = create_operator($1);
					$$ = create_expr(NULL, temp, $2);
				}
				|
				variable PLUS_PLUS
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, NULL);
				}
				|
				PLUS_PLUS variable
				{
					Node * temp = create_operator($1);
					$$ = create_expr(NULL, temp, $2);
				}
				|
				expr MINUS expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				variable MINUS_MINUS
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, NULL);
				}
				|
				MINUS_MINUS variable
				{
					Node * temp = create_operator($1);
					$$ = create_expr(NULL, temp, $2);
				}
				|
				expr EQUALITY expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr INEQUALITY expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr LOGICAL_AND expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr LOGICAL_OR expr
				{
					Node * temp = create_operator($2);
					$$ = create_expr($1, temp, $3);
				}
				|
				expr PLUS expr
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
				expr MODULUS expr
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
				|
				PLUS expr %prec NEG
				{
					Node * temp = create_operator($1);
					$$ = create_expr(NULL, temp, $2);
				}
;


%%

void yyerror(const char* msg) {
	fprintf(stderr, "%s on line %d\n", msg, yylineno);
	printf("\t%s\n", linebuf);
    printf("\t%*s\n", 1+tokenpos - tokenlen, "^");
	errorCount++;
	if (errorCount == 5) {
		fprintf(stderr, "Aborting compilation process - 5 syntax errors have been detected.\n");
		return;
	}
	while (!feof(stdin)) {
		int t;
		t = yylex();
		if (t == SEMICOLON || t == CONTROL_BLOCK_CLOSE) {
			break;
		}
	}
	yyparse();
}

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

	while(!feof(stdin)){
		yyparse();
	}

	if (commentsOn) {
		yyerror("Syntax error: Unterminated comment");
		return 1;
	}

	if (syntaxAnalysisOutput){
		printGraphString(rootNode);
	}

	return 0;
}