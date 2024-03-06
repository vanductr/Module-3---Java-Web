CREATE DATABASE StoreManagement;
USE StoreManagement;
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50),
    productName VARCHAR(255),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Áo thun nam', 15.99, 100, 'Áo thun nam hàng xuất khẩu chất lượng cao', 'available'),
    ('P002', 'Quần jeans nữ', 29.99, 80, 'Quần jeans nữ hàng nhập khẩu, kiểu dáng đẹp', 'available'),
    ('P003', 'Điện thoại di động', 499.99, 50, 'Điện thoại di động mới nhất với nhiều tính năng hiện đại', 'available'),
    ('P004', 'Máy tính xách tay', 899.99, 30, 'Máy tính xách tay mỏng nhẹ, hiệu suất cao', 'available');
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P005', 'Tai nghe không dây', 39.99, 120, 'Tai nghe không dây chất lượng cao, pin lâu bền', 'available'),
    ('P006', 'Chuột không dây', 9.99, 150, 'Chuột máy tính không dây, thiết kế tiện lợi', 'available'),
    ('P007', 'Bàn phím cơ', 49.99, 80, 'Bàn phím cơ cao cấp, cảm giác gõ tốt', 'available'),
    ('P008', 'Màn hình máy tính', 199.99, 50, 'Màn hình máy tính LED 24 inch, chất lượng hình ảnh tốt', 'available'),
    ('P009', 'Ổ cứng di động', 79.99, 100, 'Ổ cứng di động dung lượng lớn, tốc độ truy xuất nhanh', 'available'),
    ('P010', 'Thẻ nhớ microSD', 14.99, 200, 'Thẻ nhớ microSD dung lượng cao, tốc độ đọc/ghi nhanh', 'available'),
    ('P011', 'Loa Bluetooth', 29.99, 120, 'Loa Bluetooth di động, âm thanh sống động', 'available'),
    ('P012', 'Balo laptop', 19.99, 100, 'Balo laptop chống nước, ngăn chứa nhiều', 'available'),
    ('P013', 'Ốp lưng điện thoại', 7.99, 300, 'Ốp lưng điện thoại chống va đập, thiết kế mỏng nhẹ', 'available'),
    ('P014', 'Chuột gaming', 19.99, 80, 'Chuột gaming chơi game mượt mà, độ chính xác cao', 'available'),
    ('P015', 'Bàn phím gaming', 29.99, 60, 'Bàn phím gaming cao cấp, phím bấm nhạy', 'available'),
    ('P016', 'Tai nghe gaming', 49.99, 70, 'Tai nghe gaming âm thanh vòm 7.1, mic nhiễu tốt', 'available'),
    ('P017', 'Màn hình cong', 249.99, 40, 'Màn hình cong LED 27 inch, hiệu ứng hình ảnh sâu', 'available'),
    ('P018', 'Camera an ninh', 89.99, 90, 'Camera an ninh giám sát 24/7, chất lượng hình ảnh cao', 'available'),
    ('P019', 'Đèn LED', 9.99, 150, 'Đèn LED tiết kiệm năng lượng, ánh sáng trắng tự nhiên', 'available'),
    ('P020', 'Máy in phun màu', 149.99, 30, 'Máy in phun màu chất lượng cao, in ấn nhanh chóng', 'available'),
    ('P021', 'Máy chiếu mini', 199.99, 20, 'Máy chiếu mini di động, phù hợp cho việc di chuyển', 'available'),
    ('P022', 'Thiết bị lưu trữ NAS', 299.99, 10, 'Thiết bị lưu trữ NAS dung lượng lớn, tích hợp nhiều tính năng', 'available'),
    ('P023', 'Router Wi-Fi 6', 99.99, 50, 'Router Wi-Fi 6 tốc độ cao, phủ sóng rộng', 'available'),
    ('P024', 'Ổ cứng SSD', 59.99, 80, 'Ổ cứng SSD tốc độ truy xuất nhanh, khởi động hệ thống nhanh chóng', 'available');
SELECT * FROM Products;
ALTER TABLE Products
ADD UNIQUE INDEX idx_productCode (productCode);
ALTER TABLE Products
ADD INDEX idx_productName_productPrice (productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Bàn phím cơ';
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
SELECT * FROM ProductInfo;
ALTER VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productDescription
FROM Products;
SELECT * FROM ProductInfo;
UPDATE ProductInfo
SET productName = 'Áo thun nam Edited', productPrice = 55.55
WHERE productCode = 'P001';
SELECT * FROM ProductInfo;
SELECT * FROM Products;
DROP VIEW IF EXISTS ProductInfo;
SELECT * FROM Products;
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;
CALL GetAllProducts();
DELIMITER //

CREATE PROCEDURE InsertProduct(
    IN p_productCode VARCHAR(255),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription VARCHAR(255),
    IN p_productStatus INT
)
BEGIN
    INSERT INTO Products (
        productCode,
        productName,
        productPrice,
        productAmount,
        productDescription,
        productStatus
    ) VALUES (
        p_productCode,
        p_productName,
        p_productPrice,
        p_productAmount,
        p_productDescription,
        p_productStatus
    );
END //

DELIMITER ;
CALL InsertProduct('P025', 'New Product', 10.99, 100, 'Description', 1);

DELIMITER //

CREATE PROCEDURE UpdateProduct(
    IN p_productId INT,
    IN p_productCode VARCHAR(255),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription VARCHAR(255),
    IN p_productStatus INT
)
BEGIN
    UPDATE Products
    SET
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE
        id = p_productId;
END //

DELIMITER ;
CALL UpdateProduct(1, 'P001', 'Updated Product', 15.99, 200, 'Updated Description', 1);
SELECT * FROM Products;
CALL getAllProducts();
DELIMITER //

CREATE PROCEDURE DeleteProduct(
    IN p_productId INT
)
BEGIN
    DELETE FROM Products WHERE id = p_productId;
END //

DELIMITER ;
CALL DeleteProduct(2);
CALL getAllProducts();