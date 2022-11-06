import csv
import sys


def main():

    # Check for command-line usage
    if len(sys.argv) != 3:
        sys.exit("Missing command-line argument. 2 minimum.")

    # Read database file into a variable
    # need to crate a database bc we have rows and cols in our csv file
    database = []
    # read in files to that data base
    with open(sys.argv[1], 'r') as file:
        # create a reader opbject for the  file
        reader = csv.DictReader(file)
        # read in each line of the reader file
        for line in reader:
            # add the data to our database line by line
            database.append(line)

    # Read DNA sequence file into a variable
    # file pmly has a single line string so we do not need to have a [] variable
    with open(sys.argv[2], 'r') as file:
        DNA = file.read()

    # Find longest match of each STR in DNA sequence
    # Store sequences in list. first access the header row keys from our dict database, 2nd we do not need the 'name' key so we use index slicing to get rid of it[1:]
    subsequences = list(database[0].keys())[1:]

    # need a dict to store the subsequence matches as follows: {subsequence: counts}
    results = {}
    # itterate through the subsequeses one by and call the longest match funcatio for each sequence
    for subsequence in subsequences:
        # add the counts to our dictionary
        results[subsequence] = longest_match(DNA, subsequence)

    # Check database for matching profiles
    # look at each person in database
    for person_name in database:
        # declare match variable
        match = 0
        # look for each subsequance
        for subsequence in subsequences:
            # check to see if that persons's subsequance = to the result subsequance
            if int(person_name[subsequence]) == results[subsequence]:
                match += 1
        #  if there is a perfect match print that persons name
        if match == len(subsequences):
            print(person_name['name'])
            return

    # if there is no perfect match print no match
    print("No Match")


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    sequence_length = len(sequence)
    subsequence_length = len(subsequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
