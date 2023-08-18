package com.owen.pojo;

import com.owen.pojo.Shift;
import com.owen.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T21:02:49")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-18T09:41:12")
>>>>>>> 47c459b951f00ebb0d86db3ef722d1b491dc92d5
@StaticMetamodel(ScheduleDetail.class)
public class ScheduleDetail_ { 

    public static volatile SingularAttribute<ScheduleDetail, Date> dateSchedule;
    public static volatile SingularAttribute<ScheduleDetail, Shift> shiftId;
    public static volatile SingularAttribute<ScheduleDetail, User> personnelId;
    public static volatile SingularAttribute<ScheduleDetail, Integer> id;
    public static volatile SingularAttribute<ScheduleDetail, Short> status;

}