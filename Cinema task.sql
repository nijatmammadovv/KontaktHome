CREATE DATABASE CINEMA
USE CINEMA

CREATE TABLE Customers
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(50) NOT NULL,
Surname nvarchar(50) NOT NULL,
Age int
)
CREATE TABLE Actors
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(50) Not Null,
Surname nvarchar(50) Not Null,
Age int
)
CREATE TABLE Tickets
(
Id int identity (1,1) PRIMARY KEY,
Solddate DATETIME,
Price decimal,
Place int,
CustomerId int references Customers (Id),
HallId int references Halls (Id),
FilmId int references Films (Id),
SessionId int references Session (Id)
)
CREATE TABLE Halls
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(255),
SeatCount int
)
CREATE TABLE Films
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(255),
Releasedate date
)
CREATE TABLE Genres
(
Id int identity (1,1) PRIMARY KEY,
Name nvarchar(255) Not Null
)
CREATE TABLE Session
(
Id int identity (1,1) PRIMARY KEY,
SessionTime time
)
CREATE TABLE FilmActors
(
Id int identity (1,1) PRIMARY KEY,
FilmId int references Films (Id),
ActorId int references Actors (Id)
)
CREATE TABLE FilmGenres
(
Id int identity (1,1) PRIMARY KEY,
FilmId int references Films (Id),
GenreId int references Genres (Id)
)

INSERT INTO Actors(Name,Surname,Age)
VALUES('Akif','Islamzade',21)
INSERT INTO Actors(Name,Surname,Age)
VALUES('Vuqar','Babayev',27)
INSERT INTO Actors(Name,Surname,Age)
VALUES('Polad','Alemdar',47)
INSERT INTO Actors(Name,Surname,Age)
VALUES('Nahid','Ceferov',56)
INSERT INTO Actors(Name,Surname,Age)
VALUES('Nazim','Eliyev',21)
SELECT * FROM Actors
--------------------------------------------------------------------
INSERT INTO Customers(Name,Surname,Age)
VALUES('Kerim','Ceferov',37)
INSERT INTO Customers(Name,Surname,Age)
VALUES('Aydin','Abbasov',48)
INSERT INTO Customers(Name,Surname,Age)
VALUES('Yasir','Agalarov',27)
INSERT INTO Customers(Name,Surname,Age)
VALUES('Meherrem','Ibadov',19)
INSERT INTO Customers(Name,Surname,Age)
VALUES('Pervin','Zeynalov',56)
SELECT * FROM Customers
----------------------------------------------------------------------
INSERT INTO Halls(Name,SeatCount)
VALUES('PAŞA Bank',60)
INSERT INTO Halls(Name,SeatCount)
VALUES('Bolkart',40)
INSERT INTO Halls(Name,SeatCount)
VALUES('Zal 4',38)
INSERT INTO Halls(Name,SeatCount)
VALUES('Zal 3',46)
INSERT INTO Halls(Name,SeatCount)
VALUES('Zal 2',70)
SELECT * FROM Halls
-----------------------------------------------------------------------
INSERT INTO Films(Name,Releasedate)
VALUES('İtirilmiş Şeher','2022-04-13')
INSERT INTO Films(Name,Releasedate)
VALUES('Morbius','2022-04-12')
INSERT INTO Films(Name,Releasedate)
VALUES('Betmen','2022-04-09')
INSERT INTO Films(Name,Releasedate)
VALUES('9 gülle','2022-04-03')
INSERT INTO Films(Name,Releasedate)
VALUES('Tecili yardım','2022-03-31')
SELECT * FROM Films
------------------------------------------------------------------------
INSERT INTO Genres(Name)
VALUES('Fantastika')
INSERT INTO Genres(Name)
VALUES ('Romantika')
INSERT INTO Genres(Name)
VALUES ('Aksiyon')
INSERT INTO Genres(Name)
VALUES ('Komediya')
INSERT INTO Genres(Name)
VALUES('Dram')
SELECT * FROM Genres
-------------------------------------------------------------------------
INSERT INTO Session(SessionTime)
VALUES('10:45:05')
INSERT INTO Session(SessionTime)
VALUES('11:35:20')
INSERT INTO Session(SessionTime)
VALUES('12:25:27')
INSERT INTO Session(SessionTime)
VALUES('14:45:59')
INSERT INTO Session(SessionTime)
VALUES('18:50:16')
SELECT * FROM Session
-------------------------------------------------------------------------
INSERT INTO Tickets(Solddate,Price,Place)
VALUES('2022-04-13',7,3)
INSERT INTO Tickets(Solddate,Price,Place)
VALUES('2022-04-12',5.54,18)
INSERT INTO Tickets(Solddate,Price,Place)
VALUES('2022-04-09',13,23)
INSERT INTO Tickets(Solddate,Price,Place)
VALUES('2022-04-04',12.43,30)
INSERT INTO Tickets(Solddate,Price,Place)
VALUES('2022-03-31',4,45)
SELECT * FROM Tickets
