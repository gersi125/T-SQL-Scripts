USE AdventureWorks2012;
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
GO

BEGIN TRANSACTION 
SELECT * FROM HumanResources.Employee
WHERE Gender = 'Male'

SELECT request_session_id AS Session,
Resource_database_id AS DBID,
Resource_Type,
Request_Type AS Type,
Request_Mode AS Request_Mode,
Request_status AS Status
FROM sys.dm_tran_locks

ORDER BY [Session];
GO



-- THIS IS HOW TO CREATE A DEADLOCK--
DBCC TRACEON (1222,-1)
GO