#include <stdlib.h>
#include <stdio.h>

#include "nodes.h"

#define maxNumChild 10


Node *createNode(){
	Node *ret = malloc(sizeof(*ret));
	//ret->children = calloc(sizeof(Node*), maxNumChild);
	int i = 0;
	return ret;
}

Node * createProgramNode(Node * type_decl_list){
	Node *ret = createNode();
	ret->nodeType = ProgramNode_t;
	ret->children.Program.type_decl_list = type_decl_list;
	return ret;
}

Node *createTypeDeclList(Node *existingList, Node *newTypeDecl) {
	Node *ret = createNode();
	ret->nodeType = TypeDeclList_t;
	ret->children.TypeDeclList_t.existingList = existingList;
	ret->children.TypeDeclList_t.newTypeDecl = newTypeDecl;
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
