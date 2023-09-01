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
            Predicate fromDatePredicate = builder.greaterThanOrEqualTo(root.get("dateSchedule"), fromDate);
            Predicate statusPredicate = builder.notEqual(root.get("status"), 1);
            Predicate finalPredicate = builder.and(fromDatePredicate, statusPredicate);

            query.where(finalPredicate);
        }

        Query typedQuery = session.createQuery(query);
        return typedQuery.getResultList();
    }

    @Override
    public List<ScheduleDetail> getSchedulesaccepted(Date fromDate) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<ScheduleDetail> query = builder.createQuery(ScheduleDetail.class);
        Root<ScheduleDetail> root = query.from(ScheduleDetail.class);
        query.select(root);

        if (fromDate != null) {
            // Tạo điều kiện lọc lịch từ ngày truyền vào trở đi
            Predicate fromDatePredicate = builder.greaterThanOrEqualTo(root.get("dateSchedule"), fromDate);

            // Tạo điều kiện lọc khi status bằng 1
            Predicate statusPredicate = builder.equal(root.get("status"), 1);

            // Kết hợp các điều kiện với nhau
            Predicate finalPredicate = builder.and(fromDatePredicate, statusPredicate);

            query.where(finalPredicate);
        }

        Query typedQuery = session.createQuery(query);
        return typedQuery.getResultList();
    }

    @Override
    public boolean addOrUpdateScheduleDetail(ScheduleDetail m) {
        Session s = this.factory.getObject().getCurrentSession();
        Shift s1 = s.get(Shift.class, 1);
        Shift s2 = s.get(Shift.class, 2);
        Shift s3 = s.get(Shift.class, 3);
        try {
            if (m.getId() == null) {
                if (m.getListdate1().length > 0) {
                    for (Date date : m.getListdate1()) {
                        ScheduleDetail newScheduleDetail = new ScheduleDetail();
                        newScheduleDetail.setDateSchedule(date);
                        newScheduleDetail.setShiftId(s1);
                        newScheduleDetail.setUserId(m.getUserId());
                        newScheduleDetail.setStatus(m.getStatus());

                        s.save(newScheduleDetail);
                    }
                }
                if (m.getListdate2().length > 0) {
                    for (Date date : m.getListdate2()) {
                        ScheduleDetail newScheduleDetail = new ScheduleDetail();
                        newScheduleDetail.setDateSchedule(date);
                        newScheduleDetail.setShiftId(s2);
                        newScheduleDetail.setUserId(m.getUserId());
                        newScheduleDetail.setStatus(m.getStatus());

                        s.save(newScheduleDetail);
                    }
                }
                if (m.getListdate3().length > 0) {
                    for (Date date : m.getListdate3()) {
                        ScheduleDetail newScheduleDetail = new ScheduleDetail();
                        newScheduleDetail.setDateSchedule(date);
                        newScheduleDetail.setShiftId(s3);
                        newScheduleDetail.setUserId(m.getUserId());
                        newScheduleDetail.setStatus(m.getStatus());

                        s.save(newScheduleDetail);
                    }
                }
            } else {
                s.update(m);
                m.setStatus((short)1);
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
    
    @Override
    public ScheduleDetail getScheduleDetailById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<ScheduleDetail> query = builder.createQuery(ScheduleDetail.class);
        Root<ScheduleDetail> root = query.from(ScheduleDetail.class);
        query.where(
                builder.and(
                        builder.equal(root.get("id"), id)
                //                        builder.equal(root.get("roleId"), 2)
                )
        );
        Query q = session.createQuery(query);
        List<ScheduleDetail> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

}
