USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[STP_BemItemWfStatus_INSERT]    Script Date: 23/04/2018 14:37:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[STP_BemItemWfStatus_INSERT]
	  @bem_id BigInt
	, @bit_id Int
	, @biw_id Int	
	, @wrk_id Int
	, @stp_id Int
	, @usu_id UNIQUEIDENTIFIER
	, @bws_observacao VarChar (1000)
	, @bws_situacao TinyInt
	, @bws_dataCriacao DateTime
	, @bws_dataAlteracao DateTime

AS
if not exists (	
				select 
						1 
				from 
						BemItemWfStatus with(nolock)
				where 
						1 = 1 
						and	bem_id = @bem_id 
						and	bit_id= @bit_id 
						and biw_id = @biw_id 
						and wrk_id = @wrk_id 
						and stp_id = @stp_id 
						and bws_situacao = @bws_situacao
				
				)
	BEGIN
		INSERT INTO 
			BemItemWfStatus
			( 
				bem_id 
				, bit_id 
				, biw_id 			
				, wrk_id 
				, stp_id 
				, usu_id 
				, bws_observacao 
				, bws_situacao 
				, bws_dataCriacao 
				, bws_dataAlteracao 
 
			)
		VALUES
			( 
				@bem_id 
				, @bit_id 
				, @biw_id 			
				, @wrk_id 
				, @stp_id 
				, @usu_id 
				, @bws_observacao 
				, @bws_situacao 
				, @bws_dataCriacao 
				, @bws_dataAlteracao 
 
			)
		
		
	
	END

		SELECT ISNULL(SCOPE_IDENTITY(),-1)



		--***************************************************

		select * from Coresso.[dbo].[SYS_Usuario] with(nolock) where usu_id = '07860125-8D8F-E111-95F8-B8AC6FB2D553';