# make this so we can have our function later in our code instead of on top. Here for practice
def main():

    # prompt user for change owed
    change = 0
    while change <= 0:
        try:
            change = float(input("How much change is owed?: \n"))
        except ValueError:
            print("Must be a number or a value higher than 0!")

    # count number of quaters
    quaters = calculate_quaters(change)
    # then subtract teh quarter amount from teh change user provided
    change = round(change - quaters * .25, 2)

    # count number of dimes
    dimes = calculate_dimes(change)
    # then subtract teh quarter amount from teh change user provided
    change = round(change - dimes * .1, 2)

    # count number of nickels
    nickels = calculate_nickels(change)
    # then subtract teh quarter amount from teh change user provided
    change = round(change - nickels * .05, 2)

    # count number of pennies
    pennies = calculate_pennies(change)
    # then subtract teh quarter amount from teh change user provided
    change = round(change - pennies * .01, 2)

    # add up all coints
    coins = quaters + dimes + nickels + pennies
    print(round(coins))


def calculate_quaters(change):
    """Count number of quaters"""
    return change // .25


def calculate_dimes(change):
    """Count number of dimes """
    return change // .10


def calculate_nickels(change):
    """Count number of nickels """
    return change // .05


def calculate_pennies(change):
    """Count number of pennies """
    return change / .01


main()
