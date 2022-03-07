# Modern Big Data Analysis with SQL

<p>&nbsp;</p>

# Table of contents

<p>&nbsp;</p>

1. [Introduction](#Introduction)

2. [Theory - SQL & Databases](#Theory---SQL-&-Databases)

3. []


<p>&nbsp;</p>

# Introduction

<p>&nbsp;</p>

This folder is realization of the followng course:

<p>&nbsp;</p>

- Modern Big Data Analysis with SQL provided by Cloudera
    - https://www.coursera.org/specializations/cloudera-big-data-analysis-sql

<p>&nbsp;</p>

# Theory - SQL & Databases

<p>&nbsp;</p>

The terms on my list are all commonly used in discussions about relational databases and SQL, with one exception: DQL (Data Query Language). Because DQL is a category with only one statement in it, some people may never learn or say "DQL"; they just say "SELECT." 

In fact, some people include the SELECT statement in the category of DML. I don't use that classification (and I think I'm in the majority), but when you're talking to someone new, be aware that you may need to clear things up with them when they say "DML": Do they mean INSERT-UPDATE-DELETE statements, or do they also include SELECT in the DML category?

There's one more muddy word: query. For most people, the word query is another name for the SELECT statement. This is reasonable, because the English word query is another word for question, and whenever you ask the database a question, you do so by issuing a SELECT statement. But for some people, query can refer to any SQL statement, of any kind at all! This doesn't make good sense to me, but I've heard the words "database query" used in this way many times through the years

<p>&nbsp;</p>

- Primary key
    - https://www.techopedia.com/definition/5547/primary-key

<p>&nbsp;</p>

# SELECT Statements in Transactions

<p>&nbsp;</p>

In the categories of different SQL statements, the SELECT statement can be classified in its own separate category of data query language, or DQL. Alternatively, some people group the SELECT command together with INSERT, UPDATE, and DELETE in the data manipulation language, or DML category. It is true that SQL provides a seamless combination of all the different kinds of statements, but there is an important way that SELECT statements interact with DML statements: in transactions. 

Transactions let you combine multiple INSERT, UPDATE, and DELETE statements in a single atomic action. You can also have a SELECT statement participating in and informing a transaction. For example, a transaction can UPDATE a row, then run a SELECT to check the resulting provisional state of the database, then COMMIT or ROLLBACK depending on the result of the SELECT. The pending database change provided in the UPDATE—while isolated from other user sessions—is reported to your own transaction. This ability to see changes in the database while they are still pending is one way that SELECT statements may be considered part of DML.

The emphasis here is that ACID-compliant systems let you combine SELECT with INSERT, UPDATE, and DELETE statements in a transaction. A number of the features in relational systems depend upon this combination of statements for their implementation.

<p>&nbsp;</p>

# Big Data

<p>&nbsp;</p>

What about Velocity?
The common characteristics of big data applications, called "the three Vs of big data," are volume, variety, and velocity. (Some people like to add a few more Vs in their discussions, like value and veracity.) 

The velocity of data—the speed at which data is generated in modern systems—is another dimension that has grown notably in recent years with the rise of the internet, especially social media. Popular search and social media sites commonly generate billions of messages per day.

Another major increase in the velocity of data generation is underway now, with the rise of the internet of things, or IoT. Already, navigation apps on smart phones generate individual location records at high frequency. In the near future, metrics like location, temperature, vibration, and fuel level will be reported by all kinds of transportation vehicles, and other data points will be produced by devices in manufacturing, distribution, retail, medicine, and home life.

<p>&nbsp;</p>

