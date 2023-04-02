use newdbl;

CREATE TABLE Supplier 
(
	SNo char(4),
    SName varchar(20),
    Sstatus varchar(20),
    City varchar(20)
);
-- Insert values
INSERT INTO Supplier VALUES ('S1', 'Manik', 'Active', 'Delhi');
INSERT INTO Supplier VALUES ('S2', 'Sahil', 'Inactive', 'Chennai');
INSERT INTO Supplier VALUES ('S3', 'Sumit', 'Active', 'Banglore');
INSERT INTO Supplier VALUES ('S4', 'Ritvik', 'Active', 'Chandigarh');

SELECT * FROM Supplier;

CREATE TABLE Parts
(
	PNo char(4),
    PName varchar(20),
    Color varchar(20),
    Weight numeric(20),
    City varchar(20)
);
-- Insert values
INSERT INTO Parts VALUES ('P1', 'Part1', 'Orange', 14.2, 'Delhi');
INSERT INTO Parts VALUES ('P2', 'Part2', 'Blue', 15.6, 'Chennai');
INSERT INTO Parts VALUES ('P3', 'Part3', 'Green', 5.3, 'Banglore');
INSERT INTO Parts VALUES ('P4', 'Part4', 'Yellow', 44.2, 'Chandigarh');

SELECT * FROM Parts;

CREATE TABLE Project
(
	JNo char(4),
    JName varchar(20),
    City varchar(20)
);
-- Insert values
INSERT INTO Project VALUES ('J1', 'Project1', 'Delhi');
INSERT INTO Project VALUES ('J2', 'Project2', 'Delhi');
INSERT INTO Project VALUES ('J3', 'Project3', 'Banglore');
INSERT INTO Project VALUES ('J4', 'Project4', 'Chandigarh');

SELECT * FROM Project;

CREATE TABLE SPJ
(
	SNo char(4), 
    PNo char(4), 
    JNo char(4), 
    Qty int
); 

-- Insert values
INSERT INTO SPJ VALUES ('S1', 'P1', 'J2', 2);
INSERT INTO SPJ VALUES ('S2', 'P1', 'J1', 3);
INSERT INTO SPJ VALUES ('S1', 'P3', 'J3', 2);
INSERT INTO SPJ VALUES ('S3', 'P4', 'J4', 4);
INSERT INTO SPJ VALUES ('S2', 'P2', 'J4', 1);
INSERT INTO SPJ VALUES ('S4', 'P3', 'J3', 3);
INSERT INTO SPJ VALUES ('S3', 'P3', 'J1', 4);
INSERT INTO SPJ VALUES ('S4', 'P4', 'J2', 5);

SELECT * FROM SPJ;

-- SQL Queries
-- 1. Get sno values for suppliers who supply project J1. 
SELECT SNo FROM SPJ 
WHERE JNo = 'J1';

-- 2. Get Sno values for suppliers who supply project J1 with part P1.
SELECT SNo FROM SPJ 
WHERE JNo = 'J1' AND PNo = 'P1';
 
-- 3. Get jname values for projects supplied by supplier S1.
SELECT JName FROM Project, SPJ
WHERE SNo = 'S1' AND Project.JNo = SPJ.JNo;
 
-- 4. Get color values for parts supplied by supplier S1. 
SELECT Color FROM Parts, SPJ
WHERE SNo = 'S1' AND Parts.PNo = SPJ.PNo;

-- 5. Get Pno values for parts supplied to any project in Delhi. 
SELECT Parts.PNo FROM Parts, SPJ, Project
WHERE Project.City = 'Delhi' AND Parts.PNo = SPJ.PNo AND Project.JNo = SPJ.JNo;

-- 6. Get Sno values for suppliers who supply project J2 with a red part. 
SELECT SNo FROM SPJ, Parts
WHERE Parts.Color = 'Red' AND JNo = 'J2' AND SPJ.PNo = Parts.PNo;

-- 7. Get Sno values for suppliers who supply at Delhi or Chennai project with a red part. 
SELECT SNo FROM SPJ, Parts, Project
WHERE Parts.Color = 'Red' AND (Project.City = 'Delhi' OR Project.City = 'Chennai') 
AND Parts.PNo = SPJ.PNo AND Project.JNo = SPJ.JNo;

-- 8. Get pno values for parts supplied to any project by a supplier in the same city. 
SELECT Parts.PNo FROM Parts, SPJ, Project
WHERE Parts.City = Project.City AND Parts.PNo = SPJ.PNo AND Project.JNo = SPJ.JNo;

-- 9. Get pno values for parts supplied to any project in Chandigarh by a supplier in Chandigarh. 
SELECT Parts.PNo FROM Parts, SPJ, Project
WHERE Parts.City = 'Chandigarh' AND Project.City = 'Chandigarh' 
AND Parts.PNo = SPJ.PNo AND Project.JNo = SPJ.JNo;

-- 10. Get jno values for projects supplied by at least one supplier not in the same city. 
SELECT DISTINCT(Project.JNo) FROM Project, Supplier, SPJ
WHERE Supplier.city!=Project.city AND Supplier.SNo=SPJ.SNo 
and SPJ.JNo=Project.JNo;
 
-- 11. Get all pairs of city values such that a supplier in the first
--  city supplies a project in the second city.
SELECT DISTINCT Supplier.city, Project.city FROM Supplier, Project, SPJ
WHERE SPJ.SNo=Supplier.SNo AND SPJ.JNo=Project.JNo AND Project.city!=Supplier.city;

-- 13. Get pno values for parts supplied to all projects in Delhi.
SELECT Parts.PNo FROM Parts, Project, SPJ
WHERE Parts.PNo=SPJ.PNo AND SPJ.JNo=Project.JNo AND Project.city='Delhi';
 
-- 14. Get sname values for suppliers who supplies at least one red part to any project. 
SELECT DISTINCT(Supplier.SName) FROM Supplier, Parts, SPJ
WHERE Supplier.SNo=SPJ.SNo AND Parts.PNo=SPJ.PNo
and Parts.color='Red';

-- 15. Get total quantity of part p1 supplied by supplier s1.
SELECT COUNT(PNo) AS Total_Quantity FROM SPJ WHERE SNo='S1' AND PNo='P1';
 
-- 16. Get the total number of projects supplied by supplier s3.
SELECT COUNT(JNo) AS Total_Projects FROM SPJ WHERE SNo='S3';
 
-- 17. Change color of all red parts to orange. 
UPDATE Parts SET color="Orange"
WHERE color='Red';
SELECT * FROM Parts;

-- 18. Get sname values for suppliers who supply to both projects j1 and j2. 
SELECT DISTINCT(SName) FROM Supplier, SPJ 
WHERE Supplier.SNo=SPJ.SNo AND (SPJ.JNo='J1' or SPJ.JNo='J2');

-- 20. Get jnames for those project which are supplied by supplier XYZ.
SELECT DISTINCT(JName) FROM Project, SPJ 
WHERE Project.JNo=SPJ.JNo AND SPJ.SNo='S2';