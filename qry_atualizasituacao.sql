USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemItemWfStatus_AtualizaSituacao]    Script Date: 23/04/2018 14:31:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lukas Figueiredo
-- Create date: 01/09/2010
-- Description:	Stored procedure que permite alterar 
-- a situaçao de um status de workflow: 1 - Em andamento 2 - Concluído 
-- =============================================
ALTER PROCEDURE [dbo].[NEW_BemItemWfStatus_AtualizaSituacao] 
	@bem_id int,
	@bit_id int,
	@biw_id int,
	@bws_id int
AS
BEGIN
    UPDATE 
		BemItemWfStatus
    SET
		bws_situacao = 2
		, bws_dataAlteracao = GETDATE()
	WHERE
		bem_id = @bem_id 
		AND bit_id = @bit_id 
		AND biw_id = @biw_id 
		AND bws_id = @bws_id
END


-- NEW_BemItemWfStatus_AtualizaSituacao

 -- 1055940 , 2754352 , 9040636, 27310501