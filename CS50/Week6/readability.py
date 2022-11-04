# Figure out grade level

punctuations = [".", "!", "?"]


def main():
    # get user input
    text = input("Enter some text to see grade level: ")

    # get letter counts
    letters = letter_counter(text)

    # get sentence counts
    sentences = sentence_counter(text)

    # get word counts
    words = word_counter(text)

    # calculate Coleman-Liau index
    Coleman_Liau = Coleman_Liau_index(letters, sentences, words)

    if Coleman_Liau < 1:
        print("Before Grade 1")
    elif Coleman_Liau > 16:
        print("Grade 16+")
    else:
        print(f"Grade {Coleman_Liau}")


def letter_counter(text):
    """Count number of letters"""
    letters = 0
    for char in text:
        if char.isalpha():
            letters += 1
    return letters


def sentence_counter(text):
    "Count number of sentences based on puncuation"""
    sentences = 0
    for char in text:
        if char in punctuations:
            sentences += 1
    return sentences


def word_counter(text):
    """count teh number of words"""
    words = 0
    for char in text:
        if char == " ":
            words += 1
    return words + 1


def Coleman_Liau_index(letters, sentences, words):
    """Coleman-Liau index is computed as 0.0588 * L - 0.296 * S - 15.8, where L is the average number of letters per 100 words in the text,
    #  and S is the average number of sentences per 100 words in the text."""
    L = (letters / words) * 100
    S = (sentences / words) * 100
    Coleman_Liau = round((0.0588 * L) - (0.296 * S) - 15.8)
    return Coleman_Liau


main()
