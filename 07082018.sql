USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_05$SP_LISTA_ADIDOS_UA]
		@p_periodo = N'062018'

SELECT	'Return Value' = @return_value

GO
select * from [052018].[TB_FUNCIONAL] where [NR_CPF]  like '%29822296843%'

select TOP 10 * from  [052018].[TB_PESSOAL]  where [NR_CPF]  like '%29822296843%'

--*****************************************************************************************

USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_02$SP_DOCENTES_POR_MUNICIPIO]
		@p_periodo = N'062018'

SELECT	'Return Value' = @return_value

GO

USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_08$SP_TOTAL_DOCENTES_INTERRUPCAO_CARGO_X_IDADE]
		@p_periodo = N'062018'

SELECT	'Return Value' = @return_value

GO
--*****************************************************************************************
USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_06$SP_QUALIF_NIVEL_CURSO_FORMACAO]
		@p_periodo = N'062018'

SELECT	'Return Value' = @return_value

GO
 
USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_10$SP_SERV_DIF_QUADROS_SEE]
		@p_periodo = N'062018'

SELECT	'Return Value' = @return_value

GO
 
 --***********************************************************************
-- [dbo].[Listagem_Servidores_Desligados_SEE_2018_0518]



USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_15$SP_PMEC_PROF_MEDIADOR]
		@p_periodo = N'052018'

SELECT	'Return Value' = @return_value

GO



USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_08$SP_TOTAL_SUPORTE_PEDAGOGICO]
		@p_periodo = N'052018'

SELECT	'Return Value' = @return_value

GO

 --**********************************************************************

USE [SAS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PG_SAS_08$SP_TOTAL_QUADROS_SEE]
		@p_periodo = N'052018'

SELECT	'Return Value' = @return_value

GO


--**********************************************************************


