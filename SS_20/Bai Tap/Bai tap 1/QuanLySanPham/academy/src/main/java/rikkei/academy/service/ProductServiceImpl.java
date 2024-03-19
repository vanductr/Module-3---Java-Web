package rikkei.academy.service;

import rikkei.academy.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements IProductService{
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();

        products.put(1, new Product(1, "San pham 1", 300, "Mo ta 1", "Nha SX 1"));
        products.put(2, new Product(2, "San pham 2", 400, "Mo ta 2", "Nha SX 2"));
        products.put(3, new Product(3, "San pham 3", 500, "Mo ta 3", "Nha SX 3"));
        products.put(4, new Product(4, "San pham 4", 200, "Mo ta 4", "Nha SX 4"));
        products.put(5, new Product(5, "San pham 5", 100, "Mo ta 5", "Nha SX 5"));
    }
    @Override
    public List<Product> getAllProducts() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product getProductById(int id) {
        return products.get(id);
    }

    @Override
    public void addProduct(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void deleteProduct(int id) {
        products.remove(id);
    }

    @Override
    public int getNewId() {
        List<Product> productList = getAllProducts();
        int idMax = 0;
        for (Product product : productList) {
            if (product.getId() > idMax) {
                idMax = product.getId();
            }
        }
        idMax = idMax + 1;
        return idMax;
    }
}
