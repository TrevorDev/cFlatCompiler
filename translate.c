#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int translate_expr(Node *expr){
	if (strcmp(expr.operator.type, "+") == 0) || (strcmp(expr.operator.type, "-") == 0) || (strcmp(expr.operator.type, "*") == 0) ||
		(strcmp(expr.operator.type, "/") == 0){
		int left_expr = translate_expr(expr.left_expr);
		int right_expr = translate_expr(expr.right_expr);

	}
	else if (strcmp(expr.operator.type, "%") == 0){

	}
	else if (strcmp(expr.operator.type, "==") == 0){

	}
	else if (strcmp(expr.operator.type, "!=") == 0){

	}
	else if (strcmp(expr.operator.type, ">=") == 0){

	}
	else if (strcmp(expr.operator.type, "<=") == 0){

	}
	else if (strcmp(expr.operator.type, ">") == 0){

	}
	else if (strcmp(expr.operator.type, "<") == 0){

	}
	else if (strcmp(expr.operator.type, "&&") == 0){

	}
	else if (strcmp(expr.operator.type, "||") == 0){

	}
	else if (strcmp(expr.operator.type, "!") == 0){

	}
	else if (strcmp(expr.operator.type, "--") == 0){

	}
	else if (strcmp(expr.operator.type, "++") == 0){

	}
}
