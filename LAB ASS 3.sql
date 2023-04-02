use db;

DROP TABLE Department;
DROP TABLE Employees;

CREATE TABLE Department
(
	Dept_No varchar(5) PRIMARY KEY, 
    Dept_Name varchar(5)
);

INSERT INTO Department VALUES ("D1", "CSE");
INSERT INTO Department VALUES ("D2", "IT");
INSERT INTO Department VALUES ("D3", "AI");
INSERT INTO Department VALUES ("D4", "DS");

SELECT * FROM Department;

CREATE TABLE Employees
(
	E_ID varchar(5) PRIMARY KEY, 
    E_Name varchar(25), 
    Salary int, 
    Hiredate date, 
    LOC varchar(25), 
    Mgr_Eid varchar(25), 
    Job varchar(25), 
    Grade varchar(5), 
    Dept_No varchar(5),
    FOREIGN KEY (Dept_No) REFERENCES Department(Dept_No) ON DELETE SET NULL
);

INSERT INTO Employees VALUES ("E1", "Sahil", 50000, "2022-06-01", "LOC1", "MGR1", "Software Engineer", "A", "D1");
INSERT INTO Employees VALUES ("E2", "Sumit", 40000, "2022-05-01", "LOC2", "MGR2", "Hardware Engineer", "A", "D2");
INSERT INTO Employees VALUES ("E3", "Rehan", 60000, "2022-02-01", "LOC3", "MGR3", "Website Designer", "A", "D2");
INSERT INTO Employees VALUES ("E4", "Ritvik", 30000, "2022-06-10", "LOC4", "MGR4", "ML Engineer", "A", "D3");

SELECT * FROM Employees;

-- 1. Display each employee name and hiredate of systems department.
SELECT E_Name, Hiredate FROM Employees;

-- 2. Write query to calculate length of service of each employee.
SELECT   
     DATE_FORMAT( CURDATE() ,  '%Y' ) - DATE_FORMAT( Hiredate,  '%Y' ) as years
     ,  DATE_FORMAT( CURDATE() ,  '%m' ) - DATE_FORMAT( Hiredate,  '%m' ) as months
     ,  DATE_FORMAT( CURDATE() ,  '%d' ) - DATE_FORMAT( Hiredate,  '%d' ) as days
FROM Employees;

-- 3. Find the second maximum salary of all employees.
SELECT salary FROM Employees 
ORDER BY salary desc limit 1,1;

-- 4. Display all employee name and department name in department name order. 
SELECT E_name, Dept_Name FROM Department, Employees
WHERE Employees.Dept_No = Department.Dept_No
ORDER BY Dept_Name;

-- 5. Find the name of lowest paid employee for each manager. 
SELECT Mgr_Eid, MIN(salary) FROM Employees
WHERE Mgr_Eid IS NOT NULL
GROUP BY Mgr_Eid
ORDER BY MIN(salary) LIMIT 1;

-- 6. Display the department that has no employee.
SELECT * FROM Department
WHERE Dept_No NOT IN (SELECT Dept_No FROM Employees);

-- 7. Find the employees who earn the maximum salary in each job type. Sort in descending order of salary. 
SELECT * FROM Employees
WHERE salary IN (SELECT MAX(salary) FROM Employees
     GROUP BY Job)
ORDER BY salary DESC;

-- 8. In which year did most people joined the company? Display the year and number of employees. 
-- SELECT TO_CHAR(HIREDATE,’YYYY’) “YEAR”, COUNT(EMPNO) “NO. OF EMPLOYEES” FROM EMP GROUP BY TO_CHAR(HIREDATE,’YYYY’) HAVING COUNT(EMPNO) = (SELECT MAX(COUNT(EMPNO)) FROM EMP GROUP BY TO_CHAR(HIREDATE,’YYYY’));

-- 9. Display the details of those employees who earn greater than average of their department. 
-- SELECT ENAME,SAL FROM EMP E WHERE SAL > (SELECT AVG(SAL) FROM EMP F WHERE E.DEPTNO = F.DEPTNO);

-- 10. List the employees having salary between 10000 and 20000 
SELECT * FROM Employees
WHERE salary BETWEEN 10000 AND 20000;
 
-- 11. Display all employees hired during 1983. those employees who earn greater than average of their department. 

-- 12. Update the salaries of all employees in marketing department & hike it by 15%. 
UPDATE salary
SET salary = 1.15*salary 
WHERE Dept_Name = "Marketing";
SELECT * FROM Employees WHERE Dept_Name = "Marketing";

-- 13. Get the gross salaries of all the employees. 
SELECT 2.5*salary FROM  Employees AS Gross_Salary;

-- 14. Get the names of employees and their managers name. 

-- 15. Display the name, location and department name of all the employees earning more than 1500. 
SELECT E_Name, LOC, Dept_Name FROM Department, Employees
WHERE Department.Dept_No = Employees.Dept_No AND salary>1500;

-- 16. Show all the employees in Dallas. 
SELECT * FROM Employees
WHERE LOC="Dallas";

-- 17. List the employees name, job, salary, grade, and department for employees in the company except clerks. Sort on employee names. 
SELECT E_Name, Job, salary, grade, Dept_Name FROM Department, Employees
WHERE Department.Dept_No = Employees.Dept_No AND Job != "Clerk"
ORDER BY E_Name;

-- 18. Find the employees who earns the minimum salary for their job. Sort in descending order of salary. 
SELECT * FROM Employees
WHERE salary IN (SELECT MIN(salary) FROM Employees GROUP BY Job)
ORDER BY salary ASC;

-- 19. Find the most recently hired employees in the department order by hiredate. 
SELECT * FROM Employees e
WHERE Hiredate IN (SELECT MAX(Hiredate) FROM Employees
     WHERE e.Dept_No = Dept_No)
ORDER BY Hiredate DESC;

-- 20. Find out the difference between highest and lowest salaries.
SELECT MAX(salary) - MIN(salary) DIFFERENCE FROM Employees;

use sampledb;

DROP TABLE Department;
DROP TABLE Employees;

CREATE TABLE Department
(
	Dept_No varchar(5) PRIMARY KEY, 
    Dept_Name varchar(5)
);

INSERT INTO Department VALUES ("D1", "CSE");
INSERT INTO Department VALUES ("D2", "IT");
INSERT INTO Department VALUES ("D3", "AI");
INSERT INTO Department VALUES ("D4", "DS");

SELECT * FROM Department;

CREATE TABLE Employees
(
	E_ID varchar(5) PRIMARY KEY, 
    E_Name varchar(25), 
    Salary int, 
    Hiredate date, 
    LOC varchar(25), 
    Mgr_Eid varchar(25), 
    Job varchar(25), 
    Grade varchar(5), 
    Dept_No varchar(5),
    FOREIGN KEY (Dept_No) REFERENCES Department(Dept_No) ON DELETE SET NULL
);

INSERT INTO Employees VALUES ("E1", "Sahil", 50000, "2021-06-01", "LOC1", "MGR1", "Software Engineer", "A", "D1");
INSERT INTO Employees VALUES ("E2", "Sumit", 40000, "2022-05-01", "LOC2", "MGR2", "Hardware Engineer", "A", "D2");
INSERT INTO Employees VALUES ("E3", "Rehan", 60000, "2022-02-01", "LOC3", "MGR3", "Website Designer", "A", "D2");
INSERT INTO Employees VALUES ("E4", "Ritvik", 30000, "2022-06-10", "LOC4", "MGR4", "ML Engineer", "A", "D3");

SELECT * FROM Employees;

#1.	Display each employee name and hiredate of systems department.
Select E_Name, Hiredate from Employees;

#2.	Write query to calculate length of service of each employee.
SELECT E_ID, E_Name, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), Hiredate)), "%Y") + 0 AS Service_Length_Years
FROM Employees;

#3.	Find the second maximum salary of all employees.
SELECT MAX(Salary) From Employees 
WHERE Salary < ( SELECT Max(Salary) FROM Employees);

#4.	Display all employee name and department name in department name order. 
Select E_Name, Dept_Name from Employees, Department
where Department.Dept_No=Employees.Dept_No
order by Dept_Name;

#5.	Find the name of lowest paid employee for each manager.
SELECT Mgr_Eid, MIN(salary)
FROM employees
WHERE Mgr_Eid IS NOT NULL
GROUP BY Mgr_Eid
ORDER BY MIN(salary) DESC;
 
#6.	Display the department that has no employee.
SELECT * FROM Department 
WHERE Dept_No
NOT IN (select Dept_No FROM Employee);

#7.	Find the employees who earn the maximum salary in each job type. Sort in descending order of salary.
Select E_Name,Job,Max(salary) from employees 
group by job
order by salary desc;
 
#8.	In which year did most people joined the company? Display the year and number of employees.
 
#9.	Display the details of those employees who earn greater than average of their department. 
SELECT Dept_no,
       Job as Dept_Name,
       E_name,
       Salary
FROM employees e
WHERE salary > (SELECT avg(salary) FROM employees WHERE employees.dept_no = dept_no ) ORDER BY dept_no;

#10. List the employees having salary between 10000 and 20000 
Select * from employees where salary between 40000 and 60000;

#11. Display all employees hired during 1983. those employees who earn greater than average of their department. 

#12. Update the salaries of all employees in marketing department & hike it by 15%.
UPDATE employees
set salary=salary+(0.15*salary)
where job='Software Engineer';
SELECT * from employees where job='Software engineer'; 

#13. Get the gross salaries of all the employees. 
SELECT 2.5*salary FROM  Employees AS Gross_Salary;

#14. Get the names of employees and their managers name. 
#15. Display the name, location and department name of all the employees earning more than 1500.
SELECT E_Name, LOC, Dept_Name FROM Department, Employees
WHERE Department.Dept_No = Employees.Dept_No AND salary>1500;
 
#16. Show all the employees in Dallas. 
SELECT E_name from employees where LOC='LOC1';

#17. List the employees name, job, salary, grade, and department for employees in the company except clerks. Sort on employee names. 
SELECT E_Name, Job, salary, grade, Dept_Name FROM Department, Employees
WHERE Department.Dept_No = Employees.Dept_No AND Job != "Clerk"
ORDER BY E_Name;

#18. Find the employees who earns the minimum salary for their job. Sort in descending order of salary.
SELECT * from employees where salary in (SELECT min(salary) from employees group by job) order by salary DESC;
 
#19. Find the most recently hired employees in the department order by hiredate. 
SELECT * FROM Employees e
WHERE Hiredate IN (SELECT MAX(Hiredate) FROM Employees
     WHERE e.Dept_No = Dept_No)
ORDER BY Hiredate DESC;

#20. Find out the difference between highest and lowest salaries. 
SELECT MAX(salary) - MIN(salary) DIFFERENCE FROM Employees;