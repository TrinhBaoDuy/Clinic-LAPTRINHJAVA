/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.PrescriptionItem;
import com.owen.repository.PrescriptionItemRepository;
import com.owen.service.PrescriptionItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class PrescriptionItemServiceImpl implements  PrescriptionItemService{

    @Autowired
    private PrescriptionItemRepository prescriptionItemRepository;
    
    @Override
    public boolean addOrUpdatePrescriptionItem(PrescriptionItem m) {
            return this.prescriptionItemRepository.addOrUpdatePrescriptionItem(m);
    }
    
}