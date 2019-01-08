-- erro em parametrização fde/index
use DB_PRESTACAO_CONTAS;alter table DB_PRESTACAO_CONTAS.[PARAMETRIZACAO].[TB_PROGRAMA_REPASSE]add FLG_DESCOLA_TRABALHO int default 0 ;


                    SELECT 
                       PR.ID_PROGRAMA_REPASSE
                      ,PR.ID_CONTA_DEVOLUCAO
                      ,PR.ID_PROGRAMA
                      ,PR.DT_REPASSE
                      ,PR.NR_CONVENIO
                      ,PR.DS_COMPLEMENTO
                      --,PR.DT_UTILIZACAO_INI
                      --,PR.DT_UTILIZACAO_FIM
                      --,PR.DT_LIMITE
                      ,PR.ID_TIPO_REPASSE
                      ,PR.DS_TITULO_MANUAL
                      ,PR.DS_LINK_ANEXO
                      ,PR.DT_INCLUSAO
                      ,PR.ID_USUARIO
                      ,FLG_DESCOLA_TRABALHO
                      ,PR.ID_STATUS_PARAMETRIZACAO
                      ,TIPO.NM_TIPO_REPASSE
                      ,PROGRAMA.NM_PROGRAMA
                      ,EXERCICIO.ID_EXERCICIO
                      ,EXERCICIO.NR_ANO_BASE
                      ,SUM(RI.VL_REPASSE) AS VALOR_REPASSE
                    FROM        DB_PRESTACAO_CONTAS.PARAMETRIZACAO.TB_PROGRAMA_REPASSE          PR
                    INNER JOIN  DB_PRESTACAO_CONTAS.dbo.TB_TIPO_REPASSE                         TIPO        ON TIPO.ID_TIPO_REPASSE     = PR.ID_TIPO_REPASSE
                    INNER JOIN  DB_PRESTACAO_CONTAS.dbo.TB_PROGRAMA                             PROGRAMA    ON PROGRAMA.ID_PROGRAMA     = PR.ID_PROGRAMA
                    INNER JOIN  DB_PRESTACAO_CONTAS.dbo.TB_EXERCICIO                            EXERCICIO   ON EXERCICIO.ID_EXERCICIO   = PR.ID_EXERCICIO
					LEFT JOIN  DB_PRESTACAO_CONTAS.CONVENIO_REPASSE.TB_REPASSE_RECURSOS			RC			ON RC.ID_PROGRAMA_REPASSE   = PR.ID_PROGRAMA_REPASSE
					LEFT JOIN  DB_PRESTACAO_CONTAS.CONVENIO_REPASSE.TB_REPASSE_RECURSOS_ITEM	RI			ON RI.ID_REPASSE_RECURSOS   = RC.ID_REPASSE_RECURSOS
					LEFT JOIN  DB_PRESTACAO_CONTAS.CONVENIO_REPASSE.TB_PAGAMENTO				PG			ON PG.ID_PAGAMENTO			= RC.ID_PAGAMENTO
                    WHERE 1=1
                    AND PR.ID_STATUS_PARAMETRIZACAO != 4
                    GROUP BY PR.ID_PROGRAMA_REPASSE
                                           ,PR.ID_CONTA_DEVOLUCAO
                                           ,PR.ID_PROGRAMA
                                           ,PR.DT_REPASSE
                                           ,PR.NR_CONVENIO
                                           ,DS_COMPLEMENTO
                                           ,PR.ID_TIPO_REPASSE
                                           ,PR.DS_TITULO_MANUAL
                                           ,PR.DS_LINK_ANEXO
                                           ,PR.DT_INCLUSAO
                                           ,PR.ID_USUARIO
                                           ,PR.ID_STATUS_PARAMETRIZACAO
                                           ,TIPO.NM_TIPO_REPASSE
                                           ,PROGRAMA.NM_PROGRAMA
                                           ,EXERCICIO.ID_EXERCICIO
                                           ,EXERCICIO.NR_ANO_BASE
                                           ,FLG_DESCOLA_TRABALHO


	select prRep.id_programa_repasse Id, pr.nm_programa + ' / ' + cast(ex.nr_ano_base as varchar(10)) NomeObjeto 
	from         DB_PRESTACAO_CONTAS.[PARAMETRIZACAO].[TB_PROGRAMA_REPASSE] prRep     
	  inner join DB_PRESTACAO_CONTAS.[dbo].[TB_EXERCICIO] ex on prRep.id_exercicio = ex.id_exercicio 
	   inner join DB_PRESTACAO_CONTAS.[dbo].[TB_PROGRAMA] pr on prRep.id_programa = pr.id_programa
	   where FLG_DESCOLA_TRABALHO=1;

