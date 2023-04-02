use db;

CREATE TABLE Course
(
	course_no char(4) PRIMARY KEY,
    course_name varchar(20)
);

CREATE TABLE Course_fee
(
	course_no char(4) UNIQUE, 
    full_part char(1),
    fees numeric(10),
    FOREIGN KEY(course_no) REFERENCES Course(course_no)
);

CREATE TABLE Student
(
	prospectus_no numeric(11) PRIMARY KEY, 
    st_name varchar(20), 
    address varchar(30), 
    phone_no numeric(11), 
    D_O_B date, 
    total_amt numeric(10,2), 
    amt_paid numeric(10,2), 
    installment char(1) 
);

CREATE TABLE Installment
(
	prospectus_no numeric(10) UNIQUE, 
    installment_amt numeric(10,2), 
    due_dt date UNIQUE, 
    paid char(1),
    FOREIGN KEY(prospectus_no) REFERENCES Student(prospectus_no) ON DELETE CASCADE
); 
 
CREATE TABLE Course_taken
(
	prospectus_no numeric(10), 
    course_no char(4), 
    start_dt date, 
    full_part char(1),
    time_slot char(2), 
    performance varchar(20),
    FOREIGN KEY(prospectus_no) REFERENCES Student(prospectus_no),
    FOREIGN KEY(course_no) REFERENCES Course(course_no)
);

-- Insert values
INSERT INTO Course VALUES ('c101', 'dbms');
INSERT INTO Course VALUES ('c102', 'ada');
INSERT INTO Course VALUES ('c103', 'java');
INSERT INTO Course VALUES ('c104', 'c++');

INSERT INTO Course_fee VALUES ('c101', 'F', 10000);
INSERT INTO Course_fee VALUES ('c102', 'P', 40000);
INSERT INTO Course_fee VALUES ('c103', 'F', 6000);
INSERT INTO Course_fee VALUES ('c104', 'P', 12000);

INSERT INTO Student VALUES (54321, 'rohan', 'chennai','01-jan-1991', 543211, 20000,10000,'I');
INSERT INTO Student VALUES (89392, 'JOHN', 'DELHI','01-FEB-1991',893921, 20000,20000,'I');
INSERT INTO Student VALUES (99655, 'SATYA', 'BIHAR','01-MAR-1991',996554, 40000,6000,'F');
INSERT INTO Student VALUES (73089, 'DEVANSH', 'GHAZIABAD','01-APR-1991',730893, 120000,12000,'F');
INSERT INTO Student VALUES (22345, 'KAVAN', 'MUMBAI','01-MAY-1991',223456, 120000,12000,'F');

INSERT INTO Installment VALUES (54321, 50000,'22-aug-2010', 'U');
INSERT INTO Installment VALUES (89392, 20000,'23-aug-2010', 'P');
INSERT INTO Installment VALUES (99655, 150000,'24-sep-2010', 'P');
INSERT INTO Installment VALUES (73089, 120000,'25-sep-2010', 'U');
INSERT INTO Installment VALUES (22345, 60000,'29-SEP-2010', 'U');

INSERT INTO Course_taken VALUES (54321, 'c101', '29-SEP-2010', 'F', 'AN', 'GOOD');
INSERT INTO Course_taken VALUES (89392, 'c101', '30-SEP-2010', 'F', 'FN', 'GOOD');
INSERT INTO Course_taken VALUES (99655, 'c102', '30-SEP-2010', 'F', 'FN', 'GOOD');
INSERT INTO Course_taken VALUES (73089, 'c103', '28-SEP-2010', 'P', 'AN', 'GOOD');
INSERT INTO Course_taken VALUES (22345, 'c104', '30-SEP-2010', 'P', 'AN', 'GOOD');

select* from Course;
select* from Student;
select* from Course_fee;
select* FROM Installment;
select* from Course_taken;

-- SQL Queries
-- 1. Retrieve name and course no of all the students.
SELECT * FROM Course;

-- 2. List the names of students who have paid the full amount at the time of admission. 
SELECT st_name FROM Student
WHERE total_amt = amt_paid;

-- 3. Find the names of students starting with A.
SELECT st_name FROM Student
WHERE st_name LIKE "a%";
 
-- 4. Print the names of students whose total amount is not equal to amount due. 
SELECT st_name FROM Student
WHERE total_amt != amt_paid;

-- 5. Count the number of students who have joined in current year, current month. 

-- 6. Determine the maximum and minimum course fees. 
SELECT MAX(fees) FROM Course_fee;
SELECT MIN(fees) FROM Course_fee;

-- 7. Increase the fee of oracle by 50%. 
UPDATE fees

-- 8. Print the details of courses whose fees are between 5000 and 10000. 
-- 9. Display the admission date in Date, Month, Year format. 
-- 10. Find out in which course maximum number of students have taken admission. 
-- 11. Change the course_name from Unix to Unix Operating System, 
-- 12. Display the admission date in DD-MONTH-YYYY format. 
-- 13. Get the sum of amount to be collected from students in this month. 
-- 14. Find out in which course the maximum number of students have taken admission in the current month. 
-- 15. Select the students who have not yet paid full amount of fees. 