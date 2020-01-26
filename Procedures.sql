USE AdventureWorks2012;
GO

CREATE PROC Production.GetBlueProducts
AS
BEGIN
SELECT p.ProductID, p.Name, p.Size 
FROM Production.Product AS p
WHERE p.Color = N'BLUE'
END;
GO

EXEC Production.GetBlueProducts;
GO

--Let us now create a procedure with two select statements in it --

CREATE PROC Production.GetBlueProductsAndModel
AS
BEGIN
SELECT p.ProductID, p.Name, p.Size 
FROM Production.Product AS p
WHERE p.Color = N'BLUE'

SELECT p.ProductID, pm.ProductModelID , pm.Name AS ModelName
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
Order BY p.ProductID, pm.ProductModelID;
END;
GO

EXEC Production.GetBlueProductsAndModel;
GO


SELECT SCHEMA_NAME(schema_id)  AS SchemaName,
name AS ProdcedureName
FROM sys.procedures;
GO


DROP PROC Production.GetBlueProducts ;
DROP PROC Production.GetBlueProductsAndModel;
GO

CREATE PROC Production.GetBlueProductsAndModels
@Color nvarchar (15)
AS 
BEGIN
SELECT p.productid, p.name, p.size, p.listprice 
FROM Production.Product AS p
WHERE p.Color = @Color
ORDER BY p.ProductID;


SELECT p.productid, pm.productmodelid, pm.Name AS ModelName
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductID = pm.ProductModelID
WHERE p.color = @Color
ORDER BY P.ProductID,pm.ProductModelID
END;
GO 

-- Now we test the procedures with passing parameters

EXEC  Production.GetBlueProductsAndModels 'Red';
GO

ALTER PROC Production.GetBlueProductsAndModels
@Color nvarchar (15)
AS 
BEGIN
SELECT p.productid, p.name, p.size, p.listprice 
FROM Production.Product AS p
WHERE (p.Color = @Color) OR ( p.color IS NULL AND @Color IS NULL)
ORDER BY p.ProductID;


SELECT p.productid, pm.productmodelid, pm.Name AS ModelName
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductID = pm.ProductModelID
WHERE (p.color = @Color) OR ( p.color Is NULL AND @Color IS NULL)
ORDER BY P.ProductID,pm.ProductModelID
END;
GO 

EXEC Production.GetBlueProductsAndModels NULL;
GO
------------------------------------------------------------------------------------------------

