# propt user to get height of pyramid
# declare height varibel
height = 0
# promt user until they choose a # betwwen 1-8 and not anything else
while height < 1 or height > 8:
    try:
        height = int(input("What is the height of the pyrimad. Choose between 1 - 8\n"))
    except ValueError:
        print("we must use an integer between 1 and 8!")


# loop through the height first by row
for row in range(height):
    # we need to account for spacces example 1st if height was 5 iterate = 5 - 0 -1 which equals 4 spaces 1 #
    for spance in range(height - row-1):
        # be sure to take out new line in python with end=""
        print(" ", end="")
        # loop through the cols of each row
    for col in range(row + 1):
        # print out # after the spaces
        print("#", end="")
    # prints the gap between the front and back cols
    print("  ", end="")
    # loop through the 2nd set of cols sgetr the 2 space gap
    for col2 in range(row + 1):
        print("#", end="")
    print()
