#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "hashtable.h"

struct hashElement {
	int hash;
	void *data;
};

struct HashTable {
	int size;
	struct hashElement **buckets;
	void (*delete)(void *);
	unsigned int (*hash)(void *);
};

HashTable *hash_table_create(unsigned int size, void (*delete)(void *), unsigned int (*hash)(void *))
{
	HashTable *h;

	if (!hash) {
		return NULL;
	}

	h = malloc(sizeof(*h));
	if (!h) {
		return NULL;
	}
	h->size = size;
	h->buckets = calloc(sizeof(*h->buckets), h->size);
	h->delete = delete;
	return h;
}

void hash_table_destroy(HashTable *h)
{
	int i;
	if (!h || !h->delete) {
		return;
	}
	for (i = 0; i < h->size; i++) {
		if (h->buckets[i]) {
			h->delete(h->buckets[i]->data);
			free(h->buckets[i]);
			h->buckets[i] = NULL;
		}
	}
	free(h->buckets);
	h->buckets = NULL;
	free(h);
	h = NULL;
}

void hash_table_insert(HashTable *h, void *key, void *data)
{
	int hash;
	struct hashElement *e;

	if (!h) {
		return;
	}
	hash = h->hash(key);
	if (h->buckets[hash]) {
		fprintf(stderr, "Hash table collision on insertion");
		exit(1);
	}
	e = malloc(sizeof(*e));
	if (!e) {
		return;
	}
	e->hash = hash;
	e->data = data;
	h->buckets[hash] = e;
}

void *hash_table_retrieve(HashTable *h, void *key)
{
	int hash;
	if (!h) {
		return NULL;
	}
	hash = h->hash(key);
	if (!h->buckets[hash]) {
		return NULL;
	}
	return h->buckets[hash]->data;
}







