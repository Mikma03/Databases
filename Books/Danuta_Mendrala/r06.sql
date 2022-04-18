﻿USE AdventureWorksLT2012;
GO

SELECT COUNT([SalesOrderID])
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT COUNT(CustomerID)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT COUNT(DISTINCT CustomerID)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT DISTINCT COUNT(CustomerID)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT COUNT(*)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT COUNT(DISTINCT *)
FROM [SalesLT].[SalesOrderHeader];
GO


SELECT SUM([ListPrice]), AVG([ListPrice])
FROM [SalesLT].[Product];
GO

CREATE TABLE #Tab
(id INT IDENTITY,
val INT);
GO

INSERT INTO #TAB (val)
VALUES
(2),(4);
GO

SELECT * 
FROM #TAB;
GO

SELECT SUM(val), AVG(val) 
FROM #TAB;
GO

INSERT INTO #TAB(val)
VALUES (NULL);
GO

SELECT AVG(val), COUNT(*), COUNT(val)
FROM #TAB;
GO

SELECT SUM([ListPrice]), SUM(DISTINCT [ListPrice])
FROM [SalesLT].[Product];
GO

SELECT MIN([OrderDate]), MAX([OrderDate])
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT MIN([TotalDue]), MAX([TotalDue])
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT MIN(Name), MAX(Name)
FROM [SalesLT].[Product];
GO

SELECT MIN([ProductID]), MAX([ProductID]), COUNT(*), MAX([ProductID])-MIN([ProductID])-COUNT(*)
FROM [SalesLT].[Product];
GO

SELECT CHECKSUM_AGG([SalesOrderID]), CHECKSUM_AGG(CAST([UnitPrice] AS INT))
FROM [SalesLT].[SalesOrderDetail];
GO

SELECT STDEV([ListPrice]), STDEVP([ListPrice])
FROM [SalesLT].[Product];
GO

SELECT AVG([ListPrice]), VAR([ListPrice]), VARP([ListPrice])
FROM [SalesLT].[Product];
GO

SELECT MAX([ListPrice]) - MIN( [ListPrice]),
	MAX([ListPrice]) - AVG( [ListPrice])
FROM [SalesLT].[Product];
GO

SELECT AVG([ListPrice]*1.23)
FROM [SalesLT].[Product];

SELECT AVG([ListPrice])*1.23
FROM [SalesLT].[Product];

SELECT AVG(SUM([ListPrice]))
FROM [SalesLT].[Product];
GO

SELECT [ProductCategoryID],AVG([ListPrice]) AS średnia, COUNT([ProductID]) AS Liczba
FROM [SalesLT].[Product]
GROUP BY [ProductCategoryID];
GO

SELECT [ProductCategoryID],AVG([ListPrice]), [Name]
FROM [SalesLT].[Product]
GROUP BY [ProductCategoryID];
GO

SELECT P.[ProductNumber], SUM(OD.[LineTotal])
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[SalesOrderDetail] AS OD
	ON P.ProductID = OD.ProductID;
GO

SELECT P.[ProductNumber], SUM(OD.[LineTotal])
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[SalesOrderDetail] AS OD
	ON P.ProductID = OD.ProductID
GROUP BY P.[ProductNumber];
GO

SELECT [Color], COUNT(*)
FROM [SalesLT].[Product]
GROUP BY [Color];

SELECT LEFT([Color],1), COUNT(*)
FROM [SalesLT].[Product]
GROUP BY LEFT([Color],1);
GO

SELECT C.Name, P.Color, COUNT(*) AS Liczba, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY C.Name, P.Color
ORDER BY C.Name;
GO

SELECT COUNT( CustomerID)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT COUNT( CustomerID)
FROM [SalesLT].[SalesOrderHeader]
GROUP BY ();
GO

SELECT Color,AVG([ListPrice])
FROM [SalesLT].[Product]
WHERE Color LIKE 'S%'
GROUP BY Color;
GO

SELECT Color,AVG([ListPrice])
FROM [SalesLT].[Product]
WHERE Color LIKE 'S%'
GROUP BY Color
ORDER BY [Name];
GO

SELECT C.Name, P.Color, COUNT(*) AS Liczba, SUM(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY ROLLUP (C.Name, P.Color)
ORDER BY C.Name;
GO

SELECT C.Name, P.Color, COUNT(*) AS Liczba, SUM(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY CUBE (C.Name, P.Color)
ORDER BY C.Name;
GO

SELECT C.Name, GROUPING(C.Name) AS ByName, P.Color, GROUPING(P.Color) AS ByColor, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY CUBE (C.Name, P.Color)
ORDER BY C.Name;
GO

SELECT C.Name, GROUPING_ID(C.Name,P.Color) AS GroupLevel, P.Color, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY CUBE (C.Name, P.Color)
ORDER BY C.Name;
GO

CREATE TABLE #T 
(
 a int,
 b int,
 c int,
 x int
);

INSERT #T VALUES
	(1,2,3,8),
	(1,2,4,1),
	(1,2,5,5),
	(1,3,4,9);
GO

SELECT a, NULL as b, NULL as c, sum(x) as sumx 
FROM #T
GROUP BY a
UNION ALL
SELECT NULL as a, b, NULL as c, sum(x) as sumx 
FROM #T
GROUP BY b
UNION ALL
SELECT a, b, c, sum(x) as sumx 
FROM #T
GROUP BY  a, b, c;

SELECT a, b, c, SUM(x) AS sumx 
FROM #T
GROUP BY 
	GROUPING SETS (a, 
		(b), 
		(a, b, c));

SELECT a, b, c, SUM(DISTINCT x)  
FROM #T
GROUP BY GROUPING SETS ((a,b,c), (a), ());
GO

SELECT [CountryRegion], [StateProvince],[City],COUNT(*)
FROM [SalesLT].[Address]
GROUP BY [CountryRegion],[StateProvince],[City]
UNION ALL
SELECT [CountryRegion], [StateProvince],NULL,COUNT(*)
FROM [SalesLT].[Address]
GROUP BY [CountryRegion],[StateProvince]
UNION ALL
SELECT [CountryRegion], NULL,[City],COUNT(*)
FROM [SalesLT].[Address]
GROUP BY [CountryRegion],[City];

SELECT [CountryRegion], [StateProvince],[City],COUNT(*)
FROM [SalesLT].[Address]
GROUP BY GROUPING SETS (
([CountryRegion],[StateProvince],[City]),
([CountryRegion],[StateProvince]),
([CountryRegion],[City] ));
GO

SELECT TOP 20 CAT.Name, C.LastName, SUM(OD.LineTotal) AS Total
FROM [SalesLT].[SalesOrderDetail] AS OD 
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON OD.SalesOrderID = H. SalesOrderID
JOIN [SalesLT].[Product] AS P
	ON P.ProductID=OD.ProductID
JOIN [SalesLT].[ProductCategory] AS CAT
	ON CAT.ProductCategoryID=P.ProductCategoryID
JOIN [SalesLT].[Customer] AS C
	ON C.CustomerID=H.CustomerID
GROUP BY CAT.Name, C.LastName
ORDER BY CAT.Name;
GO

SELECT TOP 20 CAT.Name, C.LastName, SUM(OD.LineTotal) AS Total
INTO #TabPivot
FROM [SalesLT].[SalesOrderDetail] AS OD 
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON OD.SalesOrderID = H. SalesOrderID
JOIN [SalesLT].[Product] AS P
	ON P.ProductID=OD.ProductID
JOIN [SalesLT].[ProductCategory] AS CAT
	ON CAT.ProductCategoryID=P.ProductCategoryID
JOIN [SalesLT].[Customer] AS C
	ON C.CustomerID=H.CustomerID
GROUP BY CAT.Name, C.LastName
ORDER BY CAT.Name;
GO

SELECT P.LastName, [Bike Racks],[Bottles and Cages] ,[Bottom Brackets], [Brakes]
FROM #TabPivot
PIVOT ( 
SUM(Total)
FOR Name IN ([Bike Racks],[Bottles and Cages] ,[Bottom Brackets], [Brakes]) ) AS P
ORDER BY P.LastName;
GO

SELECT P.LastName, [Bike Racks],[Bottles and Cages] ,[Bottom Brackets], [Brakes]
INTO #TabUnpivot
FROM #TabPivot
PIVOT ( 
SUM(Total)
FOR Name IN ([Bike Racks],[Bottles and Cages] ,[Bottom Brackets], [Brakes]) ) AS P
ORDER BY P.LastName;

SELECT Unpiv.Name, Unpiv.LastName, Unpiv.Total
FROM #TabUnpivot
UNPIVOT (Total 
	FOR Name IN ([Bike Racks],[Bottles and Cages] ,[Bottom Brackets], [Brakes])) 
	AS Unpiv;
GO

SELECT C.Name, COUNT(*), AVG(ListPrice)
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY C.Name;

SELECT C.Name, COUNT(*), AVG(ListPrice)
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
WHERE COUNT(*)>10
GROUP BY C.Name;

SELECT C.Name, COUNT(*) AS Liczba, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY C.Name
HAVING COUNT(*)>10;
GO

SELECT C.Name, COUNT(*) AS Liczba, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY C.Name
HAVING p.ListPrice>10;
GO

SELECT C.Name, COUNT(*) AS Liczba, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
WHERE p.ListPrice>200
GROUP BY C.Name;
GO

SELECT C.Name, COUNT(*) AS Liczba, AVG(ListPrice) AS Średnia
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
GROUP BY C.Name
HAVING AVG(p.ListPrice)>200;
GO

SELECT C.Name, COUNT(*), AVG(ListPrice)
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
WHERE [SellEndDate] IS NOT NULL
GROUP BY C.Name
HAVING COUNT(*)>10;
GO

SELECT C.Name, COUNT(*), AVG(ListPrice)
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON P.ProductCategoryID=C.ProductCategoryID
WHERE [SellEndDate] IS NOT NULL
GROUP BY C.Name
HAVING C.Name LIKE 'R%';
GO

