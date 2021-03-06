USE [master]
GO
/****** Object:  Database [SAGE_Educacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE DATABASE [SAGE_Educacao] ON  PRIMARY 
( NAME = N'SAGE_Educacao', FILENAME = N'F:\SQL2008R2\DADOS\SAGE_Educacao.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ), 
 FILEGROUP [DADOS]  DEFAULT
( NAME = N'SAGE_Educaocao_DADOS', FILENAME = N'F:\SQL2008R2\DADOS\SAGE_Educaocao_DADOS.ndf' , SIZE = 262144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 131072KB )
 LOG ON 
( NAME = N'SAGE_Educacao_log', FILENAME = N'E:\SQL2008R2\TLOGS\SAGE_Educacao_log.ldf' , SIZE = 131072KB , MAXSIZE = 2048GB , FILEGROWTH = 131072KB )
GO
ALTER DATABASE [SAGE_Educacao] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAGE_Educacao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAGE_Educacao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAGE_Educacao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAGE_Educacao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SAGE_Educacao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAGE_Educacao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAGE_Educacao] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SAGE_Educacao] SET  MULTI_USER 
GO
ALTER DATABASE [SAGE_Educacao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAGE_Educacao] SET DB_CHAINING OFF 
GO
USE [SAGE_Educacao]
GO
/****** Object:  User [usr_sap]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [usr_sap] FOR LOGIN [usr_sap] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usr_infraprd]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [usr_infraprd] FOR LOGIN [usr_infraprd] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\suelit]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\suelit] FOR LOGIN [SAGEBR\suelit] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\sueli]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\sueli] FOR LOGIN [SAGEBR\sueli] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\robertof]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\robertof] FOR LOGIN [SAGEBR\robertof] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\rafaelp]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\rafaelp] FOR LOGIN [SAGEBR\rafaelp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\paulo.mendes]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\paulo.mendes] FOR LOGIN [SAGEBR\paulo.mendes] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\fabiol]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\fabiol] FOR LOGIN [SAGEBR\fabiol] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAGEBR\evandrom]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [SAGEBR\evandrom] FOR LOGIN [SAGEBR\evandrom] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [app_educacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE USER [app_educacao] FOR LOGIN [app_educacao] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_sap]
GO
ALTER ROLE [db_datareader] ADD MEMBER [usr_infraprd]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [usr_infraprd]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\suelit]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\sueli]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\robertof]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\rafaelp]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SAGEBR\paulo.mendes]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\fabiol]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAGEBR\evandrom]
GO
ALTER ROLE [db_datareader] ADD MEMBER [app_educacao]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [app_educacao]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alerta]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alerta](
	[IdAlerta] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoAlerta] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Lido] [bit] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Alerta] PRIMARY KEY CLUSTERED 
(
	[IdAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ano]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ano](
	[IdAno] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](6) NULL,
 CONSTRAINT [PK_ANO] PRIMARY KEY CLUSTERED 
(
	[IdAno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Area]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaTematica]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaTematica](
	[IdAreaTematica] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_dbo.AreaTematica] PRIMARY KEY CLUSTERED 
(
	[IdAreaTematica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArquivoLogistica]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArquivoLogistica](
	[IdArquivoLogistica] [int] IDENTITY(1,1) NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[IdTurma] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ArquivoLogistica] PRIMARY KEY CLUSTERED 
(
	[IdArquivoLogistica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArquivoReembolso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArquivoReembolso](
	[IdArquivoReembolso] [int] IDENTITY(1,1) NOT NULL,
	[IdSolicitacaoReembolso] [int] NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[Arquivo] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.ArquivoReembolso] PRIMARY KEY CLUSTERED 
(
	[IdArquivoReembolso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArquivosControlePgto]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArquivosControlePgto](
	[IdArquivosControlePgto] [int] IDENTITY(1,1) NOT NULL,
	[IdControlePagtoInstrutor] [int] NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[Arquivo] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.ArquivosControlePgto] PRIMARY KEY CLUSTERED 
(
	[IdArquivosControlePgto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atividade](
	[IdAtividade] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoAtividade] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Ordenacao] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Atividade] PRIMARY KEY CLUSTERED 
(
	[IdAtividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtividadeLogistica]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtividadeLogistica](
	[IdAtividadeLogistica] [int] IDENTITY(1,1) NOT NULL,
	[TurmaOferta_IdTurmaOferta] [int] NULL,
	[IdAtividade] [int] NOT NULL,
	[DataLimite] [datetime] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[DataConclusao] [datetime] NULL,
	[DataConclusaoPrevista] [datetime] NULL,
	[IdTurma] [int] NOT NULL DEFAULT ((0)),
	[IdTipoSituacao] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.AtividadeLogistica] PRIMARY KEY CLUSTERED 
(
	[IdAtividadeLogistica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtividadeMaterial]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtividadeMaterial](
	[IdAtividadeMaterial] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdAtividade] [int] NOT NULL,
	[Observacao] [varchar](100) NULL,
	[IdTipoSituacao] [int] NULL,
	[DataConclusao] [datetime] NULL,
	[DataConclusaoPrevista] [datetime] NOT NULL,
	[DataLimite] [datetime] NULL,
	[Descricao] [nchar](100) NULL,
 CONSTRAINT [PK_dbo.AtividadeMaterial] PRIMARY KEY CLUSTERED 
(
	[IdAtividadeMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avaliacao](
	[IdAvaliacao] [int] IDENTITY(1,1) NOT NULL,
	[IdAvaliacaoResposta] [uniqueidentifier] NOT NULL,
	[IdQuestaoAvaliacao] [int] NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdParticipante] [int] NULL,
	[IdInstrutor] [int] NULL,
	[Anonimo] [bit] NOT NULL,
	[Resultado] [varchar](100) NOT NULL,
	[Comentario] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Avaliacao] PRIMARY KEY CLUSTERED 
(
	[IdAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvaliacaoParticipante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvaliacaoParticipante](
	[IdAvaliacaoParticipante] [int] IDENTITY(1,1) NOT NULL,
	[IdAvaliacaoTurma] [int] NOT NULL,
	[IdParticipante] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AvaliacaoParticipante] PRIMARY KEY CLUSTERED 
(
	[IdAvaliacaoParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[AvaliacaoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvaliacaoTurma](
	[IdAvaliacaoTurma] [int] IDENTITY(1,1) NOT NULL,
	[IdAvaliacao] [int] NOT NULL,
	[IdIndicacaoCurso] [int] NOT NULL,
	[IdDecisaoParticipacao] [int] NOT NULL,
	[Formacao] [varchar](100) NULL,
	[AnoConclusao] [int] NULL,
	[CargoAtual] [varchar](100) NULL,
	[AvaliacaoRecepcao] [int] NULL,
	[DescricaoAvaliacaoRecepcao] [varchar](100) NULL,
	[AvaliacaoAlimentacao] [int] NULL,
	[DescricaoAvaliacaoAlimentacao] [varchar](100) NULL,
	[AvalicaoInfra] [int] NULL,
	[DescricaoAvaliacaoInfra] [varchar](100) NULL,
	[QuerNovoCurso] [bit] NOT NULL,
	[Indicaria] [bit] NOT NULL,
	[AutorizaEmail] [bit] NOT NULL,
	[Sugestao] [varchar](100) NULL,
	[Anonimo] [bit] NOT NULL,
	[OutrosMotivosDecisao] [varchar](100) NULL,
	[OutrosMotivosIndicacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.AvaliacaoTurma] PRIMARY KEY CLUSTERED 
(
	[IdAvaliacaoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvaliacaoTurmaInstrutor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvaliacaoTurmaInstrutor](
	[IdAvaliacaoTurmaInstrutor] [int] IDENTITY(1,1) NOT NULL,
	[IdAvaliacaoTurma] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[NotaMaterialDidatico] [int] NOT NULL,
	[MaterialDidatico] [varchar](100) NULL,
	[NotaCagahoraria] [int] NOT NULL,
	[Cagahoraria] [varchar](100) NULL,
	[NotaConhecimento] [int] NOT NULL,
	[Conhecimento] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.AvaliacaoTurmaInstrutor] PRIMARY KEY CLUSTERED 
(
	[IdAvaliacaoTurmaInstrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banco](
	[IdBanco] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Banco] PRIMARY KEY CLUSTERED 
(
	[IdBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Budget]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Budget](
	[IdBudget] [int] IDENTITY(1,1) NOT NULL,
	[IdPeriodoBudget] [int] NOT NULL,
	[Versao] [varchar](100) NULL,
	[AnoFiscal] [int] NOT NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Budget] PRIMARY KEY CLUSTERED 
(
	[IdBudget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BudgetItem]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BudgetItem](
	[IdBudgetItem] [int] IDENTITY(1,1) NOT NULL,
	[IdBudget] [int] NOT NULL,
	[IdCustoDespesa] [int] NOT NULL,
	[IdCanalVendas] [int] NOT NULL,
	[IdFormato] [int] NOT NULL,
	[Quantidade] [int] NULL,
	[Mes] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BudgetItem] PRIMARY KEY CLUSTERED 
(
	[IdBudgetItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[CanalVendas]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CanalVendas](
	[IdCanalVendas] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.CanalVendas] PRIMARY KEY CLUSTERED 
(
	[IdCanalVendas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Cargo] PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Certificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificacao](
	[IdCertificacao] [int] IDENTITY(1,1) NOT NULL,
	[IdParticipante] [int] NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdTipoCertificacao] [int] NOT NULL,
	[Frequecia] [int] NULL,
 CONSTRAINT [PK_dbo.Certificacao] PRIMARY KEY CLUSTERED 
(
	[IdCertificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [float] NOT NULL DEFAULT ((0)),
	[DtCriacao] [smalldatetime] NOT NULL CONSTRAINT [DF_Cliente_DtCriacao]  DEFAULT (getdate()),
 CONSTRAINT [PK_dbo.Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[ClienteInadimplencia]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClienteInadimplencia](
	[IdClienteInadimplencia] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[cod_produto] [varchar](100) NULL,
	[cod_pedido_sirius] [varchar](100) NULL,
	[cod_cliente_sirius] [varchar](100) NULL,
	[DataPedido] [datetime] NULL,
	[dta_vencimento] [datetime] NULL,
	[vlr_pendente] [decimal](18, 2) NULL,
	[vlr_atualizado] [decimal](18, 2) NULL,
	[dsc_observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.ClienteInadimplencia] PRIMARY KEY CLUSTERED 
(
	[IdClienteInadimplencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientePF]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientePF](
	[IdClientePF] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[Apelido] [varchar](100) NULL,
	[CPF] [varchar](100) NULL,
	[Endereco] [varchar](40) NULL,
	[Cidade] [varchar](40) NULL,
	[UF] [varchar](2) NULL,
	[CEP] [varchar](8) NULL,
 CONSTRAINT [PK_dbo.ClientePF] PRIMARY KEY CLUSTERED 
(
	[IdClientePF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientePJ]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientePJ](
	[IdClientePJ] [int] IDENTITY(1,1) NOT NULL,
	[RazaoSocial] [varchar](100) NULL,
	[NomeFantasia] [varchar](100) NULL,
	[Cnpj] [varchar](100) NULL,
	[InscricaoEstadual] [varchar](100) NULL,
	[IdCliente] [int] NOT NULL,
	[Endereco] [varchar](40) NULL,
	[Cidade] [varchar](40) NULL,
	[UF] [varchar](2) NULL,
	[CEP] [varchar](8) NULL,
 CONSTRAINT [PK_dbo.ClientePJ] PRIMARY KEY CLUSTERED 
(
	[IdClientePJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contato]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contato](
	[IdContato] [int] IDENTITY(1,1) NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdCargo] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Contato] PRIMARY KEY CLUSTERED 
(
	[IdContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContatoEmail]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContatoEmail](
	[IdContatoEmail] [int] IDENTITY(1,1) NOT NULL,
	[IdContato] [int] NOT NULL,
	[Email] [varchar](100) NULL CONSTRAINT [DF_ContatoEmail_Email]  DEFAULT ('a cadastrar'),
	[Principal] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ContatoEmail] PRIMARY KEY CLUSTERED 
(
	[IdContatoEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContatoEndereco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContatoEndereco](
	[IdContatoEndereco] [int] IDENTITY(1,1) NOT NULL,
	[IdContato] [int] NOT NULL,
	[IdEndereco] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ContatoEndereco] PRIMARY KEY CLUSTERED 
(
	[IdContatoEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[ContatoFone]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContatoFone](
	[IdContatoFone] [int] IDENTITY(1,1) NOT NULL,
	[IdContato] [int] NOT NULL,
	[DDD] [varchar](100) NULL,
	[Telefone] [varchar](100) NULL,
	[Ramal] [varchar](100) NULL,
	[Principal] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ContatoFone] PRIMARY KEY CLUSTERED 
(
	[IdContatoFone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ControlePagtoInstrutor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlePagtoInstrutor](
	[IdControlePagtoInstrutor] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoQuinze] [varchar](100) NULL,
	[IdPeriodoPagtoIERPA] [int] NOT NULL,
	[IdPeriodoPgtoIENF] [int] NOT NULL,
	[IdTipoPeriodoPgtoIENF] [varchar](100) NULL,
	[IdPeriodoPagtoET] [int] NOT NULL,
	[IdFormaRemuneracao] [int] NOT NULL,
	[vlr_hora] [decimal](18, 2) NULL,
	[qtd_hora] [int] NULL,
	[tpo_turno] [int] NULL,
 CONSTRAINT [PK_dbo.ControlePagtoInstrutor] PRIMARY KEY CLUSTERED 
(
	[IdControlePagtoInstrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CreditoCliente]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditoCliente](
	[IdCreditoCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[cod_pedido_sirius] [varchar](100) NULL,
	[cod_cliente_sirius] [varchar](100) NULL,
	[DataPedido] [datetime] NULL,
	[DataPgto] [datetime] NULL,
	[DataLiberaCredito] [datetime] NULL,
	[DataVencimento] [datetime] NULL,
	[ValorPedido] [decimal](18, 2) NULL,
	[ValorCreditoGerado] [decimal](18, 2) NULL,
	[DataUtilizacao] [datetime] NULL,
	[TipoUtilizacao] [varchar](100) NULL,
	[cod_pedido_utilizacao] [varchar](100) NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.CreditoCliente] PRIMARY KEY CLUSTERED 
(
	[IdCreditoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CriterioCertificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CriterioCertificacao](
	[IdCriterioCertificacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.CriterioCertificacao] PRIMARY KEY CLUSTERED 
(
	[IdCriterioCertificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCurso] [varchar](15) NULL,
	[IdTipoCurso] [int] NOT NULL,
	[IdPeriodicidade] [int] NOT NULL,
	[Titulo] [varchar](256) NULL,
	[Subtitulo] [varchar](max) NULL,
	[Vigente] [bit] NOT NULL,
	[PontuacaoCRC] [varchar](100) NULL,
	[Modular] [bit] NOT NULL,
	[AreaTematica_IdAreaTematica] [int] NULL,
 CONSTRAINT [PK_dbo.Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoAreaTematica]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoAreaTematica](
	[IdCursoAreaTematica] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdAreaTematica] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CursoAreaTematica] PRIMARY KEY CLUSTERED 
(
	[IdCursoAreaTematica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[CursoHistorico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CursoHistorico](
	[IdCursoHistorico] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[IdUsuario] [int] NULL,
	[Motivo] [varchar](300) NULL,
	[IdStatus] [int] NULL,
	[Acao] [varchar](100) NULL,
	[Data] [datetime] NULL,
 CONSTRAINT [PK_CursoHistorico] PRIMARY KEY CLUSTERED 
(
	[IdCursoHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoModulo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CursoModulo](
	[IdCursoModulo] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[Sequencia] [int] NULL,
	[Titulo] [varchar](256) NULL,
	[Conteudo] [varchar](max) NULL,
	[CargaHorariaBase] [int] NULL CONSTRAINT [DF_CursoModulo_CargaHorariaBase]  DEFAULT ((0)),
	[CargaHorariaBaseMin] [int] NULL CONSTRAINT [DF_CursoModulo_CargaHorariaBaseMin]  DEFAULT ((0)),
 CONSTRAINT [PK_dbo.CursoModulo] PRIMARY KEY CLUSTERED 
(
	[IdCursoModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoTopico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CursoTopico](
	[IdCursoTopico] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdTopico] [int] NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Exibir] [bit] NOT NULL,
	[Descricao] [varchar](max) NULL,
	[Ordenacao] [int] NULL,
 CONSTRAINT [PK_dbo.CursoTopico] PRIMARY KEY CLUSTERED 
(
	[IdCursoTopico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustoDespesa]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustoDespesa](
	[IdCustoDespesa] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[CentroCusto] [varchar](100) NULL,
	[ContaContabil] [varchar](100) NULL,
	[IdOperacaoContabil] [int] NOT NULL,
	[CodigoServicoExterno] [int] NOT NULL,
	[IdTipoDespesa] [int] NULL,
 CONSTRAINT [PK_dbo.CustoDespesa] PRIMARY KEY CLUSTERED 
(
	[IdCustoDespesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DecisaoParticipacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DecisaoParticipacao](
	[IdDecisaoParticipacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.DecisaoParticipacao] PRIMARY KEY CLUSTERED 
(
	[IdDecisaoParticipacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiasEntregaMaterial]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiasEntregaMaterial](
	[IdDiasEntregaMaterial] [int] IDENTITY(1,1) NOT NULL,
	[IdMunicipio] [int] NOT NULL,
	[QtdeDias] [int] NULL,
	[DataCadastro] [datetime] NULL,
	[opt_combinar] [varchar](100) NULL,
	[IdAtividade] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DiasEntregaMaterial] PRIMARY KEY CLUSTERED 
(
	[IdDiasEntregaMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailGrupo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailGrupo](
	[idEmailGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](200) NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_EmailGrupo] PRIMARY KEY CLUSTERED 
(
	[idEmailGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailNotificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailNotificacao](
	[idEmailNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[idEmailGrupo] [int] NOT NULL,
	[Nome] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Departamento] [varchar](100) NULL,
	[Cargo] [varchar](100) NULL,
	[Ativo] [bit] NULL,
	[DataCadastro] [datetime] NULL,
 CONSTRAINT [PK_EmailNotificacao] PRIMARY KEY CLUSTERED 
(
	[idEmailNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Endereco](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[IdMunicipio] [int] NOT NULL,
	[CEP] [varchar](8) NULL,
	[Bairro] [varchar](100) NULL,
	[Logradouro] [varchar](100) NULL,
	[IdTipoLogradouro] [int] NOT NULL,
	[Numero] [varchar](8) NOT NULL,
	[Complemento] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Endereco] PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnderecoReferencia]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnderecoReferencia](
	[IdEnderecoReferencia] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEndereco] [int] NOT NULL,
	[IdEndereco] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EnderecoReferencia] PRIMARY KEY CLUSTERED 
(
	[IdEnderecoReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Estado]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[UF] [varchar](100) NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoCivil]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoCivil](
	[IdEstadoCivil] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.EstadoCivil] PRIMARY KEY CLUSTERED 
(
	[IdEstadoCivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[IdEvento] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Evento] PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventoEspecial]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoEspecial](
	[IdEventoEspecial] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[IdTurma] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EventoEspecial] PRIMARY KEY CLUSTERED 
(
	[IdEventoEspecial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Faturamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Faturamento](
	[IdFaturamento] [int] IDENTITY(1,1) NOT NULL,
	[IdPedidoVendaParticipante] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[DataEnvioUnisys] [datetime] NULL,
	[DataRetornoUnisys] [datetime] NULL,
	[DataFaturamento] [datetime] NULL,
	[NFSe] [varchar](100) NULL,
	[LinkNFSe] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Faturamento] PRIMARY KEY CLUSTERED 
(
	[IdFaturamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaRemuneracao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaRemuneracao](
	[IdFormaRemuneracao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.FormaRemuneracao] PRIMARY KEY CLUSTERED 
(
	[IdFormaRemuneracao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formato]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formato](
	[IdFormato] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[ExisteRegiao] [bit] NOT NULL,
	[BloqueioAgenda] [bit] NOT NULL,
	[VisivelCurso] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Formato] PRIMARY KEY CLUSTERED 
(
	[IdFormato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormatoSalaTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormatoSalaTreinamento](
	[IdFormatoSalaTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.FormatoSalaTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdFormatoSalaTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[IdFornecedor] [int] IDENTITY(1,1) NOT NULL,
	[RazaoSocial] [varchar](100) NULL,
	[NomeFantasia] [varchar](100) NULL CONSTRAINT [DF_Fornecedor_NomeFantasia]  DEFAULT ('.'),
	[IdTipoSituacao] [int] NOT NULL,
	[InscricaoMunicipal] [varchar](11) NOT NULL,
	[InscricaoEstadual] [varchar](12) NULL,
	[CNPJ] [varchar](18) NULL,
	[CNAE] [varchar](9) NULL,
	[Instrutor] [bit] NOT NULL,
	[IdTipoFornecedor] [int] NULL,
	[EhPatrocinador] [bit] NOT NULL CONSTRAINT [DF_Fornecedor_Patrocinador]  DEFAULT ((0)),
	[OptanteSimples] [bit] NULL,
	[IdInstrutor] [int] NULL,
	[TemLocalTreinamento] [bit] NULL,
	[CPF] [varchar](14) NULL,
	[RG] [varchar](16) NULL,
	[DataNascimento] [datetime] NULL,
	[IdEstadoCivil] [int] NULL,
	[Nome] [varchar](100) NULL,
	[PIS] [varchar](11) NULL,
	[UsuarioCadastro] [varchar](100) NULL,
	[DataUltimaAlteracao] [datetime] NULL,
	[UsuarioUltimaAlteracao] [varchar](100) NULL,
	[Observacao] [varchar](5000) NULL,
	[DataCadastro] [datetime] NULL,
	[DDD1] [varchar](100) NULL,
	[TEL1] [varchar](100) NULL,
	[RAMAL1] [varchar](100) NULL,
	[DDD2] [varchar](100) NULL,
	[TEL2] [varchar](100) NULL,
	[RAMAL2] [varchar](100) NULL,
	[EMAIL1] [varchar](100) NULL,
	[EMAIL2] [varchar](100) NULL,
	[PJ] [bit] NULL CONSTRAINT [DF_Fornecedor_PJ]  DEFAULT ((1)),
 CONSTRAINT [PK_dbo.Fornecedor] PRIMARY KEY CLUSTERED 
(
	[IdFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FornecedorContato]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FornecedorContato](
	[IdFornecedorContato] [int] IDENTITY(1,1) NOT NULL,
	[IdContato] [int] NOT NULL,
	[IdFornecedor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FornecedorContato] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[FornecedorDadosBancario]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FornecedorDadosBancario](
	[IdFornecedorDadosBancario] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[IdBanco] [int] NOT NULL,
	[Conta] [varchar](11) NULL,
	[ContaDigito] [varchar](2) NULL,
	[Agencia] [varchar](6) NULL,
	[AgenciaDigito] [varchar](2) NULL,
 CONSTRAINT [PK_dbo.FornecedorDadosBancario] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorDadosBancario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FornecedorEndereco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FornecedorEndereco](
	[IdFornecedorEndereco] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[IdEndereco] [int] NOT NULL,
	[Principal] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.FornecedorEndereco] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[FornecedorPF]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FornecedorPF](
	[IdFornecedorPF] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[RG] [varchar](16) NULL,
	[DataNascimento] [datetime] NULL,
	[IdEstadoCivil] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[PIS] [varchar](11) NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FornecedorPF] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FornecedorPFDependente]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FornecedorPFDependente](
	[IdFornecedorPFDependente] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedorPF] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[DataNascimento] [datetime] NULL,
	[IdParentesco] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FornecedorPFDependente] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorPFDependente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FornecedorPJ]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FornecedorPJ](
	[IdFornecedorPJ] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[CNPJ] [varchar](18) NOT NULL,
	[InscricaoEstadual] [varchar](12) NOT NULL,
	[CNAE] [varchar](9) NOT NULL,
	[RazaoSocial] [varchar](100) NULL,
	[NomeFantasia] [varchar](100) NULL,
	[Observacao] [varchar](100) NULL,
	[OptanteSimples] [bit] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[TemLocalTreinamento] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.FornecedorPJ] PRIMARY KEY CLUSTERED 
(
	[IdFornecedorPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funcionalidade]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funcionalidade](
	[IdFuncionalidade] [int] IDENTITY(1,1) NOT NULL,
	[dsc_nome_funcional] [varchar](100) NULL,
	[dsc_descricao] [varchar](100) NULL,
	[tpo_status] [int] NULL,
	[dsc_chamada] [varchar](100) NULL,
	[dta_cadastro] [datetime] NULL,
 CONSTRAINT [PK_dbo.Funcionalidade] PRIMARY KEY CLUSTERED 
(
	[IdFuncionalidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndicacaoCurso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndicacaoCurso](
	[IdIndicacaoCurso] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.IndicacaoCurso] PRIMARY KEY CLUSTERED 
(
	[IdIndicacaoCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instrutor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Instrutor](
	[IdInstrutor] [int] IDENTITY(1,1) NOT NULL,
	[Fornecedor_IdFornecedor] [int] NULL,
	[IdTipoEquipe] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[TipoSituacao] [varchar](100) NULL,
	[Foto] [varbinary](max) NULL,
	[CPF] [varchar](14) NULL,
	[CRC] [varchar](50) NULL,
	[OAB] [varchar](50) NULL,
	[NomeCompleto] [varchar](100) NULL,
	[Apelido] [varchar](100) NULL,
	[RG] [varchar](16) NULL,
	[Sintese] [varchar](max) NULL,
	[Observacao] [varchar](100) NULL,
	[CodigoFuncionario] [int] NULL,
	[Vigencia] [bit] NOT NULL CONSTRAINT [DF__Instrutor__Vigen__04308F6E]  DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Instrutor] PRIMARY KEY CLUSTERED 
(
	[IdInstrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InstrutorArea]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorArea](
	[IdInstrutorArea] [int] IDENTITY(1,1) NOT NULL,
	[IdAreaTematica] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.InstrutorArea] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[InstrutorContato]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorContato](
	[IdInstrutorContato] [int] IDENTITY(1,1) NOT NULL,
	[IdContato] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.InstrutorContato] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[InstrutorDocumento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstrutorDocumento](
	[IdInstrutorDocumento] [int] IDENTITY(1,1) NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[DataUpload] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.InstrutorDocumento] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InstrutorEvento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorEvento](
	[IdInstrutorEvento] [int] IDENTITY(1,1) NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[IdEvento] [int] NOT NULL,
	[IdTipoPeriodo] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.InstrutorEvento] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[InstrutorFormaRemuneracao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorFormaRemuneracao](
	[IdInstrutorFormaRemuneracao] [int] IDENTITY(1,1) NOT NULL,
	[IdFormaRemuneracao] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.InstrutorFormaRemuneracao] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorFormaRemuneracao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[InstrutorRegiaoTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorRegiaoTreinamento](
	[IdInstrutorRegiaoTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[IdRegiaoTreinamento] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.InstrutorRegiaoTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorRegiaoTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[InstrutorTurmaCursoModuloData]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrutorTurmaCursoModuloData](
	[IdInstrutorTurmaCursoModuloData] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaCursoModulo] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[Data] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
	[IdTipoPeriodo] [int] NOT NULL DEFAULT ((0)),
	[Inicio] [time](7) NOT NULL DEFAULT ('00:00:00'),
	[Fim] [time](7) NOT NULL DEFAULT ('00:00:00'),
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_dbo.InstrutorTurmaCursoModuloData] PRIMARY KEY CLUSTERED 
(
	[IdInstrutorTurmaCursoModuloData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[LocalRealizacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalRealizacao](
	[IdLocalRealizacao] [int] IDENTITY(1,1) NOT NULL,
	[IdLocalTreinamento] [int] NOT NULL,
	[IdTurmaCursoModulo] [int] NOT NULL,
	[LimiteVaga] [int] NOT NULL,
	[IdSalaTreinamento] [int] NOT NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Inicio] [time](7) NULL,
	[Fim] [time](7) NULL,
	[IdTurmaOferta] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LocalRealizacao] PRIMARY KEY CLUSTERED 
(
	[IdLocalRealizacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[LocalTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocalTreinamento](
	[IdLocalTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedorEndereco] [int] NOT NULL,
	[FormatoSalaTreinamento_IdFormatoSalaTreinamento] [int] NULL,
	[Descricao] [varchar](100) NULL,
	[Observacao] [varchar](256) NULL,
 CONSTRAINT [PK_dbo.LocalTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdLocalTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogErroSage]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogErroSage](
	[IdLogErro] [int] IDENTITY(1,1) NOT NULL,
	[NumeroErro] [varchar](50) NULL,
	[Mensagem] [varchar](max) NULL,
	[DataErro] [datetime] NULL,
	[EventoSage] [varchar](500) NULL,
	[Usuario] [varchar](50) NULL,
 CONSTRAINT [PK_LogErroSage] PRIMARY KEY CLUSTERED 
(
	[IdLogErro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogEvento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogEvento](
	[IdLogEvento] [int] IDENTITY(1,1) NOT NULL,
	[Data] [datetime] NOT NULL,
	[IdChave] [int] NOT NULL,
	[IdFuncionalidade] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[DescricaoChave] [varchar](100) NULL,
	[Acao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.LogEvento] PRIMARY KEY CLUSTERED 
(
	[IdLogEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogisticaCustoDespesa]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogisticaCustoDespesa](
	[IdLogisticaCustoDespesa] [int] IDENTITY(1,1) NOT NULL,
	[IdCustoDespesa] [int] NOT NULL,
	[Quantidade] [int] NULL,
	[ValorUnidade] [decimal](18, 2) NULL,
	[Observacao] [varchar](100) NULL,
	[IdTurma] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LogisticaCustoDespesa] PRIMARY KEY CLUSTERED 
(
	[IdLogisticaCustoDespesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logo](
	[IdLogo] [int] IDENTITY(1,1) NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[Descricao] [varchar](100) NULL,
	[DataCadastro] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Logo] PRIMARY KEY CLUSTERED 
(
	[IdLogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaterialDidatico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaterialDidatico](
	[IdMaterialDidatico] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdInstrutorDocumento] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.MaterialDidatico] PRIMARY KEY CLUSTERED 
(
	[IdMaterialDidatico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] NOT NULL,
	[NomeMenu] [varchar](50) NULL,
	[ParentMenu] [int] NULL,
	[Link] [varchar](250) NULL,
	[OrdemMenu] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mes]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mes](
	[IdMes] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](30) NULL,
 CONSTRAINT [PK_MES] PRIMARY KEY CLUSTERED 
(
	[IdMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipio](
	[IdMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Municipio] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notificacao](
	[IdNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[TipoAlerta] [int] NULL,
	[TipoAcao] [varchar](200) NULL,
	[Destinatario] [varchar](max) NULL,
	[Mensagem] [varchar](max) NULL,
	[DataNotificacao] [datetime] NULL,
	[cod_perfil_notificacao] [int] NULL,
	[IdAlerta] [int] NULL,
	[dataEnvio] [datetime] NULL,
 CONSTRAINT [PK_dbo.Notificacao] PRIMARY KEY CLUSTERED 
(
	[IdNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificacaoCursos]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificacaoCursos](
	[IdNotificacaoCursos] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdFatura] [bigint] NOT NULL,
	[IdFaturaItem] [bigint] NOT NULL,
	[IdProduto] [bigint] NOT NULL,
	[Destinatario] [varchar](200) NULL,
	[AssuntoEmail] [varchar](300) NULL,
	[CorpoEmail] [varchar](max) NULL,
	[DataInclusao] [smalldatetime] NULL,
 CONSTRAINT [PK_NotificacaoCursos] PRIMARY KEY CLUSTERED 
(
	[IdNotificacaoCursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OperacaoContabil]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OperacaoContabil](
	[IdOperacaoContabil] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.OperacaoContabil] PRIMARY KEY CLUSTERED 
(
	[IdOperacaoContabil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrcamentoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrcamentoTurma](
	[IdOrcamentoTurma] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[ValorUnitario] [decimal](18, 2) NULL,
	[PercentualEquipeVenda] [decimal](18, 2) NULL,
	[ValorReceita] [decimal](18, 2) NULL,
	[ValorTotalCusto] [decimal](18, 2) NULL,
	[Participante] [int] NULL,
	[ValorImposto] [decimal](18, 2) NULL,
	[ValorReceitaOutros] [decimal](18, 2) NULL,
	[ValorReceitaVendas] [decimal](18, 2) NULL,
 CONSTRAINT [PK_dbo.OrcamentoTurma] PRIMARY KEY CLUSTERED 
(
	[IdOrcamentoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[OrcamentoTurmaCustoDespesa]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrcamentoTurmaCustoDespesa](
	[IdOrcamentoTurmaCustoDespesa] [int] IDENTITY(1,1) NOT NULL,
	[IdOrcamentoTurma] [int] NOT NULL,
	[IdCustoDespesa] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorRealizado] [decimal](18, 2) NULL,
	[QuantidadeRealizado] [int] NULL,
	[Observacao] [varchar](200) NULL,
 CONSTRAINT [PK_dbo.OrcamentoTurmaCustoDespesa] PRIMARY KEY CLUSTERED 
(
	[IdOrcamentoTurmaCustoDespesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parentesco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parentesco](
	[IdParentesco] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Parentesco] PRIMARY KEY CLUSTERED 
(
	[IdParentesco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Participante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Participante](
	[IdParticipante] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[CPF] [varchar](100) NULL,
	[RG] [varchar](100) NULL,
	[Departamento] [varchar](100) NULL,
	[Cargo] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[DataNascimento] [datetime] NULL,
	[CRC] [varchar](30) NULL,
	[dddFixo] [varchar](3) NULL,
	[FoneFixo] [varchar](10) NULL,
	[dddCelular] [varchar](3) NULL,
	[FoneCelular] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.Participante] PRIMARY KEY CLUSTERED 
(
	[IdParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patrocinador]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patrocinador](
	[IdPatrocinador] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[IdTipoPatrocinador] [int] NOT NULL,
	[ImagemLogo] [varbinary](max) NULL,
	[IdTurma] [int] NOT NULL,
	[DataCadastro] [datetime] NULL,
	[UsuarioCadastro] [varchar](100) NULL,
	[DataUltimaAlteracao] [datetime] NULL,
	[UsuarioUltimaAlteracao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Patrocinador] PRIMARY KEY CLUSTERED 
(
	[IdPatrocinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidosFaturasCRM]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosFaturasCRM](
	[IdPedidosFaturasCRM] [bigint] IDENTITY(1,1) NOT NULL,
	[NrPedido] [bigint] NOT NULL,
	[NrFatura] [bigint] NOT NULL,
	[DtCriacao] [datetime] NULL,
	[DtIntegracao] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_PedidosFaturasCRM] PRIMARY KEY CLUSTERED 
(
	[IdPedidosFaturasCRM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[PedidoVenda]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoVenda](
	[IdPedidoVenda] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTipoSituacao] [int] NOT NULL,
	[IdVendedor] [int] NOT NULL,
	[IdCanalVendas] [int] NOT NULL,
	[CodigoPedidoVenda] [bigint] NOT NULL,
	[Quantidade] [int] NULL,
	[FormaPagto] [int] NOT NULL,
	[DataPedido] [datetime] NULL,
	[Valor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.PedidoVenda] PRIMARY KEY CLUSTERED 
(
	[IdPedidoVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[PedidoVendaItem]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoVendaItem](
	[IdPedidoVendaItem] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdPedidoVenda] [int] NOT NULL,
	[IdTipoSituacao] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[ValorBase] [decimal](18, 2) NOT NULL,
	[CodigoPedidoVendaItem] [float] NOT NULL DEFAULT ((0)),
	[CodigoNF] [bigint] NULL,
 CONSTRAINT [PK_dbo.PedidoVendaItem] PRIMARY KEY CLUSTERED 
(
	[IdPedidoVendaItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[PedidoVendaParticipante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoVendaParticipante](
	[IdPedidoVendaParticipante] [int] IDENTITY(1,1) NOT NULL,
	[IdParticipante] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[DataSituacao] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
	[IdPedidoVendaItem] [int] NOT NULL DEFAULT ((0)),
	[IdTipoSituacao] [int] NOT NULL DEFAULT ((0)),
	[ValorBase] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[CodigoPedidoVendaParticipante] [float] NOT NULL DEFAULT ((0)),
	[IdStatusParticipante] [int] NULL,
 CONSTRAINT [PK_dbo.PedidoVendaParticipante] PRIMARY KEY CLUSTERED 
(
	[IdPedidoVendaParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[DataCadastro] [datetime] NULL,
 CONSTRAINT [PK_dbo.Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerfilFuncionalidade]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilFuncionalidade](
	[IdPerfilFuncionalidade] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[IdFuncionalidade] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PerfilFuncionalidade] PRIMARY KEY CLUSTERED 
(
	[IdPerfilFuncionalidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[PerfilNotificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilNotificacao](
	[IdPerfilNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PerfilNotificacao] PRIMARY KEY CLUSTERED 
(
	[IdPerfilNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Periodicidade]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Periodicidade](
	[IdPeriodicidade] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Periodicidade] PRIMARY KEY CLUSTERED 
(
	[IdPeriodicidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodoBudget]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodoBudget](
	[IdPeriodoBudget] [int] IDENTITY(1,1) NOT NULL,
	[AnoMesInicial] [varchar](100) NULL,
	[AnoMesFinal] [varchar](100) NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.PeriodoBudget] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoBudget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodoPagtoET]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodoPagtoET](
	[IdPeriodoPagtoET] [int] IDENTITY(1,1) NOT NULL,
	[DataInicioEvento] [int] NULL,
	[DataFimEvento] [int] NULL,
	[cod_db_evento] [varchar](100) NULL,
	[DataSolicitacaoPagto] [int] NULL,
	[cod_db_sol_pgto] [varchar](100) NULL,
	[DataVencimentoPgto] [int] NULL,
	[cod_venc_pgto] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.PeriodoPagtoET] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoPagtoET] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodoPagtoIERPA]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodoPagtoIERPA](
	[IdPeriodoPagtoIERPA] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoQuinze] [varchar](100) NULL,
	[DataInicioEvento] [int] NULL,
	[DataFimEvento] [int] NULL,
	[cod_db_evento] [varchar](100) NULL,
	[DataSolicitacaoPgto] [int] NULL,
	[cod_db_sol_pgto] [varchar](100) NULL,
	[DataVencimentoPgto] [int] NULL,
	[cod_venc_pgto] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.PeriodoPagtoIERPA] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoPagtoIERPA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodoPgtoIENF]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodoPgtoIENF](
	[IdPeriodoPgtoIENF] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPeriodoPgtoIENF] [varchar](100) NULL,
	[DataEnvioNF] [int] NULL,
	[cod_envio_nf] [varchar](100) NULL,
	[DataVencimentoNF] [int] NULL,
	[cod_venc_nf] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.PeriodoPgtoIENF] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoPgtoIENF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriodoPgtoReembolso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodoPgtoReembolso](
	[IdPeriodoPgtoReembolso] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPeriodoPgtoReembolso] [varchar](100) NULL,
	[DataInicioSolicitacao] [int] NULL,
	[DataFimSolicitacao] [int] NULL,
	[cod_db_solici] [varchar](100) NULL,
	[DataCredito] [int] NULL,
	[cod_db_credito] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.PeriodoPgtoReembolso] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoPgtoReembolso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PoliticaCancelamentoAdiamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PoliticaCancelamentoAdiamento](
	[IdPoliticaCancelamentoAdiamento] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Texto] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.PoliticaCancelamentoAdiamento] PRIMARY KEY CLUSTERED 
(
	[IdPoliticaCancelamentoAdiamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PresencaParticipante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresencaParticipante](
	[IdPresencaParticipante] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdParticipante] [int] NOT NULL,
	[IdTurmaData] [int] NOT NULL,
	[DataParticipacao] [datetime] NULL,
	[TipoPresenca] [int] NULL,
	[IdTurma] [int] NOT NULL,
	[DisponivelParaFaturamento] [bit] NULL,
 CONSTRAINT [PK_dbo.PresencaParticipante] PRIMARY KEY CLUSTERED 
(
	[IdPresencaParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[PropostaInCompany]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropostaInCompany](
	[IdPropostaInCompany] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdCurso] [varchar](100) NULL,
	[IdMunicipio] [int] NOT NULL,
	[nro_proposta] [varchar](100) NULL,
	[dta_solicitacao] [datetime] NULL,
	[dsc_observacao] [varchar](100) NULL,
	[tpo_situacao] [int] NULL,
	[dta_envio] [datetime] NULL,
	[dsc_usuario] [varchar](100) NULL,
	[dsc_nome_vendedor] [varchar](100) NULL,
	[cod_sistema_origem_pedido] [int] NOT NULL,
	[Curso_IdCurso] [int] NULL,
 CONSTRAINT [PK_dbo.PropostaInCompany] PRIMARY KEY CLUSTERED 
(
	[IdPropostaInCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publico](
	[IdPublico] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Publico] PRIMARY KEY CLUSTERED 
(
	[IdPublico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestaoAvaliacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestaoAvaliacao](
	[IdQuestaoAvaliacao] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoQuestaoAvaliacao] [int] NOT NULL,
	[IdTipoResposta] [int] NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_QuestaoAvaliacao] PRIMARY KEY CLUSTERED 
(
	[IdQuestaoAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegiaoTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegiaoTreinamento](
	[IdRegiaoTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[IdMunicipio] [int] NOT NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_dbo.RegiaoTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdRegiaoTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[RegistroNota]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroNota](
	[IdRegistroNota] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdParticipante] [int] NOT NULL,
	[Nota] [decimal](18, 2) NULL,
	[IdTurma] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RegistroNota] PRIMARY KEY CLUSTERED 
(
	[IdRegistroNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[SalaTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaTreinamento](
	[IdSalaTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[IdFormatoSalaTreinamento] [int] NOT NULL,
	[IdLocalTreinamento] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Capacidade] [int] NULL,
	[PeDireito] [decimal](18, 3) NULL,
	[Observacao] [varchar](256) NULL,
 CONSTRAINT [PK_dbo.SalaTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdSalaTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SolicitacaoReembolso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SolicitacaoReembolso](
	[IdSolicitacaoReembolso] [int] IDENTITY(1,1) NOT NULL,
	[IdPeriodoPgtoReembolso] [int] NOT NULL,
	[IdTipoPeriodoPgtoReembolso] [varchar](100) NULL,
	[IdCustoDespesa] [int] NOT NULL,
	[IdInstrutor] [int] NULL,
	[vlr_reembolso] [decimal](18, 2) NULL,
	[dsc_reembolso] [varchar](100) NULL,
	[dta_entrega_solicitacao] [datetime] NULL,
	[dta_inicial_reembolso] [datetime] NOT NULL,
	[dta_final_reembolso] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.SolicitacaoReembolso] PRIMARY KEY CLUSTERED 
(
	[IdSolicitacaoReembolso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[IdStatus] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Status] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusParticipante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusParticipante](
	[IdStatusParticipante] [int] NOT NULL,
	[Descricao] [nchar](100) NULL,
	[UsarEmOcorrencia] [bit] NULL,
 CONSTRAINT [PK_StatusParticipante] PRIMARY KEY CLUSTERED 
(
	[IdStatusParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TipoAlerta]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoAlerta](
	[IdTipoAlerta] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[EnviarEmail] [bit] NULL,
	[ModeloMensagem] [varchar](max) NULL,
	[ModeloAssunto] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoAlerta] PRIMARY KEY CLUSTERED 
(
	[IdTipoAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS] TEXTIMAGE_ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoAtividade]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoAtividade](
	[IdTipoAtividade] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoAtividade] PRIMARY KEY CLUSTERED 
(
	[IdTipoAtividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCertificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCertificacao](
	[IdTipoCertificacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[CodigoTemplate] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TipoCertificacao] PRIMARY KEY CLUSTERED 
(
	[IdTipoCertificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCurso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCurso](
	[IdTipoCurso] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoCurso] PRIMARY KEY CLUSTERED 
(
	[IdTipoCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDespesa]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDespesa](
	[IdTipoDespesa] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDespesa] PRIMARY KEY CLUSTERED 
(
	[IdTipoDespesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEndereco]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEndereco](
	[IdTipoEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoEndereco] PRIMARY KEY CLUSTERED 
(
	[IdTipoEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEquipe]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEquipe](
	[IdTipoEquipe] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoEquipe] PRIMARY KEY CLUSTERED 
(
	[IdTipoEquipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[IdTipoEvento] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoEvento] PRIMARY KEY CLUSTERED 
(
	[IdTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoLogradouro]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoLogradouro](
	[IdTipoLogradouro] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoLogradouro] PRIMARY KEY CLUSTERED 
(
	[IdTipoLogradouro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPatrocinador]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPatrocinador](
	[IdTipoPatrocinador] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoPatrocinador] PRIMARY KEY CLUSTERED 
(
	[IdTipoPatrocinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPeriodo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPeriodo](
	[IdTipoPeriodo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Inicio] [time](7) NOT NULL,
	[Fim] [time](7) NOT NULL,
 CONSTRAINT [PK_dbo.TipoPeriodo] PRIMARY KEY CLUSTERED 
(
	[IdTipoPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoQuestaoAvaliacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoQuestaoAvaliacao](
	[IdTipoQuestaoAvaliacao] [int] NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[EhInstrutor] [bit] NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoQuestaoAvaliacao] PRIMARY KEY CLUSTERED 
(
	[IdTipoQuestaoAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoResposta]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoResposta](
	[IdTipoResposta] [int] NOT NULL,
	[Tipo] [varchar](100) NOT NULL,
	[TemComentario] [bit] NOT NULL,
 CONSTRAINT [PK_TipoResposta] PRIMARY KEY CLUSTERED 
(
	[IdTipoResposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoSituacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoSituacao](
	[IdTipoSituacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoSituacao] PRIMARY KEY CLUSTERED 
(
	[IdTipoSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTurma](
	[IdTipoTurma] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TipoTurma] PRIMARY KEY CLUSTERED 
(
	[IdTipoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topico](
	[IdTopico] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[Ordem] [int] NULL,
 CONSTRAINT [PK_dbo.Topico] PRIMARY KEY CLUSTERED 
(
	[IdTopico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Turma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Turma](
	[IdTurma] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTurma] [int] NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdRegiaoTreinamento] [int] NOT NULL,
	[OfertaModuloAvulso] [bit] NOT NULL,
	[EventoEspecial] [bit] NOT NULL,
	[img_logo] [varchar](64) NULL,
	[IdFormato] [int] NOT NULL CONSTRAINT [DF__Turma__IdFormato__3F51553C]  DEFAULT ((0)),
	[IdStatus] [int] NOT NULL,
	[DataInicio] [datetime] NULL CONSTRAINT [DF__Turma__DataInici__40457975]  DEFAULT ('1900-01-01T00:00:00.000'),
	[DataFim] [datetime] NULL CONSTRAINT [DF__Turma__DataFim__41399DAE]  DEFAULT ('1900-01-01T00:00:00.000'),
	[Inicio] [time](7) NULL CONSTRAINT [DF__Turma__Inicio__422DC1E7]  DEFAULT ('00:00:00'),
	[Fim] [time](7) NULL CONSTRAINT [DF__Turma__Fim__4321E620]  DEFAULT ('00:00:00'),
	[CargaHoraria] [int] NOT NULL CONSTRAINT [DF__Turma__CargaHora__44160A59]  DEFAULT ((0)),
	[Observacao] [varchar](100) NULL,
	[ObservacaoData] [varchar](100) NULL,
	[InformacaoHorario] [varchar](100) NULL,
	[Capacidade] [int] NULL,
	[QtdeMinimaInscricao] [int] NULL,
	[DataCadastro] [datetime] NULL CONSTRAINT [DF__Turma__DataCadas__450A2E92]  DEFAULT ('1900-01-01T00:00:00.000'),
	[IdPoliticaCancelamentoAdiamento] [int] NOT NULL CONSTRAINT [DF__Turma__IdPolitic__45FE52CB]  DEFAULT ((0)),
	[InformacaoData] [varchar](256) NULL,
	[MotivoCancelamento] [varchar](256) NULL,
	[NomeLogoPersonalizado] [varchar](100) NULL,
	[DisponivelParaVenda] [bit] NOT NULL CONSTRAINT [DF__Turma__Disponive__46F27704]  DEFAULT ((0)),
	[DataAtualizacao] [datetime] NULL,
	[DataIntegracao] [datetime] NULL CONSTRAINT [DF_Turma_DataIntegracao]  DEFAULT (getdate()),
	[Inscritos] [int] NULL,
	[CargaHorariaMin] [int] NULL,
 CONSTRAINT [PK_dbo.Turma] PRIMARY KEY CLUSTERED 
(
	[IdTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaCriterioCertificacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaCriterioCertificacao](
	[IdTurmaCriterioCertificacao] [int] IDENTITY(1,1) NOT NULL,
	[IdCriterioCertificacao] [int] NOT NULL,
	[IdTurma] [int] NOT NULL,
	[Titulo] [varchar](100) NULL,
	[NotaMinima] [int] NULL,
	[FrequeciaMinima] [int] NULL,
 CONSTRAINT [PK_dbo.TurmaCriterioCertificacao] PRIMARY KEY CLUSTERED 
(
	[IdTurmaCriterioCertificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaCursoModulo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaCursoModulo](
	[IdTurmaCursoModulo] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdCursoModulo] [int] NOT NULL,
	[CargaHoraria] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.TurmaCursoModulo] PRIMARY KEY CLUSTERED 
(
	[IdTurmaCursoModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TurmaCursoModuloArquivo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaCursoModuloArquivo](
	[IdTurmaCursoModuloArquivo] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaCursoModulo] [int] NOT NULL,
	[NomeArquivo] [varchar](100) NULL,
	[Observacao] [varchar](100) NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataInicio] [datetime2](7) NOT NULL,
	[DataParaEnvio] [datetime2](7) NOT NULL,
	[DataEnvio] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_dbo.TurmaCursoModuloArquivo] PRIMARY KEY CLUSTERED 
(
	[IdTurmaCursoModuloArquivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaCursoModuloData]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaCursoModuloData](
	[IdTurmaCursoModuloData] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaCursoModulo] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[IdTipoPeriodo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TurmaCursoModuloData] PRIMARY KEY CLUSTERED 
(
	[IdTurmaCursoModuloData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TurmaData]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaData](
	[IdTurmaData] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[Data] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.TurmaData] PRIMARY KEY CLUSTERED 
(
	[IdTurmaData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TurmaHistorico]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaHistorico](
	[IdTurmaHistorico] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NULL,
	[IdUsuario] [int] NOT NULL,
	[Motivo] [varchar](100) NULL,
	[Data] [datetime] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Acao] [varchar](100) NULL,
	[IdCurso] [int] NULL,
 CONSTRAINT [PK_dbo.TurmaHistorico] PRIMARY KEY CLUSTERED 
(
	[IdTurmaHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaInstrutorPrevia]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaInstrutorPrevia](
	[IdTurmaInstrutorPrevia] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdInstrutor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TurmaInstrutorPrevia] PRIMARY KEY CLUSTERED 
(
	[IdTurmaInstrutorPrevia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TurmaLocalTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaLocalTreinamento](
	[IdTurmaLocalTreinamento] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdLocalTreinamento] [int] NOT NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.TurmaLocalTreinamento] PRIMARY KEY CLUSTERED 
(
	[IdTurmaLocalTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaOferta]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaOferta](
	[IdTurmaOferta] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[Oferta] [varchar](100) NULL,
	[Titulo] [varchar](300) NULL,
	[SubTitulo] [varchar](300) NULL,
	[OfertaCompleta] [bit] NOT NULL,
	[CodigoTurmaOferta] [varchar](100) NULL,
	[DataCadastro] [datetime] NULL CONSTRAINT [DF_TurmaOferta_DataCadastro]  DEFAULT (getdate()),
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Inicio] [time](7) NULL,
	[Fim] [time](7) NULL,
	[CargaHoraria] [int] NULL,
	[Observacao] [varchar](300) NULL,
	[ObservacaoData] [varchar](300) NULL,
	[CargaHorariaMin] [int] NULL,
	[Capacidade] [int] NULL,
	[DataAtualizacao] [datetime] NULL,
	[DataIntegracao] [datetime] NULL,
	[Inscritos] [int] NULL,
	[DisponivelParaVenda] [bit] NOT NULL CONSTRAINT [DF_TurmaOferta_DisponivelParaVenda]  DEFAULT ((0)),
	[InformacaoHorario] [varchar](100) NULL,
	[IdStatus] [int] NULL,
	[CodigoDOS] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.TurmaOferta] PRIMARY KEY CLUSTERED 
(
	[IdTurmaOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaOfertaModulo]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaOfertaModulo](
	[IdTurmaOfertaModulo] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[IdCursoModulo] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.TurmaOfertaModulo] PRIMARY KEY CLUSTERED 
(
	[IdTurmaOfertaModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[TurmaOfertaValor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurmaOfertaValor](
	[IdTurmaOfertaValor] [int] IDENTITY(1,1) NOT NULL,
	[IdTurmaOferta] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Descricao] [varchar](100) NULL,
	[ExportaCRM] [bit] NULL,
 CONSTRAINT [PK_dbo.TurmaOfertaValor] PRIMARY KEY CLUSTERED 
(
	[IdTurmaOfertaValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TurmaTipoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaTipoTurma](
	[IdTurmaTipoTurma] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdTipoturma] [int] NOT NULL,
 CONSTRAINT [PK_TurmaTipoTurma] PRIMARY KEY CLUSTERED 
(
	[IdTurmaTipoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TurmaTurnoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaTurnoTurma](
	[IdTurmaTurnoTurma] [int] IDENTITY(1,1) NOT NULL,
	[IdTurma] [int] NOT NULL,
	[IdTurnoTurma] [int] NOT NULL,
 CONSTRAINT [PK_TurmaTurnoTurma] PRIMARY KEY CLUSTERED 
(
	[IdTurmaTurnoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TurnoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TurnoTurma](
	[IdTurnoTurma] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TurnoTurma] PRIMARY KEY CLUSTERED 
(
	[IdTurnoTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[login] [varchar](100) NULL,
	[Senha] [varchar](100) NULL,
	[Nome] [varchar](100) NULL,
	[Matricula] [varchar](100) NULL,
	[DataCadastro] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
	[Email] [varchar](100) NULL,
	[UltimoLogin] [datetime] NULL,
	[IdTipoSituacao] [int] NULL,
 CONSTRAINT [PK_dbo.Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPerfil]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPerfil](
	[IdUsuarioPerfil] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPerfil] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioPerfil] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[ValorHora]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValorHora](
	[IdValorHora] [int] IDENTITY(1,1) NOT NULL,
	[ValorRemuneracao] [decimal](18, 2) NULL,
	[IdFormaRemuneracao] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ValorHora] PRIMARY KEY CLUSTERED 
(
	[IdValorHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendedor](
	[IdVendedor] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[CodigoVendedor] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.Vendedor] PRIMARY KEY CLUSTERED 
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
) ON [DADOS]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_IdTipoAlerta]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTipoAlerta] ON [dbo].[Alerta]
(
	[IdTipoAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTipoSituacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTipoSituacao] ON [dbo].[AtividadeLogistica]
(
	[IdTipoSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_AreaTematica_IdAreaTematica]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_AreaTematica_IdAreaTematica] ON [dbo].[Curso]
(
	[AreaTematica_IdAreaTematica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdAreaTematica]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdAreaTematica] ON [dbo].[CursoAreaTematica]
(
	[IdAreaTematica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdCurso]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdCurso] ON [dbo].[CursoAreaTematica]
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_Fornecedor_IdFornecedor]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_Fornecedor_IdFornecedor] ON [dbo].[Instrutor]
(
	[Fornecedor_IdFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdLocalTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdLocalTreinamento] ON [dbo].[LocalRealizacao]
(
	[IdLocalTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTurmaCursoModulo]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTurmaCursoModulo] ON [dbo].[LocalRealizacao]
(
	[IdTurmaCursoModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_FormatoSalaTreinamento_IdFormatoSalaTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_FormatoSalaTreinamento_IdFormatoSalaTreinamento] ON [dbo].[LocalTreinamento]
(
	[FormatoSalaTreinamento_IdFormatoSalaTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdInstrutorDocumento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdInstrutorDocumento] ON [dbo].[MaterialDidatico]
(
	[IdInstrutorDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTurma]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTurma] ON [dbo].[MaterialDidatico]
(
	[IdTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdCanalVendas]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdCanalVendas] ON [dbo].[PedidoVenda]
(
	[IdCanalVendas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdCliente]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdCliente] ON [dbo].[PedidoVenda]
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTipoSituacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTipoSituacao] ON [dbo].[PedidoVenda]
(
	[IdTipoSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdVendedor]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdVendedor] ON [dbo].[PedidoVenda]
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdPedidoVenda]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdPedidoVenda] ON [dbo].[PedidoVendaItem]
(
	[IdPedidoVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTipoSituacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTipoSituacao] ON [dbo].[PedidoVendaItem]
(
	[IdTipoSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTurmaOferta]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTurmaOferta] ON [dbo].[PedidoVendaItem]
(
	[IdTurmaOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdPedidoVendaItem]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdPedidoVendaItem] ON [dbo].[PedidoVendaParticipante]
(
	[IdPedidoVendaItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTipoSituacao]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTipoSituacao] ON [dbo].[PedidoVendaParticipante]
(
	[IdTipoSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdFormatoSalaTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdFormatoSalaTreinamento] ON [dbo].[SalaTreinamento]
(
	[IdFormatoSalaTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdLocalTreinamento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdLocalTreinamento] ON [dbo].[SalaTreinamento]
(
	[IdLocalTreinamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdPoliticaCancelamentoAdiamento]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdPoliticaCancelamentoAdiamento] ON [dbo].[Turma]
(
	[IdPoliticaCancelamentoAdiamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTurmaCursoModulo]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTurmaCursoModulo] ON [dbo].[TurmaCursoModuloArquivo]
(
	[IdTurmaCursoModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdInstrutor]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdInstrutor] ON [dbo].[TurmaInstrutorPrevia]
(
	[IdInstrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
/****** Object:  Index [IX_IdTurma]    Script Date: 23/02/2017 16:50:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdTurma] ON [dbo].[TurmaInstrutorPrevia]
(
	[IdTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DADOS]
GO
ALTER TABLE [dbo].[ArquivoLogistica] ADD  DEFAULT ((0)) FOR [IdTurma]
GO
ALTER TABLE [dbo].[CursoHistorico] ADD  CONSTRAINT [DF_CursoHistorico_Data]  DEFAULT (getdate()) FOR [Data]
GO
ALTER TABLE [dbo].[DiasEntregaMaterial] ADD  DEFAULT ((0)) FOR [IdAtividade]
GO
ALTER TABLE [dbo].[EmailNotificacao] ADD  CONSTRAINT [DF_EmailNotificacao_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[EmailNotificacao] ADD  CONSTRAINT [DF_EmailNotificacao_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
ALTER TABLE [dbo].[FornecedorPF] ADD  DEFAULT ((0)) FOR [IdInstrutor]
GO
ALTER TABLE [dbo].[FornecedorPJ] ADD  DEFAULT ((0)) FOR [OptanteSimples]
GO
ALTER TABLE [dbo].[FornecedorPJ] ADD  DEFAULT ((0)) FOR [IdInstrutor]
GO
ALTER TABLE [dbo].[FornecedorPJ] ADD  DEFAULT ((0)) FOR [TemLocalTreinamento]
GO
ALTER TABLE [dbo].[LogisticaCustoDespesa] ADD  DEFAULT ((0)) FOR [IdTurma]
GO
ALTER TABLE [dbo].[TurmaCursoModuloData] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [Data]
GO
ALTER TABLE [dbo].[TurmaCursoModuloData] ADD  DEFAULT ((0)) FOR [IdTipoPeriodo]
GO
ALTER TABLE [dbo].[ValorHora] ADD  DEFAULT ((0)) FOR [IdFormaRemuneracao]
GO
ALTER TABLE [dbo].[Alerta]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Alerta_dbo.TipoAlerta_IdTipoAlerta] FOREIGN KEY([IdTipoAlerta])
REFERENCES [dbo].[TipoAlerta] ([IdTipoAlerta])
GO
ALTER TABLE [dbo].[Alerta] CHECK CONSTRAINT [FK_dbo.Alerta_dbo.TipoAlerta_IdTipoAlerta]
GO
ALTER TABLE [dbo].[ArquivoLogistica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArquivoLogistica_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[ArquivoLogistica] CHECK CONSTRAINT [FK_dbo.ArquivoLogistica_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[ArquivoReembolso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArquivoReembolso_dbo.SolicitacaoReembolso_IdSolicitacaoReembolso] FOREIGN KEY([IdSolicitacaoReembolso])
REFERENCES [dbo].[SolicitacaoReembolso] ([IdSolicitacaoReembolso])
GO
ALTER TABLE [dbo].[ArquivoReembolso] CHECK CONSTRAINT [FK_dbo.ArquivoReembolso_dbo.SolicitacaoReembolso_IdSolicitacaoReembolso]
GO
ALTER TABLE [dbo].[ArquivosControlePgto]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArquivosControlePgto_dbo.ControlePagtoInstrutor_IdControlePagtoInstrutor] FOREIGN KEY([IdControlePagtoInstrutor])
REFERENCES [dbo].[ControlePagtoInstrutor] ([IdControlePagtoInstrutor])
GO
ALTER TABLE [dbo].[ArquivosControlePgto] CHECK CONSTRAINT [FK_dbo.ArquivosControlePgto_dbo.ControlePagtoInstrutor_IdControlePagtoInstrutor]
GO
ALTER TABLE [dbo].[Atividade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Atividade_dbo.TipoAtividade_IdTipoAtividade] FOREIGN KEY([IdTipoAtividade])
REFERENCES [dbo].[TipoAtividade] ([IdTipoAtividade])
GO
ALTER TABLE [dbo].[Atividade] CHECK CONSTRAINT [FK_dbo.Atividade_dbo.TipoAtividade_IdTipoAtividade]
GO
ALTER TABLE [dbo].[AtividadeLogistica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.Atividade_IdAtividade] FOREIGN KEY([IdAtividade])
REFERENCES [dbo].[Atividade] ([IdAtividade])
GO
ALTER TABLE [dbo].[AtividadeLogistica] CHECK CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.Atividade_IdAtividade]
GO
ALTER TABLE [dbo].[AtividadeLogistica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[AtividadeLogistica] CHECK CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[AtividadeLogistica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([TurmaOferta_IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[AtividadeLogistica] CHECK CONSTRAINT [FK_dbo.AtividadeLogistica_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[AtividadeMaterial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AtividadeMaterial_dbo.Atividade_IdAtividade] FOREIGN KEY([IdAtividade])
REFERENCES [dbo].[Atividade] ([IdAtividade])
GO
ALTER TABLE [dbo].[AtividadeMaterial] CHECK CONSTRAINT [FK_dbo.AtividadeMaterial_dbo.Atividade_IdAtividade]
GO
ALTER TABLE [dbo].[AtividadeMaterial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AtividadeMaterial_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[AtividadeMaterial] CHECK CONSTRAINT [FK_dbo.AtividadeMaterial_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Instrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Instrutor]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Participante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Participante]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_QuestaoAvaliacao] FOREIGN KEY([IdQuestaoAvaliacao])
REFERENCES [dbo].[QuestaoAvaliacao] ([IdQuestaoAvaliacao])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_QuestaoAvaliacao]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Turma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Turma]
GO
ALTER TABLE [dbo].[AvaliacaoParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoParticipante_dbo.AvaliacaoTurma_IdAvaliacaoTurma] FOREIGN KEY([IdAvaliacaoTurma])
REFERENCES [dbo].[AvaliacaoTurma] ([IdAvaliacaoTurma])
GO
ALTER TABLE [dbo].[AvaliacaoParticipante] CHECK CONSTRAINT [FK_dbo.AvaliacaoParticipante_dbo.AvaliacaoTurma_IdAvaliacaoTurma]
GO
ALTER TABLE [dbo].[AvaliacaoParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoParticipante_dbo.Participante_IdParticipante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[AvaliacaoParticipante] CHECK CONSTRAINT [FK_dbo.AvaliacaoParticipante_dbo.Participante_IdParticipante]
GO
ALTER TABLE [dbo].[AvaliacaoTurma]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoTurma_dbo.DecisaoParticipacao_IdDecisaoParticipacao] FOREIGN KEY([IdDecisaoParticipacao])
REFERENCES [dbo].[DecisaoParticipacao] ([IdDecisaoParticipacao])
GO
ALTER TABLE [dbo].[AvaliacaoTurma] CHECK CONSTRAINT [FK_dbo.AvaliacaoTurma_dbo.DecisaoParticipacao_IdDecisaoParticipacao]
GO
ALTER TABLE [dbo].[AvaliacaoTurma]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoTurma_dbo.IndicacaoCurso_IdIndicacaoCurso] FOREIGN KEY([IdIndicacaoCurso])
REFERENCES [dbo].[IndicacaoCurso] ([IdIndicacaoCurso])
GO
ALTER TABLE [dbo].[AvaliacaoTurma] CHECK CONSTRAINT [FK_dbo.AvaliacaoTurma_dbo.IndicacaoCurso_IdIndicacaoCurso]
GO
ALTER TABLE [dbo].[AvaliacaoTurmaInstrutor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoTurmaInstrutor_dbo.AvaliacaoTurma_IdAvaliacaoTurma] FOREIGN KEY([IdAvaliacaoTurma])
REFERENCES [dbo].[AvaliacaoTurma] ([IdAvaliacaoTurma])
GO
ALTER TABLE [dbo].[AvaliacaoTurmaInstrutor] CHECK CONSTRAINT [FK_dbo.AvaliacaoTurmaInstrutor_dbo.AvaliacaoTurma_IdAvaliacaoTurma]
GO
ALTER TABLE [dbo].[AvaliacaoTurmaInstrutor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AvaliacaoTurmaInstrutor_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[AvaliacaoTurmaInstrutor] CHECK CONSTRAINT [FK_dbo.AvaliacaoTurmaInstrutor_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Budget_dbo.PeriodoBudget_IdPeriodoBudget] FOREIGN KEY([IdPeriodoBudget])
REFERENCES [dbo].[PeriodoBudget] ([IdPeriodoBudget])
GO
ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_dbo.Budget_dbo.PeriodoBudget_IdPeriodoBudget]
GO
ALTER TABLE [dbo].[BudgetItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BudgetItem_dbo.Budget_IdBudget] FOREIGN KEY([IdBudget])
REFERENCES [dbo].[Budget] ([IdBudget])
GO
ALTER TABLE [dbo].[BudgetItem] CHECK CONSTRAINT [FK_dbo.BudgetItem_dbo.Budget_IdBudget]
GO
ALTER TABLE [dbo].[BudgetItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BudgetItem_dbo.CanalVendas_IdCanalVendas] FOREIGN KEY([IdCanalVendas])
REFERENCES [dbo].[CanalVendas] ([IdCanalVendas])
GO
ALTER TABLE [dbo].[BudgetItem] CHECK CONSTRAINT [FK_dbo.BudgetItem_dbo.CanalVendas_IdCanalVendas]
GO
ALTER TABLE [dbo].[BudgetItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BudgetItem_dbo.CustoDespesa_IdCustoDespesa] FOREIGN KEY([IdCustoDespesa])
REFERENCES [dbo].[CustoDespesa] ([IdCustoDespesa])
GO
ALTER TABLE [dbo].[BudgetItem] CHECK CONSTRAINT [FK_dbo.BudgetItem_dbo.CustoDespesa_IdCustoDespesa]
GO
ALTER TABLE [dbo].[BudgetItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BudgetItem_dbo.Formato_IdFormato] FOREIGN KEY([IdFormato])
REFERENCES [dbo].[Formato] ([IdFormato])
GO
ALTER TABLE [dbo].[BudgetItem] CHECK CONSTRAINT [FK_dbo.BudgetItem_dbo.Formato_IdFormato]
GO
ALTER TABLE [dbo].[Certificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Certificacao_dbo.Participante_IdParticipante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[Certificacao] CHECK CONSTRAINT [FK_dbo.Certificacao_dbo.Participante_IdParticipante]
GO
ALTER TABLE [dbo].[Certificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Certificacao_dbo.TipoCertificacao_IdTipoCertificacao] FOREIGN KEY([IdTipoCertificacao])
REFERENCES [dbo].[TipoCertificacao] ([IdTipoCertificacao])
GO
ALTER TABLE [dbo].[Certificacao] CHECK CONSTRAINT [FK_dbo.Certificacao_dbo.TipoCertificacao_IdTipoCertificacao]
GO
ALTER TABLE [dbo].[Certificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Certificacao_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[Certificacao] CHECK CONSTRAINT [FK_dbo.Certificacao_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[ClienteInadimplencia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClienteInadimplencia_dbo.Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[ClienteInadimplencia] CHECK CONSTRAINT [FK_dbo.ClienteInadimplencia_dbo.Cliente_IdCliente]
GO
ALTER TABLE [dbo].[ClientePF]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientePF_dbo.Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[ClientePF] CHECK CONSTRAINT [FK_dbo.ClientePF_dbo.Cliente_IdCliente]
GO
ALTER TABLE [dbo].[ClientePJ]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientePJ_dbo.Cliente_Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[ClientePJ] CHECK CONSTRAINT [FK_dbo.ClientePJ_dbo.Cliente_Cliente_IdCliente]
GO
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contato_dbo.Area_IdArea] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([IdArea])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_dbo.Contato_dbo.Area_IdArea]
GO
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contato_dbo.Cargo_IdCargo] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_dbo.Contato_dbo.Cargo_IdCargo]
GO
ALTER TABLE [dbo].[ContatoEmail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContatoEmail_dbo.Contato_IdContato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Contato] ([IdContato])
GO
ALTER TABLE [dbo].[ContatoEmail] CHECK CONSTRAINT [FK_dbo.ContatoEmail_dbo.Contato_IdContato]
GO
ALTER TABLE [dbo].[ContatoEndereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContatoEndereco_dbo.Contato_IdContato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Contato] ([IdContato])
GO
ALTER TABLE [dbo].[ContatoEndereco] CHECK CONSTRAINT [FK_dbo.ContatoEndereco_dbo.Contato_IdContato]
GO
ALTER TABLE [dbo].[ContatoEndereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContatoEndereco_dbo.Endereco_IdEndereco] FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[ContatoEndereco] CHECK CONSTRAINT [FK_dbo.ContatoEndereco_dbo.Endereco_IdEndereco]
GO
ALTER TABLE [dbo].[ContatoFone]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContatoFone_dbo.Contato_IdContato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Contato] ([IdContato])
GO
ALTER TABLE [dbo].[ContatoFone] CHECK CONSTRAINT [FK_dbo.ContatoFone_dbo.Contato_IdContato]
GO
ALTER TABLE [dbo].[CreditoCliente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CreditoCliente_dbo.Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[CreditoCliente] CHECK CONSTRAINT [FK_dbo.CreditoCliente_dbo.Cliente_IdCliente]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Curso_dbo.Periodicidade_IdPeriodicidade] FOREIGN KEY([IdPeriodicidade])
REFERENCES [dbo].[Periodicidade] ([IdPeriodicidade])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_dbo.Curso_dbo.Periodicidade_IdPeriodicidade]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Curso_dbo.TipoCurso_IdTipoCurso] FOREIGN KEY([IdTipoCurso])
REFERENCES [dbo].[TipoCurso] ([IdTipoCurso])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_dbo.Curso_dbo.TipoCurso_IdTipoCurso]
GO
ALTER TABLE [dbo].[CursoAreaTematica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CursoAreaTematica_dbo.AreaTematica_IdAreaTematica] FOREIGN KEY([IdAreaTematica])
REFERENCES [dbo].[AreaTematica] ([IdAreaTematica])
GO
ALTER TABLE [dbo].[CursoAreaTematica] CHECK CONSTRAINT [FK_dbo.CursoAreaTematica_dbo.AreaTematica_IdAreaTematica]
GO
ALTER TABLE [dbo].[CursoAreaTematica]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CursoAreaTematica_dbo.Curso_IdCurso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoAreaTematica] CHECK CONSTRAINT [FK_dbo.CursoAreaTematica_dbo.Curso_IdCurso]
GO
ALTER TABLE [dbo].[CursoModulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CursoModulo_dbo.Curso_IdCurso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoModulo] CHECK CONSTRAINT [FK_dbo.CursoModulo_dbo.Curso_IdCurso]
GO
ALTER TABLE [dbo].[CursoTopico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CursoTopico_dbo.Curso_IdCurso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoTopico] CHECK CONSTRAINT [FK_dbo.CursoTopico_dbo.Curso_IdCurso]
GO
ALTER TABLE [dbo].[CursoTopico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CursoTopico_dbo.Topico_IdTopico] FOREIGN KEY([IdTopico])
REFERENCES [dbo].[Topico] ([IdTopico])
GO
ALTER TABLE [dbo].[CursoTopico] CHECK CONSTRAINT [FK_dbo.CursoTopico_dbo.Topico_IdTopico]
GO
ALTER TABLE [dbo].[CustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CustoDespesa_dbo.Categoria_IdCategoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[CustoDespesa] CHECK CONSTRAINT [FK_dbo.CustoDespesa_dbo.Categoria_IdCategoria]
GO
ALTER TABLE [dbo].[CustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CustoDespesa_dbo.OperacaoContabil_IdOperacaoContabil] FOREIGN KEY([IdOperacaoContabil])
REFERENCES [dbo].[OperacaoContabil] ([IdOperacaoContabil])
GO
ALTER TABLE [dbo].[CustoDespesa] CHECK CONSTRAINT [FK_dbo.CustoDespesa_dbo.OperacaoContabil_IdOperacaoContabil]
GO
ALTER TABLE [dbo].[DiasEntregaMaterial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiasEntregaMaterial_dbo.Atividade_IdAtividade] FOREIGN KEY([IdAtividade])
REFERENCES [dbo].[Atividade] ([IdAtividade])
GO
ALTER TABLE [dbo].[DiasEntregaMaterial] CHECK CONSTRAINT [FK_dbo.DiasEntregaMaterial_dbo.Atividade_IdAtividade]
GO
ALTER TABLE [dbo].[DiasEntregaMaterial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiasEntregaMaterial_dbo.Municipio_IdMunicipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[DiasEntregaMaterial] CHECK CONSTRAINT [FK_dbo.DiasEntregaMaterial_dbo.Municipio_IdMunicipio]
GO
ALTER TABLE [dbo].[EmailNotificacao]  WITH CHECK ADD  CONSTRAINT [FK_EmailNotificacao_EmailGrupo] FOREIGN KEY([idEmailGrupo])
REFERENCES [dbo].[EmailGrupo] ([idEmailGrupo])
GO
ALTER TABLE [dbo].[EmailNotificacao] CHECK CONSTRAINT [FK_EmailNotificacao_EmailGrupo]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Endereco_dbo.Municipio_IdMunicipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_dbo.Endereco_dbo.Municipio_IdMunicipio]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Endereco_dbo.TipoLogradouro_IdTipoLogradouro] FOREIGN KEY([IdTipoLogradouro])
REFERENCES [dbo].[TipoLogradouro] ([IdTipoLogradouro])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_dbo.Endereco_dbo.TipoLogradouro_IdTipoLogradouro]
GO
ALTER TABLE [dbo].[EnderecoReferencia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EnderecoReferencia_dbo.Endereco_IdEndereco] FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[EnderecoReferencia] CHECK CONSTRAINT [FK_dbo.EnderecoReferencia_dbo.Endereco_IdEndereco]
GO
ALTER TABLE [dbo].[EnderecoReferencia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EnderecoReferencia_dbo.TipoEndereco_IdTipoEndereco] FOREIGN KEY([IdTipoEndereco])
REFERENCES [dbo].[TipoEndereco] ([IdTipoEndereco])
GO
ALTER TABLE [dbo].[EnderecoReferencia] CHECK CONSTRAINT [FK_dbo.EnderecoReferencia_dbo.TipoEndereco_IdTipoEndereco]
GO
ALTER TABLE [dbo].[EventoEspecial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EventoEspecial_dbo.TipoEvento_IdTipoEvento] FOREIGN KEY([IdTipoEvento])
REFERENCES [dbo].[TipoEvento] ([IdTipoEvento])
GO
ALTER TABLE [dbo].[EventoEspecial] CHECK CONSTRAINT [FK_dbo.EventoEspecial_dbo.TipoEvento_IdTipoEvento]
GO
ALTER TABLE [dbo].[EventoEspecial]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EventoEspecial_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[EventoEspecial] CHECK CONSTRAINT [FK_dbo.EventoEspecial_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[Faturamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Faturamento_dbo.PedidoVendaParticipante_IdPedidoVendaParticipante] FOREIGN KEY([IdPedidoVendaParticipante])
REFERENCES [dbo].[PedidoVendaParticipante] ([IdPedidoVendaParticipante])
GO
ALTER TABLE [dbo].[Faturamento] CHECK CONSTRAINT [FK_dbo.Faturamento_dbo.PedidoVendaParticipante_IdPedidoVendaParticipante]
GO
ALTER TABLE [dbo].[Faturamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Faturamento_dbo.Status_IdStatus] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[Faturamento] CHECK CONSTRAINT [FK_dbo.Faturamento_dbo.Status_IdStatus]
GO
ALTER TABLE [dbo].[FornecedorContato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorContato_dbo.Contato_IdContato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Contato] ([IdContato])
GO
ALTER TABLE [dbo].[FornecedorContato] CHECK CONSTRAINT [FK_dbo.FornecedorContato_dbo.Contato_IdContato]
GO
ALTER TABLE [dbo].[FornecedorContato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorContato_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[FornecedorContato] CHECK CONSTRAINT [FK_dbo.FornecedorContato_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[FornecedorDadosBancario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorDadosBancario_dbo.Banco_IdBanco] FOREIGN KEY([IdBanco])
REFERENCES [dbo].[Banco] ([IdBanco])
GO
ALTER TABLE [dbo].[FornecedorDadosBancario] CHECK CONSTRAINT [FK_dbo.FornecedorDadosBancario_dbo.Banco_IdBanco]
GO
ALTER TABLE [dbo].[FornecedorDadosBancario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorDadosBancario_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[FornecedorDadosBancario] CHECK CONSTRAINT [FK_dbo.FornecedorDadosBancario_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[FornecedorEndereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorEndereco_dbo.Endereco_IdEndereco] FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[FornecedorEndereco] CHECK CONSTRAINT [FK_dbo.FornecedorEndereco_dbo.Endereco_IdEndereco]
GO
ALTER TABLE [dbo].[FornecedorEndereco]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorEndereco_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[FornecedorEndereco] CHECK CONSTRAINT [FK_dbo.FornecedorEndereco_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[FornecedorPF]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorPF_dbo.EstadoCivil_IdEstadoCivil] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
ALTER TABLE [dbo].[FornecedorPF] CHECK CONSTRAINT [FK_dbo.FornecedorPF_dbo.EstadoCivil_IdEstadoCivil]
GO
ALTER TABLE [dbo].[FornecedorPF]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorPF_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[FornecedorPF] CHECK CONSTRAINT [FK_dbo.FornecedorPF_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[FornecedorPFDependente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorPFDependente_dbo.FornecedorPF_IdFornecedorPF] FOREIGN KEY([IdFornecedorPF])
REFERENCES [dbo].[FornecedorPF] ([IdFornecedorPF])
GO
ALTER TABLE [dbo].[FornecedorPFDependente] CHECK CONSTRAINT [FK_dbo.FornecedorPFDependente_dbo.FornecedorPF_IdFornecedorPF]
GO
ALTER TABLE [dbo].[FornecedorPFDependente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FornecedorPFDependente_dbo.Parentesco_IdParentesco] FOREIGN KEY([IdParentesco])
REFERENCES [dbo].[Parentesco] ([IdParentesco])
GO
ALTER TABLE [dbo].[FornecedorPFDependente] CHECK CONSTRAINT [FK_dbo.FornecedorPFDependente_dbo.Parentesco_IdParentesco]
GO
ALTER TABLE [dbo].[Instrutor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Instrutor_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([Fornecedor_IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[Instrutor] CHECK CONSTRAINT [FK_dbo.Instrutor_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[Instrutor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Instrutor_dbo.TipoEquipe_IdTipoEquipe] FOREIGN KEY([IdTipoEquipe])
REFERENCES [dbo].[TipoEquipe] ([IdTipoEquipe])
GO
ALTER TABLE [dbo].[Instrutor] CHECK CONSTRAINT [FK_dbo.Instrutor_dbo.TipoEquipe_IdTipoEquipe]
GO
ALTER TABLE [dbo].[InstrutorArea]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorArea_dbo.AreaTematica_IdAreaTematica] FOREIGN KEY([IdAreaTematica])
REFERENCES [dbo].[AreaTematica] ([IdAreaTematica])
GO
ALTER TABLE [dbo].[InstrutorArea] CHECK CONSTRAINT [FK_dbo.InstrutorArea_dbo.AreaTematica_IdAreaTematica]
GO
ALTER TABLE [dbo].[InstrutorArea]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorArea_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorArea] CHECK CONSTRAINT [FK_dbo.InstrutorArea_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorContato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorContato_dbo.Contato_IdContato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Contato] ([IdContato])
GO
ALTER TABLE [dbo].[InstrutorContato] CHECK CONSTRAINT [FK_dbo.InstrutorContato_dbo.Contato_IdContato]
GO
ALTER TABLE [dbo].[InstrutorContato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorContato_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorContato] CHECK CONSTRAINT [FK_dbo.InstrutorContato_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorDocumento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorDocumento_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorDocumento] CHECK CONSTRAINT [FK_dbo.InstrutorDocumento_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorDocumento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorDocumento_dbo.TipoDocumento_IdTipoDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[InstrutorDocumento] CHECK CONSTRAINT [FK_dbo.InstrutorDocumento_dbo.TipoDocumento_IdTipoDocumento]
GO
ALTER TABLE [dbo].[InstrutorEvento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorEvento_dbo.Evento_IdEvento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[InstrutorEvento] CHECK CONSTRAINT [FK_dbo.InstrutorEvento_dbo.Evento_IdEvento]
GO
ALTER TABLE [dbo].[InstrutorEvento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorEvento_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorEvento] CHECK CONSTRAINT [FK_dbo.InstrutorEvento_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorFormaRemuneracao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorFormaRemuneracao_dbo.FormaRemuneracao_IdFormaRemuneracao] FOREIGN KEY([IdFormaRemuneracao])
REFERENCES [dbo].[FormaRemuneracao] ([IdFormaRemuneracao])
GO
ALTER TABLE [dbo].[InstrutorFormaRemuneracao] CHECK CONSTRAINT [FK_dbo.InstrutorFormaRemuneracao_dbo.FormaRemuneracao_IdFormaRemuneracao]
GO
ALTER TABLE [dbo].[InstrutorFormaRemuneracao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorFormaRemuneracao_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorFormaRemuneracao] CHECK CONSTRAINT [FK_dbo.InstrutorFormaRemuneracao_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorRegiaoTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorRegiaoTreinamento_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorRegiaoTreinamento] CHECK CONSTRAINT [FK_dbo.InstrutorRegiaoTreinamento_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorRegiaoTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorRegiaoTreinamento_dbo.RegiaoTreinamento_IdRegiaoTreinamento] FOREIGN KEY([IdRegiaoTreinamento])
REFERENCES [dbo].[RegiaoTreinamento] ([IdRegiaoTreinamento])
GO
ALTER TABLE [dbo].[InstrutorRegiaoTreinamento] CHECK CONSTRAINT [FK_dbo.InstrutorRegiaoTreinamento_dbo.RegiaoTreinamento_IdRegiaoTreinamento]
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData] CHECK CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.TipoPeriodo_IdTipoPeriodo] FOREIGN KEY([IdTipoPeriodo])
REFERENCES [dbo].[TipoPeriodo] ([IdTipoPeriodo])
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData] CHECK CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.TipoPeriodo_IdTipoPeriodo]
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.TurmaCursoModulo_IdTurmaCursoModulo] FOREIGN KEY([IdTurmaCursoModulo])
REFERENCES [dbo].[TurmaCursoModulo] ([IdTurmaCursoModulo])
GO
ALTER TABLE [dbo].[InstrutorTurmaCursoModuloData] CHECK CONSTRAINT [FK_dbo.InstrutorTurmaCursoModuloData_dbo.TurmaCursoModulo_IdTurmaCursoModulo]
GO
ALTER TABLE [dbo].[LocalRealizacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalRealizacao_dbo.LocalTreinamento_IdLocalTreinamento] FOREIGN KEY([IdLocalTreinamento])
REFERENCES [dbo].[LocalTreinamento] ([IdLocalTreinamento])
GO
ALTER TABLE [dbo].[LocalRealizacao] CHECK CONSTRAINT [FK_dbo.LocalRealizacao_dbo.LocalTreinamento_IdLocalTreinamento]
GO
ALTER TABLE [dbo].[LocalRealizacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalRealizacao_dbo.SalaTreinamento_IdSalaTreinamento] FOREIGN KEY([IdSalaTreinamento])
REFERENCES [dbo].[SalaTreinamento] ([IdSalaTreinamento])
GO
ALTER TABLE [dbo].[LocalRealizacao] CHECK CONSTRAINT [FK_dbo.LocalRealizacao_dbo.SalaTreinamento_IdSalaTreinamento]
GO
ALTER TABLE [dbo].[LocalRealizacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalRealizacao_dbo.TurmaCursoModulo_IdTurmaCursoModulo] FOREIGN KEY([IdTurmaCursoModulo])
REFERENCES [dbo].[TurmaCursoModulo] ([IdTurmaCursoModulo])
GO
ALTER TABLE [dbo].[LocalRealizacao] CHECK CONSTRAINT [FK_dbo.LocalRealizacao_dbo.TurmaCursoModulo_IdTurmaCursoModulo]
GO
ALTER TABLE [dbo].[LocalRealizacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalRealizacao_dbo.TurmaCursoModulo_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[LocalRealizacao] CHECK CONSTRAINT [FK_dbo.LocalRealizacao_dbo.TurmaCursoModulo_IdTurmaOferta]
GO
ALTER TABLE [dbo].[LocalTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalTreinamento_dbo.FormatoSalaTreinamento_IdFormatoSalaTreinamento] FOREIGN KEY([FormatoSalaTreinamento_IdFormatoSalaTreinamento])
REFERENCES [dbo].[FormatoSalaTreinamento] ([IdFormatoSalaTreinamento])
GO
ALTER TABLE [dbo].[LocalTreinamento] CHECK CONSTRAINT [FK_dbo.LocalTreinamento_dbo.FormatoSalaTreinamento_IdFormatoSalaTreinamento]
GO
ALTER TABLE [dbo].[LocalTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocalTreinamento_dbo.FornecedorEndereco_IdFornecedorEndereco] FOREIGN KEY([IdFornecedorEndereco])
REFERENCES [dbo].[FornecedorEndereco] ([IdFornecedorEndereco])
GO
ALTER TABLE [dbo].[LocalTreinamento] CHECK CONSTRAINT [FK_dbo.LocalTreinamento_dbo.FornecedorEndereco_IdFornecedorEndereco]
GO
ALTER TABLE [dbo].[LogisticaCustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LogisticaCustoDespesa_dbo.CustoDespesa_IdCustoDespesa] FOREIGN KEY([IdCustoDespesa])
REFERENCES [dbo].[CustoDespesa] ([IdCustoDespesa])
GO
ALTER TABLE [dbo].[LogisticaCustoDespesa] CHECK CONSTRAINT [FK_dbo.LogisticaCustoDespesa_dbo.CustoDespesa_IdCustoDespesa]
GO
ALTER TABLE [dbo].[LogisticaCustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LogisticaCustoDespesa_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[LogisticaCustoDespesa] CHECK CONSTRAINT [FK_dbo.LogisticaCustoDespesa_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[MaterialDidatico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MaterialDidatico_dbo.InstrutorDocumento_IdInstrutorDocumento] FOREIGN KEY([IdInstrutorDocumento])
REFERENCES [dbo].[InstrutorDocumento] ([IdInstrutorDocumento])
GO
ALTER TABLE [dbo].[MaterialDidatico] CHECK CONSTRAINT [FK_dbo.MaterialDidatico_dbo.InstrutorDocumento_IdInstrutorDocumento]
GO
ALTER TABLE [dbo].[MaterialDidatico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MaterialDidatico_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[MaterialDidatico] CHECK CONSTRAINT [FK_dbo.MaterialDidatico_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Municipio_dbo.Estado_IdEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_dbo.Municipio_dbo.Estado_IdEstado]
GO
ALTER TABLE [dbo].[OrcamentoTurma]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrcamentoTurma_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[OrcamentoTurma] CHECK CONSTRAINT [FK_dbo.OrcamentoTurma_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[OrcamentoTurmaCustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrcamentoTurmaCustoDespesa_dbo.CustoDespesa_IdCustoDespesa] FOREIGN KEY([IdCustoDespesa])
REFERENCES [dbo].[CustoDespesa] ([IdCustoDespesa])
GO
ALTER TABLE [dbo].[OrcamentoTurmaCustoDespesa] CHECK CONSTRAINT [FK_dbo.OrcamentoTurmaCustoDespesa_dbo.CustoDespesa_IdCustoDespesa]
GO
ALTER TABLE [dbo].[OrcamentoTurmaCustoDespesa]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrcamentoTurmaCustoDespesa_dbo.OrcamentoTurma_IdOrcamentoTurma] FOREIGN KEY([IdOrcamentoTurma])
REFERENCES [dbo].[OrcamentoTurma] ([IdOrcamentoTurma])
GO
ALTER TABLE [dbo].[OrcamentoTurmaCustoDespesa] CHECK CONSTRAINT [FK_dbo.OrcamentoTurmaCustoDespesa_dbo.OrcamentoTurma_IdOrcamentoTurma]
GO
ALTER TABLE [dbo].[Patrocinador]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Patrocinador_dbo.Fornecedor_IdFornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([IdFornecedor])
GO
ALTER TABLE [dbo].[Patrocinador] CHECK CONSTRAINT [FK_dbo.Patrocinador_dbo.Fornecedor_IdFornecedor]
GO
ALTER TABLE [dbo].[Patrocinador]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Patrocinador_dbo.TipoPatrocinador_IdTipoPatrocinador] FOREIGN KEY([IdTipoPatrocinador])
REFERENCES [dbo].[TipoPatrocinador] ([IdTipoPatrocinador])
GO
ALTER TABLE [dbo].[Patrocinador] CHECK CONSTRAINT [FK_dbo.Patrocinador_dbo.TipoPatrocinador_IdTipoPatrocinador]
GO
ALTER TABLE [dbo].[Patrocinador]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Patrocinador_dbo.Turma_Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[Patrocinador] CHECK CONSTRAINT [FK_dbo.Patrocinador_dbo.Turma_Turma_IdTurma]
GO
ALTER TABLE [dbo].[PedidoVenda]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVenda_dbo.CanalVendas_IdCanalVendas] FOREIGN KEY([IdCanalVendas])
REFERENCES [dbo].[CanalVendas] ([IdCanalVendas])
GO
ALTER TABLE [dbo].[PedidoVenda] CHECK CONSTRAINT [FK_dbo.PedidoVenda_dbo.CanalVendas_IdCanalVendas]
GO
ALTER TABLE [dbo].[PedidoVenda]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVenda_dbo.Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[PedidoVenda] CHECK CONSTRAINT [FK_dbo.PedidoVenda_dbo.Cliente_IdCliente]
GO
ALTER TABLE [dbo].[PedidoVenda]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVenda_dbo.TipoSituacao_IdTipoSituacao] FOREIGN KEY([IdTipoSituacao])
REFERENCES [dbo].[TipoSituacao] ([IdTipoSituacao])
GO
ALTER TABLE [dbo].[PedidoVenda] CHECK CONSTRAINT [FK_dbo.PedidoVenda_dbo.TipoSituacao_IdTipoSituacao]
GO
ALTER TABLE [dbo].[PedidoVenda]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVenda_dbo.Vendedor_IdVendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([IdVendedor])
GO
ALTER TABLE [dbo].[PedidoVenda] CHECK CONSTRAINT [FK_dbo.PedidoVenda_dbo.Vendedor_IdVendedor]
GO
ALTER TABLE [dbo].[PedidoVendaItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVendaItem_dbo.PedidoVenda_IdPedidoVenda] FOREIGN KEY([IdPedidoVenda])
REFERENCES [dbo].[PedidoVenda] ([IdPedidoVenda])
GO
ALTER TABLE [dbo].[PedidoVendaItem] CHECK CONSTRAINT [FK_dbo.PedidoVendaItem_dbo.PedidoVenda_IdPedidoVenda]
GO
ALTER TABLE [dbo].[PedidoVendaItem]  WITH CHECK ADD  CONSTRAINT [FK_PedidoVendaItem_TurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[PedidoVendaItem] CHECK CONSTRAINT [FK_PedidoVendaItem_TurmaOferta]
GO
ALTER TABLE [dbo].[PedidoVendaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.Participante_IdParticipante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[PedidoVendaParticipante] CHECK CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.Participante_IdParticipante]
GO
ALTER TABLE [dbo].[PedidoVendaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.PedidoVendaItem_IdPedidoVendaItem] FOREIGN KEY([IdPedidoVendaItem])
REFERENCES [dbo].[PedidoVendaItem] ([IdPedidoVendaItem])
GO
ALTER TABLE [dbo].[PedidoVendaParticipante] CHECK CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.PedidoVendaItem_IdPedidoVendaItem]
GO
ALTER TABLE [dbo].[PedidoVendaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.TipoSituacao_IdTipoSituacao] FOREIGN KEY([IdTipoSituacao])
REFERENCES [dbo].[TipoSituacao] ([IdTipoSituacao])
GO
ALTER TABLE [dbo].[PedidoVendaParticipante] CHECK CONSTRAINT [FK_dbo.PedidoVendaParticipante_dbo.TipoSituacao_IdTipoSituacao]
GO
ALTER TABLE [dbo].[PerfilFuncionalidade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PerfilFuncionalidade_dbo.Funcionalidade_IdFuncionalidade] FOREIGN KEY([IdFuncionalidade])
REFERENCES [dbo].[Funcionalidade] ([IdFuncionalidade])
GO
ALTER TABLE [dbo].[PerfilFuncionalidade] CHECK CONSTRAINT [FK_dbo.PerfilFuncionalidade_dbo.Funcionalidade_IdFuncionalidade]
GO
ALTER TABLE [dbo].[PerfilFuncionalidade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PerfilFuncionalidade_dbo.Perfil_IdPerfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[PerfilFuncionalidade] CHECK CONSTRAINT [FK_dbo.PerfilFuncionalidade_dbo.Perfil_IdPerfil]
GO
ALTER TABLE [dbo].[PerfilNotificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PerfilNotificacao_dbo.Perfil_IdPerfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[PerfilNotificacao] CHECK CONSTRAINT [FK_dbo.PerfilNotificacao_dbo.Perfil_IdPerfil]
GO
ALTER TABLE [dbo].[PresencaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PresencaParticipante_dbo.Participante_IdParticipante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[PresencaParticipante] CHECK CONSTRAINT [FK_dbo.PresencaParticipante_dbo.Participante_IdParticipante]
GO
ALTER TABLE [dbo].[PresencaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PresencaParticipante_dbo.TurmaData_IdTurmaData] FOREIGN KEY([IdTurmaData])
REFERENCES [dbo].[TurmaData] ([IdTurmaData])
GO
ALTER TABLE [dbo].[PresencaParticipante] CHECK CONSTRAINT [FK_dbo.PresencaParticipante_dbo.TurmaData_IdTurmaData]
GO
ALTER TABLE [dbo].[PresencaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PresencaParticipante_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[PresencaParticipante] CHECK CONSTRAINT [FK_dbo.PresencaParticipante_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[PresencaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_PresencaParticipante_Turma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[PresencaParticipante] CHECK CONSTRAINT [FK_PresencaParticipante_Turma]
GO
ALTER TABLE [dbo].[PropostaInCompany]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[PropostaInCompany] CHECK CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Cliente_IdCliente]
GO
ALTER TABLE [dbo].[PropostaInCompany]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Curso_Curso_IdCurso] FOREIGN KEY([Curso_IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[PropostaInCompany] CHECK CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Curso_Curso_IdCurso]
GO
ALTER TABLE [dbo].[PropostaInCompany]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Municipio_IdMunicipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[PropostaInCompany] CHECK CONSTRAINT [FK_dbo.PropostaInCompany_dbo.Municipio_IdMunicipio]
GO
ALTER TABLE [dbo].[PropostaInCompany]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropostaInCompany_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[PropostaInCompany] CHECK CONSTRAINT [FK_dbo.PropostaInCompany_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[QuestaoAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_QuestaoAvaliacao_TipoQuestaoAvaliacao] FOREIGN KEY([IdTipoQuestaoAvaliacao])
REFERENCES [dbo].[TipoQuestaoAvaliacao] ([IdTipoQuestaoAvaliacao])
GO
ALTER TABLE [dbo].[QuestaoAvaliacao] CHECK CONSTRAINT [FK_QuestaoAvaliacao_TipoQuestaoAvaliacao]
GO
ALTER TABLE [dbo].[QuestaoAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_QuestaoAvaliacao_TipoResposta] FOREIGN KEY([IdTipoResposta])
REFERENCES [dbo].[TipoResposta] ([IdTipoResposta])
GO
ALTER TABLE [dbo].[QuestaoAvaliacao] CHECK CONSTRAINT [FK_QuestaoAvaliacao_TipoResposta]
GO
ALTER TABLE [dbo].[RegiaoTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RegiaoTreinamento_dbo.Municipio_IdMunicipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[RegiaoTreinamento] CHECK CONSTRAINT [FK_dbo.RegiaoTreinamento_dbo.Municipio_IdMunicipio]
GO
ALTER TABLE [dbo].[RegistroNota]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RegistroNota_dbo.Participante_IdParticipante] FOREIGN KEY([IdParticipante])
REFERENCES [dbo].[Participante] ([IdParticipante])
GO
ALTER TABLE [dbo].[RegistroNota] CHECK CONSTRAINT [FK_dbo.RegistroNota_dbo.Participante_IdParticipante]
GO
ALTER TABLE [dbo].[RegistroNota]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RegistroNota_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[RegistroNota] CHECK CONSTRAINT [FK_dbo.RegistroNota_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[RegistroNota]  WITH CHECK ADD  CONSTRAINT [FK_RegistroNota_Turma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[RegistroNota] CHECK CONSTRAINT [FK_RegistroNota_Turma]
GO
ALTER TABLE [dbo].[SalaTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SalaTreinamento_dbo.FormatoSalaTreinamento_IdFormatoSalaTreinamento] FOREIGN KEY([IdFormatoSalaTreinamento])
REFERENCES [dbo].[FormatoSalaTreinamento] ([IdFormatoSalaTreinamento])
GO
ALTER TABLE [dbo].[SalaTreinamento] CHECK CONSTRAINT [FK_dbo.SalaTreinamento_dbo.FormatoSalaTreinamento_IdFormatoSalaTreinamento]
GO
ALTER TABLE [dbo].[SalaTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SalaTreinamento_dbo.LocalTreinamento_IdLocalTreinamento] FOREIGN KEY([IdLocalTreinamento])
REFERENCES [dbo].[LocalTreinamento] ([IdLocalTreinamento])
GO
ALTER TABLE [dbo].[SalaTreinamento] CHECK CONSTRAINT [FK_dbo.SalaTreinamento_dbo.LocalTreinamento_IdLocalTreinamento]
GO
ALTER TABLE [dbo].[SolicitacaoReembolso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SolicitacaoReembolso_dbo.CustoDespesa_IdCustoDespesa] FOREIGN KEY([IdCustoDespesa])
REFERENCES [dbo].[CustoDespesa] ([IdCustoDespesa])
GO
ALTER TABLE [dbo].[SolicitacaoReembolso] CHECK CONSTRAINT [FK_dbo.SolicitacaoReembolso_dbo.CustoDespesa_IdCustoDespesa]
GO
ALTER TABLE [dbo].[SolicitacaoReembolso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SolicitacaoReembolso_dbo.PeriodoPgtoReembolso_IdPeriodoPgtoReembolso] FOREIGN KEY([IdPeriodoPgtoReembolso])
REFERENCES [dbo].[PeriodoPgtoReembolso] ([IdPeriodoPgtoReembolso])
GO
ALTER TABLE [dbo].[SolicitacaoReembolso] CHECK CONSTRAINT [FK_dbo.SolicitacaoReembolso_dbo.PeriodoPgtoReembolso_IdPeriodoPgtoReembolso]
GO
ALTER TABLE [dbo].[TurmaCriterioCertificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCriterioCertificacao_dbo.CriterioCertificacao_IdCriterioCertificacao] FOREIGN KEY([IdCriterioCertificacao])
REFERENCES [dbo].[CriterioCertificacao] ([IdCriterioCertificacao])
GO
ALTER TABLE [dbo].[TurmaCriterioCertificacao] CHECK CONSTRAINT [FK_dbo.TurmaCriterioCertificacao_dbo.CriterioCertificacao_IdCriterioCertificacao]
GO
ALTER TABLE [dbo].[TurmaCriterioCertificacao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCriterioCertificacao_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaCriterioCertificacao] CHECK CONSTRAINT [FK_dbo.TurmaCriterioCertificacao_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaCursoModulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCursoModulo_dbo.CursoModulo_IdCursoModulo] FOREIGN KEY([IdCursoModulo])
REFERENCES [dbo].[CursoModulo] ([IdCursoModulo])
GO
ALTER TABLE [dbo].[TurmaCursoModulo] CHECK CONSTRAINT [FK_dbo.TurmaCursoModulo_dbo.CursoModulo_IdCursoModulo]
GO
ALTER TABLE [dbo].[TurmaCursoModulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCursoModulo_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaCursoModulo] CHECK CONSTRAINT [FK_dbo.TurmaCursoModulo_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaCursoModuloData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCursoModuloData_dbo.TipoPeriodo_IdTipoPeriodo] FOREIGN KEY([IdTipoPeriodo])
REFERENCES [dbo].[TipoPeriodo] ([IdTipoPeriodo])
GO
ALTER TABLE [dbo].[TurmaCursoModuloData] CHECK CONSTRAINT [FK_dbo.TurmaCursoModuloData_dbo.TipoPeriodo_IdTipoPeriodo]
GO
ALTER TABLE [dbo].[TurmaCursoModuloData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaCursoModuloData_dbo.TurmaCursoModulo_IdTurmaCursoModulo] FOREIGN KEY([IdTurmaCursoModulo])
REFERENCES [dbo].[TurmaCursoModulo] ([IdTurmaCursoModulo])
GO
ALTER TABLE [dbo].[TurmaCursoModuloData] CHECK CONSTRAINT [FK_dbo.TurmaCursoModuloData_dbo.TurmaCursoModulo_IdTurmaCursoModulo]
GO
ALTER TABLE [dbo].[TurmaData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaData_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaData] CHECK CONSTRAINT [FK_dbo.TurmaData_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaHistorico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Status_StatusTurma_IdStatus] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[TurmaHistorico] CHECK CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Status_StatusTurma_IdStatus]
GO
ALTER TABLE [dbo].[TurmaHistorico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaHistorico] CHECK CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaHistorico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Usuario_IdUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TurmaHistorico] CHECK CONSTRAINT [FK_dbo.TurmaHistorico_dbo.Usuario_IdUsuario]
GO
ALTER TABLE [dbo].[TurmaInstrutorPrevia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaInstrutorPrevia_dbo.Instrutor_IdInstrutor] FOREIGN KEY([IdInstrutor])
REFERENCES [dbo].[Instrutor] ([IdInstrutor])
GO
ALTER TABLE [dbo].[TurmaInstrutorPrevia] CHECK CONSTRAINT [FK_dbo.TurmaInstrutorPrevia_dbo.Instrutor_IdInstrutor]
GO
ALTER TABLE [dbo].[TurmaInstrutorPrevia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaInstrutorPrevia_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaInstrutorPrevia] CHECK CONSTRAINT [FK_dbo.TurmaInstrutorPrevia_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaLocalTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaLocalTreinamento_dbo.LocalTreinamento_IdLocalTreinamento] FOREIGN KEY([IdLocalTreinamento])
REFERENCES [dbo].[LocalTreinamento] ([IdLocalTreinamento])
GO
ALTER TABLE [dbo].[TurmaLocalTreinamento] CHECK CONSTRAINT [FK_dbo.TurmaLocalTreinamento_dbo.LocalTreinamento_IdLocalTreinamento]
GO
ALTER TABLE [dbo].[TurmaLocalTreinamento]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaLocalTreinamento_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaLocalTreinamento] CHECK CONSTRAINT [FK_dbo.TurmaLocalTreinamento_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaOferta]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaOferta_dbo.Turma_IdTurma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaOferta] CHECK CONSTRAINT [FK_dbo.TurmaOferta_dbo.Turma_IdTurma]
GO
ALTER TABLE [dbo].[TurmaOfertaModulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaOfertaModulo_dbo.CursoModulo_IdCursoModulo] FOREIGN KEY([IdCursoModulo])
REFERENCES [dbo].[CursoModulo] ([IdCursoModulo])
GO
ALTER TABLE [dbo].[TurmaOfertaModulo] CHECK CONSTRAINT [FK_dbo.TurmaOfertaModulo_dbo.CursoModulo_IdCursoModulo]
GO
ALTER TABLE [dbo].[TurmaOfertaModulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaOfertaModulo_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[TurmaOfertaModulo] CHECK CONSTRAINT [FK_dbo.TurmaOfertaModulo_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[TurmaOfertaValor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TurmaOfertaValor_dbo.TurmaOferta_IdTurmaOferta] FOREIGN KEY([IdTurmaOferta])
REFERENCES [dbo].[TurmaOferta] ([IdTurmaOferta])
GO
ALTER TABLE [dbo].[TurmaOfertaValor] CHECK CONSTRAINT [FK_dbo.TurmaOfertaValor_dbo.TurmaOferta_IdTurmaOferta]
GO
ALTER TABLE [dbo].[TurmaTurnoTurma]  WITH CHECK ADD  CONSTRAINT [FK_TurmaTurnoTurma_Turma] FOREIGN KEY([IdTurma])
REFERENCES [dbo].[Turma] ([IdTurma])
GO
ALTER TABLE [dbo].[TurmaTurnoTurma] CHECK CONSTRAINT [FK_TurmaTurnoTurma_Turma]
GO
ALTER TABLE [dbo].[TurmaTurnoTurma]  WITH CHECK ADD  CONSTRAINT [FK_TurmaTurnoTurma_TurnoTurma] FOREIGN KEY([IdTurnoTurma])
REFERENCES [dbo].[TurnoTurma] ([IdTurnoTurma])
GO
ALTER TABLE [dbo].[TurmaTurnoTurma] CHECK CONSTRAINT [FK_TurmaTurnoTurma_TurnoTurma]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Usuario_dbo.Perfil_IdPerfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_dbo.Usuario_dbo.Perfil_IdPerfil]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoSituacao] FOREIGN KEY([IdTipoSituacao])
REFERENCES [dbo].[TipoSituacao] ([IdTipoSituacao])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoSituacao]
GO
ALTER TABLE [dbo].[UsuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPerfil_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[UsuarioPerfil] CHECK CONSTRAINT [FK_UsuarioPerfil_Perfil]
GO
ALTER TABLE [dbo].[UsuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPerfil_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioPerfil] CHECK CONSTRAINT [FK_UsuarioPerfil_Usuario]
GO
ALTER TABLE [dbo].[ValorHora]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ValorHora_dbo.FormaRemuneracao_IdFormaRemuneracao] FOREIGN KEY([IdFormaRemuneracao])
REFERENCES [dbo].[FormaRemuneracao] ([IdFormaRemuneracao])
GO
ALTER TABLE [dbo].[ValorHora] CHECK CONSTRAINT [FK_dbo.ValorHora_dbo.FormaRemuneracao_IdFormaRemuneracao]
GO
/****** Object:  StoredProcedure [dbo].[ProducaoDiaria]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoDiaria                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Diária                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoDiaria NULL, NULL, NULL, '20160704', NULL
Create procedure [dbo].[ProducaoDiaria]
 
@Ano int = NULL,
@Mes int = NULL,
@RegiaoTreinamento int = NULL,
@DataInicio datetime = null,
@DataFim datetime = null
as 

--IF(@Ano IS NULL)
--	SET @Ano = YEAR(GETDATE())

--IF(@Mes IS NULL)
--	SET @Mes = MONTH(GETDATE())

--set @Ano = YEAR(GETDATE())
--set @Mes = MONTH(GETDATE())

-- 1. Selecão das Turmas

-- exec dbo.[Spr_SageEducacao_Lista_ProducaoDiaria] 2016, 9, 1

--Drop table #Temp_20160918_ProducaoDiaria
  
select 
b.IdTurma,
d.IdTurmaOferta, 
a.Titulo, 
convert(varchar(100), '') as TipoTurma, 
CodigoTurmaOferta as CodOferta, 
b.DataInicio, b.DataFim, 
g.Descricao as RegiaoTreinamento,
b.IdRegiaoTreinamento,
case when b.DisponivelParaVenda = 1 then 'Sim' else 'Não' end as DisponivelVenda,
h.Descricao as StatusTurma,
0 as Meta,
b.QtdeMinimaInscricao as Minimo,
b.Capacidade as Capacidade,
0 as Ativo,
0 as Passivo,
0 as Cortesia,
0 as Acumulado,
Convert(money,0) as VlrReceita
into #Temp_20160918_ProducaoDiaria
  From Curso as a	
  Inner Join Turma as b on (b.IdCurso = a.IdCurso)	
  Inner Join Formato as c on (c.IdFormato = b.IdFormato) 	
  Inner Join TurmaOferta as d on (d.IdTurma = b.IdTurma) 
  inner join RegiaoTreinamento as e on (e.IdRegiaoTreinamento = b.IdRegiaoTreinamento)
  inner join Municipio as f on (f.IdMunicipio = e.IdMunicipio)
  inner join Estado as g on (g.IdEstado = f.IdEstado)
  inner join Status as h on (h.IdStatus = b.IdStatus)
where (YEAR(b.DataInicio) = @Ano OR @Ano  IS NULL)
and (MONTH(b.DataInicio) = @Mes OR @Mes  IS NULL)
AND (e.IdRegiaoTreinamento = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
and  b.DataInicio between ISNULL(@DataInicio, b.DataInicio)  and ISNULL(@DataFim, b.DataInicio)

-- > '2016-09-15'

--and  b.DataInicio > '2016-09-15'


-- 2. Preenchendo o Tipo de Turma

--drop table #Temp_20160918_TipoTurma

select * into #Temp_20160918_TipoTurma from TipoTurma

declare @MinimoTipoTurma int

select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma

while exists (select * from #Temp_20160918_TipoTurma)
	begin 

		update c set TipoTurma = TipoTurma + case when TipoTurma > '' then ' , ' else '' end + a.Descricao 
		from TipoTurma as a
		inner join TurmaTipoTurma as b on (b.IdTipoTurma = a.IdTipoTurma)
		inner join #Temp_20160918_ProducaoDiaria as c on (c.IdTurma = b.IdTurma)
		where a.IdTipoTurma = @MinimoTipoTurma
		
		delete #Temp_20160918_TipoTurma where IdTipoTurma = @MinimoTipoTurma
		
		select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma

	end 


-- 3. Preenchendo a quantidade e o valor da Receita

update A set Ativo = QtdAtivo,
             Passivo = QtdPassivo,
             Cortesia = QtdCortesia,
			 Acumulado = QtdAcumulado,
			 VlrReceita = b.VlrReceita
from #Temp_20160918_ProducaoDiaria as a
inner join (select a.IdTurmaOferta, 
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda < 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdAtivo,
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda > 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdPassivo,
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and isnull(c.Valor, 0) = 0 then 1 else 0 end )as QtdCortesia,
			sum(1) as QtdAcumulado,
			SUM( c.Valor) as VlrReceita
			from #Temp_20160918_ProducaoDiaria as a
			inner join PedidoVendaItem as b on (b.IdTurmaOferta = a.IdTurmaOferta)
			inner join PedidoVendaParticipante as c on (c.IdPedidoVendaItem = b.IdPedidoVendaItem)
			left outer join TipoSituacao as d on (d.IdTipoSituacao = c.IdTipoSituacao)
			inner join PedidoVenda as e on (e.IdPedidoVenda = b.IdPedidoVenda)
			group by a.IdTurmaOferta, c.IdTipoSituacao) as b on (b.IdTurmaOferta = a.IdTurmaOferta)

select *
from #Temp_20160918_ProducaoDiaria as a
order by RegiaoTreinamento

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_CG_PedidoVenda]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_PedidoVenda                                                      *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/
CREATE Proc [dbo].[SP_SageEducacao_CG_PedidoVenda] 
										@FaturaID Bigint
										
As 	

	--Use SAGE_Educacao
		
	Declare @PedidoVenda Bigint
	
	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_PedidoVenda')        
		drop table ##Temp_SageEducacao_PedidoVenda  
		
	Select 
	b.IdCliente,
	1 as IdTipoSituacao, -- Faturado
	a.NR_Pedido,
	a.Numero,
	c.IdVendedor, 
	1 as Quantidade, -- Quantidade
	Convert(Bigint,d.bn_Order_Forma_id_ato_fk) as FormaPagto,
	d.Order_Date,
	a.Valor,
	1 as IdCanalVendas -- CanalVenda	
	Into ##Temp_SageEducacao_PedidoVenda
	From       CRM_ED..Fatura  as a	
	Inner Join SAGE_Educacao..Cliente as b on (Convert(Bigint,a.Cliente_id) = b.CodigoCliente)
	Inner Join SAGE_Educacao..Vendedor as c on (a.int_Fatura_VendId = c.CodigoVendedor)
	Inner Join CRM_ED..order_ as d on (a.nr_Pedido = d.Order_Number)
	Where numero = @FaturaID
	
	
	
	
	Insert into PedidoVenda(	
	IdCliente,
	IdTipoSituacao,
	IdVendedor,
	Quantidade,
	FormaPagto,
	DataPedido,
	Valor,
	IdCanalVendas,
	CodigoPedidoVenda)
	Select
	IdCliente,
	IdTipoSituacao, 	
	IdVendedor, 
	Quantidade, 
	FormaPagto,
	Order_Date,
	Valor,
	IdCanalVendas,
	Nr_Pedido	
	From ##Temp_SageEducacao_PedidoVenda

	Select @PedidoVenda = @@IDENTITY 


	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_PedidoVendaItem')        
		drop table ##Temp_SageEducacao_PedidoVendaItem  
		
	Select 
	c.IdTurmaOferta,
	@PedidoVenda as IdPedidoVenda,
	1 as IdTipoSituacao,
	b.int_FatItens_VlrProd as Valor,
	b.int_FatItens_VlrProd as ValorBase,
	a.NR_Pedido as NR_Pedido,
	b.int_FatItens_ItemIdUnisys as 	IdItemUnisys
	Into ##Temp_SageEducacao_PedidoVendaItem
	From       CRM_ED..Fatura  as a	
	Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)
	Inner Join SAGE_Educacao..TurmaOferta as c on (b.str_FatItens_CodProd COLLATE Latin1_General_CI_AS = ISNULL(CodigoDOS, CodigoTurmaOferta))
	Where a.numero = @FaturaID


	Insert into PedidoVendaItem(
	IdTurmaOferta,
	IdPedidoVenda,
	IdTipoSituacao,
	Valor,
	ValorBase,
	CodigoPedidoVendaItem)	
    Select 
	IdTurmaOferta,
	IdPedidoVenda,
	IdTipoSituacao,
	Valor,
	ValorBase,	
	IdItemUnisys 
	From ##Temp_SageEducacao_PedidoVendaItem


/*
Select *
from PedidoVendaItem


delete PedidoVendaItem where idPedidovendaitem in (2,3,4)

Select *
from PedidoVenda

delete PedidoVenda where idPedidovenda not in (5)

Alter table PedidoVendaItem
Add IdUnisys Bigint null




*/
GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_InsereCurso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael sanchez
-- Create date: january 2017
-- Description:	sage education system support
-- =============================================
CREATE PROCEDURE [dbo].[SP_SageEducacao_InsereCurso]
	@CodigoCurso varchar(15), 
	@IdTipoCurso int = 1, 
	@IdPeriodicidade int = 1, 
	@Titulo varchar(256),  
	@Subtitulo varchar(max), 
	@Vigente bit, 
	@PontuacaoCRC varchar(100) = null, 
	@Modular bit 
	
as
BEGIN
	
	SET NOCOUNT ON;

    
INSERT INTO [dbo].[Curso]
           ([CodigoCurso]
           ,[IdTipoCurso]
           ,[IdPeriodicidade]
           ,[Titulo]
           ,[Subtitulo]
           ,[Vigente]
           ,[PontuacaoCRC]
           ,[Modular]
          )
     VALUES
           (
		   @CodigoCurso 
           ,@IdTipoCurso 
           ,@IdPeriodicidade
           ,@Titulo 
           ,@Subtitulo
           ,@Vigente
           ,@PontuacaoCRC
           ,@Modular
           
		   )
	
	SELECT @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_InsereTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael sanchez
-- Create date: 30-01-17
-- Description:	inserção na tb turma

-- exec SP_SageEducacao_InsereTurma  
-- =============================================
CREATE PROCEDURE [dbo].[SP_SageEducacao_InsereTurma]
	-- Add the parameters for the stored procedure here
		@IdTipoTurma int = 1,						@IdCurso int = 1,	
		@IdRegiaoTreinamento int = 1,				@OfertaModuloAvulso bit= 0, 
		@EventoEspecial bit= 0,						@img_logo varchar(64)= null,				 
		@IdFormato int= 1, 			 				@IdStatus int= 1,
		@DataInicio datetime= null,					@DataFim datetime= null,
		@Inicio time= null,							@Fim time= null,	
		@CargaHoraria int= 0,						@Observacao varchar(100)= null,	
		@ObservacaoData varchar(100)= null,			@InformacaoHorario varchar(100)= null, 
		@Capacidade int= null,						@QtdeMinimaInscricao int= 0,
		@IdPoliticaCancelamentoAdiamento int= 2,
		@InformacaoData varchar(256)= null,			@MotivoCancelamento varchar(256)= null,	 	
		@NomeLogoPersonalizado varchar(100)= null,	@DisponivelParaVenda bit= 0,		
		@DataAtualizacao datetime= null,			@DataIntegracao datetime= null, 
		@Inscritos int= 0,							@CargaHorariaMin int= 0

AS
BEGIN
	

	SET NOCOUNT ON;
INSERT INTO dbo.Turma
           (IdTipoTurma					,IdCurso
           ,IdRegiaoTreinamento         ,OfertaModuloAvulso
           ,EventoEspecial				,img_logo
           ,IdFormato					,IdStatus
           ,DataInicio					,DataFim
           ,Inicio						,Fim
           ,CargaHoraria				,Observacao
           ,ObservacaoData				,InformacaoHorario
           ,Capacidade					,QtdeMinimaInscricao
			,DataCadastro				,IdPoliticaCancelamentoAdiamento
           ,InformacaoData				,MotivoCancelamento
           ,NomeLogoPersonalizado       ,DisponivelParaVenda
           ,DataAtualizacao				,DataIntegracao
           ,Inscritos					,CargaHorariaMin )
     VALUES
		(	
			@IdTipoTurma,					@IdCurso,
			@IdRegiaoTreinamento,			@OfertaModuloAvulso, 
			@EventoEspecial, 				@img_logo, 
			@IdFormato,						@IdStatus, 
			@DataInicio, 					@DataFim , 
			@Inicio ,	 					@Fim ,	 
			@CargaHoraria ,					@Observacao ,	
			@ObservacaoData ,	 			@InformacaoHorario ,	 
			@Capacidade ,					@QtdeMinimaInscricao ,	 
			getdate(),				@IdPoliticaCancelamentoAdiamento ,	
			@InformacaoData ,				@MotivoCancelamento ,	
			@NomeLogoPersonalizado ,		@DisponivelParaVenda ,	
			@DataAtualizacao ,				@DataIntegracao,		
			@Inscritos,						@CargaHorariaMin )


	select @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_InsereTurmaInstrutorPrevia]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael sanchez
-- Create date: janeiro 2017
-- Description:	inserção de dados na tabela chamado por sage educao
-- =============================================
CREATE PROCEDURE [dbo].[SP_SageEducacao_InsereTurmaInstrutorPrevia]
	@p1 int, @p2 int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[TurmaInstrutorPrevia]
           ([IdTurma]
           ,[IdInstrutor])
     VALUES
           (@p1, @p2);

         select @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_ListaAreaTematicapoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael
-- Create date: fevereiro
-- Description:	listar as areas tematica como filtro por turma

-- exec SP_SageEducacao_ListaAreaTematicapoTurma 20
-- =============================================
create PROCEDURE [dbo].[SP_SageEducacao_ListaAreaTematicapoTurma]
	@IdTurma int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select distinct atem.IdAreaTematica IdAreaTematica, atem.Descricao Descricao from 
		AreaTematica atem
		inner join CursoAreaTematica cat
		on atem.IdAreaTematica = cat.IdAreaTematica
		inner join Curso cur
		on cur.IdCurso = cat.IdCurso
		inner join Turma tu
		on tu.IdCurso = cur.IdCurso
	where tu.IdTurma = @IdTurma


End



GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_ListAgendaInstrutor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rafael
-- Create date: fevereiro / 2017
-- Description:	supote em sage educacao  - lista de instrutores
--   exec SP_SageEducacao_ListAgendaInstrutor
-- =============================================

CREATE PROCEDURE [dbo].[SP_SageEducacao_ListAgendaInstrutor]
	
AS
BEGIN
	

	SET NOCOUNT ON;

	select distinct i.IdInstrutor,
		i.NomeCompleto Instrutor,
		i.CRC,
		i.OAB,

		cu.CodigoCurso,
		cu.Titulo as Curso,
		stat.Descricao Status,
		CONVERT(VARCHAR(10),locreal.DataInicio,103) Data,
		CONVERT(VARCHAR(10),locreal.Inicio,108) Inicio,
		CONVERT(VARCHAR(10),locreal.Fim,108) Fim,
		loctreina.Descricao	+ '-'+ est.Descricao + '-' + est.UF as Regiao,
		pe.Descricao Periodo
		from turma tu
		inner join  TurmaCursoModulo tcm
		on tu.IdTurma = tcm.IdTurma
		inner join Curso cu
		on cu.IdCurso = tu.IdCurso
		inner join TurmaInstrutorPrevia tip
		on tu.IdTurma = tip.IdTurma
		inner join instrutor i
		on tip.IdInstrutor = i.IdInstrutor
		inner join Status stat
		on stat.IdStatus = tu.IdStatus
		inner join LocalRealizacao locreal
		on tcm.IdTurmaCursoModulo = locreal.IdTurmaCursoModulo
		inner join LocalTreinamento loctreina
		on locreal.IdLocalTreinamento = loctreina.IdLocalTreinamento
		inner join FornecedorEndereco fornend
		on loctreina.IdFornecedorEndereco = fornend.IdFornecedorEndereco
		inner join Endereco ender
		on fornend.IdEndereco = ender.IdEndereco
		inner join Municipio mun
		on ender.IdMunicipio = mun.IdMunicipio
		inner join Estado est
		on mun.IdEstado = est.IdEstado
		inner join InstrutorTurmaCursoModuloData itcmd
		on tcm.IdTurmaCursoModulo = itcmd.IdTurmaCursoModulo
		inner join TipoPeriodo pe
		on itcmd.IdTipoPeriodo = pe.IdTipoPeriodo
		where stat.IdStatus not in (7,8,9)
															
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_ListAgendaInstrutoriNDEX]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rafael
-- Create date: fevereiro / 2017
-- Description:	supote em sage educacao  - lista de instrutores
--   exec [SP_SageEducacao_ListAgendaInstrutoriNDEX]
-- =============================================

CREATE PROCEDURE [dbo].[SP_SageEducacao_ListAgendaInstrutoriNDEX]
	
AS
BEGIN
	

	SET NOCOUNT ON;

	select distinct i.IdInstrutor,
		i.NomeCompleto Instrutor,
		i.CRC,
		i.OAB

		--cu.CodigoCurso,
		--cu.Titulo as Curso,
		--stat.Descricao Status,
		--CONVERT(VARCHAR(10),locreal.DataInicio,103) Data,
		--CONVERT(VARCHAR(10),locreal.Inicio,108) Inicio,
		--CONVERT(VARCHAR(10),locreal.Fim,108) Fim,
		--loctreina.Descricao	+ '-'+ est.Descricao + '-' + est.UF as Regiao,
		--pe.Descricao Periodo
		from turma tu
		inner join  TurmaCursoModulo tcm
		on tu.IdTurma = tcm.IdTurma
		inner join Curso cu
		on cu.IdCurso = tu.IdCurso
		inner join TurmaInstrutorPrevia tip
		on tu.IdTurma = tip.IdTurma
		inner join instrutor i
		on tip.IdInstrutor = i.IdInstrutor
		inner join Status stat
		on stat.IdStatus = tu.IdStatus
		inner join LocalRealizacao locreal
		on tcm.IdTurmaCursoModulo = locreal.IdTurmaCursoModulo
		inner join LocalTreinamento loctreina
		on locreal.IdLocalTreinamento = loctreina.IdLocalTreinamento
		inner join FornecedorEndereco fornend
		on loctreina.IdFornecedorEndereco = fornend.IdFornecedorEndereco
		inner join Endereco ender
		on fornend.IdEndereco = ender.IdEndereco
		inner join Municipio mun
		on ender.IdMunicipio = mun.IdMunicipio
		inner join Estado est
		on mun.IdEstado = est.IdEstado
		inner join InstrutorTurmaCursoModuloData itcmd
		on tcm.IdTurmaCursoModulo = itcmd.IdTurmaCursoModulo
		inner join TipoPeriodo pe
		on itcmd.IdTipoPeriodo = pe.IdTipoPeriodo
		where stat.IdStatus not in (7,8,9)
															
END

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM
*  OBS:  Lista pedidosFaturas Integrados.
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM]  
												@Id BigInt

As


Update PedidosFaturasCRM
Set DtIntegracao = Getdate(),
Status = 1  
Where IdPedidosFaturasCRM = @Id 
 
/*
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM] TO usr_infraprd

*/


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_AtualizaStatus_TurmaOfertra
*  OBS:  Atualiza Turmas/Ofertas importadas
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra]  
												@IdTurma BigInt

As


Update Turma
Set DataIntegracao = GETDATE()
Where IdTurma = @IdTurma

 
/*
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra] TO app_educacao

*/


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Cliente]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SP_SageEducacao_CG_Cliente                                                          *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados da Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE PROC [dbo].[Spr_SageEducacao_CG_Cliente] 
										@FaturaID Bigint
										
As 	

	--Use SAGE_Educacao
		
	Declare @IdCliente Bigint
	
	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Clientes')        
		drop table ##Temp_SageEducacao_Clientes  
		
	Select 
	a.NR_Pedido,
	a.Numero,
	CONVERT(Bigint,b.company_id) as CompanyID,
	b.Razao_Social,
	b.Company_Name,
	b.Tipo_Pessoa,
	b.CNPJ,
	b.CNPJ_seq,
	b.CNPJ_dig,
	b.Insc_Estadual,
	b.Address_1 as Endereco,
	b.City as Cidade,
	b.State_ as UF,
	b.Zip as CEP 
	Into ##Temp_SageEducacao_Clientes
	From       CRM_ED..Fatura  as a
	Inner Join CRM_ED..Company as b on (a.cliente_id = b.company_id)
	Where Numero = @FaturaID
	
	
	Delete b
	from Cliente as a
	Inner Join ##Temp_SageEducacao_Clientes as b on (a.CodigoCliente = b.CompanyID)
	
	
	
	Insert into Cliente
	(CodigoCliente)
	Select CompanyID 
	From ##Temp_SageEducacao_Clientes
	
	Select @IdCliente = @@IDENTITY 
		
	
	If Exists(Select 1 from ##Temp_SageEducacao_Clientes Where Tipo_Pessoa = 'FISICA')
		Begin
			Insert into ClientePF(		
			IdCliente,
			Nome,
			Apelido,
			CPF)
			Select 	
			@IdCliente, 
			Razao_Social,
			Company_Name,
			CNPJ + CNPJ_dig 
			From ##Temp_SageEducacao_Clientes
		End
	Else
	    Begin	    	
			Insert into ClientePJ(					
			RazaoSocial,
			NomeFantasia,
			Cnpj,
			InscricaoEstadual,
			IdCliente,
			Endereco,
			Cidade,
			UF,
			CEP)
			Select 				
			Razao_Social,
			Company_Name,
			CNPJ + CNPJ_seq + CNPJ_dig,
			Insc_Estadual,
			@IdCliente ,
			Endereco,
			Cidade,
			UF,
			CEP
			From ##Temp_SageEducacao_Clientes
		End
		
		
		/*
		use Sage_educacao
		exec SPR_SageEducacao_CG_Cliente 73279751
		
		
		Select * from clientePJ
		Select * from clientePF
		
		*/
GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_FaturamentoTurmasOfertas]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : Spr_SageEducacao_CG_FaturamentoTurmasOfertas                                         *
Data Criação     : 24/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Envia cursos para faturamento                                                       *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_FaturamentoTurmasOfertas] 
															@LogId Bigint		
As

--Declare @LogId 	Bigint
--Set @LogId = 123	


Declare	@QtdeParticipantes Bigint,
		@Seq Int,
		@IdVendaItem BigInt,
		@IdVendaItemAnt BigInt,
		@NomeParticipante Varchar(5000),
		@IdSolic Bigint


If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_FaturamentoCursos')        
		Drop table ##Temp_SageEducacao_FaturamentoCursos  



Select Distinct
fat.Numero                          as FATURAID,     -- EDNF-FATURAID 
int_FatItens_ItemIdUnisys           as ITEMID,       -- EDNF-ITEMID   
0                                   as QTPARTIC,     -- EDNF-QT-PARTIC
Dt_Fatura                           as DTREFNF,         -- EDNF-DT-REF-NF
cur.Titulo                          as DESCRICAOCURSO,  -- EDNF-DS-CURSO
Convert(Varchar(5000),'')           as NOMEPARTIC,      -- EDNF-DS-PARTIC	
pv.IdPedidoVenda                    as IDPEDIDOVENDA,
pvp.IdParticipante                  as IDPARTICIPANTE,
par.Nome                            as NOMEPART,
trm.IdTurma                         as IDTURMA
--STATUS       as Status,     -- EDNF-CD-STATUS
--NRNF         as NRNF,       -- EDNF-NR-NF     
--MsgRetorno   as MSGRETORNO, -- EDNF-DS-MENS  
--DTALTER      as DTALTER,	  -- EDNF-DT-ALTER 
--HRALTER      as HTALTER        EDNF-HR-ALTER 
Into ##Temp_SageEducacao_FaturamentoCursos
FROM Curso cur 
    inner join Turma trm on cur.IdCurso = trm.IdCurso
	inner join TurmaOferta tuf on tuf.IdTurma = trm.IdTurma
	inner join PedidoVendaItem pvi on tuf.IdTurmaOferta = pvi.IdTurmaOferta
	inner join PedidoVenda pv on pvi.IdPedidoVenda = pv.IdPedidoVenda
	inner join PedidoVendaParticipante pvp on pvp.IdPedidoVendaItem = pvi.IdPedidoVendaItem
	inner join Participante par on par.IdParticipante = pvp.IdParticipante		
	Inner join CRM_ED..Fatura fat on pv.CodigoPedidoVenda = fat.NR_Pedido
	Inner Join CRM_ED..TAB_FaturaItens as fatItem on (fat.Numero = fatItem.int_FatItens_FaturaId)  
	Inner Join CRM_ED..order_ as ord on (fat.nr_Pedido = ord.Order_Number)
	Inner Join CRM_ED..Order_Detail as ordDet on (ord.order__id = ordDet.order__id And fatItem.bn_FatItens_Product_Id_pk  = ordDet.Product_Id)	
Where trm.idstatus = 12
And pvp.IdStatusParticipante = 12


--Atualiza Quantidade  participante
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_QTParticipantes')        
		Drop table ##Temp_SageEducacao_QTParticipantes  

Select IDPEDIDOVENDA,
COUNT(1) as QTParticipantes
Into ##Temp_SageEducacao_QTParticipantes
From ##Temp_SageEducacao_FaturamentoCursos
Group by IDPEDIDOVENDA

--Update A
--Set a.QTPARTIC = b.QTParticipantes
--From ##Temp_SageEducacao_FaturamentoCursos as a
--Inner Join ##Temp_SageEducacao_QTParticipantes as b on (a.FATURAID = b.FATURAID)





--INICIO - Atualiza Nome Participante 
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_NomeParticipante')        
		Drop table ##Temp_SageEducacao_NomeParticipante  

Select IDENTITY(Bigint,1,1) as ID,
FATURAID,
IDPEDIDOVENDA,
IDPARTICIPANTE,
NOMEPART
Into ##Temp_SageEducacao_NomeParticipante  
From ##Temp_SageEducacao_FaturamentoCursos
Order by IDPEDIDOVENDA,IDPARTICIPANTE


Set @Seq = 1
Set @NomeParticipante = ''

While exists(Select Top 1 1 from ##Temp_SageEducacao_NomeParticipante order by Id)
Begin
	
	If (@Seq = 1)
    Begin
        Select 
        @IdVendaItemAnt = IDPEDIDOVENDA
        From ##Temp_SageEducacao_NomeParticipante
        Where ID = @Seq
    End
    

    Select 
    @IdVendaItem = IDPEDIDOVENDA   
    From ##Temp_SageEducacao_NomeParticipante
	Where ID = @Seq

	Print Convert(Varchar(5),@Seq) 

    Print Convert(Varchar(5),@IdVendaItem) + '--' + Convert(Varchar(5),@IdVendaItemAnt)

    If (@IdVendaItem = @IdVendaItemAnt)
	  Begin 
	    if (@NomeParticipante = '')
			Begin
				Select    
				@NomeParticipante = NOMEPART,
				@IdVendaItemAnt = IDPEDIDOVENDA
				From ##Temp_SageEducacao_NomeParticipante
				Where ID = @Seq				    
			End
	    Else
			Begin
				Select    
				@NomeParticipante = @NomeParticipante + '|' + NOMEPART,
				@IdVendaItemAnt = IDPEDIDOVENDA
				From ##Temp_SageEducacao_NomeParticipante
				Where ID = @Seq		
	    End
	    
        Delete ##Temp_SageEducacao_NomeParticipante where ID = @Seq
	    
	    Set @Seq = @Seq + 1		
		
      End
    Else
      Begin	      	
              
        Update A
		Set    a.NOMEPARTIC = @NomeParticipante
		From   ##Temp_SageEducacao_FaturamentoCursos as a		
		where  a.IDPEDIDOVENDA = @IdVendaItemAnt
		
		Select            
        @IdVendaItemAnt = IDPEDIDOVENDA
        From ##Temp_SageEducacao_NomeParticipante
	    Where ID = @Seq		
		
		Set @NomeParticipante = ''
      
      End      
End

        Update A
		Set    a.NOMEPARTIC = @NomeParticipante
		From   ##Temp_SageEducacao_FaturamentoCursos as a		
		where  a.IDPEDIDOVENDA = @IdVendaItemAnt

-- FIM - Atualiza Nome Participante 



If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_FaturamentoCursos_Final')        
   Drop table ##Temp_SageEducacao_FaturamentoCursos_Final  

	   
 	    Select distinct
		1 as STATUS,
		IDENTITY(Bigint,1,1)   as IDSOLIC,
		a.FATURAID,
		ITEMID,
		b.QTPARTICIPANTES,
		Convert(Varchar(10),DTREFNF,112) as DTREFNF,
		DESCRICAOCURSO,		
		NOMEPARTIC         
		Into ##Temp_SageEducacao_FaturamentoCursos_Final
		From ##Temp_SageEducacao_FaturamentoCursos as a		
		Inner Join ##Temp_SageEducacao_QTParticipantes as b on (a.IDPEDIDOVENDA = b.IDPEDIDOVENDA)
	
	
		Select @IdSolic = MAX(ednf_id_solic) 
		from [UNISYS_HTESTEINT].[HTESTEINT].[HTESTEINT].[EDNF]

		Set @IdSolic = Isnull(@IdSolic,0)
		
        Set @IdSolic = @IdSolic + 1	
	
	
		Insert Into [UNISYS_HTESTEINT].[HTESTEINT].[HTESTEINT].[EDNF] (
		EDNF_CD_STATUS,
		EDNF_ID_SOLIC, 
		EDNF_FATURAID, 
		EDNF_ITEMID,   
		EDNF_QT_PARTIC,
		EDNF_DT_REF_NF,
		EDNF_DS_CURSO, 
		EDNF_DS_PARTIC)
		Select distinct
		STATUS,
		IDSOLIC + @IdSolic,
		FATURAID,
		ITEMID,
		QTPARTICIPANTES,
		DTREFNF,
		DESCRICAOCURSO,		
		NOMEPARTIC 
		From ##Temp_SageEducacao_FaturamentoCursos_Final 
		

-- Atualizando Status das Nf Enviadas

Update A
Set idstatus = 13
From Turma as a
Inner join ##Temp_SageEducacao_FaturamentoCursos as b on (a.IdTurma = b.IDTURMA);


Update A
Set IdStatusParticipante = 13
From PedidoVendaParticipante as a
Inner join ##Temp_SageEducacao_FaturamentoCursos as b on (a.IdParticipante = b.IDPARTICIPANTE);

------retrono das nf
-- Drop table  ##Temp__SageEducacao_Faturados

-- select ednf_faturaid, ednf_cd_status from ##Temp__SageEducacao_Faturados

-- SELECT substring(cast( ednf_faturaid as varchar(8)), 2, 8) from  ##Temp__SageEducacao_Faturados


-- update [UNISYS_HTESTEINT].[HTESTEINT].[HTESTEINT].[EDNF] set ednf_cd_status = 5 where ednf_faturaid = 73295094;



If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_FaturamentoCursos_Final')        
   Drop table ##Temp__SageEducacao_Faturados;  

-- carrega a temporaria
SELECT distinct substring(cast( ednf_faturaid as varchar(8)), 2, 8) ednf_faturaid, ednf_cd_status
INTO ##Temp__SageEducacao_Faturados
FROM (
Select * from [UNISYS_HTESTEINT].[HTESTEINT].[HTESTEINT].[EDNF]
where ednf_cd_status in (5, 2) ) as x
  
--atualiza a tabela pedidos venda campo tiposituacao para 3 faturado
Update pv set IdTipoSituacao = 3
from SAGE_Educacao..PedidoVenda pv
inner join ##Temp__SageEducacao_Faturados temp
on pv.CodigoPedidoVenda  = temp.ednf_faturaid
where temp.ednf_cd_status = 5;

Update pv set IdTipoSituacao = 4
from SAGE_Educacao..PedidoVenda pv
inner join ##Temp__SageEducacao_Faturados temp
on pv.CodigoPedidoVenda  = temp.ednf_faturaid
where temp.ednf_cd_status = 2;




/*

exec Spr_SageEducacao_CG_FaturamentoTurmasOfertas 0


Select * from [UNISYS_HTESTEINT].[HTESTEINT].[HTESTEINT].[EDNF]
where ednf_id_solic = 123

--Select * from ##Temp_SageEducacao_FaturamentoCursos
	
--Select * from ##Temp_SageEducacao_QTParticipantes

sp_helptext spr_SageEducacao_Lista_Dados_TurmaView


GRANT EXECUTE ON [dbo].[Spr_SageEducacao_CG_FaturamentoTurmasOfertas] TO app_educacao

use crm_Ed
use SAGE_Educacao
--Select * from PedidoVendaParticipante
--Select * from PresencaParticipante
--Select * from PedidoVenda


Select *
from turmaoferta
where IdTurma = 205 

Select *
from PresencaParticipante
where idturmaoferta in (289) 

298,299,
301,
306,
307)

Select *
from pedidovendaparticipante

Select *
from pedidovenda

Select *
from pedidovendaitem
where idturmaoferta = 289
99
100

Select *
from pedidovendaparticipante
where idpedidovendaitem in (99,100)

Select *
from PresencaParticipante
where idturmaoferta in (289) 

FROM Curso cur 
    inner join Turma trm on cur.IdCurso = trm.IdCurso
	inner join TurmaOferta tuf on tuf.IdTurma = trm.IdTurma
	inner join PedidoVendaItem pvi on tuf.IdTurmaOferta = pvi.IdTurmaOferta
	inner join PedidoVenda pv on pvi.IdPedidoVenda = pv.IdPedidoVenda
	inner join PedidoVendaParticipante pvp on pvp.IdPedidoVendaItem = pvi.IdPedidoVendaItem
	inner join Participante par on par.IdParticipante = pvp.IdParticipante	
	inner join PresencaParticipante PrP on (par.IdParticipante = PrP.IdParticipante)
	Inner join CRM_ED..Fatura fat on pv.CodigoPedidoVenda = fat.NR_Pedido
	Inner Join CRM_ED..TAB_FaturaItens as fatItem on (fat.Numero = fatItem.int_FatItens_FaturaId)  
	Inner Join CRM_ED..order_ as ord on (fat.nr_Pedido = ord.Order_Number)
	Inner Join CRM_ED..Order_Detail as ordDet on (ord.order__id = ordDet.order__id And fatItem.bn_FatItens_Product_Id_pk  = ordDet.Product_Id)
	Inner Join CRM_ED..tb_ParticipanteCursos as part on (ordDet.Order__Id = part.order__id and ordDet.Order_Detail_Id= part.Order_Detail_Id)
Where tuf.idstatus = 12
And pvp.IdStatusParticipante = 12

*/
GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Participantes]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_Participantes
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_Participantes] 
										@FaturaID Bigint
										
As 	

	--Use SAGE_Educacao
		
	Declare @IdParticipante Bigint
	Declare @NrPedidoLoja Bigint
	
	Set @IdParticipante = 0
	Set @NrPedidoLoja = 0
	
	-- (Inicio)Verifica se o pedido foi feito pela loja virtual para fazer o tratamento dos participantes.
		
	Select @NrPedidoLoja = ISNULL(b.int_order_ikeda,0)
	From CRM_ED..Fatura  as a	
	Inner Join CRM_ED..order_ as b on (a.nr_Pedido = b.Order_Number)
	where a.Numero = @FaturaID
	
	if (@NrPedidoLoja <> 0)
	Begin
	
		insert into CRM_ED..tb_ParticipanteCursos (
			--IdParticipanteCursos, -- identity
			TAB_PedidaoItem_Id,
			Order__Id,
			Order_Detail_Id,
			IdItemUnisys,
			IdProduto,
			QtdParticipante,
			NomeParticipante,
			CPFParticipante,
			EmailParticipante,
			dddFixoParticipante,
			FoneFixoParticipante,
			dddCelularParticipante,
			FoneCelularParticipante,
			CargoParticipante,
			DepartamentoParticipante,
			statusParticipante,
			IdSubstituto,
			IdContact,
			IdCliente,
			int_tab_pedidaoItem_id,
			dat_alt_participante)			
			Select 
			TAB_PedidaoItem_Id as TAB_PedidaoItem_Id,
			d.Order__Id as Order__Id,
			e.order_detail_id as Order_Detail_Id,
			0 as IdItemUnisys,
			f.product_id as IdProduto,
			0 as QtdParticipante,
			str_PartCur_Nome as NomeParticipante,
			0 as CPFParticipante,
			str_PartCur_Email as EmailParticipante,
			0 as dddFixoParticipante,
			0 as FoneFixoParticipante,
			0 as dddCelularParticipante,
			0 as FoneCelularParticipante,
			str_PartCur_Cargo as CargoParticipante,
			str_PartCur_Depto as DepartamentoParticipante,
			1 as statusParticipante,
			0 as IdSubstituto,
			CONVERT(bigint, c.bn_PedidaoI_usuarios_id_ent_fk) as IdContact, -- precisa ver a necessidade
			convert(bigint, bn_pedidao_clientes_id_fk) as IdCliente,
			convert(bigint,TAB_PedidaoItem_Id ) int_tab_pedidaoItem_id,
			getdate() as dat_alt_participante
			from CRM_ED..Tab_ParticipCursos as a
			inner join CRM_ED..tab_pedidao as b on (b.int_pedidao_status = 0 and b.tab_pedidao_id = bn_PartCur_Pedidao_id_fk)
			inner join CRM_ED..tab_pedidaoItem as c on (c.bn_PedidaoI_pedidao_id_fk = tab_pedidao_id)
			inner join CRM_ED..order_ as d on (d.bn_order_pedidao_id_fk = b.TAB_Pedidao_Id)
			inner join CRM_ED..order_detail as e on (e.Order__Id = d.order__id)
			inner join CRM_ED..product as f on (f.product_id = c.bn_PedidaoI_prod_produtoid_fk)
			where d.Int_Order_Ikeda = @NrPedidoLoja
			
			update CRM_ED..tb_ParticipanteCursos
			SET CPFParticipante = IdParticipanteCursos
			where CPFParticipante is null
	End
	
	-- (Fim) Verifica se o pedido foi feito pela loja virtual para fazer o tratamento dos participantes.	
	
	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_ParticipanteCursos')        
		drop table ##Temp_SageEducacao_ParticipanteCursos  
		
	Select Distinct
	e.idParticipanteCursos,
	d.Unit_Price,
	a.Rn_Edit_Date,
	g.IdPedidoVendaItem,
	1 as IdTipoSituacao, 
	g.Valor,
	g.ValorBase,
	a.NR_Pedido,
	e.NomeParticipante,
	e.CPFParticipante,
	55555 as RG,
	e.DepartamentoParticipante,
	e.CargoParticipante,
	e.EmailParticipante,
	getdate() as DataNascimento,
	c.Order__Id as OrderId,
	e.IdProduto as ProdutoId,
	e.CRC as CRC,
	b.int_FatItens_ItemIdUnisys as 	IdItemUnisys,
	Isnull(c.int_order_ikeda,0) as  NrPedidoLoja,
	e.dddFixoParticipante,
	e.FoneFixoParticipante,
	e.dddCelularParticipante,
	e.FoneCelularParticipante
	Into ##Temp_SageEducacao_ParticipanteCursos
	From       CRM_ED..Fatura  as a	
	Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)  
	Inner Join CRM_ED..order_ as c on (a.nr_Pedido = c.Order_Number)
	Inner Join CRM_ED..Order_Detail as d on (c.order__id = d.order__id And b.bn_FatItens_Product_Id_pk  = d.Product_Id)
	Inner Join CRM_ED..tb_ParticipanteCursos as e on (d.Order__Id = e.order__id and d.Order_Detail_Id= e.Order_Detail_Id)
	Inner Join SAGE_Educacao..PedidoVenda as f on (a.NR_Pedido = f.CodigoPedidoVenda)
	Inner Join SAGE_Educacao..PedidoVendaItem as g on (f.IdPedidoVenda = g.IdPedidoVenda And b.int_FatItens_ItemIdUnisys = g.CodigoPedidoVendaItem)		
	Where a.numero = @FaturaID
	And c.TipoProd = 'CUR'

	Update 
		a
	Set 
		a.Nome = b.NomeParticipante,
		--a.CPF = b.CPFParticipante,
		a.RG = b.RG,
		a.CRC = b.CRC,
		a.Departamento = b.DepartamentoParticipante,
		a.Cargo = b.CargoParticipante,
		a.email = b.EmailParticipante,
		a.DataNascimento = b.DataNascimento
	From 
		Participante as a
		Inner Join ##Temp_SageEducacao_ParticipanteCursos as b on (a.CPF COLLATE Latin1_General_CI_AS = b.CPFParticipante)
	Where 
		a.IdParticipante = @IdParticipante

 --   Select @IdParticipante = IdParticipante
 --   From ##Temp_SageEducacao_ParticipanteCursos as a
 --   Inner Join Participante as b on (a.CPFParticipante = b.CPF COLLATE Latin1_General_CI_AS)
	
	--If (@IdParticipante = 0 )
	--	Begin 
			Insert into Participante(
			Nome,
			CPF,
			RG,
			CRC,
			Departamento,
			Cargo,
			email,
			DataNascimento,
			dddFixo,
			FoneFixo,
			dddCelular,
			FoneCelular)
			Select 
			NomeParticipante,
			CPFParticipante,
			RG,
			CRC,
			DepartamentoParticipante,
			CargoParticipante,
			EmailParticipante,
			DataNascimento	,
			dddFixoParticipante,
			FoneFixoParticipante,
			dddCelularParticipante,
			FoneCelularParticipante
			From ##Temp_SageEducacao_ParticipanteCursos pc
			where not exists (select 1 from Participante x where pc.CPFParticipante= x.CPF collate SQL_Latin1_General_CP1_CI_AS)
			
	--		Select @IdParticipante = @@IDENTITY 

	--	End
	--Else
	--	Begin
			
			
		--End
	
	--Insere na PedidoVendaParticipante
	Insert into PedidoVendaParticipante(
		IdParticipante,
		Valor,
		DataSituacao,
		IdPedidoVendaItem,
		IdTipoSituacao,
		ValorBase,
		CodigoPedidoVendaParticipante)
	Select distinct
		p.IdParticipante,	
		Unit_Price,
		Rn_Edit_Date,
		IdPedidoVendaItem, 
		IdTipoSituacao,	
		ValorBase,
		idParticipanteCursos	
		From ##Temp_SageEducacao_ParticipanteCursos pc
		inner join Participante p on pc.CPFParticipante = p.CPF collate SQL_Latin1_General_CP1_CI_AS
		order by IdParticipanteCursos	
				
	--- Atualiza ItemIdUnisystb_ParticipanteCursos 
	Update A
    Set a.IdItemUnisys = b.IdItemUnisys	
	From       CRM_ED..tb_ParticipanteCursos  as a	
	Inner Join ##Temp_SageEducacao_ParticipanteCursos as b on (a.order__id = b.OrderId And a.IdProduto = b.ProdutoId)  
	

	
	
	/*
	
	Exec SPR_SageEducacao_CG_Participantes 73282628
	
	Select * from PedidoVendaParticipante
	Select * from Participante
	
	Select * from CRM_ED..tb_ParticipanteCursos
	
	
	
	Delete PedidoVendaParticipante where idpedidovendaparticipante in (5,6,7,8,9,10)
	
	select top 10 *
	from tab_faturaitens
	
	
	insert into tb_ParticipanteCursos (
--IdParticipanteCursos, -- identity
TAB_PedidaoItem_Id,
Order__Id,
Order_Detail_Id,
IdItemUnisys,
IdProduto,
QtdParticipante,
NomeParticipante,
CPFParticipante,
EmailParticipante,
dddFixoParticipante,
FoneFixoParticipante,
dddCelularParticipante,
FoneCelularParticipante,
CargoParticipante,
DepartamentoParticipante,
statusParticipante,
IdSubstituto,
IdContact,
IdCliente,
int_tab_pedidaoItem_id,
dat_alt_participante)

--IdParticipanteCursos,
select 
TAB_PedidaoItem_Id as TAB_PedidaoItem_Id,
d.Order__Id as Order__Id,
e.order_detail_id as Order_Detail_Id,
0 as IdItemUnisys,
f.product_id as IdProduto,
0 as QtdParticipante,
str_PartCur_Nome as NomeParticipante,
0 as CPFParticipante,
str_PartCur_Email as EmailParticipante,
0 as dddFixoParticipante,
0 as FoneFixoParticipante,
0 as dddCelularParticipante,
0 as FoneCelularParticipante,
str_PartCur_Cargo as CargoParticipante,
str_PartCur_Depto as DepartamentoParticipante,
1 as statusParticipante,
0 as IdSubstituto,
CONVERT(bigint, c.bn_PedidaoI_usuarios_id_ent_fk) as IdContact, -- precisa ver a necessidade
convert(bigint, bn_pedidao_clientes_id_fk) as IdCliente,
convert(bigint,TAB_PedidaoItem_Id ) int_tab_pedidaoItem_id,
getdate() as dat_alt_participante
from Tab_ParticipCursos as a
inner join tab_pedidao as b on (b.int_pedidao_status = 0 and 
                                               b.tab_pedidao_id = bn_PartCur_Pedidao_id_fk)
inner join tab_pedidaoItem as c on (c.bn_PedidaoI_pedidao_id_fk = tab_pedidao_id)
inner join order_ as d on (d.bn_order_pedidao_id_fk = b.TAB_Pedidao_Id)
inner join order_detail as e on (e.Order__Id = d.order__id)
inner join product as f on (f.product_id = c.bn_PedidaoI_prod_produtoid_fk)
where f.code_ in ('ASS004', 'ASS005', 'AXP003', 'AVK006')  




--From       CRM_ED..Fatura  as a	
	--Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)  
	--Inner Join CRM_ED..order_ as c on (a.nr_Pedido = c.Order_Number)
	--Inner Join CRM_ED..Order_Detail as d on (c.order__id = d.order__id)
	--Inner Join CRM_ED..tb_ParticipanteCursos as e on (d.Order__Id = e.order__id)
	--Inner Join SAGE_Educacao..PedidoVenda as f on (a.NR_Pedido = f.CodigoPedidoVenda)
	--Inner Join SAGE_Educacao..PedidoVendaItem as g on (f.IdPedidoVenda = g.IdPedidoVenda)	
	--Where a.numero = @FaturaID
	
	
	*/


GO
/****** Object:  StoredProcedure [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_PedidosTOSageEducacao
Data Criação     : 21/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

Create Proc [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao] 
										@FaturaID Bigint,
										@LogId Bigint
										
As

--Variaveis Para Log
Declare @Log_Id_Big BIGINT,
		@Log_Id BINARY(8),
		@Descricao VARCHAR(1000),
		@Valor VARCHAR(100),
		@User BINARY(8), -- Id do usuário Carga
		@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso			
		@ErroSql int -- Erro retornado do SQL


--Exec Log_Inicio 268, @Log_Id_Big OUTPUT
--SET @Log_Id = cast(@Log_Id_Big as binary(8))

SET @Log_Id = cast(@LogId as binary(8))

--- Carga Clientes
SET @SucessoErro = 1
SET @Descricao = 'Importando Clientes para SageEducação - SPR_SageEducacao_CG_Cliente'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Cliente @FaturaID 

SELECT @ErroSql = @@ERROR
	IF @ErroSql <> 0
		BEGIN -- @ErroSql <> 0
			SET @Descricao = 'Erro no Carga de Clientes'
			SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
			SET @SucessoErro = 0 --Erro
		END -- @ErroSql <> 0
    Else  
		BEGIN
			SET @Descricao = 'Clientes Importado com sucesso'
			SET @Valor = Convert(Varchar(15),@FaturaID)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
		END


--- Carga Vendedores
SET @SucessoErro = 1
SET @Descricao = 'Importando Vendedores para SageEducação - SPR_SageEducacao_CG_Vendedor'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Vendedor @FaturaID 

SELECT @ErroSql = @@ERROR
	IF @ErroSql <> 0
		BEGIN -- @ErroSql <> 0
			SET @Descricao = 'Erro no Carga de Vendedores'
			SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
			SET @SucessoErro = 0 --Erro
		END -- @ErroSql <> 0
    Else  
		BEGIN
			SET @Descricao = 'Vendedores Importado com sucesso'
			SET @Valor = Convert(Varchar(15),@FaturaID)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
		END


--- Carga Pedidos
SET @SucessoErro = 1
SET @Descricao = 'Importando Pedidos para SageEducação - SP_SageEducacao_CG_PedidoVenda'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SP_SageEducacao_CG_PedidoVenda @FaturaID 

SELECT @ErroSql = @@ERROR
	IF @ErroSql <> 0
		BEGIN -- @ErroSql <> 0
			SET @Descricao = 'Erro no Carga de Pedidos'
			SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
			SET @SucessoErro = 0 --Erro
		END -- @ErroSql <> 0
    Else  
		BEGIN
			SET @Descricao = 'Pedidos Importado com sucesso'
			SET @Valor = Convert(Varchar(15),@FaturaID)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
		END


--- Carga Participantes
SET @SucessoErro = 1
SET @Descricao = 'Importando Participantes para SageEducação - SPR_SageEducacao_CG_Participantes'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Participantes @FaturaID 

SELECT @ErroSql = @@ERROR
	IF @ErroSql <> 0
		BEGIN -- @ErroSql <> 0
			SET @Descricao = 'Erro no Carga de Participantes'
			SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
			SET @SucessoErro = 0 --Erro
		END -- @ErroSql <> 0
    Else  
		BEGIN
			SET @Descricao = 'Participantes Importado com sucesso'
			SET @Valor = Convert(Varchar(15),@FaturaID)
			EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
		END




IF @SucessoErro = 1
	RETURN 1 -- Indica que a procedure foi executada com Sucesso
ELSE
	RETURN 0 -- Indica qua a procedure NÃO foi executada com Sucesso
	
	
/*

Exec SPR_SageEducacao_CG_PedidosTOSageEducacao 73282628

GRANT EXECUTE ON [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao] TO SPR_SageEducacao_CG_PedidosTOSageEducacao


*/
GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Vendedor]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_Vendedor                                                         *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados da Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_Vendedor] 
										@FaturaID Bigint
										
As 	

	--Use SAGE_Educacao
		
	Declare @IdVendedor Bigint
	
	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Vendedor')        
		drop table ##Temp_SageEducacao_Vendedor  
		
	Select 
	a.int_Fatura_VendId,
	a.bn_Fatura_VendId_fk,
	b.First_Name  
	Into ##Temp_SageEducacao_Vendedor
	From       CRM_ED..Fatura  as a
		Inner Join CRM_ED..Employee as b on (a.bn_Fatura_VendId_fk = b.Employee_Id)
	Where Numero = @FaturaID
	
	Delete b
	From Vendedor as A
	Inner Join ##Temp_SageEducacao_Vendedor as b on (a.CodigoVendedor = b.int_Fatura_VendId)
	

	Insert into Vendedor(		
	Nome,
	CodigoVendedor)
	Select 	
	First_Name,
	int_Fatura_VendId
	From ##Temp_SageEducacao_Vendedor

/*

Use Sage_Educacao
Select * from Vendedor
delete Vendedor where IdVendedor in (2,3,4)

*/
GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CursoRealizar]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : rafael sanchez                                                                   *
Procedure        : [Spr_SageEducacao_CursoRealizar]                                                         *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de curso a realizar                                       *
Data             Autor rafael           criação                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoDiaria NULL, NULL, NULL, '20160704', NULL
create procedure [dbo].[Spr_SageEducacao_CursoRealizar]
 
@Ano int = NULL,
@Mes int = NULL,
@RegiaoTreinamento int = NULL,
@DataInicio datetime = null,
@DataFim datetime = null
as 

--IF(@Ano IS NULL)
--	SET @Ano = YEAR(GETDATE())

--IF(@Mes IS NULL)
--	SET @Mes = MONTH(GETDATE())

--set @Ano = YEAR(GETDATE())
--set @Mes = MONTH(GETDATE())

-- 1. Selecão das Turmas

-- exec dbo.[Spr_SageEducacao_Lista_ProducaoDiaria] 2016, 9, 1

--Drop table #Temp_20160918_ProducaoDiaria
 
select 
b.IdTurma,
d.IdTurmaOferta, 
a.Titulo, 
convert(varchar(100), '') as TipoTurma, 
CodigoTurmaOferta as CodOferta, 
b.DataInicio, b.DataFim, 
g.Descricao as RegiaoTreinamento,
b.IdRegiaoTreinamento,
case when b.DisponivelParaVenda = 1 then 'Sim' else 'Não' end as DisponivelVenda,
h.Descricao as StatusTurma,
0 as Meta,
b.QtdeMinimaInscricao as Minimo,
b.Capacidade as Capacidade,
0 as Ativo,
0 as Passivo,
0 as Cortesia,
0 as Acumulado,
Convert(money,0) as VlrReceita,
Convert(money,0) as ValorReceitaVendas
into #Temp_20160918_ProducaoDiaria
  From Curso as a	
  Inner Join Turma as b on (b.IdCurso = a.IdCurso)	
  Inner Join Formato as c on (c.IdFormato = b.IdFormato) 	
  Inner Join TurmaOferta as d on (d.IdTurma = b.IdTurma) 
  inner join RegiaoTreinamento as e on (e.IdRegiaoTreinamento = b.IdRegiaoTreinamento)
  inner join Municipio as f on (f.IdMunicipio = e.IdMunicipio)
  inner join Estado as g on (g.IdEstado = f.IdEstado)
  inner join Status as h on (h.IdStatus = b.IdStatus)
where (YEAR(b.DataInicio) = @Ano OR @Ano  IS NULL)
and (MONTH(b.DataInicio) = @Mes OR @Mes  IS NULL)
--AND (e.IdRegiaoTreinamento = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
AND (g.IdEstado = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
and  b.DataInicio between ISNULL(@DataInicio, b.DataInicio)  and ISNULL(@DataFim, b.DataInicio)

-- > '2016-09-15'

--and  b.DataInicio > '2016-09-15'


-- 2. Preenchendo o Tipo de Turma

--drop table #Temp_20160918_TipoTurma

select * into #Temp_20160918_TipoTurma from TipoTurma

declare @MinimoTipoTurma int

select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

while exists (select * from #Temp_20160918_TipoTurma )
	begin 

		update c set TipoTurma = TipoTurma + case when TipoTurma > '' then ' , ' else '' end + a.Descricao 
		from TipoTurma as a
		inner join TurmaTipoTurma as b on (b.IdTipoTurma = a.IdTipoTurma)
		inner join #Temp_20160918_ProducaoDiaria as c on (c.IdTurma = b.IdTurma)
		where a.IdTipoTurma = @MinimoTipoTurma
		
		delete #Temp_20160918_TipoTurma  where IdTipoTurma = @MinimoTipoTurma
		
		select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

	end 


-- 3. Preenchendo a quantidade e o valor da Receita   ValorReceitaVendas

update A set Ativo = QtdAtivo,
             Passivo = QtdPassivo,
             Cortesia = QtdCortesia,
			 Acumulado = QtdAcumulado,
			 VlrReceita = b.VlrReceita,
			 ValorReceitaVendas = b.ValorReceitaVendas
from #Temp_20160918_ProducaoDiaria as a
inner join (select a.IdTurmaOferta, 
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda < 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdAtivo,
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda > 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdPassivo,
			sum(case when c.IdTipoSituacao IN ( 1, 3)  and isnull(c.Valor, 0) = 0 then 1 else 0 end )as QtdCortesia,
			sum(1) as QtdAcumulado,
			SUM( c.Valor) as VlrReceita,
			isnull(f.ValorReceitaVendas,0) as ValorReceitaVendas
			from #Temp_20160918_ProducaoDiaria as a
			inner join PedidoVendaItem as b on (b.IdTurmaOferta = a.IdTurmaOferta)
			inner join TurmaOferta as turO on (b.IdTurmaOferta = turO.IdTurmaOferta)
			inner join PedidoVendaParticipante as c on (c.IdPedidoVendaItem = b.IdPedidoVendaItem)
			left outer join TipoSituacao as d on (d.IdTipoSituacao = c.IdTipoSituacao)
			inner join PedidoVenda as e on (e.IdPedidoVenda = b.IdPedidoVenda)
			inner join OrcamentoTurma as f on f.IdTurma = turO.IdTurma
			group by a.IdTurmaOferta, c.IdTipoSituacao, f.ValorReceitaVendas) as b on (b.IdTurmaOferta = a.IdTurmaOferta)

select *
from #Temp_20160918_ProducaoDiaria as a
order by RegiaoTreinamento

--select *
--from TurmaOferta


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Insert_CursoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 06/06/2016          
*  NOME: Spr_SageEducacao_InsertCursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_Insert_CursoTurma]  
												@CodigoTurmaOferta Varchar(20)

As

Declare
--Variaveis Para Log
@Log_Id_Big BIGINT,
@Log_Id BINARY(8),
@Descricao VARCHAR(1000),
@Valor VARCHAR(100),
--Variaveis genéricas
@User BINARY(8), -- Id do usuário Carga
@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso
--@QtdeAlvo int, -- Quantidade de registros alvo
@QtdeSucUpdate int,-- Quantidade de registros atualizados com sucesso
@QtdeSucInsertTemp int, -- Quantidade de registros inseridos com sucesso na tabela ##temp_carga_Prod
@QtdeSucInsertDestino int, -- Quantidade de registros inseridos com sucesso na tabela de Destino
@QtdeErro int, --  Quantidade de registros com erro
@QtdeInativo int, -- Quantidade de registros marcados como inativos
@ErroSql int, -- Erro retornado do SQL
@DataHora datetime, -- Data hora que será usada nos campos Rn_Create_Date e Rn_Edit_Date
@cmd varchar(5000), -- Para armazenar a instrução de insert na tabela temporária
-- Duas variavies para verificar o Last_id usado
@Id_BigIntMax BigInt, -- Id do Pivotal da tabela de destino em formato BigInt para ser usado na instrução de insert na tabela destino
@Id_BigIntRsys BigInt -- Id do Pivotal da tabela Rsys_Last_Id em formato BigInt para ser usado na instrução de insert na tabela destino



SET @QtdeSucUpdate = 0
SET @QtdeSucInsertTemp = 0
SET @QtdeSucInsertDestino = 0
SET @QtdeErro = 0
SET @DataHora = getdate()
Select @User = Users_id from Crm_ED..Users where login_name='Carga'


--Declare @CodigoTurmaOferta Varchar(20)
--Set @CodigoTurmaOferta = 'IMPA800042'
--Select * from SageEducacaoProdutos

IF EXISTS(SELECT 1 From CRM_ED..Product a Where a.Code_ = @CodigoTurmaOferta)
	BEGIN
		EXEC [Spr_SageEducacao_Update_CursoTurma] @CodigoTurmaOferta
	END
ELSE
	BEGIN
	Delete Crm_ED..SageEducacaoProdutos


	Insert Into Crm_ED..SageEducacaoProdutos (
	IdCurso,  
	CodigoTurma,   
	CodigoCurso,
	Titulo,    
	FormatoDescricao,
	FormatoId,
	NetIob,      
	Grupo1,     
	Grupo2,      
	OcProtec,    
	OcRetroativo,
	OcLicenca,   
	OcRede,      
	OcMail,      
	OcRenovacao, 
	RecPasta,    
	TipoProduto, 
	OCConTelefone,
	OCConFax,    
	OCConEmail,  
	DataInicio,  
	DataFim,     
	Familia,  
	ativo, 
	EstoqueControlado, 
	ProdArea,         
	UltimaEdicao,     
	UltimoSuplemento, 
	CmlProd,          
	AcessoSimult,     
	Licenca,          
	ConsultaWeb,      
	ProdutoidRede,    
	ExigeTribEstadual, 
	ExigeUsuAdm,       
	ExigeEmail,        
	LiberadoCampanha,  
	TpAcesso,           
	TpRateio,          
	ProdOrigem,        
	AcSiteAssinante,   
	Valor, 
	WelcomeNova, 
	WelcomeRen,  
	LibSar,
	LibRenova, 
	LibTmk, 
	LibLoja, 
	QtdeMinimaInscricao,
	QtdeMesesVig,    
	QtdeAcSimultDe,  
	QtdeAcSimultAte, 
	IdAreaTematica,  
	ProdutoIDPrinc,  
	CodProdPrinc,    
	QtdeConsultaTel, 
	TpDependencia,   
	CodProdTxAdesao, 
	ModAssinatura,   
	InformacaoHorario, 
	IdTipoTurma,     
	LocalCurso,      
	IdTipoCurso,     
	DataHoraPalestra, 
	DuracaoCurso,     
	NomeLink,       
	StatusPalestra, 
	TipoPalestra,   
	IdVideo,        
	CodigoPacotes,  
	TemRetencao,
	Description,
	Product_Cost,
	Origem_nacionalidade,
	bl_product_coml,
	DataAtualizacao,
	DataIntegracao,
	Capacidade) 
	Select DISTINCT
	  a.IdCurso,
	  e.CodigoTurmaOferta,
	  a.CodigoCurso,
	  a.Titulo,
	  c.Descricao, -- Descrição Formato (Midia) 
	  c.IdFormato, 
	  0, -- (Marcado com X ????)          (Netiob) 
	  'CUR' as Grupo1, -- (grupo1)
	  'Cursos' as Grupo2, --  (grupo2)
	  ' ' as OcProtec, -- (OcProtec)
	  ' ' as OcRetroativo, -- (OcRetroativo)
	  ' ' as OcLicenca, -- (OcLicenca)
	  ' ' as OcRede, -- (OcRede)
	  ' ' as OcMail, -- (OcMail)
	  ' ' as OcRenovacao, -- (OcRenovacao)
	  ' ' as RecPasta, -- (RecPasta)
	  0 as TipoProduto, -- (TipoProduto) 
	  ' ' as OCConTelefone, -- (OCConTelefone)
	  ' ' as OCConFax, -- (OCConFax)
	  ' ' as OCConEmail, -- (OCConEmail)
	  Convert(Varchar(10),e.DataInicio,112) as DataInicio,
	  Convert(Varchar(10),e.DataFim,112) as DataFim,  
	  'EDUCACAO PROFISSIONAL' as Familia, 
	  1 as bl_produtos_ativo,
	  0 as bl_produtos_EstoqueControlado,
	  1 as int_produtos_ProdArea,
	  0 as int_produtos_UltimaEdicao,
	  0 as int_produtos_UltimoSuplemento,
	  1 as int_produtos_CmlProd,
	  0 as int_produtos_AcessoSimult,
	  0 as int_produtos_Licenca,
	  0 as int_produtos_ConsultaWeb,
	  0 as int_produtos_ProdutoidRede,
	  0 as int_produtos_ExigeTribEstadual,
	  0 as int_produtos_ExigeUsuAdm,
	  0 as int_produtos_ExigeEmail,
	  0 as int_produtos_LiberadoCampanha,
	  0 as int_produtos_TpAcesso, 
	  0 as int_produtos_TpRateio,
	  0 as int_produtos_ProdOrigem,
	  0 as int_produtos_AcSiteAssinante,
	  f.Valor as my_produtos_VlrProd,
	  '' as str_produtos_WelcomeNova,
	  '' as str_produtos_WelcomeRen,
	  '' as Str_produtos_LibSar,
	  '' as Str_produtos_LibRenova,
	  'S' as Str_produtos_LibTmk,
	  '' as Str_produtos_LibLoja,  -- Verificar se todos produtos serão carregados na loja 
	  QtdeMinimaInscricao, -- as int_produtos_Qtde_SaldoEstimado,
	  0 as int_produtos_QtdeMesesVig,
	  0 as int_produtos_QtdeAcSimultDe,
	  0 as int_produtos_QtdeAcSimultAte,
	  999, --i.IdAreaTematica, --int_produtos_Categoria  Area Tematica (b.CRCD_AREA as int_produtos_Categoria)
	  0 as int_produtos_ProdutoIDPrinc,
	  a.codigoCurso as str_produtos_CodProdPrinc,
	  0 as int_produtos_QtdeConsultaTel,
	  '' as str_produtos_TpDependencia,
	  0 as str_produtos_CodProdTxAdesao,
	  0 as int_produtos_ModAssinatura,
	  e.InformacaoHorario, --,str_produtos_DataHoraCurso (POR ENQUANTO ESTA NO INSTRUTOR - ESTA INFORMAÇÃO DEVE ESTA NA TURMAOFERTA)
	  h.IdTipoTurma,-- as int_produtos_TurnoCurso (Evandro esta Verificando)
	  m.Descricao, --str_produtos_LocalCurso  
	  'FORMAÇÃO',--n.IdTipoCurso,  --int_produtos_TpCurso
	  0 as DataHoraPalestra,
	  0 as DuracaoCurso,
	  'teste link ' as NomeLink, -- (Turma) Evandro esta verificando
	  0 as StatusPalestra,
	  0 as TipoPalestra,
	  0 as IdVideo,
	  '   ,   ,   ,   ,   ' as CodigoPacotes,
	  1 as TemRetencao,
	  c.Descricao,
	  f.Valor,
	  'SAO PAULO' as Origem_nacionalidade,
	  CASE WHEN e.IdStatus = 8 THEN 0 ELSE 1 END as bl_product_coml, --Retirar as turmas ofertas canceladas
	  GETDATE(),
	  '1900-01-01',
	  e.Capacidade 
	  From Curso as a
	  inner Join CursoModulo as b on (a.IdCurso = b.IdCurso)
	  Inner Join Turma as d on (a.IdCurso = d.IdCurso)
	  Inner Join Formato as c on (c.IdFormato = d.IdFormato) 
	  Inner Join TurmaOferta as e on (d.IdTurma = e.IdTurma) 
	  left Join  TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
	  Inner Join TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
	  Inner Join TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
	  ----Inner Join AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
	  Inner Join RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
	  Inner Join Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
	  --Inner Join TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
	  Where  e.CodigoTurmaOferta = @CodigoTurmaOferta
	  --Where  e.CodigoTurmaOferta in ('DACP337919') 
	  And f.ExportaCrm = 1
  
  
  Set @QtdeSucInsertDestino = @@ROWCOUNT 

	Select @Id_BigIntMax = cast(max(Product_Id) as bigint) from Crm_ED..Product
	Select @Id_BigIntRsys = cast(Last_Id_Value as bigint) from Crm_ED..Rsys_Last_Id where Table_Name = 'Product'
	 
	-- Compara o último ID usado na tabela de Destino com o ID da tabela Rsys_Last_id
	IF @Id_BigIntMax <> @Id_BigIntRsys
				BEGIN
							SET @Descricao = 'O último ID usado não corresponde com o ID da tabela Rsys_Last_Id'
							SET @Valor = cast(Getdate() as varchar)                       
							IF @Id_BigIntMax > @Id_BigIntRsys
									   SET @Id_BigIntRsys = @Id_BigIntMax
				END

	 

	if @Id_BigIntRsys is null
				SET @Id_BigIntRsys = 1



	-- Atualização do Rsys_Last_Id prevendo as inserções que serão realizadas
	SET @Id_BigIntRsys = @Id_BigIntRsys + 1
	Update Crm_ED..Rsys_Last_Id SET Last_Id_Value = cast(@Id_BigIntRsys as binary(8)) Where Table_Name = 'Product'



	---------- ATUALIZANDO PRODUCT
	INSERT INTO Crm_ED..Product (
	Product_Id, 
	Code_, --CodProd
	Product_Name, --Descricao
	Rn_Descriptor, 
	NETIOB, --Netiob
	Grupo1,
	Grupo2,
	Gera_Protec, --OcProtec
	Produto_Retroativo, --OcRetroativo
	Licenca, --OcLicenca
	Produto_Rede, --bl_produtos_ProdRede
	OC_Consulta_EMail, --OcConEmail
	OC_Renovacao, --OcRenovacao
	RecPasta, --RecPasta
	TipoProduto, --TipoProduto
	OC_Consulta_Tel,
	OC_Consulta_Fax, --OcConFax
	str_prod_VigenciaInicial, --str_produtos_VigenciaInicial
	str_prod_VigenciaFinal, --str_produtos_VigenciaFinal
	Familia, --Familia
	Inativo,
	str_prod_TpEstoqueControlado, 
	int_prod_ProdArea, 
	int_prod_UltimaEdicao,
	int_prod_UltimoSuplemento, 
	int_prod_CmlProd, 
	Produto_Licenca, --OcLicenca
	int_prod_ConsultaWeb , 
	Rede,
	int_prod_ExigeTribEstadual,
	int_prod_ExigeUsuAdm,
	int_prod_ExigeEmail, 
	int_prod_LiberadoCampanha,
	int_prod_TpAcesso, 
	int_prod_TpRateio, 
	int_prod_ProdOrigem,
	int_prod_AcSiteAssinante, 
	Product_Cost, -- Valor do produto
	str_produtos_WelcomeNova,
	str_produtos_WelcomeRen,
	str_produtos_LibSAR,
	str_produtos_LibRenova,
	str_produtos_LibTMK,
	str_produtos_LibNova,
	--QtdeMinimaInscricao,
	int_prod_QtdeMesesVig,
	int_prod_QtdeAcSimultDe,
	int_prod_QtdeAcSimultAte,
	--IdAreaTematica,
	int_prod_ProdutoIDPrinc,
	str_prod_CodProdPrinc,
	str_prod_TpDependencia, 
	str_prod_CodProdTxAdesao,
	int_prod_ModAssinatura,
	Carga_Horaria,
	--InformacaoHorario,
	--LocalCurso,      
	--IdTipoCurso,     
	DataHoraPalestra, 
	DuracaoCurso,     
	NomeLink,
	StatusPalestra, 
	TipoPalestra,   
	IdVideo, 
	CodigoPacotes,  
	TemRetencao,
	Rn_Create_Date,
	Rn_Create_User,
	Rn_Edit_Date,
	Rn_Edit_User,
	Num_produtoIOB,
	bl_product_coml,
	Origem_nacionalidade,
	Formato,
	Int_Prod_Qtde_SaldoEstimado)
	Select 
	Convert(Binary(8),@Id_BigIntRsys),
	CodigoTurma,
	Substring(Titulo,1,39),    
	CodigoCurso + ' - ' + Titulo,  --Descricao,
	NetIob,      
	Grupo1,     
	Grupo2,      
	OcProtec,    
	OcRetroativo,
	OcLicenca,   
	OcRede,      
	Case When OcMail = '' Then 0 End,      
	OcRenovacao, 
	RecPasta,    
	TipoProduto, 
	OCConTelefone,
	OCConFax,    
	substring(datainicio,3,2) + substring(datainicio,5,2) + substring(datainicio,7,2) as DataInicio,
	substring(DataFim,3,2) + substring(DataFim,5,2) + substring(DataFim,7,2) as DataFim,
	Familia,     
	ativo, 
	EstoqueControlado, 
	ProdArea,         
	UltimaEdicao,     
	UltimoSuplemento, 
	CmlProd,            
	Licenca,          
	ConsultaWeb,      
	ProdutoidRede,    
	ExigeTribEstadual, 
	ExigeUsuAdm,       
	ExigeEmail,        
	LiberadoCampanha,  
	TpAcesso,           
	TpRateio,          
	ProdOrigem,        
	AcSiteAssinante,   
	Product_Cost, -- Product_Cost, -- valor 
	WelcomeNova, 
	WelcomeRen,  
	LibSar,
	LibRenova, 
	LibTmk, 
	LibLoja, 
	--QtdeMinimaInscricao,
	QtdeMesesVig,    
	QtdeAcSimultDe,  
	QtdeAcSimultAte, 
	--IdAreaTematica,  
	ProdutoIDPrinc,  
	CodProdPrinc,     
	TpDependencia,   
	CodProdTxAdesao, 
	ModAssinatura,   
	InformacaoHorario,
	--IdTipoTurma,     
	--LocalCurso,      
	--IdTipoCurso,     
	DataHoraPalestra, 
	DuracaoCurso,     
	'Teste Link', -- NomeLink,       
	StatusPalestra, 
	TipoPalestra,   
	IdVideo,        
	CodigoPacotes,  
	TemRetencao,
	GETDATE(),
	0x000000000001853C,
	GETDATE(),
	0x000000000001853C,
	@Id_BigIntRsys,
	bl_product_coml,
	Origem_nacionalidade,
	FormatoId,
	Capacidade
	From Crm_ED..SageEducacaoProdutos




	--- Inserindo na Product_Group
	insert into Crm_ED..Product_Group (
	Product_Group_Id,
	Rn_Descriptor,
	Rn_Create_Date,
	Rn_Create_User,
	Rn_Edit_Date,
	Rn_Edit_User,
	int_prodGroup_id_pk,
	str_prodGroup_descricao,
	Str_ProdGroup_CodProdPaiIkeda)
	select Product_Id,
	Rn_Descriptor
	Rn_Descriptor,
	Rn_Create_Date,
	Rn_Create_User,
	Rn_Edit_Date,
	Rn_Edit_User,
	Convert(Bigint,Product_Id),
	Product_Name,
	'CUR' + code_
	From Crm_ED..Product where Product_Id = @Id_BigIntRsys

	Update Crm_ED..product 
	set bn_prod_ProdGroup_id_fk = @Id_BigIntRsys 
	where code_ = @CodigoTurmaOferta


	--------- Inserindo dados na
	Declare @tab_precobase_ID Binary(8)


	If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Tab_PrecoBase')        
		drop table ##Temp_SageEducacao_Tab_PrecoBase  


	SELECT product_id, code_,  Product_Name,  Product_Cost , familia,str_prod_VigenciaInicial,Origem_nacionalidade
	into ##Temp_SageEducacao_Tab_PrecoBase
	FROM Crm_ED..PRODUCT AS A
	WHERE GRUPO1 in ( 'CUR') AND 
		  bl_product_Coml = 1 AND
		  Product_Cost > 0 AND 
		 (convert(datetime, str_prod_VigenciaInicial) >= convert(varchar(10), getdate(), 111) or    
		  str_prod_VigenciaInicial = '991231') and  
		  a.Origem_nacionalidade <> 'Curso Fechado' 
		  and not (CodigOPacotes <> '   ,   ,   ,   ,   ' and Formato = 7) 
		  and code_ =  @CodigoTurmaOferta
		  
			  
		 exec Crm_ED..ObterId 'tab_precobase', @tab_precobase_ID output
		

			  
		 Insert into Crm_ED..Tab_PrecoBase ( 
				   TAB_PrecoBase_Id,
				   Rn_Descriptor,
				   Rn_Create_Date,
				   Rn_Create_User,
				   Rn_Edit_Date,
				   Rn_Edit_User,
				   bn_Preco_prod_produtoid_pk_fk,
				   int_Preco_QtdeAcSimult_pk,
				   int_Preco_QtdeMaxParc,
				   my_Preco_ValorBase,
				   dt_preco_DtProducao,
				   dt_preco_DtExpiracao,
				   int_preco_VigComQtdeMeses,
				   int_preco_AtualizaDescriptor,
				   int_Preco_QtdeAcSimultAte_pk,
				   int_Preco_QtdeConsultaWeb_pk)
		 select                             
				   @tab_precobase_ID,
				   code_ + ' ' + substring(Product_Name, 1, 30) + ' - R$ ' + cast(Product_Cost as varchar(16)) ,
				   getdate(),
				   cast(0 as binary(8)),
				   getdate(),
				   cast(0 as binary(8)),
				   product_id,
				   0,
				   case when familia = 'LUCRE' then 5 else 1 end ,
				   Product_Cost,
					case when datepart(hour, getdate()) > 22 then convert(varchar(12), getdate() + 1, 113) else  convert(varchar(12), getdate() , 113) end,
				   '3000-12-31',
				   0,
				   0,
				   0,
				   0
		from     ##Temp_SageEducacao_Tab_PrecoBase 


---------------------------- TAB_PVxProd

	Declare @TAB_CadPVCur_Id binary(8)

	Select @TAB_CadPVCur_Id = convert(binary(8), min(convert(bigint, TAB_CadPV_Id)) )	
	from Crm_ED..tab_cadpv where bl_CadPv_PvAtiva = 1 and
										int_CadPv_TipoPV = 1 and 
									   substring(str_CadPv_Codigo, 1, 6) = 'PCCUR-' and
									   dt_CadPv_DtProducao <= convert(varchar(10), getdate(), 112) and 
									   dt_CadPv_DtExpiracao >= convert(varchar(10), getdate(), 112)

	print @TAB_CadPVCur_Id

	if  exists (select * from tempdb..sysobjects where name = '##temp_20071003_product_Edu' and upper(xtype) = 'U')  
		DROP TABLE ##temp_20071003_product_Edu

	SELECT TAB_CadPV_Id, product_id, code_,  Product_Name,  Product_Cost , familia
	INTO ##temp_20071003_product_Edu
	From (SELECT @TAB_CadPVCur_Id as TAB_CadPV_Id, product_id, code_,  Product_Name,  Product_Cost , familia
			FROM Crm_ED..Product as a
			WHERE a.grupo1 = 'CUR' and  
				  --a.Formato in ('0', '8', '7', '9', '1', '2', '3', '5') and   
				  a.bl_product_Coml = 1 and   
				 (convert(datetime, str_prod_VigenciaInicial) >= convert(varchar(10), getdate(), 111) or    
				  str_prod_VigenciaInicial = '991231') and  
				  a.Origem_nacionalidade <> 'Curso Fechado' 
				  and not (CodigoPacotes <> '   ,   ,   ,   ,   ' and Formato = 7) -- NÃO deve enviar nenhuma palestra que é disponibilizado para o Super Pacotes
				  and code_ =  @CodigoTurmaOferta 	
	) as A


	--UPDATE B 
	--SET RN_EDIT_DATE = CONVERT(VARCHAR(10), GETDATE(), 112),
	--	my_PVxProd_ValorBase = A.Product_Cost
	--	FROM ##temp_20071003_product_Edu as a,
	--	TAB_PVxProd as b
	--WHERE  a.TAB_CadPV_Id = b.bn_PVxProd_CadPV_id_fk AND
	--	   a.product_id = b.bn_PVxProd_Product_Id_fk
	          
	          
	  
	--DELETE A
	--FROM TAB_PVxProd AS A
	--inner join PRODUCT AS B on (b.Product_Id = bn_PVxProd_Product_Id_fk)
	--inner join TAB_CadPV as c on (c.TAB_CadPV_Id = a.bn_PVxProd_CadPV_id_fk)
	--WHERE c.str_CadPv_Codigo in ('PCCUR-001') AND 
	--	  A.RN_EDIT_DATE <> CONVERT(VARCHAR(10), GETDATE(), 112)          
	 
	declare @QtdRegistros int
	declare @bn_Tab_PVxProdutos_Id  int 

	exec Crm_ED..ObterId 'TAB_PVxProd', @tab_precobase_ID output
	 
	print @bn_Tab_PVxProdutos_Id

	INSERT INTO Crm_ED..TAB_PVxProd(
							bn_PVxProd_CadPV_id_fk,
							bn_PVxProd_Product_Id_fk,
							int_PVxProd_VigComQtdeMeses,
							int_PVxProd_QtdeAcSimult_pk,
							int_PVxProd_QtdeAcSimultAte_pk,
							int_PVxProd_QtdeConsultaWeb_pk,
							my_PVxProd_ValorBase,
							int_PVxProd_QtdMinima,
							Tab_PVxProd_Id,
							Rn_Descriptor,
							Rn_Create_Date,
							Rn_Create_User,
							Rn_Edit_Date,
							Rn_Edit_User)

				select 
							CAST(TAB_CadPV_Id AS BINARY(8)),                        
							product_id,
							0,
							0,
							0,
							0,
							Product_Cost,
							1,
							product_id,
							'???',                                                                                                   
							GETDATE()       ,
							0          ,
							GETDATE()       ,
							0
				from ##temp_20071003_product_Edu
                            

---- Carregando TAB_ProdFil	
	Declare @ProductId Bigint
	
	Select @ProductId = Convert(Bigint,product_id)
	from ##temp_20071003_product_Edu

	Select @Id_BigIntRsys = cast(Last_Id_Value as bigint) from Crm_ED..Rsys_Last_Id where Table_Name = 'TAB_ProdFil'
	Select @Id_BigIntRsys = @Id_BigIntRsys + 1

	If exists (select 1 from tempdb..sysobjects where name = '##temp_SageEducacao_ProdFil')        
		drop table ##temp_SageEducacao_ProdFil  
	 
	--Set @cmd = 'SELECT IDENTITY(int, ' + cast(@Id_BigIntRsys as varchar) + ',1) AS CampoId,Nome, 
	--Filial_Id, ' + Cast(@ProductId as Varchar) + ' as ProductId
	--INTO ##temp_SageEducacao_ProdFil
	--FROM Filial'	
	--EXECUTE(@cmd)

    Select IDENTITY(Int,1,1) as CampoId,Nome,Filial_id
    Into ##temp_SageEducacao_ProdFil
    FROM Crm_ED..Filial


	INSERT INTO Crm_ED..TAB_ProdFil
			(
			bn_ProdFil_filiais_id_pk_fk,  -- int_ProdFil_filiais_ID_pk_fk
			bn_ProdFil_prod_id_pk_fk,  -- int_ProdFil_produtos_ID_pk_fk
			int_ProdFil_filiais_id_pk_fk,  -- int_ProdFil_filiais_ID_pk_fk
			int_ProdFil_prod_id_pk_fk,  -- int_ProdFil_produtos_ID_pk_fk
			Rn_Create_Date,  -- @DataHora
			Rn_Create_User,  -- @User
			Rn_Descriptor,  -- NAO INFORMADO
			Rn_Edit_Date,  -- @DataHora
			Rn_Edit_User,  -- @User
			TAB_ProdFil_Id  -- CampoId
			)
		SELECT
			Filial_Id, --bn_ProdFil_filiais_id_pk_fk
			@ProductId, --bn_ProdFil_prod_id_pk_fk
			Filial_Id, --int_ProdFil_filiais_id_pk_fk
			@ProductId, --int_ProdFil_prod_id_pk_fk
			@DataHora, --Rn_Create_Date
			@User, --Rn_Create_User
			Nome + ' - ' + @CodigoTurmaOferta, --Rn_Descriptor
			@DataHora, --Rn_Edit_Date
			@User, --Rn_Edit_User
			@Id_BigIntRsys + CampoId  --TAB_ProdFil_Id
	  	FROM ##temp_SageEducacao_ProdFil
	
	
		Select @Id_BigIntMax = cast(max(TAB_ProdFil_Id) as bigint) from Crm_ED..TAB_ProdFil
        Update Crm_ED..Rsys_Last_Id SET Last_Id_Value = cast(@Id_BigIntMax as binary(8)) Where Table_Name = 'TAB_ProdFil'
END

/*

GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Insert_CursoTurma] TO app_educacao
GRANT SELECT ON [dbo].[Filial] TO usr_infraprd
GRANT UPDATE ON [dbo].[Filial] TO usr_infraprd
GRANT DELETE ON [dbo].[Filial] TO usr_infraprd
GRANT INSERT ON [dbo].[Filial] TO usr_infraprd


APUR/8	APUR588747
DPAS/28	DPAS607928
DELU/6	DELU823877


APUR/8	APUR588747
DELU/6	DELU823877
APCI/4H22 	APCI400382
APCI/4H22 	APCI301541
DELU/61230	DELU366673
DELU/61230	DELU358156

CAIC/8161	DELU/61230	160	400.00
APCI301541	APCI/4H22 	189	1111.11
DELU276249	DELU/61230	191	100.00

DELU823877       
APUR588747      


APUR911253

Declare @Codigo Varchar(20)
Set @Codigo = 'DACP337919'
               
Exec Spr_SageEducacao_Insert_CursoTurma @Codigo

Use Crm_ED
Select * from SageEducacaoProdutos
Select Formato,Carga_Horaria,Product_Cost,* from product where code_ = @Codigo
Select * from Product_Group where Product_Group_Id in (Select product_id from product where code_ = @Codigo)
Select * from Tab_PrecoBase where bn_Preco_prod_produtoid_pk_fk in (Select product_id from product where code_ = @Codigo)
Select * from TAB_PVxProd where bn_PVxProd_Product_Id_fk in (Select product_id from product where code_ = @Codigo)
Select * from TAB_ProdFil where bn_ProdFil_prod_id_pk_fk in (Select product_id from product where code_ = @Codigo)

Declare @Codigo Varchar(20)
Set @Codigo = 'DELU823877'

Delete SageEducacaoProdutos
Delete TAB_ProdFil where bn_ProdFil_prod_id_pk_fk in (Select product_id from product where code_ = @Codigo)
Delete TAB_PVxProd where bn_PVxProd_Product_Id_fk in (Select product_id from product where code_ = @Codigo)
Delete Tab_PrecoBase where bn_Preco_prod_produtoid_pk_fk in (Select product_id from product where code_ = @Codigo)
Delete Product_Group where Product_Group_Id in (Select product_id from product where code_ = @Codigo)
Delete product where code_ = @Codigo


'IMPA800042'


select str_prod_VigenciaInicial from product

Select *
from product
where product_id = convert(Binary(8),139346)


Select convert(Bigint,product_id)
from product
order by  product_id desc 


Msg 2627, Level 14, State 1, Procedure Spr_SageEducacao_AtualizaCursoTurma, Line 217
Violation of PRIMARY KEY constraint 'Product_I'. Cannot insert duplicate key in object 'dbo.Product'. The duplicate key value is (0x0000000000022055).


Select Num_produtoIOB,GRUPO1,GRUPO2,int_prod_CmlProd,int_prod_prodArea,str_produtos_LibNova,str_produtos_LibTMK,*
from product
where code_  in ('ANA3200039',
'AJUS800037',
'AJUS800038')

Select Num_produtoIOB,GRUPO1,GRUPO2,int_prod_CmlProd,int_prod_prodArea,str_produtos_LibNova,str_produtos_LibTMK,*
from product
where code_  in ('AJUS800038')


Select *
from TAB_ProdFil
order by bn_ProdFil_prod_id_pk_fk


SELECT *
FROM TAB_ProdFil
WHERE bn_ProdFil_prod_id_pk_fk IN (0x0000000000022040)


0x0000000000022041
0x0000000000022040

0x0000000000022052

Update TAB_ProdFil
Set bn_ProdFil_prod_id_pk_fk = 0x0000000000022052
Where Tab_ProdFil_id in (
0x000000000006D525,
0x000000000006D526,
0x000000000006D522,
0x000000000006D523,
0x000000000006D52A,
0x000000000006D52E,
0x000000000006D531,
0x000000000006D51E,
0x000000000006D533,
0x000000000006D535,
0x000000000006D539,
0x000000000006D53C,
0x000000000006D53E)





Update product
Set int_prod_CmlProd = 1,
int_prod_prodArea = 1,
str_produtos_LibNova = 'S',
str_produtos_LibTMK = 'S',
inativo = 0,
Description = 'Teste 123',
Product_Cost = 800,
tipo = 6,
features = 'teste 1234',
familia = 'EDUCACAO PROFISSIONAL',
Carga_Horaria = '9H AS 18H',
bl_product_coml = 1,
str_prod_vigenciaInicial = '160725',
str_prod_vigenciaFinal = '161130',
int_prod_Categoria = 4,
bn_Prod_ProdGroup_id_Fk = 0x0000000000021A95,
UnidadeNegocio = 6,
str_prod_CodProdPrinc = 'AJUS8',
origem_nacionalidade = 'SAO PAULO',
DataHoraPalestra ='2016-07-23 08:30:00.000',
str_prod_CodProdPaiIkeda = 'AJUS800038',
CodigoPacotes = '   ,   ,   ,   ,   ',
Formato = 0
where code_  in ('AJUS800038')



    --Where  e.CodigoTurmaOferta in ('ANA3200039') --,'AJUS800037','AJUS800038')
--Select * from Sage_Educacao..TurmaOferta

Select e.*
From Sage_Educacao..Curso as a
  inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  left Join  Sage_Educacao..TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
  Inner Join Sage_Educacao..TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
  Inner Join Sage_Educacao..TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
  ----Inner Join Sage_Educacao..AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
  Inner Join Sage_Educacao..RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
  Inner Join Sage_Educacao..Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
  --Inner Join Sage_Educacao..TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
  Where  e.CodigoTurmaOferta in ('ANA3200039','AJUS800037','AJUS800038')

--Select * from curso where codigocurso = 'ANA32'
--Select * from CursoModulo where idcurso = 28
--Select * from Turma where idcurso = 28
--Select * from TurmaOferta where idturma in (10,19,36)

--Select * from TipoTurma
--Select * from TipoCurso
--product_codigoprod



'ANA3200039',
'AJUS800037',
'AJUS800038')

Select Code_,bn_prod_ProdGroup_id_fk,Convert(bigint,product_id),Product_Name from product where code_ = 'AJUS800038'


insert into Product_Group (Product_Group_Id, Rn_Descriptor, Rn_Create_Date, Rn_Create_User, Rn_Edit_Date, Rn_Edit_User, int_prodGroup_id_pk,str_prodGroup_descricao, Str_ProdGroup_CodProdPaiIkeda )
select convert(binary(8), 139346), 'Atualização Tributária 2016', getdate(), 0, getdate(), 0, 139346, 'Atualização Tributária 2016', 'CURAJUS800038'

Update product SEt bn_prod_ProdGroup_id_fk = convert(binary(8), 139346) where code_ = 'AJUS800038'



 int_produtos_cmlprod = 1
					,int_produtos_prodArea = 1---0
					,str_produtos_LibVnova = 'S'--- NULL
					,str_produtos_LibTMK = 'S'



Select * from SageEducacao..SageEducacaoProdutos

Select Convert(Bigint,Product_id),* 
from product
order by rn_create_date desc


Select Convert(Bigint,Max(Product_id))
from product


Select Convert(Bigint,Max(Num_produtoIOB))
from product





Delete product
where product_id = 0x0000000000002712

Update product
set bl_product_Coml = 1
where product_id = 0x0000000000002712


Select Product.*
From Tab_PVxProd (nolock) 
JOIN Product (nolock) ON Tab_PVxProd.bn_PVxProd_Product_Id_FK = Product.Product_Id
JOIN Tab_CadPV ON Tab_PVxProd.bn_PVxProd_CadPV_Id_FK = Tab_CadPV.TAb_CadPV_Id
Where Product.bl_product_Coml = 1 


Select Max(Convert(Bigint,TAB_PrecoBase_Id)) From Tab_PrecoBase

Select Max(Convert(Bigint,Last_Id_Value)) from RSys_Last_Id where Table_Name = 'tab_precobase'

Update RSys_Last_Id
set Last_Id_Value = Convert(Binary(8),580560)
where Table_Name = 'tab_precobase'


*/






GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_InsertNotificacaoCurso]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************************************
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Fabio Luz
*  DATA DE CRIAÇÃO: 01/09/2016
*  NOME: spr_SageEducacao_InsertNotificacaoCurso
*  OBS: Grava notificacao enviada
*  DATA         /        DESENVOLVEDOR          /      ALTERAÇÃO
**************************************************************************************************/
CREATE PROCEDURE [dbo].[spr_SageEducacao_InsertNotificacaoCurso]
(
		@IdTurma	INT,
		@IdFatura	BIGINT,
		@IdFaturaItem	BIGINT,
		@IdProduto	BIGINT,
		@Destinatario	VARCHAR(200),
		@AssuntoEmail	VARCHAR(300),
		@CorpoEmail	VARCHAR(MAX),
		@DataInclusao	SMALLDATETIME
)  
AS

   SET NOCOUNT ON

	INSERT INTO [SAGE_Educacao].[dbo].[NotificacaoCursos]
           ([IdTurma]
           ,[IdFatura]
           ,[IdFaturaItem]
           ,[IdProduto]
           ,[Destinatario]
           ,[AssuntoEmail]
           ,[CorpoEmail]
           ,[DataInclusao])
     VALUES
           (@IdTurma
           ,@IdFatura
           ,@IdFaturaItem
           ,@IdProduto
           ,@Destinatario
           ,@AssuntoEmail
           ,@CorpoEmail
           ,@DataInclusao)

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  /*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 14/07/2016          
*  NOME: Spr_SageEducacao_Lista_AtualizaCursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/     
  
  CREATE Proc [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma]
  
  As
  
  Select Distinct CodigoTurmaOferta,
  Case when g.Code_ is null Then 'I' Else 'A' End as TipoAtualizacao,
  d.IdTurma as IdTurma
  From Sage_Educacao..Curso as a
  Inner Join CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join TurmaOferta as e on (d.IdTurma = e.IdTurma)
  Left  Join  TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta) 
  Left  Join CRM_ED..Product as g on (e.CodigoTurmaOferta = g.Code_ COLLATE Latin1_General_CI_AS)   
  where (d.DataAtualizacao > ISNULL(d.DataIntegracao, '1900-01-01 00:00:00.000') or e.DataAtualizacao > ISNULL(e.DataIntegracao, '1900-01-01 00:00:00.000'))
  and CodigoTurmaOferta is not null
  and len(CodigoTurmaOferta) <= 10
  And f.ExportaCrm = 1
  
  /*
ASSA956619
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma] TO app_educacao
Use Sage_Educacao

Exec Spr_SageEducacao_Lista_AtualizaCursoTurma

Turma formato presencial: APUR/8

Turma formato web ao vivo: DPAS/28 

Turma formato web gravado: DELU/6

2016-08-24 09:37:13.797               APUR588747      10
2016-08-24 11:32:10.820               DPAS607928      10
2016-08-24 12:52:14.097               DELU823877       10
2016-08-24 14:44:29.637               APCI400382        10
2016-08-24 22:55:03.590               DELU366673       10
2016-08-24 14:44:29.637               APCI301541        10
2016-08-24 22:55:03.590               DELU358156       10





--Select a.codigocurso,e.codigoturmaoferta
  Select e.*
  From Sage_Educacao..Curso as a
  Inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  Left  Join CRM_ED..Product as f on (e.CodigoTurmaOferta = f.Code_ COLLATE Latin1_General_CI_AS)     
  where codigocurso in ('APUR/8','DELU/6','APCI/4H22','DELU/61230')



-- where codigoturmaoferta in ('APUR588747','DELU823877','APCI400382','DELU366673','APCI301541','DELU358156')

,'DPAS607928'


Update Turma
Set DataIntegracao = getdate()
where idturma in (66,67,68,66,67,68)
PREP420871
AA3456700086   
AATRY002146
Select * from Sage_Educacao..TurmaOferta Where idturma = 64

Select * From Sage_Educacao..Curso where CodigoCurso in ('AATRY001','AATRY002','AATRY003','AATRY004')

Select * from Turma where idcurso in (50,51,52,53)


Alter table CursoModulo
Add CargaHorariaBaseMin Int Default 0 


Alter table Endereco
Alter Column Bairro Varchar(100)


Select *
from product
where grupo1 = 'CUR'
And Rn_Create_Date between '2014-01-01 00:58:13.860' and '2014-12-31 23:58:13.860'
order by Product_name

  
  */
GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_Lista_Dados_Atendimento]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rafael
-- Create date: fev 2017
-- Description:	suporte a ajax method in sage educacao
-- =============================================

-- exec spr_SageEducacao_Lista_Dados_Atendimento '2/23/2017','2/24/2017'


CREATE PROCEDURE [dbo].[spr_SageEducacao_Lista_Dados_Atendimento]
	-- Add the parameters for the stored procedure here
	@DataInical varchar(10)=null, @Datafinal varchar(10)=null
AS
BEGIN
	
	SET NOCOUNT ON;


	select distinct tof.CodigoTurmaOferta, 
		tur.Observacao,  
		cur.IdCurso, 
		cur.CodigoCurso, 
		Upper(cur.Titulo) Titulo, 
		cur.Subtitulo, 
		tur.IdTurma,
		tur.DataInicio,
		tur.DataFim, 
		Tof.IdTurmaOferta,
		Form.Descricao as 'Formato',
		Mun.Descricao as 'DescMunicipio',
		tur.InformacaoData, 
		tur.CargaHoraria,
		isnull(tur.CargaHorariaMin, 0) CargaHorariaMin,
		tur.InformacaoHorario, 
		tur.DataCadastro, 
		tur.IdStatus, 
		s.Descricao as 'StatusDescricao', 
		es.UF as 'Local',
		locTrei.Descricao as CentroLocalTreinamento,
		salaTrein.Descricao as SalaTrein
		from Curso cur inner join Turma tur
		on cur.IdCurso = tur.IdCurso
		inner join TurmaOferta Tof
		on Tof.IdTurma = tur.IdTurma
		inner join [Status] s
		on tur.IdStatus = s.IdStatus
		inner join RegiaoTreinamento rt
		on tur.IdRegiaoTreinamento=rt.IdRegiaoTreinamento
		inner join Municipio Mun
		on Mun.IdMunicipio = rt.IdMunicipio
		inner join Estado es
		on es.IdEstado = Mun.IdEstado
		inner join Formato Form
		on  Form.IdFormato = tur.IdFormato
		left join LocalRealizacao locReal
		on Tof.IdTurmaOferta = locReal.IdTurmaOferta
		left join LocalTreinamento locTrei
		on locReal.IdLocalTreinamento = locTrei.IdLocalTreinamento
		left join SalaTreinamento salaTrein
		on locTrei.IdLocalTreinamento = salaTrein.IdLocalTreinamento
		where  tur.DataInicio between ISNULL(@DataInical,tur.DataInicio) and ISNULL(@Datafinal,tur.DataInicio) 
	order by tur.DataInicio asc

END

GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_Lista_Dados_TurmaView]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rafael sanchez
-- Create date: outubro 2016
-- Description:	geração de dados apra view turma pesquisa e index em sage educação
-- =============================================
CREATE PROCEDURE [dbo].[spr_SageEducacao_Lista_Dados_TurmaView] 
	@text  varchar (100) = null ,
	@DataInical datetime= null,
	@Datafinal datetime= null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select distinct tof.CodigoTurmaOferta, 
tur.Observacao,  
cur.IdCurso, 
cur.CodigoCurso, 
cur.Titulo, 
cur.Subtitulo, 
tur.IdTurma,
tur.DataInicio,
tur.DataFim, 
Tof.IdTurmaOferta,
Form.Descricao as 'Formato',
Mun.Descricao as 'DescMunicipio',
tur.InformacaoData, 
tur.CargaHoraria,
isnull(tur.CargaHorariaMin, 0) CargaHorariaMin,
tur.InformacaoHorario, 
tur.DataCadastro, 
tur.IdStatus, 
s.Descricao as 'StatusDescricao', 
es.UF as 'Local',
locTrei.Descricao as CentroLocalTreinamento
,salaTrein.Descricao as SalaTrein
from Curso cur inner join Turma tur
on cur.IdCurso = tur.IdCurso
inner join TurmaOferta Tof
on Tof.IdTurma = tur.IdTurma
inner join [Status] s
on tur.IdStatus = s.IdStatus
inner join RegiaoTreinamento rt
on tur.IdRegiaoTreinamento=rt.IdRegiaoTreinamento
inner join Municipio Mun
on Mun.IdMunicipio = rt.IdMunicipio
inner join Estado es
on es.IdEstado = Mun.IdEstado
inner join Formato Form
on  Form.IdFormato = tur.IdFormato
left  join LocalRealizacao locReal
on Tof.IdTurmaOferta = locReal.IdTurmaOferta
left join LocalTreinamento locTrei
on locReal.IdLocalTreinamento = locTrei.IdLocalTreinamento
left join SalaTreinamento salaTrein
on locTrei.IdLocalTreinamento = salaTrein.IdLocalTreinamento
where (@text IS NULL or cur.Titulo like '%' + @text + '%'
or cur.Subtitulo like  '%' +@text + '%'
or cur.CodigoCurso like '%' + @text + '%'
or s.Descricao  like  '%' + @text + '%'
or tof.CodigoTurmaOferta  like  '%' + @text + '%'
or Form.Descricao  like  '%' + @text + '%'
or Mun.Descricao like  '%' + @text + '%')
--or cur.PontuacaoCRC >''
and tur.DataInicio between ISNULL(@DataInical,tur.DataInicio) and ISNULL(@Datafinal,tur.DataInicio) 
order by tur.IdTurma desc
end

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_FaturaPedidosCRM]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matusmoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_Lista_FaturaPedidosCRM
*  OBS:  Lista FaturaPedidos
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/     
  
 CREATE Proc [dbo].[Spr_SageEducacao_Lista_FaturaPedidosCRM]
  
  As
  
  Select Distinct IdPedidosFaturasCRM,NrPedido,NrFatura
  From PedidosFaturasCRM
  where Status = 0

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_ProducaoAnual]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoAnual                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Anual                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoAnual 2016

CREATE procedure [dbo].[Spr_SageEducacao_Lista_ProducaoAnual] @Ano int 
as
--declare @Ano int

--set @Ano = 2016


-- 1. Selecão das Turmas

--Drop table #Temp_20160918_ProducaoAnual
  
select 
a.IdCurso,
a.CodigoCurso,
a.Titulo,
convert(varchar(100), '') as AreaTematica,
0 as QtdJan,
0 as QtdFeb,
0 as QtdMar,
0 as QtdApr,
0 as QtdMay,
0 as QtdJun,
0 as QtdJul,
0 as QtdAug,
0 as QtdSep,
0 as QtdOct,
0 as QtdNov,
0 as QtdDec,
0 as QtdProgramada,
0 as QtdCancelado,
0 as QtdParticipante
into #Temp_20160918_ProducaoAnual
  From Curso as a	
  Inner Join Turma as b on (b.IdCurso = a.IdCurso)	
where YEAR(DataInicio) = @Ano 
group by a.IdCurso, a.CodigoCurso, a.Titulo

-- 2. Preenchendo o Area Temática

--drop table #Temp_20160918_AreaTematica

select * into #Temp_20160918_AreaTematica from AreaTematica

declare @MinimoIdAreaTematica int

select @MinimoIdAreaTematica = MIN(IdAreaTematica) from #Temp_20160918_AreaTematica

while exists (select * from #Temp_20160918_AreaTematica)
	begin 

		update c set AreaTematica = AreaTematica + case when AreaTematica > '' then ' , ' else '' end + a.Descricao 
		from AreaTematica as a
		inner join CursoAreaTematica as b on (b.IdAreaTematica = a.IdAreaTematica)
		inner join #Temp_20160918_ProducaoAnual as c on (c.IdCurso = b.IdCurso)
		where a.IdAreaTematica = @MinimoIdAreaTematica
		
		delete #Temp_20160918_AreaTematica where IdAreaTematica = @MinimoIdAreaTematica
		
		select @MinimoIdAreaTematica = MIN(IdAreaTematica) from #Temp_20160918_AreaTematica

	end 


-- 3. Preenchendo a quantidade e o valor da Receita

update A set QtdJan = b.QtdJan,
             QtdFeb = b.QtdFeb,
             QtdMar = b.QtdMar,
             QtdApr = b.QtdApr,
             QtdMay = b.QtdMay,
             QtdJun = b.QtdJun,
             QtdJul = b.QtdJul,
             QtdAug = b.QtdAug,
             QtdSep = b.QtdSep,
             QtdOct = b.QtdOct,
             QtdNov = b.QtdNov,
             QtdDec = b.QtdDec,
             QtdProgramada = b.QtdProgramado,
             QtdCancelado = b.QtdCancelado, 
             QtdParticipante = b.QtdParticipante
From #Temp_20160918_ProducaoAnual as a
inner join (select a.IdCurso, 
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJan,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdFeb,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdMar,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdApr,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdMay,	
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJun,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJul,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdAug,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdSep,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdOct,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdNov,	
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdDec,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 1) then 1 else 0 end )as QtdProgramado,
			sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 4) then 1 else 0 end )as QtdCancelado,
			sum(1) as QtdParticipante
			from #Temp_20160918_ProducaoAnual as a
			inner join Turma as b on (b.IdCurso = a.IdCurso)
			inner join TurmaOferta as c on (c.IdTurma = b.IdTurma)
			inner join PedidoVendaItem as d on (d.IdTurmaOferta = c.IdTurmaOferta)
			inner join PedidoVendaParticipante as e on (e.IdPedidoVendaItem = d.IdPedidoVendaItem)
			inner join PedidoVenda as g on (g.IdPedidoVenda = d.IdPedidoVenda)
			group by a.IdCurso) as b on (b.IdCurso = a.IdCurso)

select *
from #Temp_20160918_ProducaoAnual as a

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_ProducaoDiaria]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoDiaria                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Diária                                          *
                                                      *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoDiaria NULL, NULL, NULL, '20160704', NULL
CREATE procedure [dbo].[Spr_SageEducacao_Lista_ProducaoDiaria]
 
@Ano int = NULL,
@Mes int = NULL,
@RegiaoTreinamento int = NULL,
@DataInicio datetime = null,
@DataFim datetime = null
as 

--IF(@Ano IS NULL)
--	SET @Ano = YEAR(GETDATE())

--IF(@Mes IS NULL)
--	SET @Mes = MONTH(GETDATE())

--set @Ano = YEAR(GETDATE())
--set @Mes = MONTH(GETDATE())

-- 1. Selecão das Turmas

-- exec dbo.[Spr_SageEducacao_Lista_ProducaoDiaria] 2016, 9, 1

--Drop table #Temp_20160918_ProducaoDiaria
 
select 
b.IdTurma,
d.IdTurmaOferta, 
a.Titulo, 
convert(varchar(100), '') as TipoTurma, 
CodigoTurmaOferta as CodOferta, 
b.DataInicio, b.DataFim, 
g.Descricao as RegiaoTreinamento,
b.IdRegiaoTreinamento,
case when b.DisponivelParaVenda = 1 then 'Sim' else 'Não' end as DisponivelVenda,
h.Descricao as StatusTurma,
0 as Meta,
b.QtdeMinimaInscricao as Minimo,
b.Capacidade as Capacidade,
0 as Ativo,
0 as Passivo,
0 as Cortesia,
0 as Acumulado,
Convert(money,0) as VlrReceita,
Convert(money,0) as ValorReceitaVendas
into #Temp_20160918_ProducaoDiaria
  From Curso as a	
  Inner Join Turma as b on (b.IdCurso = a.IdCurso)	
  Inner Join Formato as c on (c.IdFormato = b.IdFormato) 	
  Inner Join TurmaOferta as d on (d.IdTurma = b.IdTurma) 
  inner join RegiaoTreinamento as e on (e.IdRegiaoTreinamento = b.IdRegiaoTreinamento)
  inner join Municipio as f on (f.IdMunicipio = e.IdMunicipio)
  inner join Estado as g on (g.IdEstado = f.IdEstado)
  inner join Status as h on (h.IdStatus = b.IdStatus)
where (YEAR(b.DataInicio) = @Ano OR @Ano  IS NULL)
and (MONTH(b.DataInicio) = @Mes OR @Mes  IS NULL)
--AND (e.IdRegiaoTreinamento = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
AND (g.IdEstado = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
and  b.DataInicio between ISNULL(@DataInicio, b.DataInicio)  and ISNULL(@DataFim, b.DataInicio)

-- > '2016-09-15'

--and  b.DataInicio > '2016-09-15'


-- 2. Preenchendo o Tipo de Turma

--drop table #Temp_20160918_TipoTurma

select * into #Temp_20160918_TipoTurma from TipoTurma

declare @MinimoTipoTurma int

select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

while exists (select * from #Temp_20160918_TipoTurma )
	begin 

		update c set TipoTurma = TipoTurma + case when TipoTurma > '' then ' , ' else '' end + a.Descricao 
		from TipoTurma as a
		inner join TurmaTipoTurma as b on (b.IdTipoTurma = a.IdTipoTurma)
		inner join #Temp_20160918_ProducaoDiaria as c on (c.IdTurma = b.IdTurma)
		where a.IdTipoTurma = @MinimoTipoTurma
		
		delete #Temp_20160918_TipoTurma  where IdTipoTurma = @MinimoTipoTurma
		
		select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

	end 


-- 3. Preenchendo a quantidade e o valor da Receita   ValorReceitaVendas

update A set Ativo = QtdAtivo,
             Passivo = QtdPassivo,
             Cortesia = QtdCortesia,
			 Acumulado = QtdAcumulado,
			 VlrReceita = b.VlrReceita,
			 ValorReceitaVendas = b.VlrReceitaConf
				from #Temp_20160918_ProducaoDiaria as a
				inner join (select a.IdTurmaOferta, 
							sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda < 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdAtivo,
							sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda > 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdPassivo,
							sum(case when c.IdTipoSituacao IN ( 1, 3)  and isnull(c.Valor, 0) = 0 then 1 else 0 end )as QtdCortesia,
							sum(1) as QtdAcumulado,
							SUM( c.Valor) as VlrReceita,
							
							sum(case when b.CodigoNF is null then 0 else b.Valor end) as VlrReceitaConf				
							
							from #Temp_20160918_ProducaoDiaria as a
							inner join PedidoVendaItem as b on (b.IdTurmaOferta = a.IdTurmaOferta)
							inner join TurmaOferta as turO on (b.IdTurmaOferta = turO.IdTurmaOferta)
							inner join PedidoVendaParticipante as c on (c.IdPedidoVendaItem = b.IdPedidoVendaItem)
							left outer join TipoSituacao as d on (d.IdTipoSituacao = c.IdTipoSituacao)
							inner join PedidoVenda as e on (e.IdPedidoVenda = b.IdPedidoVenda)
							inner join OrcamentoTurma as f on f.IdTurma = turO.IdTurma
							group by a.IdTurmaOferta, c.IdTipoSituacao, f.ValorReceitaVendas) as b on (b.IdTurmaOferta = a.IdTurmaOferta)

select *
from #Temp_20160918_ProducaoDiaria as a
order by RegiaoTreinamento

--select *
--from TurmaOferta


GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_ListaClienteParticipante]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************************************
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Fabio Luz
*  DATA DE CRIAÇÃO: 13/01/2017
*  NOME: spr_SageEducacao_ListaClienteParticipante 34
*  
**************************************************************************************************/
CREATE PROCEDURE [dbo].[spr_SageEducacao_ListaClienteParticipante]
	@IdTurma INT = NULL,
	@IdParticipante INT = NULL
AS
	SET NOCOUNT ON
	
	
	
	DECLARE @Names VARCHAR(8000) 
	
		
	SELECT DISTINCT
		cur.CodigoCurso, 
		cur.Titulo, 
		tur.InformacaoData, 
		tur.CargaHoraria, 
		ISNULL(lt.Descricao, '') as LocalTreinamento, 
		CAST('' AS VARCHAR(8000)) as Instrutores,
		tof.CodigoTurmaOferta,
		pv.CodigoPedidoVenda,
		pv.Valor as ValorPedido,
		CAST(0.0 AS DECIMAL(18,2)) as ValorIR,
		CAST(0.0 AS DECIMAL(18,2)) as ValorPIS,
		CAST(0.0 AS DECIMAL(18,2)) as ValorCOFINS,
		CAST(0.0 AS DECIMAL(18,2)) as ValorCSLL,
		CAST(0.0 AS DECIMAL(18,2)) as ValorLiquido,		
		ISNULL(pf.Nome, pj.RazaoSocial) as Nome, 
		ISNULL(pf.CPF, pj.CNPJ) as CPF_CNPJ,
		ISNULL(pf.Endereco, pj.Endereco) as Endereco, 
		ISNULL(pf.Cidade, pj.Cidade) as Cidade, 
		ISNULL(pf.UF, pj.UF) as UF, 
		ISNULL(pf.CEP, pj.CEP) as CEP,
		p.Nome as NomeParticipante, 
		p.CPF as CPF,  
		p.dddCelular + p.FoneCelular as Telefone, 
		p.CRC, 
		p.RG, 
		p.email as Email,
		tur.IdTurma as IdTurma
	INTO 
		#TMP_ClientesParticipantes
	FROM 
		PedidoVenda pv
		INNER JOIN PedidoVendaItem pvi
			on pv.IdPedidoVenda = pvi.IdPedidoVenda
		INNER JOIN PedidoVendaParticipante pvp
			on pvi.IdPedidoVendaItem = pvp.IdPedidoVendaItem
		INNER JOIN Participante p
			on pvp.IdParticipante = p.IdParticipante
		INNER JOIN TurmaOferta tof
			on pvi.IdTurmaOferta = tof.IdTurmaOferta
		INNER JOIN Turma tur
			on tof.IdTurma = tur.IdTurma
		--INNER JOIN TurmaCursoModulo tcm
		--	on tur.IdTurma = tcm.IdTurma
		--INNER JOIN InstrutorTurmaCursoModuloData itcmd
		--	on tcm.IdTurmaCursoModulo = itcmd.IdTurmaCursoModulo
		INNER JOIN Curso cur
			on tur.IdCurso = cur.IdCurso
		INNER JOIN Cliente cl
			on pv.IdCliente = cl.IdCliente
		LEFT JOIN ClientePF pf
			on cl.IdCliente = pf.IdCliente
		LEFT JOIN ClientePJ pj
			on cl.IdCliente = pj.IdCliente		
		LEFT JOIN LocalRealizacao lr
			on tof.IdTurma = lr.IdTurmaOferta
		LEFT JOIN LocalTreinamento lt
			on lr.IdLocalTreinamento = lt.IdLocalTreinamento
	WHERE
		(tur.IdTurma = @IdTurma OR @IdTurma IS NULL)
		AND (p.IdParticipante = @IdParticipante OR @IdParticipante IS NULL)


	SELECT @Names = COALESCE(@Names + ' E ', '') + Apelido 
	FROM Instrutor
	WHERE IdInstrutor 
		IN (SELECT IdInstrutor FROM InstrutorTurmaCursoModuloData
				WHERE IdTurmaCursoModulo IN (
					SELECT IdTurmaCursoModulo from TurmaCursoModulo
						WHERE IdTurma in (
							SELECT IdTurma from #TMP_ClientesParticipantes)))


	UPDATE #TMP_ClientesParticipantes 
	SET Instrutores = @Names 


	SELECT * FROM #TMP_ClientesParticipantes  
	

GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_ListaInstrutorIndexView]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael portal
-- Create date: jan 2017
-- Description:	dados da view intrutor em sage educacao
-- =============================================
CREATE PROCEDURE [dbo].[spr_SageEducacao_ListaInstrutorIndexView]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IdInstrutor, isnull(RG, '0')RG, isnull( CPF,'0') CPF, NomeCompleto, Apelido,  te.Descricao Equipe from instrutor i 
	inner join TipoEquipe te
	on   te.IdTipoEquipe = i.IdTipoEquipe
	order by NomeCompleto 
END

GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_SelecionaCancelamentosCursos]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************************************
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Fabio Luz
*  DATA DE CRIAÇÃO: 31/08/2016
*  NOME: spr_SageEducacao_SelecionaCancelamentosCursos
*  OBS: Seleciona Cancelamento da Turma
*  
**************************************************************************************************/
CREATE PROCEDURE [dbo].[spr_SageEducacao_SelecionaCancelamentosCursos] 
(
	@IdStatus int
)  
AS  
   SET NOCOUNT ON  

/***** Cria tabela temporaria *****/
CREATE TABLE #TurmaCancelada
(
	IdTurma	int,
	IdCurso	int,
	MotivoCancelamento varchar(256),
	InformacaoData varchar(256),
	DataInicialPrevista varchar(10)
)

/***** Insere Turmas canceladas para execução *****/
INSERT INTO #TurmaCancelada
SELECT 
	tur.IdTurma, IdCurso, MotivoCancelamento, InformacaoData, CONVERT(varchar(10), ISNULL(MIN(td.Data), GETDATE()), 103) as DataInicialPrevista
FROM 
	Turma tur (NOLOCK)
	LEFT JOIN TurmaData td
		ON tur.IdTurma = td.IdTurma
WHERE 
	tur.[IdStatus] = @IdStatus
GROUP BY 
	tur.IdTurma, IdCurso, MotivoCancelamento, InformacaoData

/***** Bloqueia Turmas canceladas *****/
UPDATE 
	trm
SET 
	[IdStatus] = 9,
	DataIntegracao = GETDATE()
FROM 
	Turma trm
	INNER JOIN #TurmaCancelada tc
		ON trm.IdTurma = tc.IdTurma

/***** Retorna Informacoes para gerar os tickets ******/
SELECT 
	trm.IdTurma as IdTurma,
	trm.IdCurso as IdCurso,
	cur.CodigoCurso as CodigoCurso,
	cur.Titulo as TituloCurso,
	trm.InformacaoData as InformacaoData,
	trm.DataInicialPrevista as DataInicialPrevista,
	CAST(fat.Cliente_id as BigInt) as IdCliente,
	CAST(ordDet.Contato_id as BigInt) as IdContact,
	CAST(fat.Fatura_Id as BigInt) as IdFatura,
	CAST(ordDet.Product_Id as BigInt) as IdProduto,
	CAST(fatItem.TAB_FaturaItens_Id as BigInt) as IdFaturaItem,
	fatItem.int_FatItens_ItemIdUnisys as IdItemUnisys,
	First_Name as NomeContato,
	DDD as DDDFoneContato,
	Phone as FoneContato,
	contact.Email as Email,
	Zip as CEP,
	ISNULL(trm.MotivoCancelamento, '') + ' - Informar cliente sobre o cancelamento da turma: ' + Cast(trm.IdTurma AS varchar) as Problema
FROM       
	#TurmaCancelada trm (nolock)
	inner join TurmaOferta tuf (nolock) on tuf.IdTurma = trm.IdTurma
	inner join PedidoVendaItem pvi (nolock) on tuf.IdTurmaOferta = pvi.IdTurmaOferta
	inner join PedidoVenda pv (nolock) on pvi.IdPedidoVenda = pv.IdPedidoVenda
	Inner join CRM_ED..Fatura fat (nolock) on pv.CodigoPedidoVenda = fat.NR_Pedido
	Inner Join CRM_ED..TAB_FaturaItens (nolock) as fatItem on (fat.Numero = fatItem.int_FatItens_FaturaId)  
	Inner Join CRM_ED..order_ (nolock) as ord on (fat.nr_Pedido = ord.Order_Number)
	Inner Join CRM_ED..Order_Detail (nolock) as ordDet on (ord.order__id = ordDet.order__id And fatItem.bn_FatItens_Product_Id_pk  = ordDet.Product_Id)
	INNER JOIN CRM_ED..Contact contact (nolock) on ordDet.Contato_id = contact.Contact_Id
	INNER JOIN Curso cur (nolock) ON trm.IdCurso = cur.IdCurso

	DROP TABLE #TurmaCancelada

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Update_CursoTurma]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 06/06/2016          
*  NOME: Spr_SageEducacao_Update_CursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_Update_CursoTurma]  
												@CodigoTurmaOferta Varchar(20)
As

Declare
--Variaveis Para Log
@Log_Id_Big BIGINT,
@Log_Id BINARY(8),
@Descricao VARCHAR(1000),
@Valor VARCHAR(100),
--Variaveis genéricas
@User BINARY(8), -- Id do usuário Carga
@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso
--@QtdeAlvo int, -- Quantidade de registros alvo
@QtdeSucUpdate int,-- Quantidade de registros atualizados com sucesso
@QtdeSucInsertTemp int, -- Quantidade de registros inseridos com sucesso na tabela ##temp_carga_Prod
@QtdeSucInsertDestino int, -- Quantidade de registros inseridos com sucesso na tabela de Destino
@QtdeErro int, --  Quantidade de registros com erro
@QtdeInativo int, -- Quantidade de registros marcados como inativos
@ErroSql int, -- Erro retornado do SQL
@DataHora datetime, -- Data hora que será usada nos campos Rn_Create_Date e Rn_Edit_Date
@cmd varchar(5000), -- Para armazenar a instrução de insert na tabela temporária
-- Duas variavies para verificar o Last_id usado
@Id_BigIntMax BigInt, -- Id do Pivotal da tabela de destino em formato BigInt para ser usado na instrução de insert na tabela destino
@Id_BigIntRsys BigInt -- Id do Pivotal da tabela Rsys_Last_Id em formato BigInt para ser usado na instrução de insert na tabela destino



SET @QtdeSucUpdate = 0
SET @QtdeSucInsertTemp = 0
SET @QtdeSucInsertDestino = 0
SET @QtdeErro = 0
SET @DataHora = getdate()
Select @User = Users_id from CRM_ED..Users where login_name='Carga'


--Declare @CodigoTurmaOferta Varchar(20)
--Set @CodigoTurmaOferta = 'IMPA800042'
--Select * from SageEducacaoProdutos


Delete CRM_ED..SageEducacaoProdutos

Insert Into CRM_ED..SageEducacaoProdutos (
IdCurso,  
CodigoTurma,   
CodigoCurso,
Titulo,    
FormatoDescricao,
FormatoId,
NetIob,      
Grupo1,     
Grupo2,      
OcProtec,    
OcRetroativo,
OcLicenca,   
OcRede,      
OcMail,      
OcRenovacao, 
RecPasta,    
TipoProduto, 
OCConTelefone,
OCConFax,    
OCConEmail,  
DataInicio,  
DataFim,     
Familia,  
ativo, 
EstoqueControlado, 
ProdArea,         
UltimaEdicao,     
UltimoSuplemento, 
CmlProd,          
AcessoSimult,     
Licenca,          
ConsultaWeb,      
ProdutoidRede,    
ExigeTribEstadual, 
ExigeUsuAdm,       
ExigeEmail,        
LiberadoCampanha,  
TpAcesso,           
TpRateio,          
ProdOrigem,        
AcSiteAssinante,   
Valor, 
WelcomeNova, 
WelcomeRen,  
LibSar,
LibRenova, 
LibTmk, 
LibLoja, 
QtdeMinimaInscricao,
QtdeMesesVig,    
QtdeAcSimultDe,  
QtdeAcSimultAte, 
IdAreaTematica,  
ProdutoIDPrinc,  
CodProdPrinc,    
QtdeConsultaTel, 
TpDependencia,   
CodProdTxAdesao, 
ModAssinatura,   
InformacaoHorario, 
IdTipoTurma,     
LocalCurso,      
IdTipoCurso,     
DataHoraPalestra, 
DuracaoCurso,     
NomeLink,       
StatusPalestra, 
TipoPalestra,   
IdVideo,        
CodigoPacotes,  
TemRetencao,
Description,
Product_Cost,
Origem_nacionalidade,
bl_product_coml,
DataAtualizacao,
DataIntegracao) 
Select DISTINCT
  a.IdCurso,
  e.CodigoTurmaOferta,
  a.CodigoCurso,
  a.Titulo,
  c.Descricao, -- Descrição Formato (Midia) 
  c.IdFormato, 
  0, -- (Marcado com X ????)          (Netiob) 
  'CUR' as Grupo1, -- (grupo1)
  'Cursos' as Grupo2, --  (grupo2)
  ' ' as OcProtec, -- (OcProtec)
  ' ' as OcRetroativo, -- (OcRetroativo)
  ' ' as OcLicenca, -- (OcLicenca)
  ' ' as OcRede, -- (OcRede)
  ' ' as OcMail, -- (OcMail)
  ' ' as OcRenovacao, -- (OcRenovacao)
  ' ' as RecPasta, -- (RecPasta)
  0 as TipoProduto, -- (TipoProduto) 
  ' ' as OCConTelefone, -- (OCConTelefone)
  ' ' as OCConFax, -- (OCConFax)
  ' ' as OCConEmail, -- (OCConEmail)
  Convert(Varchar(10),e.DataInicio,112) as DataInicio,
  Convert(Varchar(10),e.DataFim,112) as DataFim,  
  'EDUCACAO PROFISSIONAL' as Familia, 
  1 as bl_produtos_ativo,
  0 as bl_produtos_EstoqueControlado,
  1 as int_produtos_ProdArea,
  0 as int_produtos_UltimaEdicao,
  0 as int_produtos_UltimoSuplemento,
  1 as int_produtos_CmlProd,
  0 as int_produtos_AcessoSimult,
  0 as int_produtos_Licenca,
  0 as int_produtos_ConsultaWeb,
  0 as int_produtos_ProdutoidRede,
  0 as int_produtos_ExigeTribEstadual,
  0 as int_produtos_ExigeUsuAdm,
  0 as int_produtos_ExigeEmail,
  0 as int_produtos_LiberadoCampanha,
  0 as int_produtos_TpAcesso, 
  0 as int_produtos_TpRateio,
  0 as int_produtos_ProdOrigem,
  0 as int_produtos_AcSiteAssinante,
  f.Valor as my_produtos_VlrProd,
  '' as str_produtos_WelcomeNova,
  '' as str_produtos_WelcomeRen,
  '' as Str_produtos_LibSar,
  '' as Str_produtos_LibRenova,
  'S' as Str_produtos_LibTmk,
  '' as Str_produtos_LibLoja,  -- Verificar se todos produtos serão carregados na loja 
  QtdeMinimaInscricao, -- as int_produtos_Qtde_SaldoEstimado,
  0 as int_produtos_QtdeMesesVig,
  0 as int_produtos_QtdeAcSimultDe,
  0 as int_produtos_QtdeAcSimultAte,
  999, --i.IdAreaTematica, --int_produtos_Categoria  Area Tematica (b.CRCD_AREA as int_produtos_Categoria)
  0 as int_produtos_ProdutoIDPrinc,
  a.codigoCurso as str_produtos_CodProdPrinc,
  0 as int_produtos_QtdeConsultaTel,
  0 as str_produtos_TpDependencia,
  0 as str_produtos_CodProdTxAdesao,
  0 as int_produtos_ModAssinatura,
  e.InformacaoHorario, --,str_produtos_DataHoraCurso (POR ENQUANTO ESTA NO INSTRUTOR - ESTA INFORMAÇÃO DEVE ESTA NA TURMAOFERTA)
  h.IdTipoTurma,-- as int_produtos_TurnoCurso (Evandro esta Verificando)
  m.Descricao, --str_produtos_LocalCurso  
  n.Descricao,--n.IdTipoCurso,  --int_produtos_TpCurso
  0 as DataHoraPalestra,
  0 as DuracaoCurso,
  'teste link ' as NomeLink, -- (Turma) Evandro esta verificando
  0 as StatusPalestra,
  0 as TipoPalestra,
  0 as IdVideo,
  '   ,   ,   ,   ,   ' as CodigoPacotes,
  1 as TemRetencao,
  c.Descricao,
  f.Valor,
  m.Descricao as Origem_nacionalidade,
  CASE WHEN e.IdStatus = 8 THEN 0 ELSE 1 END as bl_product_coml,
  GETDATE(),
  '1900-01-01' 
  From Sage_Educacao..Curso as a
  inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  left Join  Sage_Educacao..TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
  Inner Join Sage_Educacao..TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
  Inner Join Sage_Educacao..TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
  ----Inner Join Sage_Educacao..AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
  Inner Join Sage_Educacao..RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
  Inner Join Sage_Educacao..Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
  Inner Join Sage_Educacao..TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
  Where  e.CodigoTurmaOferta = @CodigoTurmaOferta
  --Where  e.CodigoTurmaOferta in ('BLOC800040') --,'AJUS800037','AJUS800038')

  Set @QtdeSucInsertDestino = @@ROWCOUNT 

  	


	Update A 
	Set a.Product_Name	=	Substring(b.Titulo,1,39),    
	a.Rn_Descriptor	=	b.CodigoCurso + ' - ' + b.Titulo,  --Descricao,
	a.NETIOB	=	b.NetIob,      
	a.Grupo1	=	b.Grupo1,     
	a.Grupo2	=	b.Grupo2,      
	a.Gera_Protec	=	b.OcProtec,    
	a.Produto_Retroativo	=	b.OcRetroativo,
	a.Licenca	=	b.OcLicenca,   
	a.Produto_Rede	=	b.OcRede,      
	a.OC_Consulta_Email	=	Case When b.OcMail = '' Then 0 End,      
	a.OC_Renovacao	=	b.OcRenovacao, 
	a.RecPasta	=	b.RecPasta,    
	a.TipoProduto	=	b.TipoProduto, 
	a.OC_Consulta_Tel	=	b.OCConTelefone,
	a.OC_Consulta_Fax	=	b.OCConFax,    
	a.str_prod_VigenciaInicial	=	substring(b.datainicio,3,2) + substring(b.datainicio,5,2) + substring(b.datainicio,7,2),
	a.str_prod_VigenciaFinal	=	substring(b.DataFim,3,2) + substring(b.DataFim,5,2) + substring(b.DataFim,7,2),
	a.Familia	=	b.Familia,     
	a.Inativo	=	b.ativo, 
	a.str_prod_TpEstoqueControlado	=	b.EstoqueControlado, 
	a.int_prod_ProdArea	=	b.ProdArea,         
	a.int_prod_UltimaEdicao	=	b.UltimaEdicao,     
	a.int_prod_UltimoSuplemento	=	b.UltimoSuplemento, 
	a.int_prod_CmlProd	=	b.CmlProd,            
	a.Produto_Licenca	=	b.Licenca,          
	a.int_prod_ConsultaWeb 	=	b.ConsultaWeb,      
	a.Rede	=	b.ProdutoidRede,    
	a.int_prod_ExigeTribEstadual	=	b.ExigeTribEstadual, 
	a.int_prod_ExigeUsuAdm	=	b.ExigeUsuAdm,       
	a.int_prod_ExigeEmail	=	b.ExigeEmail,        
	a.int_prod_LiberadoCampanha	=	b.LiberadoCampanha,  
	a.int_prod_TpAcesso	=	b.TpAcesso,           
	a.int_prod_TpRateio	=	b.TpRateio,          
	a.int_prod_ProdOrigem	=	b.ProdOrigem,        
	a.int_prod_AcSiteAssinante	=	b.AcSiteAssinante,   
	a.Product_Cost	=	313.00, -- Product_Cost, -- valor 
	a.str_produtos_WelcomeNova	=	b.WelcomeNova, 
	a.str_produtos_WelcomeRen	=	b.WelcomeRen,  
	a.str_produtos_LibSAR	=	b.LibSar,
	a.str_produtos_LibRenova	=	b.LibRenova, 
	a.str_produtos_LibTMK	=	b.LibTmk, 
	a.str_produtos_LibNova	=	b.LibLoja, 
	a.int_prod_QtdeMesesVig	=	b.QtdeMesesVig,    
	a.int_prod_QtdeAcSimultDe	=	b.QtdeAcSimultDe,  
	a.int_prod_QtdeAcSimultAte	=	b.QtdeAcSimultAte, 
	a.int_prod_ProdutoIDPrinc	=	b.ProdutoIDPrinc,  
	a.str_prod_CodProdPrinc	=	b.CodProdPrinc,     
	a.str_prod_TpDependencia	=	b.TpDependencia,   
	a.str_prod_CodProdTxAdesao	=	b.CodProdTxAdesao, 
	a.int_prod_ModAssinatura	=	b.ModAssinatura,   
	a.Carga_Horaria	=	b.InformacaoHorario,
	a.DataHoraPalestra	=	b.DataHoraPalestra, 
	a.DuracaoCurso    	=	b.DuracaoCurso,     
	a.NomeLink	=	'Teste Link', -- NomeLink,       
	a.StatusPalestra	=	b.StatusPalestra, 
	a.TipoPalestra	=	b.TipoPalestra,   
	a.IdVideo	=	b.IdVideo,        
	a.CodigoPacotes	=	b.CodigoPacotes,  
	a.TemRetencao	=	b.TemRetencao,
	a.Rn_Edit_Date	=	GETDATE(),
	a.Rn_Edit_User	=	0x000000000001853C,
	a.bl_product_coml	=	b.bl_product_coml,
	a.Origem_nacionalidade	=	b.Origem_nacionalidade,
	a.Formato	=	b.FormatoId
	From CRM_ED..Product a
	Inner Join CRM_ED..SageEducacaoProdutos as b on (a.code_ = b.CodigoTurma)
	Where b.CodigoTurma = @CodigoTurmaOferta


	UPDATE B 
	SET RN_EDIT_DATE = CONVERT(VARCHAR(10), GETDATE(), 112),
		my_PVxProd_ValorBase = A.Product_Cost
		FROM CRM_ED..Product as a
		Inner Join CRM_ED..TAB_PVxProd as b on (a.product_id = bn_PVxProd_Product_Id_fk )
	    WHERE a.Code_ = @CodigoTurmaOferta

/*

Exec Spr_SageEducacao_Update_CursoTurma 'BLOC800041'


GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Update_CursoTurma] TO usr_infraprd



*/



GO
/****** Object:  StoredProcedure [dbo].[spr_verCodigoDos]    Script Date: 23/02/2017 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_verCodigoDos]
	-- Add the parameters for the stored procedure here
	@Param1 varchar(10) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.Code_ from CRM_ED..Product a where a.Code_ = @Param1;
END

GO
USE [master]
GO
ALTER DATABASE [SAGE_Educacao] SET  READ_WRITE 
GO
