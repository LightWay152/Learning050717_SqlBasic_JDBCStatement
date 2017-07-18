-- Create Database
CREATE DATABASE Java;
-- Use Database
USE Java;
-- Create Table
CREATE TABLE Courses
(
	Id CHAR(3) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	SchoolFee FLOAT,
	LearnerCount INT DEFAULT 0,
	StartDate DATE DEFAULT getDate(),
	Status BIT DEFAULT 0,
	PRIMARY KEY(Id),
	UNIQUE(Name),
	CHECK(LearnerCount>=15 AND LearnerCount<=30)
)
-- Backup Database
BACKUP DATABASE Java TO DISK='E:/WorkSpace/LearningJavaWebServletJSP/SqlServer/050717/java.bak'
-- Drop Database
USE master;
DROP DATABASE Java;
-- Restore Database
RESTORE DATABASE Java FROM DISK='E:/WorkSpace/LearningJavaWebServletJSP/SqlServer/050717/java.bak'
-- Insert Database
USE Java;
INSERT INTO Courses(Id,Name,SchoolFee,LearnerCount) 
		VALUES('JAV',N'Lập trình Web với Java',4000000,25)
INSERT INTO Courses(Id,Name,Schoolfee,LearnerCount)
		VALUES('MVC',N'Lập trình ASP.NET MVC 5',3000000,26)
INSERT INTO Courses(Id,Name,Schoolfee,LearnerCount)
		VALUES('PHP',N'Lập trình Web với PHP',2500000,24)
INSERT INTO Courses(Id,Name,Schoolfee,LearnerCount)
		VALUES('AND',N'Lập trình Android',2500000,22)
INSERT INTO Courses(Id,Name,Schoolfee,LearnerCount)
		VALUES('SEO',N'Internet Marketing',1500000,23)
-- Select Database
SELECT * FROM Courses
-- Update Database
UPDATE Courses 
		SET StartDate='2017-07-01', SchoolFee=3500000 
		WHERE Id='MVC'
-- Delete Database
DELETE FROM Courses
		WHERE LearnerCount<25
-- Relationship
CREATE TABLE Categories
(
	Id CHAR(3) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	PRIMARY KEY(Id)
)
CREATE TABLE Products
(
	Id INT IDENTITY(1000,1) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	CategoryId CHAR(3) DEFAULT 'MOB' NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(CategoryId) REFERENCES Categories(Id)
							ON DELETE SET DEFAULT
							ON UPDATE CASCADE
)
INSERT INTO Categories(Id,Name) VALUES('MOB',N'Mobile')
INSERT INTO Categories(Id,Name) VALUES('LAP',N'Laptop')
INSERT INTO Categories(Id,Name) VALUES('CAM',N'Camera')
INSERT INTO Categories(Id,Name) VALUES('REM',N'Remote')

INSERT INTO Products(Name,CategoryId) VALUES(N'iPhone 9','MOB')
INSERT INTO Products(Name,CategoryId) VALUES(N'Samsung Galaxy','MOB')
INSERT INTO Products(Name,CategoryId) VALUES(N'Sony Vaio','LAP')
INSERT INTO Products(Name,CategoryId) VALUES(N'Canon 2017','CAM')

SELECT * FROM Categories
SELECT * FROM Products

UPDATE Categories SET Id='CMR' WHERE Id='CAM'
DELETE FROM Categories WHERE Id='CMR'