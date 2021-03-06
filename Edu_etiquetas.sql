




--USE [ConPat]
--GO
--/****** Object:  StoredProcedure [dbo].[NEW_BemPatrimonial_SelectSolicitacaoEtiquetaImpressao]    Script Date: 30/11/2018 12:05:01 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER PROCEDURE [dbo].[NEW_BemPatrimonial_SelectSolicitacaoEtiquetaImpressao]    


declare
 @uni_id int = 4831 ,    
 @descricao varchar(100) = null,    
 @grp_id int = null,    
 @loc_id INT = 4794,    
 @dep_id int = null,    
 @bit_gpb varchar(20) = null,    
 @bem_processo varchar(50) = null,     
 @bem_doctocompra varchar(50) = null,    
 @cfg_naoGerarMovimentRecebEstoque BIT  = 1  
  
 
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
       BI.bit_GPB  ,
	   BI.bit_status  
           
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
         
  AND not EXISTS    
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
	and stp_id <> 14 
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
    


----select * from bemitem where bem_id = 1054668 and bit_id = 2748651


SELECT   * 
   FROM     
    BemItemWfStatus AS WFL with(nolock)    
	 INNER JOIN BemItem as BI 
	 ON WFL.bem_id = bi.bem_id  
   WHERE     
    BI.bem_id = WFL.bem_id     
    AND BI.bit_id = WFL.bit_id    
  AND WFL.wrk_id = 3  -- envio de bens  
  AND bws_situacao = 1  
  --and cast(bws_dataAlteracao as date) = cast('2018-12-03' as date)
	AND  BI.bem_id = 1821874
	and loc_id = 4794
	AND BI.bit_id in (5800426 , 5800427 , 5800428 , 5800429 ,5800430)
 


--select distinct wrk_id from BemItemWfStatus where bem_id = 1538936;
--select distinct stp_id from BemItemWfStatus where bem_id = 1538936;

--	-- JOGADA PARA VER SE APARECE - bws_situacao = 1

--	UPDATE BemItemWfStatus SET bws_situacao = 2 WHERE  bem_id = 1538936 ;


--	SELECT TOP 1000 [stc_id]
--      ,[stc_nome]
--      ,[stc_decricao]
--      ,[stc_situacao]
--      ,[stc_dataCriacao]
--      ,[stc_dataAlteracao]
--  FROM [ConPat].[dbo].[StatusConservacao]

  SELECT TOP 1000 [stp_id]
      ,[stp_nome]
      ,[stp_situacao]
      ,[stp_dataCriacao]
      ,[stp_dataAlteracao]
  FROM [ConPat].[dbo].[StatusPatrimonio]

  --SELECT TOP 1000 [wrk_id]
  --    ,[wrk_nome]
  --    ,[wrk_situacao]
  --    --,[wrk_dataCriacao]
  --    --,[wrk_dataAlteracao]
  --FROM [ConPat].[dbo].[PatrimonioWorkflow]

--  SELECT TOP 1000 [tpm_id]
--      ,[tpm_nome]
--      ,[tpm_nomeAbr]
--      ,[tpm_descricao]
--      ,[tpm_operacao]
--      ,[tpm_situacao]
--      ,[tpm_dataCriacao]
--      ,[tpm_dataAlteracao]
--  FROM [ConPat].[dbo].[TipoMovimentacao]

declare
@bem_processo varchar(50) = null,     
 @bem_doctocompra varchar(50) = null;   

  SELECT   *  
   --DOC.bid_numeroDoc,    
   --DOC.bid_tipoDoc,    
   --DOC.bem_id    
  FROM     
   BemItemDocumento AS DOC WITH (NOLOCK)    
       
   WHERE     
   (    
   ((DOC.bid_numeroDoc = null AND DOC.bid_tipoDoc = 3 AND  DOC.bem_id = 1821874))    
    OR     
    ((DOC.bid_numeroDoc = null AND DOC.bid_tipoDoc = 1 AND  DOC.bem_id = 1821874))    
    or (@bem_doctocompra IS NULL and @bem_processo IS NULL)    
    )    
       



use conpat;
 SELECT bid_tipodoc,  *  
   --DOC.bid_numeroDoc,    
   --DOC.bid_tipoDoc,    
   --DOC.bem_id    
  FROM     
   BemItemDocumento AS DOC 
   where  DOC.bem_id = 1821874 
   and bid_tipodoc = 1
   -- and bit_id = 5800426 
  and  cast(DOC.bid_dataalteracao as date) = cast( '2018-12-03' as date)
  and bid_dataEmissaoDoc is not null ;
  

  NEW_BemPatrimonial_SelectEtiquetasImpressaoReimpressao