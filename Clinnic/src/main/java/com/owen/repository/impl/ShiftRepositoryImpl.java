/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Shift;
import com.owen.repository.ShiftRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author Trinh Bao Duy
 */
public class ShiftRepositoryImpl implements ShiftRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Shift> getShifts() {
     Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Shift");
        
        return q.getResultList();    
    }
    
}
