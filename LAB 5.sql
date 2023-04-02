use db;
drop table Employee;
CREATE TABLE Employee
(
	e_id int PRIMARY KEY auto_increment,
	e_name varchar(20),
	e_dept varchar(20),
	e_salary int
);
SELECT * FROM Employee;

INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Rohit","CSE",20000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Mohit","IT",30000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Sumit","MBA",10000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Amit","ECE",20000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Rohan","CSE",20000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Aditya","IT",40000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Ansh","ECE",80000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Naman","ECE",60000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Sahil","MBA",20000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Harry","CSE",70000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Hansh","IT",90000);
INSERT INTO Employee (e_name,e_dept,e_salary) VALUES("Hima","MBA",56000);
SELECT * FROM Employee;
 
-- GROUP BY function 
SELECT e_dept, COUNT(*) FROM Employee GROUP BY e_dept;
SELECT e_salary, COUNT(*) FROM Employee GROUP BY e_salary;
SELECT e_dept FROM Employee GROUP BY e_dept HAVING COUNT(*) < 4;

INSERT INTO Employee (e_name, e_dept, e_salary) 
VALUES ("Sahil","HR",45000);

SELECT e_dept FROM Employee GROUP BY e_dept HAVING COUNT(*) < 2; 

SELECT e_name FROM Employee WHERE e_dept IN (SELECT e_dept FROM Employee 
GROUP BY e_dept HAVING count(*) < 2);

SELECT e_name FROM Employee WHERE e_dept IN (SELECT e_dept FROM Employee 
GROUP BY e_dept HAVING count(*) < 4);
 
SELECT e_name, e_salary FROM Employee ORDER BY e_salary desc;

