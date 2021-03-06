USE [SAS]
GO
/****** Object:  StoredProcedure [dbo].[PG_SAS_06$SP_QUALIF_NIVEL_CURSO_FORMACAO]    Script Date: 08/08/2018 16:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PG_SAS_06$SP_QUALIF_NIVEL_CURSO_FORMACAO]
/* Revisado ALJ */
@p_periodo varchar(max)
AS 
/*
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
| Descrição : Relatorio 06-LISTAGEM E TOTALIZAÇÃO SERVIDORES - QUALIFICAÇÃO NÍVEL_CURSO FORMAÇÃO
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
*/

BEGIN

SET NOCOUNT ON;

    DECLARE

	@v_sql varchar(max);

 		begin try
			 drop table #tmp_funcional
		end try
		begin catch
		end catch

CREATE TABLE #tmp_funcional(
	[NR_RG] [varchar](13) NULL,
	[nr_cpf] [char](11) NOT NULL,
	[nr_di] [char](1) NOT NULL,
	[cargo_clas] [numeric](4, 0) NULL,
	[cargo_exer] [numeric](4, 0) NULL,
	[cod_unid_adm_clas] [numeric](6, 0) NULL,
	[cod_unid_adm_exer] [numeric](6, 0) NULL,
	[cat_func_class] [char](1) NULL,
	[cat_func_exer] [char](1) NULL,
	[dt_ini_exer_clas] [datetime2](0) NULL,
	[dt_ini_exer_exer] [datetime2](0) NULL,
	[sit_especial] [char](1) NULL,
	[disciplina_class] [varchar](4) NULL,
	[mot_afas_class] [varchar](3) NULL,
	[dt_inic_afast_class] [datetime2](0) NULL,
	[mot_lic_class] [varchar](3) NULL,
	[dt_inic_lic_class] [datetime2](0) NULL,
	[CD_IDENT_SIT_VINC_TIT] [varchar](1) NULL
) ON [PRIMARY]
		
set @v_sql =
             ' INSERT INTO #tmp_funcional
			   select         
               NR_RG, nr_cpf, nr_di, 
		       cd_cargo_func_tit       as cargo_clas, 
			   cd_cargo_func_tit       as cargo_exer, 
			   CD_UNID_ADM_CLASS_TIT   as cod_unid_adm_clas,
             case when ISNULL(CD_UNID_ADM_EXERC_TIT,0) = 0 then CD_UNID_ADM_CLASS_TIT else CD_UNID_ADM_EXERC_TIT end as cod_unid_adm_exer, 
		       CD_IDENT_CAT_FUNC_TIT   as cat_func_class, 
		       CD_IDENT_CAT_FUNC_TIT   as cat_func_exer, 
			   DT_INIC_EXERC_TIT       as dt_ini_exer_clas , 
			   DT_INIC_EXERC_TIT       as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT  as sit_especial,
		       CD_CLASSE_DISC_TIT      as disciplina_class, 
			   CD_MOT_AFAST_TIT        as mot_afas_class, 
			   DT_INIC_AFAST_TIT       as dt_inic_afast_class,
			   CD_MOT_LIC_TIT          as mot_lic_class,
			   DT_INIC_LIC_TIT         as dt_inic_lic_class,
			   CD_IDENT_SIT_VINC_TIT   as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
 		  and CD_IDENT_SIT_VINC_TIT = ''A''   --TITULAR
        and ISNULL(CD_IDENT_SIT_VINC_COMIS,''X'') not in (''A'',''D'')
        and ISNULL(CD_IDENT_SIT_VINC_DESIGN,''X'') <> ''A''
        and  (
		         ISNULL(F.cd_mot_interrup_cess_tit,''XXX'') <> ''253'' OR
                 F.cd_mot_interrup_cess_tit = ''253'' and dt_fim_interrup_cess_tit IS NOT NULL 
		        )  
		union
		select NR_RG, nr_cpf, nr_di, 
		       cd_cargo_func_tit       as cargo_clas, 
			   cd_cargo_funcao_comis   as cargo_exer, 
			   CD_UNID_ADM_CLASS_TIT   as cod_unid_adm_clas, 
			   CD_UNID_ADM_CLASS_COMIS as cod_unid_adm_EXER, 
		       CD_IDENT_CAT_FUNC_TIT   as cat_func_class, 
		       CD_IDENT_CAT_FUNC_COMIS as cat_func_exer, 
			   DT_INIC_EXERC_TIT       as dt_ini_exer_clas, 
			   DT_INIC_EXERC_COMIS     as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT  as sit_especial,
		       CD_CLASSE_DISC_TIT      as disciplina_class, 
			   CD_MOT_AFAST_TIT        as mot_afas_class, 
			   DT_INIC_AFAST_TIT       as dt_inic_afast_class,
			   CD_MOT_LIC_TIT          as mot_lic_class,
			   DT_INIC_LIC_TIT         as dt_inic_lic_class,
			   CD_IDENT_SIT_VINC_TIT   as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
 		  and CD_IDENT_SIT_VINC_TIT = ''C''   --COMISSIONADO
        and CD_IDENT_SIT_VINC_COMIS = ''A'' 
        and ISNULL(CD_IDENT_SIT_VINC_DESIGN,''X'') <> ''A''
		union
		select NR_RG, nr_cpf, nr_di, 
		           cd_cargo_func_tit    as cargo_clas, 
			   cd_cargo_funcao_design   as cargo_exer, 
			   CD_UNID_ADM_CLASS_TIT    as cod_unid_adm_clas, 
			   CD_UNID_ADM_CLASS_DESIGN as cod_unid_adm_exer, 
		       CD_IDENT_CAT_FUNC_TIT    as cat_func_class, 
		       CD_IDENT_CAT_FUNC_COMIS  as cat_func_exer, 
			   DT_INIC_EXERC_TIT        as dt_ini_exer_clas, 
			   DT_INIC_DESIGN           as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT   as sit_especial,
		       CD_CLASSE_DISC_TIT       as disciplina_class, 
			   CD_MOT_AFAST_TIT         as mot_afas_class, 
			   DT_INIC_AFAST_TIT        as dt_inic_afast_class,
			   CD_MOT_LIC_TIT           as mot_lic_class,
			   DT_INIC_LIC_TIT          as dt_inic_lic_class,
			   CD_IDENT_SIT_VINC_TIT   as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
			and CD_IDENT_SIT_VINC_TIT = ''C''  -- DESIGNADO
			AND CD_IDENT_SIT_VINC_COMIS = ''D''  
			AND CD_IDENT_SIT_VINC_DESIGN =''A''
		union
		select NR_RG, nr_cpf, nr_di, 
		       cd_cargo_func_tit       as cargo_clas, 
			   cd_cargo_funcao_design    as cargo_exer, 
			   CD_UNID_ADM_CLASS_TIT   as cod_unid_adm_clas, 
			   CD_UNID_ADM_CLASS_DESIGN as cod_unid_adm_exer, 
		       CD_IDENT_CAT_FUNC_TIT   as cat_func_class, 
		       --CD_IDENT_CAT_FUNC_TIT   as cat_func_exer, 
			   CD_IDENT_SIT_VINC_TIT   as cat_func_exer, 
			   DT_INIC_EXERC_TIT       as dt_ini_exer_clas, 
			   DT_INIC_DESIGN          as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT  as sit_especial,
		       CD_CLASSE_DISC_TIT      as disciplina_class, 
			   CD_MOT_AFAST_TIT        as mot_afas_class, 
			   DT_INIC_AFAST_TIT       as dt_inic_afast_class,
			   CD_MOT_LIC_TIT          as mot_lic_class,
			   DT_INIC_LIC_TIT         as dt_inic_lic_class,
			   CD_IDENT_SIT_VINC_TIT   as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
			and CD_IDENT_SIT_VINC_TIT = ''D''  -- DESIGNADO
			AND ISNULL(CD_IDENT_SIT_VINC_COMIS,''X'') NOT IN (''D'',''A'')  
			AND CD_IDENT_SIT_VINC_DESIGN =''A''
		union
		select NR_RG, nr_cpf, nr_di, 
		       cd_cargo_funcao_comis   as cargo_clas, 
			   cd_cargo_funcao_comis   as cargo_exer, 
			   CD_UNID_ADM_CLASS_COMIS as cod_unid_adm_clas,
             case when  ISNULL(CD_UNID_ADM_EXER_COMIS,0) = 0 then CD_UNID_ADM_CLASS_COMIS else CD_UNID_ADM_EXER_COMIS end as cod_unid_adm_exer,
		       CD_IDENT_CAT_FUNC_COMIS as cat_func_class, 
		       CD_IDENT_CAT_FUNC_COMIS as cat_func_exer, 
			   DT_INIC_EXERC_COMIS     as dt_ini_exer_clas, 
			   DT_INIC_EXERC_COMIS     as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT  as sit_especial,
		       CD_CLASSE_DISC_TIT      as disciplina_class, 
			   CD_MOT_AFAST_TIT        as mot_afas_class, 
			   DT_INIC_AFAST_TIT       as dt_inic_afast_class,
			   CD_MOT_LIC_TIT          as mot_lic_class,
			   DT_INIC_LIC_TIT         as dt_inic_lic_class,
			   ''C''					as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
			and ISNULL(CD_IDENT_SIT_VINC_TIT,''X'') NOT IN (''A'',''C'',''D'')  -- COMISSIONADO PURO
			AND CD_IDENT_SIT_VINC_COMIS = ''A''  
			AND ISNULL(CD_IDENT_SIT_VINC_DESIGN,''X'') <> ''A''
		union
		select NR_RG, nr_cpf, nr_di, 
		       cd_cargo_funcao_comis    as cargo_clas, 
			   cd_cargo_funcao_design   as cargo_exer, 
			   CD_UNID_ADM_CLASS_COMIS  as cod_unid_adm_clas, 
			   CD_UNID_ADM_CLASS_DESIGN as cod_unid_adm_exer, 
		       CD_IDENT_CAT_FUNC_COMIS  as cat_func_class, 
		       CD_IDENT_SIT_VINC_COMIS  as cat_func_exer, 
			   DT_INIC_EXERC_COMIS      as dt_ini_exer_clas, 
			   DT_INIC_DESIGN           as dt_ini_exer_exer,
			   CD_IDENT_SIT_ESPEC_TIT   as sit_especial,
		       CD_CLASSE_DISC_TIT       as disciplina_class, 
			   CD_MOT_AFAST_TIT         as mot_afas_class, 
			   DT_INIC_AFAST_TIT        as dt_inic_afast_class,
			   CD_MOT_LIC_TIT           as mot_lic_class,
			   DT_INIC_LIC_TIT          as dt_inic_lic_class,
			   ''D''					as CD_IDENT_SIT_VINC_TIT
		from SAS.['+@p_periodo+'].TB_FUNCIONAL f
		where F.CD_SIT_REG = ''A''
			and ISNULL(CD_IDENT_SIT_VINC_TIT,''X'') NOT IN (''A'',''C'',''D'')  -- DESIGNADO PURO
			AND CD_IDENT_SIT_VINC_COMIS = ''D''  
			AND CD_IDENT_SIT_VINC_DESIGN = ''A'' '

       exec (@v_sql);

 		begin try
			 drop table #TB_CARGOS
		end try
		begin catch
		end catch

CREATE TABLE #TB_CARGOS(
							[CD_CARGO] [numeric](6, 0) NOT NULL,
							[NM_CARGO] [varchar](150) NOT NULL,
							[CD_QUADRO] [numeric](6, 0) NULL
					   ) ON [PRIMARY]

set @v_sql =
' INSERT INTO #TB_CARGOS select distinct cd_cargo, cg.nm_cargo, cg.cd_quadro 
						           from ['+@p_periodo+'].tb_cargos cg
								   where CG.DT_FIM_VIG IS NULL '

       exec (@v_sql);

set @v_sql = 'SELECT top 3000 case when MUN.COD_MUN = 100 then ''CAPITAL'' ELSE
                 case when DIR.CD_DIRETORIA > 19900 then ''INTERIOR'' ELSE
                  ''GDE_SP'' END
               END                                           as REGIAO,
               ISNULL(UA.NOME_ABREV,UADIR.NOME_ABREV) AS DIRETORIA_ENSINO, 
               ISNULL(esc.cd_escola,0) CIE, 
			   ISNULL(ESC.cd_unidade_admin, UADIR.COD_UNID_ADM) COD_UA, 
			   ISNULL(ESC.NM_ABREVIADO,UADIR.NOME_ABREV) AS DENOMINACAO_UA, 
			   ISNULL(ua.cod_mun,UADIR.COD_MUN) COD_MUN 
			   , MUN.DESCR_MUNICIPIO DENOMINACAO_MUNICIPIO
			   , F.NR_RG AS RG
			   , F.NR_DI AS DI
			   , F.NR_CPF AS CPF
			   , P.NM_PESSOA AS NOME_DO_SERVIDOR
			   , Q.NM_QUADRO AS QUADRO_1
			   , CG.CD_CARGO AS CARGO_1
			   , CG.NM_CARGO AS DENOMINACAO_CARGO_1
			   , F.cat_func_class CATEG_1
			   , CONVERT(varchar(12),F.dt_ini_exer_clas,103 ) as DT_INIC_EXER
			   , F.sit_especial AS SIT_ESPECIAL
			   --, F.CD_ORIG_CARGO_FUNC_TIT AS QUALIF
			   ,F.cargo_clas AS QUALIF
			   , Q2.NM_QUADRO AS QUADRO_2
			   , CG2.CD_CARGO AS CARGO_2
			   , F.cat_func_exer CATEG_2
			   , CG2.NM_CARGO AS DENOMINACAO_CARGO_2
			   , ISNULL(QUALIF.GRUPO,''S/ QUALIFICAÇÃO'') AS GRUPO
 FROM #tmp_funcional F
	LEFT JOIN (
				  SELECT NR_CPF,
				  case when G > 0 AND (D+E+F+H) = 0                         THEN ''MESTRADO'' 
						when H > 0 AND (D+E+F+G) = 0 						THEN ''DOUTORADO''  
						 when A > 0 AND (B+C+D+E+F+G+H) = 0					THEN ''APERFEIÇOAMENTO/EXTENSÃO CULTURAL'' 
						  when B > 0 AND (C+D+E+F+G+H) = 0 					THEN ''ENSINO FUNDAMENTAL'' 
						   when C > 0 AND (D+E+F+G+H) = 0 						THEN ''ENSINO MÉDIO'' 
							when D > 0 AND (E+F+G+H) = 0 						THEN ''BACHARELADO/TECNOLÓLOGO'' 
							 when E > 0 AND (D+F+G+H) = 0 						THEN ''LICENCIATURA''  
							  when F > 0 AND (D+E+G+H) = 0 						THEN ''ESPECIALIZAÇÃO''  
							   when D > 0 AND F > 0 AND  (E+G+H) = 0 				THEN ''BACHARELADO/TECNÓLOGO + ESPECIALIZAÇÃO'' 
								when D > 0 AND E > 0 AND  (F+G+H) = 0 				THEN ''LICENCIATURA + BACHARELADO/TECNÓLOGO''  		   
								 when D > 0 AND G > 0 AND  (E+F+H) = 0 				THEN ''BACHARELADO/TECNÓLOGO + MESTRADO''  
								  when D > 0 AND H > 0 AND  (E+F)   = 0 				THEN ''BACHARELADO/TECNÓLOGO + MESTRADO + DOUTORADO''  
								   when D > 0 AND E > 0 AND F > 0 AND  (G+H) = 0 		THEN ''LICENCIATURA + BACHARELADO/TECNÓLOGO + ESPECIALIZAÇÃO''  
									when D > 0 AND F > 0 AND G > 0 AND  (E+H) = 0 		THEN ''BACHARELADO/TECNÓLOGO + ESPECIALIZAÇÃO + MESTRADO''  
									 when D > 0 AND F > 0 AND H > 0 AND  E = 0 			THEN ''BACHAR/TECNOL + ESPECIALIZAÇÃO + MESTRADO + DOUTORADO''  
									  when D > 0 AND E > 0 AND G > 0 AND  (F+H) = 0 		THEN ''LICENCIATURA + BACHARELADO/TECNÓLOGO + MESTRADO''  
									   when D > 0 AND E > 0 AND H > 0 AND  F = 0 			THEN ''LICENCIATURA + BACHAR/TECNOL + MESTRADO + DOUTORADO''  
										when D > 0 AND E > 0 AND F > 0 AND G > 0 AND H = 0   THEN ''LICENCIATURA + BACHAR/TECNOL + ESPECIALIZAÇÃO + MESTRADO''  
										 when D > 0 AND E > 0 AND F > 0 AND H > 0				THEN ''LICENCIATURA + BACHAR/TEC + ESPEC + MESTRADO + DOUTORADO''  
										  when E > 0 AND F > 0 AND  (D+G+H) = 0 				THEN ''LICENCIATURA + ESPECIALIZAÇÃO''  
										   when E > 0 AND G > 0 AND  (D+F+H) = 0 				THEN ''LICENCIATURA + MESTRADO''  
											when E > 0 AND H > 0 AND  (D+F) = 0 					THEN ''LICENCIATURA + MESTRADO + DOUTORADO''  
											 when E > 0 AND F > 0 AND G > 0 AND  (D+H) = 0 		    THEN ''LICENCIATURA + ESPECIALIZAÇÃO + MESTRADO''  
											  when E > 0 AND F > 0 AND H > 0 AND  D = 0 			THEN ''LICENCIATURA + ESPECIALIZAÇÃO + MESTRADO + DOUTORADO''  
											   when E > 0 AND F > 0 AND H > 0 AND  D = 0 			THEN ''LICENCIATURA + ESPECIALIZAÇÃO + MESTRADO + DOUTORADO'' else
											   ''s/qualificação'' end as grupo

				from (
						SELECT NR_CPF,
						SUM(NIVA1) AS A, SUM(NIVB1) AS B, SUM(NIVC1) AS C, SUM(NIVD1) AS D, SUM(NIVE1) AS E, SUM(NIVF1) AS F, SUM(NIVG1) AS G, SUM(NIVH1) AS H
						FROM (
								SELECT NR_CPF,
								CASE WHEN CD_TIPO_NIVEL_CURSO = 10 THEN 1 ELSE 0 END  NIVA1,
								CASE WHEN CD_TIPO_NIVEL_CURSO = 6  THEN 1 ELSE 0 END  NIVB1,
								CASE WHEN CD_TIPO_NIVEL_CURSO = 1  THEN 1 ELSE 0 END  NIVC1,
								CASE WHEN CD_TIPO_NIVEL_CURSO = 2  THEN 1 ELSE 0 END  NIVD1,
								CASE WHEN CD_TIPO_NIVEL_CURSO = 12 THEN 1 ELSE 0 END  NIVE1, 
								CASE WHEN CD_TIPO_NIVEL_CURSO = 9  THEN 1 ELSE 0 END  NIVF1, 
								CASE WHEN CD_TIPO_NIVEL_CURSO = 3  THEN 1 ELSE 0 END  NIVG1, 
								CASE WHEN CD_TIPO_NIVEL_CURSO = 4  THEN 1 ELSE 0 END  NIVH1 
								FROM(
										SELECT DISTINCT E.NR_CPF, 
										CASE WHEN TNC.CD_TIPO_NIVEL_CURSO IN (1)              THEN  6
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (2)              THEN  1
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (5,6,8)          THEN  12
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (7,42)           THEN  2
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (9,44)           THEN  4
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (10,43)          THEN  3
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (12,45,46,47)    THEN  9
											 WHEN TNC.CD_TIPO_NIVEL_CURSO IN (19,20,59,15,11,
																			  60,61,35,32,48,
																			  49,52,38,54,53,
																			  55,56,57,50,58) THEN  10
											 ELSE
											 TNC.CD_TIPO_NIVEL_CURSO END CD_TIPO_NIVEL_CURSO


										FROM SAS.['+@p_periodo+'].TB_ESCOLARIDADE E
										INNER JOIN  SAS.['+@p_periodo+'].TB_CURSO C
										ON c.id_curso = E.ID_CURSO
										INNER JOIN SAS.['+@p_periodo+'].TB_TIPO_NIVEL_CURSO TNC
										ON C.ID_TIPO_NIVEL_CURSO = TNC.ID_TIPO_NIVEL_CURSO
										WHERE C.FL_ATIVO = ''A''
										AND TNC.FL_ATIVO = ''A''
										AND TNC.DT_VIGENCIA_FINAL IS NULL
										AND C.DT_VIGENCIA_FINAL IS NULL
								) AS X
						  ) AS Y
						  GROUP BY NR_CPF
					) as z
	          ) QUALIF
    ON F.NR_CPF = QUALIF.NR_CPF
	LEFT JOIN SAS.['+@p_periodo+'].TB_PESSOAL  P
	ON P.NR_CPF = F.NR_CPF
	LEFT JOIN #TB_CARGOS CG
	ON CD_CARGO = F.cargo_clas 
	LEFT JOIN SAS.['+@p_periodo+'].TB_QUADRO Q
	ON Q.CD_QUADRO = CG.CD_QUADRO
	LEFT JOIN #TB_CARGOS CG2
	ON CG2.CD_CARGO = F.cargo_exer 
	LEFT JOIN SAS.['+@p_periodo+'].TB_QUADRO Q2
	ON Q2.CD_QUADRO = CG2.CD_QUADRO
	LEFT JOIN SAS.['+@p_periodo+'].TB_ESCOLA ESC
	ON ESC.CD_unidade_admin = F.cod_unid_adm_clas
	LEFT JOIN SAS.['+@p_periodo+'].TB_DIRETORIA DIR
	ON ESC.CD_DIRETORIA = DIR.CD_DIRETORIA
	LEFT JOIN SAS.['+@p_periodo+'].PAP_UA UADIR
	ON UADIR.COD_UNID_ADM = F.cod_unid_adm_clas AND
	   UADIR.COD_GRAU_CLASSIF_INSTITUC = ''UGE''
	LEFT JOIN SAS.['+@p_periodo+'].PAP_UA UA
	ON UA.COD_UNID_ADM = ISNULL(DIR.CD_UNIDADE_ADM,UADIR.COD_UNID_ADM)
	LEFT JOIN DESENV.DBO.MUNICIPIO mun
	ON  MUN.COD_MUN = ISNULL(UA.COD_MUN, UADIR.COD_MUN)

    ORDER BY 1,7'

	exec (@v_sql);
end





