/*
Zadania z rozdzia�u 1.

P�yty {ID p�yty, ID wykonawcy, ID gatunku, Czas trwania, Opinia}
Wykonawcy {ID wykonawcy, Nazwa wykonawcy, ID kraju}
Gatunki {ID gatunku, Nazwa gatunku}
Kraje {ID kraju, Nazwa kraju}

Autorzy {ID autora, Imi�, Nazwisko}
Ksi��ki (ID ksi��ki, Tytu�}
AutorKsia�ka {ID autora, ID ksi��ki}

Uczniowie {Ucze� ID, Imi�, Nazwisko, Adres ID, Uwagi}
Oceny {Ocena ID, Ocena}
UczniowieOceny {Ucze� ID, Ocena ID, Data wystawienia oceny}
Adresy {Adres ID, Miasto, Kod pocztowy, Ulica i nr domu} 

Zadania z rozdzia�u 2.

SELECT *
FROM Osoby
WHERE Nazwisko = 'Nowak';

SELECT * 
FROM Pracownicy 
WHERE login = '' and haslo = '';

SELECT * 
FROM Pracownicy
WHERE login = '';
DROP TABLE Dane--' and txtHaslo = ''

SELECT * 
FROM Pracownicy 
WHERE login = ''OR 1=1--' and txtHaslo = '';

*/

--Zadania z rozdzia�u 3.

USE [AdventureWorksLT2012]
GO

SELECT [Name], [ListPrice]*1.2
FROM [SalesLT].[Product];
GO

SELECT [SalesOrderID], DATEDIFF (DAY,[OrderDate],[ShipDate])
FROM [SalesLT].[SalesOrderHeader];

SELECT [SalesOrderID], DATEDIFF (DAY,[OrderDate],COALESCE([ShipDate],GETDATE()))
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT 'Produkt ' + [Name], 'kosztuje', ROUND([ListPrice],1)
FROM [SalesLT].[Product];

SELECT 'Produkt ' + [Name], 'kosztuje', ROUND([ListPrice],1)
FROM [SalesLT].[Product]
ORDER BY [ListPrice] DESC;
GO

SELECT [OrderDate]
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [OrderDate] DESC;

SELECT LEFT([OrderDate],11)
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [OrderDate] DESC;

SELECT DISTINCT LEFT([OrderDate],11)
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [OrderDate] DESC;

SELECT DISTINCT LEFT([OrderDate],11)
FROM [SalesLT].[SalesOrderHeader]
ORDER BY LEFT([OrderDate],11) DESC;

SELECT DISTINCT YEAR([OrderDate]) +'-' + MONTH([OrderDate]) +'-'+ DAY([OrderDate])
FROM [SalesLT].[SalesOrderHeader]
ORDER BY YEAR([OrderDate]) +'-' + MONTH([OrderDate]) +'-'+ DAY([OrderDate]) DESC;

SELECT DISTINCT CAST(YEAR([OrderDate]) AS CHAR(4))+'-'+CAST(MONTH([OrderDate]) AS VARCHAR(2))+'-'+CAST(DAY([OrderDate]) AS VARCHAR(2))
FROM [SalesLT].[SalesOrderHeader]
ORDER BY CAST(YEAR([OrderDate]) AS CHAR(4))+'-'+CAST(MONTH([OrderDate]) AS VARCHAR(2))+'-'+CAST(DAY([OrderDate]) AS VARCHAR(2)) DESC;
GO

SELECT [ProductNumber], [Size]
FROM [SalesLT].[Product]
ORDER BY [Size];

SELECT [ProductNumber], [Size],
	CASE
	  WHEN [Size] IS NULL THEN 1
	  ELSE 0
	END
FROM [SalesLT].[Product];


SELECT [ProductNumber], [Size]
FROM [SalesLT].[Product]
ORDER BY CASE
	  WHEN [Size] IS NULL THEN 1
	  ELSE 0
	END;

SELECT [ProductNumber], [Size]
FROM [SalesLT].[Product]
ORDER BY CASE
	  WHEN [Size] IS NULL THEN 1
	  ELSE 0
	END,
[Size];

--Zadania z rozdzia�u 4.

SELECT [Name], [ProductNumber], [ListPrice]
FROM [SalesLT].[Product]
WHERE [StandardCost]*2<[ListPrice]
AND [ProductNumber] LIKE '%4' OR [ProductNumber] LIKE '%8';

SELECT [Name], [ProductNumber], [ListPrice]
FROM [SalesLT].[Product]
WHERE [StandardCost]*2<[ListPrice]
AND RIGHT([ProductNumber],1) IN ('4','8');

SELECT [Name], [ProductNumber], [ListPrice]
FROM [SalesLT].[Product]
WHERE [StandardCost]*2<[ListPrice]
AND (RIGHT([ProductNumber],1) IN ('4','8'));
GO

SELECT [SalesOrderID], [Freight],[OrderDate]
FROM [SalesLT].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN '20080601' AND '20090101';

SELECT [SalesOrderID], [Freight],[OrderDate]
FROM [SalesLT].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN '20080601' AND '20081231';

SELECT TOP 5 PERCENT [SalesOrderID], [Freight]
FROM [SalesLT].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN '20080601' AND '20081231'
ORDER BY Freight;

SELECT TOP 5 PERCENT WITH TIES [SalesOrderID], [Freight]
FROM [SalesLT].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN '20080601' AND '20081231'
ORDER BY Freight;
GO

SELECT [Name]
FROM [SalesLT].[Product]
WHERE [ProductID] = CAST(RAND()*1000 AS INT)

SELECT TOP 1 [Name]
FROM [SalesLT].[Product]
ORDER BY RAND();

SELECT TOP 1 [Name]
FROM [SalesLT].[Product]
ORDER BY NEWID();

--Zadania z rozdzia�u 5.

SELECT P.Name
FROM [SalesLT].[Product] AS P,[SalesLT].[Customer] AS C
WHERE C.FirstName = 'Jeffrey';

SELECT P.Name
FROM [SalesLT].[Product] AS P 
	JOIN [SalesLT].[SalesOrderDetail] AS OD
		ON P.ProductID = OD.ProductID
	JOIN [SalesLT].[SalesOrderHeader] AS OH
		ON OD.SalesOrderID=OH.SalesOrderID
	JOIN [SalesLT].[Customer] AS C
		ON C.CustomerID=OH.CustomerID
WHERE C.FirstName = 'Jeffrey';

SELECT DISTINCT P.Name
FROM [SalesLT].[Product] AS P 
	JOIN [SalesLT].[SalesOrderDetail] AS OD
		ON P.ProductID = OD.ProductID
	JOIN [SalesLT].[SalesOrderHeader] AS OH
		ON OD.SalesOrderID=OH.SalesOrderID
	JOIN [SalesLT].[Customer] AS C
		ON C.CustomerID=OH.CustomerID
WHERE C.FirstName = 'Jeffrey';
GO

SELECT [FirstName], [LastName]
FROM [SalesLT].[Customer] AS C
	JOIN [SalesLT].[SalesOrderHeader] AS OH
		ON C.CustomerID=OH.CustomerID
		WHERE OH.CustomerID IS NULL;

SELECT [FirstName], [LastName]
FROM [SalesLT].[Customer] AS C
	LEFT OUTER JOIN [SalesLT].[SalesOrderHeader] AS OH
		ON C.CustomerID=OH.CustomerID
		WHERE OH.CustomerID IS NULL;


SELECT K.Imi�, K.Nazwisko
FROM dbo.Klienci AS K JOIN dbo.Zam�wienia AS Z
ON K.ID = Z.[ID klienta]
WHERE Z.[ID klienta] IS NULL;
SELECT K.Imi�, K.Nazwisko
FROM dbo.Klienci AS K LEFT JOIN dbo.Zam�wienia AS Z
ON K.ID = Z.[ID klienta]
WHERE Z.[ID klienta] IS NULL;
GO

SELECT SalesOrderID, Freight, 'High'
FROM [SalesLT].[SalesOrderHeader]
WHERE Freight > 100;

SELECT SalesOrderID, Freight, 'Low'
FROM [SalesLT].[SalesOrderHeader]
WHERE Freight <= 100;

SELECT SalesOrderID, Freight, 'High'
FROM [SalesLT].[SalesOrderHeader]
WHERE Freight > 100
UNION ALL
SELECT SalesOrderID, Freight, 'Low'
FROM [SalesLT].[SalesOrderHeader]
WHERE Freight <= 100;

--Zadania z rozdzia�u 6.

SELECT MAX([Freight])
FROM [SalesLT].[SalesOrderHeader];

SELECT MAX([Freight])
FROM [SalesLT].[SalesOrderHeader]
GROUP BY [OrderDate];

SELECT MAX([Freight])
FROM [SalesLT].[SalesOrderHeader]
GROUP BY [OrderDate],[CustomerID];

SELECT [OrderDate], [CustomerID], MAX([Freight])
FROM [SalesLT].[SalesOrderHeader]
GROUP BY [OrderDate], [CustomerID];
GO

SELECT P.[Name], OD.[ProductID]
FROM [SalesLT].[Product] AS P 
	JOIN [SalesLT].[SalesOrderDetail] AS OD
		ON p.ProductID=od.ProductID;

SELECT P.[Name], COUNT(OD.[ProductID])
FROM [SalesLT].[Product] AS P 
JOIN [SalesLT].[SalesOrderDetail] AS OD
ON p.ProductID=od.ProductID
GROUP BY P.[Name];

SELECT P.[Name], COUNT(OD.[ProductID])
FROM [SalesLT].[Product] AS P 
JOIN [SalesLT].[SalesOrderDetail] AS OD
ON p.ProductID=od.ProductID
GROUP BY P.[Name]
HAVING COUNT(P.[Name])>3;
GO

CREATE TABLE #Sprzedaz
([ID klienta] INT NOT NULL, 
Miesi�c INT NOT NULL,
Warto�� MONEY NOT NULL);
GO
INSERT INTO #Sprzedaz
SELECT [CustomerID], DATEPART(MONTH, [OrderDate]), [TotalDue]
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT * 
FROM #Sprzedaz 
PIVOT (SUM(Warto��) 
FOR [Miesi�c] IN 
([4], [6])) 
AS piv;
GO

--Zadania z rozdzia�u 7.

SELECT [ProductNumber], COUNT([SalesOrderDetailID]) AS SalesCount
FROM [SalesLT].[SalesOrderDetail] AS OD
	JOIN [SalesLT].[Product] AS P
		ON P.ProductID=OD.ProductID
GROUP BY [ProductNumber];

SELECT [ProductNumber], COUNT([SalesOrderDetailID]) AS SalesCount
	,ROW_NUMBER () OVER (ORDER BY COUNT([SalesOrderDetailID]) DESC)
	,DENSE_RANK () OVER (ORDER BY COUNT([SalesOrderDetailID]) DESC)
FROM [SalesLT].[SalesOrderDetail] AS OD
JOIN [SalesLT].[Product] AS P
ON P.ProductID=OD.ProductID
GROUP BY [ProductNumber]
ORDER BY COUNT([SalesOrderDetailID]) DESC;
GO

SELECT YEAR([DueDate]) AS year, MONTH([DueDate]) AS month, DAY([DueDate]) AS day
FROM [SalesLT].[SalesOrderHeader];

SELECT YEAR([DueDate]) AS year, MONTH([DueDate]) AS month, DAY([DueDate]) AS day
	,SUM ([TotalDue]) OVER (PARTITION BY DAY([DueDate])) AS SalesPerDay
	,SUM ([TotalDue]) OVER (PARTITION BY MONTH([DueDate])) AS SalesPerMonth
	,SUM ([TotalDue]) OVER (PARTITION BY YEAR([DueDate])) AS SalesPerYear
	,SUM ([TotalDue]) OVER () AS OverallSales
FROM [SalesLT].[SalesOrderHeader];
GO

SELECT [SalesOrderID], [TotalDue],
	LAG ([TotalDue]) OVER (ORDER BY [SalesOrderID])
FROM [SalesLT].[SalesOrderHeader];

SELECT [SalesOrderID], [TotalDue],
	[TotalDue] - LAG ([TotalDue]) OVER (ORDER BY [SalesOrderID])
FROM [SalesLT].[SalesOrderHeader];
GO

--Zadania z rozdzia�u 8.

SELECT [CustomerID] 
FROM [SalesLT].[Customer]
WHERE LastName = 'Eminhizer';

SELECT[SalesOrderID]
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.CustomerID IN 
	(SELECT [CustomerID] 
	FROM [SalesLT].[Customer]
	WHERE LastName = 'Eminhizer'
	);
GO

SELECT TOP 10 WITH TIES [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader] AS OH
ORDER BY [TotalDue] DESC;

SELECT TOP 5 WITH TIES [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader] AS OH
ORDER BY [TotalDue] DESC;

SELECT TOP 5 WITH TIES [SalesOrderID], [TotalDue]
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.SalesOrderID NOT IN
	(SELECT TOP 10 WITH TIES [SalesOrderID]
	FROM [SalesLT].[SalesOrderHeader] AS OH
	ORDER BY [TotalDue] DESC)
ORDER BY [TotalDue] DESC;

SELECT MAX([OrderDate])
FROM [SalesLT].[SalesOrderHeader] AS OH
GROUP BY MONTH([OrderDate]);

SELECT MAX([OrderDate])
FROM [SalesLT].[SalesOrderHeader] AS OH
GROUP BY YEAR([OrderDate]), MONTH([OrderDate]);

SELECT OH.SalesOrderID, OH.OrderDate, OH.CustomerID
FROM [SalesLT].[SalesOrderHeader] AS OH
WHERE OH.OrderDate IN
	(SELECT MAX([OrderDate])
	FROM [SalesLT].[SalesOrderHeader] AS OH
	GROUP BY YEAR([OrderDate]), MONTH([OrderDate]));
GO

--Zadania z rozdzia�u 9.

SELECT [Name]
FROM [SalesLT].[Product]
UNION 
SELECT [Name]
FROM [SalesLT].[ProductCategory];

SELECT [Name]
FROM [SalesLT].[Product]
UNION ALL
SELECT [Name]
FROM [SalesLT].[ProductCategory];
GO

SELECT [SalesOrderID]
FROM [SalesLT].[SalesOrderDetail]
WHERE [UnitPrice]*.77 > 900

SELECT [SalesOrderID]
FROM [SalesLT].[SalesOrderDetail]
WHERE [UnitPrice] > 900 /.77
GO

SELECT [DueDate], [SalesOrderID], [TotalDue],
	LAG([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as PreviusTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];
GO

CREATE INDEX IdxSalesOrderHeaderPOC
ON [SalesLT].[SalesOrderHeader]
	([DueDate]) -- Partitioning and Ordering
	INCLUDE ([SalesOrderID], [TotalDue]) --Covering
GO

SELECT [DueDate], [SalesOrderID], [TotalDue],
	LAG([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as PreviusTotalDue
FROM [SalesLT].[SalesOrderHeader]
ORDER BY [DueDate];

SELECT [DueDate], [SalesOrderID], [TotalDue],
	LAG([TotalDue]) OVER (PARTITION BY [DueDate] ORDER BY [DueDate]) as PreviusTotalDue
FROM [SalesLT].[SalesOrderHeader] WITH (INDEX(1))
ORDER BY [DueDate];
GO

--Zadania z rozdzia�u 10.

SELECT [ListPrice],[StandardCost]
FROM [SalesLT].[Product] AS P
	JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE C.Name = 'Forks';

UPDATE [SalesLT].[Product]
SET [ListPrice] *=.75,
	[StandardCost] +=1
FROM [SalesLT].[ProductCategory] AS C
WHERE C.ProductCategoryID=[SalesLT].[Product].ProductCategoryID
AND C.Name = 'Forks';

SELECT [ListPrice],[StandardCost]
FROM [SalesLT].[Product] AS P
	JOIN [SalesLT].[ProductCategory] AS C
	ON C.ProductCategoryID=P.ProductCategoryID
WHERE C.Name = 'Forks';
GO

SELECT [CustomerID], [FirstName], [LastName]
FROM [SalesLT].[Customer]
WHERE RIGHT([FirstName],1)='a';

SELECT [CustomerID], [FirstName], [LastName]
INTO Panie
FROM [SalesLT].[Customer]
WHERE RIGHT([FirstName],1)='a';
GO

DELETE FROM Panie
WHERE [CustomerID]<50;
UPDATE Panie
SET [FirstName]='X'
WHERE [CustomerID]%2=1;
INSERT INTO Panie ([FirstName], [LastName])
VALUES ('Ala','Nowak');

WITH Klientki AS
(SELECT [CustomerID], [FirstName], [LastName]
FROM [SalesLT].[Customer]
WHERE RIGHT([FirstName],1)='a')
SELECT * FROM Klientki;

WITH Klientki AS
(SELECT [CustomerID], [FirstName], [LastName]
FROM [SalesLT].[Customer]
WHERE RIGHT([FirstName],1)='a')
MERGE INTO Panie AS C
USING Klientki AS K
ON (c.[CustomerID] = k.[CustomerID])
WHEN MATCHED AND c.[FirstName] <>k.[FirstName] THEN
  UPDATE SET C.[FirstName] = k.[FirstName]
WHEN NOT MATCHED THEN
  INSERT ([FirstName], [LastName])
  VALUES (k.[FirstName], k.[LastName])
WHEN NOT MATCHED BY SOURCE THEN
  DELETE;
GO

SELECT * FROM Panie;

--Zadania z rozdzia�u 12.
USE Test
GO
CREATE TABLE Uczestnicy(
ID INT IDENTITY PRIMARY KEY,
Imie VARCHAR(30) NOT NULL,
Nazwisko VARCHAR (40) NOT NULL,
EMail VARCHAR(50) NOT NULL,
Telefon VARCHAR(15) NOT NULL,
Kod CHAR(5) NOT NULL UNIQUE,
Miasto VARCHAR(30) NULL DEFAULT 'Katowice',
Wiek TINYINT NULL CHECK (Wiek BETWEEN 5 AND 105),
Plec CHAR(1) NULL CHECK (Plec IN ('K','M')));

CREATE TABLE Autorzy (
IDAutora INT IDENTITY PRIMARY KEY,
Imie VARCHAR(30) NOT NULL,
Nazwisko VARCHAR (40) NOT NULL);
CREATE TABLE Ksiazki (
IDKsiazki INT IDENTITY PRIMARY KEY,
Tytul VARCHAR(30) NOT NULL,
DataWydania DATE NOT NULL);
CREATE TABLE AutorzyKsiazki (
IDAutora INT REFERENCES Autorzy,
IDKsiazki INT REFERENCES Ksiazki);

CREATE TABLE Produkcja.Modele(
Nazwa VARCHAR (5) PRIMARY KEY);
GO
INSERT INTO Produkcja.Modele
VALUES ('BRAK!');
ALTER TABLE Produkcja.Towary 
ADD Model VARCHAR(5) REFERENCES Produkcja.Modele; 
GO
UPDATE Produkcja.Towary 
SET Model = 'BRAK!';
ALTER TABLE Produkcja.Towary
ALTER COLUMN Model VARCHAR(5) NOT NULL;
GO

--Zadania z rozdzia�u 13.
USE [AdventureWorksLT2012]
GO

SELECT c.Name AS Category, p.Name AS Product, p.ListPrice*1.23
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
ON P.ProductCategoryID = C.ProductCategoryID;

CREATE VIEW Zadanie1 AS
SELECT c.Name AS Category, p.Name AS Product, p.ListPrice*1.23 AS WithTax
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
ON P.ProductCategoryID = C.ProductCategoryID;

CREATE VIEW Zadanie1b (Category, Product, WithTax)
AS
SELECT c.Name, p.Name, p.ListPrice*1.23
FROM [SalesLT].[Product] AS P
JOIN [SalesLT].[ProductCategory] AS C
ON P.ProductCategoryID = C.ProductCategoryID;
GO

CREATE VIEW Zadanie2
AS
SELECT DISTINCT [FirstName] + ' ' + [LastName] AS Client, [SalesOrderID], [OrderDate]
FROM [SalesLT].[SalesOrderHeader] AS OH
JOIN [SalesLT].[Customer] AS C
ON C.CustomerID = OH.CustomerID;
GO

CREATE UNIQUE INDEX IdxSalesOrderPrice
ON [SalesLT].[SalesOrderDetail]([SalesOrderID],[UnitPrice])
GO

--Zadania z rozdzia�u 14.

REVOKE SELECT,UPDATE
ON [SalesLT].[Customer] (Phone)
FROM Dev;
DENY SELECT,UPDATE
ON [SalesLT].[Customer] (Phone)
TO Dev;
GO

GRANT CONTROL
ON [dbo].[BuildVersion]
TO Marcin
WITH GRANT OPTION;
GO