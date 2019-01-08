-- BemItemWorkflow BWF
-- BemItemWfStatus BWS 
-- PatrimonioWfStatus PWS
-- BemItem BI
-- BemPatrimonial BP
-- MovimentacaoBem MB




select top 10 * from BemItemWorkflow BWF where bem_id in (1542897 , 1542895, 1542896);
select top 10 * from BemItemWfStatus BWS where bem_id in (1542897 , 1542895, 1542896);
select top 10 * from PatrimonioWfStatus PWS ;
select top 10 * from BemItem BI ;
select top 10 * from BemPatrimonial BP ;
select top 10 * from MovimentacaoBem MB ;
select top 10 * from GPB ;
select top 10 * from GRB ;
select top 10 * from PatrimonioWorkflow;
select top 10 * from  SituacaoPatrimonial ;
select top 10 * from  StatusPatrimonio ;
select top 10 * from  Unidade;
select top 10 * from  UnidadeGestora;
select top 10 * from  UnidadeGuarda;

select top 10 * from GPB WHERE gpb_proximonumero = 689 ;


SELECT TOP 10 * FROM BemItem BI WHERE BI.bit_registroPat 
IN ( '2017.265.0029680',
'2012.358.0000054', 
'2017.265.0029679', 
'2017.265.0029678', 
'2017.265.0029677', 
'2017.265.0029676',
'2011.265.0000338'
) ;


select top 10 * from MovimentacaoBem MB WHERE MB.bem_id in (5092) ;
update BemItem set bit_gpb = null where bem_id = 1542896; --  in (1542894, 1542895,1542896,1542897,1542900);
update BemItem set bit_uniGuarda = 6042 where bem_id = 1542895; 
update BemItem set bit_grb = 2039 where bem_id = 1542896;


2011.265.0000338
-- NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio
declare
	@UNI_ID INT = 25 -- 6042
	,@WRK_ID INT =  3
	,@STP_ID INT =  8-- 9


print'aui'
			SELECT
			BWS.bem_id
			, BWS.bit_id
			, BWS.biw_id
			, BWS.bws_id
			, BWS.wrk_id
			, BWS.stp_id,
			BI.bit_status,
			 BWS.bws_dataCriacao as bws_data
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
	