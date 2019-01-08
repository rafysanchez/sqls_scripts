USE [ConPat]
GO

/****** Object:  StoredProcedure [dbo].[NEW_GPB_AtualizaTabelaMovimentoV2]    Script Date: 04/07/2018 10:59:18 ******/
DROP PROCEDURE [dbo].[NEW_GPB_AtualizaTabelaMovimentoV2]
GO

/****** Object:  StoredProcedure [dbo].[NEW_GPB_AtualizaTabelaMovimentoV2]    Script Date: 04/07/2018 10:59:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  Fabio A  
-- aterado pro: rafael sanhez  - magna ibm
-- Create date: 21/09/2010 9:14h  
-- Description: Monta os componentes de origem, destino endereço da Guia de Passagem de bens  
-- =============================================  
CREATE  procedure [dbo].[NEW_GPB_AtualizaTabelaMovimentoV2]  
@bem_id_Origem int,  
@bit_id_Origem int,  
@numGpb varchar(max),  
@tpm_operacao varchar(max) ,
@uni_destino int = 0 ,
@uniGestora int = 0
AS  
BEGIN  
 

 update   
  MovimentacaoBem  
 set   
  mov_GPB=@numGpb  
 where   
  bem_id=@bem_id_Origem  
  and MovimentacaoBem.mov_situacao  in (1,5)  -- = 5 antes do dia 12/06 alteração feita por henrique  
  and bit_id=@bit_id_Origem  
  and mov_GPB is null  
  and tpm_id in (select tpm_id  
        from TipoMovimentacao  WITH(NoLock)  
        where TipoMovimentacao.tpm_operacao in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,','))  
      )  
   
 UPDATE BemItem  
  SET  
    bit_uniGestora = (select top 1 uni_idgestora from dbo.FN_GetUnidadesSuperiores(@uni_destino)) 
   , bit_uniGuarda = @uni_destino  
   , loc_id = (SELECT TOP 1 loc_id FROM Localidade WITH (NoLock) WHERE uni_id = @uni_destino AND loc_situacao = 4)  
   , dep_id=NUll  
  WHERE   
   bem_id = @bem_id_Origem  
   AND bit_id = @bit_id_Origem  
  
    
END  
GO


