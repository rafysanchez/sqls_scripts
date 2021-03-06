USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemPatrimonial_SelectEtiquetasImpressaoReimpressao]    Script Date: 05/12/2018 14:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[NEW_BemPatrimonial_SelectEtiquetasImpressaoReimpressao]   
  @wrk_id int    -- 1-impressão, 2-reimpressao  
 ,@uniGuarda_id int  -- Unidade de guarda do Bem  
 ,@uni_id int    -- Unidade do usuario logado  
 ,@biw_id nvarchar(max) = null  
 ,@bws_id nvarchar(max) = null  
  
AS  
BEGIN  
   
 /* @wrk_id:  
  1 - IMPRESSAO  
  2 - REIMPRESSAO   
  */  
 IF @wrk_id = 1 -- IMPRESSAO   
 BEGIN  
  /* Impresso:   
   1 - Nao pode ter wf de recebimento pendente  
   2 - Se GUARDA é gestora -->  nao precisa de solicitacao  
   3 - Se GUARDA não é Gestora --> precisa de solicitacao     
   4 - Não ter um wf de impressão com passo maior que solicitação.  
   */  
     
  if @biw_id is not null  
  begin  
   SELECT    
     bem.bem_id,  
     bi.bit_id,  
     CASE WHEN bws.biw_id IS NULL   
    THEN 0  
    ELSE bws.biw_id  
    END AS biw_id,  
     CASE WHEN bws.bws_id IS NULL   
    THEN 0  
    ELSE bws.bws_id  
    END AS bws_id,  
     dbo.FN_GetUniNome(bi.bit_uniGuarda) as uad_nome,         
     bi.bit_uniGestora,  
     bem.bem_descricao,  
     grp.grp_nome,  
     loc.loc_id,  
     loc.loc_nome,  
     bem.bem_dataEntrada,  
     bem.bem_dataCriacao,  
     bi.bit_registroPat  
                      
  FROM  
   BemPatrimonial as bem with(nolock)  
   INNER JOIN BemItem as bi with(nolock)  
    ON Bem.bem_id = bi.bem_id  
   INNER JOIN GrupoBens as grp with(nolock)  
    ON grp.grp_id = bem.grp_id  
   INNER JOIN Localidade as loc with(nolock)  
    ON loc.loc_id = bi.loc_id  
	-- mudei de left para inner - alteração henrique dia 10/07/2017
   INNER JOIN BemItemWfStatus as bws with(nolock)  
    ON bi.bit_id = bws.bit_id and bi.bem_id = bws.bem_id  
    AND bws.wrk_id = @wrk_id  
    AND bws.stp_id <= 2 -- somente os passos de solicitacao  
    AND bws.bws_situacao <> 2  
   inner join (SELECT * FROM dbo.fnSplit(@biw_id,',')) as biws  
    on (bws.biw_id = biws.item)  
   inner join (SELECT * FROM dbo.fnSplit(@bws_id,',')) as bwss  
    on (bws.bws_id = bwss.item)  
  
  WHERE  
   bi.bit_status <> 3  
   AND (@uniGuarda_id IS NULL OR bi.bit_uniGuarda = @uniGuarda_id)  
   AND (bi.bit_uniGuarda IN(SELECT uni_id FROM dbo.FN_GetUnidadeEFilhas(@uni_id)))  
   -- 1 - Registro patrimonial deve ser nulo.  
   AND bi.bit_registroPat IS NULL   
   -- 1 - Nao pode ter wf de recebimento pendente  
   AND NOT EXISTS  
    (  
     SELECT   
      bem_id  
      , bit_id  
     FROM   
      BemItemWfStatus WITH(NoLock)      
     WHERE   
      bi.bem_id = BemItemWfStatus.bem_id   
      AND bi.bit_id = BemItemWfStatus.bit_id   
      AND (wrk_id = 3 OR wrk_id = 4)  -- wf de recebimento  
      AND bws_situacao = 1 -- pendente  
    )   
   --(Desconsiderado, vide comentario da alteração do dia 07/11/2013)  
   --AND (  
   -- -- 2 - Se GUARDA é gestora -->  nao precisa de solicitacao  
   -- bi.bit_uniGuarda = @uni_id    
   -- OR   
   -- -- 3 - Se GUARDA não é Gestora --> precisa de solicitacao  
   -- (  
   --  bi.bit_uniGuarda <> @uni_id   
   --  AND bws.biw_id IS NOT NULL --> quando acha registro de solicitacao  
   -- )  
   --)  
   -- 4 - Não ter um wf de impressão com passo maior que solicitação.  
   AND NOT EXISTS  
    (  
     SELECT   
      bem_id  
      , bit_id  
     FROM   
      BemItemWfStatus WITH(NoLock)      
     WHERE   
      bi.bem_id = BemItemWfStatus.bem_id   
      AND bi.bit_id = BemItemWfStatus.bit_id   
      AND (wrk_id = 1 OR wrk_id = 2)  -- wf de impressao e reimpressao  
      AND stp_id > 2 -- maior que solicitacao (ou seja, ja foi impresso, pode ou nao ter etiquetado)  
      AND bws_situacao <> 3 -- nao é excluido  
    )   
  end  
    
  else  --nulo  @biw_id is null  
    
  begin  
   SELECT    
     bem.bem_id,  
     bi.bit_id,  
     CASE WHEN bws.biw_id IS NULL   
    THEN 0  
    ELSE bws.biw_id  
    END AS biw_id,  
     CASE WHEN bws.bws_id IS NULL   
    THEN 0  
    ELSE bws.bws_id  
    END AS bws_id,  
     dbo.FN_GetUniNome(bi.bit_uniGuarda) as uad_nome,         
     bi.bit_uniGestora,  
     bem.bem_descricao,  
     grp.grp_nome,  
     loc.loc_id,  
     loc.loc_nome,  
     bem.bem_dataEntrada,  
     bem.bem_dataCriacao,  
     bi.bit_registroPat  
               
  FROM  
   BemPatrimonial as bem with(nolock)  
   INNER JOIN BemItem as bi with(nolock)  
    ON Bem.bem_id = bi.bem_id  
   INNER JOIN GrupoBens as grp with(nolock)  
    ON grp.grp_id = bem.grp_id  
   INNER JOIN Localidade as loc with(nolock)  
    ON loc.loc_id = bi.loc_id  
	-- mudei de left para inner - alteração henrique dia 10/07/2017
   INNER JOIN BemItemWfStatus as bws with(nolock)  
    ON bi.bit_id = bws.bit_id and bi.bem_id = bws.bem_id  
    AND bws.wrk_id = @wrk_id  
    AND bws.stp_id <= 2 -- somente os passos de solicitacao  
    AND bws.bws_situacao <> 2  
  WHERE  
   bi.bit_status <> 3  
   AND (@uniGuarda_id IS NULL OR bi.bit_uniGuarda = @uniGuarda_id)  
   AND (bi.bit_uniGuarda IN(SELECT uni_id FROM dbo.FN_GetUnidadeEFilhas(@uni_id)))  
   -- 1 - Registro patrimonial deve ser nulo.  
   AND bi.bit_registroPat IS NULL   
   -- 1 - Nao pode ter wf de recebimento pendente  
   AND NOT EXISTS  
    (  
     SELECT   
      bem_id  
      , bit_id  
     FROM   
      BemItemWfStatus WITH(NoLock)      
     WHERE   
      bi.bem_id = BemItemWfStatus.bem_id   
      AND bi.bit_id = BemItemWfStatus.bit_id   
      AND (wrk_id = 3 OR wrk_id = 4)  -- wf de recebimento  
      AND bws_situacao = 1 -- pendente  
    )   
   --(Desconsiderado, vide comentario da alteração do dia 07/11/2013)  
   --AND (  
   -- -- 2 - Se GUARDA é gestora -->  nao precisa de solicitacao  
   -- bi.bit_uniGuarda = @uni_id    
   -- OR   
   -- -- 3 - Se GUARDA não é Gestora --> precisa de solicitacao  
   -- (  
   --  bi.bit_uniGuarda <> @uni_id   
   --  AND bws.biw_id IS NOT NULL --> quando acha registro de solicitacao  
   -- )  
   --)  
   -- 4 - Não ter um wf de impressão com passo maior que solicitação.  
   AND NOT EXISTS  
    (  
     SELECT   
      bem_id  
      , bit_id  
     FROM   
      BemItemWfStatus WITH(NoLock)      
     WHERE   
      bi.bem_id = BemItemWfStatus.bem_id   
      AND bi.bit_id = BemItemWfStatus.bit_id   
      AND (wrk_id = 1 OR wrk_id = 2)  -- wf de impressao e reimpressao  
      AND stp_id > 2 -- maior que solicitacao (ou seja, ja foi impresso, pode ou nao ter etiquetado)  
      AND bws_situacao <> 3 -- nao é excluido  
    )   
   end  
  
 END   
  
 ELSE -- REIMPRESSAO  
   
 BEGIN  
  /*  REIMPRESSAO  
   1 - Registro patrimonial não pode ser nulo.  
   2 - Se GUARDA é gestora -->  nao precisa de solicitacao  
   3 - Se GUARDA não é Gestora --> precisa de solicitacao  
  */  
   
  SELECT    
       bem.bem_id,  
       bi.bit_id,  
       CASE WHEN bws.biw_id IS NULL   
   THEN 0  
   ELSE bws.biw_id  
   END AS biw_id,  
       CASE WHEN bws.bws_id IS NULL   
   THEN 0  
   ELSE bws.bws_id  
   END AS bws_id,  
       dbo.FN_GetUniNome(bi.bit_uniGuarda) as uad_nome,         
       bi.bit_uniGestora,  
       bem.bem_descricao,  
       grp.grp_nome,  
       loc.loc_id,  
       loc.loc_nome,  
       bem.bem_dataEntrada,  
       bem.bem_dataCriacao,  
       bi.bit_registroPat  
                      
 FROM  
  BemPatrimonial as bem with(nolock)  
  INNER JOIN BemItem as bi with(nolock)  
   ON Bem.bem_id = bi.bem_id  
  INNER JOIN GrupoBens as grp with(nolock)  
   ON grp.grp_id = bem.grp_id  
  INNER JOIN Localidade as loc with(nolock)  
   ON loc.loc_id = bi.loc_id  
  INNER JOIN BemItemWfStatus as bws with(nolock)  
   ON bi.bit_id = bws.bit_id and bi.bem_id = bws.bem_id  
   AND bws.wrk_id = @wrk_id  -- nesse caso: 2 - reimpressao   
   AND bws.stp_id <= 2 -- somente os passos de solicitacao  
   AND bws.bws_situacao <> 2  
 WHERE  
  bi.bit_status <> 3  
  AND (@uniGuarda_id IS NULL OR bi.bit_uniGuarda = @uniGuarda_id)  
  AND (bi.bit_uniGuarda IN(SELECT uni_id FROM dbo.FN_GetUnidadeEFilhas(@uni_id)))  
  -- 1 - Registro patrimonial não pode ser nulo.  
  AND bi.bit_registroPat IS NOT NULL   
  --(Desconsiderado, vide comentario da alteração do dia 07/11/2013)  
  --AND (  
  -- -- 2 - Se GUARDA é gestora -->  nao precisa de solicitacao  
  -- bi.bit_uniGuarda = @uni_id    
  -- OR   
  -- -- 3 - Se GUARDA não é Gestora --> precisa de solicitacao  
  -- (  
  --  bi.bit_uniGuarda <> @uni_id   
  --  AND bws.biw_id IS NOT NULL --> quando acha registro de solicitacao  
  -- )  
  --)  
 END  
END  
  
  