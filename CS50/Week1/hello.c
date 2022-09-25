#include <cs50.h>
#include <stdio.h>



int main(void)
{
    // Get user name
    string name = get_string("What's your name?\n");
    // print out hellos and format to include user answer
    printf("hello, %s\n", name);
}
