package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrencyConversionServlet {

    @GetMapping("/converter")
    public String convertCurrency(@RequestParam("rate") double rate, @RequestParam("usd") double usd, Model model) {
        // Thực hiện tính toán chuyển đổi tiền tệ
        double vnd = rate * usd;

        // Đặt giá trị của biến vnd vào model attribute
        model.addAttribute("vnd", vnd);

        // Gửi kết quả tính toán đến view để hiển thị
        return "result";
    }
}


