//THIS FILE IS GENERATED IN proNode/nodes.jc
#include <stdlib.h>
#include <stdio.h>
#include "nodes.h"
int nodeId = 0;
FILE* fp;


Node *create_Node(enum NodeType t, void (*printNode)(struct Node *node, int parentId)){
	Node *ret = malloc(sizeof(*ret));
	ret->nodeType = t;
	ret->printNode = printNode;
	return ret;
}

void printTree(Node *node, int parentId){
	if (node) {
		node->printNode(node, parentId);
 	}
 	return;
 }

 void printGraphString(Node * root){
	fp = fopen("graph.txt", "w");
	fprintf(fp, "digraph G {\n");
	printTree(root, nodeId);
	fprintf(fp, "}\n");
	fflush(fp);
	fclose(fp);
}

void printNode(char *label, int myNodeId, int parentId){

	fprintf(fp, "\t%d [label=\"%s\", shape=box];\n", myNodeId, label);


	if (parentId > 0) {
		fprintf(fp, "\t%d -> %d;\n", parentId, myNodeId);
	}
}


	Node *create_program(Node * type_decl_list ){


		Node *ret = create_Node(program_t, &program_p);
		ret->children.program.type_decl_list = type_decl_list;
		
		return ret;
	}

	Node *create_type_decl_list(Node * type_decl_list, Node * type_decl ){


		Node *ret = create_Node(type_decl_list_t, &type_decl_list_p);
		ret->children.type_decl_list.type_decl_list = type_decl_list;
		ret->children.type_decl_list.type_decl = type_decl;
		
		return ret;
	}

	Node *create_type_decl(Node * type_iden, Node * var_name_iden ){


		Node *ret = create_Node(type_decl_t, &type_decl_p);
		ret->children.type_decl.type_iden = type_iden;
		ret->children.type_decl.var_name_iden = var_name_iden;
		
		return ret;
	}

	Node *create_var_name_iden(Node * identifier, Node * array_decl ){


		Node *ret = create_Node(var_name_iden_t, &var_name_iden_p);
		ret->children.var_name_iden.identifier = identifier;
		ret->children.var_name_iden.array_decl = array_decl;
		
		return ret;
	}

	Node *create_identifier(char* val ){


		Node *ret = create_Node(identifier_t, &identifier_p);
		ret->children.identifier.val=val;
		
		return ret;
	}

	Node *create_array_decl(int size ){


		Node *ret = create_Node(array_decl_t, &array_decl_p);
		ret->children.array_decl.size=size;
		
		return ret;
	}

	Node *create_base_type_lit(char* iden ){


		Node *ret = create_Node(base_type_lit_t, &base_type_lit_p);
		ret->children.base_type_lit.iden=iden;
		
		return ret;
	}

	Node *create_type_iden(Node * type ){


		Node *ret = create_Node(type_iden_t, &type_iden_p);
		ret->children.type_iden.type = type;
		
		return ret;
	}

	Node *create_struct_def(Node * identifier, Node * var_list ){


		Node *ret = create_Node(struct_def_t, &struct_def_p);
		ret->children.struct_def.identifier = identifier;
		ret->children.struct_def.var_list = var_list;
		
		return ret;
	}

	Node *create_var_list(Node * var_list, Node * var_decl ){


		Node *ret = create_Node(var_list_t, &var_list_p);
		ret->children.var_list.var_list = var_list;
		ret->children.var_list.var_decl = var_decl;
		
		return ret;
	}

	Node *create_var_decl(Node * type_iden, Node * comma_iden_list ){


		Node *ret = create_Node(var_decl_t, &var_decl_p);
		ret->children.var_decl.type_iden = type_iden;
		ret->children.var_decl.comma_iden_list = comma_iden_list;
		
		return ret;
	}

	Node *create_comma_iden_list(Node * comma_iden_list, Node * var_name_iden ){


		Node *ret = create_Node(comma_iden_list_t, &comma_iden_list_p);
		ret->children.comma_iden_list.comma_iden_list = comma_iden_list;
		ret->children.comma_iden_list.var_name_iden = var_name_iden;
		
		return ret;
	}



	void program_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.program.type_decl_list, myNodeId);
		printNode("program", myNodeId, parentId);

		
		
		
		
	};

	void type_decl_list_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.type_decl_list.type_decl_list, myNodeId);
		printTree(node->children.type_decl_list.type_decl, myNodeId);
		printNode("type_decl_list", myNodeId, parentId);

		
		
		
		
	};

	void type_decl_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.type_decl.type_iden, myNodeId);
		printTree(node->children.type_decl.var_name_iden, myNodeId);
		printNode("type_decl", myNodeId, parentId);

		
		
		
		
	};

	void var_name_iden_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.var_name_iden.identifier, myNodeId);
		printTree(node->children.var_name_iden.array_decl, myNodeId);
		printNode("var_name_iden", myNodeId, parentId);

		
		
		
		
	};

	void identifier_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		
		printNode("identifier", myNodeId, parentId);

		nodeId++;temp = nodeId;
fprintf(fp, "%d [label=\"%s\", shape=box];", temp, node->children.identifier.val);
fprintf(fp, "%d -> %d;", myNodeId, temp);
		
		
		
	};

	void array_decl_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		
		printNode("array_decl", myNodeId, parentId);

		nodeId++;temp = nodeId;
fprintf(fp, "%d [label=\"%d\", shape=box];", temp, node->children.array_decl.size);
fprintf(fp, "%d -> %d;", myNodeId, temp);
		
		
		
	};

	void base_type_lit_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		
		printNode("base_type_lit", myNodeId, parentId);

		nodeId++;temp = nodeId;
fprintf(fp, "%d [label=\"%s\", shape=box];", temp, node->children.base_type_lit.iden);
fprintf(fp, "%d -> %d;", myNodeId, temp);
		
		
		
	};

	void type_iden_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.type_iden.type, myNodeId);
		printNode("type_iden", myNodeId, parentId);

		
		
		
		
	};

	void struct_def_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.struct_def.identifier, myNodeId);
		printTree(node->children.struct_def.var_list, myNodeId);
		printNode("struct_def", myNodeId, parentId);

		
		
		
		
	};

	void var_list_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.var_list.var_list, myNodeId);
		printTree(node->children.var_list.var_decl, myNodeId);
		printNode("var_list", myNodeId, parentId);

		
		
		
		
	};

	void var_decl_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.var_decl.type_iden, myNodeId);
		printTree(node->children.var_decl.comma_iden_list, myNodeId);
		printNode("var_decl", myNodeId, parentId);

		
		
		
		
	};

	void comma_iden_list_p(Node * node, int parentId){
		nodeId++;
		int myNodeId = nodeId;
		int temp = 0;
		printTree(node->children.comma_iden_list.comma_iden_list, myNodeId);
		printTree(node->children.comma_iden_list.var_name_iden, myNodeId);
		printNode("comma_iden_list", myNodeId, parentId);

		
		
		
		
	};
