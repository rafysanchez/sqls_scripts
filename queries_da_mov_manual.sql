
-- NEW_BemItem_SelectBy_bit_RegistroPat  2018.338.0000376

-- NEW_GrupoBens_Select_Ancestral_by_grpid

-- NEW_MovimentacaoBem_Select_mov_dataBy_bem_id_bit_id

-- NEW_BemItemWorkflow_SelecionaWorkFlows_Abertos  1801944  // 5556513 // 4;3

-- NEW_BemItem_SelectBy_bit_RegistroPat  

-- NEW_MovimentacaoBem_SelectBy_Bem_idAndOperacao



use conpat;

USE [ConPat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemItem_SelectBy_bit_RegistroPat]
		@bit_registroPat = N'2018.338.0000376',
		@bem_id = NULL,
		@bit_id = NULL,
		@cod_status = NULL,
		@Ids = 1

SELECT	'Return Value' = @return_value

GO
