USE [ConPat]
GO
/****** Object:  StoredProcedure [dbo].[NEW_BemItem_UPDATE_DataCessaoUso]    Script Date: 19/09/2018 18:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================  
-- Create date: 06/09/2018
-- alterado pr rafael sanchez - magna sistemas set 2018
-- anular o campo @bit_dataCessaoUso para ajuste no proceso de cessao de uso / cancelamento
-- ====================================================================  
alter PROCEDURE [dbo].[NEW_BemItem_Anula_DataCessaoUso]  
  @bem_id BIGINT  
  ,@bit_id INT

AS  
BEGIN  
 UPDATE BemItem   
 SET   
  bit_dataCessaoUso = null 
 WHERE   
  bem_id = @bem_id and bit_id = @bit_id
  
 RETURN ISNULL(@@ROWCOUNT,-1)  
   
END