#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // declare varables
    int height, row, col, space, col2, space2;
    // Get height of pyramid
    do
    {
        height = get_int("Height of pyramid, 1-8 only: ");
    }
    while (height < 1 || height > 8);

    // for loop base on height of pyramid

    for (row = 0; row < height; row++)
    {
        // get the spaces by height - row_num - 1
        for (space = 0; space < height - row - 1; space++)
        {
            printf(" ");
        }
        // print out # as long as col is less than row
        for (col = 0; col <= row; col++)
        {
            printf("#");
        }

        // back end of pyramid has to come before the next line is made

        // need to print out only one space after first pyramid
        printf("  ");



        // print out # for other side of pyramid
        for (col2 = 0;  col2 <= row;  col2++)
        {
            printf("#");
        }

        // next row to print out # on
        printf("\n");
    }




}
