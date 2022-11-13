USE AdventureWorksLT2012
GO

SELECT [CompanyName], [LastName] 
FROM [SalesLT].[Customer];
GO

SELECT [CompanyName], [LastName] as Nazwisko
FROM [SalesLT].[Customer]
WHERE Nazwisko ='Gee';
GO


SELECT [CompanyName], [LastName] 
FROM [AdventureWorksLT2012].[SalesLT].[Customer];
GO

SELECT [CompanyName], [LastName] 
FROM [Customer];
GO

SELECT SystemInformationID,[Database Version]
FROM [BuildVersion];

SELECT [LastName], [FirstName]
FROM [SalesLT].[Customer];
GO

SELECT [FirstName], [LastName]
FROM [SalesLT].[Customer];
GO

SELECT *
FROM [SalesLT].[ProductCategory];

SELECT [SalesOrderID],[LineTotal]
FROM [SalesLT].[SalesOrderDetail];
GO

SELECT [ProductID]
FROM [SalesLT].[SalesOrderDetail];

SELECT ALL [ProductID]
FROM [SalesLT].[SalesOrderDetail];

SELECT DISTINCT [ProductID]
FROM [SalesLT].[SalesOrderDetail];

SELECT DISTINCT [ProductID],[SalesOrderID]
FROM [SalesLT].[SalesOrderDetail];
GO

SELECT [Name], [ListPrice], [ListPrice]*5
FROM [SalesLT].[Product];
GO

SELECT [ListPrice] - [StandardCost] * [Weight]
FROM [SalesLT].[Product];
GO

SELECT ([ListPrice] - [StandardCost]) * [Weight]
FROM [SalesLT].[Product];
GO

SELECT [ProductNumber], [Color], [ProductNumber] + ' ' + [Color]
FROM [SalesLT].[Product];
GO

SELECT [ProductNumber], [Color], CONCAT([ProductNumber],[Color])
FROM [SalesLT].[Product];
GO

SELECT '1'+1+'1', '1'+'1'+1;
GO

SELECT [ProductNumber] + [ListPrice]
FROM [SalesLT].[Product];
GO

SELECT [ProductNumber] + CAST([ListPrice] AS VARCHAR(15))
FROM [SalesLT].[Product];
GO

SELECT [ListPrice],
	CASE
		WHEN [ListPrice] <10 THEN 'Tani'
		WHEN [ListPrice] <50 THEN '�rednia p�ka'
		ELSE 'Drogi'
	END
FROM [SalesLT].[Product];
GO

SELECT [Name] AS [Nazwa Produktu], [ListPrice] - [StandardCost] AS Zysk
FROM [SalesLT].[Product];
GO

SELECT [ListPrice], ROUND([ListPrice],0) AS [W Zaokr�gleniu]
FROM [SalesLT].[Product];
GO

SELECT P.[ListPrice], ROUND([ListPrice],0) AS [W Zaokr�gleniu]
FROM [SalesLT].[Product] AS P;
GO

SELECT [SalesLT].[Product].[ListPrice], ROUND([ListPrice],0) AS [W Zaokr�gleniu]
FROM [SalesLT].[Product] AS P;
GO

SELECT 'Zam�wienie ' + CAST([SalesOrderID] AS CHAR(5)) + ' zosta�o z�o�one w roku ' + CONVERT(CHAR(4),DATEPART(YEAR,[OrderDate]))
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT [ProductNumber], GETDATE(), RAND()
FROM [SalesLT].[Product];

SELECT [ProductNumber], NEWID()
FROM [SalesLT].[Product];
GO

SELECT [Name],[ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice];
GO

SELECT [Name],[ListPrice]
FROM [SalesLT].[Product]
ORDER BY 2;
GO

SELECT [Name],[ListPrice]
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC;
GO

SELECT [ProductNumber], [Color],[ListPrice]
FROM [SalesLT].[Product]
ORDER BY [Color] DESC,[ListPrice];
GO

SELECT [Color]
FROM [SalesLT].[Product]
ORDER BY [ListPrice];
GO

SELECT imie
FROM imiona
ORDER BY imie;
GO

SELECT imie
FROM imiona
ORDER BY imie COLLATE Polish_BIN;
GO

