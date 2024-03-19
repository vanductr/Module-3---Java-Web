<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/17
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form action="calculate" method="post">
    <label for="num1">Number 1:</label><br>
    <input type="text" id="num1" name="num1"><br>
    <label for="num2">Number 2:</label><br>
    <input type="text" id="num2" name="num2"><br>
    <input type="submit" value="Add" name="operation">
    <input type="submit" value="Subtract" name="operation">
    <input type="submit" value="Multiply" name="operation">
    <input type="submit" value="Divide" name="operation">
</form>

<h3>Result</h3>
<p>
    Calculation: ${num1} ${operator} ${num2} = ${result}
</p>
<c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>
</body>
</html>

