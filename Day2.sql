SELECT *
FROM Students;
SELECT ID, FirstName
FROM Students
WHERE LastName IS NULL;
SELECT *
FROM Students
WHERE Address LIKE '%Coimbatore%';
SELECT *
FROM Students
WHERE FirstName = 'Divya';
SELECT *
FROM Students
WHERE Address NOT LIKE '%Coimbatore%';
SELECT *
FROM Teachers;
SELECT FirstName, LastName
FROM Students
WHERE Address LIKE '%Coimbatore%'
union
SELECT FirstName, LastName
FROM Teachers
WHERE Address LIKE '%Coimbatore%';
ALTER TABLE Students
ADD TeacherId INT;
ALTER TABLE Teachers
ADD PRIMARY KEY (ID);
ALTER TABLE Students
ADD CONSTRAINT Student_Teacher_FK FOREIGN KEY (TeacherId)
REFERENCES Teachers (ID);
SELECT *
FROM STudents;
UPDATE Students
SET TeacherId = 1
WHERE ID in (1,4);
UPDATE Students
SET TeacherId = 2
WHERE ID in (2,6);
UPDATE Students
SET TeacherId = 3
WHERE ID in (3,5);
SELECT *
FROM STudents;

/* DDL
CREATE: This command is used to create the database or its objects (like table, index, function, views, store procedure, and triggers).
DROP: This command is used to delete objects from the database.
ALTER: This is used to alter the structure of the database.
TRUNCATE: This is used to remove all records from a table, including all spaces allocated for the records are removed.
COMMENT: This is used to add comments to the data dictionary.
RENAME: This is used to rename an object existing in the database. */

/* DML
INSERT: It is used to insert data into a table.
UPDATE: It is used to update existing data within a table.
DELETE: It is used to delete records from a database table.
LOCK: Table control concurrency.
CALL: Call a PL/SQL or JAVA subprogram.
EXPLAIN PLAN: It describes the access path to data.*/

-- JOINS

SELECT STU.FirstName, STU.LastName, TEA.FirstName, TEA.LastNAme
FROM Students AS STU
INNER JOIN Teachers AS TEA
ON STU.TeacherId = TEA.ID;
SELECT * 
FROM Students;
-- Count no. of students for each teacher
SELECT tea.FirstName, tea.LastName, Count(stu.Id)
FROM Teachers tea
LEFT JOIN Students stu on tea.Id = stu.TeacherId
GROUP BY tea.Id;
UPDATE Students
SET TeacherId = 1
WHERE ID in (1,2,4,6);
SELECT *
FROM Students;
SELECT Teachers.FirstName, Teachers.LastName, COUNT(Students.ID)
FROM Teachers
LEFT JOIN Students ON Teachers.ID = Students.TeacherId
GROUP BY Teachers.ID;
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
-- 1.
SELECT MIN(Maths) as  'MINIMUM MATHS MARK'
FROM Marks;
-- RIGHT JOIN Students on Marks.ID = Students.ID;
-- WHATEVER JOINS USED SAME RESULT ?
-- 2.








