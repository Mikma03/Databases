USE AdventureWorksLT2012
GO

SELECT SalesOrderID, TotalDue
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT SalesOrderID, TotalDue, AVG(TotalDue)
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT SalesOrderID, TotalDue, AVG(TotalDue) as �rednia
FROM [SalesLT].[SalesOrderHeader]
GROUP BY SalesOrderID, TotalDue;
GO

SELECT SalesOrderID, TotalDue, AVG(TotalDue) OVER() as �rednia
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT SalesOrderID, TotalDue, 
	MIN(TotalDue) OVER() AS min,
	MAX(TotalDue) OVER() AS max,
	AVG(TotalDue) OVER() AS avg,
	TotalDue - AVG(TotalDue) OVER() AS diff
FROM [SalesLT].[SalesOrderHeader];

SELECT [CustomerID], SUM (TotalDue) AS TotalSum,
	SUM (TotalDue*100.) /  SUM(TotalDue*1.) OVER () 
FROM [SalesLT].[SalesOrderHeader]
GROUP BY [CustomerID];

SELECT [CustomerID], SUM (TotalDue) AS TotalSum,
	SUM (TotalDue*100.) / SUM (SUM(TotalDue*1.)) OVER () AS Pct
FROM [SalesLT].[SalesOrderHeader]
GROUP BY [CustomerID]
ORDER BY Pct DESC;
GO

SELECT C.[Name]
FROM [SalesLT].[ProductCategory] AS C
JOIN [SalesLT].[Product] AS P
ON C.ProductCategoryID=P.ProductCategoryID;

SELECT C.[Name],
	COUNT(*) OVER (PARTITION BY C.ProductCategoryID) AS LiczbaDuplikat�w
FROM [SalesLT].[ProductCategory] AS C
JOIN [SalesLT].[Product] AS P
ON C.ProductCategoryID=P.ProductCategoryID
ORDER BY LiczbaDuplikat�w;
GO

SELECT DISTINCT C.[Name],
	COUNT(*) OVER (PARTITION BY C.ProductCategoryID) AS LiczbaDuplikat�w
FROM [SalesLT].[ProductCategory] AS C
JOIN [SalesLT].[Product] AS P
ON C.ProductCategoryID=P.ProductCategoryID
ORDER BY LiczbaDuplikat�w;
GO

SELECT CustomerID, SalesOrderID, TotalDue, 
	SUM(TotalDue) OVER(PARTITION BY [CustomerID]) AS SumTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [CustomerID];
GO

SELECT SalesOrderID, CustomerID, TotalDue,
	CAST (100. * TotalDue / SUM(TotalDue) OVER (PARTITION BY CustomerID) AS NUMERIC (5,2)) AS PctCust,
	CAST (100. * TotalDue / SUM(TotalDue) OVER () AS NUMERIC (5,2)) AS PctTotal
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT FirstName, 
ROW_NUMBER() OVER(ORDER BY FirstName) AS ROW_NUMBER,
RANK() OVER(ORDER BY FirstName) AS RANK,
DENSE_RANK() OVER(ORDER BY FirstName)AS DENSE_RANK,
NTILE(3) OVER (ORDER BY FirstName) AS NTILE 
FROM [SalesLT].[Customer]
WHERE FirstName IN ('Andrew','Juanita','Christopher');
GO

SELECT Title, FirstName, 
ROW_NUMBER() OVER( PARTITION BY [Title] ORDER BY FirstName) AS ROW_NUMBER
FROM [SalesLT].[Customer]
WHERE FirstName IN ('Andrew','Juanita');
GO

SELECT 
  (
    SELECT COUNT(*) + 1
    FROM [SalesLT].[SalesOrderHeader]  AS t2
    WHERE t2.CustomerID = t1.CustomerID
    AND t2.SalesOrderID < t1.SalesOrderID
  ) AS [DENSE_RANK], 
  t1.SalesOrderID,
  t1.TotalDue
FROM [SalesLT].[SalesOrderHeader] AS t1
ORDER BY t1.SalesOrderID;
GO

SELECT [SalesOrderID], DAY([DueDate]) AS Dzie� , [TotalDue] 
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT [SalesOrderID], DAY([DueDate]) AS Dzie�, [TotalDue],
   SUM([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY [DueDate]
                 ) AS DayTotal
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT [SalesOrderID], DAY([DueDate]) AS Dzie�, [TotalDue],
   SUM([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY [DueDate]
                 ROWS BETWEEN 1 PRECEDING 
                          AND 1 PRECEDING) AS PreviousRow
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT [SalesOrderID], DAY([DueDate]) AS Dzie�, [TotalDue],
   SUM([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY DueDate
                 ROWS BETWEEN UNBOUNDED PRECEDING 
                          AND CURRENT ROW) AS DefaultWindow
FROM [SalesLT].[SalesOrderHeader]
ORDER BY DueDate;
GO
 
SELECT [SalesOrderID],DAY([DueDate]) AS Dzie�, [TotalDue],
   SUM([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY [DueDate]
                 ROWS BETWEEN 1 PRECEDING
                          AND CURRENT ROW) AS runningTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY DueDate;
GO

SELECT [SalesOrderID],DAY([DueDate]) AS Dzie�, [TotalDue],
   AVG([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY DueDate
                 ROWS BETWEEN 1 PRECEDING
                          AND 1 FOLLOWING) AS movingAvg
FROM [SalesLT].[SalesOrderHeader]
ORDER BY DueDate;

SELECT [SalesOrderID],DAY([DueDate]) AS Dzie�, [TotalDue],
   AVG([TotalDue]) OVER(PARTITION BY DAY([DueDate])
                 ORDER BY DueDate
                 RANGE BETWEEN 1 PRECEDING
                          AND 1 FOLLOWING) AS movingAvg
FROM [SalesLT].[SalesOrderHeader]
ORDER BY DueDate;
GO

SELECT CAST([DueDate] AS DATE) AS Date, [SalesOrderID], [TotalDue],
	LAG([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as PreviusTotalDue,
	LAG([TotalDue],2) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as TwoPrecedingTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT CAST([DueDate] AS DATE) AS Date, [SalesOrderID], [TotalDue],
	LEAD([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as NextTotalDue,
	LEAD([TotalDue],2) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as TwoFollowingTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT CAST([DueDate] AS DATE) AS Date, [SalesOrderID], [TotalDue],
	FIRST_VALUE ([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as FirstTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

SELECT CAST([DueDate] AS DATE) AS Date, [SalesOrderID], [TotalDue],
	LAST_VALUE ([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as LastTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO


SELECT [ProductCategoryID],[ProductNumber], [ListPrice],
	CUME_DIST () OVER (PARTITION BY [ProductCategoryID] ORDER BY [ListPrice] DESC) as CumeDist,
	PERCENT_RANK () OVER (PARTITION BY [ProductCategoryID] ORDER BY [ListPrice] DESC) as PercentRank
FROM [SalesLT].[Product]
WHERE [ProductCategoryID] IN (8,9);
GO

SELECT [ProductCategoryID],[ProductNumber], [ListPrice],
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY [ListPrice] DESC)
		OVER (PARTITION BY [ProductCategoryID] ) as MedianCont,
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY [ListPrice] DESC)
		OVER (PARTITION BY [ProductCategoryID] ) as MedianDisc
FROM [SalesLT].[Product]
WHERE [ProductCategoryID] IN (16,17);
GO


SELECT [FirstName], COUNT([SalesOrderID])
FROM [SalesLT].[SalesOrderHeader] AS OH
JOIN [SalesLT].[Customer] AS C
ON c.CustomerID=oh.CustomerID
GROUP BY [FirstName]
ORDER BY COUNT([SalesOrderID]) DESC

SELECT [ProductNumber], COUNT([SalesOrderDetailID]) AS SalesCount
	,ROW_NUMBER () OVER (ORDER BY COUNT([SalesOrderDetailID]) DESC)
FROM [SalesLT].[SalesOrderDetail] AS OD
JOIN [SalesLT].[Product] AS P
ON P.ProductID=OD.ProductID
GROUP BY [ProductNumber]
ORDER BY COUNT([SalesOrderDetailID]) DESC
GO
