CREATE DATABASE school_grades;
USE school_grades;

CREATE TABLE students
(student_id INTEGER(100) PRIMARY KEY, student_name VARCHAR (50) NOT NULL, 
student_surname VARCHAR (50) NOT NULL, gender CHAR (1));

INSERT INTO students
(student_id, student_name, student_surname, gender)
VALUES
('01234', 'Katherine', 'Aragon', 'F'),
('01235', 'Anne', 'Boleyn', 'F'),
('01236', 'Jane', 'Seymour', 'F'),
('01237', 'Anne', 'Cleeves', 'F'),
('01238', 'Katherine', 'Howard', 'F'),
('01239', 'Catherine', 'Parr', 'F'),
('01240', 'Henry', 'Tudor', 'M'),
('01241', 'Arthur', 'Tudor', 'M'),
('01242', 'Charles', 'Brandon', 'M'),
('01243', 'George', 'Boleyn', 'M');

-- SELECT * FROM students;

CREATE TABLE subjects
(subject_id INTEGER (100) PRIMARY KEY, subject_name VARCHAR (50) NOT NULL, head_of_dept VARCHAR (50) NOT NULL, core_subject TINYINT(1));

INSERT INTO subjects
(subject_id, subject_name, head_of_dept, core_subject)
VALUES
('9876', 'English', 'Jane Austen', 1),
('9875', 'Maths', 'Alan Turing', 1),
('9874', 'Science', 'Albert Einstein', 1),
('9873', 'Welsh', 'Tom Jones', 1),
('9872', 'Geography', 'Christopher Columbus', 0),
('9871', 'History', 'Phillippa Gregory', 0),
('9870', 'Computing', 'Bill Gates', 0),
('9869', 'Music', 'Bob Dylan', 0),
('9868', 'Drama', 'William Shakespeare', 0),
('9867', 'PE', 'Gareth Edwards', 0);

-- SELECT * FROM subjects;
-- SELECT * FROM students;

CREATE TABLE grades
(student_id INTEGER (100) NOT NULL, subject_id INTEGER (100) NOT NULL, percentage DECIMAL (5, 2) NOT NULL, grade CHAR(1) NOT NULL);

INSERT INTO grades
(student_id, subject_id, percentage, grade)
VALUES
('1234', '9876', '84', 'B'), -- Katherine
('1234', '9875', '67', 'C'),
('1234', '9874', '72', 'C'),
('1234', '9873', '78', 'B'),
('1234', '9871', '86', 'A'),
('1235', '9876', '78', 'B'), -- Anne
('1235', '9875', '88', 'A'),
('1235', '9874', '85', 'A'),
('1235', '9873', '57', 'D'),
('1235', '9869', '79', 'B'),
('1236', '9876', '77', 'B'), -- Jane
('1236', '9875', '74', 'C'),
('1236', '9874', '79', 'B'),
('1236', '9873', '75', 'B'),
('1236', '9872', '83', 'B'),
('1236', '9868', '85', 'A'),
('1237', '9876', '92', 'A'), -- Anne
('1237', '9875', '84', 'B'),
('1237', '9874', '87', 'A'),
('1237', '9873', '82', 'B'),
('1237', '9870', '88', 'A'),
('1237', '9872', '87', 'A'),
('1238', '9876', '64', 'D'), -- Katherine
('1238', '9875', '66', 'C'),
('1238', '9874', '59', 'D'),
('1238', '9873', '58', 'D'),
('1238', '9869', '76', 'B'),
('1238', '9868', '69', 'C'),
('1239', '9876', '86', 'A'), -- Catherine
('1239', '9875', '88', 'A'),
('1239', '9874', '87', 'A'),
('1239', '9873', '90', 'A'),
('1239', '9867', '95', 'A'),
('1239', '9870', '92', 'B'),
('1240', '9876', '54', 'E'), -- Henry
('1240', '9875', '58', 'D'),
('1240', '9874', '59', 'D'),
('1240', '9873', '57', 'D'),
('1240', '9871', '65', 'C'),
('1240', '9867', '78', 'B'),
('1241', '9876', '77', 'B'), -- Arthur
('1241', '9875', '76', 'B'),
('1241', '9874', '79', 'B'),
('1241', '9873', '85', 'A'),
('1241', '9870', '86', 'A'),
('1241', '9872', '78', 'B'),
('1242', '9876', '68', 'C'), -- Charles
('1242', '9875', '69', 'C'),
('1242', '9874', '76', 'B'),
('1242', '9873', '72', 'C'),
('1242', '9868', '79', 'B'),
('1242', '9867', '80', 'B'),
('1243', '9876', '86', 'A'), -- George
('1243', '9875', '83', 'B'),
('1243', '9874', '82', 'B'),
('1243', '9873', '88', 'A'),
('1243', '9871', '92', 'A'),
('1243', '9868', '87', 'A');

SELECT * FROM grades;
SELECT * FROM students;
SELECT * FROM subjects;