#include <cs50.h>
#include <stdio.h>

int get_cents(void);
int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void)
{
    // Ask how many cents the customer is owed
    int cents = get_cents();

    // Calculate the number of quarters to give the customer
    int quarters = calculate_quarters(cents);
    cents = cents - quarters * 25;

    // Calculate the number of dimes to give the customer
    int dimes = calculate_dimes(cents);
    cents = cents - dimes * 10;

    // Calculate the number of nickels to give the customer
    int nickels = calculate_nickels(cents);
    cents = cents - nickels * 5;

    // Calculate the number of pennies to give the customer
    int pennies = calculate_pennies(cents);
    cents = cents - pennies * 1;

    // Sum coins
    int coins = quarters + dimes + nickels + pennies;

    // Print total number of coins to give the customer
    printf("%i\n", coins);

}

int get_cents(void)
{
    // ask for a cent amount above 0 and not letters
    // delcare our varable
    int cash;
    do
    {
        cash = get_int("How many cents are there?: \n");
    }
    while (cash < 0);

    return cash;
}

int calculate_quarters(int cents)
{
    // find the number of quarters there are in the user amount
    return cents / 25;
}

int calculate_dimes(int cents)
{
    // find the number of dimes in user amount
    return cents / 10;
}

int calculate_nickels(int cents)
{
    // find the number of nickles in user amount
    return cents / 5;
}

int calculate_pennies(int cents)
{
    // find the number of pennies in user amount
    return cents / 1;
}
