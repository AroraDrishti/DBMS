-- JOINS:
use db;

CREATE TABLE Emp1
(
	emp_id int PRIMARY KEY,
	emp_name varchar(20),
	emp_address varchar(20)
);

INSERT INTO Emp1 VALUES(1,"Sahil","Delhi");
INSERT INTO Emp1 VALUES(2,"Harry","Chd");
INSERT INTO Emp1 VALUES(3,"Hansh","Chennai");
INSERT INTO Emp1 VALUES(4,"Hima","Noida");

SELECT * FROM Emp1;

CREATE TABLE Work1
(
	emp_id int,
	FOREIGN KEY(emp_id) REFERENCES Emp1(emp_id),
	dept_no int,
	dept_name varchar(20)
);

INSERT INTO Work1 VALUES(1,5,"HR");
INSERT INTO Work1 VALUES(2,4,"ECE");
INSERT INTO Work1 VALUES(4,3,"CSE");

SELECT * FROM Work1;

# Find the employee name who is working in a department
SELECT Emp1.emp_id, emp_name, emp_address, dept_no, dept_name FROM Emp1, Work1;

# NATURAL JOIN 
SELECT Emp1.emp_id, emp_name, emp_address, dept_no, dept_name FROM Emp1, Work1 
WHERE Emp1.emp_id = Work1.emp_id;
-- OR
SELECT Emp1.emp_id, emp_name, emp_address, dept_no, dept_name FROM Emp1 NATURAL JOIN Work1;

CREATE TABLE Study
(
	s_id varchar(10),
	c_id varchar(10),
	yr int
);

INSERT INTO Study VALUES("s1","c1",2016);
INSERT INTO Study VALUES("s2","c2",2017);
INSERT INTO Study VALUES("s1","c2",2017);
SELECT * FROM Study;

# SELF JOIN
# Find the student id who is enrolled in at least 2 courses
SELECT T1.s_id, T1.c_id, T1.yr FROM Study AS T1, Study AS T2;
-- OR
SELECT T1.S_id, T2.c_id FROM Study AS T1, Study AS T2 
WHERE T1.s_id=T2.s_id AND T1.c_id <> T2.c_id;

ALTER TABLE Work1 
ADD location varchar(20);

UPDATE Work1 SET location="Patna" WHERE emp_id=1; 
UPDATE Work1 SET location="Pune" WHERE emp_id=2; 
UPDATE Work1 SET location="Delhi" WHERE emp_id=4; 
SELECT * FROM Work1;

# EQUI JOIN
SELECT Emp1.emp_id, emp_name, dept_no, dept_name FROM Emp1, Work1 
WHERE Emp1.emp_address = Work1.location;

# LEFT OUTER JOIN
SELECT Emp1.emp_id, emp_name, dept_no, dept_name FROM 
Emp1 LEFT OUTER JOIN Work1 ON (Emp1.emp_id = Work1.emp_id);

# RIGHT OUTER JOIN
SELECT Emp1.emp_id, emp_name, dept_no, dept_name FROM 
Emp1 RIGHT OUTER JOIN Work1 ON (Emp1.emp_id = Work1.emp_id);