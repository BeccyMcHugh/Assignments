import mysql.connector
from config import USER, PASSWORD, HOST


class DbConnectionError(Exception):
    pass


def _connect_to_db(db_name):
    connection = mysql.connector.connect(
        host=HOST,
        user=USER,
        password=PASSWORD,
        auth_plugin='mysql_native_password',
        database=db_name
    )
    return connection


def _map_values(schedule):
    mapped = []
    for item in schedule:
        mapped.append({
            'subject': item[0],
            'staff_member': item[1],
            '3.30': 'Not Available' if item[2] else 'Available',
            '3.40': 'Not Available' if item[3] else 'Available',
            '3.50': 'Not Available' if item[4] else 'Available',
            '4.00': 'Not Available' if item[5] else 'Available',
            '4.10': 'Not Available' if item[6] else 'Available',
            '4.20': 'Not Available' if item[7] else 'Available',
            '4.30': 'Not Available' if item[8] else 'Available',
            '4.40': 'Not Available' if item[9] else 'Available',
            '4.50': 'Not Available' if item[10] else 'Available',
            '5.00': 'Not Available' if item[11] else 'Available',
            '5.10': 'Not Available' if item[12] else 'Available',
            '5.20': 'Not Available' if item[13] else 'Available',
            '5.30': 'Not Available' if item[14] else 'Available',
            '5.40': 'Not Available' if item[15] else 'Available',
            '5.50': 'Not Available' if item[16] else 'Available',
            '6.00': 'Not Available' if item[17] else 'Available',
            '6.10': 'Not Available' if item[18] else 'Available',
            '6.20': 'Not Available' if item[19] else 'Available',
            '6.30': 'Not Available' if item[20] else 'Available',
            '6.40': 'Not Available' if item[21] else 'Available',
            '6.50': 'Not Available' if item[22] else 'Available',
        })
    return mapped


def get_all_booking_availability():
    availability = []
    try:
        db_name = 'parents_evening'
        db_connection = _connect_to_db(db_name)
        cursor = db_connection.cursor()
        print("Connected to DB: %s" % db_name)

        query = """
            SELECT  subject, staff_member, `3.30`, `3.40`, `3.50`, `4.00`, `4.10`, `4.20`, `4.30`, `4.40`, `4.50`, 
            `5.00`, `5.10`, `5.20`, `5.30`, `5.40`, `5.50`, `6.00`, `6.10`, `6.20`, `6.30`, `6.40`, `6.50`
            FROM bookings 
            """

        cursor.execute(query)

        result = cursor.fetchall()  # this is a list with db records where each record is a tuple
        availability = _map_values(result)
        cursor.close()

    except Exception:
        raise DbConnectionError("Failed to read data from DB")

    finally:
        if db_connection:
            db_connection.close()
            print("DB connection is closed")

    return availability


def add_booking(staff_member, time, parent_name):
    try:
        db_name = 'parents_evening'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor()
        print("Connected to DB: %s" % db_name)

        query = """
            UPDATE  bookings
            SET
                `{time}` = 1,
                `{time_id}` = '{parent_name}'
            WHERE staff_member = '{staff_member}'
            """.format(time=time, time_id=time + '-booking-id', parent_name=parent_name, staff_member=staff_member)

        cur.execute(query)
        db_connection.commit()
        cur.close()

    except Exception:
        raise DbConnectionError("Failed to read data from DB")

    finally:
        if db_connection:
            db_connection.close()
            print("DB connection is closed")


def delete_booking(staff_member, time):
    try:
        db_name = 'parents_evening'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor()
        print("Connected to DB: %s" % db_name)

        query = """
            UPDATE  bookings
            SET
                `{time}` = null,
                `{time_id}` = null
            WHERE staff_member = '{staff_member}'
            """.format(time=time, time_id=time + '-booking-id', staff_member=staff_member)

        # query = """
        #     UPDATE  bookings
        #     SET
        #         `3.40` = null,
        #         `3.40-booking-id` = null
        #     WHERE staff_member = 'Miss Austen'
        #     """

        cur.execute(query)
        db_connection.commit()
        cur.close()

    except Exception:
        raise DbConnectionError("Failed to read data from DB")

    finally:
        if db_connection:
            db_connection.close()
            print("DB connection is closed")


if __name__ == '__main__':
    get_all_booking_availability()
