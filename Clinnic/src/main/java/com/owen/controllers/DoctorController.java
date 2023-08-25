/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Prescription;
import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.ServiceItems;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import com.owen.service.MedicineService;
import com.owen.service.PrescriptionService;
import com.owen.service.ScheduleService;
import com.owen.service.ServiceItemService;
import com.owen.service.ServiceService;
import com.owen.service.ShiftService;
import com.owen.service.UserService;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.time.LocalDateTime;
import java.util.Date;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Autowired
    private MedicineService medicineService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private ServiceItemService serviceItemService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private PrescriptionService prescriptionService;

    @Autowired
    private ShiftService shiftService;

    @Autowired
    private CustomDateEditor customDateEditor;

    @Autowired
    private Environment env;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @GetMapping("/doctor/xemlichkham")
    public String xemlichkham() {
        return "xemlichkham";
    }

    @ModelAttribute("currentDateTime")
    public LocalDateTime getCurrentDateTime() {
        return LocalDateTime.now();
    }

    @GetMapping("/doctor")
    public String doctorInfor(Model model, Authentication authentication) {
        model.addAttribute("doctor", new User());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("doctor", u);
//            model.addAttribute("lichkham", this.appointmentService.getAppointmentsbyDoctor(u));
//            model.addAttribute("lichkham", this.appointmentService.getAppointmentServiceByDoctor(u));
            model.addAttribute("lichkham", this.appointmentService.getAppointmentsbyDoctor(u));

        }
        return "doctor";
    }

    @GetMapping("/doctor/khambenh/{id}")
    public String khambenh(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("chitietdichvu", new ServiceItems());
        model.addAttribute("phieubenh", new Prescription());
        model.addAttribute("getmediciens", this.medicineService.getMediciness(null));
        model.addAttribute("appo", this.appointmentService.getAppointmentById(id));
        model.addAttribute("dichvu", this.serviceService.getServices(null));
        return "khambenh";
    }

    @PostMapping("/doctor/khambenh")
    public String Updatekhambenh(Model mode, @ModelAttribute(value = "phieubenh") @Valid Prescription p, @ModelAttribute(value = "chitietdichvu") @Valid ServiceItems chitietdichvu, @RequestParam(value = "appoID") int appoId,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.serviceItemService.addOrUpdateServiceItem(chitietdichvu, appoId) == true) {
                if (this.prescriptionService.addOrUpdatePrescription(p, appoId) == true) {
                    return "redirect:/doctor";
                }
            }
        }
        return "index";

    }

    //    @PostMapping("/doctor/khambenh")
//    public String Updatekhambenh(Model model, Authentication authentication, @ModelAttribute(value = "chitietdichvu") @Valid ServiceItems chitietdichvu, @ModelAttribute(value = "phieubenh") @Valid Prescription m, @ModelAttribute(value = "appo") @Valid Appointment a,
//            BindingResult rs) {
//        if (!rs.hasErrors()) {
//            if (this.serviceItemService.addOrUpdateServiceItem(chitietdichvu) == true) {
//                if (this.prescriptionService.addOrUpdatePrescription(m) == true) {
//                    a.setPrescriptionId(m);
//                    LocalDateTime localDateTime = this.getCurrentDateTime();
//                    ZoneId zoneId = ZoneId.systemDefault();
//                    Date date = Date.from(localDateTime.atZone(zoneId).toInstant());
//                    a.setMedicalappointmentDate(date);
//                        return "redirect:/doctor";
//
//                }
//
//            }
//        }
//        return "doctor";
//
//    }
    @GetMapping("/doctor/dangkylam")
    public String dangkylam(Model model, Authentication authentication) {

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

//        List<ScheduleDetail> scheduleDetails = new ArrayList<ScheduleDetail>();
        model.addAttribute("lichlam", new ScheduleDetail());
        model.addAttribute("lich", this.shiftService.getShifts());
        if (authentication != null) {
            UserDetails user = this.userService.loadUserByUsername(authentication.getName());
            User u = this.userService.getUserByUsername(user.getUsername());
            model.addAttribute("doctor", u);

        }
        return "dangkylam";
    }

    @PostMapping("/doctor/dangkylam")
    public String update(@ModelAttribute(value = "lichlam") @Valid ScheduleDetail scheduleDetails,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.scheduleService.addOrUpdateScheduleDetail(scheduleDetails) == true) {
                return "redirect:/doctor/dangkylam";
            }
        }
        return "dangkylam";
    }

    @GetMapping("/doctor/khambenh/kethuoc")
    public String kethuoc(Model model, Authentication authentication) {

        return "kethuoc";
    }
    @GetMapping("/doctor/khambenh/lichsukham")
    public String lichsukham(Model model, Authentication authentication) {

        return "lichsukham";
    }
}
