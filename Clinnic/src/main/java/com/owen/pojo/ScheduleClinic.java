/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hung
 */
@Entity
@Table(name = "schedule_clinic")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ScheduleClinic.findAll", query = "SELECT s FROM ScheduleClinic s"),
    @NamedQuery(name = "ScheduleClinic.findById", query = "SELECT s FROM ScheduleClinic s WHERE s.id = :id"),
    @NamedQuery(name = "ScheduleClinic.findByStatus", query = "SELECT s FROM ScheduleClinic s WHERE s.status = :status")})
public class ScheduleClinic implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "status")
    private Short status;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private User userId;
    @OneToMany(mappedBy = "scheduleId")
    private Set<ScheduleDetail> scheduleDetailSet;

    public ScheduleClinic() {
    }

    public ScheduleClinic(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @XmlTransient
    public Set<ScheduleDetail> getScheduleDetailSet() {
        return scheduleDetailSet;
    }

    public void setScheduleDetailSet(Set<ScheduleDetail> scheduleDetailSet) {
        this.scheduleDetailSet = scheduleDetailSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ScheduleClinic)) {
            return false;
        }
        ScheduleClinic other = (ScheduleClinic) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.owen.pojo.ScheduleClinic[ id=" + id + " ]";
    }
    
}
