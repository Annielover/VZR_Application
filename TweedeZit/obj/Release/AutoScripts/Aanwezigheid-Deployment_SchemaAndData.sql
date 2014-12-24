SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aanwezigheid](
	[AanwezigheidId] [int] IDENTITY(1,1) NOT NULL,
	[Aanwezig] [bit] NOT NULL,
	[Cursist_CursistId] [int] NULL,
	[Dag_OpleidingsdagId] [int] NULL,
	[Leertraject_LeertrajectId] [int] NULL,
 CONSTRAINT [PK_dbo.Aanwezigheid] PRIMARY KEY CLUSTERED 
(
	[AanwezigheidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursist](
	[CursistId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[Naam] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Voornaam] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Straat] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Straatnummer] [nvarchar](8) COLLATE Latin1_General_CI_AS NOT NULL,
	[Postcode] [int] NOT NULL,
	[Gemeente] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Geboortedatum] [datetime] NOT NULL,
	[Telefoon] [nvarchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[Abonnement] [datetime] NOT NULL,
	[NaamMama] [nvarchar](100) COLLATE Latin1_General_CI_AS NULL,
	[NaamPapa] [nvarchar](100) COLLATE Latin1_General_CI_AS NULL,
	[Leertraject_LeertrajectId] [int] NULL,
 CONSTRAINT [PK_dbo.Cursist] PRIMARY KEY CLUSTERED 
(
	[CursistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leertraject](
	[LeertrajectId] [int] IDENTITY(1,1) NOT NULL,
	[Titel] [nvarchar](max) COLLATE Latin1_General_CI_AS NOT NULL,
	[Omschrijving] [nvarchar](max) COLLATE Latin1_General_CI_AS NOT NULL,
	[Medewerker_MedewerkerId] [int] NULL,
 CONSTRAINT [PK_dbo.Leertraject] PRIMARY KEY CLUSTERED 
(
	[LeertrajectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medewerker](
	[MedewerkerId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[Naam] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[Voornaam] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_dbo.Medewerker] PRIMARY KEY CLUSTERED 
(
	[MedewerkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opleidingsdag](
	[OpleidingsdagId] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Leertraject_LeertrajectId] [int] NULL,
 CONSTRAINT [PK_dbo.Opleidingsdag] PRIMARY KEY CLUSTERED 
(
	[OpleidingsdagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TellingDag](
	[TellingDagId] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[Datum] [datetime2](7) NOT NULL,
	[Medewerker_MedewerkerId] [int] NULL,
 CONSTRAINT [PK_dbo.TellingDag] PRIMARY KEY CLUSTERED 
(
	[TellingDagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tijdvak](
	[TijdvakId] [int] IDENTITY(1,1) NOT NULL,
	[DagNaam] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[Van] [time](7) NOT NULL,
	[Tot] [time](7) NOT NULL,
	[AantalZwemmers] [int] NOT NULL,
	[AantalBanen] [int] NOT NULL,
	[TellingDag_TellingDagId] [int] NULL,
 CONSTRAINT [PK_dbo.Tijdvak] PRIMARY KEY CLUSTERED 
(
	[TijdvakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) COLLATE Latin1_General_CI_AS NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) COLLATE Latin1_General_CI_AS NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[ProviderUserId] [nvarchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[Aanwezigheid] ON 

GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (1, 0, 1, 1, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (2, 0, 2, 1, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (3, 0, 3, 1, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (4, 0, 4, 1, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (5, 0, 5, 1, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (6, 0, 1, 2, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (7, 0, 2, 2, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (8, 0, 3, 2, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (9, 0, 4, 2, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (10, 0, 5, 2, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (11, 0, 1, 3, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (12, 0, 2, 3, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (13, 0, 3, 3, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (14, 0, 4, 3, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (15, 0, 5, 3, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (16, 0, 1, 4, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (17, 0, 2, 4, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (18, 0, 3, 4, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (19, 0, 4, 4, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (20, 0, 5, 4, 1)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (21, 0, 6, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (22, 0, 7, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (23, 0, 8, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (24, 0, 9, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (25, 0, 10, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (26, 0, 11, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (27, 0, 12, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (28, 0, 13, 5, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (29, 0, 6, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (30, 0, 7, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (31, 0, 8, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (32, 0, 9, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (33, 0, 10, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (34, 0, 11, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (35, 0, 12, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (36, 0, 13, 6, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (37, 0, 6, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (38, 0, 7, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (39, 0, 8, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (40, 0, 9, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (41, 0, 10, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (42, 0, 11, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (43, 0, 12, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (44, 0, 13, 7, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (45, 0, 6, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (46, 0, 7, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (47, 0, 8, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (48, 0, 9, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (49, 0, 10, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (50, 0, 11, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (51, 0, 12, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (52, 0, 13, 8, 2)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (53, 0, 14, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (54, 0, 15, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (55, 0, 16, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (56, 0, 17, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (57, 0, 18, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (58, 0, 19, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (59, 0, 20, 9, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (60, 0, 14, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (61, 0, 15, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (62, 0, 16, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (63, 0, 17, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (64, 0, 18, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (65, 0, 19, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (66, 0, 20, 10, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (67, 0, 14, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (68, 0, 15, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (69, 0, 16, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (70, 0, 17, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (71, 0, 18, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (72, 0, 19, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (73, 0, 20, 11, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (74, 0, 14, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (75, 0, 15, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (76, 0, 16, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (77, 0, 17, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (78, 0, 18, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (79, 0, 19, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (80, 0, 20, 12, 3)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (81, 0, 21, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (82, 0, 22, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (83, 0, 23, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (84, 0, 24, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (85, 0, 25, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (86, 0, 26, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (87, 0, 27, 13, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (88, 0, 21, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (89, 0, 22, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (90, 0, 23, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (91, 0, 24, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (92, 0, 25, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (93, 0, 26, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (94, 0, 27, 14, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (95, 0, 21, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (96, 0, 22, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (97, 0, 23, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (98, 0, 24, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (99, 0, 25, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (100, 0, 26, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (101, 0, 27, 15, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (102, 0, 21, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (103, 0, 22, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (104, 0, 23, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (105, 0, 24, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (106, 0, 25, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (107, 0, 26, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (108, 0, 27, 16, 4)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (109, 0, 28, 17, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (110, 0, 29, 17, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (111, 0, 30, 17, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (112, 0, 31, 17, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (113, 0, 32, 17, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (114, 0, 28, 18, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (115, 0, 29, 18, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (116, 0, 30, 18, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (117, 0, 31, 18, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (118, 0, 32, 18, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (119, 0, 28, 19, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (120, 0, 29, 19, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (121, 0, 30, 19, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (122, 0, 31, 19, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (123, 0, 32, 19, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (124, 0, 28, 20, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (125, 0, 29, 20, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (126, 0, 30, 20, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (127, 0, 31, 20, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (128, 0, 32, 20, 5)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (129, 0, 33, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (130, 0, 34, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (131, 0, 35, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (132, 0, 36, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (133, 0, 37, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (134, 0, 38, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (135, 0, 39, 21, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (136, 0, 33, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (137, 0, 34, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (138, 0, 35, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (139, 0, 36, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (140, 0, 37, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (141, 0, 38, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (142, 0, 39, 22, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (143, 0, 33, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (144, 0, 34, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (145, 0, 35, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (146, 0, 36, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (147, 0, 37, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (148, 0, 38, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (149, 0, 39, 23, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (150, 0, 33, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (151, 0, 34, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (152, 0, 35, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (153, 0, 36, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (154, 0, 37, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (155, 0, 38, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (156, 0, 39, 24, 6)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (157, 0, 40, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (158, 0, 41, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (159, 0, 42, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (160, 0, 43, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (161, 0, 44, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (162, 0, 45, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (163, 0, 46, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (164, 0, 47, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (165, 0, 48, 25, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (166, 0, 40, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (167, 0, 41, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (168, 0, 42, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (169, 0, 43, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (170, 0, 44, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (171, 0, 45, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (172, 0, 46, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (173, 0, 47, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (174, 0, 48, 26, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (175, 0, 40, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (176, 0, 41, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (177, 0, 42, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (178, 0, 43, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (179, 0, 44, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (180, 0, 45, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (181, 0, 46, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (182, 0, 47, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (183, 0, 48, 27, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (184, 0, 40, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (185, 0, 41, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (186, 0, 42, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (187, 0, 43, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (188, 0, 44, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (189, 0, 45, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (190, 0, 46, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (191, 0, 47, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (192, 0, 48, 28, 7)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (193, 0, 49, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (194, 0, 50, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (195, 0, 51, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (196, 0, 52, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (197, 0, 53, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (198, 0, 54, 29, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (199, 0, 49, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (200, 0, 50, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (201, 0, 51, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (202, 0, 52, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (203, 0, 53, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (204, 0, 54, 30, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (205, 0, 49, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (206, 0, 50, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (207, 0, 51, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (208, 0, 52, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (209, 0, 53, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (210, 0, 54, 31, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (211, 0, 49, 32, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (212, 0, 50, 32, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (213, 0, 51, 32, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (214, 0, 52, 32, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (215, 0, 53, 32, 8)
GO
INSERT [dbo].[Aanwezigheid] ([AanwezigheidId], [Aanwezig], [Cursist_CursistId], [Dag_OpleidingsdagId], [Leertraject_LeertrajectId]) VALUES (216, 0, 54, 32, 8)
GO
SET IDENTITY_INSERT [dbo].[Aanwezigheid] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursist] ON 

GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (1, N'test@hotmail.com', N'Test', N'Bram', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 1)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (2, N'test@hotmail.com', N'Test', N'Marion', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 1)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (3, N'test@hotmail.com', N'Test', N'Hélène', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 1)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (4, N'test@hotmail.com', N'Test', N'Julie', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 1)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (5, N'test@hotmail.com', N'Test', N'Emma', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 1)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (6, N'test@hotmail.com', N'Test', N'Hendrik', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (7, N'test@hotmail.comm', N'Test', N'Elise', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (8, N'test@hotmail.com', N'Test', N'Nele', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (9, N'test@hotmail.com', N'Test', N'Jorinde', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (10, N'test@hotmail.com', N'Test', N'Kevin', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (11, N'test@hotmail.com', N'Test', N'Emelie', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (12, N'test@hotmail.com', N'Test', N'Liesje', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (13, N'test@hotmail.com', N'Test', N'Silke', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 2)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (14, N'test@hotmail.com', N'Test', N'Hans', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (15, N'test@hotmail.com', N'Test', N'Wendy', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (16, N'test@hotmail.com', N'Test', N'Thierry', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (17, N'test@hotmail.com', N'Test', N'Xerxes', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (18, N'test@hotmail.com', N'Test', N'Joran', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (19, N'test@hotmail.com', N'Test', N'Quentin', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (20, N'test@hotmail.com', N'Bauwens', N'Chloë', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 3)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (21, N'test@hotmail.com', N'Test', N'Jouri', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (22, N'test@hotmail.com', N'Test', N'Amell', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (23, N'test@hotmail.com', N'Gabriels', N'Kaat', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (24, N'test@hotmail.com', N'Desloovere', N'Dora', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (25, N'test@hotmail.com', N'Test', N'Esta', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (26, N'test@hotmail.com', N'Test', N'Landrik', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (27, N'test@hotmail.com', N'Tet', N'Jannis', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 4)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (28, N'test@hotmail.com', N'Test', N'Ilian', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 5)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (29, N'test@hotmail.com', N'Test', N'Greet', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 5)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (30, N'test@hotmail.com', N'Test', N'Ines', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 5)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (31, N'test@hotmail.com', N'Test', N'Aaron', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 5)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (32, N'test@hotmail.com', N'Test', N'Ethan', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 5)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (33, N'test@hotmail.com', N'Rommelare', N'Tristan', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (34, N'test@hotmail.com', N'Vaillant', N'Noémie', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (35, N'test@hotmail.com', N'Test', N'Ilias', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (36, N'test@hotmail.com', N'Gabriels', N'Ruben', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (37, N'test@hotmail.com', N'Test', N'Tobias', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (38, N'test@hotmail.com', N'Test', N'Tim', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (39, N'test@hotmail.com', N'Test', N'Vin', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 6)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (40, N'test@hotmail.com', N'Test', N'Liam', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (41, N'test@hotmail.com', N'Desloovere', N'Octaaf', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (42, N'test@hotmail.com', N'Test', N'Sibe', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (43, N'test@hotmail.com', N'Test', N'Caius', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (44, N'test@hotmail.com', N'Test', N'Jannes', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (45, N'test@hotmail.com', N'Test', N'Briek', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (46, N'test@hotmail.com', N'Test', N'Nina', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (47, N'test@hotmail.com', N'Vaillant', N'Thomas', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (48, N'test@hotmail.com', N'Test', N'Renaud', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'Tania Dexters', N'Elton John', 7)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (49, N'test@hotmail.com', N'Mattelin', N'Marie-Aline', N'Gustave Royerslaan', N'73', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.26.73', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (50, N'test@hotmail.com', N'De Wilde', N'Laurent', N'Wijnstraat', N'12', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (51, N'test@hotmail.com', N'Cotton', N'Sophie', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (52, N'test@hotmail.com', N'Dejaegher', N'Stéphanie', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (53, N'test@hotmail.com', N'De Bleeker', N'Muriel', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
INSERT [dbo].[Cursist] ([CursistId], [Email], [Naam], [Voornaam], [Straat], [Straatnummer], [Postcode], [Gemeente], [Geboortedatum], [Telefoon], [Abonnement], [NaamMama], [NaamPapa], [Leertraject_LeertrajectId]) VALUES (54, N'test@hotmail.com', N'Viville', N'Lynn', N'Teststraat', N'123A', 9600, N'Ronse', CAST(0x000080EB00000000 AS DateTime), N'055/21.22.23', CAST(0x0000A41200000000 AS DateTime), N'', N'', 8)
GO
SET IDENTITY_INSERT [dbo].[Cursist] OFF
GO
SET IDENTITY_INSERT [dbo].[Leertraject] ON 

GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (1, N'Precompetitie', N'Zwemschool grijs', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (2, N'Competitie', N'Wedstrijdzwemmers', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (3, N'Masters', N'Masterzwemmers', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (4, N'Zwemschool Zwart 1', N'Zwemschool zwart 1', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (5, N'Zwemschool Zwart 2', N'Zwemschool zwart 2', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (6, N'Zwemschool Rood', N'Rode badmuts', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (7, N'Zwemschool Blauw', N'Blauwe badmuts', 1)
GO
INSERT [dbo].[Leertraject] ([LeertrajectId], [Titel], [Omschrijving], [Medewerker_MedewerkerId]) VALUES (8, N'Trainers', N'Onze trainers', 1)
GO
SET IDENTITY_INSERT [dbo].[Leertraject] OFF
GO
SET IDENTITY_INSERT [dbo].[Medewerker] ON 

GO
INSERT [dbo].[Medewerker] ([MedewerkerId], [Email], [Naam], [Voornaam]) VALUES (1, N'laurent.de.wilde@gmail.com', N'De Wilde', N'Laurent')
GO
SET IDENTITY_INSERT [dbo].[Medewerker] OFF
GO
SET IDENTITY_INSERT [dbo].[Opleidingsdag] ON 

GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (1, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 1)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (2, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 1)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (3, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 1)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (4, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 1)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (5, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 2)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (6, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 2)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (7, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 2)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (8, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 2)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (9, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 3)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (10, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 3)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (11, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 3)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (12, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 3)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (13, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 4)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (14, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 4)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (15, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 4)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (16, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 4)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (17, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 5)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (18, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 5)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (19, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 5)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (20, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 5)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (21, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 6)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (22, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 6)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (23, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 6)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (24, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 6)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (25, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 7)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (26, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 7)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (27, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 7)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (28, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 7)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (29, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 8)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (30, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 8)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (31, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 8)
GO
INSERT [dbo].[Opleidingsdag] ([OpleidingsdagId], [Naam], [Date], [Leertraject_LeertrajectId]) VALUES (32, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 8)
GO
SET IDENTITY_INSERT [dbo].[Opleidingsdag] OFF
GO
SET IDENTITY_INSERT [dbo].[TellingDag] ON 

GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (1, N'Dinsdag', CAST(0x07000000000097370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (2, N'Woensdag', CAST(0x07000000000098370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (3, N'Vrijdag', CAST(0x0700000000009A370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (4, N'Zaterdag', CAST(0x0700000000009B370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (5, N'Dinsdag', CAST(0x0700000000009E370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (6, N'Woensdag', CAST(0x0700000000009F370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (7, N'Vrijdag', CAST(0x070000000000A1370B AS DateTime2), 1)
GO
INSERT [dbo].[TellingDag] ([TellingDagId], [Naam], [Datum], [Medewerker_MedewerkerId]) VALUES (8, N'Zaterdag', CAST(0x070000000000A2370B AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[TellingDag] OFF
GO
SET IDENTITY_INSERT [dbo].[Tijdvak] ON 

GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (1, N'Dinsdag', CAST(0x07002058A3A70000 AS Time), CAST(0x0700BCFE35B40000 AS Time), 18, 6, 1)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (2, NULL, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 0, 1)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (3, NULL, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 0, 1)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (4, N'Woensdag', CAST(0x07002058A3A70000 AS Time), CAST(0x0700881C05B00000 AS Time), 3, 0, 2)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (5, N'Zaterdag', CAST(0x070048F9F66C0000 AS Time), CAST(0x0700B0BD58750000 AS Time), 5, 0, 3)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (6, NULL, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 0, 3)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (7, NULL, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 0, 4)
GO
INSERT [dbo].[Tijdvak] ([TijdvakId], [DagNaam], [Van], [Tot], [AantalZwemmers], [AantalBanen], [TellingDag_TellingDagId]) VALUES (8, NULL, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 0, 4)
GO
SET IDENTITY_INSERT [dbo].[Tijdvak] OFF
GO
CREATE NONCLUSTERED INDEX [IX_Cursist_CursistId] ON [dbo].[Aanwezigheid]
(
	[Cursist_CursistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Dag_OpleidingsdagId] ON [dbo].[Aanwezigheid]
(
	[Dag_OpleidingsdagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Leertraject_LeertrajectId] ON [dbo].[Aanwezigheid]
(
	[Leertraject_LeertrajectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Leertraject_LeertrajectId] ON [dbo].[Cursist]
(
	[Leertraject_LeertrajectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Medewerker_MedewerkerId] ON [dbo].[Leertraject]
(
	[Medewerker_MedewerkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Leertraject_LeertrajectId] ON [dbo].[Opleidingsdag]
(
	[Leertraject_LeertrajectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Medewerker_MedewerkerId] ON [dbo].[TellingDag]
(
	[Medewerker_MedewerkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_TellingDag_TellingDagId] ON [dbo].[Tijdvak]
(
	[TellingDag_TellingDagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Aanwezigheid]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Cursist_Cursist_CursistId] FOREIGN KEY([Cursist_CursistId])
REFERENCES [dbo].[Cursist] ([CursistId])
GO
ALTER TABLE [dbo].[Aanwezigheid] CHECK CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Cursist_Cursist_CursistId]
GO
ALTER TABLE [dbo].[Aanwezigheid]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Leertraject_Leertraject_LeertrajectId] FOREIGN KEY([Leertraject_LeertrajectId])
REFERENCES [dbo].[Leertraject] ([LeertrajectId])
GO
ALTER TABLE [dbo].[Aanwezigheid] CHECK CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Leertraject_Leertraject_LeertrajectId]
GO
ALTER TABLE [dbo].[Aanwezigheid]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Opleidingsdag_Dag_OpleidingsdagId] FOREIGN KEY([Dag_OpleidingsdagId])
REFERENCES [dbo].[Opleidingsdag] ([OpleidingsdagId])
GO
ALTER TABLE [dbo].[Aanwezigheid] CHECK CONSTRAINT [FK_dbo.Aanwezigheid_dbo.Opleidingsdag_Dag_OpleidingsdagId]
GO
ALTER TABLE [dbo].[Cursist]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cursist_dbo.Leertraject_Leertraject_LeertrajectId] FOREIGN KEY([Leertraject_LeertrajectId])
REFERENCES [dbo].[Leertraject] ([LeertrajectId])
GO
ALTER TABLE [dbo].[Cursist] CHECK CONSTRAINT [FK_dbo.Cursist_dbo.Leertraject_Leertraject_LeertrajectId]
GO
ALTER TABLE [dbo].[Leertraject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Leertraject_dbo.Medewerker_Medewerker_MedewerkerId] FOREIGN KEY([Medewerker_MedewerkerId])
REFERENCES [dbo].[Medewerker] ([MedewerkerId])
GO
ALTER TABLE [dbo].[Leertraject] CHECK CONSTRAINT [FK_dbo.Leertraject_dbo.Medewerker_Medewerker_MedewerkerId]
GO
ALTER TABLE [dbo].[Opleidingsdag]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Opleidingsdag_dbo.Leertraject_Leertraject_LeertrajectId] FOREIGN KEY([Leertraject_LeertrajectId])
REFERENCES [dbo].[Leertraject] ([LeertrajectId])
GO
ALTER TABLE [dbo].[Opleidingsdag] CHECK CONSTRAINT [FK_dbo.Opleidingsdag_dbo.Leertraject_Leertraject_LeertrajectId]
GO
ALTER TABLE [dbo].[TellingDag]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TellingDag_dbo.Medewerker_Medewerker_MedewerkerId] FOREIGN KEY([Medewerker_MedewerkerId])
REFERENCES [dbo].[Medewerker] ([MedewerkerId])
GO
ALTER TABLE [dbo].[TellingDag] CHECK CONSTRAINT [FK_dbo.TellingDag_dbo.Medewerker_Medewerker_MedewerkerId]
GO
ALTER TABLE [dbo].[Tijdvak]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tijdvak_dbo.TellingDag_TellingDag_TellingDagId] FOREIGN KEY([TellingDag_TellingDagId])
REFERENCES [dbo].[TellingDag] ([TellingDagId])
GO
ALTER TABLE [dbo].[Tijdvak] CHECK CONSTRAINT [FK_dbo.Tijdvak_dbo.TellingDag_TellingDag_TellingDagId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Medewerker] ([MedewerkerId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
