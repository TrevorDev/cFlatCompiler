#ifndef HASH_TABLE_H
#define HASH_TABLE_H

struct HashTable;
typedef struct HashTable HashTable;

HashTable *hash_table_create(unsigned int size, void (*delete)(void *), unsigned int (*hash)(void *));
void hash_table_destroy(HashTable *h);

#endif