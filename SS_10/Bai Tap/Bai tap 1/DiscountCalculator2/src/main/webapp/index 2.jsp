<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discount Calculator</title>
</head>
<body>
<h1>Discount Calculator</h1>
<form action="/calculate-discount" method="POST">
    <div>
        <label for="description">Product Description(Mô tả của Sản phẩm):</label>
        <input type="text" id="description" name="description" required>
    </div>
    <div>
        <label for="listPrice">List Price(Giá niêm yết):</label>
        <input type="number" id="listPrice" name="listPrice" step="0.01" required>
    </div>
    <div>
        <label for="discountPercent">Discount Percent(tỉ lệ chiết khấu):</label>
        <input type="number" id="discountPercent" name="discountPercent" step="0.01" required>
    </div>
    <button type="submit">Calculate Discount(Tính chiết khấu)</button>
</form>
</body>
</html>
