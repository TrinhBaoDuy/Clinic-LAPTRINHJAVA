package com.owen.pojo;

import com.owen.pojo.Appointment;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T13:10:33")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T12:08:29")
>>>>>>> 880c7375185ff9e43759d691f5112f5fef3ca183
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Float> examinationFee;
    public static volatile SingularAttribute<Payment, Appointment> appointmentId;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Integer> id;

}