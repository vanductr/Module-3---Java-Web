package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import rikkei.academy.model.Product;
import rikkei.academy.service.IProductService;
import rikkei.academy.service.ProductServiceImpl;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = {"/", "/product"})
public class ProductController {
    private final IProductService productService = new ProductServiceImpl();

    @GetMapping
    public String index(Model model) {
        List<Product> productList = productService.getAllProducts();
        model.addAttribute("products", productList);
        return "/index";
    }

    @GetMapping("/create")
    public String create(Model model) {
        Product product = new Product();
        product.setId(productService.getNewId());
        model.addAttribute("product", product);
        return "/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("customer") Product product, Model model) {
        // Đoạn này sẽ xử lý lưu thông tin của khách hàng mới vào cơ sở dữ liệu
        productService.addProduct(product);
        // Sau khi lưu thành công, bạn có thể redirect người dùng về trang danh sách khách hàng hoặc trang khác
        return "redirect:/product"; // Redirect về trang danh sách khách hàng
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "/edit";
    }

    @PostMapping("/update")
    public String update(Product product) {
        productService.updateProduct(product.getId(), product);
        return "redirect:/product";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "/delete";
    }

    @PostMapping("/delete")
    public String delete(Product product, RedirectAttributes redirect) {
        productService.deleteProduct(product.getId());
        redirect.addFlashAttribute("success", "Removed product successfully!");
        return "redirect:/product";
    }

    @GetMapping("/{id}/view")
    public String view(@PathVariable int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "/view";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam("keyword") String keyword, Model model) {
        List<Product> productList = productService.getAllProducts();

        // Lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
        List<Product> filteredProducts = productList.stream()
                .filter(product -> product.getName().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());

        model.addAttribute("products", filteredProducts);
        return "/index";
    }
}
