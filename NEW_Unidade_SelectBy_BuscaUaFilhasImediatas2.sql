USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_Unidade_SelectBy_BuscaUaFilhasImediatas2]    Script Date: 29/08/2018 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  rafael sanchez  
-- Create date: 16/08/2018 
-- Description: SELECIONA UNIDADES E DETALHES DE CADA UNIDADE PELO FILTRO DE ESCOLAS MUNICIPALIZADAS 
-- PELA HIERARQUIA IMEDIATA INFERIOR, nao gestoras  
-- =============================================  
ALTER PROCEDURE [dbo].[NEW_Unidade_SelectBy_BuscaUaFilhasImediatas2]  
 @uni_id int  
 ,@nome varchar(200)  
--WITH RECOMPILE  
AS  
BEGIN  
 SELECT   
  fn1.uni_id ,   
  CASE  WHEN  fn1.uad_id is null  
      THEN en1.ent_codigo  
   ELSE ua1.uad_codigo  
    END AS codigo,  
        
  CASE WHEN fn1.uad_id is null   
      THEN en1.ent_razaoSocial   
      ELSE ua1.uad_nome   
  END AS nome,  
    
  CASE WHEN fn1.uad_id is null   
      THEN en1.ent_sigla   
   ELSE ua1.uad_sigla   
    END AS sigla  
    , fn1.uni_situacao  
 FROM dbo.FN_GetUnidadesHierarquiaImediata(@uni_id) fn1   
 inner join   
  VW_UnidadeEntidade AS en1 with (nolock) on  
  en1.ent_id = fn1.ent_id   
 left join   
  VW_UnidadeAdministrativa AS ua1 with (nolock) on   
  (ua1.ent_id = fn1.ent_id and ua1.uad_id = fn1.uad_id)  
 where   
  (fn1.uni_situacao = 5) and  
  (fn1.uad_id is null or ua1.uad_id is not null) and   
  (@nome is null or   
   (en1.ent_razaoSocial like '%' + @nome + '%' and fn1.uad_id is null) or  
   (ua1.uad_nome like '%' + @nome + '%' and fn1.uad_id is not null))  
  AND  
  (fn1.uni_id = @uni_id OR fn1.uni_id NOT IN (SELECT uni_id FROM dbo.UnidadeGestora with (nolock)))  
 order by nome  
    
 select @@ROWCOUNT  
END  