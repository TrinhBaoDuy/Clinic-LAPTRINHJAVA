package com.owen.pojo;

import com.owen.pojo.Appointment;
import com.owen.pojo.PrescriptionItem;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T13:10:33")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T12:08:29")
>>>>>>> 880c7375185ff9e43759d691f5112f5fef3ca183
@StaticMetamodel(Prescription.class)
public class Prescription_ { 

    public static volatile SingularAttribute<Prescription, String> conclusion;
    public static volatile SetAttribute<Prescription, Appointment> appointmentSet;
    public static volatile SingularAttribute<Prescription, String> symptom;
    public static volatile SingularAttribute<Prescription, Date> prescriptionDate;
    public static volatile SingularAttribute<Prescription, Integer> id;
    public static volatile SetAttribute<Prescription, PrescriptionItem> prescriptionItemSet;
    public static volatile SingularAttribute<Prescription, String> prescriptioncol;

}