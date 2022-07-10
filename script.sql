USE [master]
GO
/****** Object:  Database [app3]    Script Date: 10/07/2022 12:37:18 p. m. ******/
CREATE DATABASE [app3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'app3', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\app3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'app3_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\app3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [app3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [app3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [app3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [app3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [app3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [app3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [app3] SET ARITHABORT OFF 
GO
ALTER DATABASE [app3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [app3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [app3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [app3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [app3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [app3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [app3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [app3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [app3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [app3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [app3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [app3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [app3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [app3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [app3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [app3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [app3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [app3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [app3] SET  MULTI_USER 
GO
ALTER DATABASE [app3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [app3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [app3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [app3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [app3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [app3] SET QUERY_STORE = OFF
GO
USE [app3]
GO
/****** Object:  User [user1]    Script Date: 10/07/2022 12:37:19 p. m. ******/
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user1]
GO
/****** Object:  Table [dbo].[cat_Menu]    Script Date: 10/07/2022 12:37:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cat_Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu] [nvarchar](50) NULL,
 CONSTRAINT [PK_cat_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cat_Rol]    Script Date: 10/07/2022 12:37:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cat_Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [nvarchar](50) NULL,
 CONSTRAINT [PK_cat_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 10/07/2022 12:37:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NOT NULL,
	[idMenu] [int] NOT NULL,
 CONSTRAINT [PK_RolMenu] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saludo]    Script Date: 10/07/2022 12:37:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saludo](
	[Saludo] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/07/2022 12:37:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[NoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[Rol] [int] NULL,
	[fNacimiento] [date] NULL,
	[Contrasena] [nvarchar](50) NULL,
	[Activo] [smallint] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[NoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [app3] SET  READ_WRITE 
GO
