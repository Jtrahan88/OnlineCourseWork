#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    //Check total scores

    // if scorces are equal
    if (score1 > score2)
    {
        printf("Player 1 Wins!\n");
    }
    // if score1 is > score 2
    else if (score2 > score1)
    {
        printf("Player 2 Wins!\n");
    }
    // if score 2 is > score 1
    else
    {
        printf("Tie!\n");

    }
}

int compute_score(string word)
{
    int total = 0;
    // iretate through each word to get each char one by one
    for (int i = 0, n = strlen(word); i < n; i++)
    {
        //  if the char is upper case we make it lowercase
        if (isupper(word[i]))
        {
            word[i] = tolower(word[i]);
        }
        // if the chars is not between a - z in ASCII(97-122) ignore
        if (word[i] >= 'a' && word[i] <= 'z')
        {
            // TODO tie in ASCII order to POINTS array order to sum up scrabble values
            total += POINTS[word[i] - 'a'];
        }

    }
    // printf("total: %i\n", total);
    return total;
}
