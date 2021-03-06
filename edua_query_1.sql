USE [ConPat]
--GO
--/****** Object:  StoredProcedure [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio]    Script Date: 22/06/2018 17:06:31 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO  NEW_BemItemWorkflow_Qtde_PatrimonioWorkFlow
--ALTER PROCEDURE [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio] 

-- righeto 5516

declare
	@UNI_ID INT = 25 -- 6042
	,@WRK_ID INT =  3
	,@STP_ID INT =  8-- 9
--WITH RECOMPILE
--AS
BEGIN
	if( @STP_ID = 14)
	begin
		IF ( EXISTS(SELECT uni_id FROM UnidadeGestora WITH(NOLOCK) WHERE uni_id = @UNI_ID AND uge_situacao = 1))
			BEGIN
		SELECT  top 300
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

			--CASE WHEN @WRK_ID = 1 OR @WRK_ID = 2
			--THEN
			--	(SELECT dbo.FN_GetUniNome(bi.bit_uniGestora))
			--ELSE
			--	 ISNULL(
			--	  dbo.FN_GetUniNome(mb.mov_unidadeDestino),
			--	  dbo.FN_GetUniNome(bi.bit_uniGuarda))				
			--END AS Destino				
			, mb.mov_data
			, BI.bit_uniGuarda
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
					--AND (PWS.wfs_uniGestora = 1)
					)
				INNER JOIN BemItem BI WITH(NOLOCK)
					ON ((BWS.bem_id = BI.bem_id) AND (BWS.bit_id = BI.bit_id))
				INNER JOIN BemPatrimonial BP WITH(NOLOCK)
					ON (BWS.bem_id = BP.bem_id)	
				INNER JOIN dbo.MovimentacaoBem AS MB WITH(NOLOCK)
					ON BWF.bem_id = MB.bem_id 
					AND BWF.bit_id = MB.bit_id 
					AND (
							BWF.wrk_id = 3 AND MB.mov_situacao = 3 and BWS.stp_id = 14 
							and
							 mov_data = (select top 1 mb_data.mov_data from MovimentacaoBem as mb_data with(nolock) where mb_data.bem_id = BWF.bem_id and  mb_data.bit_id = BWF.bit_id and mb_data.mov_situacao= 3 order by mov_data desc, mov_dataCriacao desc)						
						 )		
		WHERE
			BI.bit_uniGestora = @UNI_ID
			AND BWF.wrk_id = @WRK_ID
			AND BWS.stp_id = @STP_ID		
			AND BWF.biw_situacao = 1
			AND BWS.bws_situacao = 1
			AND PWS.wfs_situacao = 1
			AND BI.bit_situacao = 1
			AND ((PWS.wfs_uniGestora = 1) 
				OR (BI.bit_uniGuarda = BI.bit_uniGestora AND PWS.wfs_uniGuarda = 1))
			AND BI.bit_status not in (3,5)
		ORDER BY
			MB.mov_GPB
			,BWS.bem_id 
			, BWS.bit_id
			, BI.bit_registroPat
	
		
		SELECT @@ROWCOUNT		
		END
		ELSE

		BEGIN
		select ' caso 2' as Dois

			SELECT  top 300
			' caso 2' as Dois,
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
			BI.bit_uniGuarda = @UNI_ID
			AND BWF.wrk_id = @WRK_ID
			AND BWS.stp_id = @STP_ID		
			AND BWF.biw_situacao = 1
			AND BWS.bws_situacao = 1
			AND PWS.wfs_situacao = 1
			AND BI.bit_situacao = 1
			AND BI.bit_status not in (3,5)
		ORDER BY
			MB.mov_GPB
			,BWS.bem_id 
			, BWS.bit_id 
			, BI.bit_registroPat
			
		
			SELECT @@ROWCOUNT		 
		END
	end
	else
			
	begin
		IF ( EXISTS(SELECT uni_id FROM UnidadeGestora WITH(NOLOCK) WHERE uni_id = @UNI_ID AND uge_situacao = 1))
		
			BEGIN
			print'aui'
				SELECT
			BWS.bem_id
			, BWS.bit_id
			, BWS.biw_id
			, BWS.bws_id
			, BWS.wrk_id
			, BWS.stp_id
			, BWS.bws_dataCriacao as bws_data
			--Task #2012 --
			, case when @WRK_ID > 2 then 'Guia: '  + ISNULL (MB.mov_GPB,'') + ' - ' + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') else + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') end as bem_descricao 
			, bws.bws_observacao
			, CASE WHEN @WRK_ID= 1 OR @WRK_ID = 2
			THEN  
				dbo.FN_GetUniNome(bi.bit_uniGuarda) 
			ELSE
				 ISNULL(
				 dbo.FN_GetUniNome(mb.mov_unidadeOrigem) 
				 ,dbo.FN_GetUniNome(bi.bit_uniGestora) )	
			END AS Origem,
			CASE WHEN @WRK_ID = 1 OR @WRK_ID = 2
			THEN
				(SELECT dbo.FN_GetUniNome(bi.bit_uniGestora))
			ELSE
				 ISNULL(
				  dbo.FN_GetUniNome(mb.mov_unidadeDestino),
				  dbo.FN_GetUniNome(bi.bit_uniGuarda))				
			END AS Destino				
			, mb.mov_data
			, BI.bit_uniGuarda
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
					--AND (PWS.wfs_uniGestora = 1)
					)
				INNER JOIN BemItem BI WITH(NOLOCK)
					ON ((BWS.bem_id = BI.bem_id) AND (BWS.bit_id = BI.bit_id))
				INNER JOIN BemPatrimonial BP WITH(NOLOCK)
					ON (BWS.bem_id = BP.bem_id)	
				LEFT JOIN dbo.MovimentacaoBem AS MB WITH(NOLOCK)
					ON BWF.bem_id = MB.bem_id 
					AND BWF.bit_id = MB.bit_id 
					AND (
							(BWF.wrk_id = 3 AND MB.mov_situacao = 5) 
							OR( BWF.wrk_id = 4 
								AND MB.mov_situacao = 1 
								AND BI.bit_status = 4 
								AND MB.tpm_id IN (SELECT tpm_id FROM dbo.TipoMovimentacao WITH(NOLOCK)
													WHERE tpm_operacao = 8)
								)
						 )		
		WHERE
			BI.bit_uniGestora = @UNI_ID
			AND BWF.wrk_id = @WRK_ID
			AND BWS.stp_id = @STP_ID		
			AND BWF.biw_situacao = 1
			AND BWS.bws_situacao = 1
			AND PWS.wfs_situacao = 1
			AND BI.bit_situacao = 1
			AND ((PWS.wfs_uniGestora = 1) 
				OR (BI.bit_uniGuarda = BI.bit_uniGestora AND PWS.wfs_uniGuarda = 1))
			AND BI.bit_status not in (3,5)
		ORDER BY
			bi.bit_uniGuarda
			,BWS.bws_dataCriacao
			, BWS.bem_id 
			, BWS.bit_id
			, BI.bit_registroPat 
		
		SELECT @@ROWCOUNT		
	END
		ELSE

			BEGIN
				SELECT 
				' caso 4' as Dois,
			BWS.bem_id
			, BWS.bit_id
			, BWS.biw_id
			, BWS.bws_id
			, BWS.wrk_id
			, BWS.stp_id
			, BWS.bws_dataCriacao as bws_data
			--Task #2012 --
			, case when @WRK_ID > 2 then 'Guia: '  + ISNULL (MB.mov_GPB,'') + ' - ' + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') else + BP.bem_descricao + ISNULL (' - ' + CAST(BI.bit_registroPat as VARCHAR(500)),'') end as bem_descricao 
			, bws.bws_observacao
			, CASE WHEN @WRK_ID= 1 OR @WRK_ID = 2
			THEN  
				(SELECT dbo.FN_GetUniNome(bi.bit_uniGuarda)) 
			ELSE
				 dbo.FN_GetUniNome(mb.mov_unidadeOrigem)
				
			END AS Origem
			,CASE WHEN @WRK_ID = 1 OR @WRK_ID = 2
			THEN
				(SELECT dbo.FN_GetUniNome(bi.bit_uniGestora) )
			ELSE
				(
				ISNULL(
				dbo.FN_GetUniNome(bi.bit_uniGuarda),
				dbo.FN_GetUniNome(mb.mov_unidadeDestino) ) 
				)
			END AS Destino
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
				LEFT JOIN dbo.MovimentacaoBem AS MB WITH(NOLOCK)
					ON BWF.bem_id = MB.bem_id AND BWF.bit_id = MB.bit_id 
					AND (
						  (MB.mov_situacao = 5 AND BWF.wrk_id = 3) 
						  OR( BWF.wrk_id = 4 
							  AND MB.mov_situacao = 1 
							  AND BI.bit_status = 4 
							  AND MB.tpm_id IN (
												SELECT tpm_id FROM dbo.TipoMovimentacao  WITH(NOLOCK)
												WHERE tpm_operacao = 8
												)
							)
						)	
		WHERE
			BI.bit_uniGuarda = @UNI_ID
			AND BWF.wrk_id = @WRK_ID
			AND BWS.stp_id = @STP_ID		
			AND BWF.biw_situacao = 1
			AND BWS.bws_situacao = 1
			AND PWS.wfs_situacao = 1
			AND BI.bit_situacao = 1
			-- Teste bit_status <> 3 inativo
			AND BI.bit_status not in (3,5)
		ORDER BY
			BWS.bem_id 
			, BWS.bit_id 
			, BI.bit_registroPat
		
		SELECT @@ROWCOUNT		 
	END
	end
END

