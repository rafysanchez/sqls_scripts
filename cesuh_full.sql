USE [master]
GO
/****** Object:  Database [CESUH]    Script Date: 20/09/2018 16:49:25 ******/
CREATE DATABASE [CESUH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CESUH', FILENAME = N'F:\MSSQL\DATA\CESUH.MDF' , SIZE = 24946880KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024000KB )
 LOG ON 
( NAME = N'CESUH_log', FILENAME = N'G:\MSSQL\LOG\CESUH_log.LDF' , SIZE = 22179200KB , MAXSIZE = 2048GB , FILEGROWTH = 512000KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CESUH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CESUH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CESUH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CESUH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CESUH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CESUH] SET ARITHABORT OFF 
GO
ALTER DATABASE [CESUH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CESUH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CESUH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CESUH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CESUH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CESUH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CESUH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CESUH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CESUH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CESUH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CESUH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CESUH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CESUH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CESUH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CESUH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CESUH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CESUH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CESUH] SET RECOVERY FULL 
GO
ALTER DATABASE [CESUH] SET  MULTI_USER 
GO
ALTER DATABASE [CESUH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CESUH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CESUH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CESUH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CESUH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CESUH', N'ON'
GO
USE [CESUH]
GO
/****** Object:  User [user_desenv]    Script Date: 20/09/2018 16:49:28 ******/
CREATE USER [user_desenv] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SEESPAZ\svcp_SEDappPNet]    Script Date: 20/09/2018 16:49:29 ******/
CREATE USER [SEESPAZ\svcp_SEDappPNet] FOR LOGIN [SEESPAZ\svcp_SEDappPNet] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESENV]    Script Date: 20/09/2018 16:49:29 ******/
CREATE USER [DESENV] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_desenv]
GO
ALTER ROLE [db_owner] ADD MEMBER [SEESPAZ\svcp_SEDappPNet]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DESENV]
GO
/****** Object:  FullTextCatalog [FTS_Padrao]    Script Date: 20/09/2018 16:49:31 ******/
CREATE FULLTEXT CATALOG [FTS_Padrao]WITH ACCENT_SENSITIVITY = ON

GO
/****** Object:  PartitionFunction [ifts_comp_fragment_partition_function_20CCCE1C]    Script Date: 20/09/2018 16:49:31 ******/
CREATE PARTITION FUNCTION [ifts_comp_fragment_partition_function_20CCCE1C](varbinary(128)) AS RANGE LEFT FOR VALUES (0x006A0075006C00690061006E0061)
GO
/****** Object:  PartitionScheme [ifts_comp_fragment_data_space_20CCCE1C]    Script Date: 20/09/2018 16:49:31 ******/
CREATE PARTITION SCHEME [ifts_comp_fragment_data_space_20CCCE1C] AS PARTITION [ifts_comp_fragment_partition_function_20CCCE1C] TO ([PRIMARY], [PRIMARY])
GO
/****** Object:  Table [dbo].[ENCCEJA_NACIONAL_2017_IMP]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ENCCEJA_NACIONAL_2017_IMP](
	[NR_CPF] [varchar](200) NULL,
	[ID_INSCRICAO] [varchar](200) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NR_NOTA_CN] [varchar](200) NULL,
	[NR_NOTA_CH] [varchar](200) NULL,
	[NR_NOTA_MT] [varchar](200) NULL,
	[NR_NOTA_LC] [varchar](200) NULL,
	[NR_NOTA_REDACAO] [varchar](200) NULL,
	[DT_NASCIMENTO] [varchar](200) NULL,
	[NM_MAE] [varchar](200) NULL,
	[NR_RG] [varchar](200) NULL,
	[SG_ORGAO_RG] [varchar](200) NULL,
	[SG_UF_RG] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_AREA_CONHECIMENTO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_AREA_CONHECIMENTO](
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[DS_AREA] [varchar](200) NULL,
 CONSTRAINT [CD_AREA] PRIMARY KEY CLUSTERED 
(
	[CD_AREA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_AREA_DISCIPLINA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_AREA_DISCIPLINA](
	[CD_AREA_DISCIPLINA] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[CD_DISCIPLINA] [numeric](11, 0) NOT NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
 CONSTRAINT [CD_AREA_DISCIPLINA] PRIMARY KEY CLUSTERED 
(
	[CD_AREA_DISCIPLINA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_ARQUIVO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ARQUIVO](
	[SG_UF] [varchar](2) NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](50) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](30) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](8) NULL,
	[SG_UF_END] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[NR_NOTA_CN] [numeric](6, 2) NULL,
	[NR_NOTA_CH] [numeric](6, 2) NULL,
	[NR_NOTA_LC] [numeric](6, 2) NULL,
	[NR_NOTA_MT] [numeric](6, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](6, 2) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[TP_ENSINO] [varchar](100) NULL,
	[NM_ENTIDADE] [varchar](200) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[CD_UNID_ADM] [numeric](11, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ARQUIVO_CESU]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ARQUIVO_CESU](
	[FILLER_001] [varchar](1) NULL,
	[NUM_RG] [varchar](14) NULL,
	[DIG_RG] [varchar](2) NULL,
	[FILLER_002] [varchar](3) NULL,
	[COD_GRAU] [varchar](1) NULL,
	[FILLER_003] [varchar](3) NULL,
	[COD_EXAME] [varchar](1) NULL,
	[FILLER_004] [varchar](3) NULL,
	[DATA_EMIS] [varchar](8) NULL,
	[FILLER_005] [varchar](3) NULL,
	[COD_TIPO] [varchar](1) NULL,
	[FILLER_006] [varchar](3) NULL,
	[COD_SEXO] [varchar](1) NULL,
	[FILLER_007] [varchar](3) NULL,
	[ST_IMPRESSAO] [varchar](1) NULL,
	[FILLER_008] [varchar](3) NULL,
	[NOME_CANDIDATO] [varchar](60) NULL,
	[FILLER_009] [varchar](3) NULL,
	[COD_UF_RG] [varchar](2) NULL,
	[FILLER_010] [varchar](3) NULL,
	[NOME_MAE_CAND] [varchar](60) NULL,
	[FILLER_011] [varchar](3) NULL,
	[DATA_NASC_NUM] [varchar](8) NULL,
	[FILLER_012] [varchar](3) NULL,
	[ANO_CONCL] [varchar](4) NULL,
	[FILLER_013] [varchar](3) NULL,
	[TB01_COD] [varchar](2) NULL,
	[FILLER_014_01] [varchar](3) NULL,
	[TB01_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_01] [varchar](3) NULL,
	[TB01_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_01] [varchar](3) NULL,
	[TB01_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_01] [varchar](3) NULL,
	[TB01_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_01] [varchar](3) NULL,
	[TB02_COD] [varchar](2) NULL,
	[FILLER_014_02] [varchar](3) NULL,
	[TB02_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_02] [varchar](3) NULL,
	[TB02_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_02] [varchar](3) NULL,
	[TB02_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_02] [varchar](3) NULL,
	[TB02_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_02] [varchar](3) NULL,
	[TB03_COD] [varchar](2) NULL,
	[FILLER_014_03] [varchar](3) NULL,
	[TB03_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_03] [varchar](3) NULL,
	[TB03_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_03] [varchar](3) NULL,
	[TB03_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_03] [varchar](3) NULL,
	[TB03_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_03] [varchar](3) NULL,
	[TB04_COD] [varchar](2) NULL,
	[FILLER_014_04] [varchar](3) NULL,
	[TB04_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_04] [varchar](3) NULL,
	[TB04_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_04] [varchar](3) NULL,
	[TB04_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_04] [varchar](3) NULL,
	[TB04_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_04] [varchar](3) NULL,
	[TB05_COD] [varchar](2) NULL,
	[FILLER_014_05] [varchar](3) NULL,
	[TB05_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_05] [varchar](3) NULL,
	[TB05_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_05] [varchar](3) NULL,
	[TB05_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_05] [varchar](3) NULL,
	[TB05_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_05] [varchar](3) NULL,
	[TB06_COD] [varchar](2) NULL,
	[FILLER_014_06] [varchar](3) NULL,
	[TB06_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_06] [varchar](3) NULL,
	[TB06_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_06] [varchar](3) NULL,
	[TB06_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_06] [varchar](3) NULL,
	[TB06_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_06] [varchar](3) NULL,
	[TB07_COD] [varchar](2) NULL,
	[FILLER_014_07] [varchar](3) NULL,
	[TB07_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_07] [varchar](3) NULL,
	[TB07_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_07] [varchar](3) NULL,
	[TB07_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_07] [varchar](3) NULL,
	[TB07_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_07] [varchar](3) NULL,
	[TB08_COD] [varchar](2) NULL,
	[FILLER_014_08] [varchar](3) NULL,
	[TB08_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_08] [varchar](3) NULL,
	[TB08_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_08] [varchar](3) NULL,
	[TB08_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_08] [varchar](3) NULL,
	[TB08_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_08] [varchar](3) NULL,
	[TB09_COD] [varchar](2) NULL,
	[FILLER_014_09] [varchar](3) NULL,
	[TB09_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_09] [varchar](3) NULL,
	[TB09_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_09] [varchar](3) NULL,
	[TB09_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_09] [varchar](3) NULL,
	[TB09_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_09] [varchar](3) NULL,
	[TB10_COD] [varchar](2) NULL,
	[FILLER_014_10] [varchar](3) NULL,
	[TB10_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_10] [varchar](3) NULL,
	[TB10_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_10] [varchar](3) NULL,
	[TB10_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_10] [varchar](3) NULL,
	[TB10_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_10] [varchar](3) NULL,
	[TB11_COD] [varchar](2) NULL,
	[FILLER_014_11] [varchar](3) NULL,
	[TB11_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_11] [varchar](3) NULL,
	[TB11_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_11] [varchar](3) NULL,
	[TB11_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_11] [varchar](3) NULL,
	[TB11_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_11] [varchar](3) NULL,
	[TB12_COD] [varchar](2) NULL,
	[FILLER_014_12] [varchar](3) NULL,
	[TB12_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_12] [varchar](3) NULL,
	[TB12_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_12] [varchar](3) NULL,
	[TB12_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_12] [varchar](3) NULL,
	[TB12_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_12] [varchar](3) NULL,
	[TB13_COD] [varchar](2) NULL,
	[FILLER_014_13] [varchar](3) NULL,
	[TB13_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_13] [varchar](3) NULL,
	[TB13_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_13] [varchar](3) NULL,
	[TB13_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_13] [varchar](3) NULL,
	[TB13_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_13] [varchar](3) NULL,
	[TB14_COD] [varchar](2) NULL,
	[FILLER_014_14] [varchar](3) NULL,
	[TB14_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_14] [varchar](3) NULL,
	[TB14_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_14] [varchar](3) NULL,
	[TB14_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_14] [varchar](3) NULL,
	[TB14_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_14] [varchar](3) NULL,
	[TB15_COD] [varchar](2) NULL,
	[FILLER_014_15] [varchar](3) NULL,
	[TB15_COD_UF_PROVA] [varchar](2) NULL,
	[FILLER_015_15] [varchar](3) NULL,
	[TB15_VALOR_AREA] [varchar](5) NULL,
	[FILLER_016_15] [varchar](3) NULL,
	[TB15_DATA_DISCIPL] [varchar](8) NULL,
	[FILLER_017_15] [varchar](3) NULL,
	[TB15_DESCR_OR_EMIS] [varchar](15) NULL,
	[FILLER_018_15] [varchar](3) NULL,
	[NUM_CPF] [varchar](11) NULL,
	[FILLER_019] [varchar](3) NULL,
	[NUM_VISTO] [varchar](11) NULL,
	[FILLER_020] [varchar](3) NULL,
	[TOTAL] [varchar](5) NULL,
	[FILLER_021] [varchar](1) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](60) NULL,
 CONSTRAINT [PK_CANDIDATO_NEW_NEW] PRIMARY KEY CLUSTERED 
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_candidato_23042018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_candidato_23042018](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_candidato_bk]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_candidato_bk](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_CONCURSO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_CONCURSO](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NM_ESCOLA_PROVA] [varchar](60) NULL,
	[NM_MUN_PROVA] [varchar](50) NULL,
	[NR_CEP_PROVA] [varchar](9) NULL,
	[NR_GRAU] [varchar](1) NULL,
	[FL_PRESIDIO] [varchar](1) NULL,
	[CD_DIRETORIA] [numeric](5, 0) NULL,
	[CD_ESCOLA] [numeric](8, 0) NULL,
	[CD_AREA] [numeric](2, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[ID_INSCRICAO_N] [numeric](12, 0) NULL,
	[ID_INSCRICAO] [varchar](20) NULL,
	[FL_AUTOMATICO] [varchar](1) NULL,
	[FL_ESTATISTICA] [varchar](1) NULL,
	[NR_IP] [varchar](20) NULL,
	[DT_SOLICITACAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_candidato_concurso_1402_v2]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_candidato_concurso_1402_v2](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NM_ESCOLA_PROVA] [varchar](60) NULL,
	[NM_MUN_PROVA] [varchar](50) NULL,
	[NR_CEP_PROVA] [varchar](9) NULL,
	[NR_GRAU] [varchar](1) NULL,
	[FL_PRESIDIO] [varchar](1) NULL,
	[CD_DIRETORIA] [numeric](5, 0) NULL,
	[CD_ESCOLA] [numeric](8, 0) NULL,
	[CD_AREA] [numeric](2, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[ID_INSCRICAO_N] [numeric](12, 0) NULL,
	[ID_INSCRICAO] [varchar](20) NULL,
	[FL_AUTOMATICO] [varchar](1) NULL,
	[FL_ESTATISTICA] [varchar](1) NULL,
	[NR_IP] [varchar](20) NULL,
	[DT_SOLICITACAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_candidato_concurso_23042018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_candidato_concurso_23042018](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NM_ESCOLA_PROVA] [varchar](60) NULL,
	[NM_MUN_PROVA] [varchar](50) NULL,
	[NR_CEP_PROVA] [varchar](9) NULL,
	[NR_GRAU] [varchar](1) NULL,
	[FL_PRESIDIO] [varchar](1) NULL,
	[CD_DIRETORIA] [numeric](5, 0) NULL,
	[CD_ESCOLA] [numeric](8, 0) NULL,
	[CD_AREA] [numeric](2, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[ID_INSCRICAO_N] [numeric](12, 0) NULL,
	[ID_INSCRICAO] [varchar](20) NULL,
	[FL_AUTOMATICO] [varchar](1) NULL,
	[FL_ESTATISTICA] [varchar](1) NULL,
	[NR_IP] [varchar](20) NULL,
	[DT_SOLICITACAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_candidato_concurso_bk]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_candidato_concurso_bk](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NM_ESCOLA_PROVA] [varchar](60) NULL,
	[NM_MUN_PROVA] [varchar](50) NULL,
	[NR_CEP_PROVA] [varchar](9) NULL,
	[NR_GRAU] [varchar](1) NULL,
	[FL_PRESIDIO] [varchar](1) NULL,
	[CD_DIRETORIA] [numeric](5, 0) NULL,
	[CD_ESCOLA] [numeric](8, 0) NULL,
	[CD_AREA] [numeric](2, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[ID_INSCRICAO_N] [numeric](12, 0) NULL,
	[ID_INSCRICAO] [varchar](20) NULL,
	[FL_AUTOMATICO] [varchar](1) NULL,
	[FL_ESTATISTICA] [varchar](1) NULL,
	[NR_IP] [varchar](20) NULL,
	[DT_SOLICITACAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA](
	[CD_CANDIDATO] [varchar](256) NULL,
	[ID_INSCRICAO] [varchar](256) NULL,
	[NM_CANDIDATO] [varchar](256) NULL,
	[NM_MAE_CANDIDATO] [varchar](256) NULL,
	[NR_RG] [varchar](256) NULL,
	[SG_ORGAO_RG] [varchar](256) NULL,
	[SG_UF_RG] [varchar](256) NULL,
	[EN_CANDIDATO] [varchar](256) NULL,
	[EN_NUMERO] [varchar](256) NULL,
	[EN_COMPLEMENTO] [varchar](256) NULL,
	[EN_BAIRRO] [varchar](256) NULL,
	[EN_MUNICIPIO] [varchar](256) NULL,
	[NR_CEP] [varchar](256) NULL,
	[SG_UF] [varchar](256) NULL,
	[NR_CPF] [varchar](256) NULL,
	[DT_NASCIMENTO] [varchar](256) NULL,
	[FL_STATUS] [varchar](256) NULL,
	[CD_UNID_ADM] [varchar](256) NULL,
	[DT_IMPORTACAO] [varchar](256) NULL,
	[NR_DIGITO_RG] [varchar](256) NULL,
	[DT_ARQUIVO] [varchar](256) NULL,
	[FL_ATIVO] [varchar](256) NULL,
	[NR_FONE] [varchar](256) NULL,
	[NM_EMAIL] [varchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA_TABLE]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA_TABLE](
	[CD_CANDIDATO] [int] NULL,
	[ID_INSCRICAO] [int] NULL,
	[NM_CANDIDATO] [varchar](60) NULL,
	[NM_MAE_CANDIDATO] [varchar](61) NULL,
	[NR_RG] [bigint] NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](70) NULL,
	[EN_NUMERO] [varchar](5) NULL,
	[EN_COMPLEMENTO] [varchar](35) NULL,
	[EN_BAIRRO] [varchar](41) NULL,
	[EN_MUNICIPIO] [varchar](21) NULL,
	[NR_CEP] [int] NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [bigint] NULL,
	[DT_NASCIMENTO] [datetime] NULL,
	[FL_STATUS] [varchar](max) NULL,
	[CD_UNID_ADM] [varchar](max) NULL,
	[DT_IMPORTACAO] [datetime] NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime] NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](50) NULL,
	[NM_EMAIL] [varchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA_TABLE2]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA_TABLE2](
	[CD_CANDIDATO] [int] NULL,
	[ID_INSCRICAO] [int] NULL,
	[NM_CANDIDATO] [varchar](60) NULL,
	[NM_MAE_CANDIDATO] [varchar](61) NULL,
	[NR_RG] [varchar](50) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](70) NULL,
	[EN_NUMERO] [varchar](5) NULL,
	[EN_COMPLEMENTO] [varchar](35) NULL,
	[EN_BAIRRO] [varchar](41) NULL,
	[EN_MUNICIPIO] [varchar](21) NULL,
	[NR_CEP] [int] NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [bigint] NULL,
	[DT_NASCIMENTO] [datetime] NULL,
	[FL_STATUS] [varchar](max) NULL,
	[CD_UNID_ADM] [varchar](max) NULL,
	[DT_IMPORTACAO] [datetime] NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime] NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](50) NULL,
	[NM_EMAIL] [varchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA_TABLE3]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA_TABLE3](
	[CD_CANDIDATO] [int] NULL,
	[ID_INSCRICAO] [int] NULL,
	[NM_CANDIDATO] [varchar](61) NULL,
	[NM_MAE_CANDIDATO] [varchar](61) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](71) NULL,
	[EN_NUMERO] [varchar](10) NULL,
	[EN_COMPLEMENTO] [varchar](50) NULL,
	[EN_BAIRRO] [varchar](56) NULL,
	[EN_MUNICIPIO] [varchar](33) NULL,
	[NR_CEP] [int] NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [bigint] NULL,
	[DT_NASCIMENTO] [datetime] NULL,
	[FL_STATUS] [varchar](1) NULL,
	[CD_UNID_ADM] [int] NULL,
	[DT_IMPORTACAO] [datetime] NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime] NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [bigint] NULL,
	[NM_EMAIL] [varchar](48) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA_TABLE4]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA_TABLE4](
	[CD_CANDIDATO] [int] NULL,
	[ID_INSCRICAO] [int] NULL,
	[NM_CANDIDATO] [varchar](256) NULL,
	[NM_MAE_CANDIDATO] [varchar](256) NULL,
	[NR_RG] [varchar](256) NULL,
	[SG_ORGAO_RG] [varchar](256) NULL,
	[SG_UF_RG] [varchar](256) NULL,
	[EN_CANDIDATO] [varchar](256) NULL,
	[EN_NUMERO] [varchar](256) NULL,
	[EN_COMPLEMENTO] [varchar](256) NULL,
	[EN_BAIRRO] [varchar](256) NULL,
	[EN_MUNICIPIO] [varchar](256) NULL,
	[NR_CEP] [int] NULL,
	[SG_UF] [varchar](256) NULL,
	[NR_CPF] [varchar](256) NULL,
	[DT_NASCIMENTO] [datetime] NULL,
	[FL_STATUS] [varchar](1) NULL,
	[CD_UNID_ADM] [int] NULL,
	[DT_IMPORTACAO] [datetime] NULL,
	[NR_DIGITO_RG] [varchar](10) NULL,
	[DT_ARQUIVO] [datetime] NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](256) NULL,
	[NM_EMAIL] [varchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_DATA_TXT2]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_DATA_TXT2](
	[CD_CANDIDATO] [varchar](256) NULL,
	[ID_INSCRICAO] [varchar](256) NULL,
	[NM_CANDIDATO] [varchar](256) NULL,
	[NM_MAE_CANDIDATO] [varchar](256) NULL,
	[NR_RG] [varchar](256) NULL,
	[SG_ORGAO_RG] [varchar](256) NULL,
	[SG_UF_RG] [varchar](256) NULL,
	[EN_CANDIDATO] [varchar](256) NULL,
	[EN_NUMERO] [varchar](256) NULL,
	[EN_COMPLEMENTO] [varchar](256) NULL,
	[EN_BAIRRO] [varchar](256) NULL,
	[EN_MUNICIPIO] [varchar](256) NULL,
	[NR_CEP] [varchar](256) NULL,
	[SG_UF] [varchar](256) NULL,
	[NR_CPF] [varchar](256) NULL,
	[DT_NASCIMENTO] [varchar](256) NULL,
	[FL_STATUS] [varchar](256) NULL,
	[CD_UNID_ADM] [varchar](256) NULL,
	[DT_IMPORTACAO] [varchar](256) NULL,
	[NR_DIGITO_RG] [varchar](256) NULL,
	[DT_ARQUIVO] [varchar](256) NULL,
	[FL_ATIVO] [varchar](256) NULL,
	[NR_FONE] [varchar](256) NULL,
	[NM_EMAIL] [varchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_candidato_limpar]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_candidato_limpar](
	[cd_candidato] [numeric](11, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_CANDIDATO_new]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_new](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](20) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](4) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](10) NULL,
	[NR_CPF] [numeric](20, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](4) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](100) NULL,
	[NM_CADIDATO_REVERSE]  AS (reverse([NM_CANDIDATO])) PERSISTED,
 CONSTRAINT [PK_CANDIDATO_NEW2] PRIMARY KEY CLUSTERED 
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_new2]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_new2](
	[CD_CANDIDATO] [int] NULL,
	[ID_INSCRICAO] [int] NULL,
	[NM_CANDIDATO] [varchar](60) NULL,
	[NM_MAE_CANDIDATO] [varchar](61) NULL,
	[NR_RG] [bigint] NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](70) NULL,
	[EN_NUMERO] [varchar](5) NULL,
	[EN_COMPLEMENTO] [varchar](35) NULL,
	[EN_BAIRRO] [varchar](41) NULL,
	[EN_MUNICIPIO] [varchar](21) NULL,
	[NR_CEP] [int] NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [bigint] NULL,
	[DT_NASCIMENTO] [datetime] NULL,
	[FL_STATUS] [varchar](max) NULL,
	[CD_UNID_ADM] [varchar](max) NULL,
	[DT_IMPORTACAO] [datetime] NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime] NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [bigint] NULL,
	[NM_EMAIL] [varchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_old]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_old](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](60) NULL,
 CONSTRAINT [PK_CANDIDATO] PRIMARY KEY CLUSTERED 
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_OLD_OLD]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_OLD_OLD](
	[CD_CANDIDATO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[ID_INSCRICAO] [numeric](12, 0) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE_CANDIDATO] [varchar](200) NULL,
	[NR_RG] [varchar](14) NULL,
	[SG_ORGAO_RG] [varchar](3) NULL,
	[SG_UF_RG] [varchar](2) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](50) NULL,
	[EN_COMPLEMENTO] [varchar](100) NULL,
	[EN_BAIRRO] [varchar](100) NULL,
	[EN_MUNICIPIO] [varchar](100) NULL,
	[NR_CEP] [varchar](10) NULL,
	[SG_UF] [varchar](2) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DT_NASCIMENTO] [datetime2](0) NULL,
	[FL_STATUS] [varchar](50) NULL,
	[CD_UNID_ADM] [numeric](7, 0) NULL,
	[DT_IMPORTACAO] [datetime2](0) NULL,
	[NR_DIGITO_RG] [varchar](2) NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[NR_FONE] [varchar](15) NULL,
	[NM_EMAIL] [varchar](60) NULL,
	[NM_CADIDATO_REVERSE]  AS (reverse([NM_CANDIDATO])) PERSISTED,
 CONSTRAINT [PK_CANDIDATO_NEW] PRIMARY KEY CLUSTERED 
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CANDIDATO_TXT]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CANDIDATO_TXT](
	[Text1] [varchar](7999) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CERTIFICADO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CERTIFICADO](
	[CD_CERTIFICADO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[CD_CANDIDATO] [numeric](11, 0) NULL,
	[NR_VISTO_CONFERE] [numeric](20, 0) NULL,
	[CD_TP_CERTIFICADO] [numeric](2, 0) NULL,
	[CD_CONCURSO] [numeric](11, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[FL_EXIBE_LOCAL] [varchar](1) NULL,
	[NR_OJ] [varchar](30) NULL,
	[DS_OJ] [varchar](200) NULL,
	[CD_USUARIO] [varchar](15) NULL,
	[DS_LOG] [varchar](200) NULL,
	[DT_EMISSAO] [datetime2](0) NULL,
 CONSTRAINT [PK_CERTIF] PRIMARY KEY CLUSTERED 
(
	[CD_CERTIFICADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_certificado_23042018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_certificado_23042018](
	[CD_CERTIFICADO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[CD_CANDIDATO] [numeric](11, 0) NULL,
	[NR_VISTO_CONFERE] [numeric](20, 0) NULL,
	[CD_TP_CERTIFICADO] [numeric](2, 0) NULL,
	[CD_CONCURSO] [numeric](11, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[FL_EXIBE_LOCAL] [varchar](1) NULL,
	[NR_OJ] [varchar](30) NULL,
	[DS_OJ] [varchar](200) NULL,
	[CD_USUARIO] [varchar](15) NULL,
	[DS_LOG] [varchar](200) NULL,
	[DT_EMISSAO] [datetime2](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CERTIFICADO_NEW]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CERTIFICADO_NEW](
	[CD_CERTIFICADO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[CD_CANDIDATO] [numeric](11, 0) NULL,
	[NR_VISTO_CONFERE] [numeric](20, 0) NULL,
	[CD_TP_CERTIFICADO] [numeric](2, 0) NULL,
	[CD_CONCURSO] [numeric](11, 0) NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[FL_EXIBE_LOCAL] [varchar](1) NULL,
	[NR_OJ] [varchar](30) NULL,
	[DS_OJ] [varchar](200) NULL,
	[CD_USUARIO] [varchar](15) NULL,
	[DS_LOG] [varchar](200) NULL,
	[DT_EMISSAO] [datetime2](0) NULL,
 CONSTRAINT [PK_CERTIF_NEW] PRIMARY KEY CLUSTERED 
(
	[CD_CERTIFICADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_COMPOSICAO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_COMPOSICAO](
	[NM_COMPOSICAO] [varchar](50) NULL,
	[CD_GRAU] [varchar](1) NULL,
	[NR_ANO_MIN] [numeric](4, 0) NULL,
	[NR_ANO_MAX] [numeric](4, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CONCURSO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CONCURSO](
	[CD_CONCURSO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[DT_CONCURSO] [datetime2](0) NOT NULL,
	[ANO_CONCURSO] [numeric](4, 0) NOT NULL,
	[DS_CONCURSO] [varchar](100) NULL,
	[CD_GRAU] [varchar](2) NULL,
 CONSTRAINT [PK_CONCURSO] PRIMARY KEY CLUSTERED 
(
	[CD_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CONCURSO_NEW]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CONCURSO_NEW](
	[CD_CONCURSO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[DT_CONCURSO] [datetime2](0) NOT NULL,
	[ANO_CONCURSO] [numeric](4, 0) NOT NULL,
	[DS_CONCURSO] [varchar](100) NULL,
	[CD_GRAU] [varchar](2) NULL,
 CONSTRAINT [PK_CONCURSO_NEW] PRIMARY KEY CLUSTERED 
(
	[CD_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DISCIPLINA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_DISCIPLINA](
	[CD_DISCIPLINA] [numeric](11, 0) NOT NULL,
	[DS_DISCIPLINA] [varchar](100) NULL,
 CONSTRAINT [PK_DISCIPLINA] PRIMARY KEY CLUSTERED 
(
	[CD_DISCIPLINA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_EMISSAO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_EMISSAO](
	[DT_EMISSAO] [datetime2](0) NOT NULL,
	[NR_VIA] [float] NULL,
	[NR_CONTROLE] [numeric](11, 0) NULL,
	[CD_CERTIFICADO] [numeric](11, 0) NULL,
	[CD_EMISSAO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[DT_RETIRADA] [datetime2](0) NULL,
	[CD_USUARIO] [numeric](11, 0) NULL,
	[NR_CPF] [numeric](11, 0) NULL,
	[DS_JUSTIFICATIVA] [varchar](200) NULL,
	[DT_DATA_RASURA] [datetime2](0) NULL,
 CONSTRAINT [SYS_C0025815] PRIMARY KEY CLUSTERED 
(
	[CD_EMISSAO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ENCCEJA_2017]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ENCCEJA_2017](
	[NR_CPF] [varchar](200) NULL,
	[ID_INSCRICAO] [varchar](200) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NR_NOTA_CN] [varchar](200) NULL,
	[NR_NOTA_CH] [varchar](200) NULL,
	[NR_NOTA_MT] [varchar](200) NULL,
	[NR_NOTA_LC] [varchar](200) NULL,
	[NR_NOTA_REDACAO] [varchar](200) NULL,
	[DT_NASCIMENTO] [varchar](200) NULL,
	[NM_MAE] [varchar](200) NULL,
	[NR_RG] [varchar](200) NULL,
	[SG_ORGAO_RG] [varchar](200) NULL,
	[SG_UF_RG] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ERRO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ERRO](
	[CD_ERRO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[NR_LINHA] [numeric](11, 0) NULL,
	[DS_LINHA] [varchar](1000) NULL,
	[DS_ERRO] [varchar](255) NULL,
	[DT_IMPORTACAO] [datetime2](0) NOT NULL,
	[DT_ARQUIVO] [datetime2](0) NULL,
	[FL_TIPO] [numeric](1, 0) NULL,
	[CD_CONCURSO] [numeric](11, 0) NULL,
 CONSTRAINT [PK_ERRO] PRIMARY KEY CLUSTERED 
(
	[CD_ERRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GRAU]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GRAU](
	[CD_GRAU] [varchar](2) NOT NULL,
	[DS_GRAU] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GRAU] PRIMARY KEY CLUSTERED 
(
	[CD_GRAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_IMPORTA_DIPLOMA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_IMPORTA_DIPLOMA](
	[SG_UF] [varchar](200) NULL,
	[ID_INSCRICAO] [varchar](200) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE] [varchar](200) NULL,
	[NR_RG] [varchar](200) NULL,
	[SG_ORGAO_RG] [varchar](200) NULL,
	[SG_UF_RG] [varchar](200) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](200) NULL,
	[EN_COMPLEMENTO] [varchar](200) NULL,
	[EN_BAIRRO] [varchar](200) NULL,
	[EN_MUNICIPIO] [varchar](200) NULL,
	[NR_CEP] [varchar](200) NULL,
	[SG_UF_END] [varchar](200) NULL,
	[NR_CPF] [varchar](200) NULL,
	[DT_NASCIMENTO] [varchar](200) NULL,
	[NR_NOTA_CN] [varchar](200) NULL,
	[NR_NOTA_CH] [varchar](200) NULL,
	[NR_NOTA_LC] [varchar](200) NULL,
	[NR_NOTA_MT] [varchar](200) NULL,
	[NR_NOTA_REDACAO] [varchar](200) NULL,
	[FL_STATUS] [varchar](200) NULL,
	[TP_ENSINO] [varchar](200) NULL,
	[NM_ENTIDADE] [varchar](200) NULL,
	[DT_IMPORTACAO] [varchar](200) NULL,
	[DT_ARQUIVO] [varchar](200) NULL,
	[CD_UNID_ADM] [varchar](200) NULL,
	[NOTA1] [varchar](200) NULL,
	[NOTA2] [varchar](200) NULL,
	[NOTA3] [varchar](200) NULL,
	[NOTA4] [varchar](200) NULL,
	[NOTA5] [varchar](200) NULL,
	[NOTA6] [varchar](200) NULL,
	[NR_DIGITO_RG] [varchar](200) NULL,
	[CD_ESCOLA] [varchar](200) NULL,
	[CD_DIRETORIA] [varchar](200) NULL,
	[NR_DDD] [varchar](200) NULL,
	[NR_TELEFONE] [varchar](200) NULL,
	[NM_EMAIL] [varchar](200) NULL,
	[CD_CANDIDATO] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_IMPORTA_DIPLOMA_BK]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_IMPORTA_DIPLOMA_BK](
	[SG_UF] [varchar](200) NULL,
	[ID_INSCRICAO] [varchar](200) NULL,
	[NM_CANDIDATO] [varchar](200) NULL,
	[NM_MAE] [varchar](200) NULL,
	[NR_RG] [varchar](200) NULL,
	[SG_ORGAO_RG] [varchar](200) NULL,
	[SG_UF_RG] [varchar](200) NULL,
	[EN_CANDIDATO] [varchar](200) NULL,
	[EN_NUMERO] [varchar](200) NULL,
	[EN_COMPLEMENTO] [varchar](200) NULL,
	[EN_BAIRRO] [varchar](200) NULL,
	[EN_MUNICIPIO] [varchar](200) NULL,
	[NR_CEP] [varchar](200) NULL,
	[SG_UF_END] [varchar](200) NULL,
	[NR_CPF] [varchar](200) NULL,
	[DT_NASCIMENTO] [varchar](200) NULL,
	[NR_NOTA_CN] [varchar](200) NULL,
	[NR_NOTA_CH] [varchar](200) NULL,
	[NR_NOTA_LC] [varchar](200) NULL,
	[NR_NOTA_MT] [varchar](200) NULL,
	[NR_NOTA_REDACAO] [varchar](200) NULL,
	[FL_STATUS] [varchar](200) NULL,
	[TP_ENSINO] [varchar](200) NULL,
	[NM_ENTIDADE] [varchar](200) NULL,
	[DT_IMPORTACAO] [varchar](200) NULL,
	[DT_ARQUIVO] [varchar](200) NULL,
	[CD_UNID_ADM] [varchar](200) NULL,
	[NOTA1] [varchar](200) NULL,
	[NOTA2] [varchar](200) NULL,
	[NOTA3] [varchar](200) NULL,
	[NOTA4] [varchar](200) NULL,
	[NOTA5] [varchar](200) NULL,
	[NOTA6] [varchar](200) NULL,
	[NR_DIGITO_RG] [varchar](200) NULL,
	[CD_ESCOLA] [varchar](200) NULL,
	[CD_DIRETORIA] [varchar](200) NULL,
	[NR_DDD] [varchar](200) NULL,
	[NR_TELEFONE] [varchar](200) NULL,
	[NM_EMAIL] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_IMPORTA_DIPLOMA_BK_HOMOLOG]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_IMPORTA_DIPLOMA_BK_HOMOLOG](
	[ID_INSCRICAO] [varchar](100) NULL,
	[dt_nascimento] [varchar](100) NULL,
	[nr_cpf] [varchar](100) NULL,
	[nr_nota_cn] [varchar](100) NULL,
	[nr_nota_ch] [varchar](100) NULL,
	[nr_nota_lc] [varchar](100) NULL,
	[nr_nota_mt] [varchar](100) NULL,
	[nr_nota_redacao] [varchar](100) NULL,
	[IDADE] [int] NULL,
	[cd_candidato] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_LOG_CANDIDATO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_LOG_CANDIDATO](
	[CD_LOG_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[DT_ALTERACAO] [datetime2](0) NOT NULL,
	[TP_ALTERACAO] [varchar](1) NOT NULL,
	[ID_USUARIO] [numeric](11, 0) NOT NULL,
 CONSTRAINT [PK_LOG_CANDIDATO] PRIMARY KEY CLUSTERED 
(
	[CD_LOG_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_LOG_CERTIFICADO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_LOG_CERTIFICADO](
	[CD_LOG_CERTIFICADO] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[CD_CERTIFICADO] [numeric](11, 0) NOT NULL,
	[DT_ALTERACAO] [datetime2](0) NOT NULL,
	[TP_ALTERACAO] [varchar](1) NOT NULL,
	[ID_USUARIO] [numeric](11, 0) NOT NULL,
 CONSTRAINT [PK_LOG_CERTIFICADO] PRIMARY KEY CLUSTERED 
(
	[CD_LOG_CERTIFICADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](100) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL,
 CONSTRAINT [PK_NOTA] UNIQUE NONCLUSTERED 
(
	[CD_CANDIDATO] ASC,
	[CD_AREA] ASC,
	[CD_CONCURSO] ASC,
	[DT_PROVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [TX_TB_NOTA]    Script Date: 20/09/2018 16:49:31 ******/
CREATE CLUSTERED INDEX [TX_TB_NOTA] ON [dbo].[TB_NOTA]
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_NOTA_1402_v2]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_1402_v2](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_14022018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_14022018](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_18494560387]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_18494560387](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_20180417]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_20180417](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_nota_23042018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_nota_23042018](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_45296]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_45296](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_BK]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_BK](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_NOTA_bk_2018]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTA_bk_2018](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[CD_AREA] [numeric](11, 0) NOT NULL,
	[NR_NOTA] [numeric](10, 2) NULL,
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[NR_NOTA_MIN_APROV] [numeric](10, 2) NULL,
	[NR_NOTA_OBJETIVA] [numeric](10, 2) NULL,
	[NR_NOTA_REDACAO] [numeric](10, 2) NULL,
	[DS_SIT_PROVA] [varchar](20) NULL,
	[ANO_CONCLUSAO] [varchar](4) NULL,
	[DT_PROVA] [datetime2](0) NOT NULL,
	[CD_CONC_CERT] [numeric](11, 0) NULL,
	[DS_ORG_EMIS] [varchar](20) NULL,
	[UF_EMIS] [varchar](2) NULL,
	[DS_DT_PROVA] [varchar](10) NULL,
	[NR_NOTA_ORI] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_OPTATIVA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_OPTATIVA](
	[CD_AREA] [numeric](11, 0) NULL,
	[CD_GRAU] [varchar](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PARAMETRO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PARAMETRO](
	[CD_PARAMETRO] [numeric](11, 0) NOT NULL,
	[DS_PARAMETRO] [varchar](250) NOT NULL,
	[VL_PARAMETRO] [varchar](1000) NULL,
	[NR_TAM_MAX] [float] NOT NULL DEFAULT ((0)),
	[CD_CONCURSO] [numeric](11, 0) NULL,
	[VL_PARAMETRO_1] [varchar](1000) NULL,
	[VL_PARAMETRO_2] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PENDENTE_ANALISE_CAND]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PENDENTE_ANALISE_CAND](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[COD_INSCR_CAND] [varchar](9) NULL,
	[NOME_PESSOA] [varchar](50) NULL,
	[DATA_NASC_DESC] [varchar](6) NULL,
	[COD_SEXO] [varchar](1) NULL,
	[NUM_RG] [varchar](13) NULL,
	[COD_UF] [varchar](2) NULL,
	[NOME_MUN_NASC] [varchar](22) NULL,
	[COD_UF_NASC] [varchar](2) NULL,
	[TIPO_NOME_LOGR] [varchar](30) NULL,
	[NUM_LOGR] [varchar](7) NULL,
	[NUM_COMPLEM_LOGR] [varchar](14) NULL,
	[NOME_MUN_END] [varchar](22) NULL,
	[COD_UF_END_PESSOA] [varchar](2) NULL,
	[COD_CEP_DESC] [varchar](8) NULL,
	[NUM_TEL_DESC] [varchar](12) NULL,
	[NUM_TEL_RECADO] [varchar](11) NULL,
	[VALOR_TOTAL_INSCR_CAND] [varchar](7) NULL,
	[COD_DISCIPL_1] [varchar](2) NULL,
	[COD_DISCIPL_2] [varchar](2) NULL,
	[COD_DISCIPL_3] [varchar](2) NULL,
	[COD_DISCIPL_4] [varchar](2) NULL,
	[COD_DISCIPL_5] [varchar](2) NULL,
	[COD_DISCIPL_6] [varchar](2) NULL,
	[COD_DISCIPL_7] [varchar](2) NULL,
	[COD_DISCIPL_8] [varchar](2) NULL,
	[COD_DISCIPL_9] [varchar](2) NULL,
	[COD_DISCIPL_10] [varchar](2) NULL,
	[COD_DISCIPL_11] [varchar](2) NULL,
	[VALOR_NOTA_01] [varchar](5) NULL,
	[VALOR_NOTA_02] [varchar](5) NULL,
	[VALOR_NOTA_03] [varchar](5) NULL,
	[VALOR_NOTA_04] [varchar](5) NULL,
	[VALOR_NOTA_05] [varchar](5) NULL,
	[VALOR_NOTA_06] [varchar](5) NULL,
	[VALOR_NOTA_07] [varchar](5) NULL,
	[VALOR_NOTA_08] [varchar](5) NULL,
	[VALOR_NOTA_09] [varchar](5) NULL,
	[VALOR_NOTA_10] [varchar](5) NULL,
	[VALOR_NOTA_11] [varchar](5) NULL,
	[COD_HABILIT] [varchar](2) NULL,
	[COD_PRATIC_1] [varchar](2) NULL,
	[COD_PRATIC_2] [varchar](2) NULL,
	[IND_TOTAL_DISCIPL] [varchar](2) NULL,
	[IND_TIPO_EXAME] [varchar](1) NULL,
	[IND_LIMINAR] [varchar](1) NULL,
	[COD_OPCAO] [varchar](4) NULL,
	[COD_TERM] [varchar](4) NULL,
	[COD_OPER] [varchar](4) NULL,
	[DATA_ALTER_DESC] [varchar](8) NULL,
	[HORA_INIC_ALTER_DESC] [varchar](6) NULL,
	[HORA_FIM_ALTER_DESC] [varchar](6) NULL,
	[COD_REFEREN_EXAM] [varchar](4) NULL,
	[IND_ESTRANG] [varchar](1) NULL,
	[DATA_ATUAL_NOTA] [varchar](8) NULL,
	[VALOR_NOTA_OBJET] [varchar](5) NULL,
	[VALOR_NOTA_REDACAO] [varchar](5) NULL,
	[NUM_RG_CAND] [varchar](12) NULL,
	[COD_VERIF_RG] [varchar](2) NULL,
	[COD_TIPO] [varchar](1) NULL,
	[COD_ESC_CIE] [varchar](7) NULL,
	[ST_IMPRESSAO] [varchar](1) NULL,
	[DATA_EMIS_ATEST] [varchar](8) NULL,
	[DATA_ATUALIZ] [varchar](8) NULL,
	[END_EMAIL_CAND] [varchar](60) NULL,
	[COD_MUN_PROVA] [varchar](3) NULL,
	[NOME_MUN_PROVA] [varchar](50) NULL,
	[IND_INSCR] [varchar](1) NULL,
	[ANO_EXAME] [varchar](4) NULL,
	[NOME_MAE] [varchar](50) NULL,
	[NOME_PAI] [varchar](50) NULL,
	[COD_ESC_SUPL] [varchar](7) NULL,
	[AREA_1] [varchar](2) NULL,
	[AREA_2] [varchar](2) NULL,
	[AREA_3] [varchar](2) NULL,
	[VALOR_NOTA_1_OBJET_ANT] [varchar](5) NULL,
	[VALOR_NOTA_1_REDACAO_ANT] [varchar](5) NULL,
	[VALOR_NOTA_2_ANT] [varchar](5) NULL,
	[VALOR_NOTA_3_ANT] [varchar](5) NULL,
	[IDENT_EXAME_REF_1] [varchar](4) NULL,
	[IDENT_EXAME_REF_2] [varchar](4) NULL,
	[IDENT_EXAME_REF_3] [varchar](4) NULL,
	[VALOR_NOTA_1_ANT] [varchar](5) NULL,
	[COD_INSCR_EMPRESA] [varchar](9) NULL,
	[DATA_EXAME] [varchar](8) NULL,
	[DATA_EXAME_1] [varchar](8) NULL,
	[DATA_EXAME_2] [varchar](8) NULL,
	[NUM_CPF] [varchar](11) NULL,
	[RGDIG] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PENDENTE_ANALISE_ENCC]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PENDENTE_ANALISE_ENCC](
	[CD_CANDIDATO] [numeric](11, 0) NOT NULL,
	[FL_ATIVO] [varchar](1) NULL,
	[COD_REFEREN_EXAM] [varchar](4) NULL,
	[COD_INSCR_E] [varchar](12) NULL,
	[COD_CAND_E] [varchar](8) NULL,
	[NOME_CAND_E] [varchar](60) NULL,
	[NUM_PIS] [varchar](11) NULL,
	[NUM_NIS] [varchar](11) NULL,
	[DATA_NASC_E] [varchar](8) NULL,
	[COD_SEXO] [varchar](1) NULL,
	[COD_NECES_ESP] [varchar](3) NULL,
	[NOME_NECES_ESP] [varchar](64) NULL,
	[NUM_RG_E] [varchar](40) NULL,
	[NUM_RG_14] [varchar](14) NULL,
	[COD_VERIF_RG] [varchar](2) NULL,
	[NUM_ORG_EXPED] [varchar](10) NULL,
	[COD_UF_RG] [varchar](2) NULL,
	[NUM_CPF] [varchar](11) NULL,
	[NOME_MAE_CAND] [varchar](60) NULL,
	[NOME_LOGR_RESID] [varchar](72) NULL,
	[NUM_RESID] [varchar](15) NULL,
	[COMPLEM_RESID] [varchar](72) NULL,
	[NOME_BAIRRO_RESID] [varchar](63) NULL,
	[COD_MUN_RESID] [varchar](7) NULL,
	[COD_MUN_RESID_E] [varchar](12) NULL,
	[NOME_MUN_RESID] [varchar](50) NULL,
	[NOME_CIDAD_RESID] [varchar](63) NULL,
	[COD_UF_RESID] [varchar](2) NULL,
	[COD_CEP_RESID] [varchar](9) NULL,
	[NOME_PAIS_RESID] [varchar](16) NULL,
	[END_EMAIL_CAND] [varchar](60) NULL,
	[COD_DDD_DDI] [varchar](6) NULL,
	[NUM_FONE_1] [varchar](15) NULL,
	[NUM_FONE_2] [varchar](15) NULL,
	[NUM_DIRET] [varchar](5) NULL,
	[COD_ST_IMPR] [varchar](1) NULL,
	[IND_LIMINAR] [varchar](1) NULL,
	[COD_UNID_PARTICIP] [varchar](8) NULL,
	[NOME_UNID_PARTICIP] [varchar](65) NULL,
	[DATA_ATUAL_NOTA] [varchar](8) NULL,
	[IND_NIVEL_PROVA] [varchar](1) NULL,
	[IDENT_LOCAL_E] [varchar](10) NULL,
	[NOME_SALA_LOCAL] [varchar](15) NULL,
	[COD_LOCAL_E] [varchar](10) NULL,
	[NUM_END_LOCAL] [varchar](15) NULL,
	[NOME_BAIRRO_LOCAL] [varchar](63) NULL,
	[NOME_LOGR_LOCAL] [varchar](72) NULL,
	[COD_CEP_LOCAL] [varchar](9) NULL,
	[COD_DDD_LOCAL] [varchar](6) NULL,
	[COD_UF_LOCAL] [varchar](2) NULL,
	[NOME_ESC_PROVA] [varchar](60) NULL,
	[COD_MUNIC_PROVA] [varchar](7) NULL,
	[COD_MUNIC_PROVA_E] [varchar](12) NULL,
	[NOME_MUN_PROVA] [varchar](50) NULL,
	[FLAG_PRESIDIO] [varchar](1) NULL,
	[COD_AREA_1] [varchar](2) NULL,
	[VALOR_OBJET_1] [varchar](5) NULL,
	[IND_OBJET_1] [varchar](16) NULL,
	[VALOR_REDACAO_1] [varchar](5) NULL,
	[IND_REDACAO_1] [varchar](16) NULL,
	[VALOR_AREA_1] [varchar](5) NULL,
	[DATA_PROVA_1] [varchar](8) NULL,
	[COD_AREA_2] [varchar](2) NULL,
	[VALOR_AREA_2] [varchar](5) NULL,
	[IND_AREA_2] [varchar](16) NULL,
	[DATA_PROVA_2] [varchar](8) NULL,
	[COD_AREA_3] [varchar](2) NULL,
	[VALOR_AREA_3] [varchar](5) NULL,
	[IND_AREA_3] [varchar](16) NULL,
	[DATA_PROVA_3] [varchar](8) NULL,
	[COD_AREA_4] [varchar](2) NULL,
	[VALOR_AREA_4] [varchar](5) NULL,
	[IND_AREA_4] [varchar](16) NULL,
	[DATA_PROVA_4] [varchar](8) NULL,
	[COD_AREA_1_ANT] [varchar](2) NULL,
	[VALOR_OBJET_1_ANT] [varchar](5) NULL,
	[VALOR_REDACAO_1_ANT] [varchar](5) NULL,
	[VALOR_AREA_1_ANT] [varchar](5) NULL,
	[DATA_PROVA_1_ANT] [varchar](8) NULL,
	[COD_AREA_2_ANT] [varchar](2) NULL,
	[VALOR_AREA_2_ANT] [varchar](5) NULL,
	[DATA_PROVA_2_ANT] [varchar](8) NULL,
	[COD_AREA_3_ANT] [varchar](2) NULL,
	[VALOR_AREA_3_ANT] [varchar](5) NULL,
	[DATA_PROVA_3_ANT] [varchar](8) NULL,
	[COD_AREA_4_ANT] [varchar](2) NULL,
	[VALOR_AREA_4_ANT] [varchar](5) NULL,
	[DATA_PROVA_4_ANT] [varchar](8) NULL,
	[COD_OPCAO] [varchar](4) NULL,
	[COD_TERM] [varchar](4) NULL,
	[COD_OPER] [varchar](4) NULL,
	[DATA_ALTER] [varchar](7) NULL,
	[DATA_INCL_1] [varchar](8) NULL,
	[DATA_EMIS_ATEST] [varchar](8) NULL,
	[DATA_ATUALIZ] [varchar](8) NULL,
	[DATA_ALTER_DESC] [varchar](8) NULL,
	[DATA_CONCL] [varchar](8) NULL,
	[COD_ORGAO_EXAME] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PERIODO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PERIODO](
	[CD_CONCURSO] [numeric](11, 0) NOT NULL,
	[DT_INICIO] [datetime2](0) NULL,
	[DT_FIM] [datetime2](0) NULL,
 CONSTRAINT [SYS_C0025103] PRIMARY KEY CLUSTERED 
(
	[CD_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_REGRAS]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_REGRAS](
	[CD_EQUIVALENTE] [varchar](10) NULL,
	[CD_AREA] [numeric](11, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_REMESSA]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REMESSA](
	[CD_REMESSA] [numeric](11, 0) IDENTITY(1,1) NOT NULL,
	[DT_REMESSA] [datetime2](0) NOT NULL,
 CONSTRAINT [SYS_C0027003] PRIMARY KEY CLUSTERED 
(
	[CD_REMESSA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_REMESSA_EMISSAO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REMESSA_EMISSAO](
	[CD_REMESSA] [numeric](11, 0) NOT NULL,
	[CD_EMISSAO] [numeric](11, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_TERMINAIS]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TERMINAIS](
	[CD_AREA] [varchar](50) NULL,
	[CD_EQUIVALENTE] [varchar](10) NULL,
	[NR_ANO_PROVA_MIN] [numeric](4, 0) NULL,
	[NR_ANO_PROVA_MAX] [numeric](4, 0) NULL,
	[FL_TERMINAL] [varchar](1) NULL,
	[NR_DISCIPLINAS] [numeric](3, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_TIPO_CERTIFICADO]    Script Date: 20/09/2018 16:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TIPO_CERTIFICADO](
	[CD_TP_CERTIFICADO] [numeric](2, 0) NOT NULL,
	[DS_TP_CERTIFICADO] [varchar](100) NULL,
 CONSTRAINT [PK_TP_CERTIF] PRIMARY KEY CLUSTERED 
(
	[CD_TP_CERTIFICADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FK_CEP]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [FK_CEP] ON [dbo].[TB_ARQUIVO]
(
	[NR_CEP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [I_CAND_CONC]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [I_CAND_CONC] ON [dbo].[TB_CANDIDATO_CONCURSO]
(
	[CD_CANDIDATO] ASC,
	[CD_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TB_CANDIDATO_CONCURSO]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [IDX_TB_CANDIDATO_CONCURSO] ON [dbo].[TB_CANDIDATO_CONCURSO]
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_CAND_CPF]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_CAND_CPF] ON [dbo].[TB_CANDIDATO_old]
(
	[NR_CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ID_NOTA_CAND]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_NOTA_CAND] ON [dbo].[TB_CANDIDATO_old]
(
	[NR_RG] ASC,
	[NR_CPF] ASC,
	[NM_CANDIDATO] ASC,
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TB_CANDIDATO_FL_ATIVO_TUNING]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [IX_TB_CANDIDATO_FL_ATIVO_TUNING] ON [dbo].[TB_CANDIDATO_OLD_OLD]
(
	[FL_ATIVO] ASC
)
INCLUDE ( 	[NM_CANDIDATO]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_CAND_CONC]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_CAND_CONC] ON [dbo].[TB_CERTIFICADO]
(
	[CD_CANDIDATO] ASC,
	[CD_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_CERT_CAND]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_CERT_CAND] ON [dbo].[TB_CERTIFICADO]
(
	[NR_VISTO_CONFERE] ASC,
	[CD_TP_CERTIFICADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ID_COMP]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_COMP] ON [dbo].[TB_COMPOSICAO]
(
	[NM_COMPOSICAO] ASC,
	[CD_GRAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_DATA]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_DATA] ON [dbo].[TB_CONCURSO]
(
	[DT_CONCURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [I1_CD_CERT#DT_EMI]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [I1_CD_CERT#DT_EMI] ON [dbo].[TB_EMISSAO]
(
	[CD_CERTIFICADO] ASC,
	[DT_EMISSAO] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_CANDIDATO]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_CANDIDATO] ON [dbo].[TB_NOTA]
(
	[CD_CANDIDATO] ASC,
	[CD_AREA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_NOTA]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [ID_NOTA] ON [dbo].[TB_NOTA]
(
	[CD_CANDIDATO] ASC,
	[CD_CONC_CERT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CAND]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [IDX_CAND] ON [dbo].[TB_PENDENTE_ANALISE_CAND]
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_NUM_CPF]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [IDX_NUM_CPF] ON [dbo].[TB_PENDENTE_ANALISE_CAND]
(
	[NUM_CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CD_CANDIDATO]    Script Date: 20/09/2018 16:49:31 ******/
CREATE NONCLUSTERED INDEX [IDX_CD_CANDIDATO] ON [dbo].[TB_PENDENTE_ANALISE_ENCC]
(
	[CD_CANDIDATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_AREA_DISCIPLINA]  WITH NOCHECK ADD  CONSTRAINT [FK_AREAD_AREA] FOREIGN KEY([CD_AREA])
REFERENCES [dbo].[TB_AREA_CONHECIMENTO] ([CD_AREA])
GO
ALTER TABLE [dbo].[TB_AREA_DISCIPLINA] CHECK CONSTRAINT [FK_AREAD_AREA]
GO
ALTER TABLE [dbo].[TB_AREA_DISCIPLINA]  WITH NOCHECK ADD  CONSTRAINT [FK_AREAD_DISCIPLINA] FOREIGN KEY([CD_DISCIPLINA])
REFERENCES [dbo].[TB_DISCIPLINA] ([CD_DISCIPLINA])
GO
ALTER TABLE [dbo].[TB_AREA_DISCIPLINA] CHECK CONSTRAINT [FK_AREAD_DISCIPLINA]
GO
ALTER TABLE [dbo].[TB_CERTIFICADO]  WITH NOCHECK ADD  CONSTRAINT [FK_TP_CERTIFICADO] FOREIGN KEY([CD_TP_CERTIFICADO])
REFERENCES [dbo].[TB_TIPO_CERTIFICADO] ([CD_TP_CERTIFICADO])
GO
ALTER TABLE [dbo].[TB_CERTIFICADO] CHECK CONSTRAINT [FK_TP_CERTIFICADO]
GO
ALTER TABLE [dbo].[TB_CERTIFICADO_NEW]  WITH NOCHECK ADD  CONSTRAINT [FK_TP_CERTIFICADO_NEW] FOREIGN KEY([CD_TP_CERTIFICADO])
REFERENCES [dbo].[TB_TIPO_CERTIFICADO] ([CD_TP_CERTIFICADO])
GO
ALTER TABLE [dbo].[TB_CERTIFICADO_NEW] CHECK CONSTRAINT [FK_TP_CERTIFICADO_NEW]
GO
ALTER TABLE [dbo].[TB_EMISSAO]  WITH NOCHECK ADD  CONSTRAINT [FK_CERTIFICADO] FOREIGN KEY([CD_CERTIFICADO])
REFERENCES [dbo].[TB_CERTIFICADO] ([CD_CERTIFICADO])
GO
ALTER TABLE [dbo].[TB_EMISSAO] CHECK CONSTRAINT [FK_CERTIFICADO]
GO
ALTER TABLE [dbo].[TB_LOG_CANDIDATO]  WITH NOCHECK ADD  CONSTRAINT [FK_LOG_CAND_CAND] FOREIGN KEY([CD_CANDIDATO])
REFERENCES [dbo].[TB_CANDIDATO_old] ([CD_CANDIDATO])
GO
ALTER TABLE [dbo].[TB_LOG_CANDIDATO] CHECK CONSTRAINT [FK_LOG_CAND_CAND]
GO
ALTER TABLE [dbo].[TB_LOG_CERTIFICADO]  WITH NOCHECK ADD  CONSTRAINT [FK_LOG_CERTIFICADO] FOREIGN KEY([CD_CERTIFICADO])
REFERENCES [dbo].[TB_CERTIFICADO] ([CD_CERTIFICADO])
GO
ALTER TABLE [dbo].[TB_LOG_CERTIFICADO] CHECK CONSTRAINT [FK_LOG_CERTIFICADO]
GO
ALTER TABLE [dbo].[TB_NOTA]  WITH NOCHECK ADD  CONSTRAINT [FK_NOTA_AREA] FOREIGN KEY([CD_AREA])
REFERENCES [dbo].[TB_AREA_CONHECIMENTO] ([CD_AREA])
GO
ALTER TABLE [dbo].[TB_NOTA] CHECK CONSTRAINT [FK_NOTA_AREA]
GO
ALTER TABLE [dbo].[TB_PERIODO]  WITH NOCHECK ADD  CONSTRAINT [SYS_C0027963] FOREIGN KEY([CD_CONCURSO])
REFERENCES [dbo].[TB_CONCURSO] ([CD_CONCURSO])
GO
ALTER TABLE [dbo].[TB_PERIODO] CHECK CONSTRAINT [SYS_C0027963]
GO
ALTER TABLE [dbo].[TB_REMESSA_EMISSAO]  WITH NOCHECK ADD  CONSTRAINT [SYS_C0029199] FOREIGN KEY([CD_EMISSAO])
REFERENCES [dbo].[TB_EMISSAO] ([CD_EMISSAO])
GO
ALTER TABLE [dbo].[TB_REMESSA_EMISSAO] CHECK CONSTRAINT [SYS_C0029199]
GO
ALTER TABLE [dbo].[TB_REMESSA_EMISSAO]  WITH NOCHECK ADD  CONSTRAINT [SYS_C0029200] FOREIGN KEY([CD_REMESSA])
REFERENCES [dbo].[TB_REMESSA] ([CD_REMESSA])
GO
ALTER TABLE [dbo].[TB_REMESSA_EMISSAO] CHECK CONSTRAINT [SYS_C0029200]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_CONHECIMENTO.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_CONHECIMENTO', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_CONHECIMENTO.DS_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_CONHECIMENTO', @level2type=N'COLUMN',@level2name=N'DS_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_CONHECIMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_CONHECIMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_CONHECIMENTO.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_CONHECIMENTO', @level2type=N'CONSTRAINT',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.CD_AREA_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'CD_AREA_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.CD_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'CD_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.CD_AREA_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'CONSTRAINT',@level2name=N'CD_AREA_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.FK_AREAD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'CONSTRAINT',@level2name=N'FK_AREAD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_AREA_DISCIPLINA.FK_AREAD_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_AREA_DISCIPLINA', @level2type=N'CONSTRAINT',@level2name=N'FK_AREAD_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.SG_UF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'SG_UF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.ID_INSCRICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'ID_INSCRICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NM_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NM_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NM_MAE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NM_MAE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.SG_ORGAO_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'SG_ORGAO_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.SG_UF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'SG_UF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.EN_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'EN_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.EN_NUMERO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'EN_NUMERO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.EN_COMPLEMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'EN_COMPLEMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.EN_BAIRRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'EN_BAIRRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.EN_MUNICIPIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'EN_MUNICIPIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_CEP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.SG_UF_END' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'SG_UF_END'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.DT_NASCIMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'DT_NASCIMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_NOTA_CN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_NOTA_CN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_NOTA_CH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_NOTA_CH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_NOTA_LC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_NOTA_LC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_NOTA_MT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_NOTA_MT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NR_NOTA_REDACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NR_NOTA_REDACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.FL_STATUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'FL_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.TP_ENSINO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'TP_ENSINO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.NM_ENTIDADE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'NM_ENTIDADE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.DT_IMPORTACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'DT_IMPORTACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.DT_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'DT_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.CD_UNID_ADM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'COLUMN',@level2name=N'CD_UNID_ADM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO.FK_CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO', @level2type=N'INDEX',@level2name=N'FK_CEP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_001' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_001'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.NUM_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'NUM_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.DIG_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'DIG_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_002' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_002'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.COD_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'COD_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_003' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_003'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.COD_EXAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'COD_EXAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_004' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_004'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.DATA_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'DATA_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_005' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_005'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.COD_TIPO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'COD_TIPO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_006' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_006'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.COD_SEXO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'COD_SEXO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_007' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_007'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.ST_IMPRESSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'ST_IMPRESSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_008' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_008'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.NOME_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'NOME_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_009' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_009'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.COD_UF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'COD_UF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_010' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_010'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.NOME_MAE_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'NOME_MAE_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_011' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_011'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.DATA_NASC_NUM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'DATA_NASC_NUM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_012' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_012'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.ANO_CONCL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'ANO_CONCL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_013' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_013'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB01_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB01_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB01_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB01_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB01_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB01_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB01_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB01_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB01_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB01_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB02_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB02_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB02_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB02_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB02_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB02_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB02_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB02_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB02_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB02_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB03_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB03_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB03_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB03_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB03_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB03_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB03_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB03_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB03_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB03_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB04_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB04_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB04_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB04_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB04_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB04_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB04_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB04_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB04_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB04_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB05_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB05_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB05_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB05_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB05_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB05_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB05_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB05_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB05_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB05_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB06_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB06_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB06_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB06_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB06_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB06_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB06_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB06_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB06_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB06_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB07_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB07_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB07_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB07_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB07_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB07_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB07_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB07_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB07_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB07_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB08_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB08_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB08_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB08_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB08_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB08_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB08_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB08_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB08_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB08_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB09_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB09_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB09_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB09_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB09_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB09_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB09_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB09_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB09_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB09_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB10_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB10_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB10_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB10_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB10_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB10_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB10_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB10_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB10_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB10_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB11_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB11_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB11_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB11_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB11_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB11_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB11_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB11_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB11_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB11_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB12_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB12_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB12_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB12_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB12_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB12_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB12_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB12_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB12_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB12_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB13_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB13_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB13_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB13_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB13_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB13_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB13_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB13_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB13_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB13_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB14_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB14_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB14_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB14_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB14_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB14_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB14_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB14_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB14_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB14_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB15_COD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB15_COD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_014_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_014_15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB15_COD_UF_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB15_COD_UF_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_015_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_015_15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB15_VALOR_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB15_VALOR_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_016_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_016_15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB15_DATA_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB15_DATA_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_017_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_017_15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TB15_DESCR_OR_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TB15_DESCR_OR_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_018_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_018_15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.NUM_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'NUM_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_019' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_019'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.NUM_VISTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'NUM_VISTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_020' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_020'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.TOTAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'TOTAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.FILLER_021' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'FILLER_021'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.DT_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'DT_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU.DT_IMPORTACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU', @level2type=N'COLUMN',@level2name=N'DT_IMPORTACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ARQUIVO_CESU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ARQUIVO_CESU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.NM_ESCOLA_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'NM_ESCOLA_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.NM_MUN_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'NM_MUN_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.NR_CEP_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'NR_CEP_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.NR_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'NR_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.FL_PRESIDIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'FL_PRESIDIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.CD_DIRETORIA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_DIRETORIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.CD_ESCOLA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_ESCOLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.ID_INSCRICAO_N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'ID_INSCRICAO_N'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.ID_INSCRICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'ID_INSCRICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.FL_AUTOMATICO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'FL_AUTOMATICO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.FL_ESTATISTICA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'FL_ESTATISTICA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.NR_IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'NR_IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.DT_SOLICITACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'COLUMN',@level2name=N'DT_SOLICITACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.I_CAND_CONC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'INDEX',@level2name=N'I_CAND_CONC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO_CONCURSO.IDX_TB_CANDIDATO_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_CONCURSO', @level2type=N'INDEX',@level2name=N'IDX_TB_CANDIDATO_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.ID_INSCRICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'ID_INSCRICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NM_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NM_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NM_MAE_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NM_MAE_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NR_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NR_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.SG_ORGAO_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'SG_ORGAO_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.SG_UF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'SG_UF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.EN_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'EN_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.EN_NUMERO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'EN_NUMERO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.EN_COMPLEMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'EN_COMPLEMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.EN_BAIRRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'EN_BAIRRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.EN_MUNICIPIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'EN_MUNICIPIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NR_CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NR_CEP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.SG_UF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'SG_UF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NR_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NR_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.DT_NASCIMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'DT_NASCIMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.FL_STATUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'FL_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.CD_UNID_ADM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'CD_UNID_ADM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.DT_IMPORTACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'DT_IMPORTACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NR_DIGITO_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NR_DIGITO_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.DT_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'DT_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NR_FONE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NR_FONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.NM_EMAIL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'COLUMN',@level2name=N'NM_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.PK_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'CONSTRAINT',@level2name=N'PK_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.ID_CAND_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'INDEX',@level2name=N'ID_CAND_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CANDIDATO.ID_NOTA_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CANDIDATO_old', @level2type=N'INDEX',@level2name=N'ID_NOTA_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.CD_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.NR_VISTO_CONFERE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'NR_VISTO_CONFERE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.CD_TP_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_TP_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.FL_EXIBE_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'FL_EXIBE_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.NR_OJ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'NR_OJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.DS_OJ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'DS_OJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.CD_USUARIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_USUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.DS_LOG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'DS_LOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.DT_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'DT_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.PK_CERTIF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'CONSTRAINT',@level2name=N'PK_CERTIF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.ID_CAND_CONC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'INDEX',@level2name=N'ID_CAND_CONC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.ID_CERT_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'INDEX',@level2name=N'ID_CERT_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CERTIFICADO.FK_TP_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CERTIFICADO', @level2type=N'CONSTRAINT',@level2name=N'FK_TP_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO.NM_COMPOSICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO', @level2type=N'COLUMN',@level2name=N'NM_COMPOSICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO.CD_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO', @level2type=N'COLUMN',@level2name=N'CD_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO.NR_ANO_MIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO', @level2type=N'COLUMN',@level2name=N'NR_ANO_MIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO.NR_ANO_MAX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO', @level2type=N'COLUMN',@level2name=N'NR_ANO_MAX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_COMPOSICAO.ID_COMP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_COMPOSICAO', @level2type=N'INDEX',@level2name=N'ID_COMP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.DT_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'COLUMN',@level2name=N'DT_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.ANO_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'COLUMN',@level2name=N'ANO_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.DS_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'COLUMN',@level2name=N'DS_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.CD_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'COLUMN',@level2name=N'CD_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.PK_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'CONSTRAINT',@level2name=N'PK_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_CONCURSO.ID_DATA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CONCURSO', @level2type=N'INDEX',@level2name=N'ID_DATA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_DISCIPLINA.CD_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'CD_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_DISCIPLINA.DS_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DISCIPLINA', @level2type=N'COLUMN',@level2name=N'DS_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_DISCIPLINA.PK_DISCIPLINA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DISCIPLINA', @level2type=N'CONSTRAINT',@level2name=N'PK_DISCIPLINA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.DT_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'DT_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.NR_VIA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'NR_VIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.NR_CONTROLE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'NR_CONTROLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.CD_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'CD_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.CD_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'CD_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.DT_RETIRADA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'DT_RETIRADA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.CD_USUARIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'CD_USUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.NR_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'NR_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.DS_JUSTIFICATIVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'DS_JUSTIFICATIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.DT_DATA_RASURA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'COLUMN',@level2name=N'DT_DATA_RASURA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.SYS_C0025815' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0025815'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.I1_CD_CERT#DT_EMI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'INDEX',@level2name=N'I1_CD_CERT#DT_EMI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_EMISSAO.FK_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_EMISSAO', @level2type=N'CONSTRAINT',@level2name=N'FK_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.CD_ERRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'CD_ERRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.NR_LINHA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'NR_LINHA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.DS_LINHA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'DS_LINHA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.DS_ERRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'DS_ERRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.DT_IMPORTACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'DT_IMPORTACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.DT_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'DT_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.FL_TIPO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'FL_TIPO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_ERRO.PK_ERRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_ERRO', @level2type=N'CONSTRAINT',@level2name=N'PK_ERRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_GRAU.CD_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_GRAU', @level2type=N'COLUMN',@level2name=N'CD_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_GRAU.DS_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_GRAU', @level2type=N'COLUMN',@level2name=N'DS_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_GRAU.PK_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_GRAU', @level2type=N'CONSTRAINT',@level2name=N'PK_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.SG_UF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'SG_UF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.ID_INSCRICAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'ID_INSCRICAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NM_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NM_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NM_MAE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NM_MAE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.SG_ORGAO_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'SG_ORGAO_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.SG_UF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'SG_UF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.EN_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'EN_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.EN_NUMERO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'EN_NUMERO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.EN_COMPLEMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'EN_COMPLEMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.EN_BAIRRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'EN_BAIRRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.EN_MUNICIPIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'EN_MUNICIPIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_CEP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.SG_UF_END' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'SG_UF_END'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.DT_NASCIMENTO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'DT_NASCIMENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_NOTA_CN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_CN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_NOTA_CH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_CH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_NOTA_LC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_LC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_NOTA_MT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_MT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_NOTA_REDACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_REDACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.FL_STATUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'FL_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.TP_ENSINO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'TP_ENSINO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NM_ENTIDADE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NM_ENTIDADE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.DT_IMPORTACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'DT_IMPORTACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.DT_ARQUIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'DT_ARQUIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.CD_UNID_ADM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'CD_UNID_ADM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NOTA6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NOTA6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_DIGITO_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_DIGITO_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.CD_ESCOLA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'CD_ESCOLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.CD_DIRETORIA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'CD_DIRETORIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_DDD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_DDD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NR_TELEFONE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NR_TELEFONE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA.NM_EMAIL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA', @level2type=N'COLUMN',@level2name=N'NM_EMAIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_IMPORTA_DIPLOMA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_IMPORTA_DIPLOMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.CD_LOG_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'COLUMN',@level2name=N'CD_LOG_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.DT_ALTERACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'COLUMN',@level2name=N'DT_ALTERACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.TP_ALTERACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'COLUMN',@level2name=N'TP_ALTERACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.ID_USUARIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'COLUMN',@level2name=N'ID_USUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.PK_LOG_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'CONSTRAINT',@level2name=N'PK_LOG_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CANDIDATO.FK_LOG_CAND_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CANDIDATO', @level2type=N'CONSTRAINT',@level2name=N'FK_LOG_CAND_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.CD_LOG_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_LOG_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.CD_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.DT_ALTERACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'DT_ALTERACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.TP_ALTERACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'TP_ALTERACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.ID_USUARIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'ID_USUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.PK_LOG_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'CONSTRAINT',@level2name=N'PK_LOG_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_LOG_CERTIFICADO.FK_LOG_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LOG_CERTIFICADO', @level2type=N'CONSTRAINT',@level2name=N'FK_LOG_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.NR_NOTA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'NR_NOTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.NR_NOTA_MIN_APROV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_MIN_APROV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.NR_NOTA_OBJETIVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_OBJETIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.NR_NOTA_REDACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_REDACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.DS_SIT_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'DS_SIT_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.ANO_CONCLUSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'ANO_CONCLUSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.DT_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'DT_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.CD_CONC_CERT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'CD_CONC_CERT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.DS_ORG_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'DS_ORG_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.UF_EMIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'UF_EMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.DS_DT_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'DS_DT_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.NR_NOTA_ORI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'COLUMN',@level2name=N'NR_NOTA_ORI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_NOTA.FK_NOTA_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NOTA', @level2type=N'CONSTRAINT',@level2name=N'FK_NOTA_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_OPTATIVA.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OPTATIVA', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_OPTATIVA.CD_GRAU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OPTATIVA', @level2type=N'COLUMN',@level2name=N'CD_GRAU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_OPTATIVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OPTATIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.CD_PARAMETRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'CD_PARAMETRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.DS_PARAMETRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'DS_PARAMETRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.VL_PARAMETRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'VL_PARAMETRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.NR_TAM_MAX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'NR_TAM_MAX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.VL_PARAMETRO_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'VL_PARAMETRO_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO.VL_PARAMETRO_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO', @level2type=N'COLUMN',@level2name=N'VL_PARAMETRO_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PARAMETRO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PARAMETRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_INSCR_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_INSCR_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_PESSOA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_PESSOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_NASC_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_NASC_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_SEXO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_SEXO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_UF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_UF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_MUN_NASC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_MUN_NASC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_UF_NASC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_UF_NASC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.TIPO_NOME_LOGR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'TIPO_NOME_LOGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_LOGR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_LOGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_COMPLEM_LOGR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_COMPLEM_LOGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_MUN_END' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_MUN_END'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_UF_END_PESSOA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_UF_END_PESSOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_CEP_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_CEP_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_TEL_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_TEL_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_TEL_RECADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_TEL_RECADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_TOTAL_INSCR_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_TOTAL_INSCR_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_9'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_DISCIPL_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_DISCIPL_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_02' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_03' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_05' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_HABILIT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_HABILIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_PRATIC_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_PRATIC_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_PRATIC_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_PRATIC_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IND_TOTAL_DISCIPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IND_TOTAL_DISCIPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IND_TIPO_EXAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IND_TIPO_EXAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IND_LIMINAR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IND_LIMINAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_OPCAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_OPCAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_TERM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_TERM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_OPER' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_OPER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_ALTER_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_ALTER_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.HORA_INIC_ALTER_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'HORA_INIC_ALTER_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.HORA_FIM_ALTER_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'HORA_FIM_ALTER_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_REFEREN_EXAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_REFEREN_EXAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IND_ESTRANG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IND_ESTRANG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_ATUAL_NOTA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_ATUAL_NOTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_OBJET' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_OBJET'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_REDACAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_REDACAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_RG_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_RG_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_VERIF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_VERIF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_TIPO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_TIPO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_ESC_CIE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_ESC_CIE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.ST_IMPRESSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'ST_IMPRESSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_EMIS_ATEST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_EMIS_ATEST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_ATUALIZ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_ATUALIZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.END_EMAIL_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'END_EMAIL_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_MUN_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_MUN_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_MUN_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_MUN_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IND_INSCR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IND_INSCR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.ANO_EXAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'ANO_EXAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_MAE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_MAE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NOME_PAI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NOME_PAI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_ESC_SUPL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_ESC_SUPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.AREA_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'AREA_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.AREA_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'AREA_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.AREA_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'AREA_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_1_OBJET_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_1_OBJET_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_1_REDACAO_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_1_REDACAO_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_2_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_2_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_3_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_3_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IDENT_EXAME_REF_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IDENT_EXAME_REF_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IDENT_EXAME_REF_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IDENT_EXAME_REF_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IDENT_EXAME_REF_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'IDENT_EXAME_REF_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.VALOR_NOTA_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'VALOR_NOTA_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.COD_INSCR_EMPRESA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'COD_INSCR_EMPRESA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_EXAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_EXAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_EXAME_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_EXAME_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.DATA_EXAME_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'DATA_EXAME_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.NUM_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'NUM_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.RGDIG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'COLUMN',@level2name=N'RGDIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IDX_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'INDEX',@level2name=N'IDX_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_CAND.IDX_NUM_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_CAND', @level2type=N'INDEX',@level2name=N'IDX_NUM_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.FL_ATIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'FL_ATIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_REFEREN_EXAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_REFEREN_EXAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_INSCR_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_INSCR_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_CAND_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_CAND_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_CAND_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_CAND_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_PIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_PIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_NIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_NIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_NASC_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_NASC_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_SEXO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_SEXO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_NECES_ESP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_NECES_ESP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_NECES_ESP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_NECES_ESP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_RG_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_RG_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_RG_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_RG_14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_VERIF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_VERIF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_ORG_EXPED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_ORG_EXPED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_UF_RG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_UF_RG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_CPF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_MAE_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_MAE_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_LOGR_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_LOGR_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COMPLEM_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COMPLEM_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_BAIRRO_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_BAIRRO_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_MUN_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_MUN_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_MUN_RESID_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_MUN_RESID_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_MUN_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_MUN_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_CIDAD_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_CIDAD_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_UF_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_UF_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_CEP_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_CEP_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_PAIS_RESID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_PAIS_RESID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.END_EMAIL_CAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'END_EMAIL_CAND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_DDD_DDI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_DDD_DDI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_FONE_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_FONE_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_FONE_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_FONE_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_DIRET' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_DIRET'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_ST_IMPR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_ST_IMPR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_LIMINAR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_LIMINAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_UNID_PARTICIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_UNID_PARTICIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_UNID_PARTICIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_UNID_PARTICIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_ATUAL_NOTA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_ATUAL_NOTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_NIVEL_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_NIVEL_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IDENT_LOCAL_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IDENT_LOCAL_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_SALA_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_SALA_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_LOCAL_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_LOCAL_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NUM_END_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NUM_END_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_BAIRRO_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_BAIRRO_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_LOGR_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_LOGR_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_CEP_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_CEP_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_DDD_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_DDD_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_UF_LOCAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_UF_LOCAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_ESC_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_ESC_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_MUNIC_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_MUNIC_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_MUNIC_PROVA_E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_MUNIC_PROVA_E'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.NOME_MUN_PROVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'NOME_MUN_PROVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.FLAG_PRESIDIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'FLAG_PRESIDIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_OBJET_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_OBJET_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_OBJET_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_OBJET_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_REDACAO_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_REDACAO_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_REDACAO_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_REDACAO_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_AREA_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_AREA_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_AREA_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_AREA_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IND_AREA_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'IND_AREA_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_OBJET_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_OBJET_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_REDACAO_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_REDACAO_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_1_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_1_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_2_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_2_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_2_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_2_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_2_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_2_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_3_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_3_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_3_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_3_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_3_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_3_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_AREA_4_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_AREA_4_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.VALOR_AREA_4_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'VALOR_AREA_4_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_PROVA_4_ANT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_PROVA_4_ANT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_OPCAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_OPCAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_TERM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_TERM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_OPER' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_OPER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_ALTER' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_ALTER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_INCL_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_INCL_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_EMIS_ATEST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_EMIS_ATEST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_ATUALIZ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_ATUALIZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_ALTER_DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_ALTER_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.DATA_CONCL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'DATA_CONCL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.COD_ORGAO_EXAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'COLUMN',@level2name=N'COD_ORGAO_EXAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PENDENTE_ANALISE_ENCC.IDX_CD_CANDIDATO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PENDENTE_ANALISE_ENCC', @level2type=N'INDEX',@level2name=N'IDX_CD_CANDIDATO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO.CD_CONCURSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO', @level2type=N'COLUMN',@level2name=N'CD_CONCURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO.DT_INICIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO', @level2type=N'COLUMN',@level2name=N'DT_INICIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO.DT_FIM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO', @level2type=N'COLUMN',@level2name=N'DT_FIM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO.SYS_C0025103' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0025103'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_PERIODO.SYS_C0027963' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_PERIODO', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0027963'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REGRAS.CD_EQUIVALENTE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REGRAS', @level2type=N'COLUMN',@level2name=N'CD_EQUIVALENTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REGRAS.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REGRAS', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REGRAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REGRAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA.CD_REMESSA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA', @level2type=N'COLUMN',@level2name=N'CD_REMESSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA.DT_REMESSA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA', @level2type=N'COLUMN',@level2name=N'DT_REMESSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA.SYS_C0027003' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0027003'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA_EMISSAO.CD_REMESSA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA_EMISSAO', @level2type=N'COLUMN',@level2name=N'CD_REMESSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA_EMISSAO.CD_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA_EMISSAO', @level2type=N'COLUMN',@level2name=N'CD_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA_EMISSAO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA_EMISSAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA_EMISSAO.SYS_C0029199' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA_EMISSAO', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0029199'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_REMESSA_EMISSAO.SYS_C0029200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_REMESSA_EMISSAO', @level2type=N'CONSTRAINT',@level2name=N'SYS_C0029200'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.CD_AREA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'CD_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.CD_EQUIVALENTE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'CD_EQUIVALENTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.NR_ANO_PROVA_MIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'NR_ANO_PROVA_MIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.NR_ANO_PROVA_MAX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'NR_ANO_PROVA_MAX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.FL_TERMINAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'FL_TERMINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS.NR_DISCIPLINAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS', @level2type=N'COLUMN',@level2name=N'NR_DISCIPLINAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TERMINAIS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TERMINAIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TIPO_CERTIFICADO.CD_TP_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TIPO_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'CD_TP_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TIPO_CERTIFICADO.DS_TP_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TIPO_CERTIFICADO', @level2type=N'COLUMN',@level2name=N'DS_TP_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TIPO_CERTIFICADO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TIPO_CERTIFICADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CESUH.TB_TIPO_CERTIFICADO.PK_TP_CERTIF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_TIPO_CERTIFICADO', @level2type=N'CONSTRAINT',@level2name=N'PK_TP_CERTIF'
GO
USE [master]
GO
ALTER DATABASE [CESUH] SET  READ_WRITE 
GO
