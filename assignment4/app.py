from flask import Flask, jsonify, request
from db_utils import get_all_booking_availability, add_booking, delete_booking

app = Flask(__name__)


@app.route('/availability')
def get_bookings():
    result = get_all_booking_availability()
    return jsonify(result)


@app.route('/booking', methods=['PUT'])
def book_appointment():
    booking = request.get_json()
    add_booking(
        staff_member=booking['staff_member'],
        time=booking['time'],
        parent_name=booking['parent_name'],
    )
    return booking


@app.route('/booking', methods=['DELETE'])
def delete_appointment():
    booking = request.get_json()
    try:
        delete_booking(
            staff_member=booking['staff_member'],
            time=booking['time'],
        )
    except Exception as e:
        print(e)
    return booking


if __name__ == '__main__':
    app.run(debug=True, port=5000)
