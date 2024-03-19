<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/08
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <a href="/product-management">Back to Product list</a>
</p>
<form method="post">
    <input type="hidden" name="id" value="${product.getId()}">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${product.getName()}" required><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" value="${product.getPrice()}" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required>${product.getDescription()}</textarea><br>

    <label for="manufacturer">Manufacturer:</label>
    <input type="text" id="manufacturer" name="manufacturer" value="${product.getManufacturer()}" required><br>

    <input type="submit" value="Save">
</form>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
</body>
</html>

