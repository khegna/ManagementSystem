USE [ManagementSystem]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[SickLeave]    Script Date: 10/27/2017 1:10:00 PM ******/
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
/****** Object:  Table [dbo].[Vacation]    Script Date: 10/27/2017 1:10:00 PM ******/
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
