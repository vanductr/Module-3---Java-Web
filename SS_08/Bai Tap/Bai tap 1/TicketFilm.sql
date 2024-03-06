CREATE DATABASE TicketFile;
USE TicketFile;

-- Tạo bảng tblPhim
CREATE TABLE tblPhim (
    PhimID INT,
    Ten_phim NVARCHAR(30),
    Loai_phim NVARCHAR(25),
    Thoi_gian INT
);

-- Tạo bảng tblPhong
CREATE TABLE tblPhong (
    PhongID INT,
    Ten_phong NVARCHAR(20),
    Trang_thai TINYINT
);

-- Tạo bảng tblGhe
CREATE TABLE tblGhe (
    GheID INT,
    PhongID INT,
    So_ghe VARCHAR(10)
);

-- Tạo bảng tblVe
CREATE TABLE tblVe (
    PhimID INT,
    GheID INT,
    Ngay_chieu DATETIME,
    Trang_thai NVARCHAR(20)
);

-- Áp đặt các ràng buộc(constraint) cho các bảng
-- Áp đặt ràng buộc cho Bảng: tblPhim
ALTER TABLE tblPhim
MODIFY COLUMN PhimID INT AUTO_INCREMENT PRIMARY KEY;

-- Áp đặt ràng buộc cho Bảng: tblPhong
ALTER TABLE tblPhong
MODIFY COLUMN PhongID INT AUTO_INCREMENT PRIMARY KEY;

-- Áp đặt ràng buộc cho Bảng: tblGhe
ALTER TABLE tblGhe
MODIFY COLUMN GheID INT AUTO_INCREMENT PRIMARY KEY,
ADD CONSTRAINT fk_PhongID FOREIGN KEY (PhongID) REFERENCES tblPhong(PhongID);

-- Áp đặt ràng buộc cho Bảng: tblVe
ALTER TABLE tblVe
ADD CONSTRAINT fk_PhimID FOREIGN KEY (PhimID) REFERENCES tblPhim(PhimID),
ADD CONSTRAINT fk_GheID FOREIGN KEY (GheID) REFERENCES tblGhe(GheID);

-- Chèn dữ liệu vào Bảng: tblPhim
INSERT INTO tblPhim (Ten_phim, Loai_phim, Thoi_gian) 
VALUES 
('Em bé Hà Nôi', 'Tâm lý', 90),
('Nhiệm vụ bất khả thi', 'Hành động', 100),
('Dị nhân', 'Viễn tưởng', 90),
('Cuốn theo chiều gió', 'Tình cảm', 120);

-- Chèn dữ liệu vào Bảng: tblPhong
INSERT INTO tblPhong (Ten_phong, Trang_thai) 
VALUES 
('Phòng chiếu 1', 1),
('Phòng chiếu 2', 1),
('Phòng chiếu 3', 0);

-- Chèn dữ liệu vào Bảng: tblGhe
INSERT INTO tblGhe (PhongID, So_ghe) 
VALUES 
(1, 'A3'),
(1, 'B5'),
(2, 'A7'),
(2, 'D1'),
(3, 'T2');

-- Chèn dữ liệu vào Bảng: tblVe
INSERT INTO tblVe (PhimID, GheID, Ngay_chieu, Trang_thai) 
VALUES 
(1, 1, '2008-10-20', 'Đã bán'),
(1, 3, '2008-11-20', 'Đã bán'),
(1, 4, '2008-12-23', 'Đã bán'),
(2, 1, '2009-02-14', 'Đã bán'),
(3, 1, '2009-02-14', 'Đã bán'),
(2, 5, '2009-03-08', 'Chưa bán'),
(2, 3, '2009-03-08', 'Chưa bán');

-- Hiển thị danh sách các phim (được sắp xếp theo trường Thoi_gian)
SELECT *
FROM tblPhim
ORDER BY Thoi_gian;

-- Hiển thị Ten_phim có thời gian chiếu dài nhất
SELECT Ten_phim
FROM tblPhim
ORDER BY Thoi_gian DESC
LIMIT 1;

-- Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
SELECT Ten_phim
FROM tblPhim
ORDER BY Thoi_gian ASC
LIMIT 1;

-- Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
SELECT So_ghe
FROM tblGhe
WHERE So_ghe LIKE 'A%';

# Sửa cột Trang_thai của bảng tblPhong sang kiểu 'nvarchar(25)'
ALTER TABLE tblPhong
MODIFY COLUMN Trang_thai NVARCHAR(25);

-- Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật
DELIMITER //

CREATE PROCEDURE UpdateTrangThaiPhong()
BEGIN
    -- Cập nhật giá trị của cột Trang_thai theo các luật đã cho
    UPDATE tblPhong
    SET Trang_thai = CASE 
                        WHEN Trang_thai = 0 THEN 'Đang sửa'
                        WHEN Trang_thai = 1 THEN 'Đang sử dụng'
                        ELSE 'Unknown'
                    END;

    -- Hiển thị bảng tblPhong sau khi cập nhật
    SELECT * FROM tblPhong;
END //

DELIMITER ;

CALL UpdateTrangThaiPhong();

-- Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 
SELECT Ten_phim
FROM tblPhim
WHERE LENGTH(Ten_phim) > 15 AND LENGTH(Ten_phim) < 25;

-- Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
SELECT CONCAT(Ten_phong, ' - ', CASE 
                                    WHEN Trang_thai = 'Đang sửa' THEN 'Đang sửa'
                                    WHEN Trang_thai = 'Đang sử dụng' THEN 'Đang sử dụng'
                                    ELSE 'Unknown'
                                END) AS 'Trạng thái phòng chiếu'
FROM tblPhong;

-- Tạo view có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
CREATE VIEW tblRank AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY Ten_phim) AS STT,
    Ten_phim AS TenPhim,
    Thoi_gian
FROM tblPhim;

-- Trong bảng tblPhim :
-- Thêm trường Mo_ta kiểu nvarchar(max)
ALTER TABLE tblPhim
ADD Mo_ta NVARCHAR(255);

-- Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại  ” + nội dung trường LoaiPhim
UPDATE tblPhim
SET Mo_ta = CONCAT('Đây là bộ phim thể loại ', Loai_phim);

-- Hiển thị bảng tblPhim sau khi cập nhật
SELECT * FROM tblPhim;

-- Cập nhật trường Mo_ta: thay chuỗi “bộ phim” thành chuỗi “film” (Dùng replace)
UPDATE tblPhim
SET Mo_ta = REPLACE(Mo_ta, 'bộ phim', 'film');

-- Hiển thị bảng tblPhim sau khi cập nhật
SELECT * FROM tblPhim;

-- Xóa tất cả các khóa ngoại trong các bảng trên.
-- Xóa ràng buộc khóa ngoại trong bảng tblVe:
ALTER TABLE tblVe
DROP FOREIGN KEY fk_PhimID;
ALTER TABLE tblVe
DROP FOREIGN KEY fk_GheID;

-- Xóa ràng buộc khóa ngoại trong bảng tblGhe:
ALTER TABLE tblGhe
DROP FOREIGN KEY fk_PhongID;

-- Xóa dữ liệu ở bảng tblGhe
DELETE FROM tblGhe;

-- Hiển thị ngày giờ hiện chiếu và ngày giờ chiếu cộng thêm 5000 phút trong bảng tblVe
SELECT 
    Ngay_chieu AS Ngay_chieu_hien_tai,
    DATE_ADD(Ngay_chieu, INTERVAL 5000 MINUTE) AS Ngay_chieu_sau_5000_phut
FROM 
    tblVe;
