/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.cloudinary.Cloudinary;
import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import com.owen.service.ScheduleService;
import com.owen.service.ShiftService;
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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
    
    @Autowired
    private ShiftService shiftService;
    
    @Autowired
    private ScheduleService scheduleService;


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
    
    @GetMapping("/admin/saplichlam")
    public String lichlam(Model model,Authentication authentication) {
         List<Date> dateList = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // Đặt ngày là thứ Hai
        calendar.add(Calendar.WEEK_OF_YEAR, 1);
        dateList.add(calendar.getTime()); // Thêm ngày thứ Hai gần nhất vào danh sách
        for (int i = 0; i < 6; i++) { // Thêm các ngày từ thứ Ba đến Chủ nhật
            calendar.add(Calendar.DAY_OF_WEEK, 1);
            dateList.add(calendar.getTime());
        }
        model.addAttribute("dateList", dateList);
        model.addAttribute("lichdone", this.scheduleService.getSchedules(dateList.get(0)));
        model.addAttribute("lichlam", new ScheduleDetail());
        model.addAttribute("lich", this.shiftService.getShifts());
        model.addAttribute("getdoctor", this.userService.getBacSi());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("admin", u);

        }
        return "saplichlam";
    }
    @PostMapping("/admin/saplichlam")
    public String saplichlam(@ModelAttribute(value = "lichlam") @Valid ScheduleDetail scheduleDetail,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.scheduleService.addOrUpdateScheduleDetail(scheduleDetail) == true) {
                return "redirect:/admin/saplichlam";
            }
        }
        return "saplichlam";
    }
}
