/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Appointment;
import com.owen.pojo.Medicine;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import com.owen.service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author hung
 */
@Controller
public class NurseController {

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

    @GetMapping("/nurse")
    public String nurseInfor(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        model.addAttribute("getbacsi", this.userService.getBacSi());
        model.addAttribute("Apo", this.appointmentService.getAppointments(params));
        model.addAttribute("appoment", new Appointment());
        model.addAttribute("UnApo", this.appointmentService.getAppointmentsunfished());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("nurse", u);
        }
        return "nurse";
    }

    @GetMapping("/nurse/{id}")
    public String xuli(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params, Authentication authentication, HttpServletRequest request) {
        model.addAttribute("getbacsi", this.userService.getBacSi());
//        HttpSession session = request.getSession();
//        session.setAttribute("appoment", this.appointmentService.getAppointmentById(id));
        model.addAttribute("appoment", this.appointmentService.getAppointmentById(id));
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("nurse", u);
//             model.addAttribute("appoment", this.appointmentService.changestatus(id, u));
            model.addAttribute("Apo", this.appointmentService.getAppointments(params));
//            return "forward:/nurse";
        }
//        }
        return "nurse";
    }

    @PostMapping("/nurse")
    public String Update(Model model, Authentication authentication, @ModelAttribute(value = "appoment") @Valid Appointment a,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.appointmentService.addOrUpdateAppointment(a) == true) {
                return "redirect:/nurse";
            }
        }
        return "nurse";
    }
}
