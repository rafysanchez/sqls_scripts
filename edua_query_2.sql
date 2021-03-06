USE [ConPat]
--GO
--/****** Object:  StoredProcedure [dbo].[NEW_BemItemWorkflow_Qtde_PatrimonioWorkFlow]    Script Date: 22/06/2018 17:18:44 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER PROCEDURE [dbo].[NEW_BemItemWorkflow_Qtde_PatrimonioWorkFlow] 
declare @UNI_ID INT = 5516

-- AS
BEGIN

IF ( EXISTS(SELECT uni_id FROM UnidadeGestora WITH(NOLOCK) WHERE uni_id = @UNI_ID AND uge_situacao = 1))
BEGIN
	SELECT
		PWF.wrk_id
		, wrk_nome
		, COUNT(bws_id) AS qtde
	FROM
		BemItem BI WITH(NOLOCK)
			
			INNER JOIN BemItemWorkflow BWF WITH(NOLOCK)
				ON ((BWF.bem_id = BI.bem_id) 
				AND (BWF.bit_id = BI.bit_id))
			INNER JOIN BemItemWfStatus BWS WITH(NOLOCK)
				ON ((BWS.bem_id = BWF.bem_id) 
				AND (BWS.bit_id = BWF.bit_id) 
				AND (BWS.biw_id = BWF.biw_id)
				AND (BWS.wrk_id = BWF.wrk_id)
				)
				
			INNER JOIN PatrimonioWfStatus PWS WITH(NOLOCK)
				ON ((BWS.wrk_id = PWS.wrk_id) 
				AND (BWS.stp_id = PWS.stp_id) )
			INNER JOIN PatrimonioWorkflow PWF WITH(NOLOCK)
				ON (BWS.wrk_id = PWF.wrk_id)
				
				
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
		AND BWF.biw_situacao = 1
		AND BWS.bws_situacao = 1
		AND PWS.wfs_situacao = 1
		AND PWF.wrk_situacao = 1
		AND BI.bit_situacao = 1
		AND ((PWS.wfs_uniGestora = 1) 
			OR (BI.bit_uniGuarda = BI.bit_uniGestora AND PWS.wfs_uniGuarda = 1))
		AND BI.bit_status not in(3,5)
	GROUP BY PWF.wrk_id, wrk_nome
	ORDER BY PWF.wrk_id
END
ELSE
BEGIN
	SELECT
		PWF.wrk_id
		, wrk_nome
		, COUNT(bws_id)  AS qtde
		
	FROM
		BemItemWorkflow BWF WITH(NOLOCK)
			INNER JOIN BemItemWfStatus BWS WITH(NOLOCK)
				ON ((BWS.bem_id = BWF.bem_id) 
				AND (BWS.bit_id = BWF.bit_id) 
				AND (BWS.biw_id = BWF.biw_id)
				AND (BWS.wrk_id = BWF.wrk_id)
				)
			INNER JOIN PatrimonioWfStatus PWS WITH(NOLOCK)
				ON ((BWS.wrk_id = PWS.wrk_id) 
				AND (BWS.stp_id = PWS.stp_id) 
				AND (PWS.wfs_uniGuarda = 1))
			INNER JOIN PatrimonioWorkflow PWF WITH(NOLOCK)
				ON (BWS.wrk_id = PWF.wrk_id)
			INNER JOIN BemItem BI WITH(NOLOCK)
				ON ((BWF.bem_id = BI.bem_id) 
				   AND (BWF.bit_id = BI.bit_id))
	WHERE
		BI.bit_uniGuarda = @UNI_ID
		AND BWF.biw_situacao = 1
		AND BWS.bws_situacao = 1
		AND PWS.wfs_situacao = 1
		AND PWF.wrk_situacao = 1
		AND BI.bit_situacao = 1
		AND BI.bit_status not in(3,5)
	GROUP BY PWF.wrk_id, wrk_nome
END

END

