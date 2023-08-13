/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import com.owen.service.AppointmentService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class AppointmentServiceImpl implements AppointmentService{
    
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
    public Boolean changestatus(int id,User u) {
        return this.appointmentRepository.changestatus(id,u);
    }
    
}
