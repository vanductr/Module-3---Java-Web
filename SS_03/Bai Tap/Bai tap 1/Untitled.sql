USE QuanLySinhVien;
SELECT * FROM Student
WHERE StudentName LIKE 'h%';
SELECT * FROM Class
WHERE MONTH(StartDate) = 12;
SELECT * FROM Subject
WHERE Credit BETWEEN 3 AND 5;
UPDATE Student SET ClassId = 2
WHERE StudentName = 'Hung';
SELECT Student.StudentName, Subject.SubName, Mark.Mark 
FROM Mark 
JOIN Student ON Mark.StudentId = Student.StudentId 
JOIN Subject ON Mark.SubId = Subject.SubId 
ORDER BY Mark.Mark DESC, Student.StudentName ASC;