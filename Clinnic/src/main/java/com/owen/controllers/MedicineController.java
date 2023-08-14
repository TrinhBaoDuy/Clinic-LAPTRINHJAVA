/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Medicine;
import com.owen.pojo.User;
import com.owen.service.MedicineService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    @ModelAttribute
    public void commonAttr(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("mediciens", this.medicineService.getMediciness(params));
    }

    @GetMapping("/quanlythuoc/{id}")
    public String xuli(Model model, @RequestParam Map<String, String> params, @PathVariable(value = "id") int id, Authentication authentication) {
        if (this.medicineService.deleteMedicine(id) == true) {
            return "forward:/lich";
        }
        return "quanlythuoc";
    }
    @GetMapping("/quanlythuoc")
    public String quanlythuoc(Model model) {
        model.addAttribute("medicien", new Medicine());
        return "quanlythuoc";
    }
    
    
}
