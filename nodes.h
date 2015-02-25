#ifndef NODES_H
# define NODES_H

struct Node {
    int nodeType;          /* WORD or operator token like AND, OR */
    node* leftOperand;
    node* rightOperand;    /* will be null if the node is a term */
}

%union 
{
    int number;
    char *string;
    Node *node;
}

#endif