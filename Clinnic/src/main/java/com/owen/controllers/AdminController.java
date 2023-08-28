/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.cloudinary.Cloudinary;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.owen.service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
public class AdminController {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private UserService userService;
    
    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private CustomDateEditor customDateEditor;

    @Autowired
    private Environment env;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @GetMapping("/admin/quanlytaikhoan")
    public String quanlytaikhoan(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("user", this.userService.getUsers(params));
        return "quanlytaikhoan";
    }

    @GetMapping("/admin/quanlytaikhoan/themtaikhoan")
    public String themtaikhoan(Model model) {
        model.addAttribute("nguoidung", new User());
        return "themtaikhoan";
    }

    @GetMapping("/admin/quanlytaikhoan/themtaikhoan/{id}")
    public String capnhattaikhoan(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("nguoidung", this.userService.getUserById(id));
        return "themtaikhoan";
    }

    @PostMapping("/admin/quanlytaikhoan/themtaikhoan")
    public String addAndUpUser(@ModelAttribute(value = "nguoidung") @Valid User u, BindingResult rs) throws IOException {
        if (!rs.hasErrors()) {
            if (this.userService.addOrUpdateUser(u) == true) {
                return "redirect:/admin/quanlytaikhoan";
            }
        }
        return "themtaikhoan";
    }

    @GetMapping("/admin")
    public String thanhtoan() {
        return "admin";
    }

    @GetMapping("/admin/thongke")
    public String thongke(Model model) {
        model.addAttribute("list", this.appointmentService.getCountUserByMonth());
        return "thongke";
    }
}
