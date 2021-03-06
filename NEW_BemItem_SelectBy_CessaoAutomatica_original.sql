USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemItem_SelectBy_CessaoAutomatica]    Script Date: 12/09/2018 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author:		Jorge Freitas
-- Create date: 20/01/2011
-- Description:	Pesquisa dados dos bens (BEMITEM) que devem entrar no 
--				processo de cessão automatica
-- Alteração: Luana Piva
-- Data: 28/03/2014
-- descrição: considerar movimentações manuais e automáticas.
-- ==================================================================
ALTER PROCEDURE [dbo].[NEW_BemItem_SelectBy_CessaoAutomatica]
	@dtIni DATETIME
	,@dtFim DATETIME 
	,@uni_id int 
AS
BEGIN

	select 
		bi.bem_id
		, bi.bit_id
		, bi.bit_dataIncorporacao
		, bi.bit_uniGuarda
		, bi.bit_uniGestora
		, bi.bit_registroPat 
		, bi.bit_valorLiquido 
		, bp.bem_legado 
		, bp.grp_id 	 
	from BemItem bi WITH(NoLock)
	INNER JOIN
		 BemPatrimonial bp WITH(NoLock)
		ON bp.bem_id = bi.bem_id 
		and bp.bem_legado = 0
	where 
		bi.bit_situacao = 1
		and bi.bit_uniGuarda = @uni_id 
		and (bi.bit_dataIncorporacao < @dtFim and bi.bit_dataIncorporacao is not null)
		and (bi.bit_dataBaixa is null or bi.bit_dataBaixa >= @dtFim ) 
		and (bi.bit_registroPat is not null)
				
		and Not Exists (select 
							mb.mov_data  
						from MovimentacaoBem as mb 
						inner join 
							TipoMovimentacao tm
							on tm.tpm_id = mb.tpm_id 
							and tm.tpm_operacao = 7
						where 
							mb.bem_id = bi.bem_id  and mb.bit_id = bi.bit_id
							and (mb.mov_data >= @dtIni 
							and mb.mov_data < @dtFim)
							and mb.mov_situacao  <> 3)
							--and mb.mov_origem = 1) 
		
		order by bem_id , bit_id
END
