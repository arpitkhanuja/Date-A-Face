CREATE DATABASE sail_db;

USE sail_db;

CREATE TABLE User (
firstName CHAR(20) NOT NULL, 
lastName CHAR(20) NOT NULL, 
email CHAR(40) PRIMARY KEY, 
phone CHAR(10), 
profileUrl CHAR(50) NOT NULL, 
rating FLOAT
);

CREATE TABLE Item (
id INT PRIMARY KEY, 
name CHAR(20),
shortDes CHAR(50), 
longDesc CHAR(180), 
price FLOAT NOT NULL, 
userId CHAR(40) UNIQUE,
CONSTRAINT fk_userIdemail FOREIGN KEY (userId) REFERENCES User(email) ON DELETE CASCADE
);

CREATE TABLE Category  (
id INT PRIMARY KEY,
categoryName CHAR(50) NOT NULL,
CONSTRAINT fk_itemIdcat FOREIGN KEY (id) REFERENCES Item(id) ON DELETE CASCADE
);

CREATE TABLE Location  (
userId CHAR(40) PRIMARY KEY, 
city CHAR(30) NOT NULL, 
state CHAR(30) NOT NULL, 
curAddress CHAR(50) NOT NULL,
CONSTRAINT fk_locIdemail FOREIGN KEY (userId) REFERENCES User(email) ON DELETE CASCADE
);

CREATE TABLE Sold (
buyerId CHAR(40) NOT NULL,
sellerId CHAR(40) NOT NULL, 
typeOfTrans CHAR(20) NOT NULL, 
timestamp DATE NOT NULL, 
itemId INT PRIMARY KEY
);