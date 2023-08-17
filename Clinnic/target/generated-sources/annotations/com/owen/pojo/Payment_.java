package com.owen.pojo;

import com.owen.pojo.Appointment;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T16:16:21")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T13:35:14")
>>>>>>> 6c6d327f7ecbcf3c2b677a47b4d6789888b7b5fc
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Float> examinationFee;
    public static volatile SingularAttribute<Payment, Appointment> appointmentId;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Integer> id;

}