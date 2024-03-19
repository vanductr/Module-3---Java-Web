CREATE DATABASE QuanLyThuVien;
USE QuanLyThuVien;

CREATE TABLE Category
(
    Id     INT AUTO_INCREMENT PRIMARY KEY,
    Name   VARCHAR(100) NOT NULL,
    Status TINYINT DEFAULT 1 CHECK (Status IN (0, 1))
);

CREATE TABLE Author
(
    Id        INT AUTO_INCREMENT PRIMARY KEY,
    Name      VARCHAR(100) NOT NULL UNIQUE,
    TotalBook INT DEFAULT 0
);

CREATE TABLE Book
(
    Id          INT AUTO_INCREMENT PRIMARY KEY,
    Name        VARCHAR(150) NOT NULL,
    Status      TINYINT   DEFAULT 1 CHECK (Status IN (0, 1)),
    Price       FLOAT        NOT NULL CHECK (Price >= 100000),
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CategoryId  INT          NOT NULL,
    AuthorId    INT          NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Category (Id),
    FOREIGN KEY (AuthorId) REFERENCES Author (Id)
);

CREATE TABLE Customer
(
    Id          INT AUTO_INCREMENT PRIMARY KEY,
    Name        VARCHAR(150) NOT NULL,
    Email       VARCHAR(150) NOT NULL UNIQUE,
    Phone       VARCHAR(50)  NOT NULL UNIQUE,
    Address     VARCHAR(255),
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender      TINYINT      NOT NULL CHECK (Gender IN (0, 1, 2)),
    BirthDay    DATE         NOT NULL,
    CONSTRAINT CHK_Email CHECK (
        Email LIKE '%@gmail.com'
            OR Email LIKE '%@facebook.com'
            OR Email LIKE '%@bachkhoa-aptech.edu.vn'
        )
);

CREATE TABLE Ticket
(
    Id         INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT NOT NULL,
    Status     TINYINT  DEFAULT 1 CHECK (Status IN (0, 1, 2, 3)),
    TicketDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerId) REFERENCES Customer (Id)
);

DELIMITER $$
CREATE TRIGGER before_insert_TicketDetail
    BEFORE INSERT
    ON TicketDetail
    FOR EACH ROW
BEGIN
    DECLARE price FLOAT;
    SELECT Price INTO price FROM Book WHERE Id = NEW.BookId;
    IF NEW.DeposiPrice != price THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DeposiPrice must be equal to the price of the book.';
    END IF;
    IF NEW.RentCost != 0.1 * price THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RentCost must be equal to 10% of the price of the book.';
    END IF;
END $$
DELIMITER ;

CREATE TABLE TicketDetail
(
    TicketId    INT   NOT NULL,
    BookId      INT   NOT NULL,
    Quantity    INT   NOT NULL CHECK (Quantity > 0),
    DeposiPrice FLOAT NOT NULL,
    RentCost    FLOAT NOT NULL,
    PRIMARY KEY (TicketId, BookId),
    FOREIGN KEY (TicketId) REFERENCES Ticket (Id),
    FOREIGN KEY (BookId) REFERENCES Book (Id)
);

INSERT INTO Category (Name, Status)
VALUES ('Tiểu thuyết', 1),
       ('Kinh tế học', 1),
       ('Toán học', 1),
       ('Lịch sử', 1),
       ('Văn học', 1),
       ('Khoa học', 1),
       ('Tâm lý học', 1),
       ('Kỹ thuật', 1),
       ('Nghệ thuật', 1),
       ('Âm nhạc', 1);

INSERT INTO Author (Name, TotalBook)
VALUES ('Nguyễn Nhật Ánh', 0),
       ('Trần Nhật Ánh', 0),
       ('Nguyễn Du', 0),
       ('Nam Cao', 0),
       ('Hồ Xuân Hương', 0),
       ('Tô Hoài', 0),
       ('Vũ Trọng Phụng', 0),
       ('Tôn Thất Quỳnh', 0),
       ('Kim Dung', 0),
       ('Nguyễn Phong Việt', 0);

INSERT INTO Book (Name, Status, Price, CreatedDate, CategoryId, AuthorId)
VALUES ('Nhà Giả Kim', 1, 150000, CURDATE(), 1, 1),
       ('Dế Mèn Phiêu Lưu Ký', 1, 120000, CURDATE(), 1, 2),
       ('Chú Lười Và Con Mèo Người', 1, 190000, CURDATE(), 2, 3),
       ('Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 1, 180000, CURDATE(), 2, 4),
       ('Chí Phèo', 1, 110000, CURDATE(), 3, 5),
       ('Truyện Kiều', 1, 135000, CURDATE(), 3, 6),
       ('Số Đỏ', 1, 125000, CURDATE(), 4, 7),
       ('Tắt Đèn', 1, 195000, CURDATE(), 4, 8),
       ('Thám Tử Lừng Danh Conan', 1, 140000, CURDATE(), 5, 9),
       ('Đắc Nhân Tâm', 1, 105000, CURDATE(), 5, 10);

INSERT INTO Customer (Name, Email, Phone, Address, CreatedDate, Gender, BirthDay)
VALUES ('Nguyễn Văn A', 'nguyenvana@gmail.com', '0123456789', 'Số 1, Đường ABC, Quận XYZ, TP HCM', CURDATE(), 1,
        '1990-01-01'),
       ('Nguyễn Thị B', 'nguyenthib@gmail.com', '0987654321', 'Số 2, Đường DEF, Quận UVW, TP HCM', CURDATE(), 0,
        '1992-05-10'),
       ('Trần Văn C', 'tranvanc@gmail.com', '0123654789', 'Số 3, Đường GHI, Quận RST, TP HCM', CURDATE(), 1,
        '1988-11-15'),
       ('Trần Thị D', 'tranthid@gmail.com', '0987546213', 'Số 4, Đường KLM, Quận OPQ, TP HCM', CURDATE(), 0,
        '1995-07-20'),
       ('Lê Văn E', 'levane@gmail.com', '0123789456', 'Số 5, Đường MNO, Quận UVW, TP HCM', CURDATE(), 1, '1993-03-25'),
       ('Lê Thị F', 'lethif@gmail.com', '0987456321', 'Số 6, Đường PQR, Quận XYZ, TP HCM', CURDATE(), 0, '1994-09-05'),
       ('Phạm Văn G', 'phamvang@gmail.com', '0123658749', 'Số 7, Đường STU, Quận RST, TP HCM', CURDATE(), 1,
        '1991-02-12'),
       ('Phạm Thị H', 'phamthih@gmail.com', '0987412365', 'Số 8, Đường VWX, Quận OPQ, TP HCM', CURDATE(), 0,
        '1996-06-30'),
       ('Hoàng Văn I', 'hoangvani@gmail.com', '0123896547', 'Số 9, Đường YZK, Quận LMN, TP HCM', CURDATE(), 1,
        '1989-12-18'),
       ('Hoàng Thị K', 'hoangthik@gmail.com', '0987451236', 'Số 10, Đường KZY, Quận GHI, TP HCM', CURDATE(), 0,
        '1997-08-08');

INSERT INTO Ticket (CustomerId, Status, TicketDate)
VALUES (1, 1, NOW()),
       (2, 1, NOW()),
       (3, 1, NOW()),
       (4, 1, NOW()),
       (5, 1, NOW()),
       (6, 1, NOW()),
       (7, 1, NOW()),
       (8, 1, NOW()),
       (9, 1, NOW()),
       (10, 1, NOW());


INSERT INTO TicketDetail (TicketId, BookId, Quantity, DeposiPrice, RentCost)
VALUES (1, 11, 2, 200000, 20000),
       (1, 12, 3, 300000, 30000),
       (2, 13, 1, 150000, 15000),
       (2, 14, 4, 400000, 40000),
       (3, 15, 2, 200000, 20000),
       (3, 16, 3, 300000, 30000),
       (4, 17, 1, 100000, 10000),
       (4, 18, 2, 200000, 20000),
       (5, 19, 3, 300000, 30000),
       (5, 20, 4, 400000, 40000);

# Yêu cầu 1 ( Sử dụng lệnh SQL để truy vấn cơ bản ):
# Lấy ra danh sách Book có sắp xếp giảm dần theo Price gồm các cột sau: Id, Name, 	Price, Status, CategoryName, AuthorName, CreatedDate
SELECT b.Id,
       b.Name,
       b.Price,
       b.Status,
       c.Name AS CategoryName,
       a.Name AS AuthorName,
       b.CreatedDate
FROM Book b
         JOIN Category c ON b.CategoryId = c.Id
         JOIN Author a ON b.AuthorId = a.Id
ORDER BY b.Price DESC;

# Lấy ra danh sách Category gồm: Id, Name, TotalProduct, Status (Trong đó cột Status nếu = 0, Ẩn, = 1 là Hiển thị )
SELECT
    c.Id,
    c.Name,
    COUNT(b.Id) AS TotalProduct,
    CASE
        WHEN c.Status = 0 THEN 'Ẩn'
        WHEN c.Status = 1 THEN 'Hiển thị'
        END AS Status
FROM
    Category c
        LEFT JOIN
    Book b ON c.Id = b.CategoryId
GROUP BY
    c.Id, c.Name, c.Status;

# Truy vấn danh sách Customer gồm: Id, Name, Email, Phone, Address, CreatedDate, Gender, BirthDay, Age (Age là cột suy ra từ BirthDay, Gender nếu = 0 là Nam, 1 là Nữ,2 là khác )
SELECT
    Id,
    Name,
    Email,
    Phone,
    Address,
    CreatedDate,
    BirthDay,
    CASE
        WHEN Gender = 0 THEN 'Nam'
        WHEN Gender = 1 THEN 'Nữ'
        ELSE 'Khác'
        END AS Gender,
    DATEDIFF(NOW(), BirthDay) / 365 AS Age
FROM
    Customer;

# Truy vấn xóa Author chưa có sách nào
DELETE FROM Author
WHERE NOT EXISTS (
    SELECT 1
    FROM Book
    WHERE Book.AuthorId = Author.Id
);

# Cập nhật Cột TotalBook trong bảng Author = Tổng số Book của mỗi Author theo Id của Author
UPDATE Author AS A
    JOIN (
        SELECT AuthorId, COUNT(*) AS TotalBook
        FROM Book
        GROUP BY AuthorId
    ) AS B ON A.Id = B.AuthorId
SET A.TotalBook = B.TotalBook
WHERE AuthorId > 0;

# Yêu cầu 2 ( Sử dụng lệnh SQL tạo View )
# View v_getBookInfo thực hiện lấy ra danh sách các Book được mượn nhiều hơn 3 cuốn
CREATE VIEW v_getBookInfo AS
SELECT
    Book.Id AS BookId,
    Book.Name AS BookName,
    SUM(TicketDetail.Quantity) AS TotalBorrowed
FROM
    Book
        INNER JOIN
    TicketDetail ON Book.Id = TicketDetail.BookId
GROUP BY
    Book.Id, Book.Name
HAVING
    SUM(TicketDetail.Quantity) > 3;

# View v_getTicketList hiển thị danh sách Ticket gồm: Id, TicketDate, Status, CusName, Email, Phone,TotalAmount
# (Trong đó TotalAmount là tổng giá trị tiện phải trả, cột Status nếu = 0 thì hiển thị Chưa trả, = 1 Đã trả, = 2 Quá hạn, 3 Đã hủy)
CREATE VIEW v_getTicketList AS
SELECT
    t.Id AS TicketId,
    t.TicketDate,
    CASE
        WHEN t.Status = 0 THEN 'Chưa trả'
        WHEN t.Status = 1 THEN 'Đã trả'
        WHEN t.Status = 2 THEN 'Quá hạn'
        WHEN t.Status = 3 THEN 'Đã hủy'
        ELSE 'Unknown'
        END AS Status,
    c.Name AS CusName,
    c.Email,
    c.Phone,
    SUM(td.Quantity * td.DeposiPrice) AS TotalAmount
FROM
    Ticket t
        JOIN
    Customer c ON t.CustomerId = c.Id
        JOIN
    TicketDetail td ON t.Id = td.TicketId
GROUP BY
    t.Id, t.TicketDate, t.Status, c.Name, c.Email, c.Phone;

# Yêu cầu 3 ( Sử dụng lệnh SQL tạo thủ tục Stored Procedure )
# Thủ tục addBookInfo thực hiện thêm mới Book, khi gọi thủ tục truyền đầy đủ các giá trị của bảng Book ( Trừ cột tự động tăng )
CREATE PROCEDURE addBookInfo(
    IN bookName VARCHAR(150),
    IN bookStatus TINYINT,
    IN bookPrice FLOAT,
    IN bookCategoryId INT,
    IN bookAuthorId INT
)
BEGIN
    INSERT INTO Book (Name, Status, Price, CreatedDate, CategoryId, AuthorId)
    VALUES (bookName, bookStatus, bookPrice, CURDATE(), bookCategoryId, bookAuthorId);
END;

CALL addBookInfo('Tên sách mới', 1, 200000, 1, 1);

# Thủ tục getTicketByCustomerId hiển thị danh sách đơn hàng của khách hàng theo Id khách hàng gồm:
# Id, TicketDate, Status, TotalAmount (Trong đó cột Status nếu =0 Chưa trả, = 1  Đã trả, = 2 Quá hạn, 3 đã hủy ),
# Khi gọi thủ tục truyền vào id cuả khách hàng
CREATE PROCEDURE getTicketByCustomerId(IN customer_id INT)
BEGIN
    SELECT
        t.Id,
        t.TicketDate,
        t.Status,
        SUM(td.DeposiPrice + td.RentCost * td.Quantity) AS TotalAmount
    FROM
        Ticket t
            JOIN
        TicketDetail td ON t.Id = td.TicketId
    WHERE
        t.CustomerId = customer_id
    GROUP BY
        t.Id, t.TicketDate, t.Status;
END;

CALL getTicketByCustomerId(5);

# Thủ tục getBookPaginate lấy ra danh sách sản phẩm có phân trang gồm:
# Id, Name, Price, Sale_price, Khi gọi thủ tuc truyền vào limit và page
CREATE PROCEDURE getBookPaginate(IN limit_val INT, IN page_val INT)
BEGIN
    DECLARE offset_val INT;
    SET offset_val = (page_val - 1) * limit_val;

    SELECT
        Id,
        Name,
        Price,
        Price * 1.1 AS Sale_price
    FROM
        Book
    LIMIT
        offset_val, limit_val;
END;

CALL getBookPaginate(5, 1);


# Yêu cầu 4 ( Sử dụng lệnh SQL tạo Trigger )
# Tạo trigger tr_Check_total_book_author sao cho khi thêm Book nếu Author đang tham chiếu có tổng số sách > 5
# thì không cho thêm mưới và thông báo “Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn, vui long chọn tác giả khác”
DELIMITER $$

CREATE TRIGGER tr_Check_total_book_author
    BEFORE INSERT ON Book
    FOR EACH ROW
BEGIN
    DECLARE total_books INT;

    -- Tính tổng số sách của tác giả
    SELECT COUNT(*)
    INTO total_books
    FROM Book
    WHERE AuthorId = NEW.AuthorId;

    -- Kiểm tra nếu tổng số sách của tác giả vượt quá 5
    IF total_books >= 5 THEN
        -- Tạo lỗi và không cho thêm mới
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn, vui lòng chọn tác giả khác';
    END IF;
END$$

DELIMITER ;

CALL addBookInfo('Tên sách mới Test', 1, 200000, 1, 2);

# Tạo trigger tr_Update_TotalBook khi thêm mới Book thì cập nhật cột TotalBook trong bảng Author = tổng của Book theo AuthorId
DELIMITER $$

CREATE TRIGGER tr_Update_TotalBook
    AFTER INSERT ON Book
    FOR EACH ROW
BEGIN
    DECLARE author_total_book INT;

    -- Tính tổng số sách của tác giả
    SELECT COUNT(*)
    INTO author_total_book
    FROM Book
    WHERE AuthorId = NEW.AuthorId;

    -- Cập nhật cột TotalBook trong bảng Author
    UPDATE Author
    SET TotalBook = author_total_book
    WHERE Id = NEW.AuthorId;
END$$

DELIMITER ;

CALL addBookInfo('Tên sách mới Test', 1, 200000, 1, 2);

CALL addBookInfo('Tên sách mới Test', 1, 200000, 1, 3);