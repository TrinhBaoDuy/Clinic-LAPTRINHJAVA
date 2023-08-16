/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author hung
 */
public class NurseController {
    @GetMapping("/nurse/nurseInfor")
    public String nurseInfor() {
        return "nurseInfor";
    }
     @GetMapping("/nurse/xeplichkham")
    public String xeplichkham() {
        return "xeplichkham";
    }
}
