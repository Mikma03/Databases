﻿USE [AdventureWorksLT2012]
GO

SELECT [Name],[ProductCategoryID]
FROM [SalesLT].[Product];
GO

SELECT [ProductCategoryID], [Name]
FROM [SalesLT].[ProductCategory];
GO

SELECT C.Name,P.Name
FROM [SalesLT].[ProductCategory] AS C
JOIN [SalesLT].[Product] AS P
	ON P.ProductCategoryID=C.ProductCategoryID;
GO

SELECT C.Name,P.Name
FROM [SalesLT].[ProductCategory] AS C, [SalesLT].[Product] AS P
WHERE P.ProductCategoryID=C.ProductCategoryID;
GO

SELECT *
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[SalesOrderHeader] AS OH
	ON c.CustomerID=oh.CustomerID
WHERE [SalesOrderID]=71796;
GO

SELECT *
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[Address] AS A
	ON A.ModifiedDate=C.ModifiedDate;
GO

SELECT [ProductID]
FROM [SalesLT].[Product]
JOIN [SalesLT].[SalesOrderDetail]
	ON [SalesLT].[Product].ProductID = [SalesLT].[SalesOrderDetail].ProductID;
GO

SELECT P.[ProductID]
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[SalesOrderDetail] AS OD
	ON P.ProductID = OD.ProductID;
GO

SELECT P.[ProductID], M.ProductModelID, P.ProductCategoryID
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductModel] AS M
	ON P.ProductCategoryID = M.ProductModelID;
GO

SELECT H.SalesOrderID, H.SalesOrderNumber, D.LineTotal, H.OrderDate
FROM [SalesLT].[SalesOrderHeader] AS H
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.SalesOrderDetailID=H.SalesOrderID;
GO

SELECT H.SalesOrderID, H.SalesOrderNumber, D.LineTotal, H.SubTotal
FROM [SalesLT].[SalesOrderHeader] AS H
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.LineTotal<H.SubTotal;
GO

SELECT H.SalesOrderID, H.SalesOrderNumber, D.LineTotal, H.SubTotal
FROM [SalesLT].[SalesOrderHeader] AS H
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.SalesOrderID=H.SalesOrderID
	AND D.LineTotal<H.SubTotal;
GO

SELECT ProductNumber, C.Name
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE P.Color = 'WHITE';
GO

SELECT ProductNumber, C.Name
FROM [SalesLT].[Product] AS P
INNER JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE P.Color = 'WHITE';
GO

SELECT ProductNumber, C.Name
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE P.Color = 'WHITE';
GO

SELECT ProductNumber, C.Name
FROM [SalesLT].[ProductCategory] AS C 
RIGHT OUTER JOIN [SalesLT].[Product] AS P
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE P.Color = 'WHITE';

SELECT ProductNumber, C.Name
FROM [SalesLT].[Product] AS P
FULL OUTER JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE P.ProductCategoryID IS NULL;
GO

SELECT P.Name, C.FirstName
FROM [SalesLT].[Product] AS P
CROSS JOIN [SalesLT].[Customer] AS C;
GO

SELECT DISTINCT P.Name, C.FirstName
FROM [SalesLT].[Product] AS P
CROSS JOIN [SalesLT].[Customer] AS C;
GO

SELECT [ProductNumber], C.[rowguid]
FROM [SalesLT].[Product], [SalesLT].[Customer] AS C;
GO

SELECT P.Name
FROM [SalesLT].[Product] AS P;
GO

SELECT P.Name
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON P.ProductID = D.ProductID;
GO

SELECT P.Name
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON P.ProductID = D.ProductID
JOIN [SalesLT].[Customer] AS C
	ON C.CustomerID = ???
GO

SELECT C.LastName, P.Name
FROM [SalesLT].[Customer] AS C
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON C.CustomerID=H.CustomerID
JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.SalesOrderID=H.SalesOrderID
JOIN [SalesLT].[Product] AS P
	ON D.ProductID=P.ProductID
ORDER BY C.LastName;
GO

SELECT P.ProductNumber, D.SalesOrderID
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.ProductID=P.ProductID;
GO

SELECT P.ProductNumber, D.SalesOrderID, H.TotalDue
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.ProductID=P.ProductID
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON D.SalesOrderID=H.SalesOrderID;
GO

SELECT P.ProductNumber, D.SalesOrderID, H.TotalDue
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.ProductID=P.ProductID
JOIN [SalesLT].[SalesOrderHeader] AS H
	ON D.SalesOrderID=H.SalesOrderID
WHERE P.ProductNumber = 'BB-8107';
GO

SELECT P.ProductNumber, D.SalesOrderID, H.TotalDue
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN [SalesLT].[SalesOrderDetail] AS D
	ON D.ProductID=P.ProductID
LEFT JOIN [SalesLT].[SalesOrderHeader] AS H
	ON D.SalesOrderID=H.SalesOrderID;
GO

SELECT P.ProductNumber, D.SalesOrderID, H.TotalDue
FROM [SalesLT].[Product] AS P
LEFT OUTER JOIN 
	(
		[SalesLT].[SalesOrderDetail] AS D
		JOIN [SalesLT].[SalesOrderHeader] AS H
		ON D.SalesOrderID=H.SalesOrderID
	)
	ON D.ProductID=P.ProductID;
GO

SELECT ProductNumber
FROM [SalesLT].[Product] 
CROSS JOIN [SalesLT].[Product];
GO

SELECT ProductNumber
FROM [SalesLT].[Product] AS P1 
CROSS JOIN [SalesLT].[Product] AS P2;
GO

SELECT P1.ProductNumber
FROM [SalesLT].[Product] AS P1 
CROSS JOIN [SalesLT].[Product] AS P2;
GO

SELECT P1.ProductID, P1.ListPrice, P2.ProductID,  P2.ListPrice
FROM [SalesLT].[Product] AS P1
JOIN [SalesLT].[Product] AS P2
	ON P1.ProductCategoryID=P2.ProductCategoryID
WHERE P1.ListPrice*6 <P2.ListPrice
ORDER BY P1.ProductID;
GO

SELECT C1.ParentProductCategoryID, C1.ProductCategoryID, C1.Name, C2.ParentProductCategoryID, C2.ProductCategoryID, C2.Name
FROM [SalesLT].[ProductCategory] AS C1
JOIN [SalesLT].[ProductCategory] AS C2
	ON C1.ParentProductCategoryID=C2.ProductCategoryID
WHERE C1.ParentProductCategoryID=1;
GO

SELECT [Name]
FROM [SalesLT].[Product]
UNION 
SELECT [Name]
FROM [SalesLT].[ProductCategory]
ORDER BY 1;
GO

SELECT [AddressID]
FROM [SalesLT].[Address]
UNION
SELECT [CustomerID]
FROM [SalesLT].[Customer];
GO

SELECT [AddressID]
FROM [SalesLT].[Address]
UNION ALL
SELECT [CustomerID]
FROM [SalesLT].[Customer];
GO

SELECT [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [CustomerID] IN (29847,30072);
GO

SELECT [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [CustomerID] = 29847
UNION ALL
SELECT [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader]
WHERE [CustomerID] =30072;
GO

SELECT [AddressID]
FROM [SalesLT].[Address]
INTERSECT
SELECT [CustomerID]
FROM [SalesLT].[Customer];

SELECT [AddressID]
FROM [SalesLT].[Address]
EXCEPT
SELECT [CustomerID]
FROM [SalesLT].[Customer];

SELECT [CustomerID]
FROM [SalesLT].[Customer]
EXCEPT
SELECT [AddressID]
FROM [SalesLT].[Address];

SELECT *
FROM [dbo].[ufnGetAllCategories]();

SELECT *
FROM [SalesLT].[vGetAllCategories];

SELECT *
FROM [dbo].[ufnGetCustomerInformation](1);
GO

SELECT C.[CustomerID], F.*
FROM [SalesLT].[Customer] AS C
CROSS APPLY [dbo].[ufnGetCustomerInformation](C.[CustomerID]) AS F
WHERE C.Title = 'Ms.';

SELECT F.*
FROM  [SalesLT].[Customer] AS C
CROSS APPLY [dbo].[udfLastOrders] (C.[CustomerID],2) AS F
ORDER BY C.CustomerID;
GO

SELECT C.FirstName, F.*
FROM  [SalesLT].[Customer] AS C
CROSS APPLY [dbo].[udfLastOrders] (C.[CustomerID],2) AS F
WHERE F.[SalesOrderID] IS NULL
GO

SELECT  C.FirstName, C.[CustomerID], F.*
FROM [SalesLT].[Customer] AS C
OUTER APPLY [dbo].[udfLastOrders](C.[CustomerID],2) AS F;
GO



