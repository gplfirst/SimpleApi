USE [master]
GO
/****** Object:  Database [DP_Main]    Script Date: 11.02.2020 5:37:05 ******/
CREATE DATABASE [DP_Main]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DP_Main', FILENAME = N'C:\Device2017\DP_Main.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DP_Main_log', FILENAME = N'C:\Device2017\DP_Main_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DP_Main] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DP_Main].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DP_Main] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DP_Main] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DP_Main] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DP_Main] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DP_Main] SET ARITHABORT OFF 
GO
ALTER DATABASE [DP_Main] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DP_Main] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DP_Main] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DP_Main] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DP_Main] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DP_Main] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DP_Main] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DP_Main] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DP_Main] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DP_Main] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DP_Main] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DP_Main] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DP_Main] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DP_Main] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DP_Main] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DP_Main] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DP_Main] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DP_Main] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DP_Main] SET  MULTI_USER 
GO
ALTER DATABASE [DP_Main] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DP_Main] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DP_Main] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DP_Main] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DP_Main] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DP_Main', N'ON'
GO
ALTER DATABASE [DP_Main] SET QUERY_STORE = OFF
GO
USE [DP_Main]
GO
/****** Object:  Table [dbo].[dt_Base]    Script Date: 11.02.2020 5:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_Base](
	[Object_UID] [nvarchar](32) NOT NULL,
	[Object_UID_Oper] [nvarchar](32) NULL,
	[dt_Geo_Object_GeoUID] [nvarchar](32) NULL,
	[FK_ref_MediaType_ID] [smallint] NULL,
	[FK_ref_MediaNetwork_ID] [int] NULL,
	[FK_ref_Partner_ID] [int] NULL,
	[FK_ref_UrFace_ID] [int] NULL,
	[FK_ref_License_ID] [int] NULL,
	[Legacy_ID] [nvarchar](50) NULL,
	[Common_ID] [nvarchar](50) NULL,
	[ObjectName] [nvarchar](150) NULL,
	[Reference] [nvarchar](4000) NULL,
	[URL_Photo] [nvarchar](2000) NULL,
	[URL_Schema] [nvarchar](2000) NULL,
	[URL_Presentation] [nvarchar](2000) NULL,
	[Autor_ID] [int] NULL,
	[EntryDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DateDelete] [date] NULL,
 CONSTRAINT [PK_dt_Basic] PRIMARY KEY CLUSTERED 
(
	[Object_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dt_Tech]    Script Date: 11.02.2020 5:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_Tech](
	[dt_Base_Object_UID] [nvarchar](32) NOT NULL,
	[Version] [smallint] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Autor_ID] [int] NULL,
	[FK_ref_Exposition_Type_ID] [int] NULL,
	[FK_ref_SideType_ID] [int] NULL,
	[FK_ref_Side_ID] [int] NULL,
	[FK_ref_Size_ID] [int] NULL,
	[FK_ref_ConstrType_ID] [smallint] NULL,
	[FK_v_ref_InstallationTypeID] [int] NULL,
	[FK_v_ref_PlacementTypeID] [int] NULL,
	[Width] [numeric](10, 3) NULL,
	[Height] [numeric](10, 3) NULL,
	[Requirements] [nvarchar](2000) NULL,
	[Image] [nvarchar](2000) NULL,
	[Materials] [nvarchar](2000) NULL,
	[Light] [tinyint] NULL,
	[Param01] [float] NULL,
	[Param02] [float] NULL,
	[Param03] [float] NULL,
	[Param04] [float] NULL,
 CONSTRAINT [PK_dt_Tech] PRIMARY KEY CLUSTERED 
(
	[dt_Base_Object_UID] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_MediaType]    Script Date: 11.02.2020 5:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_MediaType](
	[MediaType_ID] [smallint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FK_ref_MediaGroup_ID] [smallint] NOT NULL,
	[MediaType] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [ref_Media_PK] PRIMARY KEY CLUSTERED 
(
	[MediaType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_Partners]    Script Date: 11.02.2020 5:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_Partners](
	[Partner_ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ref_Partner_ID] [int] NULL,
	[PartnerName] [nvarchar](250) NOT NULL,
	[PartnerNameFull] [nvarchar](500) NOT NULL,
	[Synonyms] [nvarchar](250) NULL,
	[Status_ID] [int] NOT NULL,
	[IsClient] [bit] NOT NULL,
	[IsSupplier] [bit] NOT NULL,
	[IsOpex] [bit] NOT NULL,
	[IsCompetitor] [bit] NOT NULL,
	[IsCarrier] [bit] NOT NULL,
	[MainEmployer_ID] [int] NOT NULL,
	[WithoutContractSupplier] [bit] NOT NULL,
	[WithoutContractClient] [bit] NOT NULL,
	[Category_Clnt_ID] [int] NULL,
	[Category_Supp_ID] [int] NULL,
	[IsPrivatePerson] [bit] NOT NULL,
	[PP_Sex] [nvarchar](1) NULL,
	[PP_Birthday] [date] NULL,
	[Keywords] [nvarchar](500) NULL,
	[Category_Clnt_Comment] [nvarchar](500) NULL,
	[Category_Supp_Comment] [nvarchar](500) NULL,
	[Comments] [nvarchar](max) NULL,
	[Conditions] [nvarchar](max) NULL,
	[EntryDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ref_Partners] PRIMARY KEY CLUSTERED 
(
	[Partner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stm_api_Clients]    Script Date: 11.02.2020 5:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stm_api_Clients](
	[Client_ID] [int] NOT NULL,
	[ClientName] [nvarchar](150) NOT NULL,
	[API_KEY] [nvarchar](250) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[ExpirationDate] [date] NULL,
 CONSTRAINT [PK_ext_api_Clients] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'07431D8622B0468D944D18B3843FB8FF', N'4', N'4', 5, 4, 4, 4, 4, N'4', N'4', N'Object_4', N'Object_4', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:04:58.863' AS DateTime), CAST(N'2020-02-08T12:04:58.863' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'1BC0D44566FA4A29B639D1B78D34CBCA', N'5', N'5', 6, 5, 5, 5, 5, N'5', N'5', N'Object_5', N'Object_5', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:05:23.953' AS DateTime), CAST(N'2020-02-08T12:05:23.953' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'263ED4E598B04EBF823E89FECC20D1A6', N'1', N'1', 1, 1, 1, 1, 1, N'1', N'1', N'Object_1', N'Object_1', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:01:31.583' AS DateTime), CAST(N'2020-02-08T12:01:31.583' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'31D58538DE7448A08E89578A476D1F5D', N'3', N'3', 4, 3, 3, 3, 3, N'3', N'3', N'Object_3', N'Object_3', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:04:38.900' AS DateTime), CAST(N'2020-02-08T12:04:38.900' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'8C3BC42B8A424AD592703A8D5774A0DC', N'7', N'7', 8, 7, 7, 7, 7, N'7', N'7', N'Object_7', N'Object_7', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:05:57.690' AS DateTime), CAST(N'2020-02-08T12:05:57.690' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'949576F97A33402E838C9337321E1D9E', N'9', N'9', 5, 9, 9, 9, 9, N'9', N'9', N'Object_9', N'Object_9', NULL, NULL, NULL, NULL, CAST(N'2020-02-10T23:09:31.990' AS DateTime), CAST(N'2020-02-10T23:09:31.990' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'AEBD3E91A3B744B5BEE9315FA617196D', N'6', N'6', 7, 6, 6, 6, 6, N'6', N'6', N'Object_6', N'Object_6', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:05:41.863' AS DateTime), CAST(N'2020-02-08T12:05:41.863' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'EBE596B78A0D4D8E8F6A5499C9B8DC1A', N'8', N'8', 7, 8, 8, 8, 8, N'8', N'8', N'Object_8', N'Object_8', NULL, NULL, NULL, NULL, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Base] ([Object_UID], [Object_UID_Oper], [dt_Geo_Object_GeoUID], [FK_ref_MediaType_ID], [FK_ref_MediaNetwork_ID], [FK_ref_Partner_ID], [FK_ref_UrFace_ID], [FK_ref_License_ID], [Legacy_ID], [Common_ID], [ObjectName], [Reference], [URL_Photo], [URL_Schema], [URL_Presentation], [Autor_ID], [EntryDate], [LastUpdate], [Deleted], [DateDelete]) VALUES (N'F765754C9F174EBB8E60B781452AD067', N'2', N'2', 3, 2, 2, 2, 2, N'2', N'2', N'Object_2', N'Object_2', NULL, NULL, NULL, NULL, CAST(N'2020-02-08T12:02:43.027' AS DateTime), CAST(N'2020-02-08T12:02:43.027' AS DateTime), 0, NULL)
INSERT [dbo].[dt_Tech] ([dt_Base_Object_UID], [Version], [EntryDate], [Autor_ID], [FK_ref_Exposition_Type_ID], [FK_ref_SideType_ID], [FK_ref_Side_ID], [FK_ref_Size_ID], [FK_ref_ConstrType_ID], [FK_v_ref_InstallationTypeID], [FK_v_ref_PlacementTypeID], [Width], [Height], [Requirements], [Image], [Materials], [Light], [Param01], [Param02], [Param03], [Param04]) VALUES (N'07431D8622B0468D944D18B3843FB8FF', 1, CAST(N'2020-02-11T00:20:15.203' AS DateTime), 1, 1, 1, 1, 1, 1, 1, 1, CAST(1.000 AS Numeric(10, 3)), CAST(1.000 AS Numeric(10, 3)), N'1', N'1', N'1', 1, 1, 1, 1, 1)
INSERT [dbo].[dt_Tech] ([dt_Base_Object_UID], [Version], [EntryDate], [Autor_ID], [FK_ref_Exposition_Type_ID], [FK_ref_SideType_ID], [FK_ref_Side_ID], [FK_ref_Size_ID], [FK_ref_ConstrType_ID], [FK_v_ref_InstallationTypeID], [FK_v_ref_PlacementTypeID], [Width], [Height], [Requirements], [Image], [Materials], [Light], [Param01], [Param02], [Param03], [Param04]) VALUES (N'1BC0D44566FA4A29B639D1B78D34CBCA', 2, CAST(N'2020-02-11T00:20:31.177' AS DateTime), 2, 2, 2, 2, 2, 2, 2, 2, CAST(2.000 AS Numeric(10, 3)), CAST(2.000 AS Numeric(10, 3)), N'2', N'2', NULL, 2, 2, 2, 2, 2)
INSERT [dbo].[dt_Tech] ([dt_Base_Object_UID], [Version], [EntryDate], [Autor_ID], [FK_ref_Exposition_Type_ID], [FK_ref_SideType_ID], [FK_ref_Side_ID], [FK_ref_Size_ID], [FK_ref_ConstrType_ID], [FK_v_ref_InstallationTypeID], [FK_v_ref_PlacementTypeID], [Width], [Height], [Requirements], [Image], [Materials], [Light], [Param01], [Param02], [Param03], [Param04]) VALUES (N'263ED4E598B04EBF823E89FECC20D1A6', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 3, 3, 3, 3, 3, 3, 3, 3, CAST(3.000 AS Numeric(10, 3)), CAST(3.000 AS Numeric(10, 3)), N'3', N'3', N'3', 3, 3, 3, 3, 3)
INSERT [dbo].[dt_Tech] ([dt_Base_Object_UID], [Version], [EntryDate], [Autor_ID], [FK_ref_Exposition_Type_ID], [FK_ref_SideType_ID], [FK_ref_Side_ID], [FK_ref_Size_ID], [FK_ref_ConstrType_ID], [FK_v_ref_InstallationTypeID], [FK_v_ref_PlacementTypeID], [Width], [Height], [Requirements], [Image], [Materials], [Light], [Param01], [Param02], [Param03], [Param04]) VALUES (N'31D58538DE7448A08E89578A476D1F5D', 4, CAST(N'2020-02-11T00:21:22.520' AS DateTime), 4, 4, 4, 4, 4, 4, 4, NULL, CAST(4.000 AS Numeric(10, 3)), CAST(4.000 AS Numeric(10, 3)), N'4', N'4', N'4', 4, 4, 4, NULL, 4)
INSERT [dbo].[dt_Tech] ([dt_Base_Object_UID], [Version], [EntryDate], [Autor_ID], [FK_ref_Exposition_Type_ID], [FK_ref_SideType_ID], [FK_ref_Side_ID], [FK_ref_Size_ID], [FK_ref_ConstrType_ID], [FK_v_ref_InstallationTypeID], [FK_v_ref_PlacementTypeID], [Width], [Height], [Requirements], [Image], [Materials], [Light], [Param01], [Param02], [Param03], [Param04]) VALUES (N'8C3BC42B8A424AD592703A8D5774A0DC', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 5, 5, 5, 5, 5, 5, 5, 5, CAST(5.000 AS Numeric(10, 3)), CAST(5.000 AS Numeric(10, 3)), N'5', N'5', N'5', 5, 5, 5, 5, 5)
SET IDENTITY_INSERT [dbo].[ref_MediaType] ON 

INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (1, 1, N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (3, 2, N'2', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (4, 3, N'3', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (5, 4, N'4', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (6, 5, N'5', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (7, 6, N'6', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ref_MediaType] ([MediaType_ID], [FK_ref_MediaGroup_ID], [MediaType], [LastUpdated], [Deleted]) VALUES (8, 7, N'7', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ref_MediaType] OFF
SET IDENTITY_INSERT [dbo].[ref_Partners] ON 

INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (1, 1, N'Partner_1', N'Partner_1_Full', N'P_1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (2, 2, N'Partner_2', N'Partner_1_Full', N'P_2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (3, 3, N'Partner_3', N'Partner_3_Full', N'P_3', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (4, 4, N'Partner_4', N'Partner_4_Full', N'P_4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (5, 5, N'Partner_5', N'Partner_5_Full', N'P_5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (6, 6, N'Partner_6', N'Partner_5_Full', N'P_6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2000-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (7, 7, N'Partner_7', N'Partner_7_Full', N'P_7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-10T13:17:16.480' AS DateTime), CAST(N'2020-02-10T13:17:16.480' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (10, 8, N'Partner_8', N'Partner_8_Full', N'P_8', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-10T13:18:04.087' AS DateTime), CAST(N'2020-02-10T13:18:04.087' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (11, 9, N'Partner_9', N'Partner_9_Full', N'P_9', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-10T13:18:27.467' AS DateTime), CAST(N'2020-02-10T13:18:27.467' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (12, 10, N'Partner_10', N'Partner_10_Full', N'P_10', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-10T13:19:10.480' AS DateTime), CAST(N'2020-02-10T13:19:10.480' AS DateTime), 0)
INSERT [dbo].[ref_Partners] ([Partner_ID], [FK_ref_Partner_ID], [PartnerName], [PartnerNameFull], [Synonyms], [Status_ID], [IsClient], [IsSupplier], [IsOpex], [IsCompetitor], [IsCarrier], [MainEmployer_ID], [WithoutContractSupplier], [WithoutContractClient], [Category_Clnt_ID], [Category_Supp_ID], [IsPrivatePerson], [PP_Sex], [PP_Birthday], [Keywords], [Category_Clnt_Comment], [Category_Supp_Comment], [Comments], [Conditions], [EntryDate], [LastUpdate], [Deleted]) VALUES (13, 11, N'Partner_11', N'Partner_11_Full', N'P_11', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-10T13:19:32.507' AS DateTime), CAST(N'2020-02-10T13:19:32.507' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[ref_Partners] OFF
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (1, N'Client_1', N'1111111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (2, N'Client_2', N'2222222', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (3, N'Client_3', N'3333333', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (4, N'Client_4', N'4444444', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (5, N'Client_5', N'5555555', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (6, N'Client_6', N'6666666', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
INSERT [dbo].[stm_api_Clients] ([Client_ID], [ClientName], [API_KEY], [EntryDate], [ExpirationDate]) VALUES (7, N'Client_7', N'7777777', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2030-01-01' AS Date))
ALTER TABLE [dbo].[dt_Base] ADD  CONSTRAINT [DF_dt_Base_Object_UID]  DEFAULT (N'=replace(newid(),''-'','')''') FOR [Object_UID]
GO
ALTER TABLE [dbo].[dt_Base] ADD  CONSTRAINT [DF_dt_Basic_Actuate_Date]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[dt_Base] ADD  CONSTRAINT [DF_dt_Base_LastUpdateDate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[dt_Base] ADD  CONSTRAINT [DF_dt_Basic_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[dt_Tech] ADD  CONSTRAINT [DF_dt_Tech_Version]  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[dt_Tech] ADD  CONSTRAINT [DF_dt_Tech_Date_Actuate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[ref_Partners] ADD  CONSTRAINT [DF_ref_Partners_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[ref_Partners] ADD  CONSTRAINT [DF_krn_Partners_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[ref_Partners] ADD  CONSTRAINT [DF_ref_Partners_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[stm_api_Clients] ADD  CONSTRAINT [DF_ext_api_Clients_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[dt_Base]  WITH CHECK ADD  CONSTRAINT [FK_dt_Base_FK_MediaType] FOREIGN KEY([FK_ref_MediaType_ID])
REFERENCES [dbo].[ref_MediaType] ([MediaType_ID])
GO
ALTER TABLE [dbo].[dt_Base] CHECK CONSTRAINT [FK_dt_Base_FK_MediaType]
GO
ALTER TABLE [dbo].[dt_Tech]  WITH CHECK ADD  CONSTRAINT [FK_dt_Tech_dt_Base] FOREIGN KEY([dt_Base_Object_UID])
REFERENCES [dbo].[dt_Base] ([Object_UID])
GO
ALTER TABLE [dbo].[dt_Tech] CHECK CONSTRAINT [FK_dt_Tech_dt_Base]
GO
USE [master]
GO
ALTER DATABASE [DP_Main] SET  READ_WRITE 
GO
