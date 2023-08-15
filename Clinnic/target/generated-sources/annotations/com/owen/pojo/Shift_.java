package com.owen.pojo;

import com.owen.pojo.ScheduleDetail;
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
@StaticMetamodel(Shift.class)
public class Shift_ { 

    public static volatile SingularAttribute<Shift, String> name;
    public static volatile SingularAttribute<Shift, Date> start;
    public static volatile SingularAttribute<Shift, Date> end;
    public static volatile SingularAttribute<Shift, Integer> id;
    public static volatile SetAttribute<Shift, ScheduleDetail> scheduleDetailSet;

}