use test;

CREATE TABLE dbo.Table1 (
	id int PRIMARY KEY
	,number int
	,name nvarchar(10)
);


IF OBJECT_ID ('dbo.addRows', 'P') IS NOT NULL
	DROP PROCEDURE dbo.addRows;
GO
CREATE PROCEDURE dbo.addRows 
		@rowsNumber int
	AS
	BEGIN
		SET NOCOUNT ON
		-- start point for adding rows
		DECLARE @id INT = ISNULL((SELECT MAX(id) FROM dbo.Table1)+1, 1)
		DECLARE @iteration INT = 0
		WHILE @iteration < @rowsNumber
			BEGIN
				--get a random int from 0 to 100
				DECLARE @number INT = CAST(RAND()*100 AS INT)
				-- generate random nvarchar
				-- get a random nvarchar ascii char 65 to 128
				DECLARE @name NVARCHAR(10) = N'' --empty string for start
				DECLARE @length INT = CAST(RAND() * 10 AS INT) --random length of nvarchar
				WHILE @length <> 0 --in loop we will randomize chars till the last one
					BEGIN
						SELECT @name = @name + CHAR(CAST(RAND() * 63 + 65 as INT))
						SET @length = @length - 1 --next iteration
					END
				--insert data
				INSERT INTO dbo.Table1 (id, number, name)
				VALUES (@id, @number, @name)
				SET @iteration += 1
				SET @id += 1
			END
		SET NOCOUNT OFF
	END

	EXEC dbo.addRows 1000 --elapsed time ~0.11
	EXEC dbo.addRows 10000 --elapsed time ~1.1
	EXEC dbo.addRows 100000 --elapsed time ~9.64
	EXEC dbo.addRows 1000000 --elapsed time ~2:11.88


	select * from Table1 ;
