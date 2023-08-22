/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;


import com.owen.service.RoleService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ControllerAdvice;
import com.owen.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Trinh Bao Duy
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class IndexController {

    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RoleService roleService;

    @Autowired
    private Environment env;

    @RequestMapping("/")
    @Transactional
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("countuser", this.userService.countUser());
        model.addAttribute("getuser",this.userService.getUsers(params));
//        model.addAttribute("msg", "Nhap");
        
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.userService.countUser();
        model.addAttribute("counter", Math.ceil(count*1.0/pageSize));
        
        return "index";
    }
    
    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("roles", this.roleService.getRoles());
    }
    
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
     @GetMapping("/home")
    public String home() {
        return "home";
    }   
}
