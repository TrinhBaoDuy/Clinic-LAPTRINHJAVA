/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.User;
import com.owen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author hung
 */
@Controller
public class NurseController {

    @Autowired
    private UserService userService;
    
    
    @GetMapping("/nurse")
    public String nurseInfor(Model model, Authentication authentication) {
        model.addAttribute("nurse", new User());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("nurse", u);
        }

        return "nurse";
    }

    @GetMapping("/nurse/xeplichkham")
    public String xeplichkham() {
        return "xeplichkham";
    }
}
