<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/16
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sandwich Toppings</title>
</head>
<body>
<h1>Sandwich Toppings</h1>

<!-- Display selected toppings -->
<h3>Selected toppings:</h3>
<ul>
    <!-- Use JSP expression to iterate over selected toppings -->
    <c:forEach var="topping" items="${selectedToppings}">
        <li>${topping}</li>
    </c:forEach>
</ul>

<br>

<a href="http:/">Quay lại Chọn Toppings</a>
</body>
</html>
