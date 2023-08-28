/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Bill;
import com.owen.repository.BillRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class BillRepositoryImpl implements BillRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Override
    public List<Bill> getBills() {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Bill> query = builder.createQuery(Bill.class);
        Query q = session.createQuery(query);
        List<Bill> results = q.getResultList();
        return results;
    }

    @Override
    public boolean addOrUpdateBill(Bill m) {
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

    @Override
    public boolean deleteBill(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        Bill me = session.get(Bill.class, id);
        try {
            session.delete(me);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Bill getBillById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Bill> query = builder.createQuery(Bill.class);
        Root<Bill> root = query.from(Bill.class);
        query.where(
                builder.and(
                        builder.equal(root.get("id"), id)
                )
        );
        Query q = session.createQuery(query);
        List<Bill> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

}
