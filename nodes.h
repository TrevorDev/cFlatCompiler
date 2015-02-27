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
	BaseTypeLit_t,
	TypeIden_t,
	Iden_t,
	StructDef_t,
	VarList_t
};

typedef struct Node{
    int nodeType;
    void (*printNode)(struct Node *node, int parentId);
    union{
    	struct Program{
			struct Node * type_decl_list;
		}Program;

		struct TypeDecl{
			struct Node * type_iden;
			struct Node * var_name_iden;
		}TypeDecl;

		struct VarNameIden{
			struct Node *identifier;
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

		struct TypeIden {
			struct Node *type;
		} TypeIden;

		struct Iden {
			char *identifier;
		} Iden;

		struct StructDef {
			struct Node *identifier;
			struct Node *var_list;
		} StructDef;

		struct VarList {
			struct Node *var_list;
			struct Node *var_decl;
		} VarList;

    }children;
}Node;

Node *createProgram(Node * type_decl_list);
Node *createTypeDecl(Node * type_iden, Node * var_name_iden);
Node *createTypeDeclList(Node *existingList, Node *newTypeDecl);
Node *createVarNameIden(Node *identifier, int array_size);
Node *createTypeIden(Node *type);
Node *createIden(char *identifier);
Node *createBaseTypeLit(int type);
Node *createTypeIden(Node *type);
Node *createIden(char *identifier);
Node *createStructDef(Node *identifier, Node *var_list);
Node *createVarList(Node *var_list, Node* var_decl);

#endif