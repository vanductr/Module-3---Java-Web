USE QuanLyBanHang;
INSERT INTO Customer
VALUE (1, 'Minh Quan', 10);
INSERT INTO Customer
VALUE (2, 'Ngoc Oanh', 20);
INSERT INTO Customer
VALUE (3, 'Hong Ha', 50);
INSERT INTO Orders
VALUE (1, 1, '2006-3-21', null);
INSERT INTO Orders
VALUE (2, 2, '2006-3-23', null);
INSERT INTO Orders
VALUE (3, 1, '2006-3-16', null);
SELECT * FROM Orders;
INSERT INTO Product
VALUE (1, 'May Giat', 3);
INSERT INTO Product
VALUE (2, 'Tu Lanh', 5);
INSERT INTO Product
VALUE (3, 'Dieu Hoa', 7);
INSERT INTO Product
VALUE (4, 'Quat', 1);
INSERT INTO Product
VALUE (5, 'Bep Dien', 2);
INSERT INTO OrderDetail
VALUE (1, 1, 3);
INSERT INTO OrderDetail
VALUE (1, 3, 7);
INSERT INTO OrderDetail
VALUE (1, 4, 2);
INSERT INTO OrderDetail
VALUE (2, 1, 1);
INSERT INTO OrderDetail
VALUE (3, 1, 8);
INSERT INTO OrderDetail
VALUE (2, 5, 4);
INSERT INTO OrderDetail
VALUE (2, 3, 3);
SELECT oID, oDate, oTotalPrice
FROM Orders;
SELECT Customer.cID, Customer.cName, Customer.cAge, Orders.oID, Orders.oDate, Orders.oTotalPrice, Product.pID, Product.pName, Product.pPrice
FROM Customer
JOIN Orders ON Customer.cID = Orders.cID
JOIN OrderDetail ON Orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID;
SELECT cName
FROM Customer
WHERE cID NOT IN (SELECT cID FROM Orders);
SELECT Orders.oID, oDate, SUM(odQTY * pPrice) AS oTotalPrice
FROM Orders
JOIN OrderDetail ON Orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID
GROUP BY oID, oDate;