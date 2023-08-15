/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.pojo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hung
 */
@Entity
@Table(name = "schedule_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ScheduleDetail.findAll", query = "SELECT s FROM ScheduleDetail s"),
    @NamedQuery(name = "ScheduleDetail.findByDateSchedule", query = "SELECT s FROM ScheduleDetail s WHERE s.dateSchedule = :dateSchedule"),
    @NamedQuery(name = "ScheduleDetail.findById", query = "SELECT s FROM ScheduleDetail s WHERE s.id = :id")})
public class ScheduleDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "date_schedule")
    @Temporal(TemporalType.DATE)
    private Date dateSchedule;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "schedule_id", referencedColumnName = "id")
    @ManyToOne
    private ScheduleClinic scheduleId;
    @JoinColumn(name = "shift_id", referencedColumnName = "id")
    @ManyToOne
    private Shift shiftId;

    public ScheduleDetail() {
    }

    public ScheduleDetail(Integer id) {
        this.id = id;
    }

    public Date getDateSchedule() {
        return dateSchedule;
    }

    public void setDateSchedule(Date dateSchedule) {
        this.dateSchedule = dateSchedule;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ScheduleClinic getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(ScheduleClinic scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Shift getShiftId() {
        return shiftId;
    }

    public void setShiftId(Shift shiftId) {
        this.shiftId = shiftId;
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
        if (!(object instanceof ScheduleDetail)) {
            return false;
        }
        ScheduleDetail other = (ScheduleDetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.owen.pojo.ScheduleDetail[ id=" + id + " ]";
    }
    
}
