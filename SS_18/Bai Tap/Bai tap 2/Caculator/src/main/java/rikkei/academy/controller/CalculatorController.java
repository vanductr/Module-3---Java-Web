package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalculatorController {
    // Mapping for home page
    @GetMapping("/")
    public String homePage() {
        return "index"; // Return view name (home.jsp)
    }

    @PostMapping("/calculate")
    public ModelAndView calculate(@RequestParam("num1") double num1,
                                  @RequestParam("num2") double num2,
                                  @RequestParam("operation") String operation) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");

        double result;
        String operator;

        switch (operation) {
            case "Add":
                result = num1 + num2;
                operator = "+";
                break;
            case "Subtract":
                result = num1 - num2;
                operator = "-";
                break;
            case "Multiply":
                result = num1 * num2;
                operator = "*";
                break;
            case "Divide":
                if (num2 != 0) {
                    result = num1 / num2;
                    operator = "/";
                } else {
                    modelAndView.addObject("error", "Cannot divide by zero");
                    return modelAndView;
                }
                break;
            default:
                modelAndView.addObject("error", "Invalid operation");
                return modelAndView;
        }

        modelAndView.addObject("num1", num1);
        modelAndView.addObject("num2", num2);
        modelAndView.addObject("operator", operator);
        modelAndView.addObject("result", result);

        return modelAndView;
    }
}

