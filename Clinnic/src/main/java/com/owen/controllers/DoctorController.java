/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;


import com.owen.pojo.User;
import com.owen.service.AppointmentService;
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
public class DoctorController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private AppointmentService appointmentService;
    
    @GetMapping("/doctor/xemlichkham")
    public String xemlichkham() {
        return "xemlichkham";
    }
    @GetMapping("/doctor")
    public String doctorInfor(Model model, Authentication authentication) {
        model.addAttribute("doctor", new User());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("doctor", u);
//            model.addAttribute("lichkham", this.appointmentService.getAppointmentsbyDoctor(u));
        }     
        return "doctor";
    }
    @GetMapping("/doctor/khambenh")
    public String khambenh() {
        return "khambenh";
    }
    
    
}
