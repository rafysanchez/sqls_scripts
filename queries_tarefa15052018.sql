USE [ConPat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemItemWorkflow_Qtde_PatrimonioWorkFlow]
		@UNI_ID = 5

SELECT	'Return Value' = @return_value

GO
--*********************** segund painel ****************************************************************

USE [ConPat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemItemWorkflow_Qtde_StatusPatrimonio]
		@UNI_ID = 5,
		@WRK_ID = 3

SELECT	'Return Value' = @return_value

GO

--*************** terceiro painel **********************************************************************

USE [ConPat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio]
		@UNI_ID = 5,
		@WRK_ID = 3,
		@STP_ID = 14

SELECT	'Return Value' = @return_value

GO

--*****************************************

select top 10 * from BemItemWorkflow 

select top 10  * from StatusPatrimonio 

select top 10 * from BemItem Bi where bi.bem_id = 554759


select top 100 * from  BemItemWfStatus biws where biws.stp_id =14



declare @UNI_ID int  = 5,  @WRK_ID int =3, @STP_ID int = 14;


SELECT top 100000	BI.bit_uniGuarda,
		
			BWS.bem_id
			, BWS.bit_id
			, BWS.biw_id
			, BWS.bws_id
			, BWS.wrk_id
			, BWS.stp_id
			, ISNULL(BWS.bws_dataAlteracao, BWS.bws_dataCriacao) as bws_data
			--Task #2012 --
			, case when @WRK_ID > 2 then 'Guia: '  + ISNULL (MB.mov_GPB,'') + ' - ' + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') else + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') end as bem_descricao 
			, bws.bws_observacao
			,ISNULL(
				 dbo.FN_GetUniNome(mb.mov_unidadeDestino) 
				 ,dbo.FN_GetUniNome(bi.bit_uniGuarda) )	
			 AS Origem			
			,ISNULL(
				 dbo.FN_GetUnidadeGestoraImediataNome(mb.mov_unidadeDestino) 
				 ,dbo.FN_GetUniNome(bi.bit_uniGestora) )	
			 AS Destino
			, mb.mov_data
			, bi.bit_uniGuarda
			, MB.mov_GPB
			, ISNULL (CAST(BI.bit_registroPat as VARCHAR(500)),'Sem Registro Patrimonial') as bit_registroPat
		FROM
			BemItemWorkflow BWF WITH(NOLOCK)
				INNER JOIN BemItemWfStatus BWS WITH(NOLOCK)
					ON ((BWS.bem_id = BWF.bem_id) 
					AND (BWS.bit_id = BWF.bit_id) 
					AND (BWS.biw_id = BWF.biw_id))
				INNER JOIN PatrimonioWfStatus PWS WITH(NOLOCK)
					ON ((BWS.wrk_id = PWS.wrk_id) 
					AND (BWS.stp_id = PWS.stp_id) 
					AND (PWS.wfs_uniGuarda = 1))
				INNER JOIN BemItem BI WITH(NOLOCK)
					ON ((BWS.bem_id = BI.bem_id) 
					AND (BWS.bit_id = BI.bit_id))
				INNER JOIN BemPatrimonial BP WITH(NOLOCK)
					ON (BWS.bem_id = BP.bem_id)		
				INNER JOIN dbo.MovimentacaoBem AS MB WITH(NOLOCK)
					ON BWF.bem_id = MB.bem_id AND BWF.bit_id = MB.bit_id 
					AND (
						   MB.mov_situacao = 3 AND BWF.wrk_id = 3 and BWS.stp_id = 14 
						  	and
							 mov_data = (select top 1 mb_data.mov_data from MovimentacaoBem as mb_data with(nolock) where mb_data.bem_id = BWF.bem_id and  mb_data.bit_id = BWF.bit_id and mb_data.mov_situacao= 3 order by mov_data desc, mov_dataCriacao desc)
						)	
		WHERE
			BI.bit_uniGuarda = @UNI_ID AND
			 BWF.wrk_id = @WRK_ID
			AND BWS.stp_id = @STP_ID		
			AND BWF.biw_situacao = 1
			AND BWS.bws_situacao = 1
			AND PWS.wfs_situacao = 1
			AND BI.bit_situacao = 1
			AND BI.bit_status not in (3,5)
		ORDER BY
		BI.bit_uniGuarda,
			MB.mov_GPB
			,BWS.bem_id 
			, BWS.bit_id 
			, BI.bit_registroPat

--**************************************************************************
	select * from bemitem where bit_registroPat = '2015.102.0000285'


