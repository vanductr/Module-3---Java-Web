<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/14
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
<h2>Dictionary</h2>
<form action="/search" method="get">
    <label>Search Word: </label>
    <input type="text" name="word" placeholder="Enter a word"/>
    <input type="submit" value="Search"/>
</form>
<hr/>
<h3>Nghĩa Tiếng Việt:</h3>
<p>${meaning}</p>
</body>
</html>

