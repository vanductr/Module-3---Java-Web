package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    // Mapping for home page
    @GetMapping("/")
    public String homePage() {
        return "home"; // Return view name (home.jsp)
    }

    // Mapping for toppings form submission
    @PostMapping("/toppings")
    public String submitToppings(@RequestParam(value = "toppings", required = false) List<String> toppings, Model model) {
        if (toppings == null) {
            toppings = new ArrayList<>(); // If no toppings selected, initialize an empty list
        }
        // Add selected toppings to the model to display them on the view
        model.addAttribute("selectedToppings", toppings);
        return "toppings"; // Return view name (index.jsp) to display selected toppings
    }
}

