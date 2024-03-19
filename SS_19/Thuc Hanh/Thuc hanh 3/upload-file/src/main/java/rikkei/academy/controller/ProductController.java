package rikkei.academy.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import rikkei.academy.model.Product;
import rikkei.academy.model.ProductForm;
import rikkei.academy.service.IProductService;
import rikkei.academy.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    private final IProductService productService = new ProductService();

    @GetMapping(value = {"/","/product"})
    public String index(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "/index";
    }

    @GetMapping("/create")
    public ModelAndView showCreateForm() {
        ModelAndView modelAndView = new ModelAndView("/create");
        modelAndView.addObject("productForm", new ProductForm());
        return modelAndView;
    }

//    @Value("${file-upload}")
//    private String fileUpload;
//            ="/Users/tranvanduc/Documents/Tài liệu - MacBook Pro của Trần/Module 3/SS_19/Thuc Hanh/Thuc hanh 3/upload-file/src/main/webapp/image";
    @PostMapping("/save")
    public ModelAndView saveProduct(@ModelAttribute ProductForm productForm) {
        MultipartFile multipartFile = productForm.getImage();
        String fileName = multipartFile.getOriginalFilename();
        File fileUpload = new File("/Users/tranvanduc/Documents/Tài liệu - MacBook Pro của Trần/Module 3/SS_19/Thuc Hanh/Thuc hanh 3/upload-file/src/main/webapp/image");
        if (!fileUpload.exists()) {
            fileUpload.mkdirs();
        }
        try {
            FileCopyUtils.copy(productForm.getImage().getBytes(), new File(fileUpload + File.separator + fileName));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        Product product = new Product(productForm.getId(), productForm.getName(),
                productForm.getDescription(), fileName);
        productService.save(product);
        ModelAndView modelAndView = new ModelAndView("/create");
        modelAndView.addObject("productForm", productForm);
        modelAndView.addObject("message", "Created new product successfully !");
        return modelAndView;
    }

}

