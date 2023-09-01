/* - 1. Query to display all teachers having student's average greater than 300
- 2. Query to display all teachers and their student's total average where the student has scored over 40 in all subjects */
-- 1. Query to display all teachers having student's average greater than 300
SELECT CONCAT(Teachers.FirstName, ' ',COALESCE(Teachers.LastName, '')) AS 'Teacher Name', COALESCE(AVG(Marks.Total),'0') AS 'Avg.MARKS'
FROM Marks
INNER JOIN Students ON Marks.StudentID = Students.ID
RIGHT JOIN Teachers ON Students.TeacherId = Teachers.ID
GROUP BY Teachers.FirstName, Teachers.LastName
HAVING AVG(Marks.Total) > 350;
SELECT *
FROM Marks;
UPDATE Marks
SET Hist = 39
WHERE ID = 3;
UPDATE Marks
SET Maths = 20
WHERE ID = 4;
-- 2. Query to display all teachers and their student's total average where the student has scored over 40 in all subjects
SELECT CONCAT(Teachers.FirstName, ' ',COALESCE(Teachers.LastName, '')) AS 'Teacher Name', COALESCE(AVG(Marks.Total),'0') AS 'Avg.MARKS'
FROM Marks
INNER JOIN Students ON Marks.StudentID = Students.ID
RIGHT JOIN Teachers ON Students.TeacherId = Teachers.ID
WHERE Hist > 40 AND Geo > 40 AND Maths > 40 AND Science > 40
GROUP BY Teachers.FirstName, Teachers.LastName;
/* Template to add UPDATE and JOINS
UPDATE Students
SET Result = ''
FROM Students
JOIN Marks on Students.Id = Marks.StudentId
WHERE MArks.Maths > 40
*/
/*
- 3. Query to add Marks.Id as Primary key
- 4. Query to add a column Result in Marks table
- 5. Query to add a check constraint on Result to insert only values (Pass, Fail)
- 6. Query to update the values based on below condition in Result column
	-- Pass - When student has scored over 40 in all subjects
	-- Fail - When student has less than 40 in at least one subject
*/
-- 3. Query to add Marks.Id as Primary key
ALTER TABLE Marks
ADD PRIMARY KEY(ID);
-- 4. Query to add a column Result in Marks table
ALTER TABLE Marks
ADD Result char(10);
SELECT *
FROM Marks;
-- 5. Query to add a check constraint on Result to insert only values (Pass, Fail)
ALTER TABLE Marks
ADD CONSTRAINT CHK_ResultVal CHECK(Result = 'Pass' OR Result = 'Fail');
/* - 6. Query to update the values based on below condition in Result column
	-- Pass - When student has scored over 40 in all subjects
	-- Fail - When student has less than 40 in at least one subject */
UPDATE Marks
SET Result = 'Pass'
WHERE Hist >= 40 AND Geo >= 40 AND Maths >= 40 AND Science >= 40;
UPDATE Marks
SET Result = 'Fail'
WHERE Hist < 40 OR Geo < 40 OR Maths < 40 OR Science < 40;
SELECT *
FROM Marks;

    
    
    
    
    
    
    
    
    
    