import requests
from random import randint

# This API does not require a key
# If you did need to use one you would follow the guidance for the API and load the key into a header


def get_input(question):
    return input(question).lower()


def main_game():
    characters = 'https://potterhead-api.vercel.app/api/characters'

    response = requests.get(characters)
    # print(response.status_code)

    raw_data = response.json()
    # pp(raw_data)
    name_input = input('What is your first and last name? ')
    gender_input = get_input('What is your gender? male or female ')
    house_input = get_input('Which is your favourite Hogwarts house? Gryffindor, Ravenclaw, Hufflepuff or Slytherin ')

    matching_characters = []
    for character in raw_data:
        if gender_input == character['gender'] and house_input == (character['house']).lower():
            matching_characters.append(character)
    result_message = ""
    if len(matching_characters) == 0:
        result_message = 'You have matched with Argus Filch... better luck next time\n'
    else:
        index = randint(0, len(matching_characters)-1)

        matching_character = matching_characters[index]
        name = matching_character['name']
        patronus = matching_character['patronus']
        actor = matching_character['actor']
        split_name = name_input.split()
        first_name = split_name[0]
        result_message = ('{}, the character you have matched with is {}. They have a {} patronus and they were played '
                          'by {} in the films.\n').format(first_name, name, patronus or 'unknown', actor or 'no one')
    print(result_message)
    with open('harry_potter.txt', 'a') as file:
        file.write(result_message)


main_game()
try_again = input('Would you like to try again? y/n ')
while try_again == 'y':
    main_game()
    try_again = input('Would you like to try again? y/n ')

print('Thank you for playing!')
