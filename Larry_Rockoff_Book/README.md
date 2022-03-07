# The Language of SQL

<p>&nbsp;</p>

# Table of contents

<p>&nbsp;</p>

1. [Introduction](#Introduction)

2. [Basic SQL - MS SQL Server](#Basic-SQL---MS-SQL-Server)

<!-- Basic SQL - MS SQL Server -->

<p>&nbsp;</p>

# Introduction

<p>&nbsp;</p>

DML, DDL, DCI

- Folder in this repository is based on:
    - https://www.amazon.com/Language-SQL-Learning-Larry-Rockoff/dp/0134658256

<p>&nbsp;</p>

# Basic SQL - MS SQL Server

Select example:

```
SELECT column_list
FROM table

```

Comment example:po

```
SELECT
/* to jest pierwszy komentarz */
ImięKlienta,
NazwiskoKlienta /*to jest drugi komentarz
to jest dalsza część drugiego komentarza
tutaj znajduje się koniec drugiego komentarza */
FROM Klienci
```

Alias

```
SELECT
IDSprzedaży,
ImięKlienta,
NazwiskoKlienta,
ImięKlienta + ' ' + NazwiskoKlienta AS 'Nazwa'
FROM Sprzedaż
```
