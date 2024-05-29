USE SEDC_ACADEMY_HOMEWORK
GO

--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable

DECLARE @FirstName nvarchar(50)
SELECT @FirstName = 'Antonio'
SELECT @FirstName AS FirstName

SELECT *
FROM [dbo].[Student]
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

DECLARE @StudentInfo TABLE
( StudentId INT NOT NULL,
  StudentName nvarchar(100),
  DateOfBirth date
)
INSERT INTO @StudentInfo (StudentId,StudentName,DateOfBirth)
SELECT Id, FirstName, DateOfBirth
FROM [dbo].[Student]
WHERE Gender = 'F'
SELECT * FROM @StudentInfo
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’

CREATE TABLE #StudentsTable
(
   LastName nvarchar(50),
   EnrolledDate date
)
INSERT INTO #StudentsTable (LastName,EnrolledDate)
SELECT LastName, EnrolledDate
FROM [dbo].[Student]
WHERE Gender = 'M' AND FirstName like 'A%'
SELECT * FROM #StudentsTable
GO

--Retrieve the students from the table which last name is with 7 characters
SELECT * FROM #StudentsTable
WHERE LEN(LastName) = 7;
--Find all teachers whose FirstName length is less than 5 and
SELECT *
FROM [dbo].[Teacher]
WHERE LEN(FirstName) < 5
--the first 3 characters of their FirstName and LastName are the same
SELECT  * 
FROM [dbo].[Teacher]
WHERE LEFT(FirstName , 3) = LEFT(LastName, 3)
GO
