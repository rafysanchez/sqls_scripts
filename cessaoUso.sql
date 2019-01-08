-- Eduardo compat  - ajuste de cessao de uso

-- criacao do campo em BemItem >> bit_CesaoUso
-- MovimentacaoBemBO.CessaoAutomatica

alter table [dbo].[BemItem]
add bit_CesaoUso bit not null default 0;  

select * from [dbo].[BemItem];


