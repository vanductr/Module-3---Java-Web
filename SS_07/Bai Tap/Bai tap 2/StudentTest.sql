CREATE DATABASE IF NOT EXISTS StudentTest_Lab1;
USE StudentTest_Lab1;
CREATE TABLE Student (
    RN INT PRIMARY KEY,
    Name VARCHAR(20),
    Age TINYINT
);
INSERT INTO Student (RN, Name, Age) VALUES
(1, 'Nguyen Hong Ha', 20),
(2, 'Truong Ngoc Anh', 30),
(3, 'Tuan Minh', 25),
(4, 'Dan Truong', 22);
CREATE TABLE Test (
    TestID INT PRIMARY KEY,
    Name VARCHAR(20)
);
INSERT INTO Test (TestID, Name) VALUES
(1, 'EPC'),
(2, 'DWMX'),
(3, 'SQL1'),
(4, 'SQL2');
CREATE TABLE StudentTest (
    RN INT,
    TestID INT,
    Date DATETIME,
    Mark FLOAT,
    FOREIGN KEY (RN) REFERENCES Student(RN),
    FOREIGN KEY (TestID) REFERENCES Test(TestID)
);
INSERT INTO StudentTest (RN, TestID, Date, Mark) VALUES
(1, 1, '2006-07-17', 8),
(1, 2, '2006-07-18', 5),
(1, 3, '2006-07-19', 7),
(2, 1, '2006-07-17', 7),
(2, 2, '2006-07-18', 4),
(2, 3, '2006-07-19', 2),
(3, 1, '2006-07-17', 10),
(3, 3, '2006-07-18', 1);
ALTER TABLE Student
ADD CONSTRAINT CHK_AgeRange CHECK (Age >= 15 AND Age <= 55);
ALTER TABLE StudentTest
ALTER COLUMN Mark SET DEFAULT 0;

ALTER TABLE StudentTest
ADD PRIMARY KEY (RN, TestID);
ALTER TABLE Test
ADD CONSTRAINT UNQ_Name UNIQUE (Name);
ALTER TABLE Test
DROP INDEX UNQ_Name;
SELECT s.Name AS StudentName, t.Name AS TestName, st.Mark, st.Date
FROM Student s
JOIN StudentTest st ON s.RN = st.RN
JOIN Test t ON st.TestID = t.TestID;

SELECT *
FROM Student s
WHERE NOT EXISTS (
    SELECT 1
    FROM StudentTest st
    WHERE st.RN = s.RN
);

SELECT s.Name AS StudentName, t.Name AS TestName, st.Mark, st.Date
FROM Student s
JOIN StudentTest st ON s.RN = st.RN
JOIN Test t ON st.TestID = t.TestID
WHERE st.Mark < 5;

SELECT s.Name AS StudentName, AVG(st.Mark) AS Average
FROM Student s
JOIN StudentTest st ON s.RN = st.RN
GROUP BY s.Name
ORDER BY Average DESC;

SELECT s.Name AS StudentName, AVG(st.Mark) AS Average
FROM Student s
JOIN StudentTest st ON s.RN = st.RN
GROUP BY s.Name
ORDER BY Average DESC
LIMIT 1;

SELECT t.Name AS TestName, MAX(st.Mark) AS MaxMark
FROM Test t
JOIN StudentTest st ON t.TestID = st.TestID
GROUP BY t.Name
ORDER BY TestName;

SELECT s.Name AS StudentName, t.Name AS TestName
FROM Student s
LEFT JOIN StudentTest st ON s.RN = st.RN
LEFT JOIN Test t ON st.TestID = t.TestID;

UPDATE Student
SET Age = Age + 1
WHERE RN > 0;

ALTER TABLE Student
ADD COLUMN Status VARCHAR(10);

UPDATE Student
SET Status = CASE
                WHEN Age < 30 THEN 'Young'
                ELSE 'Old'
            END
WHERE RN > 0;           

SELECT * FROM Student;

SELECT S.Name AS StudentName, T.Name AS TestName, ST.Mark, ST.Date
FROM Student S
JOIN StudentTest ST ON S.RN = ST.RN
JOIN Test T ON ST.TestID = T.TestID
ORDER BY ST.Date ASC;

SELECT S.Name AS StudentName, S.Age, AVG(ST.Mark) AS AverageMark
FROM Student S
JOIN StudentTest ST ON S.RN = ST.RN
WHERE S.Name LIKE 'T%' 
GROUP BY S.Name, S.Age
HAVING AVG(ST.Mark) > 4.5;

SELECT S.RN AS StudentID, S.Name AS StudentName, S.Age, AVG(ST.Mark) AS AverageMark,
       RANK() OVER (ORDER BY AVG(ST.Mark) DESC) AS Ranking
FROM Student S
JOIN StudentTest ST ON S.RN = ST.RN
GROUP BY S.RN, S.Name, S.Age
ORDER BY Ranking;

ALTER TABLE Student
MODIFY COLUMN Name NVARCHAR(255);

UPDATE Student
SET Name = CONCAT(
    CASE 
        WHEN Age > 20 THEN 'Old ' 
        ELSE 'Young ' 
    END,
    Name
)
WHERE RN > 0;

DELETE FROM Test
WHERE TestID NOT IN (SELECT DISTINCT TestID FROM StudentTest);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Test
WHERE TestID NOT IN (SELECT DISTINCT TestID FROM StudentTest);

SELECT * FROM Test;

DELETE FROM StudentTest
WHERE Mark < 5;

SELECT * FROM StudentTest;