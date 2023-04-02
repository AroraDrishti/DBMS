use db;

DROP TABLE AggregateFunctionsTable;
CREATE TABLE AggregateFunctionsTable
(
    EnrollmentNo int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(255),
    Age int DEFAULT '20',
    Salary int,
    NoOfWorkingHours int DEFAULT 40
);

INSERT INTO AggregateFunctionsTable(Name, Age, Salary)
VALUES('A','19','100000');

INSERT INTO AggregateFunctionsTable(Name, Age, Salary)
VALUES('B','19','150000');

INSERT INTO AggregateFunctionsTable(Name, Salary)
VALUES('C','120000');

INSERT INTO AggregateFunctionsTable(Name, Age, Salary)
VALUES('D','19','200000');

SELECT * FROM AggregateFunctionsTable;

# COUNT Aggregating Function
SELECT COUNT(EnrollmentNo) FROM AggregateFunctionsTable;

SELECT COUNT(EnrollmentNo) FROM AggregateFunctionsTable
WHERE Age = '19';

# MIN Aggregating Function
SELECT MIN(Salary) FROM AggregateFunctionsTable;

# MAX Aggregating Function
SELECT MAX(Salary) FROM AggregateFunctionsTable;

# AVG Aggregating Function
SELECT AVG(Salary) FROM AggregateFunctionsTable;

# SUM Aggregating Function
SELECT SUM(NoOfWorkingHours) FROM AggregateFunctionsTable;

# DISTINCT Aggregating Function
SELECT DISTINCT(EnrollmentNo) FROM AggregateFunctionsTable;

# OrderBy Aggregating Function
SELECT * FROM AggregateFunctionsTable
ORDER BY Salary ASC;

SELECT * FROM AggregateFunctionsTable
ORDER BY Salary DESC;

# LIKE Aggregating Function
SELECT * FROM AggregateFunctionsTable
WHERE Age LIKE '19';

# BETWEEN Aggregating Function
SELECT * FROM AggregateFunctionsTable
WHERE Salary BETWEEN 100000 AND 175000;

# AS Aggregating Function
SELECT EnrollmentNo as RegistrationNo FROM AggregateFunctionsTable
WHERE Age=19;