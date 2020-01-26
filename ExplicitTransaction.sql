USE AdventureWorks2012;
GO


CREATE TABLE dbo.SimpleOrders(
orderid int IDENTITY (1,1) NOT NULL PRIMARY KEY,
custid int NOT NULL FOREIGN KEY REFERENCES Sales.Customer(customerid),
empid int NOT NULL FOREIGN KEY REFERENCES HumanResources.Employee(BusinessEntityID),
orderdate datetime NOT NULL
)
GO

CREATE TABLE dbo.SimpleOrderDetails
( orderid int NOT NULL FOREIGN KEY REFERENCES dbo.SimpleOrders(orderid),
productid int NOT NULL FOREIGN KEY REFERENCES Production.Product(productid),
unitprice money NOT NULL,
quantity smallint NOT NULL,
CONSTRAINT PK_OrderDetails PRIMARY KEY (orderid, productid)
)
GO

BEGIN TRANSACTION 
BEGIN TRY 
INSERT INTO dbo.SimpleOrders ( orderid, custid, empid, orderdate)
VALUES (123, 34, 1, '2016-10-10');
INSERT INTO dbo.SimpleOrderDetails (orderid, productid, unitprice, quantity) 
VALUES (123, 1, 34, 2300)
COMMIT TRANSACTION
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrNum, ERROR_MESSAGE() AS ErrMsg;
ROLLBACK TRANSACTION
END CATCH;
