CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName NVARCHAR(50)
);
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName NVARCHAR(50)
);
CREATE TABLE ClassStudent (
    StudentID INT,
    ClassID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    PRIMARY KEY (StudentID, ClassID)
);
CREATE TABLE Mark (
    Mark INT,
    SubjectID INT,
    StudentID INT,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    PRIMARY KEY (SubjectID, StudentID)
);
INSERT INTO Students (StudentID, StudentName, Age, Email)
VALUES 
(1, 'Nguyen Quang An', 18, 'an@yahoo.com'),
(2, 'Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
(3, 'Nguyen Van Quyen', 19, 'quyen'),
(4, 'Pham Thanh Binh', 25, 'binh@com'),
(5, 'Nguyen Van Tai Em', 30, 'taiem@sport.vn');
INSERT INTO Classes (ClassID, ClassName)
VALUES 
(1, 'C0706L'),
(2, 'C0708G');
INSERT INTO ClassStudent (StudentID, ClassID)
VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);
INSERT INTO Subjects (SubjectID, SubjectName)
VALUES 
(1, 'SQL'),
(2, 'Java'),
(3, 'C'),
(4, 'Visual Basic');
INSERT INTO Mark (Mark, SubjectID, StudentID)
VALUES 
(8, 1, 1),
(4, 2, 1),
(9, 1, 1),
(7, 1, 3),
(3, 1, 4),
(5, 2, 5),
(8, 3, 3),
(1, 3, 5),
(3, 2, 4);
CREATE TABLE Mark (
    Mark INT,
    SubjectID INT,
    StudentID INT,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Mark (Mark, SubjectID, StudentID)
VALUES 
(8, 1, 1),
(4, 2, 1),
(9, 1, 1),
(7, 1, 3),
(3, 1, 4),
(5, 2, 5),
(8, 3, 3),
(1, 3, 5),
(3, 2, 4);
SELECT *
FROM Students;
SELECT *
FROM Subjects;
SELECT StudentID, AVG(Mark) AS AverageMark
FROM Mark
GROUP BY StudentID;
SELECT s.StudentName, su.SubjectName, m.Mark
FROM Mark m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Subjects su ON m.SubjectID = su.SubjectID
JOIN (
    SELECT StudentID, MAX(Mark) AS MaxMark
    FROM Mark
    GROUP BY StudentID
) AS max_mark_per_student ON m.StudentID = max_mark_per_student.StudentID AND m.Mark = max_mark_per_student.MaxMark;
SELECT s.StudentName, su.SubjectName, m.Mark
FROM Mark m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Subjects su ON m.SubjectID = su.SubjectID
JOIN (
    SELECT SubjectID, MAX(Mark) AS MaxMark
    FROM Mark
    GROUP BY SubjectID
) AS max_mark_per_subject ON m.SubjectID = max_mark_per_subject.SubjectID AND m.Mark = max_mark_per_subject.MaxMark;
SET @row_number = 0;

SELECT StudentID, SubjectID, Mark, 
       ROW_NUMBER() OVER (ORDER BY Mark DESC) AS RankMark
FROM Mark;
ALTER TABLE Subjects
MODIFY COLUMN SubjectName VARCHAR(16383);
ALTER TABLE Subjects
MODIFY COLUMN SubjectName TEXT;
ALTER TABLE Subjects
MODIFY COLUMN SubjectName VARCHAR(255);
UPDATE Subjects
SET SubjectName = CONCAT('Đây là môn học ', SubjectName)
WHERE SubjectID > 0; -- Sử dụng điều kiện WHERE với cột KEY
SELECT * FROM Subjects;
ALTER TABLE Students
ADD CONSTRAINT CHK_Age_Range CHECK (Age > 15 AND Age < 50);
ALTER TABLE ClassStudent DROP FOREIGN KEY classstudent_ibfk_1;
ALTER TABLE ClassStudent DROP FOREIGN KEY classstudent_ibfk_2;
SHOW CREATE TABLE Mark;
ALTER TABLE Mark
DROP FOREIGN KEY mark_ibfk_1,
DROP FOREIGN KEY mark_ibfk_2;
SHOW CREATE TABLE Students;
DELETE FROM Students
WHERE StudentID = 1;
SELECT * FROM Students;
ALTER TABLE Students
ADD COLUMN Status BIT DEFAULT 1;
SELECT * FROM Students;
UPDATE Students
SET Status = 0;
UPDATE Students
SET Status = 0
WHERE StudentID = 4;
SELECT * FROM Students;