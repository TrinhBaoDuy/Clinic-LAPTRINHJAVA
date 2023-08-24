/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.ServiceItems;
import com.owen.repository.ServiceItemRepository;
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
public class ServiceItemRepositoryImpl implements ServiceItemRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public boolean addOrUpdateServiceItem(ServiceItems m , int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Appointment a = s.get(Appointment.class, id);
        try {
            if (m.getId() == null) {
                s.save(m);
                m.setAppoId(a);
            } else {
                s.update(m);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
