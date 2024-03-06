package rikkei.academy;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calculate-discount")
public class CalculateDiscount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String description = request.getParameter("description");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

        // Tính toán chiết khấu
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        // Thiết lập Content-Type và mã HTML cho trang kết quả
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("    <meta charset=\"UTF-8\">");
        out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        out.println("    <title>Discount Result</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("    <h1>Discount Result</h1>");
        out.println("    <p><strong>Product Description(Mô tả):</strong> " + description + "</p>");
        out.println("    <p><strong>List Price(Giá gốc):</strong> $" + listPrice + "</p>");
        out.println("    <p><strong>Discount Percent(Phần trăm chiết khấu):</strong> " + discountPercent + "%</p>");
        out.println("    <p><strong>Discount Amount(Số tiền chiết khấu):</strong> $" + discountAmount + "</p>");
        out.println("    <p><strong>Discount Price(Giảm giá còn):</strong> $" + discountPrice + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
