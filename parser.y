%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//#include "graph.h"
#include "nodes.h"
#include "hashtable.h"

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

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

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

%type <node> stmt
%type <node> select_stmt
%type <node> expr_or_empty
%type <node> iter_stmt
%type <node> stmt_list
%type <node> return_stmt

%% /* Grammar rules and actions follow */

program:	type_decl_list global_var_list END_OF_FILE 
			{
				rootNode = create_program($1, $2, NULL);
				return 0;
			}
;

stmt: 	expr SEMICOLON
		{
			$$ = create_stmt($1);
		}
		|
		CONTROL_BLOCK_OPEN stmt_list CONTROL_BLOCK_CLOSE
		{
			$$ = create_stmt($2);
		}
		|
		assign_var_decl
		{
			$$ = create_stmt($1);
		}
		|
		select_stmt
		{
			$$ = create_stmt($1);
		}
		|
		iter_stmt
		{
			$$ = create_stmt($1);
		}
		|
		return_stmt
		{
			$$ = create_stmt($1);
		}
;

return_stmt: RETURN expr_or_empty SEMICOLON
			{
				$$ = create_return_stmt($2);
			}
;

select_stmt: IF BRACKET_OPEN expr BRACKET_CLOSE stmt %prec LOWER_THAN_ELSE
			{
				$$ = create_select_stmt($3, $5, NULL);
			}
			|
			IF BRACKET_OPEN expr BRACKET_CLOSE stmt ELSE stmt
			{
				$$ = create_select_stmt($3, $5, $7);
			}
;

expr_or_empty: expr
				{
					$$ = $1;
				}
				|
				/* empty */
				{
					$$ = NULL;
				}
;

iter_stmt: WHILE BRACKET_OPEN expr BRACKET_CLOSE stmt
			{
				$$ = create_iter_stmt($3, NULL, NULL, $5);
			}
			|
			FOR BRACKET_OPEN expr_or_empty SEMICOLON expr_or_empty SEMICOLON expr_or_empty BRACKET_CLOSE stmt
			{
				$$ = create_iter_stmt($3, $5, $7, $9);
			}
;

stmt_list:  stmt stmt_list
			{
				$$ = create_stmt_list($1, $2);
			}
			|
			stmt
			{
				$$ = create_stmt_list($1, NULL);
			}
;

global_var_list: assign_var_list
				{
					$$ = create_global_var_list($1);
				}
;

type_decl_list: type_decl_list type_decl
				{
					$$ = create_type_decl_list($1, $2);
				}
				|
				/*Empty*/
				{
					$$ = NULL;
				}
;

type_decl: TYPEDEF type_iden var_name_iden SEMICOLON
				{
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
					Node *temp = create_identifier($1);
					$$ = create_function_call(temp, $3);
				}
				|
				IDENTIFIER BRACKET_OPEN BRACKET_CLOSE
				{
					Node *temp = create_identifier($1);
					$$ = create_function_call(temp, NULL);
				}
;

function_def: IDENTIFIER BRACKET_OPEN param_list BRACKET_CLOSE CONTROL_BLOCK_OPEN function_body CONTROL_BLOCK_CLOSE
				{
					Node *temp = create_identifier($1);
					$$ = create_function_def(temp, $3, $6);
				}
				|
				IDENTIFIER BRACKET_OPEN param_list BRACKET_CLOSE CONTROL_BLOCK_OPEN CONTROL_BLOCK_CLOSE
				{
					Node *temp = create_identifier($1);
					$$ = create_function_def(temp, $3, NULL);
				}
				|
				IDENTIFIER BRACKET_OPEN BRACKET_CLOSE CONTROL_BLOCK_OPEN function_body CONTROL_BLOCK_CLOSE
				{
					Node *temp = create_identifier($1);
					$$ = create_function_def(temp, NULL, $5);
				}
				|
				IDENTIFIER BRACKET_OPEN VOID_LIT BRACKET_CLOSE CONTROL_BLOCK_OPEN function_body CONTROL_BLOCK_CLOSE
				{
					Node *temp = create_identifier($1);
					Node *temp2 = create_base_type_lit($3);
					$$ = create_function_def(temp, temp2, $6);
				}
;

function_body: stmt_list
				{
					$$ = create_function_body($1);
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

assign_var_list: assign_var_decl assign_var_list
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
				|
				type_iden function_def
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

extern int yyerrstate;

int lastErrorLine = -1, lastTokenPlace = -1;

void yyerror(const char* msg) {
	if (yylineno == lastErrorLine && lastTokenPlace == 1 + tokenpos - tokenlen) {
		//yyparse();
		return;
	}
	lastErrorLine = yylineno;
	lastTokenPlace = 1 + tokenpos - tokenlen;

	fprintf(stderr, "%s on line %d\n", msg, yylineno);
	printf("%s\n", linebuf ? linebuf : "");
    printf("%*s\n", 1 + tokenpos - tokenlen, "^");
	errorCount++;
	if (errorCount == 5) {
		fprintf(stderr, "Aborting compilation process - 5 syntax errors have been detected.\n");
		return;
	}
	while (!feof(stdin)) {
		int t;
		t = yylex();
		if (t == SEMICOLON || t == CONTROL_BLOCK_CLOSE) {
			printf("hit semicolon or control block close\n");
			break;
		}
	}
	yyparse();
}

unsigned int hash (void *v)
{
	char *s0 = v;
	unsigned int h=0;
	char *s;
	for (s = s0; *s; s++) {
		h = h*65599 + *s;
	}
	
	return(h);
}


int key_compare(void *k1, void *k2) {
	//printf("in %s with %s and %s\n", __FUNCTION__, (char *) k1, (char *) k2);
	return strcmp(k1, k2);
}

void delete(void *v) {
	return;
}

HashTable *global_type_table;
HashTable *global_iden_table;
HashTable *local_iden_table;

int trav_type_decl_list(Node * n){

}

int trav_tree(Node * n){
	// if(n->nodeType == type_decl_list_t){
	// 	trav_type_decl_list(n);
	// }
	// trav_tree()
}

int main(int argc, char *argv[]) {
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

	if (asmOutput) {
		if (errorCount == 0) {
			printf("valid C flat code\n");
		}
		else {
			fprintf(stderr, "invalid C flat code\n");
		}
	}

	global_type_table = hash_table_create(128, delete, hash, key_compare);
	{
		//setup global types
		symbolTableType int_t = {4, 0, NULL, "int"};
		symbolTableType float_t = {4, 0, NULL, "float"};
		symbolTableType char_t = {4, 0, NULL, "char"};
		hash_table_insert(global_type_table, "int", &int_t);
		hash_table_insert(global_type_table, "float", &float_t);
		hash_table_insert(global_type_table, "char", &char_t);
	}
	


	trav_node(rootNode);

	hash_table_destroy(global_type_table);

	
	if (syntaxAnalysisOutput){
		printGraphString(rootNode);
	}

	return errorCount ? 1 : 0;
}