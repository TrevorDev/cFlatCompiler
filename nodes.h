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

typedef struct{
    int nodeType;
    int valType;
    union{
		int ival;
		char *sval;
		float fval;
	}val;
}StmtNode;

typedef struct _StmtListNode{
    int nodeType;
    StmtNode* stmt;
    struct _StmtListNode* stmtList;
}StmtListNode;



#endif