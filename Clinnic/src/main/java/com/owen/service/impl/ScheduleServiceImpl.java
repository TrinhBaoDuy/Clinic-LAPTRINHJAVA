/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.User;
import com.owen.repository.ScheduleRepository;
import com.owen.service.ScheduleService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class ScheduleServiceImpl implements ScheduleService{
    
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public List<ScheduleDetail> getSchedules(Map<String, String> params) {
           return this.scheduleRepository.getSchedules(params);
    }

    @Override
    public boolean addOrUpdateScheduleDetail(ScheduleDetail m) {
        return this.scheduleRepository.addOrUpdateScheduleDetail(m);
    }

    @Override
    public boolean deleteScheduleDetail(int id) {
        return this.scheduleRepository.deleteScheduleDetail(id);
    }

    @Override
    public boolean addOrUpdateScheduleDetails(List<ScheduleDetail> scheduleDetails) {
        return this.scheduleRepository.addOrUpdateScheduleDetails(scheduleDetails);
    }

    @Override
    public List<ScheduleDetail> getSchedules(Date fromDate) {
        return this.scheduleRepository.getSchedules(fromDate);
    }

    @Override
    public List<ScheduleDetail> getSchedulesaccepted(Date fromDate) {
        return this.scheduleRepository.getSchedulesaccepted(fromDate);
    }

    @Override
    public ScheduleDetail getScheduleDetailById(int id) {
        return this.scheduleRepository.getScheduleDetailById(id);
    }

    @Override
    public boolean checkLichHopLe(Date dateSchedule , int shiftId,int role) {
        return this.scheduleRepository.checkLichHopLe(dateSchedule,shiftId,role);
    }

    @Override
    public List<ScheduleDetail> getScheduleDetailsByTaiKhoan(User user) {
        return this.scheduleRepository.getScheduleDetailsByTaiKhoan(user);
    }
    
}


