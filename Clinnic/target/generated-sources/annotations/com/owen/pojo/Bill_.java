package com.owen.pojo;

import com.owen.pojo.Appointment;
import com.owen.pojo.Payment;
import com.owen.pojo.Tienkham;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-21T16:54:25")
@StaticMetamodel(Bill.class)
public class Bill_ { 

    public static volatile SingularAttribute<Bill, Integer> payMoney;
    public static volatile SingularAttribute<Bill, Tienkham> tienkham;
    public static volatile SingularAttribute<Bill, String> id;
    public static volatile SingularAttribute<Bill, Payment> payId;
    public static volatile SingularAttribute<Bill, Appointment> appoId;

}