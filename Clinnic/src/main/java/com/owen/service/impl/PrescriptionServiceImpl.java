/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.owen.pojo.Prescription;
import com.owen.repository.PrescriptionRepository;
import com.owen.service.PrescriptionService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trinh Bao Duy
 */
@Service
public class PrescriptionServiceImpl implements  PrescriptionService{

    @Autowired
    private PrescriptionRepository prescriptionRepository;
    
    @Override
    public List<Prescription> getPrescriptions(Map<String, String> params) {
        return this.prescriptionRepository.getPrescriptions(params);
    }

    @Override
    public boolean addOrUpdatePrescription(Prescription m) {
        return this.prescriptionRepository.addOrUpdatePrescription(m);
    }

    @Override
    public boolean deletePrescription(int id) {
        return this.prescriptionRepository.deletePrescription(id);
    }

    @Override
    public String getDoctorPrescribeMedicine(int id) {
        return this.prescriptionRepository.getDoctorPrescribeMedicine(id);
    }
    
}
