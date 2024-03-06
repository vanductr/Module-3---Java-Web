USE QuanLySinhVien;
SELECT * FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);
SELECT s.SubId, s.SubName, m.Mark
FROM Subject s
INNER JOIN Mark m ON s.SubId = m.SubId
WHERE m.Mark = (SELECT MAX(Mark) FROM Mark);
SELECT s.StudentId, s.StudentName, AVG(m.Mark) AS AverageMark
FROM Student s
INNER JOIN Mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId, s.StudentName
ORDER BY AverageMark DESC;