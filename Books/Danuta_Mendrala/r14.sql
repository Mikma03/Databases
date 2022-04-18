CREATE LOGIN [sql\Danka]
FROM WINDOWS;
-- KONTO DANKA MUSI JUZ ISTNIEC W DOMENIE SQL

CREATE LOGIN [SQL\Marcin] 
FROM WINDOWS 
WITH DEFAULT_DATABASE=[AdventureWorksLT2012];
-- KONTO MARCIN MUSI JUZ ISTNIEC W DOMENIE SQL

USE [AdventureWorksLT2012];
GO
CREATE USER Danka
FOR LOGIN [SQL\Danka];
GO

CREATE USER Marcin
FOR LOGIN [SQL\Marcin];
USE Test;
CREATE USER Micha�
FOR LOGIN [SQL\Marcin];

EXECUTE AS LOGIN ='Marcin'

SELECT *
FROM [AdventureWorksLT2012].[SalesLT].[Product];

REVERT

CREATE ROLE Dev;
CREATE ROLE Marketing;

DROP ROLE Marketing;
DROP ROLE db_ddladmin;

EXEC sp_addrolemember 'Dev', 'Marcin';
EXEC sp_addrolemember 'Dev', 'Danka';

EXEC sp_addrolemember 'db_backupoperator', 'Danka';

EXEC sp_droprolemember 'Public', 'Danka';

GRANT SELECT,INSERT,UPDATE,DELETE
ON [SalesLT].[Customer]
TO Dev;

REVOKE INSERT,UPDATE,DELETE
ON [SalesLT].[Customer]
FROM Marcin;
GO

EXECUTE AS USER ='Marcin'

SELECT FirstName
FROM [SalesLT].[Customer];
GO

UPDATE [SalesLT].[Customer]
SET FirstName='OOPS'
WHERE CustomerID=1;
GO
REVERT

DENY INSERT,UPDATE,DELETE
ON [SalesLT].[Customer]
TO Marcin;

EXECUTE AS USER ='Marcin'

DELETE FROM [SalesLT].[Customer]
WHERE CustomerID=1;
REVERT

DENY UPDATE
ON [SalesLT].[Customer] ([LastName])
TO Danka;
GO

EXECUTE AS USER ='Danka'

UPDATE [SalesLT].[Customer]
SET [CompanyName]='Test'
WHERE CustomerID=1;
GO

UPDATE [SalesLT].[Customer]
SET [LastName] ='Test'
WHERE CustomerID=1;
GO

REVERT

GRANT SELECT,INSERT,UPDATE,DELETE
ON Schema::SalesLT
TO Dev;
GO

GRANT ALL 
ON [SalesLT].[Bikes]
TO Danka
WITH GRANT OPTION;
GO

EXECUTE AS USER ='Danka'
GRANT SELECT
ON [SalesLT].[Bikes]
TO Marcin;
REVERT


