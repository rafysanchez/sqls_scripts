USE [ConPat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemItemWorkflow_BemItemBy_StatusPatrimonio]
		@UNI_ID = 40,
		@WRK_ID = 2,
		@STP_ID = 3

SELECT	'Return Value' = @return_value

GO
