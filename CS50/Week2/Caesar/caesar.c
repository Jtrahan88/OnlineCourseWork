#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

// declare our funsctions

// check to see if we have at least argc == 2
int arg_count_check(int argc);

// check to make sure only digits where used
string only_digits(string argv);

// cipher function
string cipher(string argv, string plaintext);

int main(int argc, string argv[])
{
    // variables:
    string plaintext;

    // check counts
    int arg_counts = arg_count_check(argc);
    // printf("%i\n", arg_counts); // check funtion output for argc counts

    // check for digits only
    string digit_test = only_digits(argv[1]);
    // printf("%i\n", atoi(digit_test)); // test function returns

    //  promp user to get plain text
    plaintext = get_string("Plaintext:  ");

    // call our cipher funtion
    string test = cipher(argv[1], plaintext);
    printf("ciphertext: %s\n", test);

}

// Function declarations

// check to see if we have at least argc == 2
int arg_count_check(int argc)
{
    // check to see if our arguement count(argc) is = 2
    if (argc != 2)
    {
        // if not output to user this message

        printf("Usage: ./caesar key\n");
        // exit() = The number indicates the exit status. 0 is no failure, everything larger then 0 indicates an error.
        exit(1); // used exit status(1) becasue return give me a Segmentation fault (core dumped) issue.
    }
    else
    {
        return argc;
    }

}



// digit only check
string only_digits(string argv)
{
    // check if argv is blank if

    if (argv == NULL)
    {
        // printf("Usage: ./caesar key\n");
        exit(1);
    }


    // printf("%s\n", s); //here to test string inputs by user
    // check to see if argv is a digit
    for (int i = 0, length = strlen(argv); i < length; i++)
    {
        if (isalpha(argv[i]))
        {
            printf("Usage: ./caesar key\n");
            exit(1);
        }
    }
    return argv;

}

//  cipher function
string cipher(string argv, string plaintext)
{
    // convert argv to int
    int key = atoi(argv);


    // iterate through plain text
    for (int i = 0, length = strlen(plaintext); i < length; i ++)
    {
        // Ci = (Pi + k) % 26

        // check for upper case and upper case letters
        if (isupper(plaintext[i]) && isalpha(plaintext[i]))
        {
            // run cipher on upper ASCII only, check is above 'Z' if so start for 'A'
            plaintext[i] = (plaintext[i] - 'A' + key) % 26 + 'A';
        }

        // run cipher on lower ASCII only, check is above 'z' if so start for 'a'
        else if (islower(plaintext[i]) && isalpha(plaintext[i]))
        {
            plaintext[i] = (plaintext[i] - 'a' + key) % 26 + 'a';
        }
    }
    return plaintext;



}
