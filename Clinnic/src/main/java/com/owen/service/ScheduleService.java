/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.owen.service;

import com.owen.pojo.ScheduleDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Trinh Bao Duy
 */
public interface ScheduleService {
    List<ScheduleDetail> getSchedules(Map<String, String> params);
    boolean addOrUpdateScheduleDetail(ScheduleDetail m);
    boolean deleteScheduleDetail(int id);
    boolean addOrUpdateScheduleDetails(List<ScheduleDetail> scheduleDetails);
}
