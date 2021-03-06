/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [ManagementSystem]    Script Date: 10/10/2017 7:55:46 PM ******/
CREATE DATABASE [ManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ManagementSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManagementSystem', N'ON'
GO
ALTER DATABASE [ManagementSystem] SET QUERY_STORE = OFF
GO
USE [ManagementSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ManagementSystem]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ComplaintId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintDescription] [nvarchar](200) NULL,
	[DateFiled] [datetime] NULL,
	[SeverityLevel] [int] NULL,
	[EmployeeId] [int] NOT NULL,
	[Resolved] [bit] NULL,
	[SendTo] [nvarchar](75) NULL,
	[ViewedByHR] [bit] NULL,
	[ViewedByManager] [bit] NULL,
	[Issue] [nvarchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](75) NULL,
	[LastName] [nvarchar](75) NULL,
	[Username] [nvarchar](50) NULL,
	[EmployeePassword] [nvarchar](400) NULL,
	[Email] [nvarchar](100) NULL,
	[Salary] [int] NULL,
	[VacationDays] [int] NULL,
	[JobTitle] [nvarchar](75) NULL,
	[ManagerId] [int] NULL,
	[Rating] [int] NULL,
	[SickDaysTotal] [int] NULL,
	[DepartmentId] [int] NOT NULL,
	[EmployeeStatusId] [int] NOT NULL,
	[NumberOfReviews] [int] NULL,
	[Standing] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatus](
	[EmployeeStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[TreminationDate] [date] NULL,
	[FinalDate] [date] NULL,
	[CurrentStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[DateIssued] [date] NULL,
	[ReviewDescription] [nvarchar](500) NULL,
	[ReviewWeight] [int] NULL,
	[EmployeeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SickLeave]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SickLeave](
	[SickLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[Duration] [int] NULL,
	[ApprovalStatus] [nvarchar](75) NULL,
	[EmployeeId] [int] NOT NULL,
	[SendTo] [nvarchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[SickLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 10/10/2017 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation](
	[VacationId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[Duration] [int] NULL,
	[AprovalStatus] [nvarchar](75) NULL,
	[EmployeeId] [int] NOT NULL,
	[SendTo] [nvarchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[VacationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (1, N'My name is not right, I want it to be Cristina', CAST(N'2017-10-10T14:01:40.000' AS DateTime), 10, 4, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'Business')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'Software Development')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (1, N'Kristin', N'Hegna', N'khegna', N'Hegkri89', N'krihegna@gmail.com', 60000, 10, N'Manager', 5, 85, 10, 1, 1, 1, 85)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (2, N'Tom', N'Will', N'tom111', N'tom111', N'tom111@gmail.com', 55000, 3, N'Employee', 5, 120, 12, 1, 1, 2, 60)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (3, N'kristin1', N'hegna1', N'khegna1', N'Hegkri89', N'k@gmail.com', 56000, 5, N'Human Resources', 5, 250, 5, 1, 1, 3, 83)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (4, N'Kristin', N'hegna2', N'khegna2', N'Hegkri89', N'feh@gmail.com', 58000, 17, N'Employee', 5, 55, 7, 1, 1, 0, NULL)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (5, N'kristin3', N'hegna3', N'khegna3', N'Hegkri89', N'fjew@gmail.com', 63000, 13, N'Manager', 6, 178, 10, 1, 1, 2, 89)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (6, N'Miguel', N'Betancourt', N'MBetancourt', N'qwer', N'mbetancourt@gmail.com', 100000, 0, N'Manager', 5, 211, 0, 1, 1, 0, NULL)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (7, N'Miguel', N'Betancourt Jr', N'MBetancourtJr', N'qwer', N'miguel.betancourtjr@yahoo.com', 50000, 10, N'Employee', 3, 10, 10, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [StartDate], [TreminationDate], [FinalDate], [CurrentStatus]) VALUES (1, CAST(N'2017-09-10' AS Date), NULL, NULL, N'Active')
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (1, CAST(N'2017-10-10' AS Date), N'Test', 1, 14)
INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (2, CAST(N'2017-10-10' AS Date), N'Test2', 10, 14)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[SickLeave] ON 

INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (1, CAST(N'2017-10-10' AS Date), 15, N'Pending HR approval', 14, N'Human Resourses')
SET IDENTITY_INSERT [dbo].[SickLeave] OFF
SET IDENTITY_INSERT [dbo].[Vacation] ON 

INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (1, CAST(N'2017-10-10' AS Date), 10, N'Pending HR approval', 14, N'Human Resourses')
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (2, CAST(N'2017-10-10' AS Date), 3, N'Request Pending', 10, NULL)
SET IDENTITY_INSERT [dbo].[Vacation] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FkDepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FkDepartmentId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FkEmployeeStatusId] FOREIGN KEY([EmployeeStatusId])
REFERENCES [dbo].[EmployeeStatus] ([EmployeeStatusId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FkEmployeeStatusId]
GO
USE [master]
GO
ALTER DATABASE [ManagementSystem] SET  READ_WRITE 
GO
