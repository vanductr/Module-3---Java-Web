package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import rikkei.academy.model.MedicalDeclaration;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MedicalDeclarationController {

    @GetMapping(value = {"/","/medical-declaration"})
    public String showForm(Model model) {
        model.addAttribute("medicalDeclaration", new MedicalDeclaration());
        return "medical_declaration_form";
    }

    @PostMapping("/submit-medical-declaration")
    public String submitMedicalDeclaration(@ModelAttribute("medicalDeclaration") MedicalDeclaration medicalDeclaration, @RequestParam("startDate") String dateStart, ModelMap model) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(dateStart);
        medicalDeclaration.setStartDate(date);
        model.addAttribute("medicalDeclaration", medicalDeclaration);
        return "medical_declaration_info";
    }
}

