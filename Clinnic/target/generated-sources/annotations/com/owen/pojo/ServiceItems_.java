package com.owen.pojo;

import com.owen.pojo.Appointment;
import com.owen.pojo.Service;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T16:16:21")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T13:35:14")
>>>>>>> 6c6d327f7ecbcf3c2b677a47b4d6789888b7b5fc
@StaticMetamodel(ServiceItems.class)
public class ServiceItems_ { 

    public static volatile SingularAttribute<ServiceItems, Date> dateSer;
    public static volatile SingularAttribute<ServiceItems, Integer> id;
    public static volatile SingularAttribute<ServiceItems, Service> serviceId;
    public static volatile SingularAttribute<ServiceItems, Appointment> appoId;

}