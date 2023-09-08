-- RANK
USE SimpliLearn;
SELECT Students.FirstName, Students.LastName, Marks.Total, RANK() OVER (ORDER BY Marks.Total DESC)
FROM Students
INNER JOIN Marks On Students.ID = Marks.StudentID;
SELECT *
FROM Marks;
SELECT *
FROM STudents;
UPDATE Marks
SET Science = 94
WHERE ID = 1;
UPDATE Marks
SET Total = Hist + Geo +Maths + Science;
SELECT Students.FirstName, Students.LastName, Marks.Total, DENSE_RANK() OVER (ORDER BY Marks.Total DESC)
FROM Students
INNER JOIN Marks On Students.ID = Marks.StudentID;
SELECT FirstName, LastName, Total, DENSE_RANK() OVER (ORDER BY Total DESC) AS RankVal
INTO #temp
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentId;
/*
declare @number int
set @number = 2
select @number
*/
CREATE TABLE #temp
(
FirstName CHAR(10)
, LastName CHAR(10)
, Total INT
, RankVal INT
);
CREATE TEMPORARY TABLE temp
SELECT FirstName, LastName, Total, DENSE_RANK() OVER (ORDER BY Total DESC) AS RankVal
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentId;
SELECT *
FROM temp;
SELECT *
FROM temp
WHERE RankVal = 2;
CREATE TEMPORARY TABLE @temp1
SELECT FirstName, LastName, Total, DENSE_RANK() OVER (ORDER BY Total DESC) AS RankVal
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentId;
/*
SESSION -4
- 1. Query to display Student who scored the minimum mark in Maths
- 2. Query to display Student with the highest total
- 3. Query to display Teacher who has the Student with the highest total
- 4. Query to display Teacher who has the highest average
- 5. Query to display Teachers who have students in bengaluru 
*/










