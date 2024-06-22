USE school_grades;
-- Scenario - It is the Spring at Royal Academy and the students are in year 11. Before they take their GCSEs it is time to check how the students did in their mock exams. Are they going to get the grades they want? Which subject did the best? How did our future King do? And who is this new student?

SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM grades;

-- adding foreign key to grades and students

ALTER TABLE grades
ADD CONSTRAINT
fk_students_grades
FOREIGN KEY (student_id) REFERENCES students(student_id);

-- adding foreign key to grades and subjects

ALTER TABLE grades
ADD CONSTRAINT
fk_subjects_grades
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

-- adding extra constraint

ALTER TABLE grades
ADD CHECK (percentage<=100);

-- 3 queries to insert data
-- the students are doing well, but we have a new student arriving soon. They did a mock at their last school so lets see how they've done:

INSERT INTO students
(student_id, student_name, student_surname, gender)
VALUES
('1244', 'Jane', 'Grey', 'F');

INSERT INTO grades
(student_id, subject_id, percentage, grade)
VALUES
('1244', '9876', '96', 'A'),
('1244', '9875', '92', 'A'),
('1244', '9874', '95', 'A'),
('1244', '9873', '78', 'B'),
('1244', '9871', '98', 'A');

-- a new professor arrives and decides to add a new subject to the curriculum
INSERT INTO subjects
(subject_id, subject_name, head_of_dept, core_subject)
VALUES
('9866', 'Magical Studies', 'Albus Dumbledore', 0);

-- 1 query to delete data
-- no ones takes up Magical Studies so it is quickly cancelled. Professor Dumbledore decides to go back to Hogwarts

DELETE FROM subjects
WHERE
subject_id = '9866';

-- 2 aggregate functions 

-- How many students managed an A in their English mock exam?

SELECT
COUNT(g.grade) AS Number_of_A_grades
FROM grades g
WHERE g.grade = 'A'
AND g.subject_id = '9876';

-- What about maths?

SELECT
COUNT(g.grade) AS Number_of_A_grades
FROM grades g
WHERE g.grade = 'A'
AND g.subject_id = '9875';

-- Oh no, English beat maths this year. 

-- What was the average percentage that Henry Tudor achieved?

SELECT
AVG(g.percentage) AS average_score
FROM grades g
WHERE student_id = '1240';

-- Oh dear Henry, you've only managed a D this year!

-- Some queries to retrieve data and an additional in built function

-- How many different names are there in the class?

SELECT 
COUNT(DISTINCT s.student_name)
FROM students s; 

-- There are 8 different names out of the 11 students

-- what was the highest percentage each subject got
SELECT
MAX(g.percentage) AS highest_percent, su.subject_name
FROM grades g
INNER JOIN subjects su
ON su.subject_id = g.subject_id
GROUP BY g.subject_id;

-- 2 joins and data sorting

-- what were all of the grades the students achieved?

SELECT
s.student_name, s.student_surname, su.subject_name, g.grade
FROM students s
INNER JOIN grades g 
ON s.student_id = g.student_id
INNER JOIN subjects su
ON g.subject_id = su.subject_id
ORDER BY su.subject_name, s.student_surname;

-- how did each subject do on average?

SELECT AVG(g.percentage) AS average_percentage,
ROUND(AVG(g.percentage), 0) AS rounded_percentage,
su.subject_name, su.head_of_dept
FROM subjects su
INNER JOIN grades g
ON su.subject_id = g.subject_id
GROUP BY su.subject_name, su.head_of_dept
ORDER BY average_percentage DESC;


-- stored function to give us the full gender of each student

DELIMITER //
CREATE FUNCTION get_student_gender(studentID INT) 
RETURNS VARCHAR(7)
DETERMINISTIC
BEGIN
	DECLARE full_gender VARCHAR(7);
    SELECT CASE 
		WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Unknown'
	END
	INTO full_gender
	FROM students
	WHERE student_id = studentID;
    RETURN full_gender;
END //
DELIMITER ;

-- What gender is our first student?

SELECT get_student_gender(1234);

-- Who failed the exams?

SELECT
s.student_name, s.student_surname, su.subject_name, g.grade
FROM students s
INNER JOIN grades g 
ON s.student_id = g.student_id
INNER JOIN subjects su
ON g.subject_id = su.subject_id
WHERE g.percentage < 65;