/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.ScheduleDetail;
import com.owen.repository.ScheduleDetailRepository;
import com.owen.service.ScheduleDetailService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class ScheduleDetailServiceImpl implements  ScheduleDetailService{
    
    @Autowired
    private ScheduleDetailRepository scheduleDetailRepository;

    @Override
    public List<ScheduleDetail> getScheduleDetails(Map<String, String> params) {
        return this.scheduleDetailRepository.getScheduleDetails(params);
    }

    @Override
    public boolean addOrUpdateScheduleDetail(ScheduleDetail m) {
        return this.scheduleDetailRepository.addOrUpdateScheduleDetail(m);
    }
    
}
