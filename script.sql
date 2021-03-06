USE [master]
GO
/****** Object:  Database [ExampleDB]    Script Date: 22/07/2018 22:41:53 ******/
CREATE DATABASE [ExampleDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExampleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ExampleDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExampleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ExampleDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExampleDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExampleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExampleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExampleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExampleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExampleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExampleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExampleDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExampleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExampleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExampleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExampleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExampleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExampleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExampleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExampleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExampleDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExampleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExampleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExampleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExampleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExampleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExampleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExampleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExampleDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExampleDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExampleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExampleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExampleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExampleDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExampleDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExampleDB] SET QUERY_STORE = OFF
GO
USE [ExampleDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [ExampleDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/07/2018 22:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Birthday] [date] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Name], [Birthday]) VALUES (N'User1', CAST(N'1983-01-14' AS Date))
INSERT [dbo].[User] ([Name], [Birthday]) VALUES (N'User2', CAST(N'1985-05-31' AS Date))
INSERT [dbo].[User] ([Name], [Birthday]) VALUES (N'User3', CAST(N'1995-02-05' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [ExampleDB] SET  READ_WRITE 
GO
