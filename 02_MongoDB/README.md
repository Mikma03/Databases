# Mongo Databases - resources and introduction

# Table of contents

<p>&nbsp;</p>

- [Introduction](#Introduction)

- [M001: MongoDB Basics](#M001-MongoDB-Basics)

- [JSON and BSON](#JSON-and-BSON)

<p>&nbsp;</p>


# Introduction

<p>&nbsp;</p>

MongoDB and introduction to this database. Free courses avaliable on MongoDB webside: 

<p>&nbsp;</p>

- Course provided by Mongo University
    - https://university.mongodb.com/courses/catalog

<p>&nbsp;</p>

# M001 MongoDB Basics - introduction

- MongoDB Basic
    - https://university.mongodb.com/mercury/M001/2022_February_1/overview

<p>&nbsp;</p>

So what is the MongoDB Database. A database, meaning a structured way to store and access data. More specifically, it is a NoSQL database. NoSQL is a very generic term used to describe any data store that doesn't use legacy approach of related tables of data. This means that you're storing your data in an organized way, but not in rows and columns An example of NoSQL databases can be anything from a library card catalog, to a more sophisticated data store like MongoDB.

Since the range of what NoSQL means is so wide, we must narrow our definition further. MongoDB is a NoSQL document database. This means that data in MongoDB is stored as documents. We will cover what a document is in the next lesson. These documents are in turn stored in what we call collections of documents. That's why MongoDB is categorized as a NoSQL document database. In conclusion, the MongoDB database is a NoSQL document database.

<p>&nbsp;</p>


**Document** - a way to organize and store data as a set of field-value pairs.

**Field** - a unique identifier for a datapoint.

**Value** - data related to a given identifier.

**Collection** - an organized store of documents in MongoDB, usually with common fields between documents. There can be many collections per database and many documents per collection.

**Instance** - a single machine locally or in the cloud, running a certain software, in our case it is the MongoDB database.

**Cluster** - group of servers that store your data.

<p>&nbsp;</p>

# JSON and BSON

<p>&nbsp;</p>

- JSON vs BSON article
    - https://www.mongodb.com/json-and-bson

<p>&nbsp;</p>

BSON simply stands for “Binary JSON,” and that’s exactly what it was invented to be. BSON’s binary structure encodes type and length information, which allows it to be parsed much more quickly.

Since its initial formulation, BSON has been extended to add some optional non-JSON-native data types, like dates and binary data, without which MongoDB would have been missing some valuable support.

Languages that support any kind of complex mathematics typically have different sized integers (ints vs longs) or various levels of decimal precision (float, double, decimal128, etc.).

Not only is it helpful to be able to represent those distinctions in data stored in MongoDB, it also allows for comparisons and calculations to happen directly on data in ways that simplify consuming application code.

<p>&nbsp;</p>

# Documentation

<p>&nbsp;</p>

- MongoDB documentation
    - https://docs.mongodb.com/manual/reference/operator/update/#id1

# Com

```
mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"
```
```
mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.json
```
```
mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump
```
```
mongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json
```

