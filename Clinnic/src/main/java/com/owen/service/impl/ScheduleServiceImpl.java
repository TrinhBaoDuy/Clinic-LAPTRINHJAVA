/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.ScheduleDetail;
import com.owen.repository.ScheduleRepository;
import com.owen.service.ScheduleService;
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
    
}
