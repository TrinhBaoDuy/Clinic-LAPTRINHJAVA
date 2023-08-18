/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.ScheduleDetail;
import com.owen.repository.ScheduleDetailRepository;
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
public class ScheduleDetailRepositoryImpl implements ScheduleDetailRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
     @Autowired
    private Environment env;
    
    @Override
    public List<ScheduleDetail> getScheduleDetails(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<ScheduleDetail> q = b.createQuery(ScheduleDetail.class);
        Root<ScheduleDetail> root = q.from(ScheduleDetail.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("name");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(b.like(root.get("name"), String.format("%%%s%%", kw)));
            }

            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

//        q.orderBy(b.desc(root.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addOrUpdateScheduleDetail(ScheduleDetail m) {
         Session s = this.factory.getObject().getCurrentSession();
        try {
            if (m.getId() == null) {
                s.save(m);
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
