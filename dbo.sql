/*
 Navicat Premium Data Transfer

 Source Server         : sql server
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : BUKOWSKI-PC:1433
 Source Catalog        : app3
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 10/07/2022 12:35:09
*/


-- ----------------------------
-- Table structure for cat_Menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cat_Menu]') AND type IN ('U'))
	DROP TABLE [dbo].[cat_Menu]
GO

CREATE TABLE [dbo].[cat_Menu] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [menu] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[cat_Menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of cat_Menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[cat_Menu] ON
GO

INSERT INTO [dbo].[cat_Menu] ([id], [menu]) VALUES (N'1', N'USUARIOS')
GO

INSERT INTO [dbo].[cat_Menu] ([id], [menu]) VALUES (N'2', N'ROLES')
GO

INSERT INTO [dbo].[cat_Menu] ([id], [menu]) VALUES (N'3', N'VENTA')
GO

INSERT INTO [dbo].[cat_Menu] ([id], [menu]) VALUES (N'4', N'INVENTARIO')
GO

INSERT INTO [dbo].[cat_Menu] ([id], [menu]) VALUES (N'5', N'FACTURACION')
GO

SET IDENTITY_INSERT [dbo].[cat_Menu] OFF
GO


-- ----------------------------
-- Table structure for cat_Rol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cat_Rol]') AND type IN ('U'))
	DROP TABLE [dbo].[cat_Rol]
GO

CREATE TABLE [dbo].[cat_Rol] (
  [idRol] int  IDENTITY(1,1) NOT NULL,
  [Rol] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[cat_Rol] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of cat_Rol
-- ----------------------------
SET IDENTITY_INSERT [dbo].[cat_Rol] ON
GO

INSERT INTO [dbo].[cat_Rol] ([idRol], [Rol]) VALUES (N'1', N'ADMIN')
GO

INSERT INTO [dbo].[cat_Rol] ([idRol], [Rol]) VALUES (N'2', N'USUARIOS')
GO

INSERT INTO [dbo].[cat_Rol] ([idRol], [Rol]) VALUES (N'1009', N'ROLES1')
GO

SET IDENTITY_INSERT [dbo].[cat_Rol] OFF
GO


-- ----------------------------
-- Table structure for RolMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[RolMenu]') AND type IN ('U'))
	DROP TABLE [dbo].[RolMenu]
GO

CREATE TABLE [dbo].[RolMenu] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [idRol] int  NOT NULL,
  [idMenu] int  NOT NULL
)
GO

ALTER TABLE [dbo].[RolMenu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of RolMenu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RolMenu] ON
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'1', N'1', N'1')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'4', N'1', N'2')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'5', N'1', N'3')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'6', N'1', N'4')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'7', N'1', N'5')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'23', N'2', N'1')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'22', N'1009', N'1')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'21', N'1009', N'3')
GO

INSERT INTO [dbo].[RolMenu] ([id], [idRol], [idMenu]) VALUES (N'20', N'1009', N'5')
GO

SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO


-- ----------------------------
-- Table structure for Saludo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Saludo]') AND type IN ('U'))
	DROP TABLE [dbo].[Saludo]
GO

CREATE TABLE [dbo].[Saludo] (
  [Saludo] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Saludo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Saludo
-- ----------------------------
INSERT INTO [dbo].[Saludo]  VALUES (N'Buenas tardes C&A')
GO


-- ----------------------------
-- Table structure for Usuarios
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type IN ('U'))
	DROP TABLE [dbo].[Usuarios]
GO

CREATE TABLE [dbo].[Usuarios] (
  [NoEmpleado] int  IDENTITY(1,1) NOT NULL,
  [Nombre] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Apellidos] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Direccion] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Rol] int  NULL,
  [fNacimiento] date  NULL,
  [Contrasena] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Activo] smallint  NULL
)
GO

ALTER TABLE [dbo].[Usuarios] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Usuarios
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Usuarios] ON
GO

INSERT INTO [dbo].[Usuarios] ([NoEmpleado], [Nombre], [Apellidos], [Direccion], [Rol], [fNacimiento], [Contrasena], [Activo]) VALUES (N'1002', N'ANDRES', N'ESPINOZA', N'Axayacatl 90', N'1', N'1982-11-30', N'RfCAMuaLCGk=', N'1')
GO

INSERT INTO [dbo].[Usuarios] ([NoEmpleado], [Nombre], [Apellidos], [Direccion], [Rol], [fNacimiento], [Contrasena], [Activo]) VALUES (N'1004', N'liis', N'Apellidos', N'Dirección', N'1', N'2004-09-11', N'xaBbEDNRBM8wOVIN2HOCHg==', N'0')
GO

INSERT INTO [dbo].[Usuarios] ([NoEmpleado], [Nombre], [Apellidos], [Direccion], [Rol], [fNacimiento], [Contrasena], [Activo]) VALUES (N'1010', N'vv', N'vv', N'vv', N'3', N'1984-11-30', N'RfCAMuaLCGk=', N'1')
GO

INSERT INTO [dbo].[Usuarios] ([NoEmpleado], [Nombre], [Apellidos], [Direccion], [Rol], [fNacimiento], [Contrasena], [Activo]) VALUES (N'1013', N'vv', N'vv', N'vv', N'2', N'1984-11-30', N'RfCAMuaLCGk=', N'1')
GO

INSERT INTO [dbo].[Usuarios] ([NoEmpleado], [Nombre], [Apellidos], [Direccion], [Rol], [fNacimiento], [Contrasena], [Activo]) VALUES (N'1014', N'vv', N'vv', N'vv', N'1009', N'1984-11-30', N'RfCAMuaLCGk=', N'1')
GO

SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO


-- ----------------------------
-- Primary Key structure for table cat_Menu
-- ----------------------------
ALTER TABLE [dbo].[cat_Menu] ADD CONSTRAINT [PK_cat_Menu] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table cat_Rol
-- ----------------------------
ALTER TABLE [dbo].[cat_Rol] ADD CONSTRAINT [PK_cat_Rol] PRIMARY KEY CLUSTERED ([idRol])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table RolMenu
-- ----------------------------
ALTER TABLE [dbo].[RolMenu] ADD CONSTRAINT [PK_RolMenu] PRIMARY KEY CLUSTERED ([idRol], [idMenu])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Usuarios
-- ----------------------------
ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([NoEmpleado])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

