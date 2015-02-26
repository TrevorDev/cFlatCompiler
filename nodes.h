#ifndef NODES_H
#define NODES_H

enum NodeType {
	StmtListNodeT,
	StmtNodeT
};

enum StmtListNodeC {
	stmtC,
	stmtListC,
	StmtListNodeCount
};

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};

typedef struct Node{
    int nodeType;
    int valType;
    union{
		int ival;
		char *sval;
		float fval;
	}val;
	struct Node ** children;
}Node;

Node *createNode();
Node *createStmtListNode(Node *list, Node *stmt);
Node *createStmtNode(void *val, int type);

#endif