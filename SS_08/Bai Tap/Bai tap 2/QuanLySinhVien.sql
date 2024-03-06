CREATE DATABASE NguyenVanA_Lab1;
USE NguyenVanA_Lab1;

-- Tạo bảng: Class
CREATE TABLE Class (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName NVARCHAR(255) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT
);

-- Tạo bảng: Student
CREATE TABLE Student (
    StudentID INT NOT NULL PRIMARY KEY,
    StudentName NVARCHAR(30) NOT NULL,
    Address NVARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT NOT NULL
);

-- Tạo bảng: Subject
CREATE TABLE Subject (
    SubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName NVARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status BIT DEFAULT 1
);

-- Tạo bảng: Mark
CREATE TABLE Mark (
    MarkID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark >= 0 AND Mark <= 100),
    ExamTimes TINYINT DEFAULT 1
);

# 3.  Sử dụng câu lệnh sử đổi bảng để thêm các ràng buộc vào các bảng theo mô tả:
-- Thêm ràng buộc khóa ngoại trên cột ClassID của bảng Student, tham chiếu đến cột ClassID trên bảng Class.
ALTER TABLE Student
ADD CONSTRAINT FK_Student_Class FOREIGN KEY (ClassID) REFERENCES Class(ClassID);

-- Thêm ràng buộc cho cột StartDate của  bảng Class là ngày hiện hành.
ALTER TABLE Class
MODIFY COLUMN StartDate DATETIME DEFAULT CURRENT_TIMESTAMP;

-- Thêm ràng buộc mặc định cho cột Status của bảng Student là 1.
ALTER TABLE Student
MODIFY COLUMN Status BIT DEFAULT 1;

-- Thêm ràng buộc khóa ngoại cho bảng Mark trên cột:
ALTER TABLE Mark
ADD CONSTRAINT FK_SubID FOREIGN KEY (SubID) REFERENCES Subject(SubID),
ADD CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID);

-- Thêm dữ liệu vào các bảng.
-- Thêm dữ liệu vào bảng: Class
INSERT INTO Class (ClassName, StartDate, Status)
VALUES
('A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', CURDATE(), 0);

-- Thêm dữ liệu vào bảng: Student
INSERT INTO Student (StudentID, StudentName, Address, Phone, Status, ClassID)
VALUES
(1, 'Hung', 'Ha Noi', '0912113113', 1, 1),
(2, 'Hoa', 'Hai Phong', null, 1, 1),
(3, 'Manh', 'HCM', '0123123123', 0, 2);

-- Thêm dữ liệu vào bảng: Subject
INSERT INTO Subject (SubName, Credit, Status)
VALUES
('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
('RDBMS', 10, 1);

-- Thêm dữ liệu vào bảng: Mark
INSERT INTO Mark (SubID, StudentID, Mark, ExamTimes)
VALUES
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

# 5. Cập nhật dữ liệu.
-- a. Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

-- b. Cập nhật cột phone trên bảng sinh viên là ‘No phone’ cho những sinh viên chưa có số điện thoại.
UPDATE Student
SET Phone = 'No phone'
WHERE Phone IS NULL OR Phone = '';

-- c. Nếu trạng thái của lớp (Stutas) là 0 thì thêm từ ‘New’ vào trước tên lớp.
UPDATE Class
SET ClassName = CONCAT('New ', ClassName)
WHERE Status = 0;

-- d. Nếu trạng thái của status trên bảng Class là 1 và tên lớp bắt đầu là ‘New’ thì thay thế ‘New’ bằng ‘old’.
UPDATE Class
SET ClassName = REPLACE(ClassName, 'New', 'Old')
WHERE Status = 1 AND ClassName LIKE 'New%';

-- e. Nếu lớp học chưa có sinh viên thì thay thế trạng thái là 0 (status=0).
UPDATE Class
SET Status = 0
WHERE ClassID NOT IN (SELECT DISTINCT ClassID FROM Student);

-- f. Cập nhật trạng thái của môn học (bảng subject) là 0 nếu môn học đó chưa có sinh viên dự thi.
UPDATE Subject
SET Status = 0
WHERE SubID NOT IN (SELECT DISTINCT SubID FROM Mark);

# 6. Hiện thị thông tin.
-- a. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’.
SELECT *
FROM Student
WHERE StudentName LIKE 'H%';

-- b. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

-- c. Hiển thị giá trị lớn nhất của credit trong bảng subject.
SELECT MAX(Credit) AS MaxCredit
FROM Subject;

-- d. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- e. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

-- f. Hiển thị các thông tin bao gồm: classid, className, studentname, Address từ hai bảng Class, student
SELECT c.ClassID, c.ClassName, s.StudentName, s.Address
FROM Class c
INNER JOIN Student s ON c.ClassID = s.ClassID;

-- g. Hiển thị các thông tin môn học chưa có sinh viên dự thi.
SELECT s.*
FROM Subject s
LEFT JOIN Mark m ON s.SubID = m.SubID
WHERE m.MarkID IS NULL;

-- h. Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.SubID, s.SubName, s.Credit, m.MaxMark
FROM Subject s
INNER JOIN (
    SELECT SubID, MAX(Mark) AS MaxMark
    FROM Mark
    GROUP BY SubID
) m ON s.SubID = m.SubID;

-- i. Hiển thị các thông tin sinh viên và điểm trung bình tương ứng.
SELECT s.StudentID, s.StudentName, AVG(m.Mark) AS AverageMark
FROM Student s
LEFT JOIN Mark m ON s.StudentID = m.StudentID
GROUP BY s.StudentID, s.StudentName;

-- j. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần (gợi ý: sử dụng hàm rank)
SELECT s.StudentID, s.StudentName, AVG(m.Mark) AS AverageMark, RANK() OVER (ORDER BY AVG(m.Mark) DESC) AS Ranking
FROM Student s
LEFT JOIN Mark m ON s.StudentID = m.StudentID
GROUP BY s.StudentID, s.StudentName
ORDER BY AverageMark DESC;

-- k. Hiển thị các thông tin sinh viên và điểm trung bình, chỉ đưa ra các sinh viên có điểm trung bình lớn hơn 10.
SELECT s.StudentID, s.StudentName, AVG(m.Mark) AS AverageMark
FROM Student s
LEFT JOIN Mark m ON s.StudentID = m.StudentID
GROUP BY s.StudentID, s.StudentName
HAVING AVG(m.Mark) > 10;

-- l. Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.StudentName, sb.SubName, m.Mark
FROM Student s
INNER JOIN Mark m ON s.StudentID = m.StudentID
INNER JOIN Subject sb ON m.SubID = sb.SubID
ORDER BY m.Mark DESC, s.StudentName ASC;

# 7. Xóa dữ liệu.
-- a. Xóa tất cả các lớp có trạng thái là 0.
DELETE FROM Class
WHERE Status = 0;

-- b. Xóa tất cả các môn học chưa có sinh viên dự thi.
DELETE FROM Subject
WHERE NOT EXISTS (
    SELECT 1
    FROM Mark
    WHERE Subject.SubID = Mark.SubID
);

# 8. Thay đổi.
-- a. Xóa bỏ cột ExamTimes trên bảng Mark.
ALTER TABLE Mark
DROP COLUMN ExamTimes;

-- b. Sửa đổi cột status trên bảng class thành tên ClassStatus.
ALTER TABLE Class
CHANGE COLUMN Status ClassStatus BIT;

-- c. Đổi tên bảng Mark thành SubjectTest.
ALTER TABLE Mark
RENAME TO SubjectTest;
