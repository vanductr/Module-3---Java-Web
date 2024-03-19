<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/16
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sandwich Toppings</title>
</head>
<body>
<h1>Sandwich Toppings</h1>

<!-- Form for selecting toppings -->
<form action="/toppings" method="post">
    <h3>Select toppings:</h3>
    <input type="checkbox" id="lettuce" name="toppings" value="Lettuce">
    <label for="lettuce">Lettuce</label><br>
    <input type="checkbox" id="tomato" name="toppings" value="Tomato">
    <label for="tomato">Tomato</label><br>
    <input type="checkbox" id="onion" name="toppings" value="Onion">
    <label for="onion">Onion</label><br>
    <input type="checkbox" id="pickles" name="toppings" value="Pickles">
    <label for="pickles">Pickles</label><br>
    <input type="checkbox" id="cheese" name="toppings" value="Cheese">
    <label for="cheese">Cheese</label><br>

    <input type="submit" value="Submit">
</form>
</body>
</html>

