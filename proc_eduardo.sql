USE [ConPat]

-- NEW_GRB_Agrupa_Movimentos




declare  
 @ano varchar(4) = 2018,    
 @uni_id int = 3963,    
 @uni_idRestricao int = 25,    
 @grp_id int = -1,    
 @bem_descricao varchar(max) = null,    
 @tipoSolicitacao int = 8,    
 @wrk_id int = 3,    
 @tpm_operacao varchar(max) = '6'    
 -- @gpb varchar(max)    
      
--WITH RECOMPILE    
-- AS    
--BEGIN    
    
 IF @tipoSolicitacao =8 --IMPRESSÃO    
 BEGIN    
 WITH MoviBem AS    
 (    
  SELECT    
   bem_id    
   ,bit_id    
   ,mov_unidadeOrigem    
   ,mov_unidadeDestino    
   ,ISNULL(MovimentacaoBem.mov_GPB,'Não possui guia')as mov_GPB    
   ,tpm_id    
   ,DATEPART (YEAR, mov_data) as ano    
  FROM     
   MovimentacaoBem WITH (NoLock)    
  WHERE    
   MovimentacaoBem.mov_situacao in (1,5)    -- = 5 antes do dia 12/06 alteração feita por henrique
   And (MovimentacaoBem.mov_unidadeDestino!=MovimentacaoBem.mov_unidadeOrigem)       
   AND  (Exists( select uni_id from dbo.FN_GetUnidadeEFilhas(@uni_idRestricao) where uni_id  = MovimentacaoBem.mov_unidadeOrigem))          
   AND mov_GPB is null    
   AND  MovimentacaoBem.uni_id != (select top 1 uni_idgestora from dbo.FN_GetUnidadesSuperiores(MovimentacaoBem.mov_unidadeDestino))    
   AND ((DATEPART (YEAR, mov_data) = cast(@ano as int)) OR @ano is null)    
 )     
     
 , BemItemWorkStatus AS    
 (    
  Select     
   bem_id    
   ,bit_id    
  From     
   BemItemWfStatus WITH (NoLock)    
  Where    
    BemItemWfStatus.bws_situacao=1    
   AND BemItemWfStatus.wrk_id=@wrk_id    
   AND BemItemWfStatus.stp_id = @tipoSolicitacao    
 )    
     
  SELECT     
   MoviBem.mov_unidadeOrigem as origem,    
   MoviBem.mov_unidadeDestino as destino,     
   MoviBem.mov_GPB,    
   MoviBem.ano
   --,    
   -- dbo.FN_GetUniNome(MoviBem.mov_unidadeOrigem) as NomeOrigem,    
   -- dbo.FN_GetUniNome(MoviBem.mov_unidadeDestino) as NomeDestino    
  FROM     
   MoviBem WITH(NoLock)    
   inner join TipoMovimentacao as TipMov WITH(NoLock)    
    on TipMov.tpm_id = MoviBem.tpm_id     
   inner join BemPatrimonial WITH(NoLock)    
    on MoviBem.bem_id = BemPatrimonial.bem_id        
        
  WHERE    
   (@uni_id is null or (@uni_id=MoviBem.mov_unidadeOrigem))       
   AND (@bem_descricao is null or (bem_descricao like '%'+@bem_descricao+'%'))       
   AND (TipMov.tpm_operacao in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,',') ))    
      
  GROUP BY    
   MoviBem.mov_unidadeOrigem    
   ,MoviBem.mov_unidadeDestino       
   ,mov_GPB    
   ,MoviBem.ano       
       
   ORDER BY     
   origem    
   , destino asc,    
   MoviBem.ano    
     
 end 
    
-- ELSE -- REIMPRESSÃO     
-- BEGIN    
-- WITH MoviBem AS    
-- (    
--  SELECT    
--   bem_id    
--   ,bit_id    
--   ,mov_unidadeOrigem    
--   ,mov_unidadeDestino    
--   ,ISNULL(MovimentacaoBem.mov_GPB,'Não possui guia')as mov_GPB    
--   ,tpm_id    
--   ,DATEPART (YEAR, mov_data) as ano    
--  FROM     
--   MovimentacaoBem  with (nolock)  
--  WHERE    
--    MovimentacaoBem.mov_situacao not in (3,4)    
--   AND ( EXISTS( select top 1 uni_id from  dbo.FN_GetUnidadeEFilhas(@uni_idRestricao) where uni_id  = MovimentacaoBem.mov_unidadeOrigem or MovimentacaoBem.mov_unidadeDestino = @uni_idRestricao))      
--   AND (MovimentacaoBem.mov_GPB= @gpb)        
--   AND  MovimentacaoBem.uni_id != (select top 1 uni_idgestora from dbo.FN_GetUnidadesSuperiores(MovimentacaoBem.mov_unidadeDestino))    
--   AND ((DATEPART (YEAR, mov_data) = cast(@ano as int)) OR @ano is null)    
       
--  )       
     
--  SELECT     
--   MoviBem.mov_unidadeOrigem as origem,    
--   MoviBem.mov_unidadeDestino as destino,     
--   MoviBem.mov_GPB,    
--   MoviBem.ano,    
--   dbo.FN_GetUniNome(MoviBem.mov_unidadeOrigem) as NomeOrigem,    
--   dbo.FN_GetUniNome(MoviBem.mov_unidadeDestino) as NomeDestino    
       
--  FROM     
--   MoviBem WITH(NoLock)       
--   inner join BemPatrimonial WITH(NoLock)    
--    on MoviBem.bem_id = BemPatrimonial.bem_id      
--   inner join TipoMovimentacao as TipMov WITH(NoLock)    
--    on TipMov.tpm_id = MoviBem.tpm_id     
--  WHERE    
--   (@uni_id is null or (@uni_id=MoviBem.mov_unidadeOrigem or @uni_id=MoviBem.mov_unidadeDestino))      
--   AND (@bem_descricao is null or (bem_descricao like '%'+ @bem_descricao +'%'))    
--   AND (TipMov.tpm_operacao in (select valor from dbo.FN_StringToArrayInt64(@tpm_operacao,',') ))    
       
--  GROUP BY        
--   MoviBem.mov_unidadeOrigem    
--   ,MoviBem.mov_unidadeDestino    
--   ,MoviBem.mov_GPB    
--   ,MoviBem.ano     
       
--  ORDER BY     
--   origem    
--   , destino asc    
--   ,MoviBem.ano    
      
-- end    
--END 