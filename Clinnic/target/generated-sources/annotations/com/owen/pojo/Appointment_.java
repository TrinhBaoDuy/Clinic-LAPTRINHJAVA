package com.owen.pojo;

import com.owen.pojo.Payment;
import com.owen.pojo.Prescription;
import com.owen.pojo.ServiceItems;
import com.owen.pojo.User;
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
@StaticMetamodel(Appointment.class)
public class Appointment_ { 

    public static volatile SetAttribute<Appointment, ServiceItems> serviceItemsSet;
    public static volatile SingularAttribute<Appointment, Prescription> prescriptionId;
    public static volatile SingularAttribute<Appointment, User> doctorId;
    public static volatile SingularAttribute<Appointment, User> nurseId;
    public static volatile SingularAttribute<Appointment, Date> medicalappointmentDate;
    public static volatile SingularAttribute<Appointment, Integer> id;
    public static volatile SingularAttribute<Appointment, User> sickpersonId;
    public static volatile SingularAttribute<Appointment, Date> appointmentDate;
    public static volatile SetAttribute<Appointment, Payment> paymentSet;
    public static volatile SingularAttribute<Appointment, Short> status;

}