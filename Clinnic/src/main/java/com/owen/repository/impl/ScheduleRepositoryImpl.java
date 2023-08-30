/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Prescription;
import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.Shift;
import com.owen.repository.ScheduleRepository;
import com.owen.service.ShiftService;
import java.util.ArrayList;
import java.util.Date;
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
public class ScheduleRepositoryImpl implements ScheduleRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Override
    public List<ScheduleDetail> getSchedules(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<ScheduleDetail> q = b.createQuery(ScheduleDetail.class);
        Root<ScheduleDetail> root = q.from(ScheduleDetail.class);
        q.select(root);

//        q.orderBy(b.desc(root.get("id")));
        Query query = session.createQuery(q);

        return query.getResultList();
    }
    
    @Override
    public List<ScheduleDetail> getSchedules(Date fromDate) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<ScheduleDetail> query = builder.createQuery(ScheduleDetail.class);
        Root<ScheduleDetail> root = query.from(ScheduleDetail.class);
        query.select(root);

        if (fromDate != null) {
            // Tạo điều kiện lọc lịch từ ngày truyền vào trở đi
            Predicate fromDatePredicate = builder.greaterThanOrEqualTo(root.get("dateSchedule"), fromDate);
            query.where(fromDatePredicate);
        }

        Query typedQuery = session.createQuery(query);
        return typedQuery.getResultList();
    }

    @Override
    public boolean addOrUpdateScheduleDetail(ScheduleDetail m) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (m.getId() == null) {
                for (Date date : m.getListdate()) {
                    ScheduleDetail newScheduleDetail = new ScheduleDetail();
                    newScheduleDetail.setDateSchedule(date);
                    newScheduleDetail.setShiftId(m.getShiftId());
                    newScheduleDetail.setUserId(m.getUserId());
                    newScheduleDetail.setStatus(m.getStatus());

                    s.save(newScheduleDetail);
                }
            } else {
                s.update(m);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean addOrUpdateScheduleDetails(List<ScheduleDetail> scheduleDetails) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            for (ScheduleDetail scheduleDetail : scheduleDetails) {
                if (scheduleDetail.getId() == null) {
                    s.save(scheduleDetail);
                } else {
                    s.update(scheduleDetail);
                }
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteScheduleDetail(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        ScheduleDetail pr = session.get(ScheduleDetail.class, id);
        try {
            session.delete(pr);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
