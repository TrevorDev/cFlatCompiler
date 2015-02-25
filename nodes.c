#include <stdlib.h>
#include <stdio.h>
#include "nodes.h"

StmtListNode * createStmtListNode(StmtListNode * list, StmtNode * stmt){
	StmtListNode * ret = malloc(sizeof(*ret));
	ret->nodeType = StmtListNodeT;
	ret->stmtList = list;
	ret->stmt = stmt;
	return ret;
}

StmtNode * createStmtNode(void * val, int type){
	StmtNode * ret = malloc(sizeof(*ret));
	ret->nodeType = StmtNodeT;
	ret->valType = type;
	ret->val.ival = *val;
	return ret;
}

