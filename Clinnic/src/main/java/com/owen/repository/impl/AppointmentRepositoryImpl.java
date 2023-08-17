/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.Medicine;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
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

    @Autowired
    private Environment env;

    @Override
    public List<Appointment> getAppointments(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Appointment> q = b.createQuery(Appointment.class);
        Root<Appointment> root = q.from(Appointment.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("name");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(b.like(root.get("sickpersonId").get("name"), String.format("%%%s%%", kw)));
//                predicates.add(b.like(root.get("doctorId").get("name"), String.format("%%%s%%", kw)));
            }

            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

//        q.orderBy(b.desc(root.get("id")));
        Query query = session.createQuery(q);

        if (params != null) {
            String page = params.get("page");
            if (page != null && !page.isEmpty()) {
                int p = Integer.parseInt(page);
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));

                query.setMaxResults(pageSize);
                query.setFirstResult((p - 1) * pageSize);
            }
        }

        return query.getResultList();

    }

    @Override
    public List<Appointment> getAppointmentsunfished() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Appointment WHERE status = :statusParam");
        q.setParameter("statusParam", (short) 0);

        return q.getResultList();
    }

    @Override
    public Boolean changestatus(int id, User u) {
        Session session = this.factory.getObject().getCurrentSession();
        Appointment a = session.get(Appointment.class, id);
        try {
            if (a.getStatus() == 1) {
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

    @Override
    public List<Appointment> getAppointmentsbyDoctor(User u) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Appointment WHERE doctorId = :statusParam");
        q.setParameter("statusParam", u.getId());

        return q.getResultList();
    }

}
