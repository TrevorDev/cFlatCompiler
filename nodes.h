#ifndef NODES_H
#define NODES_H

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};

enum NodeType {
	Program_t,
	TypeDeclList_t
};



typedef struct Node{
    int nodeType;

    union{
    	struct Program {
			struct Node *type_decl_list;
		} Program;

		struct TypeDeclList {
			struct Node *
		} TypeDeclList;

    }children;
}Node;

Node *createNode();
// Node *createStmtListNode(Node *list, Node *stmt);
// Node *createStmtNode(void *val, int type);
Node *createTypeDeclList(Node *, Node *);

#endif