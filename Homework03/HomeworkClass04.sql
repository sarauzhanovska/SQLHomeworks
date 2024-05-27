USE SEDC_ACADEMY_HOMEWORK
GO

--Calculate the count of all grades per Teacher in the system
SELECT COUNT(*) AS Grades
FROM [dbo].[Teacher] t
LEFT JOIN [dbo].[Grade] g ON t.Id = g.TeacherID
GROUP BY t.Id


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.FirstName, COUNT(g.Grade) AS GradeCount
FROM [dbo].[Teacher] AS t
JOIN Grade AS g ON t.ID = g.TeacherID
JOIN Student AS s ON g.StudentID = s.ID
WHERE g.StudentID < 100
GROUP BY t.FirstName


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, s.LastName, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.ID ,s.FirstName, s.LastName 


--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS GradeCount
FROM [dbo].[Teacher] AS t
JOIN Grade AS g ON t.ID = g.TeacherID
JOIN Student AS s ON g.StudentID = s.ID
GROUP BY t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount ,MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.ID ,s.FirstName, s.LastName 
HAVING MAX(g.Grade) = AVG(g.Grade) 

--List Student First Name and Last Name next to the other details from previous query
-- *na prethodnoto imam iskoristeno vekje*

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vw_StudentGrades AS
SELECT
s.Id AS StudentId,
COUNT (g.Grade) AS GradeCount
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.ID

SELECT * FROM vw_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vw_StudentGrades AS
SELECT
s.FirstName AS [Name],
s.LastName AS Surname,
COUNT (g.Grade) AS GradeCount
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY 
    s.FirstName, s.LastName
GO

--List all rows from view ordered by biggest Grade Count
SELECT *
FROM vw_StudentGrades
ORDER BY (GradeCount) DESC