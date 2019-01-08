
use conpat ;
-- NEW_MovimentacaoBem_SelectBy_bem_id_bit_id_mov_data ( selecionou os movimentos para dado bemItem

-- NEW_Localidade_SelectBy_UniIDSituacao   ( localizacao do bemItem)

-- NEW_MovimentacaoBem_UPDATE_DataHistorico ( atualiza movimentacao do bem para o item com novos dados)

-- NEW_BemItem_UPDATE_ValorOrigem_ValorLiquido (atualiza BemItem com dados dos valores e dataas de alteracao)

-- NEW_BemItemWorkflow_SelecionaWorkFlows_Abertos ( checa se o item esta com workflow aberto )

DECLARE	@return_value int

EXEC	@return_value = [dbo].[NEW_BemPatrimonialCadastro_MontaRelatorioSP]
		@uniges_id = 109,
		@uniguarda_id = 1760,
		@grp_id = NULL,
		@data_inicial = NULL,
		@data_final = NULL,
		@reg_pat = NULL,
		@dep_situacao = NULL,
		@status_bem = NULL,
		@status_conservacao = NULL,
		@loc_id = NULL,
		@dep_id = NULL,
		@blnDataIncorporacao = -1,
		@status_bem_list = N'1'

SELECT	'Return Value' = @return_value

GO




use conpat ;

update [dbo].[BemItem] set [bit_dataCessaoUso] = '2018-04-19'  where [bit_registroPat] = '2011.349.0000153';



select * from [dbo].[BemItem]  where [bit_registroPat] = '2011.349.0000153';