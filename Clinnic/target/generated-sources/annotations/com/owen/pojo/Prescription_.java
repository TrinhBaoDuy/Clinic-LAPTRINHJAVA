package com.owen.pojo;

import com.owen.pojo.Appointment;
import com.owen.pojo.PrescriptionItem;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T16:16:21")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T13:35:14")
>>>>>>> 6c6d327f7ecbcf3c2b677a47b4d6789888b7b5fc
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