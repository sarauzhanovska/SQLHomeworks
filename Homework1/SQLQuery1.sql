USE [master]
GO

DROP DATABASE IF EXISTS [SEDCACADEMYDB]
GO

CREATE DATABASE [SEDCACADEMYDB]
GO

USE [SEDCACADEMYDB]
GO

CREATE TABLE [dbo].[Student](
   [Id] int IDENTITY(1,1) NOT NULL,
   [FirstName] nvarchar(100) NOT NULL,
   [LastName] nvarchar(100) NOT NULL,
   [DateOfBirth] date NULL,
   [EnrolledDate] date NULL,
   [Gender] nchar(1) NULL,
   [NationalIDNumber] nvarchar(20) NULL,
   [StudentCardNumber] nvarchar(20) NULL
)

CREATE TABLE [dbo].[Teacher](
   [Id] int IDENTITY(1,1) NOT NULL,
   [FirstName] nvarchar(100) NOT NULL,
   [LastName] nvarchar(100) NOT NULL,
   [DateOfBirth] date NULL,
   [AcademicRank] nvarchar(100) NULL,
   [HireDate] date NULL,
)

CREATE TABLE [dbo].[Grade](
   [Id] int IDENTITY(1,1) NOT NULL,
   [StudentId] int NULL,
   [CourseId] int NULL,
   [TeacherId] int NULL,
   [Grade] nvarchar(2) NOT NULL,
   [Comment] nvarchar(max) NULL,
   [CreatedDate] date NULL
)

CREATE TABLE [dbo].[Course](
   [Id] int IDENTITY(1,1) NOT NULL,
   [Name] nvarchar(100) NOT NULL,
   [Credit] int NOT NULL,
   [AcademicYear] int NOT NULL,
   [Semester] nvarchar(20) NOT NULL,
)

CREATE TABLE [dbo].[GradeDetails](
   [Id] int IDENTITY(1,1) NOT NULL,
   [GradeId] int NOT NULL,
   [AchievementTypeId] int NOT NULL,
   [AchievementPoints] decimal(10,2) NOT NULL,
   [AchievementMaxPoints] decimal(10,2) NOT NULL,
   [AchievementDate] date NOT NULL
)

CREATE TABLE [dbo].[AchievementType](
   [Id] int IDENTITY(1,1) NOT NULL,
   [Name] nvarchar(100) NOT NULL,
   [Description] nvarchar(max) NULL,
   [ParticipationRate]  decimal(5,2) NULL,

)
GO