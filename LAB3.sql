USE lab3;

-- 1. NOT NULL 
CREATE TABLE Student
(
    EnrollmentNo int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int
);

INSERT INTO Student
VALUES('1','Arora','Drishti','19');

-- Violation of the NOT NULL constraint 
INSERT INTO Student
VALUES(NULL,'Sharma','Sahil','22');

-- 2. UNIQUE
CREATE TABLE Student2 
(
    EnrollmentNo int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int
);

INSERT INTO Student2
VALUES('1','Arora','Drishti','19');
  
-- Violation of the UNIQUE constraint  
INSERT INTO Student2
VALUES('1','Sharma','Sahil','22');


-- 3. PRIMARY KEY
CREATE TABLE Student3
(
    EnrollmentNo int PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int
);

INSERT INTO Student3
VALUES('1','Arora','Drishti','19');
  
-- Violation of the PRIMARY KEY constraint  
INSERT INTO Student3
VALUES('1','Sharma','Sahil','22');

INSERT INTO Student3
VALUES(NULL,'Sharma','Sahil','22');

-- 4. FOREIGN KEY
CREATE TABLE Student4
(
	EnrollmentNo int PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int
);

CREATE TABLE Library
(
	EnrollmentNo int,
    LibraryCardNo int PRIMARY KEY,
    NoOfBooksIssued int,
	FOREIGN KEY(EnrollmentNo) REFERENCES Student4(EnrollmentNo)
);

INSERT INTO Student4
VALUES('1','Arora','Drishti','19');

INSERT INTO Library
VALUES('1','101','2');

-- 5. CHECK 
CREATE TABLE Student5
(
    EnrollmentNo int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int,
    CHECK (Age>=18)
);

INSERT INTO Student5
VALUES('1','Arora','Drishti','19');
  
-- Violation of the CHECK constraint  
INSERT INTO Student5
VALUES('1','Sharma','Sahil','15');

-- 6. DEFAULT
CREATE TABLE Students6
(
	EnrollmentNo int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
    Age int DEFAULT '18'
);

INSERT INTO Student6
VALUES('1','Arora','Drishti','19');
    
-- Use the DEFAULT constraint  
INSERT INTO Student6
VALUES('2','Sharma','Sahil',default);