/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Medicine;
import com.owen.service.MedicineService;
import java.io.IOException;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
@Transactional
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

//    @ModelAttribute
//    public void commonAttr(Model model, @RequestParam Map<String, String> params) {
//        model.addAttribute("getmediciens", this.medicineService.getMediciness(params));
//    }
//    @GetMapping("/quanlythuoc/{id}")
//    public String delete(@PathVariable(value = "id") int id) {
//        if (this.medicineService.deleteMedicine(id) == true) {
//            return "forward:/quanlythuoc";
//        }
//        return "quanlythuoc";
//    }
    @GetMapping("/quanlythuoc")
    public String quanlythuoc(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("medicien", new Medicine());
        model.addAttribute("getmediciens", this.medicineService.getMediciness(params));
        return "quanlythuoc";
    }

    @PostMapping("/quanlythuoc")
    public String XuLi(Model model, @ModelAttribute(value = "medicien") Medicine m, BindingResult rs) throws IOException {
            if (this.medicineService.addOrUpdateMedicine(m) == true) {
                return "redirect:/quanlythuoc";
            }
        return "quanlythuoc";
    }

}
