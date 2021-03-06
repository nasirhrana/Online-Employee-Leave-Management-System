USE [master]
GO
/****** Object:  Database [EmployeeLeaveManagementDb]    Script Date: 4/23/2018 3:08:38 AM ******/
CREATE DATABASE [EmployeeLeaveManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeLeaveManagementDb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeLeaveManagementDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeLeaveManagementDb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeLeaveManagementDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeLeaveManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeLeaveManagementDb]
GO
/****** Object:  Table [dbo].[tb_AllocationLeave]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_AllocationLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[NumberOfLeave] [int] NOT NULL,
 CONSTRAINT [PK_tb_AllocationLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Designation]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Employee]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
	[MotherName] [varchar](50) NOT NULL,
	[NationalIdNumber] [varchar](50) NULL,
 CONSTRAINT [PK_tb_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_EmployeeLeave]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_EmployeeLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[TotalDay] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_EmployeeLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_EmployeePassword]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_EmployeePassword](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_EmployeePassword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_EmployeeUserType]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_EmployeeUserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[UserTypeId] [int] NOT NULL,
 CONSTRAINT [PK_tb_EmployeeUserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_LeaveType]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_LeaveType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_LeaveType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_UserType]    Script Date: 4/23/2018 3:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Designation] ON 

INSERT [dbo].[tb_Designation] ([Id], [DesignationName]) VALUES (1, N'CEO')
INSERT [dbo].[tb_Designation] ([Id], [DesignationName]) VALUES (2, N'Developer')
INSERT [dbo].[tb_Designation] ([Id], [DesignationName]) VALUES (3, N'Intern')
SET IDENTITY_INSERT [dbo].[tb_Designation] OFF
SET IDENTITY_INSERT [dbo].[tb_Employee] ON 

INSERT [dbo].[tb_Employee] ([Id], [EmployeeName], [Email], [DesignationId], [FatherName], [MotherName], [NationalIdNumber]) VALUES (2, N'Md Nora Alam', N'nora.alam07@gmail.com', 2, N'Abdur Rahim', N'Hoshnahar Begum', N'1211393634289')
SET IDENTITY_INSERT [dbo].[tb_Employee] OFF
SET IDENTITY_INSERT [dbo].[tb_EmployeePassword] ON 

INSERT [dbo].[tb_EmployeePassword] ([Id], [EmployeeId], [Password]) VALUES (2, 2, N'123456')
SET IDENTITY_INSERT [dbo].[tb_EmployeePassword] OFF
SET IDENTITY_INSERT [dbo].[tb_EmployeeUserType] ON 

INSERT [dbo].[tb_EmployeeUserType] ([Id], [EmployeeId], [UserTypeId]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[tb_EmployeeUserType] OFF
SET IDENTITY_INSERT [dbo].[tb_LeaveType] ON 

INSERT [dbo].[tb_LeaveType] ([Id], [LeaveTypeName]) VALUES (1, N'Sick Leave')
INSERT [dbo].[tb_LeaveType] ([Id], [LeaveTypeName]) VALUES (2, N'Casual Leave')
SET IDENTITY_INSERT [dbo].[tb_LeaveType] OFF
SET IDENTITY_INSERT [dbo].[tb_UserType] ON 

INSERT [dbo].[tb_UserType] ([Id], [UserTypeName]) VALUES (1, N'admin')
INSERT [dbo].[tb_UserType] ([Id], [UserTypeName]) VALUES (2, N'subAdmin')
INSERT [dbo].[tb_UserType] ([Id], [UserTypeName]) VALUES (3, N'user')
SET IDENTITY_INSERT [dbo].[tb_UserType] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_Employee]    Script Date: 4/23/2018 3:08:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Employee] ON [dbo].[tb_Employee]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_AllocationLeave]  WITH CHECK ADD  CONSTRAINT [FK_tb_AllocationLeave_tb_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tb_Designation] ([Id])
GO
ALTER TABLE [dbo].[tb_AllocationLeave] CHECK CONSTRAINT [FK_tb_AllocationLeave_tb_Designation]
GO
ALTER TABLE [dbo].[tb_AllocationLeave]  WITH CHECK ADD  CONSTRAINT [FK_tb_AllocationLeave_tb_LeaveType] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tb_LeaveType] ([Id])
GO
ALTER TABLE [dbo].[tb_AllocationLeave] CHECK CONSTRAINT [FK_tb_AllocationLeave_tb_LeaveType]
GO
ALTER TABLE [dbo].[tb_Employee]  WITH CHECK ADD  CONSTRAINT [FK_tb_Employee_tb_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tb_Designation] ([Id])
GO
ALTER TABLE [dbo].[tb_Employee] CHECK CONSTRAINT [FK_tb_Employee_tb_Designation]
GO
ALTER TABLE [dbo].[tb_EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_tb_EmployeeLeave_tb_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tb_Employee] ([Id])
GO
ALTER TABLE [dbo].[tb_EmployeeLeave] CHECK CONSTRAINT [FK_tb_EmployeeLeave_tb_Employee]
GO
ALTER TABLE [dbo].[tb_EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_tb_EmployeeLeave_tb_LeaveType] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tb_LeaveType] ([Id])
GO
ALTER TABLE [dbo].[tb_EmployeeLeave] CHECK CONSTRAINT [FK_tb_EmployeeLeave_tb_LeaveType]
GO
ALTER TABLE [dbo].[tb_EmployeePassword]  WITH CHECK ADD  CONSTRAINT [FK_tb_EmployeePassword_tb_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tb_Employee] ([Id])
GO
ALTER TABLE [dbo].[tb_EmployeePassword] CHECK CONSTRAINT [FK_tb_EmployeePassword_tb_Employee]
GO
ALTER TABLE [dbo].[tb_EmployeeUserType]  WITH CHECK ADD  CONSTRAINT [FK_tb_EmployeeUserType_tb_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tb_Employee] ([Id])
GO
ALTER TABLE [dbo].[tb_EmployeeUserType] CHECK CONSTRAINT [FK_tb_EmployeeUserType_tb_Employee]
GO
ALTER TABLE [dbo].[tb_EmployeeUserType]  WITH CHECK ADD  CONSTRAINT [FK_tb_EmployeeUserType_tb_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[tb_UserType] ([Id])
GO
ALTER TABLE [dbo].[tb_EmployeeUserType] CHECK CONSTRAINT [FK_tb_EmployeeUserType_tb_UserType]
GO
USE [master]
GO
ALTER DATABASE [EmployeeLeaveManagementDb] SET  READ_WRITE 
GO
