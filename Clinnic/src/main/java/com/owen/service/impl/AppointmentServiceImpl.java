/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import com.owen.service.AppointmentService;
import java.util.Date;
import java.util.List;
import java.util.Map;
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

}
