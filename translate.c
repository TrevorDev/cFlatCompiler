#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int translate_expr(Node *expr){
	if (strcmp(expr.operator.type, "+") == 0) || (strcmp(expr.operator.type, "-") == 0) || (strcmp(expr.operator.type, "*") == 0) ||
		(strcmp(expr.operator.type, "/") == 0){

		int left_expr = translate_expr(expr.left_expr);
		int right_expr = translate_expr(expr.right_expr);

		if (left_expr != T_INT) &&  (left_expr != T_REAL){
			// ERROR
		}

		if (right_expr != T_INT) && (right_expr != T_REAL){
			// ERROR
		}

		if (right_expr == T_REAL) || (left_expr == T_REAL){
			// TYPE PROMOTION
			return T_REAL;
		}
	}
	else if (strcmp(expr.operator.type, "%%") == 0){
		if (right_expr == T_INT) && (left_expr == T_INT){
			return T_INT;
		}
		else{
			// ERROR
		}
	}
	else if (strcmp(expr.operator.type, "==") == 0) || (strcmp(expr.operator.type, "!=") == 0) || (strcmp(expr.operator.type, ">=") == 0) ||
		(strcmp(expr.operator.type, "<=") == 0) || (strcmp(expr.operator.type, ">") == 0) || (strcmp(expr.operator.type, "<") == 0){

		if (left_expr != T_INT) &&  (left_expr != T_REAL){
			// ERROR
		}

		if (right_expr != T_INT) && (right_expr != T_REAL){
			// ERROR
		}

		if (right_expr == T_REAL) || (left_expr == T_REAL){
			// TYPE PROMOTION
		}
		return T_INT;
	}
	else if (strcmp(expr.operator.type, "&&") == 0) ||  (strcmp(expr.operator.type, "||") == 0){
		
	}
	else if (strcmp(expr.operator.type, "!") == 0){

	}
	else if (strcmp(expr.operator.type, "--") == 0) || (strcmp(expr.operator.type, "++") == 0){
		if (left_expr != T_INT) &&  (left_expr != T_REAL) && (left_expr != NULL){
			// ERROR
		}

		if (right_expr != T_INT) && (right_expr != T_REAL) && (right_expr != NULL){
			// ERROR
		}
	}
}
