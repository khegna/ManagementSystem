USE [master]
GO
/****** Object:  Database [ManagementSystem]    Script Date: 11/16/2017 8:41:52 AM ******/
CREATE DATABASE [ManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManagementSystem', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManagementSystem_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Complaint]    Script Date: 11/16/2017 8:41:52 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 11/16/2017 8:41:52 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 11/16/2017 8:41:52 AM ******/
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
	[StartDate] [date] NULL,
	[CurrentStatus] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 11/16/2017 8:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatus](
	[EmployeeStatusId] [int] IDENTITY(1,1) NOT NULL,
	[TreminationDate] [date] NULL,
	[FinalDate] [date] NULL,
	[EmployeeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaiseRequest]    Script Date: 11/16/2017 8:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaiseRequest](
	[RaiseRequestId] [int] IDENTITY(1,1) NOT NULL,
	[DateIssued] [date] NULL,
	[RaiseAmount] [int] NULL,
	[SendTo] [nvarchar](100) NULL,
	[ApprovalStatus] [nvarchar](100) NULL,
	[EmployeeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RaiseRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/16/2017 8:41:52 AM ******/
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
/****** Object:  Table [dbo].[SickLeave]    Script Date: 11/16/2017 8:41:52 AM ******/
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
/****** Object:  Table [dbo].[Vacation]    Script Date: 11/16/2017 8:41:52 AM ******/
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

INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (4, N'Salary is wrong', CAST(N'2017-09-16T19:14:28.000' AS DateTime), NULL, 3, 1, N'Manager', NULL, 1, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (5, N'salary increase', NULL, NULL, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (6, N'username', NULL, NULL, 5, 0, N'Human Resources', 1, 0, N'username')
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (7, N'Password is not right', CAST(N'2017-10-15T16:23:47.113' AS DateTime), NULL, 6, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (8, N'My email is wrong', CAST(N'2017-10-29T17:58:59.310' AS DateTime), NULL, 3, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (9, N'My pay is too low', CAST(N'2017-10-29T18:04:48.587' AS DateTime), NULL, 5, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (10, N'Last name is wrong', CAST(N'2017-10-29T22:45:59.653' AS DateTime), NULL, 3, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (11, N'pay too low, please fix', CAST(N'2017-11-01T14:42:33.000' AS DateTime), NULL, 7, 1, N'Manager', NULL, NULL, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (12, N'My username is wrong', CAST(N'2017-11-02T17:14:48.100' AS DateTime), NULL, 3, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (13, N'My username is incorrect', CAST(N'2017-11-02T17:36:24.710' AS DateTime), NULL, 4, 0, N'Human Resources', 0, 0, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved], [SendTo], [ViewedByHR], [ViewedByManager], [Issue]) VALUES (1012, N'guikuj', CAST(N'2017-11-09T14:27:56.660' AS DateTime), NULL, 5, 0, N'Human Resources', 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'Business')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'Software Development')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (3, N'Kristin', N'Hegna', N'khegna', N'Hegkri89', N'krihegna@gmail.com', 60000, 5, N'Manager', 3, 85, 5, 1, 1, 1, 85, CAST(N'2013-02-06' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (4, N'Tom', N'Will', N'tom111', N'Hegkri89', N'tom111@gmail.com', 55000, -9, N'Employee', 3, 120, 2, 1, 1, 2, 60, CAST(N'2014-12-09' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (5, N'kristin1', N'hegna1', N'khegna1', N'Hegkri89', N'krihegna1@gmail.com', 56000, -7, N'Human Resources', 3, 250, 5, 1, 1, 3, 83, CAST(N'2015-06-06' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (6, N'Robert', N'Johnson', N'khegna2', N'Hegkri90', N'feh@gmail.com', 58000, 17, N'Employee', 4, 55, 7, 1, 1, 1, 55, CAST(N'2014-05-01' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (7, N'Mary', N'Williams', N'MWilliams', N'Hegkri91', N'fjew@gmail.com', 63000, 13, N'Manager', 3, 268, 10, 1, 1, 3, 89, CAST(N'2013-09-02' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (8, N'Lisa', N'Jones', N'ljones', N'Hegkri92', N'ljones@gmail.com', 55000, 6, N'Employee', 3, 120, 2, 1, 1, 3, 40, CAST(N'2015-07-03' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (16, N'James', N'Smith', N'Smith1', N'vdftgbh', N'eafnhjo@gmail.com', 90000, 10, N'Manager', 3, 100, 5, 1, 1, 2, 50, CAST(N'2017-11-15' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (17, N'Mark', N'Jones', N'MJones', N'Hegkri89', N'MJones@gmail.com', 70000, 14, N'Employee', 3, 84, 13, 1, 1, 2, 42, CAST(N'2017-11-14' AS Date), N'Active')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing], [StartDate], [CurrentStatus]) VALUES (1014, N'Miguel', N'Betancourt Jr.', N'MBetancourt', N'Miguel1234', N'Miguel1@gmail.com', 50000, 12, N'Human Resources', 3, 90, 13, 1, 1, 1, 90, CAST(N'2017-01-01' AS Date), N'Active')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (1, CAST(N'2017-10-19' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (2, CAST(N'2017-10-19' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (3, CAST(N'2017-10-19' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (4, CAST(N'2017-10-19' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (5, CAST(N'2017-10-21' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (6, CAST(N'2017-10-24' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (7, CAST(N'2017-10-20' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (8, CAST(N'2017-10-23' AS Date), CAST(N'2017-11-01' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (9, CAST(N'2017-10-21' AS Date), CAST(N'2017-11-02' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (10, CAST(N'2017-11-16' AS Date), CAST(N'2017-11-15' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (11, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-15' AS Date), 4)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (12, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-16' AS Date), 5)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (1010, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-23' AS Date), 3)
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [TreminationDate], [FinalDate], [EmployeeId]) VALUES (1011, CAST(N'2017-11-17' AS Date), CAST(N'2017-11-23' AS Date), 5)
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
SET IDENTITY_INSERT [dbo].[RaiseRequest] ON 

INSERT [dbo].[RaiseRequest] ([RaiseRequestId], [DateIssued], [RaiseAmount], [SendTo], [ApprovalStatus], [EmployeeId]) VALUES (1, CAST(N'2017-11-14' AS Date), 2000, NULL, N'Pending', 7)
SET IDENTITY_INSERT [dbo].[RaiseRequest] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (1, CAST(N'2017-09-20' AS Date), N'fklerjfkljklfjlkalfewlf', 20, 3)
INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (2, CAST(N'2019-02-02' AS Date), N'gergtwaqt', 5, 3)
INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (3, CAST(N'2017-10-19' AS Date), N'not good', 0, 8)
INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (4, CAST(N'2017-11-02' AS Date), N'Employee has performed satisfactory', 90, 7)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[SickLeave] ON 

INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (1, CAST(N'2017-09-19' AS Date), 6, N'Denied', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (2, CAST(N'2017-10-20' AS Date), 5, N'Approved', 4, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (3, CAST(N'2017-11-03' AS Date), NULL, N'Denied', 5, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (4, CAST(N'2017-11-22' AS Date), 7, N'Approved', 8, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (5, CAST(N'2018-02-02' AS Date), 5, N'Request Pending', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (6, CAST(N'2017-10-31' AS Date), 5, N'Approved', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (7, CAST(N'2017-10-31' AS Date), 2, N'Denied', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (8, CAST(N'2017-10-31' AS Date), 3, N'Request Pending', 5, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (9, CAST(N'2017-11-10' AS Date), 5, N'Request Pending', 6, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (10, CAST(N'2017-11-08' AS Date), 2, N'Request Pending', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (11, CAST(N'2017-11-16' AS Date), 3, N'Request Pending', 3, NULL)
INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId], [SendTo]) VALUES (1009, CAST(N'2017-11-15' AS Date), 7, N'Request Pending', 5, NULL)
SET IDENTITY_INSERT [dbo].[SickLeave] OFF
SET IDENTITY_INSERT [dbo].[Vacation] ON 

INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (1, CAST(N'2017-10-02' AS Date), 6, N'Approved', 4, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (2, CAST(N'2017-10-23' AS Date), 8, N'Approved', 5, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (3, CAST(N'2017-11-23' AS Date), 4, NULL, 6, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (4, CAST(N'2017-10-31' AS Date), 5, N'Approved', 3, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (5, CAST(N'2017-11-16' AS Date), 3, N'Request Pending', 3, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (6, CAST(N'2017-10-30' AS Date), 4, N'Approved', 5, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (7, CAST(N'2017-11-15' AS Date), 4, N'Denied', 5, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (8, CAST(N'2017-11-21' AS Date), 12, N'Request Pending', 4, NULL)
INSERT [dbo].[Vacation] ([VacationId], [StartDate], [Duration], [AprovalStatus], [EmployeeId], [SendTo]) VALUES (1008, CAST(N'2017-11-16' AS Date), 7, N'Request Pending', 5, NULL)
SET IDENTITY_INSERT [dbo].[Vacation] OFF
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FkEmployeeComplaintId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FkEmployeeComplaintId]
GO
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
ALTER TABLE [dbo].[EmployeeStatus]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[RaiseRequest]  WITH CHECK ADD  CONSTRAINT [FkEmployeeRaiseRequestId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[RaiseRequest] CHECK CONSTRAINT [FkEmployeeRaiseRequestId]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FkEmployeeReviewId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FkEmployeeReviewId]
GO
ALTER TABLE [dbo].[SickLeave]  WITH CHECK ADD  CONSTRAINT [FkEmployeeSickLeaveId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[SickLeave] CHECK CONSTRAINT [FkEmployeeSickLeaveId]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [FkEmployeeVacationId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [FkEmployeeVacationId]
GO
USE [master]
GO
ALTER DATABASE [ManagementSystem] SET  READ_WRITE 
GO
