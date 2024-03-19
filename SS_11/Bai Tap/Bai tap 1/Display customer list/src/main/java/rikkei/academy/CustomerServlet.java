package rikkei.academy;

import rikkei.academy.database.DBUtils;
import rikkei.academy.model.Customer;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Truy vấn dữ liệu từ DBUtils để lấy danh sách khách hàng giả lập
        List<Customer> customerList = DBUtils.queryCustomers();

        // Lưu danh sách khách hàng vào thuộc tính 'customers' của request.
        request.setAttribute("customers", customerList);

        // Tạo một đối tượng RequestDispatcher để chuyển tiếp yêu cầu đến trang JSP.
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/WEB-INF/jsps/jstl_example.jsp");

        // Chuyển tiếp yêu cầu để hiển thị danh sách khách hàng trên trang JSP.
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}


