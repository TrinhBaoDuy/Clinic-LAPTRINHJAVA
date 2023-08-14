/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.Medicine;
import com.owen.repository.MedicineRepository;
import com.owen.service.MedicineService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class MedicineServiceImpl implements MedicineService{
    
    @Autowired
    private MedicineRepository medicineRepository;

    @Override
    public List<Medicine> getMediciness(Map<String, String> params) {
        return this.medicineRepository.getMediciness(params);
    }

    @Override
    public boolean addOrUpdateMedicine(Medicine m) {
        return this.medicineRepository.addOrUpdateMedicine(m);
    }

    @Override
    public boolean deleteMedicine(int id) {
        return this.medicineRepository.deleteMedicine(id);
    }
    
}
