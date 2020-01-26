USE AdventureWorks2012;
GO

CREATE FUNCTION Sales.LastOrdersByCustomers (@CustomerID int, @NumberOfOrder int)
RETURNS TABLE 
AS
RETURN
(SELECT TOP (@NumberOfOrder)
soh.SalesOrderID,
soh.OrderDate,
soh.PurchaseOrderNumber
FROM Sales.SalesOrderHeader AS soh 
WHERE soh.CustomerID = @CustomerID
ORDER BY SOH.OrderDate DESC);
GO

SELECT * FROM Sales.LastOrdersByCustomers(120,33);
GO