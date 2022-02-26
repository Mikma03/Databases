# Table of contents

<p>&nbsp;</p>

1. [Introduction](#Introduction)

2. [M001: MongoDB Basics](#M001-MongoDB-Basics)

3. [JSON and BSON](#JSON-and-BSON)

<p>&nbsp;</p>


# Introduction

MongoDB and introduction to this database. 

Free courses avaliable on MongoDB webside: [Link](https://university.mongodb.com/courses/catalog)

<p>&nbsp;</p>

# M001 MongoDB Basics

>[Link](https://university.mongodb.com/mercury/M001/2022_February_1/overview)

<p>&nbsp;</p>

So what is the MongoDB Database.A database, meaning a structured way to store and access data. More specifically, it is a NoSQL database. NoSQL is a very generic term used to describe any data store that doesn't use legacy approach of related tables of data. This means that you're storing your data in an organized way, but not in rows and columns An example of NoSQL databases can be anything from a library card catalog, to a more sophisticated data store like MongoDB.

Since the range of what NoSQL means is so wide, we must narrow our definition further. MongoDB is a NoSQL document database. This means that data in MongoDB is stored as documents. We will cover what a document is in the next lesson. These documents are in turn stored in what we call collections of documents. That's why MongoDB is categorized as a NoSQL document database. In conclusion, the MongoDB database is a NoSQL document database.

<p>&nbsp;</p>


**Document** - a way to organize and store data as a set of field-value pairs.

**Field** - a unique identifier for a datapoint.

**Value** - data related to a given identifier.

**Collection** - an organized store of documents in MongoDB, usually with common fields between documents. There can be many collections per database and many documents per collection.


<p>&nbsp;</p>

# JSON and BSON

> [Link to article](https://www.mongodb.com/json-and-bson)

BSON simply stands for “Binary JSON,” and that’s exactly what it was invented to be. BSON’s binary structure encodes type and length information, which allows it to be parsed much more quickly.

Since its initial formulation, BSON has been extended to add some optional non-JSON-native data types, like dates and binary data, without which MongoDB would have been missing some valuable support.

Languages that support any kind of complex mathematics typically have different sized integers (ints vs longs) or various levels of decimal precision (float, double, decimal128, etc.).

Not only is it helpful to be able to represent those distinctions in data stored in MongoDB, it also allows for comparisons and calculations to happen directly on data in ways that simplify consuming application code.


# Documentation


> [Link to doc](https://docs.mongodb.com/manual/reference/operator/update/#id1)



