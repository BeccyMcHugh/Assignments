CREATE DATABASE parents_evening;

USE parents_evening;

CREATE TABLE bookings (
	subject varchar (20) NOT NULL,
	staff_member varchar (20) NOT NULL,
	330_340 INT (11) DEFAULT NULL,
	330_340_booking_id varchar(20) DEFAULT NULL,
	340_350 INT (11) DEFAULT NULL,
	340_350_booking_id varchar(20) DEFAULT NULL,
	350_400 INT (11) DEFAULT NULL,
	350_400_booking_id varchar(20) DEFAULT NULL,
	400_410 INT (11) DEFAULT NULL,
	400_410_booking_id varchar(20) DEFAULT NULL,
	410_420 INT (11) DEFAULT NULL,
	410_420_booking_id varchar(20) DEFAULT NULL,
	420_430 INT (11) DEFAULT NULL,
	420_430_booking_id varchar(20) DEFAULT NULL,
	430_440 INT (11) DEFAULT NULL,
	430_440_booking_id varchar(20) DEFAULT NULL,
	440_450 INT (11) DEFAULT NULL,
	440_450_booking_id varchar(20) DEFAULT NULL,
	450_500 INT (11) DEFAULT NULL,
	450_500_booking_id varchar(20) DEFAULT NULL,
	500_510 INT (11) DEFAULT NULL,
	500_510_booking_id varchar(20) DEFAULT NULL,
	510_520 INT (11) DEFAULT NULL,
	510_520_booking_id varchar(20) DEFAULT NULL,
	520_530 INT (11) DEFAULT NULL,
	520_530_booking_id varchar(20) DEFAULT NULL,
	530_540 INT (11) DEFAULT NULL,
	530_540_booking_id varchar(20) DEFAULT NULL,
	540_550 INT (11) DEFAULT NULL,
	540_550_booking_id varchar(20) DEFAULT NULL,
	550_600 INT (11) DEFAULT NULL,
	550_600_booking_id varchar(20) DEFAULT NULL,
	600_610 INT (11) DEFAULT NULL,
	600_610_booking_id varchar(20) DEFAULT NULL,
	610_620 INT (11) DEFAULT NULL,
	610_620_booking_id varchar(20) DEFAULT NULL,
	620_630 INT (11) DEFAULT NULL,
	620_630_booking_id varchar(20) DEFAULT NULL,
	630_640 INT (11) DEFAULT NULL,
	630_640_booking_id varchar(20) DEFAULT NULL,
	640_650 INT (11) DEFAULT NULL,
	640_650_booking_id varchar(20) DEFAULT NULL,
	650_700 INT (11) DEFAULT NULL,
	650_700_booking_id varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO bookings 
(subject, staff_member)
VALUES
('English', 'Miss Austen'),
('Maths', 'Mr Turing'),
('Science', 'Dr Einstein'),
('Welsh', 'Mr Jones'),
('Geography', 'Mr Columbus'),
('History', 'Miss Gregory'),
('Computing', 'Mr Gates'),
('Music', 'Mr Dylan'),
('Drama', 'Mr Shakespeare'),
('PE', 'Mr Edwards')

SELECT * FROM bookings;
