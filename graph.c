#include <stdlib.h>
#include <stdio.h>

#include "nodes.h"

int nodeId = 0;

void printTree(Node *root, int parentId){
	int type = root->nodeType;
	nodeId++;
	int myNodeID = nodeId;

	if(type == StmtListNodeT){
		printf("\t%d [label=\"stmt_list\", shape=box];\n", myNodeID);
		if (parentId != 0)
			printf("\t%d -> %d;\n", parentId, myNodeID);
		if (root->children){
			printTree(root->children[0], myNodeID);

			// Ensure it has a value
			if (root->children[1])
				printTree(root->children[1], myNodeID);
		}
	}
	else if(type == StmtNodeT){
		type = root->valType;
		printf("\t%d -> %d;\n", parentId, myNodeID);

		if(type == INTVAL){
			printf("\t%d [label=\"%d\", shape=box];\n", myNodeID, root->val.ival);
		}
		else if(type == FLOATVAL){
			printf("\t%d [label=\"%f\", shape=box];\n", myNodeID, root->val.fval);
		}
		else if(type == STRVAL){
			printf("\t%d [label=\"%s\", shape=box];\n", myNodeID, root->val.sval);
		}
	}
	return;
}

void printGraphString(Node * root){
	printf("digraph G {\n");
	printTree(root, nodeId);
	printf("}\n");
}
