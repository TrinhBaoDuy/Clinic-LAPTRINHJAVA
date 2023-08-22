/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.repository.impl;

import com.owen.pojo.Role;
import com.owen.pojo.User;
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
import org.springframework.context.annotation.PropertySource;
//import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.owen.repository.UserRepository;

/**
 *
 * @author Trinh Bao Duy
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private Environment env;

    @Override
    public List<User> getUsers(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root<User> root = q.from(User.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("name");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(b.like(root.get("name"), String.format("%%%s%%", kw)));
            }


            String roleId = params.get("roleId");
            if (roleId != null && !roleId.isEmpty()) {
                predicates.add(b.equal(root.get("roleId"), Integer.parseInt(roleId)));
            }

            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        q.orderBy(b.desc(root.get("id")));

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
    public Long countUser() {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> query = builder.createQuery(Long.class);
        Root root = query.from(User.class);
        query.select(builder.count(root));
//        query.where(builder.equal(root.get("roleId"), 2));
        Query q = session.createQuery(query);
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean deleteUser(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        User user = session.get(User.class, id);
        try {
            session.delete(user);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace(); 
        }
        return false;

    }

    @Override
    public List<User> searchUsersByName(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root<User> root = query.from(User.class);

        if (params != null) {
            String kw = params.get("nameUser");
            if (kw != null && !kw.isEmpty()) {
                query.where(
                        builder.and(
//                                builder.equal(root.get("roleId"), 2),
                                builder.like(root.get("name"), String.format("%%%s%%", kw))
                        )
                );
            } else {
                query.select(root);
            }
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdateUser(User p) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (p.getId() == null) {
                s.save(p);
            } else {
                s.update(p);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root<User> root = query.from(User.class);
        query.where(
                builder.and(
                        builder.equal(root.get("id"), id)
//                        builder.equal(root.get("roleId"), 2)
                )
        );
        Query q = session.createQuery(query);
        List<User> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
     @Override
    public User getUserByUsername(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM User WHERE username=:un");
        q.setParameter("un", username);

        return (User) q.getSingleResult();
    }
    public Role getRoleBS()
    {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Role Where name =: doctor");
        q.setParameter("doctor", "ROLE_DOCTOR" );
        return (Role) q.getSingleResult();
    }

    @Override
    public List<User> getBacSi() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From User Where roleId =: doctor");
        q.setParameter("doctor", this.getRoleBS());

        return q.getResultList();
    }
}
