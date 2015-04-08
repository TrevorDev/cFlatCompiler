#ifndef STACK_H
#define STACK_H

typedef struct {
	int n;
	void *elements[500];
} stack;

stack *stack_create();
void stack_push(stack *s, void *data);
void *stack_pop(stack *s);

#endif