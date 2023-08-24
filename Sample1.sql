CREATE DATABASE SimpliLearn;
USE SimpliLearn;
CREATE TABLE Students
(
ID int,
FirstName char(20),
LastName char(20),
Address char(100)
);
# DROP TABLE Students
CREATE TABLE Teachers
(
ID int,
FirstName char(20),
LastName char(20),
Address char(100),
PhoneNo char(20)
);
CREATE TABLE Marks
(
ID int,
Hist int,
Geo int,
Maths int,
Science int,
Total int
);
INSERT INTO Students VALUES
(1, 'Divya', 'Robin', 'New Thillai Nagar, Coimbatore'),
(2, 'Tara', 'Benedict', 'San Jose, CA'),
(3, 'Neyah', 'Robin', 'New Thillai Nagar, Coimbatore'),
(4, 'Dev','Gopi','Seattle WA'),
(5, 'Arjun', 'Doggy','Blue Cross');
INSERT INTO Students(ID, FirstName, Address) VALUES
(6, 'Tata','Gujarat'); 
INSERT INTO Teachers VALUES
(1, 'INDU','Lekha','Coimbatore,India', '7397665162'),
(2, 'Gomez','Leon','San Jose CA', '7657927865'),
(3, 'Tina','Cruz','Coimbatore', '9870678945');
INSERT INTO Marks(ID,Hist,Geo,Maths,Science) VALUES
(1,87,88,89,90),
(2,88,89,90,91),
(3,99,98,95,94),
(4,98,94,90,88),
(5,88,89,89,78),
(6,90,91,92,93);
SELECT *
FROM Students;
SELECT *
FROM Teachers;
SELECT *
FROM Marks;
SET SQL_SAFE_UPDATES = 0;
UPDATE Marks
SET Total = Hist+Geo+Maths+Science;
SELECT *
FROM Marks;
SELECT *
FROM Students
ORDER BY FirstName,LastName;
SELECT *
FROM Students
ORDER BY ID DESC, FirstName;
SELECT *
FROM Students
ORDER BY Address, FirstName;
SELECT SUM(Hist)
FROM Marks;
SELECT Hist, SUM(Hist)
FROM Marks
GROUP BY Hist;
SELECT CONCAT(FirstName,' ',LastName), Address
FROM Students;
SELECT CONCAT(FirstName, ' ', COALESCE(LastName,'')), Address
FROM Students;