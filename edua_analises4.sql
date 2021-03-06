USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_GRB_AtualizaTabelaMovimento]    Script Date: 27/06/2018 11:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:  Fabio A -- Create date: 21/09/2010 9:14h 
-- Description: Monta os componentes de origem, destino endereço da Guia de Passagem de bens 
-- ============================================= 

--764043
--1516532
--2054
--2,6


--1313072
--4715698
--2055
--2,6

--ALTER  procedure [dbo].[NEW_GRB_AtualizaTabelaMovimento]

declare
	@bem_id_Origem int = 1313072, 
	@bit_id_Origem int = 4715701,
	@numGrb varchar(max) ='2061' ,
	@tpm_operacao varchar(max) = '2,6' ,
	@uni_destino int = 0,
	@uniGestora int = 0
   -- AS 
   BEGIN  

   
   select @uni_destino= mov_unidadeDestino        
   from         MovimentacaoBem WITH(NoLock)      
    where        
	 MovimentacaoBem.mov_situacao  in (1,5)  -- = 5 antes do dia 12/06 alteração feita por henrique       
	    AND bem_id=@bem_id_Origem       
		 and bit_id=@bit_id_Origem        
		 --and mov_GPB is null       
		  and tpm_id in (select tpm_id            from TipoMovimentacao WITH(NoLock)            
		  where TipoMovimentacao.tpm_operacao             
		  in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,','))       ) 
		  print  @uni_destino;  
		  
		  update    MovimentacaoBem  set    mov_GPB=@numGrb  
		  where    bem_id=@bem_id_Origem   
		  and MovimentacaoBem.mov_situacao in (1,5)  -- = 5 antes do dia 12/06 alteração feita por henrique    
		  and bit_id=@bit_id_Origem   
		  and mov_GPB is null   
		  and tpm_id in (select tpm_id         from TipoMovimentacao  WITH(NoLock)         
		  where TipoMovimentacao.tpm_operacao 
		  in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,','))       )    
		 

		  UPDATE BemItem   SET    bit_uniGestora =(select top 1 uni_idgestora from dbo.FN_GetUnidadesSuperiores(@uni_destino))    ,                                      bit_uniGuarda=6042    , 
				loc_id = (SELECT TOP 1 loc_id FROM Localidade with(nolock) 
				WHERE uni_id = 6042 AND loc_situacao = 4)    
				,dep_id=NUll  
        WHERE  bem_id = @bem_id_Origem    AND bit_id = @bit_id_Origem  --AND bit_GRB = @numGrb    

END 