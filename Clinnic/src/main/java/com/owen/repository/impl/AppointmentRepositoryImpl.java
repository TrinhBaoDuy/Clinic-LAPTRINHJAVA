/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Trinh Bao Duy
 */
@Repository
@Transactional
public class AppointmentRepositoryImpl implements AppointmentRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Appointment> getAppointments(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Appointment");
        return q.getResultList();

    }

    @Override
    public List<Appointment> getAppointmentsunfished() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Appointment WHERE status = :statusParam");
        q.setParameter("statusParam", (short) 0);

        return q.getResultList();
    }

    @Override
    public Boolean changestatus(int id ,User u) {
        Session session = this.factory.getObject().getCurrentSession();
        Appointment a = session.get(Appointment.class, id);
        try {
            if (a.getStatus()== 1) {
                a.setStatus((short) 0);
                a.setNurseId(null);
            } else {
                a.setStatus((short) 1);
                a.setNurseId(u);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;

    }

}
