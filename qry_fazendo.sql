USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio_V2]    Script Date: 24/04/2018 16:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===========================================================================================
-- Author:		rafael sanchez
-- Create date: 25/04/2018
-- Description:	Stored procedure que permite alterar a situação de bens independente da unidade Id 
-- a situaçao de um status de workflow: 1 - Em andamento 2 - Concluído 
-- ===========================================================================================


ALTER PROCEDURE [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio_V2] 

WITH RECOMPILE
AS
BEGIN


	DECLARE @usu_id UNIQUEIDENTIFIER = '07860125-8D8F-E111-95F8-B8AC6FB2D553';
	DECLARE @UNI_ID INT -- REMOVER EM PROD

	DECLARE   @bem_id int
			, @bit_id int
			, @biw_id int
			, @bws_id int
			, @wrk_id int
			, @stp_id Int
			, @bws_situacao TinyInt
			, @dadosAtu varchar(500)
			, @dadosInsert varchar(500)
			, @bws_dataCriacao DateTime
			, @bws_dataAlteracao DateTime
			, @DtAtual DateTime = getdate()

	SET @bws_situacao = 2;
	SET @WRK_ID = 1;
	SET  @STP_ID = 6;
	SET @UNI_ID = 42; -- ATENCAO- AJUSTE AQUI PARA CASO DESEJE RODAR PARA UMA UNIDADE
	--*****************************************************************************

	If exists (select 1 from tempdb..sysobjects where name = '##Temp_BensPatimonio_')        
	drop table ##Temp_BensPatimonio_  

	-- *****************************************************************************
	SELECT 
				BWS.bem_id
				, BWS.bit_id
				, BWS.biw_id
				, BWS.bws_id
				, BWS.wrk_id
				, BWS.stp_id
				, BWS.bws_dataCriacao
				, BWS.bws_dataAlteracao
	
			into ##Temp_BensPatimonio_	
		
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
			--	BI.bit_uniGuarda = @UNI_ID AND -- COMENTAR EM PROD - OU UTILIZE PARA UMA UNIDADE !
				BWF.wrk_id = @WRK_ID
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


	-- ******************************************************************************************

			-- Cursor para percorrer os nomes dos objetos 
			DECLARE cursor_objects CURSOR FOR
				SELECT
					  bem_id , bit_id , biw_id , bws_id, wrk_id, stp_id,  bws_dataCriacao, bws_dataAlteracao
				FROM
				   ##Temp_BensPatimonio_
   
			-- Abrindo Cursor para leitura
			OPEN cursor_objects

			-- Lendo a próxima linha
			FETCH NEXT FROM cursor_objects INTO  @bem_id, @bit_id, @biw_id, @bws_id, @wrk_id, @stp_id, 
			 @bws_dataCriacao , @bws_dataAlteracao

			-- Percorrendo linhas do cursor (enquanto houverem)
			WHILE @@FETCH_STATUS = 0
			BEGIN

			set @bws_dataCriacao = CONVERT(varchar, @bws_dataCriacao, 120); -- yy/mm/dd hh:mm:ss
			set @DtAtual =  CONVERT( varchar, getdate(), 120);
			
			EXEC NEW_BemItemWfStatus_AtualizaSituacao @bem_id, @bit_id , @biw_id ,  @bws_id ;

		--	EXEC STP_BemItemWfStatus_INSERT @bem_id , @bit_id , @biw_id , @WRK_ID ,  7 , @usu_id, 'ajustes globais de patrimonio' , @bws_situacao ,
		--	@bws_dataCriacao , @DtAtual ;

		INSERT INTO 
			BemItemWfStatus
			( 
				bem_id 
				, bit_id 
				, biw_id 			
				, wrk_id 
				, stp_id 
				, usu_id 
				, bws_situacao 
				, bws_dataCriacao 
				, bws_dataAlteracao 
				, bws_observacao
 			)
		VALUES
			( 
				@bem_id 
				, @bit_id 
				, @biw_id 			
				, @wrk_id 
				, 7 
				, @usu_id 
				, @bws_situacao 
				, @bws_dataCriacao 
				, @DtAtual 
				, 'ajustes globais de patrimonio'
 
			)
				-- Lendo a próxima linha
				FETCH NEXT FROM cursor_objects INTO  @bem_id, @bit_id, @biw_id, @bws_id, @wrk_id, @stp_id 
													, @bws_dataCriacao , @bws_dataAlteracao
			END

			-- Fechando Cursor para leitura
			CLOSE cursor_objects

			-- Desalocando o cursor
			DEALLOCATE cursor_objects 


	-- ******************************************************************************************
	-- retorno
		select 101;

END -- fim procedure


--************************************************************************************************************************
-- QUERIES ABAIXO PARA FACILITAR DEBUG

-- SELECT * FROM  ##Temp_BensPatimonio_;
/*
  UPDATE 
		BemItemWfStatus
    SET
		bws_situacao = 2
		, bws_dataAlteracao = GETDATE()
	WHERE
		bem_id = 1426578
		AND bit_id = 5000950
		AND biw_id =9627708
		AND bws_id =24865677;

SELECT * FROM BemItemWfStatus WHERE bem_id = 1426578 ORDER BY BWS_DATAALTERACAO DESC;

EXEC NEW_BemItemWfStatus_AtualizaSituacao 1426578 ,  5000950 , 9627708 ,24865677 ;

	--	SELECT @dadosAtu =  @bem_id + ',' + @bit_id + ',' + @biw_id + ',' +  @bws_id ;

	-- SELECT @dadosInsert =  @bem_id + ',' + @bit_id + ',' + @biw_id + ',' + @WRK_ID + ',' +  @stp_id + ',' + 
				
		CONVERT(varchar(50), @usu_id) + ',' + NULL + ',' + @bws_situacao + ',' + @bws_dataCriacao  + ',' + GETDATE() ;

SELECT * FROM  ##Temp_BensPatimonio_;
SELECT top 30 * FROM BemItemWfStatus ORDER BY BWS_DATAALTERACAO DESC ;
select count(*) totais from BemItemWfStatus; 

select count(*) from  BemItemWfStatus where bem_id=1426578;
SELECT * FROM  ##Temp_BensPatimonio_;
select * from  BemItemWfStatus where bem_id=1426578 and stp_id=7;
-- 28116093


	select top 3 *	from 
						BemItemWfStatus with(nolock)
				where 
						1 = 1 
						and	bem_id = 1426578
						and	bit_id= 5000950 
						and biw_id = 9627708 
						and wrk_id = 1 
						and stp_id = 6
						and bws_situacao = 2


INSERT INTO 
			BemItemWfStatus
			( 
				bem_id 
				, bit_id 
				, biw_id 			
				, wrk_id 
				, stp_id 
				, usu_id 
				, bws_situacao 
				, bws_dataCriacao 
				, bws_dataAlteracao 
 			)
		VALUES
			( 
				1426578
				, 5000950
				,9627708			
				, 1 
				, 7 
				, '07860125-8D8F-E111-95F8-B8AC6FB2D553'
				,2 
				, '2018/04/24'
				, '2018/04/24'
 
			)


*/


