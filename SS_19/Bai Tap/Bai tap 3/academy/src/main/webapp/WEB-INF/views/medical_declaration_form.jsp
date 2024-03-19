<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/17
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Biểu mẫu Tờ khai y tế</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        form {
            width: 21cm;
            padding: 2cm;
            margin: 0 auto;
            background: #fff;
            box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], select {
            width: calc(100% - 4px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="checkbox"], input[type="radio"] {
            margin-right: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 0 auto;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>Biểu mẫu Tờ khai y tế</h2>
<form action="submit-medical-declaration" method="post">
    <%--@declare id="symptoms"--%><%--@declare id="exposure"--%>
    <label for="fullName">Họ và tên (viết hoa):</label>
    <input type="text" id="fullName" name="fullName" style="text-transform: uppercase;" required>

    <label >Ngày sinh:</label>


    <label for="gender">Giới tính:</label>
    <select id="gender" name="gender" required>
        <option value="nam">Nam</option>
        <option value="nữ">Nữ</option>
        <option value="khác">Khác</option>
    </select>

    <label for="nationality">Quốc tịch:</label>
    <input type="text" id="nationality" name="nationality" required>

    <label for="identification">Số hộ chiếu/CMND:</label>
    <input type="text" id="identification" name="identification" required>

    <label>Phương tiện đi lại:</label>
    <input type="radio" id="transportation_air" name="transportation" value="bằng máy bay">
    <label for="transportation_air">Bằng máy bay</label>
    <input type="radio" id="transportation_sea" name="transportation" value="bằng tàu thuyền">
    <label for="transportation_sea">Bằng tàu thuyền</label>
    <input type="radio" id="transportation_car" name="transportation" value="bằng ô tô">
    <label for="transportation_car">Bằng ô tô</label>
    <input type="radio" id="transportation_other" name="transportation" value="khác">
    <label for="transportation_other">Khác</label>

    <label for="vehicleNumber">Số hiệu phương tiện:</label>
    <input type="text" id="vehicleNumber" name="vehicleNumber">

    <label for="seatNumber">Số ghế:</label>
    <input type="text" id="seatNumber" name="seatNumber">

    <label for="startDate">Ngày khởi hành:</label>
    <input type="date" id="startDate" name="startDate" required>
<%--    <label for="endDate">Ngày kết thúc:</label>--%>
<%--    <input type="date" id="endDate" name="endDate" required>--%>

    <label for="symptoms">Trong vòng 14 ngày qua, anh/chị có bị các triệu chứng sau không?</label>
    <input type="checkbox" id="symptom_fever" name="symptoms" value="sốt">
    <label for="symptom_fever">Sốt</label>
    <input type="checkbox" id="symptom_cough" name="symptoms" value="ho">
    <label for="symptom_cough">Ho</label>
    <!-- Thêm các triệu chứng khác ở đây nếu cần -->

    <label for="exposure">Trong vòng 14 ngày qua, anh/chị có tiếp xúc với các trường hợp sau không?</label>
    <input type="checkbox" id="exposure_travel" name="exposure" value="đi du lịch">
    <label for="exposure_travel">Đi du lịch đến các vùng có dịch</label>
    <input type="checkbox" id="exposure_contact" name="exposure" value="tiếp xúc">
    <label for="exposure_contact">Tiếp xúc với các trường hợp đã được xác nhận nhiễm</label>
    <!-- Thêm các tình huống tiếp xúc khác ở đây nếu cần -->

    <br>
    <input type="submit" value="Gửi đi">
</form>
</body>
</html>



