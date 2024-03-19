<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/08
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
<h1>Product Details</h1>
<p>
    <a href="/product-management">Back to Product list</a>
</p>
<%-- Hiển thị thông tin chi tiết của sản phẩm --%>
<c:if test="${not empty product}">
    <p>ID: ${product.getId()}</p>
    <p>Name: ${product.getName()}</p>
    <p>Price: ${product.getPrice()}</p>
    <p>Description: ${product.getDescription()}</p>
    <p>Manufacturer: ${product.getManufacturer()}</p>
</c:if>
</body>
</html>

