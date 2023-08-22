/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import com.owen.service.UserService;
import java.util.Date;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
public class SickPersonController {
    
    @Autowired
    private CustomDateEditor customDateEditor;

    @Autowired
    private Environment env;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }
    
    @Autowired
    private AppointmentService appointmentService;


    @Autowired
    private UserService userService;

    @GetMapping("/user/booking")
    public String doctorInfor(Model model, Authentication authentication) {
        model.addAttribute("phieukhammoi", new Appointment());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("user", u);
        }
        return "booking";
    }
    
    @PostMapping("/user/booking")
    public String Update(Model model, Authentication authentication, @ModelAttribute(value = "phieukhammoi") @Valid Appointment a,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.appointmentService.addOrUpdateAppointment(a) == true) {
                 return "redirect:/home";
            }
           else
            System.err.println(rs.getObjectName());
        }
        return "booking";
    }
}
