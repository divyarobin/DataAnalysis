/*
- 1. Query to display the students marks of students who live in Coimbatore along with their FirstName LastName
- 2. Query to display the Address of the teacher whose student scored the highest total
- 3. Query to display the Teachers Name and Address followed by Student's Name and address of all those who do not live in Coimbatore
- 4. Query to display the Students details along with their social studies mark(History and Geography combined) and order it by desc
- 5. Query to Rank the students based on their Maths Mark
- 6. Query to display the Students name and average and order it by desc
*/
USE SimpliLearn;
-- 1. Query to display the students marks of students who live in Coimbatore along with their FirstName LastName
SELECT Students.FirstName, Students.LastName, Marks.Total
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentID
WHERE Students.Address LIKE '%Coimbatore%';
-- 2. Query to display the Address of the teacher whose student scored the highest total
DROP TABLE temp1;
CREATE TEMPORARY TABLE temp1
SELECT Teachers.FirstName, Teachers.LastName, Teachers.Address, DENSE_RANK() OVER(ORDER BY Marks.Total DESC) AS RankVal
FROM Teachers
INNER JOIN Students ON Teachers.ID = Students.TeacherId
INNER JOIN Marks ON Students.ID = Marks.StudentID;
SELECT *
FROM temp1
WHERE RankVal = 1;
-- 3. Query to display the Teachers Name and Address followed by Student's Name and address of all those who do not live in Coimbatore
-- USE INNER OR LEFT JOIN - Do we need address of Teachers who dont have students as well?
-- DON'T KNOW
SELECT Teachers.FirstName, Teachers.LastName, Teachers.Address, Students.FirstName, Students.LastName, Students.Address
FROM Teachers
LEFT JOIN Students ON Teachers.ID = Students.TeacherId
WHERE (Students.Address NOT LIKE '%Coimbatore%') AND (Teachers.Address NOT LIKE '%Coimbatore%');
SELECT *
FROM Teachers;
SELECT FirstName, LastName,Address
FROM Teachers
WHERE Address NOT LIKE '%Coimbatore%'
UNION
SELECT FirstName, LastName,Address
FROM Students
WHERE Address NOT LIKE '%Coimbatore%';
-- 4. Query to display the Students details along with their social studies mark(History and Geography combined) and order it by desc
SELECT Students.ID, Students.FirstName, Students.LastName, Students.Address, Students.TeacherID, Students.Section, (Marks.Hist + Marks.Geo) AS Social
FROM Students 
INNER JOIN Marks ON Students.ID = Marks.StudentID
ORDER BY Social DESC;
-- 5. Query to Rank the students based on their Maths Mark
SELECT Students.FirstName, Students.LastName, Marks.Maths, DENSE_RANK() OVER(ORDER BY Marks.Maths DESC)
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentID;
-- 6. Query to display the Students name and average and order it by desc
SELECT Students.FirstName, Students.LastName, Marks.Total, (Marks.Hist + Marks.Geo + Marks.Maths + Marks.Science)/4 AS Average
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentID
ORDER BY Average DESC;
-- How does AVG function work?
-- WHEN TO USE RANK() - Need examples?
-- Need examples on AVG and GROUP BY 
SELECT *
FROM Marks;