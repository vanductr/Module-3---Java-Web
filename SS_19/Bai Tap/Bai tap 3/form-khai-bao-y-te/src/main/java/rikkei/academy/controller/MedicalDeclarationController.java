package rikkei.academy.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import rikkei.academy.model.MedicalDeclaration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Controller
public class MedicalDeclarationController {

    @GetMapping(value = {"/","/medical-declaration"})
    public String showForm(Model model) {
        model.addAttribute("medicalDeclaration", new MedicalDeclaration());
        return "medical_declaration_form";
    }

    @PostMapping("/submit-medical-declaration")
    public String submitMedicalDeclaration(@ModelAttribute("medicalDeclaration") MedicalDeclaration medicalDeclaration, ModelMap model) {
            // Thêm thông tin đăng ký y tế vào ModelMap
            model.addAttribute("fullName", medicalDeclaration.getFullName());
//            model.addAttribute("dob", medicalDeclaration.getDob());
            model.addAttribute("gender", medicalDeclaration.getGender());
            model.addAttribute("nationality", medicalDeclaration.getNationality());
            model.addAttribute("identification", medicalDeclaration.getIdentification());
            model.addAttribute("transportation", medicalDeclaration.getTransportation());
            model.addAttribute("vehicleNumber", medicalDeclaration.getVehicleNumber());
            model.addAttribute("seatNumber", medicalDeclaration.getSeatNumber());
//            model.addAttribute("startDate", medicalDeclaration.getStartDate());
//            model.addAttribute("endDate", medicalDeclaration.getEndDate());
            model.addAttribute("symptoms", medicalDeclaration.getSymptoms());
            model.addAttribute("exposure", medicalDeclaration.getExposure());

            return "medical_declaration_info"; // Chuyển hướng đến trang thành công
    }
}

