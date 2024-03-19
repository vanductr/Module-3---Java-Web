package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import rikkei.academy.model.EmailConfiguration;

@Controller
public class EmailConfigController {
    private EmailConfiguration config = new EmailConfiguration();

    @GetMapping(value = {"/","/config"})
    public String configForm(Model model) {
        model.addAttribute("config", config);
        return "/config";
    }

    @PostMapping("/config")
    public String configSubmit(@ModelAttribute EmailConfiguration config) {
        this.config.setLanguage(config.getLanguage());
        this.config.setPageSize(config.getPageSize());
        this.config.setSpamFilter(config.isSpamFilter());
        this.config.setSignature(config.getSignature());
        return "redirect:/config";
    }
}

