USE [tests]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RE]') AND type in (N'U'))
ALTER TABLE [dbo].[RE] DROP CONSTRAINT IF EXISTS [FK_RE_Room]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RE]') AND type in (N'U'))
ALTER TABLE [dbo].[RE] DROP CONSTRAINT IF EXISTS [FK_RE_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Department]
GO
/****** Object:  Table [dbo].[test]    Script Date: 12/19/2020 6:10:41 PM ******/
DROP TABLE IF EXISTS [dbo].[test]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/19/2020 6:10:41 PM ******/
DROP TABLE IF EXISTS [dbo].[Room]
GO
/****** Object:  Table [dbo].[RE]    Script Date: 12/19/2020 6:10:41 PM ******/
DROP TABLE IF EXISTS [dbo].[RE]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/19/2020 6:10:41 PM ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/19/2020 6:10:41 PM ******/
DROP TABLE IF EXISTS [dbo].[Department]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/19/2020 6:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[IDDepartment] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[IDDepartment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/19/2020 6:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IDEmployee] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IDDepartment] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RE]    Script Date: 12/19/2020 6:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RE](
	[IDRoom] [int] NOT NULL,
	[IDEmp] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RE] PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC,
	[IDEmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/19/2020 6:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 12/19/2020 6:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[id] [int] NULL,
	[name] [varchar](200) NULL,
	[createdOn] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (2, N'IT')
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (3, N'HR')
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (4, N'asda')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([IDEmployee], [Name], [IDDepartment]) VALUES (1, N'test', 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[RE] ([IDRoom], [IDEmp], [CreatedDate]) VALUES (1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([ID], [Name]) VALUES (1, N'home      ')
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([IDDepartment])
REFERENCES [dbo].[Department] ([IDDepartment])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[RE]  WITH CHECK ADD  CONSTRAINT [FK_RE_Employee] FOREIGN KEY([IDEmp])
REFERENCES [dbo].[Employee] ([IDEmployee])
GO
ALTER TABLE [dbo].[RE] CHECK CONSTRAINT [FK_RE_Employee]
GO
ALTER TABLE [dbo].[RE]  WITH CHECK ADD  CONSTRAINT [FK_RE_Room] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[RE] CHECK CONSTRAINT [FK_RE_Room]
GO
