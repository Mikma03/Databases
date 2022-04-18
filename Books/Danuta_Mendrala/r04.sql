USE AdventureWorksLT2012
GO

SELECT ProductNumber, ListPrice
FROM [SalesLT].[Product]
WHERE [ListPrice]<10;
GO

SELECT ProductNumber, ListPrice
FROM [SalesLT].[Product]
WHERE [ListPrice]>3500;
GO

SELECT [Name], [SellStartDate]
FROM [SalesLT].[Product]
WHERE [SellStartDate]>'20070601'
ORDER BY [SellStartDate] DESC;
GO

SELECT [Name], [SellStartDate]
FROM [SalesLT].[Product]
WHERE YEAR([SellStartDate]) = 2007
ORDER BY [SellStartDate] DESC;
GO

SELECT [ProductNumber], [StandardCost], [ListPrice]
FROM [SalesLT].[Product]
WHERE [StandardCost]*2<[ListPrice];
GO

SELECT [ProductNumber], [Size]
FROM [SalesLT].[Product]
WHERE [Size] IN ('44','48','50');
GO

SELECT [ProductNumber],[Color]
FROM [SalesLT].[Product]
WHERE [Color] IN ('Black', 'Red');
GO

SELECT [ProductNumber], [ListPrice]
FROM [SalesLT].[Product]
WHERE [ListPrice] BETWEEN 10 AND 20;
GO

SELECT [SalesOrderID], [OrderDate]
FROM [SalesLT].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN '20140101' AND '20140630';
GO

SELECT [LastName]
FROM [SalesLT].[Customer]
WHERE LEFT([LastName],1) BETWEEN 'B' AND 'D';
GO

SELECT [ProductID], [Name]
FROM [SalesLT].[Product]
WHERE [Name] LIKE 'S%';
GO

SELECT [ProductID], [Name]
FROM [SalesLT].[Product]
WHERE [Name] LIKE 'S%L';
GO

SELECT [ProductID], [ProductNumber]
FROM [SalesLT].[Product]
WHERE [ProductNumber] LIKE 'S_-M%';
GO

SELECT [ProductNumber]
FROM [SalesLT].[Product]
WHERE  [SellEndDate] IS NULL;
GO


SELECT [Name]
FROM [SalesLT].[Product]
WHERE [ProductCategoryID] IN (5,16,19)
AND [SellEndDate] IS NOT NULL
AND [Color] = 'Black'
OR [ListPrice]<50;
GO

SELECT *
FROM [SalesLT].[Customer]
WHERE NOT [CompanyName] ='A Bike Store'
AND [CustomerID]>100
ORDER BY [CompanyName],[CustomerID];
GO

SELECT *
FROM [SalesLT].[Customer]
WHERE NOT ([CompanyName] ='A Bike Store'
AND [CustomerID]>100)
ORDER BY [CompanyName],[CustomerID];
GO

SELECT [ProductCategoryID], [ListPrice], [StandardCost]
FROM [SalesLT].[Product]
WHERE NOT (([StandardCost] > 20 AND [ProductCategoryID] =1)
OR [ListPrice] BETWEEN 10 AND 20);
GO

SELECT TOP 1 [Name], [ListPrice]
FROM [SalesLT].[Product];
GO

SELECT TOP 1 [Name], [ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC;
GO

SELECT TOP 3 [Name], [ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC, [ProductID];
GO

SELECT TOP 3 WITH TIES [Name], [ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC;
GO

SELECT TOP 5 PERCENT WITH TIES [Name], [ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC;
GO

SELECT [Name], [ProductModelID]
FROM [SalesLT].[Product]
ORDER BY [ProductModelID];
GO

SELECT [Name], [ProductModelID]
FROM [SalesLT].[Product]
ORDER BY [ProductModelID] 
	OFFSET 5 ROWS;
GO

SELECT [Name], [ProductModelID]
FROM [SalesLT].[Product]
ORDER BY [ProductModelID] 
    OFFSET 3 ROWS
    FETCH NEXT 5 ROWS ONLY;

SELECT [Name], [ProductModelID]
FROM [SalesLT].[Product]
ORDER BY [ProductModelID] 
    OFFSET 5 ROWS
    FETCH NEXT 10 ROWS ONLY;
    

DECLARE @Strona tinyint = 5
      , @Bie��ca tinyint = 2;
SELECT [Name], [ProductModelID]
FROM [SalesLT].[Product]
ORDER BY [ProductModelID] 
    OFFSET (@Strona * (@Bie��ca - 1)) ROWS
	FETCH NEXT @Strona ROWS ONLY;
GO
