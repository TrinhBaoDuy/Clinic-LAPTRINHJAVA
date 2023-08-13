package com.owen.pojo;

import com.owen.pojo.Appointment;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-13T21:32:29")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Float> examFree;
    public static volatile SingularAttribute<Payment, Appointment> appointmentId;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Integer> id;

}