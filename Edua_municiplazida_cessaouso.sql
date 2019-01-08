
use ConPat
update [dbo].[Unidade] set uni_situacao = 5 where uni_id in ( 2374, 4484);
update [dbo].[Unidade] set uni_ua = 44072  where uni_id in ( 10, 9, 8, 7, 6);

select top 10 * from [dbo].[Unidade] where uni_situacao = 5; -- uni_ua = 44072
select top 10 * from [dbo].[Unidade] where uni_id = 4908 ;


-- NEW_MovimentacaoBem_SelectBy_Operacao

NEW_MovimentacaoBem_SelectBy_Bem_idAndOperacao


NEW_BemItem_SelectBy_bem_id_bit_id