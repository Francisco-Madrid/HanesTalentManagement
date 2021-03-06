USE [master]
GO
/****** Object:  Database [HanesTalentManagement]    Script Date: 6/29/2021 10:18:44 AM ******/
CREATE DATABASE [HanesTalentManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HanesProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HanesProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HanesProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HanesProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HanesTalentManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HanesTalentManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HanesTalentManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HanesTalentManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HanesTalentManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HanesTalentManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HanesTalentManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HanesTalentManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HanesTalentManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HanesTalentManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HanesTalentManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HanesTalentManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HanesTalentManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HanesTalentManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HanesTalentManagement] SET QUERY_STORE = OFF
GO
USE [HanesTalentManagement]
GO
/****** Object:  User [proyecto]    Script Date: 6/29/2021 10:18:44 AM ******/
CREATE USER [proyecto] FOR LOGIN [proyecto] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [proyecto]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoID] [int] IDENTITY(1,1) NOT NULL,
	[CargoNombre] [varchar](50) NOT NULL,
	[CargoDescripcion] [varchar](150) NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[CargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaNombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaCargo]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaCargo](
	[CategoriaCargoID] [int] IDENTITY(1,1) NOT NULL,
	[FKCargoID] [int] NOT NULL,
	[FKCategoriaID] [int] NOT NULL,
 CONSTRAINT [PK_CategoriaCargos] PRIMARY KEY CLUSTERED 
(
	[CategoriaCargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Competencia]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competencia](
	[CompetenciaID] [int] IDENTITY(1,1) NOT NULL,
	[CompetenciaNombre] [varchar](50) NOT NULL,
	[CompetenciaDescripcion] [varchar](150) NULL,
 CONSTRAINT [PK_Competencias] PRIMARY KEY CLUSTERED 
(
	[CompetenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetenciaResultado]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetenciaResultado](
	[CompetenciaResultadoID] [int] IDENTITY(1,1) NOT NULL,
	[FKEmpleadoEvaluacionID] [int] NOT NULL,
	[FKCompetenciaID] [int] NOT NULL,
	[Porcentaje] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_CompetenciasResultados] PRIMARY KEY CLUSTERED 
(
	[CompetenciaResultadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Continente]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continente](
	[ContinenteID] [int] IDENTITY(1,1) NOT NULL,
	[ContinenteNombre] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Continente] PRIMARY KEY CLUSTERED 
(
	[ContinenteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoNombre] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartamentoPlanta]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartamentoPlanta](
	[DepartamentoPlantaID] [int] IDENTITY(1,1) NOT NULL,
	[FKDepartamentoID] [int] NOT NULL,
	[FKPlantaID] [int] NOT NULL,
	[FKEmpleadoID_Jefe] [int] NULL,
 CONSTRAINT [PK_DepartamentoPlanta] PRIMARY KEY CLUSTERED 
(
	[DepartamentoPlantaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoNombre] [varchar](70) NOT NULL,
	[EmpleadoCorreo] [varchar](150) NOT NULL,
	[FKCategoriaCargoID] [int] NOT NULL,
	[FKDepartamentoPlantaID] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[EmpleadoID_Jefe] [int] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoEvaluacion]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoEvaluacion](
	[EmpleadoEvaluacionID] [int] IDENTITY(1,1) NOT NULL,
	[FKEvaluacionID] [int] NOT NULL,
	[FKEmpleadoID_Evaluado] [int] NOT NULL,
	[FKEmpleadoID_Evaluador] [int] NOT NULL,
	[FKRelacionID] [int] NOT NULL,
	[Estado] [smallint] NOT NULL,
 CONSTRAINT [PK_EmpleadosEvaluaciones] PRIMARY KEY CLUSTERED 
(
	[EmpleadoEvaluacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluacion](
	[EvaluacionID] [int] IDENTITY(1,1) NOT NULL,
	[EvaluacionNombre] [varchar](75) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
 CONSTRAINT [PK_Evaluaciones] PRIMARY KEY CLUSTERED 
(
	[EvaluacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meta]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta](
	[MetaID] [int] IDENTITY(1,1) NOT NULL,
	[MetaNombre] [varchar](70) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Metas] PRIMARY KEY CLUSTERED 
(
	[MetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[PaisID] [int] IDENTITY(1,1) NOT NULL,
	[PaisNombre] [varchar](75) NOT NULL,
	[FKRegionID] [int] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[PaisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planta]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planta](
	[PlantaID] [int] IDENTITY(1,1) NOT NULL,
	[PlantaNombre] [varchar](100) NOT NULL,
	[FKPaisID] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Plantas] PRIMARY KEY CLUSTERED 
(
	[PlantaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionNombre] [varchar](75) NOT NULL,
	[FKContinenteID] [int] NOT NULL,
 CONSTRAINT [PK_Regiones] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relacion]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relacion](
	[RelacionID] [int] IDENTITY(1,1) NOT NULL,
	[RelacionDesc] [varchar](35) NOT NULL,
 CONSTRAINT [PK_Relaciones] PRIMARY KEY CLUSTERED 
(
	[RelacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submeta]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submeta](
	[SubmetaID] [int] IDENTITY(1,1) NOT NULL,
	[SubmetaNombre] [varchar](70) NOT NULL,
	[SubmetaDesc] [varchar](150) NOT NULL,
	[PesoIdeal] [decimal](5, 2) NOT NULL,
	[FKMetaID] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Submetas] PRIMARY KEY CLUSTERED 
(
	[SubmetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmetaDetalle]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmetaDetalle](
	[SubmetaDetalleID] [int] IDENTITY(1,1) NOT NULL,
	[FKSubmetaID] [int] NOT NULL,
	[FKEmpleadoID] [int] NOT NULL,
 CONSTRAINT [PK_SubmetaResultados] PRIMARY KEY CLUSTERED 
(
	[SubmetaDetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmetaResultado]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmetaResultado](
	[SubmetaResultadoID] [int] IDENTITY(1,1) NOT NULL,
	[FKSubmetaDetalleID] [int] NOT NULL,
	[PesoReal] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_SubmetaResultado] PRIMARY KEY CLUSTERED 
(
	[SubmetaResultadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testint]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testint](
	[idloc] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[loc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Testint] PRIMARY KEY CLUSTERED 
(
	[idloc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[TipoUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[TipoUsuarioNombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoUsuarios] PRIMARY KEY CLUSTERED 
(
	[TipoUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioNombre] [varchar](50) NOT NULL,
	[ContrasenaHash] [binary](64) NOT NULL,
	[Salt] [nvarchar](36) NOT NULL,
	[FKTipoUsuarioID] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioEmpleado]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioEmpleado](
	[UsuarioEmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[FKUsuarioID] [int] NOT NULL,
	[FKEmpleadoID] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioEmpleado] PRIMARY KEY CLUSTERED 
(
	[UsuarioEmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoriaCargo]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaCargo_Cargo] FOREIGN KEY([FKCargoID])
REFERENCES [dbo].[Cargo] ([CargoID])
GO
ALTER TABLE [dbo].[CategoriaCargo] CHECK CONSTRAINT [FK_CategoriaCargo_Cargo]
GO
ALTER TABLE [dbo].[CategoriaCargo]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaCargo_Categoria] FOREIGN KEY([FKCategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[CategoriaCargo] CHECK CONSTRAINT [FK_CategoriaCargo_Categoria]
GO
ALTER TABLE [dbo].[CompetenciaResultado]  WITH CHECK ADD  CONSTRAINT [FK_CompetenciaResultado_Competencia] FOREIGN KEY([FKCompetenciaID])
REFERENCES [dbo].[Competencia] ([CompetenciaID])
GO
ALTER TABLE [dbo].[CompetenciaResultado] CHECK CONSTRAINT [FK_CompetenciaResultado_Competencia]
GO
ALTER TABLE [dbo].[CompetenciaResultado]  WITH CHECK ADD  CONSTRAINT [FK_CompetenciaResultado_EmpleadoEvaluacion] FOREIGN KEY([FKEmpleadoEvaluacionID])
REFERENCES [dbo].[EmpleadoEvaluacion] ([EmpleadoEvaluacionID])
GO
ALTER TABLE [dbo].[CompetenciaResultado] CHECK CONSTRAINT [FK_CompetenciaResultado_EmpleadoEvaluacion]
GO
ALTER TABLE [dbo].[DepartamentoPlanta]  WITH CHECK ADD  CONSTRAINT [FK_DepartamentoPlanta_Departamento] FOREIGN KEY([FKDepartamentoID])
REFERENCES [dbo].[Departamento] ([DepartamentoID])
GO
ALTER TABLE [dbo].[DepartamentoPlanta] CHECK CONSTRAINT [FK_DepartamentoPlanta_Departamento]
GO
ALTER TABLE [dbo].[DepartamentoPlanta]  WITH CHECK ADD  CONSTRAINT [FK_DepartamentoPlanta_Empleado] FOREIGN KEY([FKEmpleadoID_Jefe])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[DepartamentoPlanta] CHECK CONSTRAINT [FK_DepartamentoPlanta_Empleado]
GO
ALTER TABLE [dbo].[DepartamentoPlanta]  WITH CHECK ADD  CONSTRAINT [FK_DepartamentoPlanta_Planta] FOREIGN KEY([FKPlantaID])
REFERENCES [dbo].[Planta] ([PlantaID])
GO
ALTER TABLE [dbo].[DepartamentoPlanta] CHECK CONSTRAINT [FK_DepartamentoPlanta_Planta]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_CategoriaCargo] FOREIGN KEY([FKCategoriaCargoID])
REFERENCES [dbo].[CategoriaCargo] ([CategoriaCargoID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_CategoriaCargo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_DepartamentoPlanta] FOREIGN KEY([FKDepartamentoPlantaID])
REFERENCES [dbo].[DepartamentoPlanta] ([DepartamentoPlantaID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_DepartamentoPlanta]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Empleado_Jefe] FOREIGN KEY([EmpleadoID_Jefe])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Empleado_Jefe]
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoEvaluacion_Empleado_Evaluado] FOREIGN KEY([FKEmpleadoID_Evaluado])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion] CHECK CONSTRAINT [FK_EmpleadoEvaluacion_Empleado_Evaluado]
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoEvaluacion_Empleado_Evaluador] FOREIGN KEY([FKEmpleadoID_Evaluador])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion] CHECK CONSTRAINT [FK_EmpleadoEvaluacion_Empleado_Evaluador]
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoEvaluacion_Evaluacion] FOREIGN KEY([FKEvaluacionID])
REFERENCES [dbo].[Evaluacion] ([EvaluacionID])
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion] CHECK CONSTRAINT [FK_EmpleadoEvaluacion_Evaluacion]
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoEvaluacion_Relacion] FOREIGN KEY([FKRelacionID])
REFERENCES [dbo].[Relacion] ([RelacionID])
GO
ALTER TABLE [dbo].[EmpleadoEvaluacion] CHECK CONSTRAINT [FK_EmpleadoEvaluacion_Relacion]
GO
ALTER TABLE [dbo].[Pais]  WITH CHECK ADD  CONSTRAINT [FK_Pais_Region] FOREIGN KEY([FKRegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Pais] CHECK CONSTRAINT [FK_Pais_Region]
GO
ALTER TABLE [dbo].[Planta]  WITH CHECK ADD  CONSTRAINT [FK_Planta_Pais] FOREIGN KEY([FKPaisID])
REFERENCES [dbo].[Pais] ([PaisID])
GO
ALTER TABLE [dbo].[Planta] CHECK CONSTRAINT [FK_Planta_Pais]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Continente] FOREIGN KEY([FKContinenteID])
REFERENCES [dbo].[Continente] ([ContinenteID])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Continente]
GO
ALTER TABLE [dbo].[Submeta]  WITH CHECK ADD  CONSTRAINT [FK_Submeta_Meta] FOREIGN KEY([FKMetaID])
REFERENCES [dbo].[Meta] ([MetaID])
GO
ALTER TABLE [dbo].[Submeta] CHECK CONSTRAINT [FK_Submeta_Meta]
GO
ALTER TABLE [dbo].[SubmetaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SubmetaDetalle_Empleado] FOREIGN KEY([FKEmpleadoID])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[SubmetaDetalle] CHECK CONSTRAINT [FK_SubmetaDetalle_Empleado]
GO
ALTER TABLE [dbo].[SubmetaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SubmetaDetalle_Submeta] FOREIGN KEY([FKSubmetaID])
REFERENCES [dbo].[Submeta] ([SubmetaID])
GO
ALTER TABLE [dbo].[SubmetaDetalle] CHECK CONSTRAINT [FK_SubmetaDetalle_Submeta]
GO
ALTER TABLE [dbo].[SubmetaResultado]  WITH CHECK ADD  CONSTRAINT [FK_SubmetaResultado_SubmetaDetalle] FOREIGN KEY([FKSubmetaDetalleID])
REFERENCES [dbo].[SubmetaDetalle] ([SubmetaDetalleID])
GO
ALTER TABLE [dbo].[SubmetaResultado] CHECK CONSTRAINT [FK_SubmetaResultado_SubmetaDetalle]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([FKTipoUsuarioID])
REFERENCES [dbo].[TipoUsuario] ([TipoUsuarioID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [dbo].[UsuarioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioEmpleado_Empleado] FOREIGN KEY([FKEmpleadoID])
REFERENCES [dbo].[Empleado] ([EmpleadoID])
GO
ALTER TABLE [dbo].[UsuarioEmpleado] CHECK CONSTRAINT [FK_UsuarioEmpleado_Empleado]
GO
ALTER TABLE [dbo].[UsuarioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioEmpleado_Usuario] FOREIGN KEY([FKUsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[UsuarioEmpleado] CHECK CONSTRAINT [FK_UsuarioEmpleado_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargo_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cargo_Actualizar] 
	-- Add the parameters for the stored procedure here
	@Id INT,
	@cargoNombre VARCHAR(50) = NULL,
	@cargoDescripcion VARCHAR(150) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Cargo]
   SET [CargoNombre] = ISNULL(@cargoNombre, Cargo.CargoNombre)
      ,[CargoDescripcion] = ISNULL(@cargoDescripcion, Cargo.CargoDescripcion)
 WHERE Cargo.CargoID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargo_Categoria_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Actualiza el nombre del cargo y la categoria de cargo que tiene relacionada en la tabla CategoriaCargo
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cargo_Categoria_Actualizar] 
	-- Add the parameters for the stored procedure here
	@CargoID INT,
	@nombreCargo VARCHAR(50) = NULL,
	@descripcionCargo VARCHAR(150) = NULL,

	@CategoriaCargoID INT,
	@CategoriaID INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXECUTE [dbo].[sp_Cargo_Actualizar] @CargoID, @nombreCargo, @descripcionCargo

	EXECUTE [dbo].[sp_CategoriaCargo_Actualizar] @CategoriaCargoID, @CargoID, @CategoriaID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargo_Categoria_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Inserta los datos del nuevo cargo y lo vincula con su respectiva categoria en la tabla CategoriaCargo
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cargo_Categoria_Insertar] 
	-- Add the parameters for the stored procedure here
	@cargoNombre VARCHAR(50),
	@cargoDescripcion VARCHAR(150) = NULL,
	
	@CategoriaID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CargoID INT
	
	EXECUTE @CargoID = [dbo].[sp_Cargo_Insertar] @cargoNombre, @cargoDescripcion

	EXECUTE [dbo].[sp_CategoriaCargo_Insertar] @CargoID, @CategoriaID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargo_Categoria_Mostar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 02/06/20221
-- Description:	Muestra los datos de los cargos y su categorias-
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cargo_Categoria_Mostar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Cargo.CargoID, CategoriaCargo.CategoriaCargoID, Categoria.CategoriaID, Cargo.CargoNombre, Cargo.CargoDescripcion, Categoria.CategoriaNombre
FROM            Cargo INNER JOIN
                         CategoriaCargo ON Cargo.CargoID = CategoriaCargo.FKCargoID INNER JOIN
                         Categoria ON CategoriaCargo.FKCategoriaID = Categoria.CategoriaID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargo_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Inserta un nuevo cargo a la tabla Cargo
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cargo_Insertar] 
	-- Add the parameters for the stored procedure here
	@cargoNombre VARCHAR(50),
	@cargoDescripcion VARCHAR(150) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Cargo]
           ([CargoNombre]
           ,[CargoDescripcion])
     VALUES
           (@cargoNombre,
		    @cargoDescripcion)



	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Categoria_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Muestra las categorias existentes en la tabla Categoria
-- =============================================
CREATE PROCEDURE [dbo].[sp_Categoria_Mostrar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        CategoriaID, CategoriaNombre
FROM            Categoria
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CategoriaCargo_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Actualiza los campos en la tabla de CategoriaCargo
-- =============================================
CREATE PROCEDURE [dbo].[sp_CategoriaCargo_Actualizar] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@FKCargoID INT = NULL,
	@FKCategoriaID INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[CategoriaCargo]
    SET [FKCargoID] = ISNULL(@FKCargoID, CategoriaCargo.FKCargoID)
      ,[FKCategoriaID] = ISNULL(@FKCategoriaID, CategoriaCargo.FKCategoriaID)
	WHERE CategoriaCargo.CategoriaCargoID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CategoriaCargo_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Inserta los datos que vincula el cargo con su respectiva categoria en la tabla CategoriaCargo
-- =============================================
CREATE PROCEDURE [dbo].[sp_CategoriaCargo_Insertar] 
	-- Add the parameters for the stored procedure here
	@FKCargoID INT,
	@FKCategoriaID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[CategoriaCargo]
           ([FKCargoID]
           ,[FKCategoriaID])
     VALUES
           (@FKCargoID,
		    @FKCategoriaID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CategoriaCargo_Verificar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Verifica si el registro actualemente existe en la tabla
-- =============================================
CREATE PROCEDURE [dbo].[sp_CategoriaCargo_Verificar] 
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        CategoriaCargoID, FKCargoID, FKCategoriaID
FROM            CategoriaCargo
WHERE CategoriaCargoID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 02/06/2021
-- Description:	Actualiza los datos en la tabla de Departamento segun el Id.
-- =============================================
CREATE PROCEDURE [dbo].[sp_Departamento_Actualizar] 
	-- Add the parameters for the stored procedure here
	@Id INT,
	@departamentoNombre VARCHAR(75)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Departamento]
    SET [DepartamentoNombre] = @departamentoNombre
	WHERE Departamento.DepartamentoID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Inserta los datos a la tabla de Departamento
-- =============================================
CREATE PROCEDURE [dbo].[sp_Departamento_Insertar] 
	-- Add the parameters for the stored procedure here
	@departamentoNombre VARCHAR(75)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Departamento]
           ([DepartamentoNombre])
     VALUES
           (@departamentoNombre)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Muestra los datos de la tabla Departamento
-- =============================================
CREATE PROCEDURE [dbo].[sp_Departamento_Mostrar] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        DepartamentoID, DepartamentoNombre
FROM            Departamento
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoPlanta_Buscar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 
-- Description:	Realiza el filtro de busqueda de departamento basado en la planta id
-- =============================================
CREATE PROCEDURE [dbo].[sp_DepartamentoPlanta_Buscar] 
	-- Add the parameters for the stored procedure here
	@filtro INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT       DepartamentoPlanta.DepartamentoPlantaID, Departamento.DepartamentoNombre
	FROM            DepartamentoPlanta INNER JOIN
							 Departamento ON DepartamentoPlanta.FKDepartamentoID = Departamento.DepartamentoID INNER JOIN
							 Planta ON DepartamentoPlanta.FKPlantaID = Planta.PlantaID
	WHERE Planta.PlantaID = @filtro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 
-- Description:	Insertar datos en la tabla de empleado.
-- =============================================
CREATE PROCEDURE [dbo].[sp_Empleado_Insertar] 
	-- Add the parameters for the stored procedure here
	@nombre VARCHAR(70),
	@corre VARCHAR(150),
	@FKcategoriaCargo INT,
	@FKDepartamentoPlantaID INT,
	@Estado BIT,
	@EmpleadoID_Jefe INT = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Empleado]
           ([EmpleadoNombre]
           ,[EmpleadoCorreo]
           ,[FKCategoriaCargoID]
           ,[FKDepartamentoPlantaID]
           ,[Estado]
           ,[EmpleadoID_Jefe])
     VALUES
           (@nombre
           ,@corre
           ,@FKcategoriaCargo
           ,@FKDepartamentoPlantaID
           ,@Estado
           ,@EmpleadoID_Jefe)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleado_Planta_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 17/06/2021
-- Description:	Obtiene los empleados segun la planta ingresada
-- =============================================
CREATE PROCEDURE [dbo].[sp_Empleado_Planta_Mostrar] 
	-- Add the parameters for the stored procedure here
	@plantaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Empleado.EmpleadoID AS EmpleadoID, Empleado.EmpleadoNombre AS EmpleadoNombre
	FROM            Empleado INNER JOIN
                         DepartamentoPlanta ON Empleado.FKDepartamentoPlantaID = DepartamentoPlanta.DepartamentoPlantaID INNER JOIN
                         Planta ON DepartamentoPlanta.FKPlantaID = Planta.PlantaID
	WHERE DepartamentoPlanta.FKPlantaID = @plantaId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleados_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 17/06/2021
-- Description:	Actualiza los campos de empleados con los datos insertados
-- =============================================
CREATE PROCEDURE [dbo].[sp_Empleados_Actualizar] 
	-- Add the parameters for the stored procedure here
	@id INT,
	@nombre VARCHAR (70) = NULL,
	@correo VARCHAR (150) = NULL,
	@FKCategoriaCargo INT = NULL,
	@FKDepartamentoPlanta INT = NULL,
	@estado BIT = NULL,
	@jefe INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Empleado]
   SET [EmpleadoNombre] = ISNULL(@nombre, EmpleadoNombre) 
      ,[EmpleadoCorreo] = ISNULL(@correo, EmpleadoCorreo)
      ,[FKCategoriaCargoID] = ISNULL(@FKCategoriaCargo, FKCategoriaCargoID)
      ,[FKDepartamentoPlantaID] = ISNULL (@FKDepartamentoPlanta, FKDepartamentoPlantaID)
      ,[Estado] = ISNULL(@estado, Estado)
      ,[EmpleadoID_Jefe] = ISNULL(@jefe, NULL)
	WHERE EmpleadoID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleados_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 
-- Description:	Muestra los resultados de empleados
-- =============================================
CREATE PROCEDURE [dbo].[sp_Empleados_Mostrar] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Empleado.EmpleadoID AS Id, 
			  Empleado.EmpleadoNombre AS Nombre, 
			  Empleado.EmpleadoCorreo AS Correo, 
			  CASE WHEN Jefe.EmpleadoNombre IS NULL THEN '-' ELSE Jefe.EmpleadoNombre END AS Jefe,
			  Cargo.CargoNombre AS Cargo, Categoria.CategoriaNombre AS Categoria_de_cargo, 
              Departamento.DepartamentoNombre AS Departamento, 
			  Planta.PlantaNombre AS Planta, Pais.PaisNombre AS Pais, 
			  Empleado.Estado, 
			  DepartamentoPlanta.FKPlantaID, 
			  Empleado.FKCategoriaCargoID, 
              Empleado.FKDepartamentoPlantaID,
			  Empleado.EmpleadoID_Jefe

FROM           Empleado Jefe RIGHT JOIN Empleado ON Empleado.EmpleadoID_Jefe = jefe.EmpleadoID
							INNER JOIN
                         DepartamentoPlanta ON Empleado.FKDepartamentoPlantaID = DepartamentoPlanta.DepartamentoPlantaID INNER JOIN
                         Departamento ON DepartamentoPlanta.FKDepartamentoID = Departamento.DepartamentoID INNER JOIN
                         Planta ON DepartamentoPlanta.FKPlantaID = Planta.PlantaID INNER JOIN
                         Pais ON Planta.FKPaisID = Pais.PaisID INNER JOIN
                         CategoriaCargo ON Empleado.FKCategoriaCargoID = CategoriaCargo.CategoriaCargoID INNER JOIN
                         Categoria ON CategoriaCargo.FKCategoriaID = Categoria.CategoriaID INNER JOIN
                         Cargo ON CategoriaCargo.FKCargoID = Cargo.CargoID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pais_Mostar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Muestra todos los pais.
-- =============================================
CREATE PROCEDURE [dbo].[sp_Pais_Mostar] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        PaisID, PaisNombre
FROM            Pais
ORDER BY PaisNombre
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Planta_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Actualiza los campos de la tabla Planta
-- =============================================
CREATE PROCEDURE [dbo].[sp_Planta_Actualizar] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@plantaNombre VARCHAR(100) = NULL,
	@FKPaisID INT = NULL,
	@Estado BIT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	UPDATE Planta
	SET PlantaNombre = ISNULL( @plantaNombre,PlantaNombre),
		FKPaisID = ISNULL(@FKPaisID, FKPaisID),
		Estado = ISNULL(@Estado, Estado)
	WHERE PlantaID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Planta_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Inserta datos en la tabla de Planta
-- =============================================
CREATE PROCEDURE [dbo].[sp_Planta_Insertar] 
	-- Add the parameters for the stored procedure here
	@plantaNombre VARCHAR(100),
	@FKPaisID INT,
	@Estado BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Planta]
           ([PlantaNombre]
           ,[FKPaisID]
		   ,[Estado])
     VALUES
           (@plantaNombre
           ,@FKPaisID
		   ,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Planta_Mostar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Muestra todas las plantas con el nombre del pais en que estan ubicadas.
-- =============================================
CREATE PROCEDURE [dbo].[sp_Planta_Mostar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Planta.PlantaID, Pais.PaisID, Planta.PlantaNombre, Pais.PaisNombre, Planta.Estado
FROM            Planta INNER JOIN
                         Pais ON Planta.FKPaisID = Pais.PaisID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoUsuario_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 23/06/2021
-- Description:	Muestra los diferentes tipos de usuarios en la tabla TipoUsuario.
-- =============================================
CREATE PROCEDURE [dbo].[sp_TipoUsuario_Mostrar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TipoUsuarioID, TipoUsuarioNombre
FROM            TipoUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Empleado_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 23/06/2021
-- Description:	Muestra los empleados actualmente activos en el sistema
-- =============================================
CREATE PROCEDURE [dbo].[sp_Usuario_Empleado_Mostrar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        EmpleadoID, EmpleadoNombre
	FROM            Empleado
	WHERE Empleado.Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_VerificarLogin]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Verifica si el userio y contraseña ingresada son validas en el sistema
-- =============================================
CREATE PROCEDURE [dbo].[sp_Usuario_VerificarLogin] 
	-- Add the parameters for the stored procedure here
	@usuarioNombre VARCHAR(50),
	@Contrasena VARCHAR(50),
	@responseMessage VARCHAR(50)='' OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @userID INT

	IF EXISTS (SELECT TOP 1 Usuario.UsuarioID FROM Usuario WHERE Usuario.UsuarioNombre = @usuarioNombre)
	BEGIN
		SET @userID = (SELECT Usuario.UsuarioID FROM Usuario WHERE Usuario.UsuarioNombre = @usuarioNombre AND 
															 Usuario.Estado = 1 AND
															 Usuario.ContrasenaHash= HASHBYTES('SHA2_512', @Contrasena+CAST(Salt AS varchar(36)))) 

	   IF(@userID IS NULL)
			SET @responseMessage='Incorrecto'
       ELSE 
           SET @responseMessage='Correcto'
	END
	 ELSE
       SET @responseMessage='Invalido'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioEmpleado_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Actualiza los datos de la cuenta del empleado.
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioEmpleado_Actualizar] 
	-- Add the parameters for the stored procedure here
	@usuarioEmpleadoID INT,

	@usuarioNombre VARCHAR(50) = NULL,
	@contrasena VARCHAR(50),
	@FKTipoUsuario INT = NULL,
	@Estado BIT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @usuarioID INT

	SET @usuarioID = (SELECT TOP 1 UsuarioEmpleado.FKUsuarioID FROM UsuarioEmpleado WHERE UsuarioEmpleado.UsuarioEmpleadoID = @usuarioEmpleadoID )

	DECLARE @salt UNIQUEIDENTIFIER=NEWID()

	UPDATE [dbo].[Usuario] 
	SET [UsuarioNombre] = ISNULL(@usuarioNombre, [UsuarioNombre])
		  ,[ContrasenaHash] = HASHBYTES('SHA2_512', @contrasena+CAST(@salt AS VARCHAR(36)))
		  ,[Salt] = @salt
		  ,[FKTipoUsuarioID] = ISNULL(@FKTipoUsuario, FKTipoUsuarioID)
		  ,[Estado] = ISNULL(@Estado, Estado)
	WHERE Usuario.UsuarioID = @usuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioEmpleado_Buscar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 24/06/2021
-- Description:	Verifica si el id de UsuarioEmpleado existe
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioEmpleado_Buscar] 
	-- Add the parameters for the stored procedure here
	@UsuarioEmpleadoID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        UsuarioEmpleadoID
	FROM            UsuarioEmpleado
	WHERE UsuarioEmpleadoID = @UsuarioEmpleadoID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioEmpleado_Buscar_Actualizar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 23/06/2021
-- Description:	Obtiene los datos a actualizar de la cuenta del usuario
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioEmpleado_Buscar_Actualizar] 
	-- Add the parameters for the stored procedure here
	@usuarioEmpleadoID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT         TipoUsuario.TipoUsuarioID, Usuario.UsuarioNombre, Empleado.EmpleadoID, Usuario.Estado
     
FROM            Usuario INNER JOIN
                         TipoUsuario ON Usuario.FKTipoUsuarioID = TipoUsuario.TipoUsuarioID INNER JOIN
                         UsuarioEmpleado ON Usuario.UsuarioID = UsuarioEmpleado.FKUsuarioID INNER JOIN
                         Empleado ON UsuarioEmpleado.FKEmpleadoID = Empleado.EmpleadoID INNER JOIN
                         DepartamentoPlanta ON Empleado.FKDepartamentoPlantaID = DepartamentoPlanta.DepartamentoPlantaID INNER JOIN
                         Planta ON DepartamentoPlanta.FKPlantaID = Planta.PlantaID INNER JOIN
                         Pais ON Planta.FKPaisID = Pais.PaisID
WHERE UsuarioEmpleado.UsuarioEmpleadoID = @usuarioEmpleadoID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioEmpleado_Insertar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Crea una nueva cuenta y la vincula con el id del empleado. Los empleados solo pueden tener una cuenta.
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioEmpleado_Insertar] 
	-- Add the parameters for the stored procedure here
	@usuarioNombre VARCHAR(50),
	@contrasena VARCHAR(50),
	@TipoUsuario INT,
	@Estado BIT,

	@FKEmpleadoID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT TOP 1 FKEmpleadoID FROM UsuarioEmpleado WHERE FKEmpleadoID = @FKEmpleadoID)
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 Usuario.UsuarioID FROM Usuario WHERE Usuario.UsuarioNombre = @usuarioNombre)
		BEGIN
			DECLARE @FKUsuarioID INT
			DECLARE @responseMessage VARCHAR(50) 

			DECLARE @salt UNIQUEIDENTIFIER=NEWID()

			INSERT INTO [dbo].[Usuario]
			   ([UsuarioNombre]
			   ,[ContrasenaHash]
			   ,[Salt]
			   ,[FKTipoUsuarioID]
			   ,[Estado])
			VALUES
			   (@usuarioNombre,
				HASHBYTES('SHA2_512', @contrasena+CAST(@salt AS VARCHAR(36))),
				@salt,
				@TipoUsuario,
				@Estado)

			SET @FKUsuarioID = SCOPE_IDENTITY()

			INSERT INTO [dbo].[UsuarioEmpleado]
			   ([FKUsuarioID]
			   ,[FKEmpleadoID])
			 VALUES
			   (@FKUsuarioID
			   ,@FKEmpleadoID)

			   SET @responseMessage = 'Exito'
		END
		ELSE
			SET @responseMessage = 'Existente'
	END
	ELSE
		SET @responseMessage = 'CuentaExistente'
	SELECT  @responseMessage AS Respuesta
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioEmpleado_Mostrar]    Script Date: 6/29/2021 10:18:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francisco Madrid
-- Create date: 22/06/2021
-- Description:	Muestra los usuarios existentes segun su planta y pais.
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioEmpleado_Mostrar] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        UsuarioEmpleado.UsuarioEmpleadoID, TipoUsuario.TipoUsuarioID, Empleado.EmpleadoNombre, Empleado.EmpleadoCorreo, Usuario.UsuarioNombre, TipoUsuario.TipoUsuarioNombre, Planta.PlantaNombre, Pais.PaisNombre, Usuario.Estado
     
FROM            Usuario INNER JOIN
                         TipoUsuario ON Usuario.FKTipoUsuarioID = TipoUsuario.TipoUsuarioID INNER JOIN
                         UsuarioEmpleado ON Usuario.UsuarioID = UsuarioEmpleado.FKUsuarioID INNER JOIN
                         Empleado ON UsuarioEmpleado.FKEmpleadoID = Empleado.EmpleadoID INNER JOIN
                         DepartamentoPlanta ON Empleado.FKDepartamentoPlantaID = DepartamentoPlanta.DepartamentoPlantaID INNER JOIN
                         Planta ON DepartamentoPlanta.FKPlantaID = Planta.PlantaID INNER JOIN
                         Pais ON Planta.FKPaisID = Pais.PaisID
END
GO
USE [master]
GO
ALTER DATABASE [HanesTalentManagement] SET  READ_WRITE 
GO
