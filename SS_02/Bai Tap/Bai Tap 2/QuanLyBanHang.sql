create database QuanLyBanHang;
USE QuanLyBanHang;
CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(255),
    cAge INT
);
CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(255),
    pPrice DECIMAL(10, 2)
);
CREATE TABLE Orders (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice DECIMAL(10, 2),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES Orders(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);