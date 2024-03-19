<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/17
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
</head>
<body>
<h2>Create Employee</h2>
<form action="addEmployee" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br><br>

    <label for="id">ID:</label>
    <input type="text" id="id" name="id"><br><br>

    <label for="contactNumber">Contact Number:</label>
    <input type="text" id="contactNumber" name="contactNumber"><br><br>

    <input type="submit" value="Submit">
</form>
</body>
</html>

