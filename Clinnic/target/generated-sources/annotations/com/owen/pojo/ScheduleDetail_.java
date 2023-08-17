package com.owen.pojo;

import com.owen.pojo.Shift;
import com.owen.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T16:16:21")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T13:35:14")
>>>>>>> 6c6d327f7ecbcf3c2b677a47b4d6789888b7b5fc
@StaticMetamodel(ScheduleDetail.class)
public class ScheduleDetail_ { 

    public static volatile SingularAttribute<ScheduleDetail, Date> dateSchedule;
    public static volatile SingularAttribute<ScheduleDetail, Shift> shiftId;
    public static volatile SingularAttribute<ScheduleDetail, User> personnelId;
    public static volatile SingularAttribute<ScheduleDetail, Integer> id;
    public static volatile SingularAttribute<ScheduleDetail, Short> status;

}