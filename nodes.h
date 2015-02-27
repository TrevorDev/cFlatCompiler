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
	VarNameIden_t,
	TypeDeclList_t,
	ArrayDecl_t,
	BaseTypeLit_t
};

typedef struct Node{
    int nodeType;

    union{
    	struct Program{
			struct Node * type_decl_list;
		}Program;

		struct TypeDecl{
			struct Node * type_iden;
			struct Node * var_name_iden;
		}TypeDecl;

		struct VarNameIden{
			char * identifier;
			int array_size;
		}VarNameIden;

		struct TypeDeclList {
			struct Node * type_decl_list;
			struct Node * type_decl;
		} TypeDeclList;

		struct ArrayDecl {
			int array_size;
		} ArrayDecl;

		struct BaseTypeLit {
			char literal[6];
		} BaseTypeLit;

    }children;
}Node;

Node * createProgram(Node * type_decl_list);
Node * createTypeDecl(Node * type_iden, Node * var_name_iden);
Node *createTypeDeclList(Node *existingList, Node *newTypeDecl);
Node *createVarNameIden(char *identifier, int array_size);

#endif