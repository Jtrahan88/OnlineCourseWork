import random
from replit import clear
logo = """
.------.            _     _            _    _            _    
|A_  _ |.          | |   | |          | |  (_)          | |   
|( \/ ).-----.     | |__ | | __ _  ___| | ___  __ _  ___| | __
| \  /|K /\  |     | '_ \| |/ _` |/ __| |/ / |/ _` |/ __| |/ /
|  \/ | /  \ |     | |_) | | (_| | (__|   <| | (_| | (__|   < 
`-----| \  / |     |_.__/|_|\__,_|\___|_|\_\ |\__,_|\___|_|\_\\
      |  \/ K|                            _/ |                
      `------'                           |__/           
"""


## The deck is unlimited in size.
## There are no jokers.
## The Jack/Queen/King all count as 10.
## The the Ace can count as 11 or 1.
## cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
## The cards in the list have equal probability of being drawn.
## Cards are not removed from the deck as they are drawn.
## The computer is the dealer.


def dealer_card():
    """Returns a random card from the deck"""
    cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    card = random.choice(cards)
    return card

# calculatescore function
def calculate_score(cards):
    """Take a list of cards and return score from cards"""
    if sum(cards) == 21 and len(cards) == 2:
        return 0
    if 11 in cards and sum(cards) > 21:
        cards.remove(11)
        cards.append(1)
    return sum(cards)

# compare function
def compare(user_score, computer_score):
    if user_score == computer_score:
        return "Draw"
    elif computer_score == 0:
        return "Lose, opponent has Blackjack"
    elif user_score > 21:
        return 'You went over 21 you Lose'
    elif computer_score > 21:
        return "Computer went over. You win! "
    elif user_score > computer_score:
        return "You Win"
    else:
        return "You lose."


def play_game():
    print(logo)
    # set up cards for computer and user
    user_cards = []
    computer_cards = []
    is_game_over = False
    for _ in range(2):
        user_cards.append(dealer_card())
        computer_cards.append(dealer_card())



    # user while loop to caluclte user cards
    while not is_game_over:
        user_score = calculate_score(user_cards)
        computer_score = calculate_score(computer_cards)
        print(f' Your cards are: {user_cards}, your score is {user_score}')
        print(f' Computer card is: {computer_cards[0]}')

        if user_score == 0 or computer_score == 0 or user_score == 21:
            is_game_over = True
        else:
            user_should_deal = input("Type 'y' to get another card, type 'n' to pass: ").lower()
            if user_should_deal == 'y':
                user_cards.append(dealer_card())
            else:
                is_game_over = True


    # computer while loop to caluclute its cards
    while computer_score != 0 and computer_score < 17:
        computer_cards.append(dealer_card())
        computer_score = calculate_score(computer_cards)
    print(f"Your final hand was {user_cards}, and your score was {user_score}")
    print(f"computer final hand was {computer_cards}, score was {computer_score}")

    print(compare(user_score, computer_score))


while input("Do you want to play a game of black jack? Type 'y' or 'n': ") == 'y':
    clear()
    play_game()













