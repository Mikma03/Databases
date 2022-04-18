﻿USE AdventureWorksLT2012
GO

SELECT [CustomerID]
FROM [SalesLT].[SalesOrderHeader]
WHERE [SalesOrderNumber] = 'SO71832';
GO

SELECT [CompanyName], [FirstName],[LastName], [EmailAddress]
FROM [SalesLT].[Customer]
WHERE [CustomerID] = 29922;
GO

SELECT [CompanyName], [FirstName],[LastName], [EmailAddress]
FROM [SalesLT].[Customer]
WHERE [CustomerID] =
	(SELECT [CustomerID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [SalesOrderNumber] = 'SO71832');
GO

SELECT AVG([ListPrice])
FROM [SalesLT].[Product];
GO

SELECT [Name], [ListPrice], [ListPrice] - 742.4952 AS [Różnica do średniej]
FROM [SalesLT].[Product];
GO

SELECT [Name], [ListPrice], [ListPrice] -
	(SELECT AVG([ListPrice])
	FROM [SalesLT].[Product]) AS [Różnica do średniej]
FROM [SalesLT].[Product];
GO

SELECT Z.[Name]
FROM [SalesLT].[Product] AS Z
WHERE Z.ListPrice = 
	(SELECT W.ListPrice - 1094.28
	FROM  [SalesLT].[Product] AS W
	WHERE W.ProductNumber = 'FR-R92R-58');
GO

SELECT [CustomerID]
FROM [SalesLT].[SalesOrderHeader]
WHERE DueDate = '2008-06-19 00:00:00.000';
GO

SELECT [CompanyName], [FirstName],[LastName], [EmailAddress]
FROM [SalesLT].[Customer]
WHERE [CustomerID] =
	(SELECT [CustomerID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE DueDate = '2008-06-19 00:00:00.000');
GO

SELECT [CompanyName], [FirstName],[LastName], [EmailAddress]
FROM [SalesLT].[Customer]
WHERE [CustomerID] IN
	(SELECT [CustomerID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE DueDate = '2008-06-19 00:00:00.000');
GO

SELECT [City]
FROM [SalesLT].[Address] AS Z
WHERE Z.AddressID IN 
	(SELECT [ShipToAddressID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [ShipDate] - [OrderDate]>7
	);
GO

SELECT [City]
FROM [SalesLT].[Address] AS Z
WHERE Z.AddressID IN 
	(SELECT [ShipToAddressID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [ShipDate] - [OrderDate]>365
	);
GO

SELECT [City]
FROM [SalesLT].[Address] 
WHERE AddressID IN 
	(SELECT [AddressID]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [ShipDate] - [OrderDate]>7
	);
GO

SELECT Z.[City]
FROM [SalesLT].[Address] AS Z
WHERE Z.AddressID IN 
	(SELECT W.[AddressID]
	FROM [SalesLT].[SalesOrderHeader] AS W
	WHERE W.[ShipDate] - W.[OrderDate]>7
	);
GO

SELECT Z.[FirstName],Z.[LastName]
FROM [SalesLT].[Customer] AS Z
WHERE Z.[CustomerID] IN
	(SELECT W1.[CustomerID]
	FROM [SalesLT].[SalesOrderHeader] AS W1
	WHERE W1.[SalesOrderID] IN 
		(SELECT W2.[SalesOrderID]
		FROM [SalesLT].[SalesOrderDetail]AS W2
		WHERE [UnitPriceDiscount] = 0.40 ));
GO

SELECT [LastName]
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON C.CustomerID=H.CustomerID
WHERE [TotalDue]>=100000
ORDER BY [LastName];
GO

SELECT [LastName]
FROM [SalesLT].[Customer] AS C
WHERE 10000 <= ANY
	(SELECT [TotalDue]
	FROM [SalesLT].[SalesOrderHeader] AS H
	WHERE C.CustomerID=H.CustomerID);
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product]
WHERE [ListPrice] = 
	(SELECT MAX([ListPrice])
	FROM [SalesLT].[Product]);
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS Z
WHERE [ListPrice] = 
	(SELECT MAX([ListPrice])
	FROM [SalesLT].[Product] AS W1
	WHERE W1.ListPrice<
		(SELECT MAX([ListPrice])
		FROM [SalesLT].[Product] AS W2
		));
GO

SELECT COUNT(DISTINCT [ListPrice])
FROM [SalesLT].[Product] 
WHERE [ListPrice] > 3578.27 --3399.99;
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS Z
WHERE 0 = 
	(SELECT COUNT(DISTINCT [ListPrice])
	FROM [SalesLT].[Product] AS W
	WHERE W.ListPrice>Z.ListPrice);
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS Z
WHERE 1 = 
	(SELECT COUNT(DISTINCT [ListPrice])
	FROM [SalesLT].[Product] AS W
	WHERE W.ListPrice>Z.ListPrice);
GO

SELECT Z.SalesOrderID, Z.CustomerID, Z.OrderDate, Z.Freight
FROM [SalesLT].[SalesOrderHeader] AS Z
WHERE Z.Freight = 
   (SELECT MAX(W.Freight)
   FROM [SalesLT].[SalesOrderHeader] AS W
   WHERE W.OrderDate = Z.OrderDate);
GO

SELECT Z.SalesOrderID, Z.CustomerID, Z.OrderDate, 'Max Freight: ' + CAST(Z.Freight AS CHAR(7))
FROM [SalesLT].[SalesOrderHeader] AS Z
WHERE Z.Freight = 
   (SELECT MAX(W.Freight)
   FROM [SalesLT].[SalesOrderHeader] AS W
   WHERE W.OrderDate = Z.OrderDate)
UNION ALL
SELECT Z.SalesOrderID, Z.CustomerID, Z.OrderDate, 'Min Freight: ' + CAST(Z.Freight AS CHAR(7))
FROM [SalesLT].[SalesOrderHeader] AS Z
WHERE Z.Freight = 
   (SELECT MIN(W.Freight)
   FROM [SalesLT].[SalesOrderHeader] AS W
   WHERE W.OrderDate = Z.OrderDate);
GO

SELECT [LastName], TotalDue
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON C.CustomerID=H.CustomerID
WHERE [TotalDue]>=100000
ORDER BY [LastName];
GO

SELECT [LastName], TotalDue
FROM [SalesLT].[Customer] AS C
WHERE 10000 <= ANY
	(SELECT [TotalDue]
	FROM [SalesLT].[SalesOrderHeader] AS H
	WHERE C.CustomerID=H.CustomerID);
GO

SELECT OH.SalesOrderID, OD.ProductID, OD.LineTotal
FROM [SalesLT].[SalesOrderHeader] AS OH
JOIN [SalesLT].[SalesOrderDetail] AS OD
	ON OD.SalesOrderID = OH.SalesOrderID
WHERE OD.LineTotal >
	(SELECT AVG(OD1.LineTotal)*2
	FROM  [SalesLT].[SalesOrderHeader] AS OH1
JOIN [SalesLT].[SalesOrderDetail] AS OD1
	ON OD1.ProductID = OD.ProductID);
GO

SELECT [Name],[ListPrice],[Size],[Weight],[Color]
FROM [SalesLT].[Product]
WHERE [SellEndDate] IS NULL
AND [ListPrice]>50;
GO

SELECT [Name],[Color]
FROM (
	SELECT [Name],[ListPrice],[Size],[Weight],[Color]
	FROM [SalesLT].[Product]
	WHERE [SellEndDate] IS NULL
	AND [ListPrice]>50) AS W
WHERE [Color] = 'Black';
GO

SELECT 'Title: ' +C.[Title], A.CountryRegion + ' ' +A.City, COUNT (A.AddressID) AS Nr
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[CustomerAddress] AS CA
	ON C.CustomerID=CA.CustomerID
JOIN [SalesLT].[Address] AS A
	ON CA.AddressID=A.AddressID
WHERE 'Title: ' +C.[Title] = 'Title: Ms.'
GROUP BY 'Title: ' +C.[Title], A.CountryRegion + ' ' +A.City;
GO

SELECT 'Title: ' +C.[Title] AS FullTitle, A.CountryRegion + ' ' +A.City AS Adress, COUNT (A.AddressID) AS Nr
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[CustomerAddress] AS CA
	ON C.CustomerID=CA.CustomerID
JOIN [SalesLT].[Address] AS A
	ON CA.AddressID=A.AddressID
WHERE FullTitle = 'Title: Ms.'
GROUP BY FullTitle,Adress
GO

SELECT FullTitle,Adress, COUNT (Z.AddressID) AS Nr
FROM 
	(SELECT 'Title: ' +C.[Title] AS FullTitle, A.CountryRegion + ' ' +A.City AS Adress, CA.AddressID
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[CustomerAddress] AS CA
	ON C.CustomerID=CA.CustomerID
JOIN [SalesLT].[Address] AS A
	ON CA.AddressID=A.AddressID
	) AS Z
WHERE FullTitle = 'Title: Ms.'
GROUP BY FullTitle,Adress;
GO


SELECT [SalesOrderID],[TotalDue],
	ROW_NUMBER() OVER (ORDER BY [TotalDue] DESC) AS Rnk
FROM [SalesLT].[SalesOrderHeader];

SELECT *
FROM (
	SELECT [SalesOrderID],[TotalDue],
	ROW_NUMBER() OVER (ORDER BY [TotalDue] DESC) AS Rnk
	FROM [SalesLT].[SalesOrderHeader]) AS W
WHERE Rnk BETWEEN  10 AND 15;
GO

WITH CTE AS (
	SELECT 'Title: ' +C.[Title] AS FullTitle, A.CountryRegion + ' ' +A.City AS Adress, CA.AddressID
	FROM [SalesLT].[Customer] AS C
	JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID=CA.CustomerID
	JOIN [SalesLT].[Address] AS A
		ON CA.AddressID=A.AddressID
	) 
SELECT FullTitle,Adress, COUNT (AddressID) AS Nr
FROM CTE
WHERE FullTitle = 'Title: Ms.'
GROUP BY FullTitle,Adress;
GO

SELECT [SalesOrderID], [TotalDue],
NTILE(5) OVER(ORDER BY  [SalesOrderID] DESC) AS page
FROM [SalesLT].[SalesOrderHeader];
GO

WITH Pages AS 
(SELECT [SalesOrderID], [TotalDue],
NTILE(5) OVER(ORDER BY  [SalesOrderID] DESC) AS page
FROM [SalesLT].[SalesOrderHeader])
SELECT page, MIN([TotalDue]) AS Min, MAX([TotalDue]) AS Max, 
	AVG([TotalDue] ) AS Avg
FROM Pages
GROUP BY page
ORDER BY page;
GO

WITH Sales ([ProductID], NumSales) AS
	(SELECT [ProductID], Count(*)
	FROM [SalesLT].[SalesOrderDetail]
	GROUP BY [ProductID]),
	FreqSales AS 
	(SELECT [ProductID], NumSales, 
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY NumSales DESC)
		OVER () as MedianDisc
	FROM Sales)
SELECT [Name], NumSales
FROM FreqSales AS S
JOIN [SalesLT].[Product] AS P
	ON S.ProductID=P.ProductID
WHERE NumSales>MedianDisc
ORDER BY NumSales DESC;
GO

WITH Generator AS
	(SELECT i = 1
	UNION All
	SELECT i = i + 1 
	FROM Generator 
	WHERE i < 100 )
SELECT i
FROM Generator
ORDER BY i;
GO

WITH Generator AS
	(SELECT i = 1
	UNION All
	SELECT i = i + 1 
	FROM Generator 
	WHERE i < 5000 )
SELECT i
FROM Generator
ORDER BY i
OPTION (MAXRECURSION 0);


WITH Categories AS
	(SELECT [ParentProductCategoryID], COUNT([ProductCategoryID]) AS Nr
	FROM [SalesLT].[ProductCategory] 
	GROUP BY [ParentProductCategoryID])
SELECT *
FROM Categories
ORDER BY [ParentProductCategoryID];
GO

WITH Categories AS
	(SELECT [ParentProductCategoryID], [ProductCategoryID], 0 as lvl, P.[Name]
	FROM [SalesLT].[ProductCategory] AS P
	WHERE [ParentProductCategoryID] IS NULL
UNION ALL
	SELECT e.[ParentProductCategoryID], e.[ProductCategoryID], CTEcat.lvl+1, E.[Name]
	FROM [SalesLT].[ProductCategory] AS e
	INNER JOIN Categories AS CTEcat ON
	e.[ParentProductCategoryID] = CTEcat.[ProductCategoryID] )
SELECT * FROM Categories
ORDER BY [ParentProductCategoryID];
GO

CREATE TABLE #SprzedażRoczna(
	rok CHAR(4),
	sprzedaż INT);
INSERT INTO #SprzedażRoczna (rok,sprzedaż)
VALUES('2001',100),('2002',150),('2003',120),('2004',150),('2005',250),('2006',300),('2007',250);
GO

SELECT Z.rok, Z.sprzedaż-
  (SELECT W1.sprzedaż
  FROM #SprzedażRoczna AS W1
  WHERE W1.rok = 
         (SELECT MAX(W2.rok)
         FROM #SprzedażRoczna AS W2
         WHERE W2.rok < Z.rok)) AS Trend
FROM #SprzedażRoczna AS Z;


SELECT Z.rok, SIGN(Z.sprzedaż-
  (SELECT W1.sprzedaż
  FROM #SprzedażRoczna AS W1
  WHERE W1.rok = 
         (SELECT MAX(W2.rok)
         FROM #SprzedażRoczna AS W2
         WHERE W2.rok < Z.rok))) AS Trend
FROM #SprzedażRoczna AS Z;

WITH Lata AS
(SELECT Z.rok, SIGN(Z.sprzedaż-
  (SELECT W1.sprzedaż
  FROM #SprzedażRoczna AS W1
  WHERE W1.rok = 
         (SELECT MAX(W2.rok)
         FROM #SprzedażRoczna AS W2
         WHERE W2.rok < Z.rok))) AS Trend
FROM #SprzedażRoczna AS Z)
SELECT MIN(rok), MAX(rok),Trend
FROM Lata
GROUP BY Trend;

WITH Lata AS(
SELECT Z.rok, SIGN(Z.sprzedaż-
  (SELECT W1.sprzedaż
  FROM #SprzedażRoczna AS W1
  WHERE W1.rok = 
         (SELECT MAX(W2.rok)
         FROM #SprzedażRoczna AS W2
         WHERE W2.rok < Z.rok))) AS Trend
FROM #SprzedażRoczna AS Z)
SELECT *,(SELECT COUNT(*)
         FROM Lata AS T2
         WHERE T2.rok >= T1.rok AND T2.trend <> T1.trend) AS LiczbaWierszy
FROM Lata AS T1;

WITH Lata AS(
SELECT Z.rok, SIGN(Z.sprzedaż-
  (SELECT W1.sprzedaż
  FROM #SprzedażRoczna AS W1
  WHERE W1.rok = 
         (SELECT MAX(W2.rok)
         FROM #SprzedażRoczna AS W2
         WHERE W2.rok < Z.rok))) AS Trend
FROM #SprzedażRoczna AS Z),
Czynnik AS (
SELECT *,(SELECT COUNT(*)
         FROM Lata AS T2
         WHERE T2.rok >= T1.rok AND T2.trend <> T1.trend) AS LiczbaWierszy
FROM Lata AS T1)
SELECT MIN(rok), MAX(rok),Trend
FROM Czynnik
GROUP BY LiczbaWierszy,Trend
ORDER BY MIN(rok);
GO

SELECT [LastName]
FROM [SalesLT].[Customer] AS C
WHERE EXISTS 
	(SELECT *
	FROM [SalesLT].[SalesOrderHeader] AS H
	WHERE H.CustomerID=C.CustomerID);
GO

SELECT [LastName]
FROM [SalesLT].[Customer] AS C
WHERE CustomerID IN 
	(SELECT CustomerID
	FROM [SalesLT].[SalesOrderHeader] AS H
	WHERE H.CustomerID=C.CustomerID);
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS P
WHERE EXISTS 
	(SELECT *
	FROM [SalesLT].[SalesOrderDetail] AS I
	WHERE P.ProductID=I.ProductID
	AND P.ListPrice>2*I.UnitPrice
	);
GO

SELECT [CustomerID], [Title], [LastName]
FROM [SalesLT].[Customer] AS C
WHERE EXISTS 
	(SELECT *
	FROM [SalesLT].[Customer] AS I
	WHERE i.LastName = C.LastName
	AND i.Title = c.Title
	AND i.CustomerID<>c.CustomerID
	)
ORDER BY c.LastName;
GO

SELECT [LastName]
FROM [SalesLT].[Customer] AS C
WHERE NOT EXISTS 
	(SELECT *
	FROM [SalesLT].[SalesOrderHeader] AS H
	WHERE H.CustomerID=C.CustomerID);
GO

SELECT P.ProductID
FROM [SalesLT].[Product] AS P
WHERE NOT EXISTS 
	(SELECT I.ProductID
	FROM [SalesLT].[Product] AS I
	WHERE P.ProductID = I.ProductID+1);
GO

SELECT P.ProductID+1
FROM [SalesLT].[Product] AS P
WHERE NOT EXISTS 
	(SELECT I1.ProductID
	FROM [SalesLT].[Product] AS I1
	WHERE P.ProductID = I1.ProductID+1)
	AND P.ProductID < 
         (SELECT MAX(ProductID)
		 FROM [SalesLT].[Product] AS I2);
GO

SELECT P.[Name]
FROM [SalesLT].[Product] AS P
WHERE P.Name IN
	(SELECT M.[Name]
	FROM [SalesLT].[ProductModel] AS M
	);
GO

SELECT P.[Name]
FROM [SalesLT].[Product] AS P
WHERE P.Name =
	(SELECT M.[Name]
	FROM [SalesLT].[ProductModel] AS M
	);
GO

SELECT P.[Name]
FROM [SalesLT].[Product] AS P
WHERE P.Name = ANY
	(SELECT M.[Name]
	FROM [SalesLT].[ProductModel] AS M
	);
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product]
WHERE [ListPrice] >ANY
	(SELECT [ListPrice]*2
	FROM [SalesLT].[Product]
	WHERE [ProductCategoryID]=18
	);
GO

SELECT TOP 1 [ListPrice]*2
FROM [SalesLT].[Product]
WHERE [ProductCategoryID]=18
ORDER BY [ListPrice];
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS P
WHERE EXISTS 
	(SELECT * 
	FROM [SalesLT].[Product] AS I
	WHERE I.[ProductCategoryID]=18
	AND P.[ListPrice] > I.[ListPrice]*2
	);
GO

SELECT [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [CustomerID] = 29847;
GO

SELECT [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [TotalDue] > ANY
  (SELECT [TotalDue]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [CustomerID] = 29847)
ORDER BY [TotalDue];

SELECT [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [TotalDue] > ANY
  (SELECT [TotalDue]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [CustomerID] = 123454)
ORDER BY [TotalDue];
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product]
WHERE [ListPrice] >ALL
	(SELECT [ListPrice]*2
	FROM [SalesLT].[Product]
	WHERE [ProductCategoryID]=18
	);
GO

SELECT MAX([ListPrice])*2
FROM [SalesLT].[Product]
WHERE [ProductCategoryID]=18;
GO

SELECT [Name], [ListPrice]
FROM [SalesLT].[Product] AS P
WHERE NOT EXISTS 
  (SELECT *
  FROM [SalesLT].[Product] AS I
  WHERE I.[ProductCategoryID]=18
  AND P.[ListPrice] < 2*I.ListPrice);
GO

SELECT [Name]
FROM [SalesLT].[Product] AS P
WHERE P.ListPrice <> ALL	
	(SELECT ListPrice
	FROM [SalesLT].[Product] AS I
	WHERE I.ProductCategoryID=5
	);
GO

SELECT [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [TotalDue] > ALL
  (SELECT [TotalDue]
	FROM [SalesLT].[SalesOrderHeader]
	WHERE [CustomerID] = 123454)
ORDER BY [TotalDue];
GO


SELECT [SalesOrderID]
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.CustomerID IN 
	(SELECT [CustomerID]
	FROM [SalesLT].[Customer] AS C
	WHERE C.LastName = 'Eminhizer'
	);

SELECT TOP 5 WITH TIES OH.SalesOrderID, OH.TotalDue
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.SalesOrderID NOT IN
	(SELECT TOP 10 WITH TIES OH.SalesOrderID
	FROM [SalesLT].[SalesOrderHeader] AS OH
	ORDER BY OH.TotalDue DESC
	)
ORDER BY OH.TotalDue DESC

SELECT OH.[SalesOrderID], OH.DueDate, OH.CustomerID
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.DueDate IN
	(SELECT MAX(I.DueDate)
	FROM [SalesLT].[SalesOrderHeader] AS I
	GROUP BY YEAR(I.DueDate), MONTH(I.DueDate)
	);



