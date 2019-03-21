CREATE DATABASE [bdTestEFCore]
GO

USE [bdTestEFCore]
GO

CREATE SCHEMA [Security]
GO

/****** Object:  Table [Security].[Module]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[Module](
	[Id] [bigint] NOT NULL,
	[TypeAppIdc] [bigint] NOT NULL,
	[StatusIdc] [bigint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[Option]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[Option](
	[Id] [bigint] NOT NULL,
	[ModuleId] [bigint] NOT NULL,
	[StatusIdc] [bigint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[Url] [varchar](255) NULL,
	[ListOrder] [int] NOT NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[Profile]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[Profile](
	[Id] [bigint] NOT NULL,
	[StatusIdc] [bigint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[ProfileOption]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[ProfileOption](
	[ProfileId] [bigint] NOT NULL,
	[OptionId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProfileOption] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC,
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[User]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[User](
	[Id] [bigint] NOT NULL,
	[UserTypeIdc] [bigint] NOT NULL,
	[StatusIdc] [bigint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[FirebaseMessageId] [varchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[UserProfile]    Script Date: 3/21/2019 10:46:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[UserProfile](
	[UserId] [bigint] NOT NULL,
	[ProfileId] [bigint] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Security].[Module] ([Id], [TypeAppIdc], [StatusIdc], [Name], [Icon], [Priority]) VALUES (1, 5, 3, N'Seguridad', N'fa fa-lock', 2)
GO
INSERT [Security].[Module] ([Id], [TypeAppIdc], [StatusIdc], [Name], [Icon], [Priority]) VALUES (2, 5, 3, N'Administracion', N'fa fa-briefcase', 3)
GO
INSERT [Security].[Module] ([Id], [TypeAppIdc], [StatusIdc], [Name], [Icon], [Priority]) VALUES (3, 5, 3, N'Base', N'fas fa-cogs', 1)
GO
INSERT [Security].[Module] ([Id], [TypeAppIdc], [StatusIdc], [Name], [Icon], [Priority]) VALUES (4, 5, 3, N'Smart Planner', N'far fa-calendar-alt', 4)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (1, 1, 3, N'Usuarios', N'fa fa-user', N'User/UserList', 1)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (2, 1, 3, N'Perfiles', N'fas fa-address-card', N'Profile/ProfileList', 2)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (3, 2, 3, N'Campañas', N'fa fa-calendar', N'Campaign/CampaignList', 1)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (4, 3, 3, N'Parametros', N'fas fa-cog', N'ConfigParameter/ConfigParameter', 1)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (5, 4, 3, N'Lugares de reunion', N'fas fa-map-marker-alt', N'Place/PlaceList', 1)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (6, 4, 3, N'Propositos', N'fas fa-indent', N'Purpose/PurposeList', 1)
GO
INSERT [Security].[Option] ([Id], [ModuleId], [StatusIdc], [Name], [Icon], [Url], [ListOrder]) VALUES (7, 3, 3, N'Clasificadores', N'fas fa-align-left', N'Classifier/ClassifierList', 2)
GO
INSERT [Security].[Profile] ([Id], [StatusIdc], [Name]) VALUES (1, 3, N'Administrador')
GO
INSERT [Security].[Profile] ([Id], [StatusIdc], [Name]) VALUES (3, 3, N'Directora')
GO
INSERT [Security].[Profile] ([Id], [StatusIdc], [Name]) VALUES (4, 3, N'Coordinadora')
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 1)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 2)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 3)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 4)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 5)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 6)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (1, 7)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (3, 5)
GO
INSERT [Security].[ProfileOption] ([ProfileId], [OptionId]) VALUES (4, 5)
GO
INSERT [Security].[User] ([Id], [UserTypeIdc], [StatusIdc], [Name], [Email], [Login], [Password], [Code], [FirebaseMessageId]) VALUES (1, 1, 3, N'Administrador', N'admin@admin.com', N'ava', N'demo', N'01', N'123456789')
GO
INSERT [Security].[User] ([Id], [UserTypeIdc], [StatusIdc], [Name], [Email], [Login], [Password], [Code], [FirebaseMessageId]) VALUES (2, 1, 3, N'osmar davalos', N'buby@gmail.com', N'osmar', N'demo', N'182', N'123')
GO
INSERT [Security].[User] ([Id], [UserTypeIdc], [StatusIdc], [Name], [Email], [Login], [Password], [Code], [FirebaseMessageId]) VALUES (3, 1, 3, N'Coordinadora 1', N'coordinadora1@yanbal.com', N'ava02', N'demo', N'02', N'00001')
GO
INSERT [Security].[User] ([Id], [UserTypeIdc], [StatusIdc], [Name], [Email], [Login], [Password], [Code], [FirebaseMessageId]) VALUES (4, 1, 3, N'Coordinadora 3', N'coor3@yanbal.com', N'ava03', N'demo', N'03', N'004')
GO
INSERT [Security].[User] ([Id], [UserTypeIdc], [StatusIdc], [Name], [Email], [Login], [Password], [Code], [FirebaseMessageId]) VALUES (5, 1, 3, N'Coordinadora 4', N'coor4@yanbal.com', N'ava04', N'demo', N'04', N'004')
GO
INSERT [Security].[UserProfile] ([UserId], [ProfileId]) VALUES (1, 1)
GO
INSERT [Security].[UserProfile] ([UserId], [ProfileId]) VALUES (2, 1)
GO
INSERT [Security].[UserProfile] ([UserId], [ProfileId]) VALUES (3, 1)
GO
INSERT [Security].[UserProfile] ([UserId], [ProfileId]) VALUES (4, 1)
GO
INSERT [Security].[UserProfile] ([UserId], [ProfileId]) VALUES (5, 4)
GO
ALTER TABLE [Security].[Option]  WITH CHECK ADD  CONSTRAINT [FK_Option_Module] FOREIGN KEY([ModuleId])
REFERENCES [Security].[Module] ([Id])
GO
ALTER TABLE [Security].[Option] CHECK CONSTRAINT [FK_Option_Module]
GO
ALTER TABLE [Security].[ProfileOption]  WITH CHECK ADD  CONSTRAINT [FK_ProfileOption_Option] FOREIGN KEY([OptionId])
REFERENCES [Security].[Option] ([Id])
GO
ALTER TABLE [Security].[ProfileOption] CHECK CONSTRAINT [FK_ProfileOption_Option]
GO
ALTER TABLE [Security].[ProfileOption]  WITH CHECK ADD  CONSTRAINT [FK_ProfileOption_Profile] FOREIGN KEY([ProfileId])
REFERENCES [Security].[Profile] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[ProfileOption] CHECK CONSTRAINT [FK_ProfileOption_Profile]
GO
ALTER TABLE [Security].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Profile] FOREIGN KEY([ProfileId])
REFERENCES [Security].[Profile] ([Id])
GO
ALTER TABLE [Security].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Profile]
GO
ALTER TABLE [Security].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_User] FOREIGN KEY([UserId])
REFERENCES [Security].[User] ([Id])
GO
ALTER TABLE [Security].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_User]
GO