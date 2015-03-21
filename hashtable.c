#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "hashtable.h"

struct hashElement {
	void *key, *data;
	struct hashElement *next;
};

struct HashTable {
	int size;
	struct hashElement **buckets;
	void (*delete)(void *);
	unsigned int (*hash)(void *);
	int (*key_compare)(void *, void *);
};

HashTable *hash_table_create(unsigned int size, void (*delete)(void *), unsigned int (*hash)(void *), int (*key_compare)(void *, void *))
{
	HashTable *h;

	if (!hash || !key_compare) {
		return NULL;
	}

	h = malloc(sizeof(*h));
	if (!h) {
		return NULL;
	}
	h->hash = hash;
	h->size = size;
	h->buckets = calloc(sizeof(*h->buckets), h->size);
	h->delete = delete;
	h->key_compare = key_compare;
	return h;
}

void hash_table_destroy(HashTable *h)
{
	int i;
	if (!h) {
		return;
	}
	for (i = 0; i < h->size; i++) {
		if (h->buckets[i]) {
			if (h->delete) {
				h->delete(h->buckets[i]->data);
			}
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
	unsigned int hash;
	struct hashElement *e, *e2;

	if (!h) {
		return;
	}
	//printf("about to hash\n");
	hash = h->hash(key) % h->size;
	//printf("hash: %d\n", hash);
	e = malloc(sizeof(*e));
	if (!e) {
		return;
	}
	e->data = data;
	e->key = key;
	e->next = h->buckets[hash];
	h->buckets[hash] = e;
}

void *hash_table_retrieve(HashTable *h, void *key)
{
	int hash;
	struct hashElement *e;

	if (!h) {
		return NULL;
	}
	hash = h->hash(key) % h->size;
	for (e = h->buckets[hash]; e; e = e->next) {
		if (!h->key_compare(key, e->key)) {
			return e->data;
		}
	}
	return NULL;
}

void *hash_table_retrieve_after(HashTable *h, void *data)
{
	struct hashElement *e;
	int i, found;

	if (!h) {
		return NULL;
	}

	found = data ? 0 : 1;
	for (i = 0; i < h->size; i++) {
		for (e = h->buckets[i]; e; e = e->next) {
			if (found) {
				return e->data;
			}
			if (e->data == data) {
				found = 1;
			}
		}
	}	
	return NULL;
}
