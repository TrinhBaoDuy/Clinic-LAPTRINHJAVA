/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.owen.service;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Trinh Bao Duy
 */
public interface AppointmentService {

    List<Appointment> getAppointments(Map<String, String> params);

    List<Appointment> getAppointmentsunfished();

    Appointment changestatus(int id, User yta);

    List<Appointment> getAppointmentsbyDoctor(User u);

    List<Object[]> getAppointmentServiceByDoctor(User doctor);

    Appointment getAppointmentById(int id);

    boolean addOrUpdateAppointment(Appointment m);
    
    List<Appointment> getAppointmentsbyUser(User u);
    
     boolean canAcceptAppointment(Date date);
     
     List<Integer> getCountUserByMonth();
     List<Integer> getCountUserByQuarter();
     Integer getCountUserByOneMonth(int month);
     List<Integer> getCountUserByQuarter(List<Integer> months);
}
