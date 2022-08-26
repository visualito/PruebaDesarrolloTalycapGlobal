USE [master]
GO
/****** Object:  Database [Seguridad]    Script Date: 8/25/2022 8:38:03 PM ******/
CREATE DATABASE [Seguridad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Seguridad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Seguridad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Seguridad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Seguridad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Seguridad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Seguridad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Seguridad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Seguridad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Seguridad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Seguridad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Seguridad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Seguridad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Seguridad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Seguridad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Seguridad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Seguridad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Seguridad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Seguridad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Seguridad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Seguridad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Seguridad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Seguridad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Seguridad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Seguridad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Seguridad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Seguridad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Seguridad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Seguridad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Seguridad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Seguridad] SET  MULTI_USER 
GO
ALTER DATABASE [Seguridad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Seguridad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Seguridad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Seguridad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Seguridad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Seguridad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Seguridad] SET QUERY_STORE = OFF
GO
USE [Seguridad]
GO
/****** Object:  User [usuarioSeguridad]    Script Date: 8/25/2022 8:38:03 PM ******/
CREATE USER [usuarioSeguridad] FOR LOGIN [usuarioSeguridad] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Mirth]    Script Date: 8/25/2022 8:38:03 PM ******/
CREATE USER [Mirth] FOR LOGIN [Mirth] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuarioSeguridad]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [usuarioSeguridad]
GO
ALTER ROLE [db_datareader] ADD MEMBER [usuarioSeguridad]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [usuarioSeguridad]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Mirth]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Mirth]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Mirth]
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](128) NOT NULL,
	[descripcion] [nvarchar](512) NOT NULL,
	[ElementoRelacionado] [nvarchar](512) NOT NULL,
	[idElemento] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_permisos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermiso]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermiso](
	[id_role] [int] NOT NULL,
	[id_permiso] [int] NOT NULL,
 CONSTRAINT [PK_RolePermiso] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC,
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](64) NOT NULL,
	[descripcion] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarioRole]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioRole](
	[id_usuario] [int] NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_usuarioRole] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](64) NOT NULL,
	[nombres] [nvarchar](128) NOT NULL,
	[apellidos] [nvarchar](128) NOT NULL,
	[password] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [usuario], [nombres], [apellidos], [password]) VALUES (2, N'72182468', N'Elkin Eduardo', N'Marenco Doncel', N'123456')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
/****** Object:  Index [IX_usuarios]    Script Date: 8/25/2022 8:38:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_usuarios] ON [dbo].[usuarios]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[permisos] ADD  CONSTRAINT [DF_permisos_nombre]  DEFAULT ('') FOR [nombre]
GO
ALTER TABLE [dbo].[permisos] ADD  CONSTRAINT [DF_permisos_descripcion]  DEFAULT ('') FOR [descripcion]
GO
ALTER TABLE [dbo].[permisos] ADD  CONSTRAINT [DF_permisos_ElementoRelacionado]  DEFAULT ('') FOR [ElementoRelacionado]
GO
ALTER TABLE [dbo].[permisos] ADD  CONSTRAINT [DF_permisos_idElemento]  DEFAULT ('') FOR [idElemento]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_descripcion]  DEFAULT ('') FOR [descripcion]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_usuario]  DEFAULT ('') FOR [usuario]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_nombres]  DEFAULT ('') FOR [nombres]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_apellidos]  DEFAULT ('') FOR [apellidos]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_password]  DEFAULT ('') FOR [password]
GO
ALTER TABLE [dbo].[usuarioRole]  WITH CHECK ADD  CONSTRAINT [FK_usuarioRole_roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[usuarioRole] CHECK CONSTRAINT [FK_usuarioRole_roles]
GO
/****** Object:  StoredProcedure [dbo].[Autentica]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Autentica] 
	
	(
	@usuario nvarchar(64),
	@password nvarchar(1024)
	)
	
AS
	select id
	from usuarios
	where usuario = @usuario
	and password = @password
GO
/****** Object:  StoredProcedure [dbo].[BorraRolePermiso]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[BorraRolePermiso] 
	
	(
	@id_role int,
	@id_permiso int
	)
	
AS
	SET NOCOUNT ON
	
	
	delete from RolePermiso 
	where id_role = @id_role
	and id_permiso = @id_permiso
GO
/****** Object:  StoredProcedure [dbo].[BorraRoleUsuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorraRoleUsuario] 
	
	(
	@id_usuario int,
	@id_role int
	)
	
AS
	SET NOCOUNT ON
	
	
	delete from usuariRole 
	where id_usuario = @id_usuario
	and id_role = @id_role
GO
/****** Object:  StoredProcedure [dbo].[ComplementoPermisosRole]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComplementoPermisosRole] 
	
	(
	@role int
	)
	
AS
	SET NOCOUNT ON
	
select  a.id,a.nombre,a.descripcion,a.ElementoRelacionado,a.idElemento
from permisos a
left join (
			select id_permiso
			from rolePermiso
			where id_role =@role
		  ) b
on a.id = b.id_permiso
where b.id_permiso is null
GO
/****** Object:  StoredProcedure [dbo].[ComplementoRolesusuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ComplementoRolesusuario] 
	
	(
	@usuario int
	
	)
	
AS
	SET NOCOUNT ON
	
	select  a.id,a.nombre,a.descripcion
from roles a
left join (
			select id_role
			from usuarioRole
			where id_usuario = @usuario
		  ) c
on a.id = c.id_role
where c.id_role is null
GO
/****** Object:  StoredProcedure [dbo].[DatosUsuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DatosUsuario] 
	
	(
	@usuario nvarchar(64)
	)
	
AS
	SET NOCOUNT ON  
	
	select id,nombres,apellidos
	from usuarios
	where usuario = @usuario
GO
/****** Object:  StoredProcedure [dbo].[DatosUsuarioPorId]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DatosUsuarioPorId] 
	
	(
	@id int
	)
	
AS
	SET NOCOUNT ON  
	
	select id,nombres,apellidos
	from usuarios
	where id = @id
GO
/****** Object:  StoredProcedure [dbo].[InsertaPermiso]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[InsertaPermiso]
	
	(
	@nombre nvarchar(128),
	@descripcion nvarchar(512),
	@ElementoRelacionado nvarchar(512),
	@idElemento nvarchar(256),
	@id int OUTPUT
	)
	
AS
	insert into permisos (nombre,descripcion,ElementoRelacionado,idElemento)
	values (@nombre,@descripcion,@ElementoRelacionado,@idElemento)
	
	
	set @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertaRole]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaRole] 
	
	(
	@nombre nvarchar(64),
	@descripcion nvarchar(512),
	@id int OUTPUT
	)
	
AS
	insert into roles (nombre,descripcion)
	values (@nombre,@descripcion)
	
	
	set @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertaRolePermiso]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaRolePermiso] 
	
	(
	@id_role int,
	@id_permiso int
	)
	
AS
	SET NOCOUNT ON
	
	
	insert into RolePermiso (id_role,id_permiso)
	values (@id_role,@id_permiso)
GO
/****** Object:  StoredProcedure [dbo].[InsertaRoleUsuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaRoleUsuario] 
	
	(
	@id_role int,
	@id_usuario int
	)
	
AS
	SET NOCOUNT ON
	
	
	insert into usuarioRole (id_usuario,id_role)
	values (@id_usuario,@id_role)
GO
/****** Object:  StoredProcedure [dbo].[InsertaUsuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[InsertaUsuario]
	
	(
	@usuario nvarchar(64),
	@nombres nvarchar(128),
	@apellidos nvarchar(128),
	@password nvarchar(1024),
	@id int OUTPUT
	)
	
AS
	insert into usuarios (usuario,nombres,apellidos,password)
	values (@usuario,@nombres,@apellidos,@password)
	
	
	set @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PermisosRole]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PermisosRole] 
	
	(
	@role int
	)
	
AS
	SET NOCOUNT ON
	
	select distinct a.id,a.nombre,a.descripcion,a.ElementoRelacionado,a.idElemento
	from permisos a,rolePermiso b
	where a.id = b.id_permiso
	and b.id_role = @role
GO
/****** Object:  StoredProcedure [dbo].[PermisosUsuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PermisosUsuario] 
	
	(
	@usuario int
	)
	
AS
	SET NOCOUNT ON
	
	select distinct a.id,a.nombre,a.descripcion,a.idElemento,a.ElementoRelacionado
	from permisos a,rolePermiso b, usuarioRole c
	where a.id = b.id_permiso
	and b.id_role = c.id_role
	and c.id_usuario = @usuario

GO
/****** Object:  StoredProcedure [dbo].[Rolesusuario]    Script Date: 8/25/2022 8:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rolesusuario] 
	
	(
	@usuario int
	
	)
	
AS
	SET NOCOUNT ON
	
	select distinct a.id,a.nombre,a.descripcion
	from roles a,usuarioRole c
	where a.id = c.id_role
	and c.id_usuario = @usuario
GO
USE [master]
GO
ALTER DATABASE [Seguridad] SET  READ_WRITE 
GO
