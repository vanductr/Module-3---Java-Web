CREATE DATABASE QLBH_Lab1;
USE QLBH_Lab1;
DROP DATABASE QLBH_Lab1;
CREATE DATABASE IF NOT EXISTS QLBHLAB45;
USE QLBHLAB45;

CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    Name VARCHAR(25),
    cAge TINYINT
);
INSERT INTO Customer (cID, Name, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

CREATE TABLE Orders (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);
INSERT INTO Orders (oID, cID, oDate, oTotalPrice) 
VALUES 
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(25),
    pPrice INT
);

INSERT INTO Product (pID, pName, pPrice)
VALUES 
    (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
    
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    FOREIGN KEY (oID) REFERENCES Orders(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
   
# Hiển thị các thông tin gồm: oID, cID, oDate, oTotalPrice của tất cả các hoá đơn trong Bảng: Orders   
SELECT oID, cID, oDate, oTotalPrice
FROM Orders
ORDER BY oDate DESC;
   
# Hiển thị tên và giá của các sản phẩm có giá cao nhất
SELECT pName, pPrice
FROM Product
WHERE pPrice = (SELECT MAX(pPrice) FROM Product);

# Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó
SELECT Name, pName
FROM Customer c
JOIN Orders o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID;

# Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT Name
FROM Customer
WHERE cID NOT IN (SELECT DISTINCT cID FROM Orders);

# Hiển thị chi tiết của từng hóa đơn
SELECT o.oID, o.oDate, od.odQTY, p.pName, p.pPrice
FROM Orders o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID;

# Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
SELECT o.oID, o.oDate, 
    SUM(od.odQTY * p.pPrice) AS Total
FROM Orders o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;

# Tạo một view tên là Sales để hiển thị tổng doanh thu của siêu thị
CREATE VIEW Sales AS
SELECT SUM(od.odQTY * p.pPrice) AS Sales
FROM OrderDetail od
JOIN Product p ON od.pID = p.pID;

# Xóa tất cả các ràng buộc khóa ngoại, khóa chính của tất cả các bảng.
-- Xóa ràng buộc khóa ngoại trong bảng Orders
ALTER TABLE Orders DROP FOREIGN KEY orders_ibfk_1;

-- Xóa ràng buộc khóa chính trong bảng Customer
ALTER TABLE Customer DROP PRIMARY KEY;

-- Xóa ràng buộc khóa ngoại trong bảng OrderDetail
ALTER TABLE OrderDetail DROP FOREIGN KEY orderdetail_ibfk_1;
ALTER TABLE OrderDetail DROP FOREIGN KEY orderdetail_ibfk_2;

-- Xóa ràng buộc khóa chính trong bảng Product
ALTER TABLE Product DROP PRIMARY KEY;

-- Xóa ràng buộc khóa chính trong bảng Orders
ALTER TABLE Orders DROP PRIMARY KEY;

#  Tạo một trigger tên là cusUpdate trên bảng Customer, sao cho khi sửa mã khách (cID) thì mã khách trong bảng Order cũng được sửa theo
DELIMITER $$
CREATE TRIGGER cusUpdate
AFTER UPDATE ON Customer
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET cID = NEW.cID
    WHERE cID = OLD.cID;
END;
$$
DELIMITER ;

# Tạo một stored procedure tên là delProduct nhận vào 1 tham số là tên của một sản phẩm, strored procedure này sẽ xóa sản phẩm có tên được truyên vào thông qua tham số, và các thông tin liên quan đến sản phẩm đó ở trong bảng OrderDetail
DELIMITER $$
CREATE PROCEDURE delProduct(IN productName VARCHAR(255))
BEGIN
    DECLARE productID INT;
    
    -- Lấy productID của sản phẩm cần xóa
    SELECT pID INTO productID FROM Product WHERE pName = productName;
    
    -- Xóa các bản ghi liên quan trong bảng OrderDetail
    DELETE FROM OrderDetail WHERE pID = productID;
    
    -- Xóa sản phẩm từ bảng Product
    DELETE FROM Product WHERE pName = productName;
    
    SELECT CONCAT('Product ', productName, ' has been deleted along with its details in OrderDetail.') AS Message;
END
$$
DELIMITER ;
