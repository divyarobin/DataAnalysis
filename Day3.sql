/*
SESSION - 3
1.- Query to display the minimum maths mark of all
2.- Query to display the average maths, average science, average Geo and average History(to let the dev decide if it should in same or difference queries)
3.- Query to display all Teachers(First Name, Last Name) whose phone numbers start with 9
4.- Query to display all students whose teachers reside in Bengaluru(Students.FirstName Students.LastName)
5.- Query to add column StudentId to Marks table
6.- Query to add Students.Id as Primary Key
7.- Query to add Foreign Key constraint to Marks.StudentsId
8.- Query to update StudentIds to Marks.StudentId
9.- Query to display Students.FirstName, Students.LastName, Marks.Total (using INNER/OUTER join)
*/
SELECT *
FROM Marks;
ALTER TABLE Marks
DROP COLUMN StudentID;
-- 1.Query to display the minimum maths mark of all
SELECT MIN(Maths) as  'MINIMUM MATHS MARK'
FROM Marks;
-- 2.Query to display the average maths, average science, average Geo and average History(to let the dev decide if it should in same or difference queries)
SELECT AVG(Maths) AS 'Average Maths Mark',
AVG(Science) AS 'Average Science Mark', 
AVG(Geo) AS 'Average Geography Mark', 
AVG(Hist) AS 'Average History Mark'
FROM Marks;
-- 3.- Query to display all Teachers(First Name, Last Name) whose phone numbers start with 9
SELECT CONCAT(FirstName, ' ', COALESCE(LastName,'')), PhoneNo
FROM Teachers
WHERE PhoneNo LIKE '9%';
-- 4.- Query to display all students whose teachers reside in Bengaluru(Students.FirstName Students.LastName)
-- WHY does Teachers have null at the bottom?
-- Any Join used same result?
SELECT *
FROM Teachers;
SELECT *
FROM Students;
INSERT INTO Teachers VALUES
(4,'Ullom', 'Park', 'Bangalore', '9979047823');
SELECT * FROM Teachers;
UPDATE Students
SET TeacherId = 4
WHERE ID = 6;
SELECT Students.FirstName, Students.LastName
FROM Students
INNER JOIN Teachers on Students.TeacherId = Teachers.ID
WHERE Teachers.Address LIKE '%Bangalore%';
-- 5.- Query to add column StudentId to Marks table
ALTER TABLE Marks
ADD StudentID INT;
-- 6.- Query to add Students.Id as Primary Key
ALTER TABLE Students
ADD PRIMARY KEY(ID);
-- 7.- Query to add Foreign Key constraint to Marks.StudentsId
ALTER TABLE Marks
ADD CONSTRAINT Student_Marks_FK FOREIGN KEY (StudentID)
REFERENCES Students(ID);
-- 8.- Query to update StudentIds to Marks.StudentId
-- How to perform Looping?
UPDATE Marks
SET StudentId = 1
WHERE ID = 1;
UPDATE Marks
SET StudentId = 2
WHERE ID = 2;
UPDATE Marks
SET StudentId = 3
WHERE ID = 3;
UPDATE Marks
SET StudentId = 4
WHERE ID = 4;
UPDATE Marks
SET StudentId = 5
WHERE ID = 5;
UPDATE Marks
SET StudentId = 6
WHERE ID = 6;
SELECT *
FROM Marks;
-- 9.- Query to display Students.FirstName, Students.LastName, Marks.Total (using INNER/OUTER join)
-- How does Join matter in this?
SELECT Students.FirstName, Students.LastName, Marks.Total
FROM Marks
INNER JOIN Students ON Marks.StudentID = Students.ID;

-- select CONCAT(FirstName, IIF(LastName is not null, (',' + LastName) , '')) from Students
