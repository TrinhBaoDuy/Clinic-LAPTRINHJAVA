/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.owen.pojo.User;
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
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
public class UserController {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private UserService userService;

    @GetMapping("/admin/users")
    public String list(Model model) {
        model.addAttribute("user", new User());
        return "users";
    }
    @ModelAttribute
    public void commonAttr(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("user", this.userService.getUsers(params));
    }

    @GetMapping("/admin/users/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "users";
    }

    @PostMapping("/admin/users")
    public String addAndUp(@ModelAttribute(value = "user") @Valid User u, BindingResult rs) throws IOException {   
        if (!rs.hasErrors()) {
                    if (this.userService.addOrUpdateUser(u) == true) {
                        return "redirect:/";
                    }
                }
        
        return "users";
    }
     @GetMapping("/admin/themtaikhoan")
    public String themtaikhoan() {
        return "themtaikhoan";
    }
     @GetMapping("/admin/quanlytaikhoan")
    public String quanlytaikhoan() {
        return "quanlytaikhoan";
    }
}

