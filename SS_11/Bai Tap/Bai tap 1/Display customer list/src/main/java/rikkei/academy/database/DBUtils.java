package rikkei.academy.database;

import rikkei.academy.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class DBUtils {
    private static final List<Customer> CUSTOMERS = new ArrayList<Customer>();

    static {
        initData();
    }

    private static void initData() {
        // Giả lập dữ liệu cho khách hàng
        CUSTOMERS.add(new Customer( "John Doe", "1990-01-01", "123 Main St", "https://images.pexels.com/photos/18460803/pexels-photo-18460803/free-photo-of-c-d-ng-c-vang-d-ng.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        CUSTOMERS.add(new Customer( "Jane Smith", "1985-05-15", "456 Elm St", "java//rikkei//academy//database//image_ss11_bt1//member-2.png"));
        CUSTOMERS.add(new Customer( "Alice Johnson", "1992-10-20", "789 Oak St", "image3.jpg"));
    }

    // Truy vấn danh sách khách hàng
    public static List<Customer> queryCustomers() {
        return CUSTOMERS;
    }
}

