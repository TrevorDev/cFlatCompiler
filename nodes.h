//THIS FILE IS GENERATED IN proNode/nodes.jc
#ifndef NODES_H
#define NODES_H

enum ValType {
	INTVAL,
	STRVAL,
	FLOATVAL
};
enum NodeType {
	program_t,
	type_decl_list_t,
	type_decl_t,
	var_name_iden_t,
	identifier_t,
	array_decl_t,
	base_type_lit_t,
	type_iden_t,
	struct_def_t,
	var_list_t,
	var_decl_t,
	comma_iden_list_t
};

typedef struct Node{
    int nodeType;
    union{
		
		struct program{
			struct Node * type_decl_list;
		}program;
		
		struct type_decl_list{
			struct Node * type_decl_list;
			struct Node * type_decl;
		}type_decl_list;
		
		struct type_decl{
			struct Node * type_iden;
			struct Node * var_name_iden;
		}type_decl;
		
		struct var_name_iden{
			struct Node * identifier;
			struct Node * array_decl;
		}var_name_iden;
		
		struct identifier{
			
		}identifier;
		
		struct array_decl{
			
		}array_decl;
		
		struct base_type_lit{
			
		}base_type_lit;
		
		struct type_iden{
			struct Node * base_type_lit;
			struct Node * identifier;
			struct Node * struct_def;
		}type_iden;
		
		struct struct_def{
			struct Node * identifier;
			struct Node * var_list;
		}struct_def;
		
		struct var_list{
			struct Node * var_list;
			struct Node * var_decl;
		}var_list;
		
		struct var_decl{
			struct Node * type_iden;
			struct Node * comma_iden_list;
		}var_decl;
		
		struct comma_iden_list{
			struct Node * comma_iden_list;
			struct Node * var_name_iden;
		}comma_iden_list;
		
    }children;
}Node;


	Node * create_program(Node * type_decl_list);

	Node * create_type_decl_list(Node * type_decl_list, Node * type_decl);

	Node * create_type_decl(Node * type_iden, Node * var_name_iden);

	Node * create_var_name_iden(Node * identifier, Node * array_decl);

	Node * create_identifier();

	Node * create_array_decl();

	Node * create_base_type_lit();

	Node * create_type_iden(Node * base_type_lit, Node * identifier, Node * struct_def);

	Node * create_struct_def(Node * identifier, Node * var_list);

	Node * create_var_list(Node * var_list, Node * var_decl);

	Node * create_var_decl(Node * type_iden, Node * comma_iden_list);

	Node * create_comma_iden_list(Node * comma_iden_list, Node * var_name_iden);

#endif