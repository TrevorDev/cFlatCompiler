#include <stdlib.h>
#include <stdio.h>
#include "nodes.h"


Node *createNode(enum NodeType t){
	Node *ret = malloc(sizeof(*ret));
	ret->nodeType = t;
	return ret;
}


	Node *createprogram(Node * type_decl_list){
		Node *ret = createNode(program_t);
		ret->children.program.type_decl_list = type_decl_list;
		return ret;
	}

	Node *createtype_decl_list(Node * type_decl_list, Node * type_decl){
		Node *ret = createNode(type_decl_list_t);
		ret->children.type_decl_list.type_decl_list = type_decl_list;
		ret->children.type_decl_list.type_decl = type_decl;
		return ret;
	}

	Node *createtype_decl(Node * type_iden, Node * var_name_iden){
		Node *ret = createNode(type_decl_t);
		ret->children.type_decl.type_iden = type_iden;
		ret->children.type_decl.var_name_iden = var_name_iden;
		return ret;
	}

	Node *createvar_name_iden(Node * identifier, Node * array_decl){
		Node *ret = createNode(var_name_iden_t);
		ret->children.var_name_iden.identifier = identifier;
		ret->children.var_name_iden.array_decl = array_decl;
		return ret;
	}

	Node *createidentifier(){
		Node *ret = createNode(identifier_t);
		
		return ret;
	}

	Node *createarray_decl(){
		Node *ret = createNode(array_decl_t);
		
		return ret;
	}

	Node *createbase_type_lit(){
		Node *ret = createNode(base_type_lit_t);
		
		return ret;
	}

	Node *createtype_iden(Node * base_type_lit, Node * identifier, Node * struct_def){
		Node *ret = createNode(type_iden_t);
		ret->children.type_iden.base_type_lit = base_type_lit;
		ret->children.type_iden.identifier = identifier;
		ret->children.type_iden.struct_def = struct_def;
		return ret;
	}

	Node *createstruct_def(Node * identifier, Node * var_list){
		Node *ret = createNode(struct_def_t);
		ret->children.struct_def.identifier = identifier;
		ret->children.struct_def.var_list = var_list;
		return ret;
	}

	Node *createvar_list(Node * var_list, Node * var_decl){
		Node *ret = createNode(var_list_t);
		ret->children.var_list.var_list = var_list;
		ret->children.var_list.var_decl = var_decl;
		return ret;
	}

	Node *createvar_decl(Node * type_iden, Node * comma_iden_list){
		Node *ret = createNode(var_decl_t);
		ret->children.var_decl.type_iden = type_iden;
		ret->children.var_decl.comma_iden_list = comma_iden_list;
		return ret;
	}

	Node *createcomma_iden_list(Node * comma_iden_list, Node * var_name_iden){
		Node *ret = createNode(comma_iden_list_t);
		ret->children.comma_iden_list.comma_iden_list = comma_iden_list;
		ret->children.comma_iden_list.var_name_iden = var_name_iden;
		return ret;
	}


