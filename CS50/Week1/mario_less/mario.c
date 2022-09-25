#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // decalre our heigh int variable; must be inside int main(void)
    int height;

    // prompt user for input height from 1-8 inclusive
    // if input is not 1-8 reprompt user again do while loop
    do
    {
        height = get_int("Pick a number 1-8: ");
    }
    while (height < 1 || height > 8);

    // need to repaet a code a x amount of times
    // a for loop would be best for this

    // for each row loop thorugh i up to height num. Inclusive.
    for (int i = 0; i < height; i++) // had i <= height which made it print a row of dots and no #, moved this to the #'s for loop
    {
        // print dots(eventually spaces) based on row and total height
        // printf(spaces - height - 1)
        for (int dots = 0; dots < height - i - 1; dots++)
        {
            printf(" "); // changed from "." to " "
        }

        // for each column loop thorugh j for each i num. Noninclusive
        for (int j = 0; j <= i; j++) // had to make j
        {
            // print a brick
            printf("#");
        }

        // move to next row
        printf("\n");

    }
}
