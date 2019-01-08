CREATE table InsertTable
(
      IDCol INT IDENTITY (1,1),
      ColVal INT
)


GO


DECLARE @Counter INT


SET @Counter = 1


WHILE @Counter < 15000


BEGIN


    INSERT INTO InsertTable
        (ColVal)


    SELECT DATEPART(ms, GETDATE())


    SET @Counter = @Counter + 1


END

-- alternativa

DECLARE @Counter INT
SET @Counter = 1


BEGIN TRAN


WHILE @Counter < 15000


BEGIN


      INSERT INTO InsertTable(ColVal)


      SELECT DATEPART(ms, GETDATE())


      SET @Counter = @Counter + 1


END


COMMIT TRAN