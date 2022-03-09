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

CRUD

```
-- Create the table
CREATE TABLE tracks(
  -- Create track column
  track VARCHAR(200), 
  -- Create album column
  album VARCHAR(160), 
  -- Create track_length_mins column
  track_length_mins INT
);
-- Complete the statement to enter the data to the table     
INSERT INTO tracks 
-- Specify the destination columns
(track, album, track_length_mins) 
-- Insert the appropriate values for track, album and track length
VALUES 
  ('Basket Case', 'Dookie', 3);
-- Select all columns from the new table
SELECT 
  * 
FROM 
  tracks;
  ```

  Declare variable

  ```
  -- Declare your variables
DECLARE @start DATE
DECLARE @stop DATE
DECLARE @affected INT;
-- SET the relevant values for each variable
SET @start = '2014-01-24'
SET @stop  = '2014-07-02'
SET @affected =  5000 ;

SELECT 
  description,
  nerc_region,
  demand_loss_mw,
  affected_customers
FROM 
  grid
-- Specify the date range of the event_date and the value for @affected
WHERE event_date BETWEEN @start AND @stop
AND affected_customers >= @affected;
```

Example of using


```
SELECT  album.title AS album_title,
  artist.name as artist,
  MAX(track.milliseconds / (1000 * 60) % 60 ) AS max_track_length_mins
-- Name the temp table #maxtracks
INTO #maxtracks
FROM album
-- Join album to artist using artist_id
INNER JOIN artist ON album.artist_id = artist.artist_id
-- Join track to album using album_id
INNER JOIN track ON album.album_id = track.album_id
GROUP BY artist.artist_id, album.title, artist.name, album.album_id
-- Run the final SELECT query to retrieve the results from the temporary table
SELECT album_title, artist, max_track_length_mins
FROM  #maxtracks
ORDER BY max_track_length_mins DESC, artist;
```

Keys

```
-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;

-- Make id a primary key
ALTER TABLE professors 
ADD CONSTRAINT professors_pkey PRIMARY KEY (id);

-- Have a look at the first 10 rows of professors
SELECT * 
FROM professors 
LIMIT 10;
```