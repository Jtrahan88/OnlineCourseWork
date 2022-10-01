#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

// delcare our functions
int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
int coleman_liau(int letters, int words, int sentences);

int main(void)
{
    // Get user promt fopr text
    string user_text = get_string("Text: ");

    // call letter counter function
    int letter_counts = count_letters(user_text);
    // printf("%i letters\n", letter_counts); // Test letter counts

    // call word counter function
    int word_counts = count_words(user_text);
    // printf("%i words\n", word_counts); // Test word counts

    // call our sentence counter function
    int sentence_counts = count_sentences(user_text);
    // printf("%i sentences\n", sentence_counts); // Test sentence counts

    // calculate Coleman-Liau algorithm. call function
    int grade = coleman_liau(letter_counts, word_counts, sentence_counts);

    // print grade based on conditions
    if (grade >= 16)
    {
        printf("Grade 16+\n");
    }
    else if (grade <= 1)
    {
        printf("Before Grade 1\n");
    }
    else
    {
        printf("Grade %i\n", grade);
    }

}

// Functions

// count the number of letters
int count_letters(string text)
{
    // make a letter counter
    int letters = 0;
    // Loop through each char in the text
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        // set up counts only if the letter are between a-z or A-Z
        if (isalpha(text[i]))
        {
            // add one to letter Count if condition is met
            letters += 1;
        }
    }
    return letters;
}

//  Count the number of words
int count_words(string text)
{
    // make a word count
    int word_count = 0;
    // loop through all of text
    for (int i = 0, length = strlen(text); i < length; i++)
    {
        //  need to count the words only. If we count teh spaces that seperate words we will get all teh words
        // except teh last one. just add 1
        if (isspace(text[i]))
        {
            word_count += 1;
        }
    }
    return word_count + 1;
}

// Count number of sentences

int count_sentences(string text)
{
    // sentence counter
    int sentence_count = 0;
    //  iterate through our user text
    for (int i = 0, length = strlen(text); i < length; i++)
    {
        //  loop for ending punctuation to count each sentance: '.' , '!' , or '?'
        if (text[i] == '.' | text[i] == '!' | text[i] == '?')
        {
            sentence_count += 1;
        }
    }
    return sentence_count;
}

// calculate formula
int coleman_liau(int letters, int words, int sentences)
{
    // concer ints to floats
    float L, S, idx;
    // L = get avergage number of letter per 100 words. Casted to float
    L = ((float) letters / words) * 100;

    // printf("L is = to: %f\n", L); //check L

    // S = get average number of sentences per 100 words. Casted to float
    S = ((float) sentences / words) * 100;

    // printf("S is = to: %f\n", S); // check  S

    // Coleman-Liau index algorithm: index(grade) = 0.0588 * L - 0.296 * S -15.8
    idx = round((0.0588 * L) - (0.296 * S) - 15.8); // needed to round as well

    // printf("Grade is = to: %f", idx); // check grade


    return idx;

}
