#include <stdlib.h>
#include <stdio.h>

#include "nodes.h"
#include "graph.h"

#define maxNumChild 10


Node *createNode(enum NodeType t, void (*printNode)(struct Node *node, int parentId)){
	Node *ret = malloc(sizeof(*ret));
	ret->nodeType = t;
	ret->printNode = printNode;
	return ret;
}

Node *createProgram(Node * type_decl_list){
	Node *ret = createNode(Program_t, &printProgramNode);
	ret->children.Program.type_decl_list = type_decl_list;
	return ret;
}

Node *createTypeDecl(Node * type_iden, Node * var_name_iden){
	Node *ret = createNode(TypeDecl_t, &printTypeDeclNode);
	ret->children.TypeDecl.type_iden = type_iden;
	ret->children.TypeDecl.var_name_iden = var_name_iden;
	return ret;
}

Node *createTypeDeclList(Node * type_decl_list, Node *type_decl) {
	Node *ret = createNode(TypeDeclList_t, &printTypeDeclListNode);
	ret->children.TypeDeclList.type_decl_list = type_decl_list;
	ret->children.TypeDeclList.type_decl = type_decl;
	return ret;
}

Node *createVarNameIden(Node *identifier, int array_size) {
	Node *ret = createNode(VarNameIden_t, &printVarNameIdenNode);
	ret->children.VarNameIden.identifier = identifier;
	ret->children.VarNameIden.array_size = array_size;
	return ret;
}

Node *createArrayDecl(int array_size) {
	Node *ret = createNode(ArrayDecl_t, NULL);
	ret->children.ArrayDecl.array_size = array_size;
	return ret;
}

Node *createBaseTypeLit(int type){
	Node *ret = createNode(BaseTypeLit_t, &printBaseTypeLit);
	if (type == 0){
		sprintf(ret->children.BaseTypeLit.literal, "int");
	}
	else if (type == 1){
		sprintf(ret->children.BaseTypeLit.literal, "char");
	}
	else if (type == 2){
		sprintf(ret->children.BaseTypeLit.literal, "float");
	}

	return ret;
}


Node *createTypeIden(Node *type) {
	Node *ret = createNode(TypeIden_t, &printTypeIdenNode);
	ret->children.TypeIden.type = type;
	return ret;
}

Node *createIden(char *identifier) {
	Node *ret = createNode(Iden_t, &printIdenNode);
	ret->children.Iden.identifier = identifier;
	return ret;
}

Node *createStructDef(Node *identifier, Node *var_list) {
	Node *ret = createNode(StructDef_t, NULL);
	ret->children.StructDef.identifier = identifier;
	ret->children.StructDef.var_list = var_list;
	return ret;
}


Node *createVarList(Node *var_list, Node* var_decl) {
	Node *ret = createNode(VarList_t, NULL);
	ret->children.VarList.var_list = var_list;
	ret->children.VarList.var_decl = var_decl;
	return ret;
}


// Node *createStmtListNode(Node *list, Node *stmt)
// {
// 	Node *ret = createNode();
// 	ret->nodeType = StmtListNodeT;
// 	ret->children[stmtC] = stmt;
// 	ret->children[stmtListC] = list;
// 	return ret;
// }

// Node *createStmtNode(void *val, int type)
// {
// 	Node *ret = createNode();
// 	ret->nodeType = StmtNodeT;
// 	ret->valType = type;
// 	if(type == INTVAL){
// 		ret->val.ival = *((int*)val);
// 	}else if(type == FLOATVAL){
// 		ret->val.fval = *((float*)val);
// 	}else if(type == STRVAL){
// 		ret->val.sval = ((char*)val);
// 	}
// 	return ret;
// }
