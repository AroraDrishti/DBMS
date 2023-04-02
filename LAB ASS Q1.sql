CREATE DATABASE newdbll;
use newdbll;

DROP TABLE Course;
DROP TABLE Course_fee;
DROP TABLE Student;
DROP TABLE Installment;
DROP TABLE Course_taken;

CREATE TABLE Course
(
	course_no char(4) PRIMARY KEY,
    course_name varchar(20)
);

-- Insert values
INSERT INTO Course VALUES ('c101', 'DBMS');
INSERT INTO Course VALUES ('c102', 'ADA');
INSERT INTO Course VALUES ('c103', 'JAVA');
INSERT INTO Course VALUES ('c104', 'C++');
INSERT INTO Course VALUES ('c105', 'EN');
INSERT INTO Course VALUES ('c106', 'C');
INSERT INTO Course VALUES ('c107', 'R');
INSERT INTO Course VALUES ('c108', 'AIML');
INSERT INTO Course VALUES ('c109', 'DECO');
INSERT INTO Course VALUES ('c110', 'UNIX');

SELECT * FROM Course;

CREATE TABLE Course_fee
(
	course_no char(4) PRIMARY KEY, 
    full_part char(1),
    fees numeric(10),
    FOREIGN KEY(course_no) REFERENCES Course(course_no),
    CHECK (full_part='F' OR full_part='P')
);

-- Insert values
INSERT INTO Course_fee VALUES ('c101', 'F', 10000);
INSERT INTO Course_fee VALUES ('c102', 'P', 40000);
INSERT INTO Course_fee VALUES ('c103', 'F', 6000);
INSERT INTO Course_fee VALUES ('c104', 'P', 12000);
INSERT INTO Course_fee VALUES ('c105', 'P', 10000);
INSERT INTO Course_fee VALUES ('c106', 'F', 23000);
INSERT INTO Course_fee VALUES ('c107', 'F', 98600);
INSERT INTO Course_fee VALUES ('c108', 'F', 87000);
INSERT INTO Course_fee VALUES ('c109', 'P', 69500);
INSERT INTO Course_fee VALUES ('c110', 'F', 3000);

SELECT * FROM Course_fee;

CREATE TABLE Student
(
	prospectus_no numeric(11) PRIMARY KEY, 
    st_name varchar(20), 
    address varchar(30), 
    phone_no numeric(11), 
    D_O_B date, 
    total_amt numeric(10,2), 
    amt_paid numeric(10,2), 
    installment char(1),
    CHECK (installment='I' OR installment='F')
);
-- Insert values
INSERT INTO Student VALUES (54321, 'Rohan', 'Chennai', 9999999999, '2002-01-01', 20000, 10000, 'I');
INSERT INTO Student VALUES (89392, 'John', 'Delhi', 9999999998, '2002-07-08', 20000, 20000, 'I');
INSERT INTO Student VALUES (99655, 'Ansh', 'Banglore', 9999999997, '2002-07-18', 40000, 6000, 'F');
INSERT INTO Student VALUES (73089, 'Devansh', 'Ghaziabad', 9999999996, '2002-04-20', 120000, 12000, 'F');
INSERT INTO Student VALUES (22345, 'Sahil', 'Mumbai', 9999999995, '2002-09-10', 120000, 12000, 'F');
INSERT INTO student VALUES (89331, 'Manav', 'UP', 9999999994,'2002-02-07', 679893,60000,'F');
INSERT INTO student VALUES (66754, 'Shantanu', 'Assam', 9999999993,'2002-05-18',34000,30000,'I');
INSERT INTO student VALUES (59567, 'Kiara', 'Mizoram', 9999999992,'2002-03-28', 78653,8000,'F');
INSERT INTO student VALUES (34876, 'Aarav', 'Arunachal Pradesh', 9999999991,'2002-06-23',65000,7500,'I');
INSERT INTO student VALUES (45340, 'Rehan', 'Tamil Nadu', 9999999990,'2002-04-29', 20000,20000,'I');
INSERT INTO student VALUES (96312, 'Gaurav', 'Delhi', 9999999989, '2002-09-18',10620,2300,'F');

SELECT * FROM Student;

CREATE TABLE Installment
(
	prospectus_no numeric(10) UNIQUE, 
    installment_amt numeric(10,2), 
    due_dt date UNIQUE, 
    paid char(1),
    FOREIGN KEY(prospectus_no) REFERENCES Student(prospectus_no) ON DELETE CASCADE,
    CHECK (paid='P' OR paid='U')
); 
-- Insert values
INSERT INTO Installment VALUES (54321, 50000, '2011-01-01', 'U');
INSERT INTO Installment VALUES (89392, 20000, '2011-02-01', 'P');
INSERT INTO Installment VALUES (99655, 150000, '2011-03-01', 'P');
INSERT INTO Installment VALUES (73089, 120000, '2011-04-01', 'U');
INSERT INTO Installment VALUES (22345, 60000, '2011-05-01', 'U');
INSERT INTO Installment VALUES (89331, 60000,'2010-09-29', 'U');
INSERT INTO Installment VALUES (66754, 98000,'2010-03-12', 'U');
INSERT INTO Installment VALUES (59567, 56800,'2010-06-27', 'P');
INSERT INTO Installment VALUES (34876, 78900,'2010-05-30', 'P');
INSERT INTO Installment VALUES (45340, 897200,'2010-03-20', 'U');
INSERT INTO Installment VALUES (96312, 45790,'2010-02-17', 'U');

SELECT * FROM Installment;
 
CREATE TABLE Course_taken
(
	prospectus_no numeric(10), 
    course_no char(4), 
    start_dt date, 
    full_part char(1),
    time_slot char(2), 
    performance varchar(20),
    FOREIGN KEY(prospectus_no) REFERENCES Student(prospectus_no),
    FOREIGN KEY(course_no) REFERENCES Course(course_no),
    CHECK (full_part='F' OR full_part='P')
);
-- Insert values
INSERT INTO Course_taken VALUES (54321, 'c101', '2010-09-29', 'F', 'AN', 'GOOD');
INSERT INTO Course_taken VALUES (89392, 'c102', '2010-05-23', 'F', 'FN', 'GOOD');
INSERT INTO Course_taken VALUES (99655, 'c103', '2010-08-19', 'F', 'FN', 'BAD');
INSERT INTO Course_taken VALUES (73089, 'c104', '2010-03-23', 'P', 'AN', 'GOOD');
INSERT INTO Course_taken VALUES (89331,'c101','2010-07-14', 'F', 'AN', 'BAD');
INSERT INTO Course_taken VALUES (66754,'c103','2010-05-23','P', 'FN', 'GOOD');
INSERT INTO Course_taken VALUES (59567, 'c102','2010-04-16','P', 'AN', 'BAD');
INSERT INTO Course_taken VALUES (34876, 'c105','2010-07-13','F', 'FN', 'BAD');
INSERT INTO Course_taken VALUES (45340, 'c109','2010-11-17','F', 'FN', 'GOOD');
INSERT INTO Course_taken VALUES (96312, 'c110','2010-12-12','P', 'AN', 'GOOD');

SELECT * FROM Course_taken;

-- SQL Queries
-- 1. Retrieve name and course no of all the students.
SELECT Student.st_name, Course_taken.course_no FROM Student, Course_taken
WHERE Student.prospectus_no=Course_taken.prospectus_no;

-- 2. List the names of students who have paid the full amount at the time of admission. 
SELECT st_name FROM Student
WHERE total_amt = amt_paid;

-- 3. Find the names of students starting with A.
SELECT st_name FROM Student
WHERE st_name LIKE 'A%';
 
-- 4. Print the names of students whose total amount is not equal to amount due. 
SELECT st_name FROM Student
WHERE total_amt  <> amt_paid;

-- 5. Count the number of students who have joined in current year, current month. 
SELECT COUNT(*) FROM Course_taken WHERE start_dt like '2011-03-__';

-- 6. Determine the maximum and minimum course fees. 
SELECT MAX(fees), MIN(fees) FROM Course_fee;

-- 7. Increase the fee of oracle by 50%. 
UPDATE Course_fee SET fees=1.5*fees 
WHERE course_no IN (SELECT course_no FROM Course WHERE Course.course_name='DBMS');
SELECT * FROM Course_fee;

-- 8. Print the details of courses whose fees are between 5000 and 10000. 
SELECT Course.course_no, Course.course_name, Course_fee.fees, Course_fee.full_part FROM Course, Course_fee 
WHERE Course.course_no=Course_fee.course_no AND (Course_fee.fees>5000 AND Course_fee.fees<10000);

-- 9. Display the admission date in Date, Month, Year format. 
SELECT start_dt AS start_date FROM Course_taken;

-- 10. Find out in which course maximum number of students have taken admission. 
SELECT course_no, COUNT(*) FROM Course_taken GROUP BY course_no
HAVING COUNT(*)=(SELECT MAX(mycount) FROM
(SELECT course_no, COUNT(*) as mycount FROM Course_taken GROUP BY course_no) as new_table );

-- 11. Change the course_name from UNIX to Unix Operating System 
UPDATE Course SET course_name='UnixOperatingSystem' WHERE course_no='c110';
SELECT * FROM Course;

-- 12. Display the admission date in DD-MONTH-YYYY format. 
Select date_format(start_dt, "%D-%M-%Y") as Admission_Date from Course_taken;

-- 13. Get the sum of amount to be collected from students in this month. 
SELECT SUM(Student.total_amt-Student.amt_paid) FROM Student, Installment 
WHERE Student.prospectus_no=Installment.prospectus_no AND Installment.due_dt 
LIKE '2011-04-__';

-- 14. Find out in which course the maximum number of students have taken admission in the current month. 
SELECT Course.course_name FROM Course, Course_taken 
WHERE Course.course_no=Course_taken.course_no AND start_dt like '2011-04-__' 
GROUP BY Course.course_name 
HAVING COUNT(Course_taken.prospectus_no)>=ALL(SELECT COUNT(prospectus_no) 
FROM Course_taken GROUP BY Course_no );

-- 15. Select the students who have not yet paid full amount of fees. 
SELECT st_name FROM Student WHERE total_amt>amt_paid;