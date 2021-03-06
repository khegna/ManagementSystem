USE [ManagementSystem]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 9/21/2017 3:36:44 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/21/2017 3:36:44 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 9/21/2017 3:36:44 PM ******/
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
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 9/21/2017 3:36:44 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 9/21/2017 3:36:44 PM ******/
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
/****** Object:  Table [dbo].[SickLeave]    Script Date: 9/21/2017 3:36:44 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[SickLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 9/21/2017 3:36:44 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[VacationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintDescription], [DateFiled], [SeverityLevel], [EmployeeId], [Resolved]) VALUES (4, N'fhkeahgre
greagreg
resgtregse', CAST(N'2017-09-16T19:14:28.793' AS DateTime), NULL, 3, 0)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'Business')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'Software Development')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (3, N'Kristin', N'Hegna', N'khegna', N'Hegkri89', N'krihegna@gmail.com', 60000, 10, N'Manager', 1, 85, 10, 1, 1, 1, 85)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (4, N'Tom', N'Will', N'tom111', N'tom111', N'tom111@gmail.com', 55000, 3, N'Employee', 1, 120, 12, 1, 1, 2, 60)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (5, N'kristin1', N'hegna1', N'khegna1', N'Hegkri89', N'k@gmail.com', 56000, 5, N'Human Resources', 3, 250, 5, 1, 1, 3, 83)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (6, N'kristin2', N'hegna2', N'khegna2', N'Hegkri89', N'feh@gmail.com', 58000, 17, N'Employee', 3, 55, 7, 1, 1, 1, 55)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Username], [EmployeePassword], [Email], [Salary], [VacationDays], [JobTitle], [ManagerId], [Rating], [SickDaysTotal], [DepartmentId], [EmployeeStatusId], [NumberOfReviews], [Standing]) VALUES (7, N'kristin3', N'hegna3', N'khegna3', N'Hegkri89', N'fjew@gmail.com', 63000, 13, N'Manager', 3, 178, 10, 1, 1, 2, 89)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [StartDate], [TreminationDate], [FinalDate], [CurrentStatus]) VALUES (1, CAST(N'2017-09-10' AS Date), NULL, NULL, N'Active')
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (1, CAST(N'2017-09-20' AS Date), N'fklerjfkljklfjlkalfewlf', 20, 3)
INSERT [dbo].[Review] ([ReviewId], [DateIssued], [ReviewDescription], [ReviewWeight], [EmployeeId]) VALUES (2, CAST(N'2019-02-02' AS Date), N'gergtwaqt', 5, 3)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[SickLeave] ON 

INSERT [dbo].[SickLeave] ([SickLeaveId], [StartDate], [Duration], [ApprovalStatus], [EmployeeId]) VALUES (1, CAST(N'2017-09-19' AS Date), 6, NULL, 3)
SET IDENTITY_INSERT [dbo].[SickLeave] OFF
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
