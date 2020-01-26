USE master;
GO
DROP DATABASE demodb;
GO
CREATE DATABASE demodb;
GO
USE demodb;
GO

CREATE FUNCTION dbo.EndOfPreviousMonth (@DateToTest date)
RETURNS DATE
AS BEGIN
RETURN DATEADD(day, 0 -day(@DateToTest), @DateToTest);
END;
GO

SELECT dbo.EndOfPreviousMonth(SYSDATETIME());
GO

DROP FUNCTION dbo.EndOfPreviousMonth;
GO