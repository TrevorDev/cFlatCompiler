#include <stdlib.h>
#include <stdio.h>

#include "nodes.h"
#include "graph.h"

int nodeId = 0;
FILE *fp;

void printNode(char *label, int myNodeId, int parentId){

	fprintf(fp, "\t%d [label=\"%s\", shape=box];\n", myNodeId, label);


	if (parentId > -1) {
		fprintf(fp, "\t%d -> %d;\n", parentId, myNodeId);
	}
}

void printProgramNode(Node *node, int parentId){
	nodeId++;
	int myNodeId = nodeId;

	printTree(node->children.Program.type_decl_list, myNodeId);
	printNode("Program", myNodeId, -1);
}

void printTypeDeclListNode(Node *node, int parentId){
	nodeId++;
	int myNodeId = nodeId;

	printTree(node->children.TypeDeclList.type_decl_list, myNodeId);
	printTree(node->children.TypeDeclList.type_decl, myNodeId);
	printNode("TypeDeclList", myNodeId, parentId);
}

void printTypeDeclNode(Node *node, int parentId){
	nodeId++;
	int myNodeId = nodeId;

	printTree(node->children.TypeDecl.type_iden, myNodeId);
	printTree(node->children.TypeDecl.var_name_iden, myNodeId);
	printNode("TypeDecl", myNodeId, parentId);
}
	
void printTypeIdenNode(Node *node, int parentId) {
	nodeId++;
	int myNodeId = nodeId;

	printTree(node->children.TypeIden.type, myNodeId);
	printNode("TypeIdentifier", myNodeId, parentId);
}

void printVarNameIdenNode(Node *node, int parentId) {
	nodeId++;
	int myNodeId = nodeId;
	int temp = 0;
	printTree(node->children.VarNameIden.identifier, myNodeId);
	printNode("VarNameIden", myNodeId, parentId);
	nodeId++;
	temp = nodeId;
	fprintf(fp, "\t%d [label=\"%d\", shape=box];\n", temp, node->children.VarNameIden.array_size);
	fprintf(fp, "\t%d -> %d;\n", myNodeId, temp);

}

void printIdenNode(Node *node, int parentId)  {
	nodeId++;
	int myNodeId = nodeId;

	fprintf(fp, "\t%d [label=\"%s\", shape=box];\n", myNodeId, node->children.Iden.identifier);
	fprintf(fp, "\t%d -> %d;\n", parentId, myNodeId);
}

void printBaseTypeLit(Node *node, int parentId){
	nodeId++;
	int myNodeId = nodeId;

	fprintf(fp, "\t%d [label=\"%s\", shape=box];\n", myNodeId, node->children.BaseTypeLit.literal);
	fprintf(fp, "\t%d -> %d;\n", parentId, myNodeId);
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
