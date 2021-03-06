USE [master]
GO
/****** Object:  Database [AUTA67]    Script Date: 8/24/2017 3:03:46 AM ******/
CREATE DATABASE [AUTA67]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AUTA67', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AUTA67.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AUTA67_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AUTA67_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AUTA67] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AUTA67].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AUTA67] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AUTA67] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AUTA67] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AUTA67] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AUTA67] SET ARITHABORT OFF 
GO
ALTER DATABASE [AUTA67] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AUTA67] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AUTA67] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AUTA67] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AUTA67] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AUTA67] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AUTA67] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AUTA67] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AUTA67] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AUTA67] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AUTA67] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AUTA67] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AUTA67] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AUTA67] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AUTA67] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AUTA67] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AUTA67] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AUTA67] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AUTA67] SET RECOVERY FULL 
GO
ALTER DATABASE [AUTA67] SET  MULTI_USER 
GO
ALTER DATABASE [AUTA67] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AUTA67] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AUTA67] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AUTA67] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AUTA67', N'ON'
GO
USE [AUTA67]
GO
/****** Object:  Table [dbo].[AUTKYSNB]    Script Date: 8/24/2017 3:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUTKYSNB](
	[KYSNB_SEDT] [char](8) NOT NULL,
	[KYSNB_SHMS] [char](6) NOT NULL,
	[KYSNB_DEPO] [char](2) NOT NULL,
	[KYSNB_MKCD] [char](2) NOT NULL,
	[KYSNB_SSCD] [char](1) NOT NULL,
	[KYSNB_SEQ] [numeric](4, 0) NOT NULL,
	[KYSNB_MKKG] [char](1) NOT NULL,
	[KYSNB_FORM] [char](10) NOT NULL,
	[KYSNB_BHNO] [char](26) NOT NULL,
	[KYSNB_SYMD] [char](8) NOT NULL,
	[KYSNB_CHNO] [char](15) NOT NULL,
	[KYSNB_SZSU] [numeric](6, 0) NOT NULL,
	[KYSNB_BHME] [char](30) NOT NULL,
	[KYSNB_SYCD] [char](1) NOT NULL,
	[KYSNB_YOBI] [char](20) NOT NULL,
	[KYSNB_YOBI2] [char](40) NOT NULL,
	[KYSNB_TKN] [char](20) NULL,
	[KYSNB_MD] [char](40) NULL,
 CONSTRAINT [PK_KYSNB] PRIMARY KEY CLUSTERED 
(
	[KYSNB_SEDT] ASC,
	[KYSNB_SHMS] ASC,
	[KYSNB_DEPO] ASC,
	[KYSNB_MKCD] ASC,
	[KYSNB_SSCD] ASC,
	[KYSNB_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20110824', N'1     ', N'1 ', N'1 ', N'1', CAST(2 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20120823', N'1     ', N'1 ', N'1 ', N'1', CAST(1 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20130824', N'1     ', N'2 ', N'1 ', N'1', CAST(1 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20140824', N'1     ', N'2 ', N'1 ', N'1', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20150824', N'1     ', N'2 ', N'2 ', N'1', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20150824', N'2     ', N'2 ', N'1 ', N'1', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20160824', N'1     ', N'2 ', N'2 ', N'1', CAST(4 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20160824', N'2     ', N'2 ', N'1 ', N'1', CAST(2 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20160824', N'2     ', N'2 ', N'2 ', N'2', CAST(1 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20160824', N'2     ', N'3 ', N'3 ', N'3', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20170824', N'1     ', N'2 ', N'2 ', N'4', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20170824', N'1     ', N'5 ', N'2 ', N'1', CAST(2 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20170824', N'3     ', N'2 ', N'1 ', N'1', CAST(3 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20170824', N'5     ', N'2 ', N'1 ', N'1', CAST(1 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
INSERT [dbo].[AUTKYSNB] ([KYSNB_SEDT], [KYSNB_SHMS], [KYSNB_DEPO], [KYSNB_MKCD], [KYSNB_SSCD], [KYSNB_SEQ], [KYSNB_MKKG], [KYSNB_FORM], [KYSNB_BHNO], [KYSNB_SYMD], [KYSNB_CHNO], [KYSNB_SZSU], [KYSNB_BHME], [KYSNB_SYCD], [KYSNB_YOBI], [KYSNB_YOBI2], [KYSNB_TKN], [KYSNB_MD]) VALUES (N'20180824', N'1     ', N'3 ', N'2 ', N'1', CAST(1 AS Numeric(4, 0)), N'1', N'1         ', N'1                         ', N'20170823', N'1              ', CAST(1 AS Numeric(6, 0)), N'1                             ', N'1', N'1                   ', N'1                                       ', N'1                   ', N'1                                       ')
USE [master]
GO
ALTER DATABASE [AUTA67] SET  READ_WRITE 
GO
