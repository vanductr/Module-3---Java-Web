package rikkei.academy.timeworld;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/time-world")
public class HelloServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Hello World</h1>");
        writer.println("</html>");

        writer.println("<html>");
        Date today = new Date();
        writer.println("<h1>" + today +"</h1>");
        writer.println("</html>");
    }

    public void destroy() {
    }
}