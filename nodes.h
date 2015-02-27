#ifndef NODES_H
#define NODES_H

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};

enum NodeType {
	ProgramNode_t
};



typedef struct Node{
    int nodeType;

    union{
    	struct ProgramNode{
			struct Node * type_decl_list;
		}ProgramNode;
    }children;
}Node;

Node *createNode();
// Node *createStmtListNode(Node *list, Node *stmt);
// Node *createStmtNode(void *val, int type);

#endif