USE [SAGE_Educacao]
GO
/****** Object:  StoredProcedure [dbo].[ProducaoDiaria]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoDiaria                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Diária                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoDiaria NULL, NULL, NULL, '20160704', NULL
Create procedure [dbo].[ProducaoDiaria]
 
@Ano int = NULL,
@Mes int = NULL,
@RegiaoTreinamento int = NULL,
@DataInicio datetime = null,
@DataFim datetime = null
as 

--IF(@Ano IS NULL)
-- SET @Ano = YEAR(GETDATE())

--IF(@Mes IS NULL)
-- SET @Mes = MONTH(GETDATE())

--set @Ano = YEAR(GETDATE())
--set @Mes = MONTH(GETDATE())

-- 1. Selecão das Turmas

-- exec dbo.[Spr_SageEducacao_Lista_ProducaoDiaria] 2016, 9, 1

--Drop table #Temp_20160918_ProducaoDiaria
  
select 
b.IdTurma,
d.IdTurmaOferta, 
a.Titulo, 
convert(varchar(100), '') as TipoTurma, 
CodigoTurmaOferta as CodOferta, 
b.DataInicio, b.DataFim, 
g.Descricao as RegiaoTreinamento,
b.IdRegiaoTreinamento,
case when b.DisponivelParaVenda = 1 then 'Sim' else 'Não' end as DisponivelVenda,
h.Descricao as StatusTurma,
0 as Meta,
b.QtdeMinimaInscricao as Minimo,
b.Capacidade as Capacidade,
0 as Ativo,
0 as Passivo,
0 as Cortesia,
0 as Acumulado,
Convert(money,0) as VlrReceita
into #Temp_20160918_ProducaoDiaria
  From Curso as a 
  Inner Join Turma as b on (b.IdCurso = a.IdCurso) 
  Inner Join Formato as c on (c.IdFormato = b.IdFormato)
  Inner Join TurmaOferta as d on (d.IdTurma = b.IdTurma) 
  inner join RegiaoTreinamento as e on (e.IdRegiaoTreinamento = b.IdRegiaoTreinamento)
  inner join Municipio as f on (f.IdMunicipio = e.IdMunicipio)
  inner join Estado as g on (g.IdEstado = f.IdEstado)
  inner join Status as h on (h.IdStatus = b.IdStatus)
where (YEAR(b.DataInicio) = @Ano OR @Ano  IS NULL)
and (MONTH(b.DataInicio) = @Mes OR @Mes  IS NULL)
AND (e.IdRegiaoTreinamento = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
and  b.DataInicio between ISNULL(@DataInicio, b.DataInicio)  and ISNULL(@DataFim, b.DataInicio)

-- > '2016-09-15'

--and  b.DataInicio > '2016-09-15'


-- 2. Preenchendo o Tipo de Turma

--drop table #Temp_20160918_TipoTurma

select * into #Temp_20160918_TipoTurma from TipoTurma

declare @MinimoTipoTurma int

select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma

while exists (select * from #Temp_20160918_TipoTurma)
begin 

update c set TipoTurma = TipoTurma + case when TipoTurma > '' then ' , ' else '' end + a.Descricao 
from TipoTurma as a
inner join TurmaTipoTurma as b on (b.IdTipoTurma = a.IdTipoTurma)
inner join #Temp_20160918_ProducaoDiaria as c on (c.IdTurma = b.IdTurma)
where a.IdTipoTurma = @MinimoTipoTurma
delete #Temp_20160918_TipoTurma where IdTipoTurma = @MinimoTipoTurma
select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma

end 


-- 3. Preenchendo a quantidade e o valor da Receita

update A set Ativo = QtdAtivo,
             Passivo = QtdPassivo,
             Cortesia = QtdCortesia,
Acumulado = QtdAcumulado,
VlrReceita = b.VlrReceita
from #Temp_20160918_ProducaoDiaria as a
inner join (select a.IdTurmaOferta, 
sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda < 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdAtivo,
sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda > 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdPassivo,
sum(case when c.IdTipoSituacao IN ( 1, 3)  and isnull(c.Valor, 0) = 0 then 1 else 0 end )as QtdCortesia,
sum(1) as QtdAcumulado,
SUM( c.Valor) as VlrReceita
from #Temp_20160918_ProducaoDiaria as a
inner join PedidoVendaItem as b on (b.IdTurmaOferta = a.IdTurmaOferta)
inner join PedidoVendaParticipante as c on (c.IdPedidoVendaItem = b.IdPedidoVendaItem)
left outer join TipoSituacao as d on (d.IdTipoSituacao = c.IdTipoSituacao)
inner join PedidoVenda as e on (e.IdPedidoVenda = b.IdPedidoVenda)
group by a.IdTurmaOferta, c.IdTipoSituacao) as b on (b.IdTurmaOferta = a.IdTurmaOferta)

select *
from #Temp_20160918_ProducaoDiaria as a
order by RegiaoTreinamento


GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_CG_PedidoVenda]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_PedidoVenda                                                      *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/
CREATE Proc [dbo].[SP_SageEducacao_CG_PedidoVenda] 
@FaturaID Bigint
As

--Use SAGE_Educacao
Declare @PedidoVenda Bigint
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_PedidoVenda')        
drop table ##Temp_SageEducacao_PedidoVenda  
Select 
b.IdCliente,
1 as IdTipoSituacao, -- Faturado
a.NR_Pedido,
a.Numero,
c.IdVendedor, 
1 as Quantidade, -- Quantidade
Convert(Bigint,d.bn_Order_Forma_id_ato_fk) as FormaPagto,
d.Order_Date,
a.Valor,
1 as IdCanalVendas -- CanalVenda 
Into ##Temp_SageEducacao_PedidoVenda
From       CRM_ED..Fatura  as a 
Inner Join SAGE_Educacao..Cliente as b on (Convert(Bigint,a.Cliente_id) = b.CodigoCliente)
Inner Join SAGE_Educacao..Vendedor as c on (a.int_Fatura_VendId = c.CodigoVendedor)
Inner Join CRM_ED..order_ as d on (a.nr_Pedido = d.Order_Number)
Where numero = @FaturaID
Insert into PedidoVenda( 
IdCliente,
IdTipoSituacao,
IdVendedor,
Quantidade,
FormaPagto,
DataPedido,
Valor,
IdCanalVendas,
CodigoPedidoVenda)
Select
IdCliente,
IdTipoSituacao,
IdVendedor, 
Quantidade, 
FormaPagto,
Order_Date,
Valor,
IdCanalVendas,
Nr_Pedido 
From ##Temp_SageEducacao_PedidoVenda

Select @PedidoVenda = @@IDENTITY 


If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_PedidoVendaItem')        
drop table ##Temp_SageEducacao_PedidoVendaItem  
Select 
c.IdTurmaOferta,
@PedidoVenda as IdPedidoVenda,
1 as IdTipoSituacao,
b.int_FatItens_VlrProd as Valor,
b.int_FatItens_VlrProd as ValorBase,
a.NR_Pedido as NR_Pedido,
b.int_FatItens_ItemIdUnisys as IdItemUnisys
Into ##Temp_SageEducacao_PedidoVendaItem
From       CRM_ED..Fatura  as a 
Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)
Inner Join SAGE_Educacao..TurmaOferta as c on (b.str_FatItens_CodProd COLLATE Latin1_General_CI_AS = CodigoTurmaOferta)
Where a.numero = @FaturaID


Insert into PedidoVendaItem(
IdTurmaOferta,
IdPedidoVenda,
IdTipoSituacao,
Valor,
ValorBase,
CodigoPedidoVendaItem) 
    Select 
IdTurmaOferta,
IdPedidoVenda,
IdTipoSituacao,
Valor,
ValorBase, 
IdItemUnisys 
From ##Temp_SageEducacao_PedidoVendaItem


/*
Select *
from PedidoVendaItem


delete PedidoVendaItem where idPedidovendaitem in (2,3,4)

Select *
from PedidoVenda

delete PedidoVenda where idPedidovenda not in (5)

Alter table PedidoVendaItem
Add IdUnisys Bigint null




*/

GO
/****** Object:  StoredProcedure [dbo].[SP_SageEducacao_InsereCurso]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: rafael sanchez
-- Create date: january 2017
-- Description: sage education system support
-- =============================================
CREATE PROCEDURE [dbo].[SP_SageEducacao_InsereCurso]
@CodigoCurso varchar(15), 
@IdTipoCurso int = 1, 
@IdPeriodicidade int = 1, 
@Titulo varchar(256),  
@Subtitulo varchar(max), 
@Vigente bit, 
@PontuacaoCRC varchar(100) = null, 
@Modular bit 
as
BEGIN
SET NOCOUNT ON;

    
INSERT INTO [dbo].[Curso]
           ([CodigoCurso]
           ,[IdTipoCurso]
           ,[IdPeriodicidade]
           ,[Titulo]
           ,[Subtitulo]
           ,[Vigente]
           ,[PontuacaoCRC]
           ,[Modular]
          )
     VALUES
           (
   @CodigoCurso 
           ,@IdTipoCurso 
           ,@IdPeriodicidade
           ,@Titulo 
           ,@Subtitulo
           ,@Vigente
           ,@PontuacaoCRC
           ,@Modular
           
   )
SELECT @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM
*  OBS:  Lista pedidosFaturas Integrados.
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM]  
@Id BigInt

As


Update PedidosFaturasCRM
Set DtIntegracao = Getdate(),
Status = 1  
Where IdPedidosFaturasCRM = @Id 
 
/*
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_AtualizaStatus_PedidosFaturasCRM] TO usr_infraprd

*/



GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_AtualizaStatus_TurmaOfertra
*  OBS:  Atualiza Turmas/Ofertas importadas
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra]  
@IdTurma BigInt

As


Update Turma
Set DataIntegracao = GETDATE()
Where IdTurma = @IdTurma

 
/*
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_AtualizaStatus_TurmaOfertra] TO app_educacao

*/



GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Cliente]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SP_SageEducacao_CG_Cliente                                                          *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados da Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_Cliente] 
@FaturaID Bigint
As

--Use SAGE_Educacao
Declare @IdCliente Bigint
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Clientes')        
drop table ##Temp_SageEducacao_Clientes  
Select 
a.NR_Pedido,
a.Numero,
CONVERT(Bigint,b.company_id) as CompanyID,
b.Razao_Social,
b.Company_Name,
b.Tipo_Pessoa,
b.CNPJ,
b.CNPJ_seq,
b.CNPJ_dig,
b.Insc_Estadual  
Into ##Temp_SageEducacao_Clientes
From       CRM_ED..Fatura  as a
Inner Join CRM_ED..Company as b on (a.cliente_id = b.company_id)
Where Numero = @FaturaID
Delete b
from Cliente as a
Inner Join ##Temp_SageEducacao_Clientes as b on (a.CodigoCliente = b.CompanyID)
Insert into Cliente
(CodigoCliente)
Select CompanyID 
From ##Temp_SageEducacao_Clientes
Select @IdCliente = @@IDENTITY 
If Exists(Select 1 from ##Temp_SageEducacao_Clientes Where Tipo_Pessoa = 'FISICA')
Begin
Insert into ClientePF( 
IdCliente,
Nome,
Apelido,
CPF)
Select
@IdCliente, 
Razao_Social,
Company_Name,
CNPJ + CNPJ_dig 
From ##Temp_SageEducacao_Clientes
End
Else
    Begin    
Insert into ClientePJ( 
RazaoSocial,
NomeFantasia,
Cnpj,
InscricaoEstadual,
IdCliente)
Select
Razao_Social,
Company_Name,
CNPJ + CNPJ_seq + CNPJ_dig,
Insc_Estadual,
@IdCliente 
From ##Temp_SageEducacao_Clientes
End
/*
use Sage_educacao
exec SPR_SageEducacao_CG_Cliente 73279751
Select * from clientePJ
Select * from clientePF
*/

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Participantes]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_Participantes
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_Participantes] 
@FaturaID Bigint
As

--Use SAGE_Educacao
Declare @IdParticipante Bigint
Declare @NrPedidoLoja Bigint
Set @IdParticipante = 0
Set @NrPedidoLoja = 0
-- (Inicio)Verifica se o pedido foi feito pela loja virtual para fazer o tratamento dos participantes.
Select @NrPedidoLoja = ISNULL(b.int_order_ikeda,0)
From CRM_ED..Fatura  as a 
Inner Join CRM_ED..order_ as b on (a.nr_Pedido = b.Order_Number)
where a.Numero = @FaturaID
if (@NrPedidoLoja <> 0)
Begin
insert into CRM_ED..tb_ParticipanteCursos (
--IdParticipanteCursos, -- identity
TAB_PedidaoItem_Id,
Order__Id,
Order_Detail_Id,
IdItemUnisys,
IdProduto,
QtdParticipante,
NomeParticipante,
CPFParticipante,
EmailParticipante,
dddFixoParticipante,
FoneFixoParticipante,
dddCelularParticipante,
FoneCelularParticipante,
CargoParticipante,
DepartamentoParticipante,
statusParticipante,
IdSubstituto,
IdContact,
IdCliente,
int_tab_pedidaoItem_id,
dat_alt_participante) 
Select 
TAB_PedidaoItem_Id as TAB_PedidaoItem_Id,
d.Order__Id as Order__Id,
e.order_detail_id as Order_Detail_Id,
0 as IdItemUnisys,
f.product_id as IdProduto,
0 as QtdParticipante,
str_PartCur_Nome as NomeParticipante,
0 as CPFParticipante,
str_PartCur_Email as EmailParticipante,
0 as dddFixoParticipante,
0 as FoneFixoParticipante,
0 as dddCelularParticipante,
0 as FoneCelularParticipante,
str_PartCur_Cargo as CargoParticipante,
str_PartCur_Depto as DepartamentoParticipante,
1 as statusParticipante,
0 as IdSubstituto,
CONVERT(bigint, c.bn_PedidaoI_usuarios_id_ent_fk) as IdContact, -- precisa ver a necessidade
convert(bigint, bn_pedidao_clientes_id_fk) as IdCliente,
convert(bigint,TAB_PedidaoItem_Id ) int_tab_pedidaoItem_id,
getdate() as dat_alt_participante
from CRM_ED..Tab_ParticipCursos as a
inner join CRM_ED..tab_pedidao as b on (b.int_pedidao_status = 0 and b.tab_pedidao_id = bn_PartCur_Pedidao_id_fk)
inner join CRM_ED..tab_pedidaoItem as c on (c.bn_PedidaoI_pedidao_id_fk = tab_pedidao_id)
inner join CRM_ED..order_ as d on (d.bn_order_pedidao_id_fk = b.TAB_Pedidao_Id)
inner join CRM_ED..order_detail as e on (e.Order__Id = d.order__id)
inner join CRM_ED..product as f on (f.product_id = c.bn_PedidaoI_prod_produtoid_fk)
where d.Int_Order_Ikeda = @NrPedidoLoja
End
-- (Fim) Verifica se o pedido foi feito pela loja virtual para fazer o tratamento dos participantes. 
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_ParticipanteCursos')        
drop table ##Temp_SageEducacao_ParticipanteCursos  
Select Distinct
e.idParticipanteCursos,
d.Unit_Price,
a.Rn_Edit_Date,
g.IdPedidoVendaItem,
1 as IdTipoSituacao, 
g.Valor,
g.ValorBase,
a.NR_Pedido,
e.NomeParticipante,
e.CPFParticipante,
55555 as RG,
e.DepartamentoParticipante,
e.CargoParticipante,
e.EmailParticipante,
getdate() as DataNascimento,
c.Order__Id as OrderId,
e.IdProduto as ProdutoId,
b.int_FatItens_ItemIdUnisys as IdItemUnisys,
Isnull(c.int_order_ikeda,0) as  NrPedidoLoja
Into ##Temp_SageEducacao_ParticipanteCursos
From       CRM_ED..Fatura  as a 
Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)  
Inner Join CRM_ED..order_ as c on (a.nr_Pedido = c.Order_Number)
Inner Join CRM_ED..Order_Detail as d on (c.order__id = d.order__id And b.bn_FatItens_Product_Id_pk  = d.Product_Id)
Inner Join CRM_ED..tb_ParticipanteCursos as e on (d.Order__Id = e.order__id and d.Order_Detail_Id= e.Order_Detail_Id)
Inner Join SAGE_Educacao..PedidoVenda as f on (a.NR_Pedido = f.CodigoPedidoVenda)
Inner Join SAGE_Educacao..PedidoVendaItem as g on (f.IdPedidoVenda = g.IdPedidoVenda And b.int_FatItens_ItemIdUnisys = g.CodigoPedidoVendaItem) 
Where a.numero = @FaturaID
And c.TipoProd = 'CUR'


    Select @IdParticipante = IdParticipante
    From ##Temp_SageEducacao_ParticipanteCursos as a
    Inner Join Participante as b on (a.CPFParticipante = b.CPF COLLATE Latin1_General_CI_AS)
If (@IdParticipante = 0 )
Begin 
Insert into Participante(
Nome,
CPF,
RG,
Departamento,
Cargo,
email,
DataNascimento)
Select 
NomeParticipante,
CPFParticipante,
RG,
DepartamentoParticipante,
CargoParticipante,
EmailParticipante,
DataNascimento 
From ##Temp_SageEducacao_ParticipanteCursos
Select @IdParticipante = @@IDENTITY 

End
Else
Begin
Update a
Set a.Nome = b.NomeParticipante,
--a.CPF = b.CPFParticipante,
a.RG = b.RG,
a.Departamento = b.DepartamentoParticipante,
a.Cargo = b.CargoParticipante,
a.email = b.EmailParticipante,
a.DataNascimento = b.DataNascimento
From Participante as a
Inner Join ##Temp_SageEducacao_ParticipanteCursos as b on (a.CPF COLLATE Latin1_General_CI_AS = b.CPFParticipante)
Where a.IdParticipante = @IdParticipante
End
--Insere na PedidoVendaParticipante
Insert into PedidoVendaParticipante(
IdParticipante,
Valor,
DataSituacao,
IdPedidoVendaItem,
IdTipoSituacao,
ValorBase,
CodigoPedidoVendaParticipante)
Select distinct
p.IdParticipante, 
Unit_Price,
Rn_Edit_Date,
IdPedidoVendaItem, 
IdTipoSituacao, 
ValorBase,
idParticipanteCursos 
From ##Temp_SageEducacao_ParticipanteCursos pc
inner join Participante p on pc.CPFParticipante = p.CPF collate SQL_Latin1_General_CP1_CI_AS
order by IdParticipanteCursos 
--- Atualiza ItemIdUnisystb_ParticipanteCursos 
Update A
    Set a.IdItemUnisys = b.IdItemUnisys 
From       CRM_ED..tb_ParticipanteCursos  as a 
Inner Join ##Temp_SageEducacao_ParticipanteCursos as b on (a.order__id = b.OrderId And a.IdProduto = b.ProdutoId)  
/*
Exec SPR_SageEducacao_CG_Participantes 73282628
Select * from PedidoVendaParticipante
Select * from Participante
Select * from CRM_ED..tb_ParticipanteCursos
Delete PedidoVendaParticipante where idpedidovendaparticipante in (5,6,7,8,9,10)
select top 10 *
from tab_faturaitens
insert into tb_ParticipanteCursos (
--IdParticipanteCursos, -- identity
TAB_PedidaoItem_Id,
Order__Id,
Order_Detail_Id,
IdItemUnisys,
IdProduto,
QtdParticipante,
NomeParticipante,
CPFParticipante,
EmailParticipante,
dddFixoParticipante,
FoneFixoParticipante,
dddCelularParticipante,
FoneCelularParticipante,
CargoParticipante,
DepartamentoParticipante,
statusParticipante,
IdSubstituto,
IdContact,
IdCliente,
int_tab_pedidaoItem_id,
dat_alt_participante)

--IdParticipanteCursos,
select 
TAB_PedidaoItem_Id as TAB_PedidaoItem_Id,
d.Order__Id as Order__Id,
e.order_detail_id as Order_Detail_Id,
0 as IdItemUnisys,
f.product_id as IdProduto,
0 as QtdParticipante,
str_PartCur_Nome as NomeParticipante,
0 as CPFParticipante,
str_PartCur_Email as EmailParticipante,
0 as dddFixoParticipante,
0 as FoneFixoParticipante,
0 as dddCelularParticipante,
0 as FoneCelularParticipante,
str_PartCur_Cargo as CargoParticipante,
str_PartCur_Depto as DepartamentoParticipante,
1 as statusParticipante,
0 as IdSubstituto,
CONVERT(bigint, c.bn_PedidaoI_usuarios_id_ent_fk) as IdContact, -- precisa ver a necessidade
convert(bigint, bn_pedidao_clientes_id_fk) as IdCliente,
convert(bigint,TAB_PedidaoItem_Id ) int_tab_pedidaoItem_id,
getdate() as dat_alt_participante
from Tab_ParticipCursos as a
inner join tab_pedidao as b on (b.int_pedidao_status = 0 and 
                                               b.tab_pedidao_id = bn_PartCur_Pedidao_id_fk)
inner join tab_pedidaoItem as c on (c.bn_PedidaoI_pedidao_id_fk = tab_pedidao_id)
inner join order_ as d on (d.bn_order_pedidao_id_fk = b.TAB_Pedidao_Id)
inner join order_detail as e on (e.Order__Id = d.order__id)
inner join product as f on (f.product_id = c.bn_PedidaoI_prod_produtoid_fk)
where f.code_ in ('ASS004', 'ASS005', 'AXP003', 'AVK006')  




--From       CRM_ED..Fatura  as a 
--Inner Join CRM_ED..TAB_FaturaItens as b on (a.Numero = b.int_FatItens_FaturaId)  
--Inner Join CRM_ED..order_ as c on (a.nr_Pedido = c.Order_Number)
--Inner Join CRM_ED..Order_Detail as d on (c.order__id = d.order__id)
--Inner Join CRM_ED..tb_ParticipanteCursos as e on (d.Order__Id = e.order__id)
--Inner Join SAGE_Educacao..PedidoVenda as f on (a.NR_Pedido = f.CodigoPedidoVenda)
--Inner Join SAGE_Educacao..PedidoVendaItem as g on (f.IdPedidoVenda = g.IdPedidoVenda) 
--Where a.numero = @FaturaID
*/



GO
/****** Object:  StoredProcedure [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_PedidosTOSageEducacao
Data Criação     : 21/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados do Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

Create Proc [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao] 
@FaturaID Bigint,
@LogId Bigint
As

--Variaveis Para Log
Declare @Log_Id_Big BIGINT,
@Log_Id BINARY(8),
@Descricao VARCHAR(1000),
@Valor VARCHAR(100),
@User BINARY(8), -- Id do usuário Carga
@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso 
@ErroSql int -- Erro retornado do SQL


--Exec Log_Inicio 268, @Log_Id_Big OUTPUT
--SET @Log_Id = cast(@Log_Id_Big as binary(8))

SET @Log_Id = cast(@LogId as binary(8))

--- Carga Clientes
SET @SucessoErro = 1
SET @Descricao = 'Importando Clientes para SageEducação - SPR_SageEducacao_CG_Cliente'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Cliente @FaturaID 

SELECT @ErroSql = @@ERROR
IF @ErroSql <> 0
BEGIN -- @ErroSql <> 0
SET @Descricao = 'Erro no Carga de Clientes'
SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
SET @SucessoErro = 0 --Erro
END -- @ErroSql <> 0
    Else  
BEGIN
SET @Descricao = 'Clientes Importado com sucesso'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
END


--- Carga Vendedores
SET @SucessoErro = 1
SET @Descricao = 'Importando Vendedores para SageEducação - SPR_SageEducacao_CG_Vendedor'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Vendedor @FaturaID 

SELECT @ErroSql = @@ERROR
IF @ErroSql <> 0
BEGIN -- @ErroSql <> 0
SET @Descricao = 'Erro no Carga de Vendedores'
SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
SET @SucessoErro = 0 --Erro
END -- @ErroSql <> 0
    Else  
BEGIN
SET @Descricao = 'Vendedores Importado com sucesso'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
END


--- Carga Pedidos
SET @SucessoErro = 1
SET @Descricao = 'Importando Pedidos para SageEducação - SP_SageEducacao_CG_PedidoVenda'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SP_SageEducacao_CG_PedidoVenda @FaturaID 

SELECT @ErroSql = @@ERROR
IF @ErroSql <> 0
BEGIN -- @ErroSql <> 0
SET @Descricao = 'Erro no Carga de Pedidos'
SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
SET @SucessoErro = 0 --Erro
END -- @ErroSql <> 0
    Else  
BEGIN
SET @Descricao = 'Pedidos Importado com sucesso'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
END


--- Carga Participantes
SET @SucessoErro = 1
SET @Descricao = 'Importando Participantes para SageEducação - SPR_SageEducacao_CG_Participantes'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'

Exec SPR_SageEducacao_CG_Participantes @FaturaID 

SELECT @ErroSql = @@ERROR
IF @ErroSql <> 0
BEGIN -- @ErroSql <> 0
SET @Descricao = 'Erro no Carga de Participantes'
SET @Valor = 'Código do Erro : ' + cast(@ErroSql as varchar)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'ERRO'
SET @SucessoErro = 0 --Erro
END -- @ErroSql <> 0
    Else  
BEGIN
SET @Descricao = 'Participantes Importado com sucesso'
SET @Valor = Convert(Varchar(15),@FaturaID)
EXEC Crm_Ed..Log_Item @Log_Id_Big,@Descricao,@Valor,'INFO'
END




IF @SucessoErro = 1
RETURN 1 -- Indica que a procedure foi executada com Sucesso
ELSE
RETURN 0 -- Indica qua a procedure NÃO foi executada com Sucesso
/*

Exec SPR_SageEducacao_CG_PedidosTOSageEducacao 73282628

GRANT EXECUTE ON [dbo].[SPR_SageEducacao_CG_PedidosTOSageEducacao] TO SPR_SageEducacao_CG_PedidosTOSageEducacao


*/

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_CG_Vendedor]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************************
Autor            : Roberto Junior                                                                      *
Procedure        : SPR_SageEducacao_CG_Vendedor                                                         *
Data Criação     : 09/07/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Atualização de Dados da Crm p SageEducacao                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

CREATE Proc [dbo].[Spr_SageEducacao_CG_Vendedor] 
@FaturaID Bigint
As

--Use SAGE_Educacao
Declare @IdVendedor Bigint
If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Vendedor')        
drop table ##Temp_SageEducacao_Vendedor  
Select 
a.int_Fatura_VendId,
a.bn_Fatura_VendId_fk,
b.First_Name  
Into ##Temp_SageEducacao_Vendedor
From       CRM_ED..Fatura  as a
Inner Join CRM_ED..Employee as b on (a.bn_Fatura_VendId_fk = b.Employee_Id)
Where Numero = @FaturaID
Delete b
From Vendedor as A
Inner Join ##Temp_SageEducacao_Vendedor as b on (a.CodigoVendedor = b.int_Fatura_VendId)

Insert into Vendedor( 
Nome,
CodigoVendedor)
Select
First_Name,
int_Fatura_VendId
From ##Temp_SageEducacao_Vendedor

/*

Use Sage_Educacao
Select * from Vendedor
delete Vendedor where IdVendedor in (2,3,4)

*/

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Insert_CursoTurma]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 06/06/2016          
*  NOME: Spr_SageEducacao_InsertCursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

CREATE Proc [dbo].[Spr_SageEducacao_Insert_CursoTurma]  
@CodigoTurmaOferta Varchar(20)

As

Declare
--Variaveis Para Log
@Log_Id_Big BIGINT,
@Log_Id BINARY(8),
@Descricao VARCHAR(1000),
@Valor VARCHAR(100),
--Variaveis genéricas
@User BINARY(8), -- Id do usuário Carga
@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso
--@QtdeAlvo int, -- Quantidade de registros alvo
@QtdeSucUpdate int,-- Quantidade de registros atualizados com sucesso
@QtdeSucInsertTemp int, -- Quantidade de registros inseridos com sucesso na tabela ##temp_carga_Prod
@QtdeSucInsertDestino int, -- Quantidade de registros inseridos com sucesso na tabela de Destino
@QtdeErro int, --  Quantidade de registros com erro
@QtdeInativo int, -- Quantidade de registros marcados como inativos
@ErroSql int, -- Erro retornado do SQL
@DataHora datetime, -- Data hora que será usada nos campos Rn_Create_Date e Rn_Edit_Date
@cmd varchar(5000), -- Para armazenar a instrução de insert na tabela temporária
-- Duas variavies para verificar o Last_id usado
@Id_BigIntMax BigInt, -- Id do Pivotal da tabela de destino em formato BigInt para ser usado na instrução de insert na tabela destino
@Id_BigIntRsys BigInt -- Id do Pivotal da tabela Rsys_Last_Id em formato BigInt para ser usado na instrução de insert na tabela destino



SET @QtdeSucUpdate = 0
SET @QtdeSucInsertTemp = 0
SET @QtdeSucInsertDestino = 0
SET @QtdeErro = 0
SET @DataHora = getdate()
Select @User = Users_id from Crm_ED..Users where login_name='Carga'


--Declare @CodigoTurmaOferta Varchar(20)
--Set @CodigoTurmaOferta = 'IMPA800042'
--Select * from SageEducacaoProdutos


Delete Crm_ED..SageEducacaoProdutos


Insert Into Crm_ED..SageEducacaoProdutos (
IdCurso,  
CodigoTurma,   
CodigoCurso,
Titulo,    
FormatoDescricao,
FormatoId,
NetIob,      
Grupo1,     
Grupo2,      
OcProtec,    
OcRetroativo,
OcLicenca,   
OcRede,      
OcMail,      
OcRenovacao, 
RecPasta,    
TipoProduto, 
OCConTelefone,
OCConFax,    
OCConEmail,  
DataInicio,  
DataFim,     
Familia,  
ativo, 
EstoqueControlado, 
ProdArea,         
UltimaEdicao,     
UltimoSuplemento, 
CmlProd,          
AcessoSimult,     
Licenca,          
ConsultaWeb,      
ProdutoidRede,    
ExigeTribEstadual, 
ExigeUsuAdm,       
ExigeEmail,        
LiberadoCampanha,  
TpAcesso,           
TpRateio,          
ProdOrigem,        
AcSiteAssinante,   
Valor, 
WelcomeNova, 
WelcomeRen,  
LibSar,
LibRenova, 
LibTmk, 
LibLoja, 
QtdeMinimaInscricao,
QtdeMesesVig,    
QtdeAcSimultDe,  
QtdeAcSimultAte, 
IdAreaTematica,  
ProdutoIDPrinc,  
CodProdPrinc,    
QtdeConsultaTel, 
TpDependencia,   
CodProdTxAdesao, 
ModAssinatura,   
InformacaoHorario, 
IdTipoTurma,     
LocalCurso,      
IdTipoCurso,     
DataHoraPalestra, 
DuracaoCurso,     
NomeLink,       
StatusPalestra, 
TipoPalestra,   
IdVideo,        
CodigoPacotes,  
TemRetencao,
Description,
Product_Cost,
Origem_nacionalidade,
bl_product_coml,
DataAtualizacao,
DataIntegracao,
Capacidade) 
Select DISTINCT
  a.IdCurso,
  e.CodigoTurmaOferta,
  a.CodigoCurso,
  a.Titulo,
  c.Descricao, -- Descrição Formato (Midia) 
  c.IdFormato, 
  0, -- (Marcado com X ????)          (Netiob) 
  'CUR' as Grupo1, -- (grupo1)
  'Cursos' as Grupo2, --  (grupo2)
  ' ' as OcProtec, -- (OcProtec)
  ' ' as OcRetroativo, -- (OcRetroativo)
  ' ' as OcLicenca, -- (OcLicenca)
  ' ' as OcRede, -- (OcRede)
  ' ' as OcMail, -- (OcMail)
  ' ' as OcRenovacao, -- (OcRenovacao)
  ' ' as RecPasta, -- (RecPasta)
  0 as TipoProduto, -- (TipoProduto) 
  ' ' as OCConTelefone, -- (OCConTelefone)
  ' ' as OCConFax, -- (OCConFax)
  ' ' as OCConEmail, -- (OCConEmail)
  Convert(Varchar(10),e.DataInicio,112) as DataInicio,
  Convert(Varchar(10),e.DataFim,112) as DataFim,  
  'EDUCACAO PROFISSIONAL' as Familia, 
  1 as bl_produtos_ativo,
  0 as bl_produtos_EstoqueControlado,
  1 as int_produtos_ProdArea,
  0 as int_produtos_UltimaEdicao,
  0 as int_produtos_UltimoSuplemento,
  1 as int_produtos_CmlProd,
  0 as int_produtos_AcessoSimult,
  0 as int_produtos_Licenca,
  0 as int_produtos_ConsultaWeb,
  0 as int_produtos_ProdutoidRede,
  0 as int_produtos_ExigeTribEstadual,
  0 as int_produtos_ExigeUsuAdm,
  0 as int_produtos_ExigeEmail,
  0 as int_produtos_LiberadoCampanha,
  0 as int_produtos_TpAcesso, 
  0 as int_produtos_TpRateio,
  0 as int_produtos_ProdOrigem,
  0 as int_produtos_AcSiteAssinante,
  f.Valor as my_produtos_VlrProd,
  '' as str_produtos_WelcomeNova,
  '' as str_produtos_WelcomeRen,
  '' as Str_produtos_LibSar,
  '' as Str_produtos_LibRenova,
  'S' as Str_produtos_LibTmk,
  '' as Str_produtos_LibLoja,  -- Verificar se todos produtos serão carregados na loja 
  QtdeMinimaInscricao, -- as int_produtos_Qtde_SaldoEstimado,
  0 as int_produtos_QtdeMesesVig,
  0 as int_produtos_QtdeAcSimultDe,
  0 as int_produtos_QtdeAcSimultAte,
  999, --i.IdAreaTematica, --int_produtos_Categoria  Area Tematica (b.CRCD_AREA as int_produtos_Categoria)
  0 as int_produtos_ProdutoIDPrinc,
  a.codigoCurso as str_produtos_CodProdPrinc,
  0 as int_produtos_QtdeConsultaTel,
  '' as str_produtos_TpDependencia,
  0 as str_produtos_CodProdTxAdesao,
  0 as int_produtos_ModAssinatura,
  e.InformacaoHorario, --,str_produtos_DataHoraCurso (POR ENQUANTO ESTA NO INSTRUTOR - ESTA INFORMAÇÃO DEVE ESTA NA TURMAOFERTA)
  h.IdTipoTurma,-- as int_produtos_TurnoCurso (Evandro esta Verificando)
  m.Descricao, --str_produtos_LocalCurso  
  'FORMAÇÃO',--n.IdTipoCurso,  --int_produtos_TpCurso
  0 as DataHoraPalestra,
  0 as DuracaoCurso,
  'teste link ' as NomeLink, -- (Turma) Evandro esta verificando
  0 as StatusPalestra,
  0 as TipoPalestra,
  0 as IdVideo,
  '   ,   ,   ,   ,   ' as CodigoPacotes,
  1 as TemRetencao,
  c.Descricao,
  f.Valor,
  'SAO PAULO' as Origem_nacionalidade,
  1 as bl_product_coml,
  GETDATE(),
  '1900-01-01',
  e.Capacidade 
  From Curso as a
  inner Join CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  left Join  TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
  Inner Join TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
  Inner Join TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
  ----Inner Join AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
  Inner Join RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
  Inner Join Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
  --Inner Join TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
  Where  e.CodigoTurmaOferta = @CodigoTurmaOferta
  --Where  e.CodigoTurmaOferta in ('DACP337919') 
  And f.ExportaCrm = 1
  
  
  Set @QtdeSucInsertDestino = @@ROWCOUNT 

Select @Id_BigIntMax = cast(max(Product_Id) as bigint) from Crm_ED..Product
Select @Id_BigIntRsys = cast(Last_Id_Value as bigint) from Crm_ED..Rsys_Last_Id where Table_Name = 'Product'
 
-- Compara o último ID usado na tabela de Destino com o ID da tabela Rsys_Last_id
IF @Id_BigIntMax <> @Id_BigIntRsys
            BEGIN
                        SET @Descricao = 'O último ID usado não corresponde com o ID da tabela Rsys_Last_Id'
                        SET @Valor = cast(Getdate() as varchar)                       
                        IF @Id_BigIntMax > @Id_BigIntRsys
                                   SET @Id_BigIntRsys = @Id_BigIntMax
            END

 

if @Id_BigIntRsys is null
            SET @Id_BigIntRsys = 1



-- Atualização do Rsys_Last_Id prevendo as inserções que serão realizadas
SET @Id_BigIntRsys = @Id_BigIntRsys + 1
Update Crm_ED..Rsys_Last_Id SET Last_Id_Value = cast(@Id_BigIntRsys as binary(8)) Where Table_Name = 'Product'



---------- ATUALIZANDO PRODUCT
INSERT INTO Crm_ED..Product (
Product_Id, 
Code_, --CodProd
Product_Name, --Descricao
Rn_Descriptor, 
NETIOB, --Netiob
Grupo1,
Grupo2,
Gera_Protec, --OcProtec
Produto_Retroativo, --OcRetroativo
Licenca, --OcLicenca
Produto_Rede, --bl_produtos_ProdRede
OC_Consulta_EMail, --OcConEmail
OC_Renovacao, --OcRenovacao
RecPasta, --RecPasta
TipoProduto, --TipoProduto
OC_Consulta_Tel,
OC_Consulta_Fax, --OcConFax
str_prod_VigenciaInicial, --str_produtos_VigenciaInicial
str_prod_VigenciaFinal, --str_produtos_VigenciaFinal
Familia, --Familia
Inativo,
str_prod_TpEstoqueControlado, 
int_prod_ProdArea, 
int_prod_UltimaEdicao,
int_prod_UltimoSuplemento, 
int_prod_CmlProd, 
Produto_Licenca, --OcLicenca
int_prod_ConsultaWeb , 
Rede,
int_prod_ExigeTribEstadual,
int_prod_ExigeUsuAdm,
int_prod_ExigeEmail, 
int_prod_LiberadoCampanha,
int_prod_TpAcesso, 
int_prod_TpRateio, 
int_prod_ProdOrigem,
int_prod_AcSiteAssinante, 
Product_Cost, -- Valor do produto
str_produtos_WelcomeNova,
str_produtos_WelcomeRen,
str_produtos_LibSAR,
str_produtos_LibRenova,
str_produtos_LibTMK,
str_produtos_LibNova,
--QtdeMinimaInscricao,
int_prod_QtdeMesesVig,
int_prod_QtdeAcSimultDe,
int_prod_QtdeAcSimultAte,
--IdAreaTematica,
int_prod_ProdutoIDPrinc,
str_prod_CodProdPrinc,
str_prod_TpDependencia, 
str_prod_CodProdTxAdesao,
int_prod_ModAssinatura,
Carga_Horaria,
--InformacaoHorario,
--LocalCurso,      
--IdTipoCurso,     
DataHoraPalestra, 
DuracaoCurso,     
NomeLink,
StatusPalestra, 
TipoPalestra,   
IdVideo, 
CodigoPacotes,  
TemRetencao,
Rn_Create_Date,
Rn_Create_User,
Rn_Edit_Date,
Rn_Edit_User,
Num_produtoIOB,
bl_product_coml,
Origem_nacionalidade,
Formato,
Int_Prod_Qtde_SaldoEstimado)
Select 
Convert(Binary(8),@Id_BigIntRsys),
CodigoTurma,
Substring(Titulo,1,39),    
CodigoCurso + ' - ' + Titulo,  --Descricao,
NetIob,      
Grupo1,     
Grupo2,      
OcProtec,    
OcRetroativo,
OcLicenca,   
OcRede,      
Case When OcMail = '' Then 0 End,      
OcRenovacao, 
RecPasta,    
TipoProduto, 
OCConTelefone,
OCConFax,    
substring(datainicio,3,2) + substring(datainicio,5,2) + substring(datainicio,7,2) as DataInicio,
substring(DataFim,3,2) + substring(DataFim,5,2) + substring(DataFim,7,2) as DataFim,
Familia,     
ativo, 
EstoqueControlado, 
ProdArea,         
UltimaEdicao,     
UltimoSuplemento, 
CmlProd,            
Licenca,          
ConsultaWeb,      
ProdutoidRede,    
ExigeTribEstadual, 
ExigeUsuAdm,       
ExigeEmail,        
LiberadoCampanha,  
TpAcesso,           
TpRateio,          
ProdOrigem,        
AcSiteAssinante,   
Product_Cost, -- Product_Cost, -- valor 
WelcomeNova, 
WelcomeRen,  
LibSar,
LibRenova, 
LibTmk, 
LibLoja, 
--QtdeMinimaInscricao,
QtdeMesesVig,    
QtdeAcSimultDe,  
QtdeAcSimultAte, 
--IdAreaTematica,  
ProdutoIDPrinc,  
CodProdPrinc,     
TpDependencia,   
CodProdTxAdesao, 
ModAssinatura,   
InformacaoHorario,
--IdTipoTurma,     
--LocalCurso,      
--IdTipoCurso,     
DataHoraPalestra, 
DuracaoCurso,     
'Teste Link', -- NomeLink,       
StatusPalestra, 
TipoPalestra,   
IdVideo,        
CodigoPacotes,  
TemRetencao,
GETDATE(),
0x000000000001853C,
GETDATE(),
0x000000000001853C,
@Id_BigIntRsys,
bl_product_coml,
Origem_nacionalidade,
FormatoId,
Capacidade
From Crm_ED..SageEducacaoProdutos




--- Inserindo na Product_Group
insert into Crm_ED..Product_Group (
Product_Group_Id,
Rn_Descriptor,
Rn_Create_Date,
Rn_Create_User,
Rn_Edit_Date,
Rn_Edit_User,
int_prodGroup_id_pk,
str_prodGroup_descricao,
Str_ProdGroup_CodProdPaiIkeda)
select Product_Id,
Rn_Descriptor
Rn_Descriptor,
Rn_Create_Date,
Rn_Create_User,
Rn_Edit_Date,
Rn_Edit_User,
Convert(Bigint,Product_Id),
Product_Name,
'CUR' + code_
From Crm_ED..Product where Product_Id = @Id_BigIntRsys

Update Crm_ED..product 
set bn_prod_ProdGroup_id_fk = @Id_BigIntRsys 
where code_ = @CodigoTurmaOferta


--------- Inserindo dados na
Declare @tab_precobase_ID Binary(8)


If exists (select 1 from tempdb..sysobjects where name = '##Temp_SageEducacao_Tab_PrecoBase')        
drop table ##Temp_SageEducacao_Tab_PrecoBase  


SELECT product_id, code_,  Product_Name,  Product_Cost , familia,str_prod_VigenciaInicial,Origem_nacionalidade
into ##Temp_SageEducacao_Tab_PrecoBase
FROM Crm_ED..PRODUCT AS A
WHERE GRUPO1 in ( 'CUR') AND 
  bl_product_Coml = 1 AND
  Product_Cost > 0 AND 
(convert(datetime, str_prod_VigenciaInicial) >= convert(varchar(10), getdate(), 111) or    
  str_prod_VigenciaInicial = '991231') and  
  a.Origem_nacionalidade <> 'Curso Fechado' 
  and not (CodigOPacotes <> '   ,   ,   ,   ,   ' and Formato = 7) 
  and code_ =  @CodigoTurmaOferta
  
  
exec Crm_ED..ObterId 'tab_precobase', @tab_precobase_ID output

  
Insert into Crm_ED..Tab_PrecoBase ( 
   TAB_PrecoBase_Id,
   Rn_Descriptor,
   Rn_Create_Date,
   Rn_Create_User,
   Rn_Edit_Date,
   Rn_Edit_User,
   bn_Preco_prod_produtoid_pk_fk,
   int_Preco_QtdeAcSimult_pk,
   int_Preco_QtdeMaxParc,
   my_Preco_ValorBase,
   dt_preco_DtProducao,
   dt_preco_DtExpiracao,
   int_preco_VigComQtdeMeses,
   int_preco_AtualizaDescriptor,
   int_Preco_QtdeAcSimultAte_pk,
   int_Preco_QtdeConsultaWeb_pk)
select                             
   @tab_precobase_ID,
   code_ + ' ' + substring(Product_Name, 1, 30) + ' - R$ ' + cast(Product_Cost as varchar(16)) ,
   getdate(),
   cast(0 as binary(8)),
   getdate(),
   cast(0 as binary(8)),
   product_id,
   0,
   case when familia = 'LUCRE' then 5 else 1 end ,
   Product_Cost,
case when datepart(hour, getdate()) > 22 then convert(varchar(12), getdate() + 1, 113) else  convert(varchar(12), getdate() , 113) end,
   '3000-12-31',
   0,
   0,
   0,
   0
from     ##Temp_SageEducacao_Tab_PrecoBase 


---------------------------- TAB_PVxProd

Declare @TAB_CadPVCur_Id binary(8)

Select @TAB_CadPVCur_Id = convert(binary(8), min(convert(bigint, TAB_CadPV_Id)) ) 
from Crm_ED..tab_cadpv where bl_CadPv_PvAtiva = 1 and
int_CadPv_TipoPV = 1 and 
   substring(str_CadPv_Codigo, 1, 6) = 'PCCUR-' and
   dt_CadPv_DtProducao <= convert(varchar(10), getdate(), 112) and 
   dt_CadPv_DtExpiracao >= convert(varchar(10), getdate(), 112)

print @TAB_CadPVCur_Id

if  exists (select * from tempdb..sysobjects where name = '##temp_20071003_product_Edu' and upper(xtype) = 'U')  
DROP TABLE ##temp_20071003_product_Edu

SELECT TAB_CadPV_Id, product_id, code_,  Product_Name,  Product_Cost , familia
INTO ##temp_20071003_product_Edu
From (SELECT @TAB_CadPVCur_Id as TAB_CadPV_Id, product_id, code_,  Product_Name,  Product_Cost , familia
FROM Crm_ED..Product as a
WHERE a.grupo1 = 'CUR' and  
  --a.Formato in ('0', '8', '7', '9', '1', '2', '3', '5') and   
  a.bl_product_Coml = 1 and   
(convert(datetime, str_prod_VigenciaInicial) >= convert(varchar(10), getdate(), 111) or    
  str_prod_VigenciaInicial = '991231') and  
  a.Origem_nacionalidade <> 'Curso Fechado' 
  and not (CodigoPacotes <> '   ,   ,   ,   ,   ' and Formato = 7) -- NÃO deve enviar nenhuma palestra que é disponibilizado para o Super Pacotes
  and code_ =  @CodigoTurmaOferta
) as A


--UPDATE B 
--SET RN_EDIT_DATE = CONVERT(VARCHAR(10), GETDATE(), 112),
-- my_PVxProd_ValorBase = A.Product_Cost
-- FROM ##temp_20071003_product_Edu as a,
-- TAB_PVxProd as b
--WHERE  a.TAB_CadPV_Id = b.bn_PVxProd_CadPV_id_fk AND
--    a.product_id = b.bn_PVxProd_Product_Id_fk
          
          
  
--DELETE A
--FROM TAB_PVxProd AS A
--inner join PRODUCT AS B on (b.Product_Id = bn_PVxProd_Product_Id_fk)
--inner join TAB_CadPV as c on (c.TAB_CadPV_Id = a.bn_PVxProd_CadPV_id_fk)
--WHERE c.str_CadPv_Codigo in ('PCCUR-001') AND 
--   A.RN_EDIT_DATE <> CONVERT(VARCHAR(10), GETDATE(), 112)          
 
declare @QtdRegistros int
declare @bn_Tab_PVxProdutos_Id  int 

exec Crm_ED..ObterId 'TAB_PVxProd', @tab_precobase_ID output
 
print @bn_Tab_PVxProdutos_Id

INSERT INTO Crm_ED..TAB_PVxProd(
                        bn_PVxProd_CadPV_id_fk,
                        bn_PVxProd_Product_Id_fk,
                        int_PVxProd_VigComQtdeMeses,
                        int_PVxProd_QtdeAcSimult_pk,
                        int_PVxProd_QtdeAcSimultAte_pk,
                        int_PVxProd_QtdeConsultaWeb_pk,
                        my_PVxProd_ValorBase,
                        int_PVxProd_QtdMinima,
                        Tab_PVxProd_Id,
                        Rn_Descriptor,
                        Rn_Create_Date,
                        Rn_Create_User,
                        Rn_Edit_Date,
                        Rn_Edit_User)

            select 
                        CAST(TAB_CadPV_Id AS BINARY(8)),                        
                        product_id,
                        0,
                        0,
                        0,
                        0,
                        Product_Cost,
                        1,
                        product_id,
                        '???',                                                                                                   
                        GETDATE()       ,
                        0          ,
                        GETDATE()       ,
                        0
            from ##temp_20071003_product_Edu
                            

---- Carregando TAB_ProdFil 
Declare @ProductId Bigint
Select @ProductId = Convert(Bigint,product_id)
from ##temp_20071003_product_Edu

Select @Id_BigIntRsys = cast(Last_Id_Value as bigint) from Crm_ED..Rsys_Last_Id where Table_Name = 'TAB_ProdFil'
Select @Id_BigIntRsys = @Id_BigIntRsys + 1

If exists (select 1 from tempdb..sysobjects where name = '##temp_SageEducacao_ProdFil')        
drop table ##temp_SageEducacao_ProdFil  
 
--Set @cmd = 'SELECT IDENTITY(int, ' + cast(@Id_BigIntRsys as varchar) + ',1) AS CampoId,Nome, 
--Filial_Id, ' + Cast(@ProductId as Varchar) + ' as ProductId
--INTO ##temp_SageEducacao_ProdFil
--FROM Filial' 
--EXECUTE(@cmd)

    Select IDENTITY(Int,1,1) as CampoId,Nome,Filial_id
    Into ##temp_SageEducacao_ProdFil
    FROM Crm_ED..Filial


INSERT INTO Crm_ED..TAB_ProdFil
(
bn_ProdFil_filiais_id_pk_fk,  -- int_ProdFil_filiais_ID_pk_fk
bn_ProdFil_prod_id_pk_fk,  -- int_ProdFil_produtos_ID_pk_fk
int_ProdFil_filiais_id_pk_fk,  -- int_ProdFil_filiais_ID_pk_fk
int_ProdFil_prod_id_pk_fk,  -- int_ProdFil_produtos_ID_pk_fk
Rn_Create_Date,  -- @DataHora
Rn_Create_User,  -- @User
Rn_Descriptor,  -- NAO INFORMADO
Rn_Edit_Date,  -- @DataHora
Rn_Edit_User,  -- @User
TAB_ProdFil_Id  -- CampoId
)
SELECT
Filial_Id, --bn_ProdFil_filiais_id_pk_fk
@ProductId, --bn_ProdFil_prod_id_pk_fk
Filial_Id, --int_ProdFil_filiais_id_pk_fk
@ProductId, --int_ProdFil_prod_id_pk_fk
@DataHora, --Rn_Create_Date
@User, --Rn_Create_User
Nome + ' - ' + @CodigoTurmaOferta, --Rn_Descriptor
@DataHora, --Rn_Edit_Date
@User, --Rn_Edit_User
@Id_BigIntRsys + CampoId  --TAB_ProdFil_Id
  FROM ##temp_SageEducacao_ProdFil
Select @Id_BigIntMax = cast(max(TAB_ProdFil_Id) as bigint) from Crm_ED..TAB_ProdFil
        Update Crm_ED..Rsys_Last_Id SET Last_Id_Value = cast(@Id_BigIntMax as binary(8)) Where Table_Name = 'TAB_ProdFil'


/*

GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Insert_CursoTurma] TO app_educacao
GRANT SELECT ON [dbo].[Filial] TO usr_infraprd
GRANT UPDATE ON [dbo].[Filial] TO usr_infraprd
GRANT DELETE ON [dbo].[Filial] TO usr_infraprd
GRANT INSERT ON [dbo].[Filial] TO usr_infraprd


APUR/8 APUR588747
DPAS/28 DPAS607928
DELU/6 DELU823877


APUR/8 APUR588747
DELU/6 DELU823877
APCI/4H22 APCI400382
APCI/4H22 APCI301541
DELU/61230 DELU366673
DELU/61230 DELU358156

CAIC/8161 DELU/61230 160 400.00
APCI301541 APCI/4H22 189 1111.11
DELU276249 DELU/61230 191 100.00

DELU823877       
APUR588747      


APUR911253

Declare @Codigo Varchar(20)
Set @Codigo = 'DACP337919'
               
Exec Spr_SageEducacao_Insert_CursoTurma @Codigo

Use Crm_ED
Select * from SageEducacaoProdutos
Select Formato,Carga_Horaria,Product_Cost,* from product where code_ = @Codigo
Select * from Product_Group where Product_Group_Id in (Select product_id from product where code_ = @Codigo)
Select * from Tab_PrecoBase where bn_Preco_prod_produtoid_pk_fk in (Select product_id from product where code_ = @Codigo)
Select * from TAB_PVxProd where bn_PVxProd_Product_Id_fk in (Select product_id from product where code_ = @Codigo)
Select * from TAB_ProdFil where bn_ProdFil_prod_id_pk_fk in (Select product_id from product where code_ = @Codigo)

Declare @Codigo Varchar(20)
Set @Codigo = 'DELU823877'

Delete SageEducacaoProdutos
Delete TAB_ProdFil where bn_ProdFil_prod_id_pk_fk in (Select product_id from product where code_ = @Codigo)
Delete TAB_PVxProd where bn_PVxProd_Product_Id_fk in (Select product_id from product where code_ = @Codigo)
Delete Tab_PrecoBase where bn_Preco_prod_produtoid_pk_fk in (Select product_id from product where code_ = @Codigo)
Delete Product_Group where Product_Group_Id in (Select product_id from product where code_ = @Codigo)
Delete product where code_ = @Codigo


'IMPA800042'


select str_prod_VigenciaInicial from product

Select *
from product
where product_id = convert(Binary(8),139346)


Select convert(Bigint,product_id)
from product
order by  product_id desc 


Msg 2627, Level 14, State 1, Procedure Spr_SageEducacao_AtualizaCursoTurma, Line 217
Violation of PRIMARY KEY constraint 'Product_I'. Cannot insert duplicate key in object 'dbo.Product'. The duplicate key value is (0x0000000000022055).


Select Num_produtoIOB,GRUPO1,GRUPO2,int_prod_CmlProd,int_prod_prodArea,str_produtos_LibNova,str_produtos_LibTMK,*
from product
where code_  in ('ANA3200039',
'AJUS800037',
'AJUS800038')

Select Num_produtoIOB,GRUPO1,GRUPO2,int_prod_CmlProd,int_prod_prodArea,str_produtos_LibNova,str_produtos_LibTMK,*
from product
where code_  in ('AJUS800038')


Select *
from TAB_ProdFil
order by bn_ProdFil_prod_id_pk_fk


SELECT *
FROM TAB_ProdFil
WHERE bn_ProdFil_prod_id_pk_fk IN (0x0000000000022040)


0x0000000000022041
0x0000000000022040

0x0000000000022052

Update TAB_ProdFil
Set bn_ProdFil_prod_id_pk_fk = 0x0000000000022052
Where Tab_ProdFil_id in (
0x000000000006D525,
0x000000000006D526,
0x000000000006D522,
0x000000000006D523,
0x000000000006D52A,
0x000000000006D52E,
0x000000000006D531,
0x000000000006D51E,
0x000000000006D533,
0x000000000006D535,
0x000000000006D539,
0x000000000006D53C,
0x000000000006D53E)





Update product
Set int_prod_CmlProd = 1,
int_prod_prodArea = 1,
str_produtos_LibNova = 'S',
str_produtos_LibTMK = 'S',
inativo = 0,
Description = 'Teste 123',
Product_Cost = 800,
tipo = 6,
features = 'teste 1234',
familia = 'EDUCACAO PROFISSIONAL',
Carga_Horaria = '9H AS 18H',
bl_product_coml = 1,
str_prod_vigenciaInicial = '160725',
str_prod_vigenciaFinal = '161130',
int_prod_Categoria = 4,
bn_Prod_ProdGroup_id_Fk = 0x0000000000021A95,
UnidadeNegocio = 6,
str_prod_CodProdPrinc = 'AJUS8',
origem_nacionalidade = 'SAO PAULO',
DataHoraPalestra ='2016-07-23 08:30:00.000',
str_prod_CodProdPaiIkeda = 'AJUS800038',
CodigoPacotes = '   ,   ,   ,   ,   ',
Formato = 0
where code_  in ('AJUS800038')



    --Where  e.CodigoTurmaOferta in ('ANA3200039') --,'AJUS800037','AJUS800038')
--Select * from Sage_Educacao..TurmaOferta

Select e.*
From Sage_Educacao..Curso as a
  inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  left Join  Sage_Educacao..TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
  Inner Join Sage_Educacao..TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
  Inner Join Sage_Educacao..TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
  ----Inner Join Sage_Educacao..AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
  Inner Join Sage_Educacao..RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
  Inner Join Sage_Educacao..Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
  --Inner Join Sage_Educacao..TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
  Where  e.CodigoTurmaOferta in ('ANA3200039','AJUS800037','AJUS800038')

--Select * from curso where codigocurso = 'ANA32'
--Select * from CursoModulo where idcurso = 28
--Select * from Turma where idcurso = 28
--Select * from TurmaOferta where idturma in (10,19,36)

--Select * from TipoTurma
--Select * from TipoCurso
--product_codigoprod



'ANA3200039',
'AJUS800037',
'AJUS800038')

Select Code_,bn_prod_ProdGroup_id_fk,Convert(bigint,product_id),Product_Name from product where code_ = 'AJUS800038'


insert into Product_Group (Product_Group_Id, Rn_Descriptor, Rn_Create_Date, Rn_Create_User, Rn_Edit_Date, Rn_Edit_User, int_prodGroup_id_pk,str_prodGroup_descricao, Str_ProdGroup_CodProdPaiIkeda )
select convert(binary(8), 139346), 'Atualização Tributária 2016', getdate(), 0, getdate(), 0, 139346, 'Atualização Tributária 2016', 'CURAJUS800038'

Update product SEt bn_prod_ProdGroup_id_fk = convert(binary(8), 139346) where code_ = 'AJUS800038'



 int_produtos_cmlprod = 1
,int_produtos_prodArea = 1---0
,str_produtos_LibVnova = 'S'--- NULL
,str_produtos_LibTMK = 'S'



Select * from SageEducacao..SageEducacaoProdutos

Select Convert(Bigint,Product_id),* 
from product
order by rn_create_date desc


Select Convert(Bigint,Max(Product_id))
from product


Select Convert(Bigint,Max(Num_produtoIOB))
from product





Delete product
where product_id = 0x0000000000002712

Update product
set bl_product_Coml = 1
where product_id = 0x0000000000002712


Select Product.*
From Tab_PVxProd (nolock) 
JOIN Product (nolock) ON Tab_PVxProd.bn_PVxProd_Product_Id_FK = Product.Product_Id
JOIN Tab_CadPV ON Tab_PVxProd.bn_PVxProd_CadPV_Id_FK = Tab_CadPV.TAb_CadPV_Id
Where Product.bl_product_Coml = 1 


Select Max(Convert(Bigint,TAB_PrecoBase_Id)) From Tab_PrecoBase

Select Max(Convert(Bigint,Last_Id_Value)) from RSys_Last_Id where Table_Name = 'tab_precobase'

Update RSys_Last_Id
set Last_Id_Value = Convert(Binary(8),580560)
where Table_Name = 'tab_precobase'


*/







GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_InsertNotificacaoCurso]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************************************
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Fabio Luz
*  DATA DE CRIAÇÃO: 01/09/2016
*  NOME: spr_SageEducacao_InsertNotificacaoCurso
*  OBS: Grava notificacao enviada
*  DATA         /        DESENVOLVEDOR          /      ALTERAÇÃO
**************************************************************************************************/
CREATE PROCEDURE [dbo].[spr_SageEducacao_InsertNotificacaoCurso]
(
@IdTurma INT,
@IdFatura BIGINT,
@IdFaturaItem BIGINT,
@IdProduto BIGINT,
@Destinatario VARCHAR(200),
@AssuntoEmail VARCHAR(300),
@CorpoEmail VARCHAR(MAX),
@DataInclusao SMALLDATETIME
)  
AS

   SET NOCOUNT ON

INSERT INTO [SAGE_Educacao].[dbo].[NotificacaoCursos]
           ([IdTurma]
           ,[IdFatura]
           ,[IdFaturaItem]
           ,[IdProduto]
           ,[Destinatario]
           ,[AssuntoEmail]
           ,[CorpoEmail]
           ,[DataInclusao])
     VALUES
           (@IdTurma
           ,@IdFatura
           ,@IdFaturaItem
           ,@IdProduto
           ,@Destinatario
           ,@AssuntoEmail
           ,@CorpoEmail
           ,@DataInclusao)


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  /*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 14/07/2016          
*  NOME: Spr_SageEducacao_Lista_AtualizaCursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/     
  
  CREATE Proc [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma]
  
  As
  
  Select Distinct CodigoTurmaOferta,
  Case when g.Code_ is null Then 'I' Else 'A' End as TipoAtualizacao,
  d.IdTurma as IdTurma
  From Sage_Educacao..Curso as a
  Inner Join CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join TurmaOferta as e on (d.IdTurma = e.IdTurma)
  Left  Join  TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta) 
  Left  Join CRM_ED..Product as g on (e.CodigoTurmaOferta = g.Code_ COLLATE Latin1_General_CI_AS)   
  where (d.DataAtualizacao > d.DataIntegracao or e.DataAtualizacao > e.DataIntegracao)
  and CodigoTurmaOferta is not null
  and len(CodigoTurmaOferta) <= 10
  And f.ExportaCrm = 1
  
  /*
ASSA956619
GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Lista_AtualizaCursoTurma] TO app_educacao
Use Sage_Educacao

Exec Spr_SageEducacao_Lista_AtualizaCursoTurma

Turma formato presencial: APUR/8

Turma formato web ao vivo: DPAS/28 

Turma formato web gravado: DELU/6

2016-08-24 09:37:13.797               APUR588747      10
2016-08-24 11:32:10.820               DPAS607928      10
2016-08-24 12:52:14.097               DELU823877       10
2016-08-24 14:44:29.637               APCI400382        10
2016-08-24 22:55:03.590               DELU366673       10
2016-08-24 14:44:29.637               APCI301541        10
2016-08-24 22:55:03.590               DELU358156       10





--Select a.codigocurso,e.codigoturmaoferta
  Select e.*
  From Sage_Educacao..Curso as a
  Inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  Left  Join CRM_ED..Product as f on (e.CodigoTurmaOferta = f.Code_ COLLATE Latin1_General_CI_AS)     
  where codigocurso in ('APUR/8','DELU/6','APCI/4H22','DELU/61230')



-- where codigoturmaoferta in ('APUR588747','DELU823877','APCI400382','DELU366673','APCI301541','DELU358156')

,'DPAS607928'


Update Turma
Set DataIntegracao = getdate()
where idturma in (66,67,68,66,67,68)
PREP420871
AA3456700086   
AATRY002146
Select * from Sage_Educacao..TurmaOferta Where idturma = 64

Select * From Sage_Educacao..Curso where CodigoCurso in ('AATRY001','AATRY002','AATRY003','AATRY004')

Select * from Turma where idcurso in (50,51,52,53)


Alter table CursoModulo
Add CargaHorariaBaseMin Int Default 0 


Alter table Endereco
Alter Column Bairro Varchar(100)


Select *
from product
where grupo1 = 'CUR'
And Rn_Create_Date between '2014-01-01 00:58:13.860' and '2014-12-31 23:58:13.860'
order by Product_name

  
  */

GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_Lista_Dados_TurmaView]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: rafael sanchez
-- Create date: outubro 2016
-- Description: geração de dados apra view turma pesquisa e index em sage educação
-- =============================================
CREATE PROCEDURE [dbo].[spr_SageEducacao_Lista_Dados_TurmaView] 
@text  varchar (100) = null ,
@DataInical datetime= null,
@Datafinal datetime= null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

select tof.CodigoTurmaOferta, 
tur.Observacao,  
cur.IdCurso, 
cur.CodigoCurso, 
cur.Titulo, 
cur.Subtitulo, 
tur.IdTurma,
tur.DataInicio,
tur.DataFim, 
Tof.IdTurmaOferta,
Form.Descricao as 'Formato',
Mun.Descricao as 'DescMunicipio',
tur.InformacaoData, 
tur.CargaHoraria,
tur.InformacaoHorario, 
tur.DataCadastro, 
tur.IdStatus, 
s.Descricao as 'StatusDescricao', 
es.UF as 'Local'
from Curso cur inner join Turma tur
on cur.IdCurso = tur.IdCurso
inner join TurmaOferta Tof
on Tof.IdTurma = tur.IdTurma
inner join [Status] s
on tur.IdStatus = s.IdStatus
inner join RegiaoTreinamento rt
on tur.IdRegiaoTreinamento=rt.IdRegiaoTreinamento
inner join Municipio Mun
on Mun.IdMunicipio = rt.IdMunicipio
inner join Estado es
on es.IdEstado = Mun.IdEstado
inner join Formato Form
on  Form.IdFormato = tur.IdFormato
where (@text IS NULL or cur.Titulo like '%' + @text + '%'
or cur.Subtitulo like  '%' +@text + '%'
or cur.CodigoCurso like '%' + @text + '%'
or s.Descricao  like  '%' + @text + '%'
or tof.CodigoTurmaOferta  like  '%' + @text + '%'
or Form.Descricao  like  '%' + @text + '%'
or Mun.Descricao like  '%' + @text + '%')
--or cur.PontuacaoCRC >''
and tur.DataCadastro between ISNULL(@DataInical,tur.DataCadastro) and ISNULL(@Datafinal,tur.DataCadastro) 
order by tur.IdTurma desc
end

GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_FaturaPedidosCRM]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Matusmoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 31/08/2016          
*  NOME: Spr_SageEducacao_Lista_FaturaPedidosCRM
*  OBS:  Lista FaturaPedidos
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/     
  
 CREATE Proc [dbo].[Spr_SageEducacao_Lista_FaturaPedidosCRM]
  
  As
  
  Select Distinct IdPedidosFaturasCRM,NrPedido,NrFatura
  From PedidosFaturasCRM
  where Status = 0


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_ProducaoAnual]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoAnual                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Anual                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoAnual 2016

CREATE procedure [dbo].[Spr_SageEducacao_Lista_ProducaoAnual] @Ano int 
as
--declare @Ano int

--set @Ano = 2016


-- 1. Selecão das Turmas

--Drop table #Temp_20160918_ProducaoAnual
  
select 
a.IdCurso,
a.CodigoCurso,
a.Titulo,
convert(varchar(100), '') as AreaTematica,
0 as QtdJan,
0 as QtdFeb,
0 as QtdMar,
0 as QtdApr,
0 as QtdMay,
0 as QtdJun,
0 as QtdJul,
0 as QtdAug,
0 as QtdSep,
0 as QtdOct,
0 as QtdNov,
0 as QtdDec,
0 as QtdProgramada,
0 as QtdCancelado,
0 as QtdParticipante
into #Temp_20160918_ProducaoAnual
  From Curso as a 
  Inner Join Turma as b on (b.IdCurso = a.IdCurso) 
where YEAR(DataInicio) = @Ano 
group by a.IdCurso, a.CodigoCurso, a.Titulo

-- 2. Preenchendo o Area Temática

--drop table #Temp_20160918_AreaTematica

select * into #Temp_20160918_AreaTematica from AreaTematica

declare @MinimoIdAreaTematica int

select @MinimoIdAreaTematica = MIN(IdAreaTematica) from #Temp_20160918_AreaTematica

while exists (select * from #Temp_20160918_AreaTematica)
begin 

update c set AreaTematica = AreaTematica + case when AreaTematica > '' then ' , ' else '' end + a.Descricao 
from AreaTematica as a
inner join CursoAreaTematica as b on (b.IdAreaTematica = a.IdAreaTematica)
inner join #Temp_20160918_ProducaoAnual as c on (c.IdCurso = b.IdCurso)
where a.IdAreaTematica = @MinimoIdAreaTematica
delete #Temp_20160918_AreaTematica where IdAreaTematica = @MinimoIdAreaTematica
select @MinimoIdAreaTematica = MIN(IdAreaTematica) from #Temp_20160918_AreaTematica

end 


-- 3. Preenchendo a quantidade e o valor da Receita

update A set QtdJan = b.QtdJan,
             QtdFeb = b.QtdFeb,
             QtdMar = b.QtdMar,
             QtdApr = b.QtdApr,
             QtdMay = b.QtdMay,
             QtdJun = b.QtdJun,
             QtdJul = b.QtdJul,
             QtdAug = b.QtdAug,
             QtdSep = b.QtdSep,
             QtdOct = b.QtdOct,
             QtdNov = b.QtdNov,
             QtdDec = b.QtdDec,
             QtdProgramada = b.QtdProgramado,
             QtdCancelado = b.QtdCancelado, 
             QtdParticipante = b.QtdParticipante
From #Temp_20160918_ProducaoAnual as a
inner join (select a.IdCurso, 
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJan,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdFeb,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdMar,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdApr,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdMay, 
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJun,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdJul,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdAug,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdSep,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdOct,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdNov, 
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 3) and month(DataInicio)  = 1 then 1 else 0 end )as QtdDec,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 1) then 1 else 0 end )as QtdProgramado,
sum(case when b.IdStatus = 5 and e.IdTipoSituacao IN ( 4) then 1 else 0 end )as QtdCancelado,
sum(1) as QtdParticipante
from #Temp_20160918_ProducaoAnual as a
inner join Turma as b on (b.IdCurso = a.IdCurso)
inner join TurmaOferta as c on (c.IdTurma = b.IdTurma)
inner join PedidoVendaItem as d on (d.IdTurmaOferta = c.IdTurmaOferta)
inner join PedidoVendaParticipante as e on (e.IdPedidoVendaItem = d.IdPedidoVendaItem)
inner join PedidoVenda as g on (g.IdPedidoVenda = d.IdPedidoVenda)
group by a.IdCurso) as b on (b.IdCurso = a.IdCurso)

select *
from #Temp_20160918_ProducaoAnual as a


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Lista_ProducaoDiaria]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************************
Autor            : Sueli Matsumoto                                                                      *
Procedure        : Spr_SageEducacao_Lista_ProducaoDiaria                                                          *
Data Criação     : 18/09/2016                                                                          *
Versao           : 1.1                                                                                 * 
Objetivo         : Relatório de produção Diária                                          *
Data             Autor           Alteração                                                             *

********************************************************************************************************/

--exec Spr_SageEducacao_Lista_ProducaoDiaria NULL, NULL, NULL, '20160704', NULL
CREATE procedure [dbo].[Spr_SageEducacao_Lista_ProducaoDiaria]
 
@Ano int = NULL,
@Mes int = NULL,
@RegiaoTreinamento int = NULL,
@DataInicio datetime = null,
@DataFim datetime = null
as 

--IF(@Ano IS NULL)
-- SET @Ano = YEAR(GETDATE())

--IF(@Mes IS NULL)
-- SET @Mes = MONTH(GETDATE())

--set @Ano = YEAR(GETDATE())
--set @Mes = MONTH(GETDATE())

-- 1. Selecão das Turmas

-- exec dbo.[Spr_SageEducacao_Lista_ProducaoDiaria] 2016, 9, 1

--Drop table #Temp_20160918_ProducaoDiaria
 
select 
b.IdTurma,
d.IdTurmaOferta, 
a.Titulo, 
convert(varchar(100), '') as TipoTurma, 
CodigoTurmaOferta as CodOferta, 
b.DataInicio, b.DataFim, 
g.Descricao as RegiaoTreinamento,
b.IdRegiaoTreinamento,
case when b.DisponivelParaVenda = 1 then 'Sim' else 'Não' end as DisponivelVenda,
h.Descricao as StatusTurma,
0 as Meta,
b.QtdeMinimaInscricao as Minimo,
b.Capacidade as Capacidade,
0 as Ativo,
0 as Passivo,
0 as Cortesia,
0 as Acumulado,
Convert(money,0) as VlrReceita
into #Temp_20160918_ProducaoDiaria
  From Curso as a 
  Inner Join Turma as b on (b.IdCurso = a.IdCurso) 
  Inner Join Formato as c on (c.IdFormato = b.IdFormato)
  Inner Join TurmaOferta as d on (d.IdTurma = b.IdTurma) 
  inner join RegiaoTreinamento as e on (e.IdRegiaoTreinamento = b.IdRegiaoTreinamento)
  inner join Municipio as f on (f.IdMunicipio = e.IdMunicipio)
  inner join Estado as g on (g.IdEstado = f.IdEstado)
  inner join Status as h on (h.IdStatus = b.IdStatus)
where (YEAR(b.DataInicio) = @Ano OR @Ano  IS NULL)
and (MONTH(b.DataInicio) = @Mes OR @Mes  IS NULL)
--AND (e.IdRegiaoTreinamento = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
AND (g.IdEstado = @RegiaoTreinamento OR @RegiaoTreinamento IS NULL )
and  b.DataInicio between ISNULL(@DataInicio, b.DataInicio)  and ISNULL(@DataFim, b.DataInicio)

-- > '2016-09-15'

--and  b.DataInicio > '2016-09-15'


-- 2. Preenchendo o Tipo de Turma

--drop table #Temp_20160918_TipoTurma

select * into #Temp_20160918_TipoTurma from TipoTurma

declare @MinimoTipoTurma int

select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

while exists (select * from #Temp_20160918_TipoTurma )
begin 

update c set TipoTurma = TipoTurma + case when TipoTurma > '' then ' , ' else '' end + a.Descricao 
from TipoTurma as a
inner join TurmaTipoTurma as b on (b.IdTipoTurma = a.IdTipoTurma)
inner join #Temp_20160918_ProducaoDiaria as c on (c.IdTurma = b.IdTurma)
where a.IdTipoTurma = @MinimoTipoTurma
delete #Temp_20160918_TipoTurma  where IdTipoTurma = @MinimoTipoTurma
select @MinimoTipoTurma = MIN(IdTipoTurma) from #Temp_20160918_TipoTurma 

end 


-- 3. Preenchendo a quantidade e o valor da Receita

update A set Ativo = QtdAtivo,
             Passivo = QtdPassivo,
             Cortesia = QtdCortesia,
Acumulado = QtdAcumulado,
VlrReceita = b.VlrReceita
from #Temp_20160918_ProducaoDiaria as a
inner join (select a.IdTurmaOferta, 
sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda < 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdAtivo,
sum(case when c.IdTipoSituacao IN ( 1, 3)  and CodigoPedidoVenda > 7000000 and isnull(c.Valor, 0) <> 0 then 1 else 0 end )as QtdPassivo,
sum(case when c.IdTipoSituacao IN ( 1, 3)  and isnull(c.Valor, 0) = 0 then 1 else 0 end )as QtdCortesia,
sum(1) as QtdAcumulado,
SUM( c.Valor) as VlrReceita
from #Temp_20160918_ProducaoDiaria as a
inner join PedidoVendaItem as b on (b.IdTurmaOferta = a.IdTurmaOferta)
inner join PedidoVendaParticipante as c on (c.IdPedidoVendaItem = b.IdPedidoVendaItem)
left outer join TipoSituacao as d on (d.IdTipoSituacao = c.IdTipoSituacao)
inner join PedidoVenda as e on (e.IdPedidoVenda = b.IdPedidoVenda)
group by a.IdTurmaOferta, c.IdTipoSituacao) as b on (b.IdTurmaOferta = a.IdTurmaOferta)

select *
from #Temp_20160918_ProducaoDiaria as a
order by RegiaoTreinamento


GO
/****** Object:  StoredProcedure [dbo].[spr_SageEducacao_SelecionaCancelamentosCursos]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************************************
*  COORDENADOR: Sueli Matsumoto
*  DESENVOLVEDOR: Fabio Luz
*  DATA DE CRIAÇÃO: 31/08/2016
*  NOME: spr_SageEducacao_SelecionaCancelamentosCursos
*  OBS: Seleciona Cancelamento da Turma
*  
**************************************************************************************************/
CREATE PROCEDURE [dbo].[spr_SageEducacao_SelecionaCancelamentosCursos] 
(
@IdStatus int
)  
AS  
   SET NOCOUNT ON  

/***** Cria tabela temporaria *****/
CREATE TABLE #TurmaCancelada
(
IdTurma int,
IdCurso int,
MotivoCancelamento varchar(256),
InformacaoData varchar(256),
DataInicialPrevista SMALLDATETIME
)

/***** Insere Turmas canceladas para execução *****/
INSERT INTO #TurmaCancelada
SELECT 
tur.IdTurma, IdCurso, MotivoCancelamento, InformacaoData, CONVERT(varchar, ISNULL(MIN(td.Data), GETDATE()), 103) as DataInicialPrevista
FROM 
Turma tur (nolock)
LEFT JOIN TurmaData td
ON tur.IdTurma = td.IdTurma
where 
tur.[IdStatus] = @IdStatus
GROUP BY 
tur.IdTurma, IdCurso, MotivoCancelamento, InformacaoData

/***** Bloqueia Turmas canceladas *****/
UPDATE 
trm
SET 
[IdStatus] = 9,
DataIntegracao = GETDATE()
FROM 
Turma trm
INNER JOIN #TurmaCancelada tc
ON trm.IdTurma = tc.IdTurma

/***** Retorna Informacoes para gerar os tickets ******/
SELECT 
trm.IdTurma as IdTurma,
trm.IdCurso as IdCurso,
cur.CodigoCurso as CodigoCurso,
cur.Titulo as TituloCurso,
trm.InformacaoData as InformacaoData,
trm.DataInicialPrevista as DataInicialPrevista,
CAST(fat.Cliente_id as BigInt) as CompanyID,
CAST(ordDet.Contato_id as BigInt) as Contact_Id,
CAST(fat.Fatura_Id as BigInt) as Fatura_Id,
CAST(ordDet.Product_Id as BigInt) as Product_Id,
CAST(fatItem.TAB_FaturaItens_Id as BigInt) as FaturaIten_Id,
fatItem.int_FatItens_ItemIdUnisys as IdItemUnisys,
First_Name as Contact_nome,
DDD as Contact_fone_DDD,
Phone as Contact_fone,
contact.Email as Email,
Zip as Cep_Logradouro,
ISNULL(trm.MotivoCancelamento, '') + ' - Informar cliente sobre o cancelamento da turma: ' + Cast(trm.IdTurma AS varchar) as Problema
FROM       
#TurmaCancelada trm (nolock)
inner join TurmaOferta tuf (nolock) on tuf.IdTurma = trm.IdTurma
inner join PedidoVendaItem pvi (nolock) on tuf.IdTurmaOferta = pvi.IdTurmaOferta
inner join PedidoVenda pv (nolock) on pvi.IdPedidoVenda = pv.IdPedidoVenda
Inner join CRM_ED..Fatura fat (nolock) on pv.CodigoPedidoVenda = fat.NR_Pedido
Inner Join CRM_ED..TAB_FaturaItens (nolock) as fatItem on (fat.Numero = fatItem.int_FatItens_FaturaId)  
Inner Join CRM_ED..order_ (nolock) as ord on (fat.nr_Pedido = ord.Order_Number)
Inner Join CRM_ED..Order_Detail (nolock) as ordDet on (ord.order__id = ordDet.order__id And fatItem.bn_FatItens_Product_Id_pk  = ordDet.Product_Id)
INNER JOIN CRM_ED..Contact contact (nolock) on ordDet.Contato_id = contact.Contact_Id
INNER JOIN Curso cur (nolock) ON trm.IdCurso = cur.IdCurso

DROP TABLE #TurmaCancelada


GO
/****** Object:  StoredProcedure [dbo].[Spr_SageEducacao_Update_CursoTurma]    Script Date: 23/04/2018 22:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************************          
*  COORDENADOR: Sueli Tanimoto          
*  DESENVOLVEDOR: Roberto Junior
*  DATA DE CRIAÇÃO: 06/06/2016          
*  NOME: Spr_SageEducacao_Update_CursoTurma
*  OBS:  Lista o cadastro de municípios
*                
*  DATA          /        DESENVOLVEDOR          /      ALTERAÇÃO   
*  
**************************************************************************************************************/          

Create Proc [dbo].[Spr_SageEducacao_Update_CursoTurma]  
@CodigoTurmaOferta Varchar(20)
As

Declare
--Variaveis Para Log
@Log_Id_Big BIGINT,
@Log_Id BINARY(8),
@Descricao VARCHAR(1000),
@Valor VARCHAR(100),
--Variaveis genéricas
@User BINARY(8), -- Id do usuário Carga
@SucessoErro int, -- Indica se a procedure foi executada com sucesso. 0 (zero) -> Erro, 1 -> Sucesso
--@QtdeAlvo int, -- Quantidade de registros alvo
@QtdeSucUpdate int,-- Quantidade de registros atualizados com sucesso
@QtdeSucInsertTemp int, -- Quantidade de registros inseridos com sucesso na tabela ##temp_carga_Prod
@QtdeSucInsertDestino int, -- Quantidade de registros inseridos com sucesso na tabela de Destino
@QtdeErro int, --  Quantidade de registros com erro
@QtdeInativo int, -- Quantidade de registros marcados como inativos
@ErroSql int, -- Erro retornado do SQL
@DataHora datetime, -- Data hora que será usada nos campos Rn_Create_Date e Rn_Edit_Date
@cmd varchar(5000), -- Para armazenar a instrução de insert na tabela temporária
-- Duas variavies para verificar o Last_id usado
@Id_BigIntMax BigInt, -- Id do Pivotal da tabela de destino em formato BigInt para ser usado na instrução de insert na tabela destino
@Id_BigIntRsys BigInt -- Id do Pivotal da tabela Rsys_Last_Id em formato BigInt para ser usado na instrução de insert na tabela destino



SET @QtdeSucUpdate = 0
SET @QtdeSucInsertTemp = 0
SET @QtdeSucInsertDestino = 0
SET @QtdeErro = 0
SET @DataHora = getdate()
Select @User = Users_id from Users where login_name='Carga'


--Declare @CodigoTurmaOferta Varchar(20)
--Set @CodigoTurmaOferta = 'IMPA800042'
--Select * from SageEducacaoProdutos


Delete SageEducacaoProdutos

Insert Into SageEducacaoProdutos (
IdCurso,  
CodigoTurma,   
CodigoCurso,
Titulo,    
FormatoDescricao,
FormatoId,
NetIob,      
Grupo1,     
Grupo2,      
OcProtec,    
OcRetroativo,
OcLicenca,   
OcRede,      
OcMail,      
OcRenovacao, 
RecPasta,    
TipoProduto, 
OCConTelefone,
OCConFax,    
OCConEmail,  
DataInicio,  
DataFim,     
Familia,  
ativo, 
EstoqueControlado, 
ProdArea,         
UltimaEdicao,     
UltimoSuplemento, 
CmlProd,          
AcessoSimult,     
Licenca,          
ConsultaWeb,      
ProdutoidRede,    
ExigeTribEstadual, 
ExigeUsuAdm,       
ExigeEmail,        
LiberadoCampanha,  
TpAcesso,           
TpRateio,          
ProdOrigem,        
AcSiteAssinante,   
Valor, 
WelcomeNova, 
WelcomeRen,  
LibSar,
LibRenova, 
LibTmk, 
LibLoja, 
QtdeMinimaInscricao,
QtdeMesesVig,    
QtdeAcSimultDe,  
QtdeAcSimultAte, 
IdAreaTematica,  
ProdutoIDPrinc,  
CodProdPrinc,    
QtdeConsultaTel, 
TpDependencia,   
CodProdTxAdesao, 
ModAssinatura,   
InformacaoHorario, 
IdTipoTurma,     
LocalCurso,      
IdTipoCurso,     
DataHoraPalestra, 
DuracaoCurso,     
NomeLink,       
StatusPalestra, 
TipoPalestra,   
IdVideo,        
CodigoPacotes,  
TemRetencao,
Description,
Product_Cost,
Origem_nacionalidade,
bl_product_coml,
DataAtualizacao,
DataIntegracao) 
Select DISTINCT
  a.IdCurso,
  e.CodigoTurmaOferta,
  a.CodigoCurso,
  a.Titulo,
  c.Descricao, -- Descrição Formato (Midia) 
  c.IdFormato, 
  0, -- (Marcado com X ????)          (Netiob) 
  'CUR' as Grupo1, -- (grupo1)
  'Cursos' as Grupo2, --  (grupo2)
  ' ' as OcProtec, -- (OcProtec)
  ' ' as OcRetroativo, -- (OcRetroativo)
  ' ' as OcLicenca, -- (OcLicenca)
  ' ' as OcRede, -- (OcRede)
  ' ' as OcMail, -- (OcMail)
  ' ' as OcRenovacao, -- (OcRenovacao)
  ' ' as RecPasta, -- (RecPasta)
  0 as TipoProduto, -- (TipoProduto) 
  ' ' as OCConTelefone, -- (OCConTelefone)
  ' ' as OCConFax, -- (OCConFax)
  ' ' as OCConEmail, -- (OCConEmail)
  Convert(Varchar(10),e.DataInicio,112) as DataInicio,
  Convert(Varchar(10),e.DataFim,112) as DataFim,  
  'EDUCACAO PROFISSIONAL' as Familia, 
  1 as bl_produtos_ativo,
  0 as bl_produtos_EstoqueControlado,
  1 as int_produtos_ProdArea,
  0 as int_produtos_UltimaEdicao,
  0 as int_produtos_UltimoSuplemento,
  1 as int_produtos_CmlProd,
  0 as int_produtos_AcessoSimult,
  0 as int_produtos_Licenca,
  0 as int_produtos_ConsultaWeb,
  0 as int_produtos_ProdutoidRede,
  0 as int_produtos_ExigeTribEstadual,
  0 as int_produtos_ExigeUsuAdm,
  0 as int_produtos_ExigeEmail,
  0 as int_produtos_LiberadoCampanha,
  0 as int_produtos_TpAcesso, 
  0 as int_produtos_TpRateio,
  0 as int_produtos_ProdOrigem,
  0 as int_produtos_AcSiteAssinante,
  f.Valor as my_produtos_VlrProd,
  '' as str_produtos_WelcomeNova,
  '' as str_produtos_WelcomeRen,
  '' as Str_produtos_LibSar,
  '' as Str_produtos_LibRenova,
  'S' as Str_produtos_LibTmk,
  '' as Str_produtos_LibLoja,  -- Verificar se todos produtos serão carregados na loja 
  QtdeMinimaInscricao, -- as int_produtos_Qtde_SaldoEstimado,
  0 as int_produtos_QtdeMesesVig,
  0 as int_produtos_QtdeAcSimultDe,
  0 as int_produtos_QtdeAcSimultAte,
  999, --i.IdAreaTematica, --int_produtos_Categoria  Area Tematica (b.CRCD_AREA as int_produtos_Categoria)
  0 as int_produtos_ProdutoIDPrinc,
  a.codigoCurso as str_produtos_CodProdPrinc,
  0 as int_produtos_QtdeConsultaTel,
  0 as str_produtos_TpDependencia,
  0 as str_produtos_CodProdTxAdesao,
  0 as int_produtos_ModAssinatura,
  e.InformacaoHorario, --,str_produtos_DataHoraCurso (POR ENQUANTO ESTA NO INSTRUTOR - ESTA INFORMAÇÃO DEVE ESTA NA TURMAOFERTA)
  h.IdTipoTurma,-- as int_produtos_TurnoCurso (Evandro esta Verificando)
  m.Descricao, --str_produtos_LocalCurso  
  'FORMAÇÃO',--n.IdTipoCurso,  --int_produtos_TpCurso
  0 as DataHoraPalestra,
  0 as DuracaoCurso,
  'teste link ' as NomeLink, -- (Turma) Evandro esta verificando
  0 as StatusPalestra,
  0 as TipoPalestra,
  0 as IdVideo,
  '   ,   ,   ,   ,   ' as CodigoPacotes,
  1 as TemRetencao,
  c.Descricao,
  f.Valor,
  'SAO PAULO' as Origem_nacionalidade,
  1 as bl_product_coml,
  GETDATE(),
  '1900-01-01' 
  From Sage_Educacao..Curso as a
  inner Join Sage_Educacao..CursoModulo as b on (a.IdCurso = b.IdCurso)
  Inner Join Sage_Educacao..Turma as d on (a.IdCurso = d.IdCurso)
  Inner Join Sage_Educacao..Formato as c on (c.IdFormato = d.IdFormato) 
  Inner Join Sage_Educacao..TurmaOferta as e on (d.IdTurma = e.IdTurma) 
  left Join  Sage_Educacao..TurmaOfertaValor as f on (e.IdTurmaOferta = f.IdTurmaOferta)
  Inner Join Sage_Educacao..TurmaCursoModulo as g on (d.IdTurma = g.IdTurma)  
  Inner Join Sage_Educacao..TipoTurma h on (d.IdTipoTurma = h.IdTipoTurma) 
  ----Inner Join Sage_Educacao..AreaTematica as i on (a.AreaTematica_IdAreaTematica = i.IdAreaTematica) ---- Verificar Area Tematica 
  Inner Join Sage_Educacao..RegiaoTreinamento as l on (d.IdRegiaoTreinamento = l.IdRegiaoTreinamento)
  Inner Join Sage_Educacao..Municipio as m on (l.IdMunicipio = m.IdMunicipio) 
  --Inner Join Sage_Educacao..TipoCurso as n on (d.IdCurso = n.IdTipoCurso)
  Where  e.CodigoTurmaOferta = @CodigoTurmaOferta
  --Where  e.CodigoTurmaOferta in ('BLOC800040') --,'AJUS800037','AJUS800038')

  Set @QtdeSucInsertDestino = @@ROWCOUNT 

 


Update A 
Set a.Product_Name = Substring(b.Titulo,1,39),    
a.Rn_Descriptor = b.CodigoCurso + ' - ' + b.Titulo,  --Descricao,
a.NETIOB = b.NetIob,      
a.Grupo1 = b.Grupo1,     
a.Grupo2 = b.Grupo2,      
a.Gera_Protec = b.OcProtec,    
a.Produto_Retroativo = b.OcRetroativo,
a.Licenca = b.OcLicenca,   
a.Produto_Rede = b.OcRede,      
a.OC_Consulta_Email = Case When b.OcMail = '' Then 0 End,      
a.OC_Renovacao = b.OcRenovacao, 
a.RecPasta = b.RecPasta,    
a.TipoProduto = b.TipoProduto, 
a.OC_Consulta_Tel = b.OCConTelefone,
a.OC_Consulta_Fax = b.OCConFax,    
a.str_prod_VigenciaInicial = substring(b.datainicio,3,2) + substring(b.datainicio,5,2) + substring(b.datainicio,7,2),
a.str_prod_VigenciaFinal = substring(b.DataFim,3,2) + substring(b.DataFim,5,2) + substring(b.DataFim,7,2),
a.Familia = b.Familia,     
a.Inativo = b.ativo, 
a.str_prod_TpEstoqueControlado = b.EstoqueControlado, 
a.int_prod_ProdArea = b.ProdArea,         
a.int_prod_UltimaEdicao = b.UltimaEdicao,     
a.int_prod_UltimoSuplemento = b.UltimoSuplemento, 
a.int_prod_CmlProd = b.CmlProd,            
a.Produto_Licenca = b.Licenca,          
a.int_prod_ConsultaWeb = b.ConsultaWeb,      
a.Rede = b.ProdutoidRede,    
a.int_prod_ExigeTribEstadual = b.ExigeTribEstadual, 
a.int_prod_ExigeUsuAdm = b.ExigeUsuAdm,       
a.int_prod_ExigeEmail = b.ExigeEmail,        
a.int_prod_LiberadoCampanha = b.LiberadoCampanha,  
a.int_prod_TpAcesso = b.TpAcesso,           
a.int_prod_TpRateio = b.TpRateio,          
a.int_prod_ProdOrigem = b.ProdOrigem,        
a.int_prod_AcSiteAssinante = b.AcSiteAssinante,   
a.Product_Cost = 313.00, -- Product_Cost, -- valor 
a.str_produtos_WelcomeNova = b.WelcomeNova, 
a.str_produtos_WelcomeRen = b.WelcomeRen,  
a.str_produtos_LibSAR = b.LibSar,
a.str_produtos_LibRenova = b.LibRenova, 
a.str_produtos_LibTMK = b.LibTmk, 
a.str_produtos_LibNova = b.LibLoja, 
a.int_prod_QtdeMesesVig = b.QtdeMesesVig,    
a.int_prod_QtdeAcSimultDe = b.QtdeAcSimultDe,  
a.int_prod_QtdeAcSimultAte = b.QtdeAcSimultAte, 
a.int_prod_ProdutoIDPrinc = b.ProdutoIDPrinc,  
a.str_prod_CodProdPrinc = b.CodProdPrinc,     
a.str_prod_TpDependencia = b.TpDependencia,   
a.str_prod_CodProdTxAdesao = b.CodProdTxAdesao, 
a.int_prod_ModAssinatura = b.ModAssinatura,   
a.Carga_Horaria = b.InformacaoHorario,
a.DataHoraPalestra = b.DataHoraPalestra, 
a.DuracaoCurso    = b.DuracaoCurso,     
a.NomeLink = 'Teste Link', -- NomeLink,       
a.StatusPalestra = b.StatusPalestra, 
a.TipoPalestra = b.TipoPalestra,   
a.IdVideo = b.IdVideo,        
a.CodigoPacotes = b.CodigoPacotes,  
a.TemRetencao = b.TemRetencao,
a.Rn_Edit_Date = GETDATE(),
a.Rn_Edit_User = 0x000000000001853C,
a.bl_product_coml = b.bl_product_coml,
a.Origem_nacionalidade = b.Origem_nacionalidade,
a.Formato = b.FormatoId
From Product a
Inner Join SageEducacaoProdutos as b on (a.code_ = b.CodigoTurma)
Where b.CodigoTurma = @CodigoTurmaOferta


UPDATE B 
SET RN_EDIT_DATE = CONVERT(VARCHAR(10), GETDATE(), 112),
my_PVxProd_ValorBase = A.Product_Cost
FROM Product as a
Inner Join TAB_PVxProd as b on (a.product_id = bn_PVxProd_Product_Id_fk )
    WHERE a.Code_ = @CodigoTurmaOferta

/*

Exec Spr_SageEducacao_Update_CursoTurma 'BLOC800041'


GRANT EXECUTE ON [dbo].[Spr_SageEducacao_Update_CursoTurma] TO usr_infraprd



*/




GO



DECLARE @schemaName VARCHAR(30)
    , @procName VARCHAR(30)
    , @fullName VARCHAR(60)

-- Cursor para percorrer os nomes dos objetos 
DECLARE cursor_objects CURSOR FOR
    SELECT
          ROUTINE_SCHEMA
        , ROUTINE_NAME
    FROM
        INFORMATION_SCHEMA.ROUTINES
    WHERE
        ROUTINE_TYPE = 'PROCEDURE'

-- Abrindo Cursor para leitura
OPEN cursor_objects

-- Lendo a próxima linha
FETCH NEXT FROM cursor_objects INTO @schemaName, @procName

-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN

    SELECT @fullName = @schemaName + '.' + @procName

    EXEC sp_helptext @fullName

    -- Lendo a próxima linha
    FETCH NEXT FROM cursor_objects INTO @schemaName, @procName
END

-- Fechando Cursor para leitura
CLOSE cursor_objects

-- Desalocando o cursor
DEALLOCATE cursor_objects 