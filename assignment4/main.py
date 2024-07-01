import requests
import json


def get_all_booking_availability():
    result = requests.get(
        'http://127.0.0.1:5000/availability',
        headers={'content-type': 'application/json'}
    )
    return result.json()


def add_new_booking(staff_member, time, parent_name):

    booking = {
         "staff_member": staff_member,
         "time": time,
         "parent_name": parent_name,
    }

    result = requests.put(
        'http://127.0.0.1:5000/booking',
        headers={'content-type': 'application/json'},
        data=json.dumps(booking)
    )
    print(result.json())

    return result.json()


def delete_appointment(staff_member, time, parent_name):

    booking = {
         "staff_member": staff_member,
         "time": time,
         "parent_name": parent_name,
    }

    result = requests.delete(
        'http://127.0.0.1:5000/booking',
        headers={'content-type': 'application/json'},
        data=json.dumps(booking)
    )
    print(result.json())

    return result.json()


def display_availability(records):
    # Print the names of the columns.
    print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15}"
          " {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} ".format(
                    'subject', 'staff_member', '3.30', '3.40', '3.50', '4.00', '4.10', '4.20', '4.30', '4.40', '4.50', '5.00',
                    '5.10', '5.20', '5.30', '5.40', '5.50', '6.00', '6.10', '6.20', '6.30', '6.40', '6.50'))
    print('-' * 420)

    # print each data item.
    for item in records:
        print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15}"
              " {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15} ".format(
            item['subject'], item['staff_member'], item['3.30'], item['3.40'], item['3.50'], item['4.00'],
            item['4.10'], item['4.20'], item['4.30'], item['4.40'], item['4.50'], item['5.00'], item['5.10'],
            item['5.20'], item['5.30'], item['5.40'], item['5.50'], item['6.00'], item['6.10'], item['6.20'],
            item['6.30'], item['6.40'], item['6.50']
        ))


def run():
    print('------------------------------------')
    print('Hello, welcome to our booking portal')
    print('------------------------------------')
    print()
    slots = get_all_booking_availability()
    print('--------- AVAILABILITY ---------')
    print()
    display_availability(slots)
    print()
    place_booking = input('Would you like to book an appointment (y/n)?  ')

    while place_booking == 'y':
        parent = input('Enter your name: ')
        teacher = input('Choose which teacher (Miss Austen, Mr Turing, etc): ')
        time = input('Choose time based on availability (e.g 3.50): ')
        add_new_booking(teacher, time, parent)
        # print("Booking is Successful")
        print()
        slots = get_all_booking_availability()
        display_availability(slots)
        place_booking = input('Would you like to make another booking y/n? ')

    if place_booking == 'n':
        delete = input('Would you like to delete a booking (y/n)? ')
        if delete == 'y':
            parent = input('Enter your name as it appears on the booking: ')
            teacher = input('Choose which teacher you want to delete your appointment with (e.g. Miss Austen): ')
            time = input('What time do you want to delete your booking for (e.g 3.50)? ')
            delete_appointment(teacher, time, parent)
            print()
            slots = get_all_booking_availability()
            display_availability(slots)
            print('Your booking has been deleted.')

        print('If you are having trouble with out booking system, please contact the school office on #555-6789.')

    print()
    print('See you soon!')


if __name__ == '__main__':
    run()
