package com.owen.pojo;

import com.owen.pojo.ScheduleDetail;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T21:02:49")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-18T09:41:12")
>>>>>>> 47c459b951f00ebb0d86db3ef722d1b491dc92d5
@StaticMetamodel(Shift.class)
public class Shift_ { 

    public static volatile SingularAttribute<Shift, String> name;
    public static volatile SingularAttribute<Shift, Date> start;
    public static volatile SingularAttribute<Shift, Date> end;
    public static volatile SingularAttribute<Shift, Integer> id;
    public static volatile SetAttribute<Shift, ScheduleDetail> scheduleDetailSet;

}