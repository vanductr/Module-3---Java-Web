USE QuanLySinhVien;
INSERT INTO Class
VALUE (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUE (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', '2008-12-24', 0);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
SELECT *
FROM Student;
SELECT *
FROM Student
WHERE Status = true;
SELECT *
FROM Subject
WHERE Credit < 10;
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = S.ClassID
WHERE C.ClassName = 'A1';
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join
Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';