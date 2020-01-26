CREATE PROCEDURE dbo.InsertData @MemoryID INT =1
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS 
BEGIN ATOMIC WITH 
(TRANSACTION ISOLATION LEVEL = SNAPSHOT , Language = 'us_English')
WHILE @MemoryID < 500000
BEGIN
INSERT INTO dbo.MemoryTable 
VALUES (@MemoryID, GETDATE())
SET @MemoryID +=1
END
END;
GO


DELETE FROM dbo.MemoryTable;
GO
USE memdemo;
GO

EXEC  dbo.InsertData;
GO

SELECT * FROM dbo.MemoryTable;

