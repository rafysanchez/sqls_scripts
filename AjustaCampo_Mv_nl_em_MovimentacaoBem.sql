


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rafael sanchez portal  - magna IBM
-- Create date: outubro de 2018
-- Description:	ajuste no campo mov_nl da tabela de movimentação de bens PARA USO NO SIAFEN
-- =============================================
CREATE PROCEDURE AjustaCampo_Mv_nl_em_MovimentacaoBem
	
	@bem_id int NULL, 
	@bit_id int NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRY
	   UPDATE [dbo].[MovimentacaoBem] set [mov_nl] = 'IMPORT. FDE'
	   WHERE [bem_id] = @bem_id AND [bit_id] = @bit_id AND [mov_nl] IS NULL;

	   SELECT @@ROWCOUNT ;
	END TRY
	BEGIN CATCH  
		SELECT   
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH; 
END
GO

/*

SELECT * FROM [dbo].[MovimentacaoBem] 
WHERE 
[bem_id] = 1816222 
AND [bit_id] = 5768522
--AND 
--[mov_nl] IS NULL
ORDER BY [mov_data] DESC;



exec AjustaCampo_Mv_nl_em_MovimentacaoBem 60957, 1 ;
*/
