// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <strings.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N];

// declare vairabale in the load function
unsigned int word_count = 0;
unsigned int hash_value;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // is the word in the dictionary or not?

    // find which index to start at in the has table
    int hash_check = hash(word);

    // create a cursor variable that will itterate though the enitre hash table's index(linked list) untill we get a NULL or find the word.
    node *cursor = table[hash_check];

    // Loop until the end of the hashtable's linked list aka NULL
    while (cursor != NULL)
    {
        // Compare the cusor value is the same as the hash tables linked list value
        if (strcasecmp(cursor->word, word) == 0)
        {
            return true;
        }
        // other wise move the cursor to the node in the linked list
        cursor = cursor->next;
    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{

    // original CS50 code
    // return toupper(word[0]) - 'A'; // -------doesn't work causes memory errors


    // // Use ASCII chart to get the algorithm
    // make a total vaulble for our calculations for the SUM of the ASCII values
    unsigned long total = 0;

    // loop through each word
    for (int i = 0, length = strlen(word); i < length; i++)
    {
        // add up each ASCII letter value to total
        total += tolower(word[i]);
    }
    // to be sure we do not go over our N value (26) we need to use % to wrap around like we did in cipher
    return total % N;

}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // open file and load it into a hash table("buckets")
    FILE *file = fopen(dictionary, "r");

    // check is file is NULL or empty
    if (file == NULL)
    {
        // Show error message if NULL
        printf("File %s is empty(NULL) and can not open \n", dictionary);
        return false;
    }

    // need to delcare our vailabe for each word
    char tempWord[LENGTH + 1];

    // read strings from file one at a time, check if file is empty (!= EOF)
    // fscanf = fscanf reads from a file pointed by the FILE pointer (ptr), instead of reading from the input stream.
    // Syntax = fscanf(FILE *ptr, const char *format, ...)
    while (fscanf(file, "%s", tempWord) != EOF)
    {
        //  We need to allocate memory for  new node
        node *newNode = malloc(sizeof(node));

        // check if malloc returns NULL, if so return false
        if (newNode == NULL)
        {
            return false;
        }

        // copy word from dictionary into the node, used strcpy here
        strcpy(newNode->word, tempWord); // copies the new word to the struct node

        // use the hash function - takes a string and returns an index
        hash_value = hash(tempWord);

        // need to pint to the first node of the linked list(Hash table) that is not NULL
        newNode->next = table[hash_value];

        // Then point the header of the hash table to the temp file's word
        table[hash_value] = newNode; // So we do not get an orphan child

        // keep track of the word counts
        word_count++;
    }
    fclose(file);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // return the size of the word counts
    return word_count;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // check each word in the hash tables inedx linked list and if word is not found free up node
    for (int i = 0; i < N; i++)
    {
        // if the hash table linked list is not NULL we need to free up the node value
        if (table[i] != NULL)
        {
            free(table[i]);
        }
    }
    return true;
}
