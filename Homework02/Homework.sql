USE SEDC_ACADEMY_HOMEWORK
GO

-- Find all Students with FirstName = Antonio
SELECT * 
FROM [dbo].[Student]
WHERE [FirstName] = 'Antonio'
GO

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM [dbo].[Student] 
WHERE [DateOfBirth] > '01.01.1999'
GO 

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * 
FROM [dbo].[Student]
WHERE [LastName] LIKE 'J%' 
AND [EnrolledDate] BETWEEN '2018-06-01' AND '2018-06-30' 
GO
-- nemashe podatoci so **enrolled in January/1998** pa vaka probav kolku da vidam dali raboti


-- List all Students ordered by FirstName
SELECT *
FROM [dbo].[Student]
ORDER BY [FirstName] ASC
GO

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM [dbo].[Teacher] 
UNION
SELECT LastName FROM [dbo].[Student] 
GO
-- Create Foreign key constraints from diagram or with script



-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.[Name], aType.[Name]
FROM [dbo].[Course] AS c
CROSS JOIN 
[dbo].[AchievementType] AS aType


-- List all Teachers without exam Grade
SELECT t.FirstName, t.LastName
FROM [dbo].[Teacher] AS t
LEFT JOIN
[dbo].[Grade] AS g ON g.TeacherID = t.ID
WHERE g.Id IS NULL
-- za ova iskreno ne znam dali e tochno
