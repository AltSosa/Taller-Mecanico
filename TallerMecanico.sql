USE [master]
GO
/****** Object:  Database [TallerMecanico]    Script Date: 25/07/2018 05:01:29 p.m. ******/
CREATE DATABASE [TallerMecanico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TallerMecanico', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TallerMecanico.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TallerMecanico_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TallerMecanico_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TallerMecanico] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TallerMecanico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TallerMecanico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TallerMecanico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TallerMecanico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TallerMecanico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TallerMecanico] SET ARITHABORT OFF 
GO
ALTER DATABASE [TallerMecanico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TallerMecanico] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TallerMecanico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TallerMecanico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TallerMecanico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TallerMecanico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TallerMecanico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TallerMecanico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TallerMecanico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TallerMecanico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TallerMecanico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TallerMecanico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TallerMecanico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TallerMecanico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TallerMecanico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TallerMecanico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TallerMecanico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TallerMecanico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TallerMecanico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TallerMecanico] SET  MULTI_USER 
GO
ALTER DATABASE [TallerMecanico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TallerMecanico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TallerMecanico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TallerMecanico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TallerMecanico]
GO
/****** Object:  Table [dbo].[OrdenDeTrabajo]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdenDeTrabajo](
	[idOrdenDeTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[fechaIngreso] [datetime] NOT NULL,
	[detalleFalla] [varchar](200) NOT NULL,
	[idVehiculo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_OrdenDeTrabajo] PRIMARY KEY CLUSTERED 
(
	[idOrdenDeTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propietario](
	[idPropietario] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[direccion] [varchar](20) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[mail] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[idPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Repuesto](
	[idRepuesto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[costo] [float] NOT NULL,
 CONSTRAINT [PK_Repuesto] PRIMARY KEY CLUSTERED 
(
	[idRepuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RepuestoOT]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepuestoOT](
	[idRepuestoOT] [int] IDENTITY(1,1) NOT NULL,
	[idOrdenDeTrabajo] [int] NOT NULL,
	[idRepuesto] [int] NOT NULL,
	[cantidadDeRepuesto] [int] NOT NULL,
	[cantidadHorasTrabajo] [float] NOT NULL,
 CONSTRAINT [PK_RepuestoOT] PRIMARY KEY CLUSTERED 
(
	[idRepuestoOT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](15) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[idRol] [int] NOT NULL,
	[nombreCompleto] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 25/07/2018 05:01:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[idVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[nroPatente] [varchar](6) NOT NULL,
	[marca] [varchar](15) NOT NULL,
	[idPropietario] [int] NOT NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[idVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] ON 

INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (22, CAST(0x0000A927009C0E74 AS DateTime), N'Manija interior rota', 3, 5, 3857)
INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (23, CAST(0x0000A927009D3F3C AS DateTime), N'Cilindro roto', 1, 6, 6010)
INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (24, CAST(0x0000A92700A16560 AS DateTime), N'Resortes viejos', 1, 6, NULL)
INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (25, CAST(0x0000A92700D8A950 AS DateTime), N'Caja de cambio rota', 3, 5, NULL)
INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (26, CAST(0x0000A92800DA2A17 AS DateTime), N'Frenos viejos', 5, 5, NULL)
INSERT [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo], [fechaIngreso], [detalleFalla], [idVehiculo], [idUsuario], [total]) VALUES (27, CAST(0x0000A92800FA0F34 AS DateTime), N'No vuela', 6, 5, 37000)
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] OFF
SET IDENTITY_INSERT [dbo].[Propietario] ON 

INSERT [dbo].[Propietario] ([idPropietario], [dni], [nombre], [apellido], [direccion], [telefono], [mail]) VALUES (1, N'36123455', N'Diego', N'Leblanc', N'Olavarria 250', N'1145697814', N'DiegoLeblanc@gmail.com')
INSERT [dbo].[Propietario] ([idPropietario], [dni], [nombre], [apellido], [direccion], [telefono], [mail]) VALUES (2, N'33154865', N'Luis', N'Gonzales', N'Necochea 680', N'1114356897', N'Luis@Gmail.com')
INSERT [dbo].[Propietario] ([idPropietario], [dni], [nombre], [apellido], [direccion], [telefono], [mail]) VALUES (3, N'364568974', N'Gabriel', N'Gonzales', N'Mi casa 150', N'1145789674', N'gabriel@gmail.com')
INSERT [dbo].[Propietario] ([idPropietario], [dni], [nombre], [apellido], [direccion], [telefono], [mail]) VALUES (4, N'123456789', N'gab', N'gonzalez', N'mi casa', N'123456780', N'gbjk@gmail.com')
SET IDENTITY_INSERT [dbo].[Propietario] OFF
SET IDENTITY_INSERT [dbo].[Repuesto] ON 

INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (1, N'manija interior', 154)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (2, N'radiador', 2400)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (4, N'cilindro puerta', 290)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (5, N'resortes ', 3000)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (6, N'bateria', 2653)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (7, N'caja automatica', 4800)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (8, N'Bujia', 500)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (9, N'Freno', 700)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (10, N'motor', 15000)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (11, N'volante', 850)
INSERT [dbo].[Repuesto] ([idRepuesto], [nombre], [costo]) VALUES (12, N'Alas', 1000)
SET IDENTITY_INSERT [dbo].[Repuesto] OFF
SET IDENTITY_INSERT [dbo].[RepuestoOT] ON 

INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (1, 22, 1, 1, 2)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (2, 24, 5, 4, 5)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (3, 22, 6, 1, 1)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (4, 23, 8, 2, 6)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (5, 23, 4, 4, 5)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (6, 24, 7, 1, 1)
INSERT [dbo].[RepuestoOT] ([idRepuestoOT], [idOrdenDeTrabajo], [idRepuesto], [cantidadDeRepuesto], [cantidadHorasTrabajo]) VALUES (7, 27, 10, 2, 20)
SET IDENTITY_INSERT [dbo].[RepuestoOT] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [descripcion]) VALUES (1, N'Empleado')
INSERT [dbo].[Rol] ([idRol], [descripcion]) VALUES (2, N'Supervisor')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [idRol], [nombreCompleto]) VALUES (5, N'alvaro', N'123456', 1, N'Alvaro Tarqui')
INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [idRol], [nombreCompleto]) VALUES (6, N'luis', N'Ej1234', 1, N'Luis Gonzales')
INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [idRol], [nombreCompleto]) VALUES (7, N'jorge', N'qwerty', 1, N'Jorge Ceballos')
INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [idRol], [nombreCompleto]) VALUES (8, N'carlos', N'carlos123', 2, N'Carlos Garcia')
INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [idRol], [nombreCompleto]) VALUES (9, N'Nuevo', N'nuevo', 1, N'Nuevo usuario')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Vehiculo] ON 

INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (1, N'ABC123', N'Fiat', 2)
INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (2, N'KGC122', N'Ford', 2)
INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (3, N'ZXC789', N'Chevrolet', 1)
INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (4, N'SDE457', N'Hyundai', 3)
INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (5, N'CVB478', N'BMW', 3)
INSERT [dbo].[Vehiculo] ([idVehiculo], [nroPatente], [marca], [idPropietario]) VALUES (6, N'SFA123', N'Tesla', 4)
SET IDENTITY_INSERT [dbo].[Vehiculo] OFF
ALTER TABLE [dbo].[OrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDeTrabajo_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[OrdenDeTrabajo] CHECK CONSTRAINT [FK_OrdenDeTrabajo_Usuario]
GO
ALTER TABLE [dbo].[OrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDeTrabajo_Vehiculo] FOREIGN KEY([idVehiculo])
REFERENCES [dbo].[Vehiculo] ([idVehiculo])
GO
ALTER TABLE [dbo].[OrdenDeTrabajo] CHECK CONSTRAINT [FK_OrdenDeTrabajo_Vehiculo]
GO
ALTER TABLE [dbo].[RepuestoOT]  WITH CHECK ADD  CONSTRAINT [FK_RepuestoOT_OrdenDeTrabajo] FOREIGN KEY([idOrdenDeTrabajo])
REFERENCES [dbo].[OrdenDeTrabajo] ([idOrdenDeTrabajo])
GO
ALTER TABLE [dbo].[RepuestoOT] CHECK CONSTRAINT [FK_RepuestoOT_OrdenDeTrabajo]
GO
ALTER TABLE [dbo].[RepuestoOT]  WITH CHECK ADD  CONSTRAINT [FK_RepuestoOT_Repuesto] FOREIGN KEY([idRepuesto])
REFERENCES [dbo].[Repuesto] ([idRepuesto])
GO
ALTER TABLE [dbo].[RepuestoOT] CHECK CONSTRAINT [FK_RepuestoOT_Repuesto]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Propietario] FOREIGN KEY([idPropietario])
REFERENCES [dbo].[Propietario] ([idPropietario])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Propietario]
GO
USE [master]
GO
ALTER DATABASE [TallerMecanico] SET  READ_WRITE 
GO
