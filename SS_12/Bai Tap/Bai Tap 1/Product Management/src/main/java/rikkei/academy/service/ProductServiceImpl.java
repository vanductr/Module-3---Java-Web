package rikkei.academy.service;

import rikkei.academy.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Product A", 100, "Description A", "Manufacturer A"));
        products.put(2, new Product(2, "Product B", 200, "Description B", "Manufacturer B"));
        products.put(3, new Product(3, "Product C", 300, "Description C", "Manufacturer C"));
        products.put(4, new Product(4, "Product D", 400, "Description D", "Manufacturer D"));
        products.put(5, new Product(5, "Product E", 500, "Description E", "Manufacturer E"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findByName(String productName) {
        List<Product> productList = findAll();
        for (Product product : productList) {
            if (product.getName().equals(productName)) {
                return product;
            }
        }
        return null;
    }
}

