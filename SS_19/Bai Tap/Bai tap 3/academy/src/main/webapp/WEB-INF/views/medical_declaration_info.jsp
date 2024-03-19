<%--
  Created by IntelliJ IDEA.
  User: tranvanduc
  Date: 2024/03/17
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Medical Declaration Information</title>
</head>
<body>
<h2>Medical Declaration Information</h2>

<p><strong>Full Name:</strong> ${medicalDeclaration.fullName}</p>
<%--<p><strong>Year of Birth:</strong> ${medicalDeclaration.yearOfBirth}</p>--%>
<p><strong>Gender:</strong> ${medicalDeclaration.gender}</p>
<p><strong>Nationality:</strong> ${medicalDeclaration.nationality}</p>
<p><strong>Identification Number:</strong> ${medicalDeclaration.identification}</p>
<p><strong>Transportation:</strong> ${medicalDeclaration.transportation}</p>
<p><strong>Vehicle Number:</strong> ${medicalDeclaration.vehicleNumber}</p>
<p><strong>Seat Number:</strong> ${medicalDeclaration.seatNumber}</p>
<p><strong>Departure Date:</strong> ${medicalDeclaration.startDate}</p>
<%--<p><strong>Return Date:</strong> ${medicalDeclaration.returnDate}</p>--%>
<p><strong>Symptoms:</strong></p>
<ul>
    <c:forEach items="${medicalDeclaration.symptoms}" var="symptom">
        <li>${symptom}</li>
    </c:forEach>
</ul>
<%--<p><strong>Exposure History:</strong> ${medicalDeclaration.exposureHistory}</p>--%>
</body>
</html>

