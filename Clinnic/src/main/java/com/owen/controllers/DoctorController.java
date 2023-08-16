/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author hung
 */
@Controller
public class DoctorController {
    
  @GetMapping("/doctor/xemlichkham")
    public String xemlichkham() {
        return "xemlichkham";
    }
    @GetMapping("/doctor/doctorInfor")
    public String doctorInfor() {
        return "doctorInfor";
    }
    @GetMapping("/doctor/khambenh")
    public String khambenh() {
        return "khambenh";
    }
    
    
}
