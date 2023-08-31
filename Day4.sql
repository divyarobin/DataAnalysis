/*
SESSION -4
- 1. Query to display Student who scored the minimum mark in Maths
- 2. Query to display Student with the highest total
- 3. Query to display Teacher who has the Student with the highest total
- 4. Query to display Teacher who has the highest average
- 5. Query to display Teachers who have students in bengaluru 
*/

-- 1. Query to display Student who scored the minimum mark in Maths
SELECT CONCAT(Students.FirstName, ' ', COALESCE(Students.LastName,'')), MIN(Marks.Maths)
FROM Students
INNER JOIN Marks ON Students.ID = Marks.ID
GROUP BY Students.ID;
SELECT ID, Maths
FROM Marks;
SELECT ID, MIN(Maths)
FROM Marks
GROUP BY Maths;
SELECT Students.FirstName, Students.LastName, Marks.Maths
FROM Students
INNER JOIN Marks ON Students.ID = Marks.StudentID
ORDER by Marks.Maths
LIMIT 1;
-- 2. Query to display Student with the highest total
SELECT Total FROM Marks
ORDER BY Total DESC;
-- 3. Query to display Teacher who has the Student with the highest total
SELECT Teachers.FirstName, Teachers.LastName, Marks.Total
FROM Marks
INNER JOIN Students ON Marks.StudentID = Students.ID
INNER JOIN Teachers ON Students.TeacherId = Teachers.ID
ORDER BY Marks.Total DESC
LIMIT 1;
-- 5. Query to display Teachers who have students in bengaluru 
SELECT Teachers.FirstName AS 'Teacher Name', MIN(Students.Address) AS 'Student Address'
FROM Students
INNER JOIN Teachers ON Students.TeacherID = Teachers.ID
WHERE Students.Address LIKE '%Coimbatore%'
GROUP BY Teachers.FirstName;
SELECT *
FROm STudents;
UPDATE Students
SET TeacherID = 1
WHERE ID = 3;
SELECT Teachers.FirstName AS 'Teacher Name'
FROM Students
INNER JOIN Teachers ON Students.TeacherID = Teachers.ID
WHERE Students.Address LIKE '%Coimbatore%'
GROUP BY Teachers.FirstName;
SELECT DISTINCT Teachers.FirstName AS 'Teacher Name', Students.Address AS 'Student Address'
FROM Students
INNER JOIN Teachers ON Students.TeacherID = Teachers.ID
WHERE Students.Address LIKE '%Coimbatore%';
-- Query to display Teachers and their Student's average
SELECT Teachers.FirstName, Teachers.LastName, COALESCE(AVG(Marks.Total),'0')
FROM Teachers
LEFT JOIN Students ON Teachers.ID = Students.TeacherId
LEFT JOIN Marks ON Students.ID = Marks.StudentID
GROUP BY Teachers.FirstName, Teachers.LastName;
SELECT *
FROM Teachers;
SELECT CONCAT(Teachers.FirstName, ' ',COALESCE(Teachers.LastName, '')) AS 'Teacher Name', COALESCE(AVG(Marks.Total),'0') AS 'Avg.MARKS'
FROM Marks
INNER JOIN Students ON Marks.StudentID = Students.ID
RIGHT JOIN Teachers ON Students.TeacherId = Teachers.ID
GROUP BY Teachers.FirstName, Teachers.LastName;


