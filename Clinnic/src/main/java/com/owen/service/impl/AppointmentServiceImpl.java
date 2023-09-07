/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.cloudinary.utils.ObjectUtils;
import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import com.owen.repository.UserRepository;
import com.owen.repository.impl.UserRepositoryImpl;
import com.owen.service.AppointmentService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class AppointmentServiceImpl implements AppointmentService {

    @Autowired
    private AppointmentRepository appointmentRepository;
    
    @Autowired
    private UserRepository UserRepository;

    @Override
    public List<Appointment> getAppointments(Map<String, String> params) {
        return this.appointmentRepository.getAppointments(params);
    }

    @Override
    public List<Appointment> getAppointmentsunfished() {
        return this.appointmentRepository.getAppointmentsunfished();
    }

    @Override
    public Appointment changestatus(int m, User yta) {
        return this.appointmentRepository.changestatus(m,yta);
    }
    @Override
    public List<Appointment> getAppointmentsbyDoctor(User u) {
        return this.appointmentRepository.getAppointmentsbyDoctor(u);
    }

    @Override
    public List<Object[]> getAppointmentServiceByDoctor(User doctor) {
        return this.appointmentRepository.getAppointmentServiceByDoctor(doctor);
    }

    @Override
    public Appointment getAppointmentById(int id) {
        return this.appointmentRepository.getAppointmentById(id);

    }

    @Override
    public boolean addOrUpdateAppointment(Appointment m) {
        return this.appointmentRepository.addOrUpdateAppointment(m);
    }

    @Override
    public List<Appointment> getAppointmentsbyUser(User u) {
        return this.appointmentRepository.getAppointmentsbyUser(u);
    }

    @Override
    public boolean canAcceptAppointment(Date date) {
           return this.appointmentRepository.canAcceptAppointment(date);
    }

    @Override
    public List<Integer> getCountUserByMonth(int year) {
        return this.appointmentRepository.getCountUserByMonth(year);
    }

    @Override
    public Integer getCountUserByOneMonth(int month) {
        return this.appointmentRepository.getCountUserByOneMonth(month);
    }

    @Override
    public List<Integer> getCountUserByQuarter(List<Integer> months) {
        return this.appointmentRepository.getCountUserByQuarter(months);
    }

    @Override
    public List<Integer> getCountUserByQuarter(int year) {
        return this.appointmentRepository.getCountUserByQuarter(year);
    }
    
    @Override
    public Appointment dangkykham(Map<String, String> params){
        Appointment a = new Appointment();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parsedDate = null;

        try {
            parsedDate = dateFormat.parse(params.get("appointmentDate"));
        } catch (ParseException ex) {
            Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        User nguoibenh = this.UserRepository.getUserById(Integer.parseInt(params.get("sickpersonId")));
        a.setAppointmentDate(parsedDate);
        a.setSickpersonId(nguoibenh);
        this.appointmentRepository.addOrUpdateAppointment(a);
        return a;
    }

    @Override
    public List<Appointment> getAppointmentcantPay() {
        return this.appointmentRepository.getAppointmentcantPay();
    }
}


