<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/08
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h1>Create Product</h1>
<p>
    <a href="/product-management">Back to Product list</a>
</p>
<form method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea><br>

    <label for="manufacturer">Manufacturer:</label>
    <input type="text" id="manufacturer" name="manufacturer" required><br>

    <input type="submit" value="Create">
</form>

<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
</body>
</html>

