#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "stack.h"

stack *stack_create()
{
	stack *s;
	s = malloc(sizeof(*s));
	if (!s) {
		return NULL;
	}
	s->n = 0;
	memset(s->elements, 0, sizeof(s->elements));
	return s;
}

void stack_push(stack *s, void *data)
{
	if (!s || !data) {
		return;
	}
	memmove(&(s->elements[1]), &(s->elements[0]), s->n * sizeof(void *));
	s->elements[0] = data;
	s->n++;
}

void *stack_pop(stack *s)
{
	void *ret;
	if (!s || s->n <= 0) {
		return NULL;
	}
	ret = s->elements[0];
	memmove(&(s->elements[0]), &(s->elements[1]), s->n * sizeof(void *));
	s->n--;
	return ret;
}

#ifdef STACKTEST

int main()
{
	stack *s = stack_create();
	stack_push(s, strdup("1"));
	stack_push(s, strdup("2"));
	stack_push(s, strdup("3"));

	printf("%s\n", stack_pop(s));
	printf("%s\n", stack_pop(s));
	printf("%s\n", stack_pop(s));
	printf("%s\n", stack_pop(s));
}

#endif
