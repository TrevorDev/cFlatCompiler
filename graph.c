#include <stdlib.h>
#include <stdio.h>

#include "nodes.h"

int nodeId = 0;
FILE *fp;

void printTree(Node *root, int parentId){
	int type = root->nodeType;
	nodeId++;
	int myNodeID = nodeId;

	if(type == StmtListNodeT){
		fprintf(fp, "\t%d [label=\"stmt_list\", shape=box];\n", myNodeID);
		if (parentId != 0)
			fprintf(fp, "\t%d -> %d;\n", parentId, myNodeID);
		if (root->children){
			printTree(root->children[0], myNodeID);

			// Ensure it has a value
			if (root->children[1])
				printTree(root->children[1], myNodeID);
		}
	}
	else if(type == StmtNodeT){
		type = root->valType;
		fprintf(fp, "\t%d -> %d;\n", parentId, myNodeID);

		if(type == INTVAL){
			fprintf(fp, "\t%d [label=\"%d\", shape=box];\n", myNodeID, root->val.ival);
		}
		else if(type == FLOATVAL){
			fprintf(fp, "\t%d [label=\"%f\", shape=box];\n", myNodeID, root->val.fval);
		}
		else if(type == STRVAL){
			fprintf(fp, "\t%d [label=\"%s\", shape=box];\n", myNodeID, root->val.sval);
		}
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
