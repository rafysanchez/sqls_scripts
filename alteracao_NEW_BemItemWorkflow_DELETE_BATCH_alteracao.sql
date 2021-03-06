USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemItemWorkflow_DELETE_BATCH]    Script Date: 09/10/2018 17:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Wellington Rossi
-- Alterado: rafael sanchez portal  - magna sistemas
-- Create date: 04/11/2013
-- alterado em  outubro 2018
-- Description:	Exclusão em Lote
-- Alteração: cópia para Conpat 
-- =============================================
ALTER PROCEDURE [dbo].[NEW_BemItemWorkflow_DELETE_BATCH]
    @DataTable dbo.BemItemWorkflowTableType READONLY 
AS

BEGIN TRY  
    MERGE INTO dbo.BemItemWorkflow AS M
    USING @DataTable AS T 
	ON (M.bem_id = T.bem_id 
		AND M.bit_id = T.bit_id 
		AND M.biw_id = T.biw_id) 
    WHEN MATCHED THEN DELETE;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH; 

