-- ' http://localhost/WebConPat/AreaAdm/Relatorios/GPB/Filtros.aspx '
-- metodo : AtualizaGRBTabelaMovimentacao
-- proc NEW_GRB_AtualizaTabelaMovimento


--1313072
--4715698
--2055
--2,6

use ConPat;

declare
@uni_destino int,
 @bem_id_Origem int = 1313072, 
 @bit_id_Origem int = 4715701,
  @numGrb varchar(max) ='2061' ,
   @tpm_operacao varchar(max) = '2,6' ;

 select @uni_destino= mov_unidadeDestino        
   from         MovimentacaoBem WITH(NoLock)      
    where        
	 MovimentacaoBem.mov_situacao  in (1,5)  -- = 5 antes do dia 12/06 alteração feita por henrique       
	    AND bem_id=@bem_id_Origem       
		 and bit_id=@bit_id_Origem  
		  and uni_id = 25      
		 --and mov_GPB is null       
		  and tpm_id in (select tpm_id            from TipoMovimentacao WITH(NoLock)            
		
		  where TipoMovimentacao.tpm_operacao             
		  in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,',')) ) 
		 
		 
		  select  @uni_destino;  

		  select *  from MovimentacaoBem where bem_id=@bem_id_Origem  and bit_id=@bit_id_Origem ;

		   select top 1 uni_idgestora from dbo.FN_GetUnidadesSuperiores(@uni_destino);

		   select tpm_id   from TipoMovimentacao WITH(NoLock)            
		  where TipoMovimentacao.tpm_operacao             
		  in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,','));


 -- select * from BemItem where bem_id = 1313072 ;