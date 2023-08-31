/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.controllers;

import com.owen.pojo.Appointment;
import com.owen.pojo.Bill;
import com.owen.pojo.PrescriptionItem;
import com.owen.pojo.User;
import com.owen.service.AppointmentService;
import com.owen.service.BillService;
import com.owen.service.PaymentService;
import com.owen.service.PrescriptionItemService;
import com.owen.service.ServiceItemService;
import com.owen.service.ServiceService;
import com.owen.service.UserService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import org.springframework.web.bind.annotation.RequestParam;
//import org.apache.commons.mail.Email;
//import org.apache.commons.mail.EmailException;
//import org.apache.commons.mail.SimpleEmail;
//import org.apache.commons.mail.DefaultAuthenticator;

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

    @Autowired
    private JavaMailSender emailSender;

    @Autowired
    private PrescriptionItemService prescriptionItemService;

    @Autowired
    private ServiceItemService serviceItemService;

    @Autowired
    private BillService billService;

    @Autowired
    private PaymentService paymentService;

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
        model.addAttribute("getbacsi", this.userService.getBacSi(id));
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
            BindingResult rs) throws MessagingException {
        if (!rs.hasErrors()) {
            Date ngaykham = a.getAppointmentDate();
            if (this.appointmentService.canAcceptAppointment(ngaykham) == true) {
                if (this.appointmentService.addOrUpdateAppointment(a)) {
                    MimeMessage message = emailSender.createMimeMessage();
                    MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
                    String nguoinhan = this.userService.getUserById(a.getSickpersonId().getId()).getEmaill();
                    String tennguoibenh = this.userService.getUserById(a.getSickpersonId().getId()).getName();
                    String tenbacsi = this.userService.getUserById(a.getDoctorId().getId()).getName();
                    String ngaydikham = a.getAppointmentDate().toString();
                    System.err.println(nguoinhan);
                    helper.setTo(nguoinhan);
                    helper.setSubject("LỊCH HẸN PHÒNG MẠCH");

                    String content = "<html><body>"
                            + "<p>Xin chào, " + tennguoibenh + "</p>"
                            + "<p>Bạn có lịch hẹn khám tại phòng mạch PIXCEL vào ngày [" + ngaydikham + "]</p>"
                            + "<p>Bác sĩ của bạn là " + tenbacsi + " .</p>"
                            + "<p>Chúng tôi hân hạnh chào đón bạn.</p>"
                            + "</body></html>";

                    helper.setText(content, true);

                    emailSender.send(message);
//                    model.addAttribute("successMessage", "Lịch hẹn đã được cập nhật và email đã được gửi thành công.");
                    return "redirect:/nurse";
                }

            } else {
                MimeMessage message = emailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
                String nguoinhan = this.userService.getUserById(a.getSickpersonId().getId()).getEmaill();
                String tennguoibenh = this.userService.getUserById(a.getSickpersonId().getId()).getName();
                String ngaydikham = a.getAppointmentDate().toString();
                System.err.println(nguoinhan);
                helper.setTo(nguoinhan);
                helper.setSubject("LỊCH HẸN PHÒNG MẠCH");

                String content = "<html><body>"
                        + "<p>Xin chào, " + tennguoibenh + "</p>"
                        + "<p>Bạn có lịch hẹn khám tại phòng mạch PIXCEL vào ngày [" + ngaydikham + "]</p>"
                        + "<p>Tuy nhiên , phòng mạch của chúng tôi đã đạt tối đa số lượng khách.</p>"
                        + "<p>Hi vọng bạn có thể chọn khám vào một ngày khác .Chúng tôi hân hạnh chào đón bạn.</p>"
                        + "</body></html>";

                helper.setText(content, true);

                emailSender.send(message);
//                model.addAttribute("errorMessage", "Không thể đặt lịch hẹn. Phòng mạch đã đạt tối đa số lượng khách.");
                return "redirect:/nurse";
            }
        }

        return "nurse";
    }

    @GetMapping("/nurse/thanhtoan/{id}")
    public String thanhtoan(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("appo", this.appointmentService.getAppointmentById(id));
        Appointment a = this.appointmentService.getAppointmentById(id);
        int idPre = a.getPrescriptionId().getId();
        List<PrescriptionItem> thuocs = this.prescriptionItemService.getPrescriptionsbyIDPres(idPre);
        model.addAttribute("thuoc", this.prescriptionItemService.getPrescriptionsbyIDPres(idPre));
        model.addAttribute("dichvu", this.serviceItemService.getServicecbyAppoID(id));
        model.addAttribute("pay", this.paymentService.getPayments());
        model.addAttribute("bill", new Bill());
        return "thanhtoan";
    }

    @PostMapping("/nurse/thanhtoan")
    public String xulithanhtoan(Model model, @ModelAttribute(value = "bill") @Valid Bill bill, BindingResult rs) throws MessagingException {
        if (!rs.hasErrors()) {
            if (this.billService.addOrUpdateBill(bill) == true) {
                 return "redirect:/nurse";
            }     
        }
        return "thanhtoan";
    }
}
