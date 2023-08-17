/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.owen.repository;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Trinh Bao Duy
 */
public interface AppointmentRepository {
    List<Appointment> getAppointments(Map<String, String> params);
    List<Appointment> getAppointmentsunfished();
    Boolean changestatus(int id, User u);
    List<Appointment> getAppointmentsbyDoctor(User u);
    List<Object[]> getAppointmentServiceByDoctor(User doctor);
}
