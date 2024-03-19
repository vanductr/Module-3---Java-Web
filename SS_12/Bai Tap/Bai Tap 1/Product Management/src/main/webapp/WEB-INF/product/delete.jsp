<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/08
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
    <a href="/product-management">Back to Product list</a>
</p>
<%-- Hiển thị thông tin sản phẩm cần xóa --%>
<c:if test="${not empty product}">
    <p>Are you sure you want to delete product with the following information?</p>
    <p>ID: ${product.getId()}</p>
    <p>Name: ${product.getName()}</p>
    <p>Price: ${product.getPrice()}</p>
    <p>Description: ${product.getDescription()}</p>
    <p>Manufacturer: ${product.getManufacturer()}</p>
    <form method="post">
        <input type="hidden" name="id" value="${product.getId()}">
        <input type="submit" value="Delete">
    </form>
</c:if>
</body>
</html>

