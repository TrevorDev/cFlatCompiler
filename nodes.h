#ifndef NODES_H
#define NODES_H

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};

enum NodeType {
	Program_t,
	TypeDecl_t,
	VarNameIden_t
};



typedef struct Node{
    int nodeType;

    union{
    	struct Program{
			struct Node * type_decl_list;
		}Program;
		struct TypeDecl{
			struct Node * type_iden;
			struct Node * type_decl_list;
		}TypeDecl;
		struct VarNameIden{
			struct Node * type_iden;
			struct Node * type_decl_list;
		}VarNameIden;
    }children;
}Node;

Node *createNode();
// Node *createStmtListNode(Node *list, Node *stmt);
// Node *createStmtNode(void *val, int type);

#endif