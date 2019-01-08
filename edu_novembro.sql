


NEW_BemPatrimonialImportacao_GetEntity_bpi_id


SELECT   top 10
  bpi_cadmat  
      ,bpi_origem  
      ,bpi_processo  
      ,bpi_item  
      ,bpi_qtde  
      ,bpi_valorUnitario  
      ,bpi_valorTotal  
      ,bpi_ne  
      ,bpi_nePorcent  
      ,bpi_documento  
      ,bpi_evento  
      ,bpi_naturazaDesp  
      ,bpi_dataEntrega  
      ,bpi_uo  
      ,bpi_uge  
      ,bpi_ue        ,bpi_cnpjCpfFornecedor  
      ,bpi_fornecedor  
      ,bpi_codFornecedor  
      ,bpi_insEstFornecedor  
      ,bpi_endFornecedor  
      ,bpi_bairroFornecedor  
      ,bpi_numFornecedor  
      ,bpi_compFornecedor  
      ,bpi_cepFornecedor  
      ,bpi_codCidadeFornecedor  
      ,bpi_cidadeFornecedor  
      ,bpi_ufFornecedor  
      ,bpi_contatoFornecedor  
      ,bpi_fone1Fornecedor  
      ,bpi_fone2Fornecedor  
      ,bpi_emailFornecedor  
      ,bpi_situacao  
      ,bpi_dataImportacao  
      ,bpi_observacao  
      ,bem_id  
      ,bpi_id  
    FROM   
  BensPatrimonialImportacao WITH (NOLock)  
 WHERE  
  bpi_id < 44905232