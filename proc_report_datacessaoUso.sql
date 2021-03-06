USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemPatrimonialCadastro_MontaRelatorioSP]    Script Date: 11/09/2018 14:50:37 ******/
-- alterado em setembro 2018
-- adicionado o campo bit_dataCessaoUso (data de cessao de uso)
-- por Rafael Portal /  Magna 
-- ********************************************************************************
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[NEW_BemPatrimonialCadastro_MontaRelatorioSP]
	@uniges_id int,
	@uniguarda_id int,
	@grp_id int,
	@data_inicial date,
	@data_final date,
	@reg_pat varchar(20),
	@dep_situacao int, -- Situação da dependencia para o bem: 1 = nao existente 2 = existente 0 = todas
	@status_bem int =null, --[Deprecated]
	@status_conservacao int,
	@loc_id int,
	@dep_id int,
	@blnDataIncorporacao int = - 1,
	@status_bem_list varchar(20) --=  null -- (Sera pasado uma lista 1,2,3,4,5 por ex...)
AS

BEGIN

if @blnDataIncorporacao = 0
begin

	With Fornec AS
	(
		SELECT
			FON.for_id,
			pes_nome AS for_nome
		FROM
			Fornecedor AS FON WITH(NOLOCK)
		INNER JOIN FornecedorPF AS PF WITH(NOLOCK)
			ON FON.for_id = PF.for_id
		INNER JOIN VW_FornecedorPessoa AS PES WITH(NOLOCK)
			ON PF.pes_id = PES.pes_id
		
		WHERE
			for_situacao <> 3
		
		UNION ALL
	
		-- Fornecedor PJ
		SELECT
			FON.for_id,
			ent_razaoSocial AS for_nome
		FROM
			Fornecedor AS FON WITH(NOLOCK)
		INNER JOIN FornecedorPJ AS PJ WITH(NOLOCK)
			ON FON.for_id = PJ.for_id
		INNER JOIN VW_FornecedorEntidade AS ENT WITH(NOLOCK)
			ON PJ.ent_id = ENT.ent_id
		
		WHERE
			for_situacao <> 3

	)

	select * from fornec

		SELECT 
			  bem.bem_id,
			  bi.bit_id,
			  uniGes.uni_id,
			  bi.bit_registroPat,
			  bem.bem_descricao,
			  bi.bit_dataCessaoUso,
			  uniGes.uni_nome as uniGestora, 	  
			  uniGuarda.uad_nome as uniGuarda,
			  uniGes.uni_codigoUGE as ugeCodigo,		
			  grp.grp_nome,	
			  (select grp_nome from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) as grp_nome_pai, --grp_Pai.grp_nome as grp_nome_pai,	  
			  bi.bit_referencia,
			  bem.bem_dataEntrada,
			  bi.bit_valorOrigem, 
			  bi.bit_valorLiquido, 
			  bi.bit_dataIncorporacao,
			  loc.loc_nome,
			  dep.dep_nome,
			  Fornec.for_nome as FornecedorNome,
			  ent.ent_razaoSocial,
			  aps.aps_apolice,
			  bi.bit_dataDepInicio,
			  bi.bit_vidaUtil,
			  fat.fat_nome,
			  bi.bit_cotas,
			  bi.bit_dataBaixa,
			  bi.bit_doctoBaixa,
			  stc.stc_decricao,	
			  biStatus =	case bi.bit_status
						when 1 then 'Utilizado'
						when 2 then 'Disponível'
						when 3 then 'Inativo'
						when 4 then 'Remessa'
						when 5 then 'Cancelado'
					else
						'Sem status definido'
					end
			  
			  ,bem.bem_cadmat,
			  bem.bem_origem,
			  bi.loc_id,
			  bi.dep_id,	  	
			  bem.bem_dataCriacao,
			  pco.cco_codigoDebito,
			  bit_obsCancelamento   = mc.moc_nome 
		
		FROM BemPatrimonial AS bem WITH(NoLock)
		     INNER JOIN BemItem AS bi with(nolock)
				ON bem.bem_id = bi.bem_id
			 INNER JOIN VW_UnidadeGestora AS uniGes with(nolock)
				ON uniGes.uni_id = bi.bit_uniGestora
			INNER JOIN VW_UnidadeAdministrativa as uniGuarda with(noLock)
				ON uniGuarda.uni_id = bi.bit_uniGuarda
			INNER JOIN Fornec 
				ON Fornec.for_id = bem.for_id
			 INNER JOIN GrupoBens AS grp with(nolock)
				ON bem.grp_id = grp.grp_id		 
			 INNER JOIN Localidade AS loc with(nolock)
				ON bi.loc_id = loc.loc_id
			 LEFT JOIN Dependencia as dep with(nolock)
				ON dep.loc_id = loc.loc_id
				and bi.dep_id = dep.dep_id
			 LEFT JOIN ApoliceSeguro AS aps with(nolock)
				ON bi.aps_id = aps.aps_id
			 LEFT JOIN Seguradora AS seg with(nolock)
				ON seg.seg_id = aps.seg_id
			 LEFT JOIN VW_SeguradoraEntidade AS ent with(nolock)
				ON seg.ent_id = ent.ent_id		 
			 LEFT JOIN StatusConservacao AS stc with(nolock)
				ON bi.stc_id = stc.stc_id
			 LEFT JOIN FatorDepreciacao AS fat with(nolock)
				ON bi.fat_id = fat.fat_id 
			 LEFT JOIN ParametroContabil AS pco with(nolock)
				ON pco.grp_id = (select grp_id from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) 
				and tpm_id = 23 and pco_situacao = 1
			inner join (SELECT * FROM dbo.fnSplit(@status_bem_list, ',') ) as statusList
				on statusList.item = bi.bit_status
			left join MotivoCancelamento mc with(nolock)
				on mc.moc_id = bi.moc_id 
		WHERE
			((@uniges_id IS NULL) OR (bi.bit_uniGestora = @uniges_id))
			AND ((@uniguarda_id IS NULL) OR (bi.bit_uniGuarda = @uniguarda_id))
			AND ((@loc_id IS NULL) OR (bi.loc_id = @loc_id))
			AND ((@dep_id IS NULL) OR (bi.dep_id = @dep_id))
			AND (@data_inicial IS NULL OR bem.bem_dataCriacao >= @data_inicial) 
			AND (@data_final IS NULL OR bem.bem_dataCriacao  <= @data_final)
			AND	((@reg_pat IS NULL) OR (bi.bit_registroPat = @reg_pat))
			AND (@status_conservacao IS NULL OR bi.stc_id = @status_conservacao)
			AND ((bi.dep_id IS NULL AND  @dep_situacao = 1) 
			       OR (bi.dep_id is not NULL and @dep_situacao = 2) 
			       OR (@dep_situacao IS NULL))	
			AND uniGes.uni_situacao <> 3
			AND ((@grp_id IS NULL) OR bem.grp_id in (select grp_id from FN_GetGrupoHierarquia (@grp_id)))	
			and bi.bit_dataIncorporacao is null
		ORDER BY uniGestora
	end

else if (@blnDataIncorporacao = 1)
	
	begin

	With Fornec AS
	(
		SELECT
			FON.for_id,
			pes_nome AS for_nome
		FROM
			Fornecedor AS FON WITH(NOLOCK)
		INNER JOIN FornecedorPF AS PF WITH(NOLOCK)
			ON FON.for_id = PF.for_id
		INNER JOIN VW_FornecedorPessoa AS PES WITH(NOLOCK)
			ON PF.pes_id = PES.pes_id
		
		WHERE
			for_situacao <> 3
		
		UNION ALL
	
		-- Fornecedor PJ
		SELECT
			FON.for_id,
			ent_razaoSocial AS for_nome
		FROM
			Fornecedor AS FON WITH(NOLOCK)
		INNER JOIN FornecedorPJ AS PJ WITH(NOLOCK)
			ON FON.for_id = PJ.for_id
		INNER JOIN VW_FornecedorEntidade AS ENT WITH(NOLOCK)
			ON PJ.ent_id = ENT.ent_id
		
		WHERE
			for_situacao <> 3

	)


		SELECT 
			  bem.bem_id,
			  bi.bit_id,
			  uniGes.uni_id,
			  bi.bit_registroPat,
			  bem.bem_descricao,
			  uniGes.uni_nome as uniGestora, 	  
			  uniGuarda.uad_nome as uniGuarda,
			  uniGes.uni_codigoUGE as ugeCodigo,		
			  grp.grp_nome,	
			  (select grp_nome from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) as grp_nome_pai, --grp_Pai.grp_nome as grp_nome_pai,	  
			  bi.bit_referencia,
			  bem.bem_dataEntrada,
			  bi.bit_valorOrigem, 
			  bi.bit_valorLiquido, 
			  bi.bit_dataIncorporacao,
			  loc.loc_nome,
			  dep.dep_nome,
			  Fornec.for_nome as FornecedorNome,
			  ent.ent_razaoSocial,
			  aps.aps_apolice,
			  bi.bit_dataDepInicio,
			  bi.bit_vidaUtil,
			  fat.fat_nome,
			  bi.bit_cotas,
			  bi.bit_dataBaixa,
			  bi.bit_doctoBaixa,
			  stc.stc_decricao,		  
			  biStatus =	case bi.bit_status
						when 1 then 'Utilizado'
						when 2 then 'Disponível'
						when 3 then 'Inativo'
						when 4 then 'Remessa'
						when 5 then 'Cancelado'
					else
						'Sem status definido'
					end
			  
			  ,bem.bem_cadmat,
			  bem.bem_origem,
			  bi.loc_id,
			  bi.dep_id,	  	
			  bem.bem_dataCriacao,
			  pco.cco_codigoDebito,
			  bit_obsCancelamento   = mc.moc_nome 		   
		
		FROM BemPatrimonial AS bem WITH(NoLock)
		     INNER JOIN BemItem AS bi with(nolock)
				ON bem.bem_id = bi.bem_id
			 INNER JOIN VW_UnidadeGestora AS uniGes with(nolock)
				ON uniGes.uni_id = bi.bit_uniGestora
			INNER JOIN VW_UnidadeAdministrativa as uniGuarda with(noLock)
				ON uniGuarda.uni_id = bi.bit_uniGuarda
			INNER JOIN Fornec 
				ON Fornec.for_id = bem.for_id
			 INNER JOIN GrupoBens AS grp with(nolock)
				ON bem.grp_id = grp.grp_id		 
			 INNER JOIN Localidade AS loc with(nolock)
				ON bi.loc_id = loc.loc_id
			 LEFT JOIN Dependencia as dep with(nolock)
				ON dep.loc_id = loc.loc_id
				and bi.dep_id = dep.dep_id
			 LEFT JOIN ApoliceSeguro AS aps with(nolock)
				ON bi.aps_id = aps.aps_id
			 LEFT JOIN Seguradora AS seg with(nolock)
				ON seg.seg_id = aps.seg_id
			 LEFT JOIN VW_SeguradoraEntidade AS ent with(nolock)
				ON seg.ent_id = ent.ent_id		 
			 LEFT JOIN StatusConservacao AS stc with(nolock)
				ON bi.stc_id = stc.stc_id
			 LEFT JOIN FatorDepreciacao AS fat with(nolock)
				ON bi.fat_id = fat.fat_id 
			 LEFT JOIN ParametroContabil AS pco with(nolock)
				ON pco.grp_id = (select grp_id from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) 
				and tpm_id = 23 and pco_situacao = 1
			inner join (SELECT * FROM dbo.fnSplit(@status_bem_list, ',') ) as statusList
				on statusList.item = bi.bit_status

			left join MotivoCancelamento mc with(nolock)
				on mc.moc_id = bi.moc_id 
		WHERE
			((@uniges_id IS NULL) OR (bi.bit_uniGestora = @uniges_id))
			AND ((@uniguarda_id IS NULL) OR (bi.bit_uniGuarda = @uniguarda_id))
			AND ((@loc_id IS NULL) OR (bi.loc_id = @loc_id))
			AND ((@dep_id IS NULL) OR (bi.dep_id = @dep_id))
			AND (@data_inicial IS NULL OR bem.bem_dataCriacao >= @data_inicial) 
			AND (@data_final IS NULL OR bem.bem_dataCriacao  <= @data_final)
			AND	((@reg_pat IS NULL) OR (bi.bit_registroPat = @reg_pat))
			AND (@status_conservacao IS NULL OR bi.stc_id = @status_conservacao)
			AND ((bi.dep_id IS NULL AND  @dep_situacao = 1) 
			       OR (bi.dep_id is not NULL and @dep_situacao = 2) 
			       OR (@dep_situacao IS NULL))	
			AND uniGes.uni_situacao <> 3
			AND ((@grp_id IS NULL) OR bem.grp_id in (select grp_id from FN_GetGrupoHierarquia (@grp_id)))
			and bi.bit_dataIncorporacao is not null	
		ORDER BY uniGestora
	end

else -- if (@blnDataIncorporacao = 0) // else if (@blnDataIncorporacao = 1)

	begin
		
		if @grp_id is null 
		
		begin
		--print 'aqui';
		
			With Fornec AS
			(
				SELECT
					FON.for_id,
					pes_nome AS for_nome
				FROM
					Fornecedor AS FON WITH(NOLOCK)
				INNER JOIN FornecedorPF AS PF WITH(NOLOCK)
					ON FON.for_id = PF.for_id
				INNER JOIN VW_FornecedorPessoa AS PES WITH(NOLOCK)
					ON PF.pes_id = PES.pes_id
		
				WHERE
					for_situacao <> 3
		
				UNION ALL
	
				-- Fornecedor PJ
				SELECT
					FON.for_id,
					ent_razaoSocial AS for_nome
				FROM
					Fornecedor AS FON WITH(NOLOCK)
				INNER JOIN FornecedorPJ AS PJ WITH(NOLOCK)
					ON FON.for_id = PJ.for_id
				INNER JOIN VW_FornecedorEntidade AS ENT WITH(NOLOCK)
					ON PJ.ent_id = ENT.ent_id
		
				WHERE
					for_situacao <> 3

			)


				SELECT 
					  bem.bem_id,
					  bi.bit_id,
					  uniGes.uni_id,
					  bi.bit_registroPat,
					  bem.bem_descricao,
					  uniGes.uni_nome as uniGestora, 	  
					  uniGuarda.uad_nome as uniGuarda,
					  uniGes.uni_codigoUGE as ugeCodigo,		
					  grp.grp_nome,	
					  (select grp_nome from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) as grp_nome_pai, --grp_Pai.grp_nome as grp_nome_pai,	  
					  bi.bit_referencia,
					  bem.bem_dataEntrada,
					  bi.bit_valorOrigem, 
					  bi.bit_valorLiquido, 
					  bi.bit_dataIncorporacao,
					  loc.loc_nome,
					  dep.dep_nome,
					  Fornec.for_nome as FornecedorNome,
					  ent.ent_razaoSocial,
					  aps.aps_apolice,
					  bi.bit_dataDepInicio,
					  bi.bit_vidaUtil,
					  fat.fat_nome,
					  bi.bit_cotas,
					  bi.bit_dataBaixa,
					  bi.bit_doctoBaixa,
					  stc.stc_decricao,		  
					  biStatus =	case bi.bit_status
								when 1 then 'Utilizado'
								when 2 then 'Disponível'
								when 3 then 'Inativo'
								when 4 then 'Remessa'
								when 5 then 'Cancelado'
							else
								'Sem status definido'
							end
			  
					  ,bem.bem_cadmat,
					  bem.bem_origem,
					  bi.loc_id,
					  bi.dep_id,	  	
					  bem.bem_dataCriacao,
					  pco.cco_codigoDebito,
				          bit_obsCancelamento   = mc.moc_nome 		   
		
				FROM BemPatrimonial AS bem WITH(NoLock)
				     INNER JOIN BemItem AS bi with(nolock)
						ON bem.bem_id = bi.bem_id
					 INNER JOIN VW_UnidadeGestora AS uniGes with(nolock)
						ON uniGes.uni_id = bi.bit_uniGestora
					INNER JOIN VW_UnidadeAdministrativa as uniGuarda with(noLock)
						ON uniGuarda.uni_id = bi.bit_uniGuarda
					INNER JOIN Fornec 
						ON Fornec.for_id = bem.for_id
					 INNER JOIN GrupoBens AS grp with(nolock)
						ON bem.grp_id = grp.grp_id		 
					 INNER JOIN Localidade AS loc with(nolock)
						ON bi.loc_id = loc.loc_id
					 LEFT JOIN Dependencia as dep with(nolock)
						ON dep.loc_id = loc.loc_id
						and bi.dep_id = dep.dep_id
					 LEFT JOIN ApoliceSeguro AS aps with(nolock)
						ON bi.aps_id = aps.aps_id
					 LEFT JOIN Seguradora AS seg with(nolock)
						ON seg.seg_id = aps.seg_id
					 LEFT JOIN VW_SeguradoraEntidade AS ent with(nolock)
						ON seg.ent_id = ent.ent_id		 
					 LEFT JOIN StatusConservacao AS stc with(nolock)
						ON bi.stc_id = stc.stc_id
					 LEFT JOIN FatorDepreciacao AS fat with(nolock)
						ON bi.fat_id = fat.fat_id 
					 LEFT JOIN ParametroContabil AS pco with(nolock)
						ON pco.grp_id = (select grp_id from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) 
						and tpm_id = 23 and pco_situacao = 1
					
					inner join (SELECT * FROM dbo.fnSplit(@status_bem_list, ',') ) as statusList
						on statusList.item = bi.bit_status

					left join MotivoCancelamento mc with(nolock)
						on mc.moc_id = bi.moc_id 
				WHERE
					((@uniges_id IS NULL) OR (bi.bit_uniGestora = @uniges_id))
					AND ((@uniguarda_id IS NULL) OR (bi.bit_uniGuarda = @uniguarda_id))
					AND ((@loc_id IS NULL) OR (bi.loc_id = @loc_id))
					AND ((@dep_id IS NULL) OR (bi.dep_id = @dep_id))
					AND ((@grp_id IS NULL) OR(grp.grp_id = @grp_id) OR (grp.grp_idPai = @grp_id))		
					AND (@data_inicial IS NULL OR bem.bem_dataCriacao >= @data_inicial) 
					AND (@data_final IS NULL OR bem.bem_dataCriacao  <= @data_final)
					AND	((@reg_pat IS NULL) OR (bi.bit_registroPat = @reg_pat))
					AND (@status_conservacao IS NULL OR bi.stc_id = @status_conservacao)
					AND ((bi.dep_id IS NULL AND  @dep_situacao = 1) 
					       OR (bi.dep_id is not NULL and @dep_situacao = 2) 
					       OR (@dep_situacao IS NULL))	
					AND uniGes.uni_situacao <> 3
				ORDER BY uniGestora

		end
	
	else 
	-- if (@blnDataIncorporacao = 0) // else if (@blnDataIncorporacao = 1)
	-- if @grp_id is not null 
	
		begin
			With Fornec AS
			(
				SELECT
					FON.for_id,
					pes_nome AS for_nome
				FROM
					Fornecedor AS FON WITH(NOLOCK)
				INNER JOIN FornecedorPF AS PF WITH(NOLOCK)
					ON FON.for_id = PF.for_id
				INNER JOIN VW_FornecedorPessoa AS PES WITH(NOLOCK)
					ON PF.pes_id = PES.pes_id
		
				WHERE
					for_situacao <> 3
		
				UNION ALL
	
				-- Fornecedor PJ
				SELECT
					FON.for_id,
					ent_razaoSocial AS for_nome
				FROM
					Fornecedor AS FON WITH(NOLOCK)
				INNER JOIN FornecedorPJ AS PJ WITH(NOLOCK)
					ON FON.for_id = PJ.for_id
				INNER JOIN VW_FornecedorEntidade AS ENT WITH(NOLOCK)
					ON PJ.ent_id = ENT.ent_id
		
				WHERE
					for_situacao <> 3

			)


				SELECT 
					  bem.bem_id,
					  bi.bit_id,
					  uniGes.uni_id,
					  bi.bit_registroPat,
					  bem.bem_descricao,
					  uniGes.uni_nome as uniGestora, 	  
					  uniGuarda.uad_nome as uniGuarda,
					  uniGes.uni_codigoUGE as ugeCodigo,		
					  grp.grp_nome,	
					  (select grp_nome from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) as grp_nome_pai, --grp_Pai.grp_nome as grp_nome_pai,	  
					  bi.bit_referencia,
					  bem.bem_dataEntrada,
					  bi.bit_valorOrigem, 
					  bi.bit_valorLiquido, 
					  bi.bit_dataIncorporacao,
					  loc.loc_nome,
					  dep.dep_nome,
					  Fornec.for_nome as FornecedorNome,
					  ent.ent_razaoSocial,
					  aps.aps_apolice,
					  bi.bit_dataDepInicio,
					  bi.bit_vidaUtil,
					  fat.fat_nome,
					  bi.bit_cotas,
					  bi.bit_dataBaixa,
					  bi.bit_doctoBaixa,
					  stc.stc_decricao,		  
					  biStatus =	case bi.bit_status
								when 1 then 'Utilizado'
								when 2 then 'Disponível'
								when 3 then 'Inativo'
								when 4 then 'Remessa'
								when 5 then 'Cancelado'
							else
								'Sem status definido'
							end
			  
					  ,bem.bem_cadmat,
					  bem.bem_origem,
					  bi.loc_id,
					  bi.dep_id,	  	
					  bem.bem_dataCriacao,
					  pco.cco_codigoDebito,
					  bit_obsCancelamento   = mc.moc_nome 		   
		
				FROM BemPatrimonial AS bem WITH(NoLock)
				     INNER JOIN BemItem AS bi with(nolock)
						ON bem.bem_id = bi.bem_id
					 INNER JOIN VW_UnidadeGestora AS uniGes with(nolock)
						ON uniGes.uni_id = bi.bit_uniGestora
					INNER JOIN VW_UnidadeAdministrativa as uniGuarda with(noLock)
						ON uniGuarda.uni_id = bi.bit_uniGuarda
					INNER JOIN Fornec 
						ON Fornec.for_id = bem.for_id
					 INNER JOIN GrupoBens AS grp with(nolock)
						ON bem.grp_id = grp.grp_id		 
					 INNER JOIN Localidade AS loc with(nolock)
						ON bi.loc_id = loc.loc_id
					 LEFT JOIN Dependencia as dep with(nolock)
						ON dep.loc_id = loc.loc_id
						and bi.dep_id = dep.dep_id
					 LEFT JOIN ApoliceSeguro AS aps with(nolock)
						ON bi.aps_id = aps.aps_id
					 LEFT JOIN Seguradora AS seg with(nolock)
						ON seg.seg_id = aps.seg_id
					 LEFT JOIN VW_SeguradoraEntidade AS ent with(nolock)
						ON seg.ent_id = ent.ent_id		 
					 LEFT JOIN StatusConservacao AS stc with(nolock)
						ON bi.stc_id = stc.stc_id
					 LEFT JOIN FatorDepreciacao AS fat with(nolock)
						ON bi.fat_id = fat.fat_id 
					 LEFT JOIN ParametroContabil AS pco with(nolock)
						on pco.grp_id = (select grp_id from [dbo].[FN_GetGrupoBensSuperioresPai] (bem.grp_id)) 
						and tpm_id = 23 and pco_situacao = 1
					
					inner join (SELECT * FROM dbo.fnSplit(@status_bem_list, ',') ) as statusList
						on statusList.item = bi.bit_status

					left join MotivoCancelamento mc with(nolock)
						on mc.moc_id = bi.moc_id 
				WHERE
					((@uniges_id IS NULL) OR (bi.bit_uniGestora = @uniges_id))
					AND ((@uniguarda_id IS NULL) OR (bi.bit_uniGuarda = @uniguarda_id))
					AND ((@loc_id IS NULL) OR (bi.loc_id = @loc_id))
					AND ((@dep_id IS NULL) OR (bi.dep_id = @dep_id))
					AND (@data_inicial IS NULL OR bem.bem_dataCriacao >= @data_inicial) 
					AND (@data_final IS NULL OR bem.bem_dataCriacao  <= @data_final)
					AND	((@reg_pat IS NULL) OR (bi.bit_registroPat = @reg_pat))
					AND (@status_conservacao IS NULL OR bi.stc_id = @status_conservacao)
					AND ((bi.dep_id IS NULL AND  @dep_situacao = 1) 
					       OR (bi.dep_id is not NULL and @dep_situacao = 2) 
					       OR (@dep_situacao IS NULL))	
					AND uniGes.uni_situacao <> 3
					AND ((@grp_id IS NULL) OR bem.grp_id in (select grp_id from FN_GetGrupoHierarquia (@grp_id)))
				ORDER BY uniGestora
		end

		
	end

end		


