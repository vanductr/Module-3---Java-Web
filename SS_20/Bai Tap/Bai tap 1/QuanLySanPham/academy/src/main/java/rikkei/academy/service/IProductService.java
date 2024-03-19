package rikkei.academy.service;

import rikkei.academy.model.Product;

import java.util.List;

public interface IProductService {

    // Lấy danh sách tất cả sản phẩm
    List<Product> getAllProducts();

    // Lấy thông tin sản phẩm bằng id
    Product getProductById(int id);

    // Thêm mới một sản phẩm
    void addProduct(Product product);

    // Cập nhật thông tin một sản phẩm
    void updateProduct(int id, Product product);

    // Xóa một sản phẩm
    void deleteProduct(int id);

    int getNewId();
}
