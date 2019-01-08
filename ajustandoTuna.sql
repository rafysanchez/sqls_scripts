

	declare @cco varchar(20) ;        
	declare @dataInicial date;    
	declare @dataFinal date;   
	declare @uniges_id int;       
	declare @uniguarda_id int;   
	declare @val1 int;

	set @cco  = null;        
	set @dataInicial  = getdate()-365;       
	set @dataFinal = getdate() ;        
	set @uniges_id = 52;        
	set @uniguarda_id = 0  ;    
      
BEGIN         
 WITH        
        
 tbUnidades AS (        
         
  SELECT uni_id, uad_id , case when @uniges_id=85 then 1 else 0 end  as uge       
  FROM        
   dbo.FN_GetUnidadeEFilhas(@uniges_id)          
        
 )        
        
SELECT   pc.pco_evento as eventoDebito, pc.pco_eventoCredito as eventoCredito,
	mov_unidadeDestino,      
	mov_unidadeOrigem,      
	-- mov.uni_id,      
	mov.cco_codigoCredito,      
	mov.cco_codigoDebito,      
	MOV.mov_data as data,        
	mov.bem_id,        
	mov.bit_id,        
	CC.cco_codigo,    
--   Case        
--    when MOV.cco_codigoCredito = CC.cco_codigo then MOV.cco_codigoDebito         
--    when MOV.cco_codigoDebito = CC.cco_codigo then MOV.cco_codigoCredito        
--   end        
--   as conta,
------***************************************************************************************************     
--     (Case         
--     when MOV.cco_codigoCredito=MOV.cco_codigoDebito then        
--      (Case         
--       when (select top 1 uni_id from dbo.FN_GetUnidadesSuperiores(mov_unidadeDestino )) = unGua.uni_id   then 'Debito'       
--       when (select top 1 uni_id from dbo.FN_GetUnidadesSuperiores(mov_unidadeOrigem )) = unGua.uni_id    then 
--	   (Case when MOV.mov_nl = 'LEGADO'  then 'Debito'   else  'Credito' end)    					     
--   else        
--        (Case        
--         when MOV.cco_codigoCredito= CC.cco_codigo then (case when MOV.mov_nl = 'LEGADO'   then 'Debito'     else 'Credito' end )      
      
--         when MOV.cco_codigoDebito= CC.cco_codigo then 'Debito'  end  )      
--      end)            
--    else        
--     (Case        
--      when MOV.cco_codigoCredito= CC.cco_codigo then (case when MOV.mov_nl = 'LEGADO'      
--   then 'Debito'      
--   else 'Credito' end )      
--      when MOV.cco_codigoDebito= CC.cco_codigo then 'Debito'        
--     end  )      
--    end  )      
--   as tipoConta, 
----***************************************************************************************************          
--   (Case         
--    -- when mov_unidadeDestino=mov_unidadeOrigem  then '0,00'     
-- when (select  top 1 uni_idGestora from dbo.FN_GetUnidadesSuperiores(mov_unidadeOrigem) as oo where oo.uni_id =mov_unidadeOrigem) =     
-- (select  top 1 uni_idGestora from dbo.FN_GetUnidadesSuperiores(mov_unidadeDestino )as dd where dd.uni_id =mov_unidadeDestino)  then '0,00'    
--  else MOV.mov_valor END)   as valor,        
----***************************************************************************************************
   MOV.mov_observacao as historico,        
   MOV.mov_nl as situacao,        
   CC.cco_codigo as codigo,        
   CC.cco_nome as nomeConta,        
   (select uni_codigoUGE from Unidade with (nolock) where uni_id = MOV.uni_id) as UGE,        
   unGua.uni_id,        
   uadGua.uad_nome        
  -- ,mov_unidadeOrigem,mov_unidadeDestino  
  FROM         
   ContasContabeis  AS CC with (nolock)        
   INNER JOIN         
    MovimentacaoBem AS MOV  with (nolock)        
    ON         
     CC.cco_codigo = MOV.cco_codigoDebito        
    OR (CC.cco_codigo = MOV.cco_codigoCredito AND MOV.cco_codigoCredito <> MOV.cco_codigoDebito)             
      INNER JOIN tbUnidades AS unGua with (nolock)        
    ON unGua.uni_id = mov.uni_id     or unGua.uni_id = mov.mov_unidadeDestino      
     INNER JOIN dbo.VW_UnidadeAdministrativa AS uadGua WITH(NoLock)        
    ON unGua.uad_id = uadGua.uad_id         
     INNER JOIN PARAMETROCONTABIL PC       
    ON PC.TPM_ID = MOV.TPM_ID AND PC.GRP_ID = MOV.GRP_ID      
     AND PC.CCO_CODIGOCREDITO =  MOV.CCO_CODIGOCREDITO  AND       
       PC.CCO_CODIGODEBITO = MOV.CCO_CODIGODEBITO        
  WHERE  
       
   (@cco = '0' or @cco is null or (CC.cco_codigo = @cco ))        
   AND (((select top 1 mov.uni_id from dbo.FN_GetUnidadesSuperiores(MOV.mov_unidadeOrigem )) = mov.uni_id)         
   or ((select top 1 mov.uni_id from dbo.FN_GetUnidadesSuperiores(MOV.mov_unidadeDestino )) = mov.uni_id))        
	And (@dataInicial is null or (CONVERT(int,MOV.per_ano)=YEAR(@dataInicial) and CONVERT(int,MOV.per_mes)>=CONVERT(int, Month(@dataInicial))) or (CONVERT(int,MOV.per_ano)>CONVERT(int,YEAR(@dataInicial))))        
   AND (@dataFinal is null or (CONVERT(int,MOV.per_ano)= Convert(int,YEAR(@dataFinal)) and CONVERT(int,MOV.per_mes)<=CONVERT(int,Month(@dataFinal))) or (CONVERT(int,MOV.per_ano)<CONVERT(int, YEAR(@dataFinal))))        
   AND (mov_situacao NOT IN (5,3)  )        
   AND ((@uniguarda_id  = 0) OR (unGua.uni_id = @uniguarda_id))        
   --and   mov_unidadeDestino is not null  
END     
    
    
--SELECT TOP 100 * FROM MOVIMENTACAOBEM WITH (NOLOCK) WHERE mov_unidadeDestino = mov_unidadeOrigem

-- DBCC FREEPROCCACHE
/*
-- queries mais lentas
SELECT TOP 10
total_worker_time/execution_count AS Avg_CPU_Time
    ,execution_count
    ,total_elapsed_time/execution_count as AVG_Run_Time
    ,(SELECT
          SUBSTRING(text,statement_start_offset/2,(CASE
                                                       WHEN statement_end_offset = -1 THEN LEN(CONVERT(nvarchar(max), text)) * 2 
                                                       ELSE statement_end_offset 
                                                   END -statement_start_offset)/2
                   ) FROM sys.dm_exec_sql_text(sql_handle)
     ) AS query_text 
FROM sys.dm_exec_query_stats 

--pick your criteria

ORDER BY Avg_CPU_Time DESC


--  select * from VW_UnidadeAdministrativa ;

*/

