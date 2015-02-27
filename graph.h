#include "nodes.h"

void printTree(Node *node, int parentId);
void printGraphString(Node *root);
void printProgramNode(Node *node, int parentId);
void printTypeDeclNode(Node *node, int parentId);
void printTypeDeclListNode(Node *node, int parentId);
void printVarNameIdenNode(Node *node, int parentId);
void printIdenNode(Node *node, int parentId);
void printTypeIdenNode(Node *node, int parentId);
void printBaseTypeLit(Node *node, int parentId);
void printNode(char *label, int myNodeId, int parentId);