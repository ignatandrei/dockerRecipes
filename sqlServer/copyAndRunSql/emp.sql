create database tests
go

USE [tests]
GO
create table test(
id int,
name varchar(200),
createdOn datetime
)
/****** Object:  ForeignKey [FK_Employee_Department]    Script Date: 07/05/2010 01:50:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/05/2010 01:50:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07/05/2010 01:50:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07/05/2010 01:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[IDDepartment] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[IDDepartment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (3, N'HR')
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 07/05/2010 01:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[IDEmployee] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IDDepartment] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Employee_Department]    Script Date: 07/05/2010 01:50:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([IDDepartment])
REFERENCES [dbo].[Department] ([IDDepartment])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO



-- DROP TABLE [dbo].[TestAndrei]
-- GO

-- CREATE TABLE [dbo].[TestAndrei](
	-- [A2] [char](100) NULL,
	-- [A3] [varchar](100) NULL,
	-- [A4] [varchar](150) NULL,
	-- [A5] [text] NULL,
	-- [A6] [nchar](1) NULL,
	-- [A7] [nvarchar](1) NULL,
	-- [A8] [nvarchar](150) NULL,
	-- [A9] [ntext] NULL,
	-- [A10] [binary](100) NULL,
	-- [A11] [varbinary](1) NULL,
	-- [A12] [varbinary](150) NULL,
	-- [A13] [image] NULL,
	-- [A14] [bit] NULL,
	-- [A15] [tinyint] NULL,
	-- [A16] [smallint] NULL,
	-- [A17] [int] NULL,
	-- [A18] [bigint] NULL,
	-- [A19] [decimal](10, 2) NULL,
	-- [A20] [numeric](10, 4) NULL,
	-- [A21] [smallmoney] NULL,
	-- [A22] [money] NULL,
	-- [A23] [float] NULL,
	-- [A24] [real] NULL,
	-- [A25] [datetime] NULL,
	-- [A26] [datetime2](7) NULL,
	-- [A27] [smalldatetime] NULL,
	-- [A28] [date] NULL,
	-- [A29] [time](7) NULL,
	-- [A30] [datetimeoffset](7) NULL,
	-- [A31] [timestamp] NOT NULL,
	-- [A32] [sql_variant] NULL,
	-- [A33] [uniqueidentifier] NULL,
	-- [A34] [xml] NULL,
	-- [id] [int] IDENTITY(1,1) NOT NULL,
-- PRIMARY KEY CLUSTERED 
-- (
	-- [id] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
-- ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
-- GO


create view DepartmentEmployeeNumber
as
select d.IDDepartment, count(*)  as NrEmployee from Department d
left outer join Employee e
on d.IDDepartment = e.IDDepartment
group by d.IDDepartment