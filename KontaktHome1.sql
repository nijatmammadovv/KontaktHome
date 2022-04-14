CREATE DATABASE KontaktHome1
USE KontaktHome1

CREATE TABLE Products
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(255) NOT NULL,
Brand nvarchar(255) NOT NULL,
Model nvarchar (255) NOT NULL,
Color nvarchar(255),
CostPrice decimal,
SalePrice decimal,
CategoryId int references Categories (Id)
)
CREATE TABLE Categories
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar (255) NOT NULL
)
CREATE TABLE Carts
(
Id int identity (1,1) PRIMARY KEY,
ProductId int references Products (Id)
)
INSERT INTO Categories(Name)
VALUES('Telefon ve Plansetler')
INSERT INTO Categories(Name)
VALUES('Saatlar ve qolbaqlar')
INSERT INTO Categories(Name)
VALUES('Komputer ve aksesuarlar')
SELECT * FROM Categories

INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('PHONE',542.25,650,'SAMSUNG','A50','RED')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('PHONE',799,1150,'IPHONE','13PRO','WHITE')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('PHONE',287,555,'XIAOMI','NOTE9','BLUE')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('COMPUTER',1453,2000,'HP','15-DA2033NT ','BLACK')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('COMPUTER',2099,2555,'ACER','Aspire 3','GREEN')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('COMPUTER',705,799,'LENOVO','CREATOR 7i','YELLOW')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('MOUSE',175,189,'HP','Z3700 Wireless Mouse','BLACK')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('MOUSE',98,120,'ACER','Z2700 Wireless Mouse','BLUE')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('SMART WATCH',299,350,'HUAWEI','GT 3 Milo B-19T 42 mm','ORANGE')
INSERT INTO Products(Name,CostPrice,SalePrice,Brand,Model,Color)
VALUES('SMART WATCH',1198,1455.55,'Apple','Watch 6 40 Mm','GOLD')
SELECT * FROM Products

SELECT * FROM Products
INNER JOIN Carts
ON
Carts.ProductId=Products.Id


SELECT SUM(SalePrice)
FROM Products

CREATE PROCEDURE TotalPrice
AS
SELECT SUM(SalePrice)
FROM Products

EXEC TotalPrice

CREATE VIEW Value 
AS
SELECT Categories.Id,Categories.Name
FROM Categories
SELECT * FROM Categories

SELECT * FROM Value

CREATE VIEW Value1
AS
SELECT * FROM Products

SELECT * FROM Value1

CREATE VIEW Value2
As
SELECT * FROM Carts

SELECT * FROM Value2
-----------------------------------------
CREATE PROCEDURE usp_CARTSTotalPrice @ProductId int
AS
INSERT INTO Carts(ProductId)
VALUES(@ProductId)
EXEC usp_CARTSTotalPrice 1
SELECT * FROM Carts

----------------------------------------
CREATE PROCEDURE usp_CartsAddDelete @ProductId int
AS
DELETE FROM Carts Where ProductId=@ProductId

EXEC usp_CartsAddDelete 1
----------------------------------------
CREATE TRIGGER ADDDELETE
ON Carts
AFTER INSERT,DELETE
AS
      SELECT Products.Name,Products.SalePrice FROM Carts
	  INNER JOIN Products
	  ON
	  Carts.ProductId=Products.Id
---------------------------------------
SELECT Products.Name,Products.Brand,Products.Model,Products.Color,Products.CostPrice,Products.SalePrice,Categories.Name FROM Products
INNER JOIN Carts
ON
Carts.ProductId=Products.Id
JOIN Categories
on 
Categories.Id=Products.CategoryId

