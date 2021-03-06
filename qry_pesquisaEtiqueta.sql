USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemPatrimonial_SelectSolicitacaoEtiquetaImpressao]    Script Date: 03/12/2018 14:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[NEW_BemPatrimonial_SelectSolicitacaoEtiquetaImpressao]    
--declare
 @uni_id int ,    
 @descricao varchar(100),    
 @grp_id int,    
 @loc_id INT ,    
 @dep_id int = null,    
 @bit_gpb varchar(20),    
 @bem_processo varchar(50),     
 @bem_doctocompra varchar(50),    
 @cfg_naoGerarMovimentRecebEstoque BIT    
AS    
BEGIN    
 SELECT      
       BP.bem_id,    
       BI.bit_id,    
       BI.bit_uniGestora,    
       BI.bit_uniGuarda,    
       dbo.FN_GetUniNome(BI.bit_uniGuarda) as uad_nome,    
       BP.bem_descricao,    
       BI.bit_uniGuarda AS uni_id,    
       GRP.grp_nome,    
       LOC.loc_nome,    
       BI.bit_GPB    
 FROM    
  BemPatrimonial as BP with(nolock)    
  INNER JOIN BemItem as BI with(nolock)    
   ON BP.bem_id = bi.bem_id     
  INNER JOIN GrupoBens as GRP with(nolock)    
   ON GRP.grp_id = BP.grp_id    
  INNER JOIN Localidade as LOC with(nolock)    
   ON LOC.loc_id = BI.loc_id    
      
      
 WHERE     
  BI.bit_status  not in (3,5)
  AND BI.bit_uniGuarda = @uni_id     
  AND BI.loc_id = @loc_id    
  AND ((@dep_id IS NULL) OR (bi.dep_id = @dep_id))    
  AND ((@descricao IS NULL) OR (BP.bem_descricao LIKE '%' + @descricao + '%' ))    
  AND ((@grp_id IS NULL) OR (BP.grp_id = @grp_id))    
  AND ((@bit_gpb IS NULL) OR (BI.bit_GPB = @bit_gpb))    
  and bi.bit_registroPat is null    
  AND EXISTS (    
      
  SELECT     
   DOC.bid_numeroDoc,    
   DOC.bid_tipoDoc,    
   DOC.bem_id    
  FROM     
   BemItemDocumento AS DOC WITH (NOLOCK)    
       
   WHERE     
   (    
   ((DOC.bid_numeroDoc = @bem_doctocompra AND DOC.bid_tipoDoc = 3 AND BP.bem_id = DOC.bem_id))    
    OR     
    ((DOC.bid_numeroDoc = @bem_processo AND DOC.bid_tipoDoc = 1 AND BP.bem_id = DOC.bem_id))    
    or (@bem_doctocompra IS NULL and @bem_processo IS NULL)    
    )    
        
      
  )    
    
  -- Task #9817    
       
  AND NOT EXISTS    
  (    
   SELECT     
    wfl.bem_id    
    , wfl.bit_id     
   FROM     
    BemItemWfStatus AS WFL with(nolock)    
   WHERE     
    BI.bem_id = WFL.bem_id     
    AND BI.bit_id = WFL.bit_id    
    AND WFL.wrk_id = 3    
    AND bws_situacao = 1    
      
  )    
  -- alteraçao henrique dia 10/07/2017, uma vez solicitado não aparece mais na lista  
   AND NOT EXISTS    
  (    
   SELECT     
    wfl.bem_id    
    , wfl.bit_id     
   FROM     
    BemItemWfStatus AS WFL with(nolock)    
   WHERE     
    BI.bem_id = WFL.bem_id     
    AND BI.bit_id = WFL.bit_id    
    AND WFL.wrk_id = 1    
 AND WFL.stp_id = 1    
    AND bws_situacao = 1    
      
  )    
       
  AND     
    (    
     @cfg_naoGerarMovimentRecebEstoque = 1    
     OR     
     ( SELECT     
       COUNT(MOV.mov_data)     
      FROM MovimentacaoBem AS MOV WITH(NOLOCK)    
      WHERE     
       MOV.bem_id = BP.bem_id  AND     
       MOV.bit_id =  BI.bit_id AND     
       MOV.tpm_id = (SELECT par_valor FROM SYS_Parametros WITH (NOLOCK) WHERE par_chave = 'MOVIMENTO_RECEBIMENTO')    
      GROUP BY MOV.bem_id, MOV.bit_id, MOV.tpm_id ) > 0    
          
     OR    
     (BP.bem_legado = 1 )         
              
    )     
          
 ORDER BY     
  bi.bit_registroPat    
    
END 

--select * from bemitem where bem_id = 1054668 and bit_id = 2748651