CREATE DATABASE demodb
GO
USE demodb;
GO


CREATE TABLE dbo.Customer 
( CustomerID int IDENTITY (1,1) PRIMARY KEY,
  CustomerName nvarchar (50) NOT NULL );

  INSERT dbo.Customer
  VALUES ('Jared Letto'), ('Adam Levine'), ('Kylie Minogue');
  GO

  CREATE TABLE dbo.CustomerOrder
  ( CustomerOrderID int IDENTITY (100001,1) PRIMARY KEY,
    CustomerID int NOT NULL FOREIGN KEY REFERENCES dbo.Customer (CustomerID),
	OrderAmount decimal (18,2) );

	SELECT * FROM dbo.Customer;
	GO;

	INSERT INTO dbo.CustomerOrder (CustomerID,OrderAmount)
	VALUES 
	(1,23.50), (2,66.00), (3,55.66);

	SELECT * FROM dbo.CustomerOrder
	GO;

	DELETE FROM Customer WHERE CustomerID =1 ;
	GO

	ALTER TABLE dbo.CustomerOrder
	DROP CONSTRAINT FK__CustomerO__Custo__25869641;
	GO

	ALTER TABLE dbo.CustomerOrder
	ADD CONSTRAINT FK_CustomerO_Custo_CustoID FOREIGN KEY (CustomerID) REFERENCES dbo.Customer (CustomerID)
	ON DELETE CASCADE;
	GO

	DELETE FROM Customer WHERE CustomerID = 1
	go

	SELECT * FROM dbo.CustomerOrder;
     GO

	CREATE SCHEMA Reporting AUTHORIZATION dbo;
	GO

	CREATE SCHEMA Operations AUTHORIZATION dbo
	CREATE TABLE Flights 
	(FlightID int IDENTITY (1,1) PRIMARY KEY ,
	Origin nvarchar (3),
	Destination nvarchar (3));
	GO

	DROP TABLE Operations.Flights
	GO
	DROP SCHEMA Operations
	GO

