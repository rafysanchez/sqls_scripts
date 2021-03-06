/****** Script for SelectTopNRows command from SSMS  ******/

	USE [ConPat]

	select * from BemItem where bit_registroPat = '2016.349.0004681' ;

select * from  [dbo].[BemPatrimonial] where bem_id = 1219713 ;

	SELECT   * from BemItem
	where bit_situacao = 1 
	and bit_status = 1
	and stc_id in (1,2) 
	and bit_registroPat is not null
	and bit_uniGuarda = 1760  ;

	SELECT TOP 1000 
     *
	  FROM [ConPat].[dbo].[MovimentacaoBem]
	  where  mov_data >= '2018-09-01'
	  and mov_data <= '2018-09-30'
	  and mov_situacao  <> 3
	  and bem_id = 1821149 ; -- 811

	  SELECT TOP 5000 *  FROM [ConPat].[dbo].[MovimentacaoBem] where tpm_id = 18  and uni_id = 109 and mov_unidadeOrigem = 4867 order by bem_id  ;
	  SELECT TOP 1000 *  FROM [ConPat].[dbo].[MovimentacaoBem] where uni_id = 109 and bem_id = 811;
	  SELECT TOP 1000 *  FROM [ConPat].[dbo].[MovimentacaoBem] WHERE bem_id = 2448 and bit_id = 93;
	  SELECT * FROM [ConPat].[dbo].[MovimentacaoBem] WHERE  uni_id = 109 AND tpm_id=18 ;
	  
	  -- DELETE FROM [ConPat].[dbo].[MovimentacaoBem] WHERE  uni_id = 109 AND tpm_id=18 ; -- limpa e habilita movimentação

	  -- DELETE FROM [ConPat].[dbo].[MovimentacaoBem] WHERE uni_id = 1760  ;

	  -- DELETE FROM [ConPat].[dbo].[MovimentacaoBem] WHERE uni_id = 4867  ;

	  	select 
		bi.bem_id
		, bi.bit_id
		, bi.bit_dataIncorporacao
		, bi.bit_uniGuarda
		, bi.bit_uniGestora
		, bi.bit_registroPat 
		, bi.bit_valorLiquido 
		, bp.bem_legado 
		, bp.grp_id 	 
	from BemItem bi WITH(NoLock)
	INNER JOIN
		 BemPatrimonial bp WITH(NoLock)
		ON bp.bem_id = bi.bem_id 
		-- and bp.bem_legado = 0
	where 

		bi.bit_situacao = 1
		and bi.bit_status = 1
		and bi.bit_uniGuarda = 4867; 



	SELECT TOP 1000 *
	FROM [ConPat].[dbo].[TipoMovimentacao] ;

	USE [ConPat]
	GO

	DECLARE	@return_value int

	EXEC	@return_value = [dbo].[NEW_BemItem_SelectBy_CessaoAutomatica]
			@dtIni = N'2018-09-01',
			@dtFim = N'2018-09-30',
			@uni_id = 1760 -- 1760 4867

	SELECT	'Return Value' = @return_value

	GO

	select getdate();

	--**************************************************


			DECLARE @dtIni datetime = N'2018-09-01',
			@dtFim datetime = N'2018-09-30',
			@uni_id int = 1760 ;

						select 
							bem_id,	mb.mov_data ,  mb.tpm_id 
							from MovimentacaoBem as mb 
							inner join 
								TipoMovimentacao tm
								on tm.tpm_id = mb.tpm_id 
								-- and tm.tpm_operacao = 7
							where 
								bem_id = 811  and bit_id = 90
								and mb.mov_data >= @dtIni 
								and mb.mov_data < @dtFim
								and mb.mov_situacao  <> 3

--*****************************************************************************************
						
							select 
								mb.mov_data , bem_id ,  bit_id , mb.tpm_id
							from MovimentacaoBem as mb 
							inner join 
								TipoMovimentacao tm
								on tm.tpm_id = mb.tpm_id 
							where 
								mb.bem_id = 811  and mb.bit_id = 90
								and mb.tpm_id = 18 
								and mb.mov_situacao  <> 3


--*****************************************************************************************


-- http://localhost:4539/AreaAdm/Movimentacao/periodomanutencao.aspx

select * from VW_UnidadeGestora ;


NEW_BemItem_SelectBy_bem_id
bem_id = 1821149
uni_id = 5
bit_uniGestora = 5
bit_status = -1


NEW_MovimentacaoBem_SelectBy_Operacao
bem_id = 1821149
bit_id = 5794178
tpm_operacao = 4

select * from TipoMovimentacao ;


SELECT top 10 *, tpm.tpm_nome FROM 	MovimentacaoBem AS MOV
INNER JOIN TipoMovimentacao AS TPM WITH(NOLOCK)
ON MOV.tpm_id = TPM.tpm_id
where bem_id = 1821149 


