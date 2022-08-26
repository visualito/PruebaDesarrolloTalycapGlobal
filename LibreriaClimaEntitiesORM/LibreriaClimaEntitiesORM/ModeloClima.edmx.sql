USE [master]
GO
/****** Object:  Database [InfoClima]    Script Date: 8/25/2022 8:32:48 PM ******/
CREATE DATABASE [InfoClima]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfoClima', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoClima.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InfoClima_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoClima_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InfoClima] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfoClima].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfoClima] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfoClima] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfoClima] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfoClima] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfoClima] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfoClima] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InfoClima] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfoClima] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfoClima] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfoClima] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfoClima] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfoClima] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfoClima] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfoClima] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfoClima] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InfoClima] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfoClima] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfoClima] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfoClima] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfoClima] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfoClima] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InfoClima] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfoClima] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InfoClima] SET  MULTI_USER 
GO
ALTER DATABASE [InfoClima] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfoClima] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfoClima] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfoClima] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InfoClima] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InfoClima] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InfoClima] SET QUERY_STORE = OFF
GO
USE [InfoClima]
GO
/****** Object:  User [usuarioclima]    Script Date: 8/25/2022 8:32:49 PM ******/
CREATE USER [usuarioclima] FOR LOGIN [usuarioclima] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [userclima]    Script Date: 8/25/2022 8:32:49 PM ******/
CREATE USER [userclima] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuarioclima]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [usuarioclima]
GO
ALTER ROLE [db_datareader] ADD MEMBER [usuarioclima]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [usuarioclima]
GO
ALTER ROLE [db_owner] ADD MEMBER [userclima]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [userclima]
GO
ALTER ROLE [db_datareader] ADD MEMBER [userclima]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [userclima]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 8/25/2022 8:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Ciudad_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clima]    Script Date: 8/25/2022 8:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clima](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Hora] [datetime] NOT NULL,
	[Temperatura] [float] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[Anio]  AS (datepart(year,[Fecha])),
	[Mes]  AS (datepart(month,[Fecha])),
	[Dia]  AS (datepart(day,[Fecha])),
	[HoraEntera]  AS (datepart(hour,[Hora])),
	[MinutosEnteros]  AS (datepart(minute,[Hora])),
 CONSTRAINT [PK_Clima] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 8/25/2022 8:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 8/25/2022 8:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (1, 1, N'Bogotá')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (3, 1, N'Medellín')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (4, 1, N'Cali')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (5, 1, N'Barranquilla')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (6, 2, N'Washington')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (7, 2, N'New York')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (8, 2, N'Miami')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (9, 2, N'Los Angeles')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (10, 3, N'Caracas')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (11, 3, N'Maracaibo')
GO
INSERT [dbo].[Ciudad] ([Id], [IdPais], [Nombre]) VALUES (13, 3, N'Barquisimeto')
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Clima] ON 
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (1, CAST(N'2022-08-24T00:00:00.000' AS DateTime), CAST(N'2022-08-24T10:00:00.000' AS DateTime), 16, 3, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (2, CAST(N'2022-08-24T00:00:00.000' AS DateTime), CAST(N'2022-08-24T11:00:00.000' AS DateTime), 17, 3, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (3, CAST(N'2022-08-24T00:00:00.000' AS DateTime), CAST(N'2022-08-24T12:00:00.000' AS DateTime), 18, 4, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (6, CAST(N'2022-08-25T18:09:13.030' AS DateTime), CAST(N'2022-08-25T18:09:13.030' AS DateTime), 25.6, 1, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (7, CAST(N'2022-08-25T18:37:28.670' AS DateTime), CAST(N'2022-08-25T18:37:28.670' AS DateTime), 35, 5, 8, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (8, CAST(N'2022-08-25T18:37:31.640' AS DateTime), CAST(N'2022-08-25T18:37:31.640' AS DateTime), 6, 1, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (34, CAST(N'2022-08-25T19:55:23.423' AS DateTime), CAST(N'2022-08-25T19:55:23.423' AS DateTime), 12, 2, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (35, CAST(N'2022-08-25T19:56:54.990' AS DateTime), CAST(N'2022-08-25T19:56:54.990' AS DateTime), 16, 2, 4, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (36, CAST(N'2022-08-25T20:06:36.233' AS DateTime), CAST(N'2022-08-25T20:06:36.233' AS DateTime), 39, 6, 6, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (37, CAST(N'2022-08-25T20:07:10.793' AS DateTime), CAST(N'2022-08-25T20:07:10.793' AS DateTime), 15, 2, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (38, CAST(N'2022-08-25T20:07:12.313' AS DateTime), CAST(N'2022-08-25T20:07:12.313' AS DateTime), 17, 2, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (39, CAST(N'2022-08-25T20:07:13.017' AS DateTime), CAST(N'2022-08-25T20:07:13.017' AS DateTime), 32, 5, 7, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (40, CAST(N'2022-08-25T20:07:13.710' AS DateTime), CAST(N'2022-08-25T20:07:13.710' AS DateTime), 32, 5, 7, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (41, CAST(N'2022-08-25T20:07:20.813' AS DateTime), CAST(N'2022-08-25T20:07:20.813' AS DateTime), 12, 2, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (42, CAST(N'2022-08-25T20:07:21.357' AS DateTime), CAST(N'2022-08-25T20:07:21.357' AS DateTime), 36, 5, 6, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (43, CAST(N'2022-08-25T20:07:21.980' AS DateTime), CAST(N'2022-08-25T20:07:21.980' AS DateTime), 31, 5, 6, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (44, CAST(N'2022-08-25T20:14:56.927' AS DateTime), CAST(N'2022-08-25T20:14:56.927' AS DateTime), 6, 1, 1, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (45, CAST(N'2022-08-25T20:14:58.337' AS DateTime), CAST(N'2022-08-25T20:14:58.337' AS DateTime), 40, 6, 7, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (46, CAST(N'2022-08-25T20:14:59.063' AS DateTime), CAST(N'2022-08-25T20:14:59.063' AS DateTime), 31, 4, 7, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (47, CAST(N'2022-08-25T20:15:00.223' AS DateTime), CAST(N'2022-08-25T20:15:00.223' AS DateTime), 19, 3, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (48, CAST(N'2022-08-25T20:15:00.937' AS DateTime), CAST(N'2022-08-25T20:15:00.937' AS DateTime), 35, 5, 8, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (49, CAST(N'2022-08-25T20:15:01.570' AS DateTime), CAST(N'2022-08-25T20:15:01.570' AS DateTime), 24, 3, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (50, CAST(N'2022-08-25T20:15:02.540' AS DateTime), CAST(N'2022-08-25T20:15:02.540' AS DateTime), 33, 5, 7, 2)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (51, CAST(N'2022-08-25T20:15:03.447' AS DateTime), CAST(N'2022-08-25T20:15:03.447' AS DateTime), 12, 2, 3, 1)
GO
INSERT [dbo].[Clima] ([Id], [Fecha], [Hora], [Temperatura], [Estado], [IdCiudad], [IdPais]) VALUES (52, CAST(N'2022-08-25T20:15:04.880' AS DateTime), CAST(N'2022-08-25T20:15:04.880' AS DateTime), 23, 3, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Clima] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (1, N'Soleado')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (2, N'Nublado')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (3, N'Parcialmente Soleado')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (4, N'Parcialmente Nublado')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (5, N'Lloviznas')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (6, N'Lluvioso')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (7, N'Tormentas Eléctricas')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([Id], [Nombre]) VALUES (1, N'Colombia')
GO
INSERT [dbo].[Pais] ([Id], [Nombre]) VALUES (2, N'Estados Unidos')
GO
INSERT [dbo].[Pais] ([Id], [Nombre]) VALUES (3, N'Venezuela')
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Pais]
GO
ALTER TABLE [dbo].[Clima]  WITH CHECK ADD  CONSTRAINT [FK_Clima_Ciudad] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Ciudad] ([Id])
GO
ALTER TABLE [dbo].[Clima] CHECK CONSTRAINT [FK_Clima_Ciudad]
GO
ALTER TABLE [dbo].[Clima]  WITH CHECK ADD  CONSTRAINT [FK_Clima_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Clima] CHECK CONSTRAINT [FK_Clima_Estado]
GO
ALTER TABLE [dbo].[Clima]  WITH CHECK ADD  CONSTRAINT [FK_Clima_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Clima] CHECK CONSTRAINT [FK_Clima_Pais]
GO
USE [master]
GO
ALTER DATABASE [InfoClima] SET  READ_WRITE 
GO
