/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Appointment;
import com.owen.pojo.Service;
import com.owen.pojo.ServiceItems;
import com.owen.pojo.User;
import com.owen.repository.AppointmentRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.LockOptions;
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

//    @Override
//    public Boolean changestatus(int id, User u, int idDoctor) {
//        Session session = this.factory.getObject().getCurrentSession();
//        Appointment a = session.get(Appointment.class, id);
//        User doctor = session.get(User.class, idDoctor);
//        try {
//            if (a.getStatus() == 1) {
//                a.setStatus((short) 0);
//                a.setNurseId(null);
//                a.setDoctorId(null);
//            } else {
//                a.setStatus((short) 1);
//                a.setNurseId(u);
//                a.setDoctorId(doctor);
//            }
//            return true;
//        } catch (HibernateException ex) {
//            ex.printStackTrace();
//        }
//        return false;
//
//    }
    @Override
    public Appointment changestatus(int id, User yta) {
        Session session = this.factory.getObject().getCurrentSession();
        Appointment m = session.get(Appointment.class, id);
        try {
            if (m.getStatus() != null && m.getStatus() == 1) {
                m.setStatus((short) 0);
                m.setNurseId(null);
                m.setDoctorId(null);
                m.setMedicalappointmentDate(null);
            } else {
                m.setStatus((short) 1);
                m.setNurseId(yta);
            }
            return m;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Appointment> getAppointmentsbyDoctor(User u) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Appointment> criteria = builder.createQuery(Appointment.class);
        Root<Appointment> root = criteria.from(Appointment.class);

        criteria.select(root).where(builder.and(
                builder.equal(root.get("doctorId"), u),
                builder.equal(root.get("status"), 1)
        ));

        Query query = session.createQuery(criteria);
        return query.getResultList();
    }

    @Override
    public List<Object[]> getAppointmentServiceByDoctor(User doctor) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> criteria = builder.createQuery(Object[].class);

        Root<Appointment> appointmentRoot = criteria.from(Appointment.class);
        Join<Appointment, ServiceItems> serviceItemsJoin = appointmentRoot.join("serviceItemsSet");
        Join<ServiceItems, Service> serviceJoin = serviceItemsJoin.join("serviceId");

        criteria.select(builder.array(appointmentRoot, serviceJoin));
        criteria.where(builder.and(builder.equal(appointmentRoot.get("doctorId"), doctor), builder.equal(appointmentRoot.get("status"), 1)));

        List<Object[]> results = session.createQuery(criteria).getResultList();
        return results;
    }

    @Override
    public boolean addOrUpdateAppointment(Appointment m) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (m.getId() == null) {
                s.save(m);
                m.setStatus((short) 0);
                return true;
            } else {
                s.update(m);
                if (m.getStatus() != null && m.getStatus() == 1) {
                    m.setStatus((short) 0);
                    m.setNurseId(null);
                    m.setDoctorId(null);
                } else {
                    m.setStatus((short) 1);
//                    m.setNurseId(yta);
                }

                return true;
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Appointment getAppointmentById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Appointment> query = builder.createQuery(Appointment.class);
        Root<Appointment> root = query.from(Appointment.class);
        query.where(builder.equal(root.get("id"), id));
        Query q = session.createQuery(query);
        List<Appointment> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

}
