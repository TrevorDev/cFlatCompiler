#ifndef NODES_H
#define NODES_H

enum NodeType {
	StmtListNodeT,
	StmtNodeT
};

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};

typedef struct StmtNode{
    int nodeType;
    int valType;
    union{
		int ival;
		char *sval;
		float fval;
	}val;
}StmtNode;

typedef struct StmtListNode{
    int nodeType;
    StmtNode* stmt;
    struct StmtListNode* stmtList;
}StmtListNode;

StmtListNode *createStmtListNode(StmtListNode *list, StmtNode *stmt);
StmtNode *createStmtNode(void *val, int type);

#endif