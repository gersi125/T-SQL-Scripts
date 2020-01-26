use tempdb;

CREATE TABLE dbo.PhoneLog
(PhoneLogID int IDENTITY (1,1),
LogRecord DATETIME2 NOT NULL,
PhoneNumberCalled nvarchar(80),
CallDurations INT 
);

GO

SELECT * FROM dbo.PhoneLog;

DROP TABLE dbo.PhoneLog;
GO

--Now we recreate the table with indexes

CREATE TABLE dbo.PhoneLog
(PhoneLogID int IDENTITY (1,1) PRIMARY KEY,
LogRecord DATETIME2 NOT NULL,
PhoneNumberCalled nvarchar(80),
CallDurations INT 
);
GO

SELECT * FROM sys.indexes WHERE OBJECT_NAME(object_id) = N'Phonelog';
GO

CREATE TABLE dbo.Books
(ISBN nvarchar (20) PRIMARY KEY,
Title nvarchar (100) NOT NULL,
ReleaseDate date NOT NULL,
PublisherID int NOT NULL) ;
GO

SELECT * FROM sys.index_columns ;
GO

USE master;
GO

CREATE DATABASE demodb;
GO

USE demodb;
GO

CREATE TABLE dbo.PhoneLog
(PhoneLogId int IDENTITY(1,1) PRIMARY KEY,
LogRecord datetime2 NOT NULL ,
PhoneNumberCalled nvarchar(100) NOT NULL,
CallDuration int NOT NULL
);
GO

CREATE NONCLUSTERED INDEX IX_LogRecord
ON dbo.PhoneLog(LogRecord);
GO

SET NOCOUNT ON ;
GO
DECLARE @counter int = 0;
WHILE @counter<10000
BEGIN
INSERT dbo.PhoneLog(LogRecord,PhoneNumberCalled,CallDuration)
VALUES (SYSDATETIME(),'999-9999',CAST(RAND()*1000 AS int));
SET @counter += 1;
END;

SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(),Object_ID ('dbo.PhoneLog'),NULL,NULL,NULL);

GO

SELECT * FROM sys.dm_db_index_operational_stats(db_id(),NULL,NULL,NULL) A


SELECT CONVERT (varchar(120), object_name(ios.object_id)) AS [Object Name], i.[name] AS [Index Name],
SUM(ios.range_scan_count + ios.singleton_lookup_count) AS 'Reads',
SUM(ios.leaf_insert_count + ios.leaf_update_count + ios.leaf_delete_count) AS 'Writes'
FROM
sys.dm_db_index_operational_stats(db_id(),NULL,NULL,NULL) ios
INNER JOIN sys.indexes i
ON i.object_id=ios.object_id
AND i.index_id=ios.index_id
WHERE 
OBJECTPROPERTY(ios.object_id,'IsUserTable')=1
GROUP BY OBJECT_NAME(ios.object_id), i.name
ORDER BY Reads ASC ,Writes DESC;
GO
