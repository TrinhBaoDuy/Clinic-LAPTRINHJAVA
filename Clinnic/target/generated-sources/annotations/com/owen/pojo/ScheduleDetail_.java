package com.owen.pojo;

import com.owen.pojo.ScheduleClinic;
import com.owen.pojo.Shift;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-14T14:36:31")
@StaticMetamodel(ScheduleDetail.class)
public class ScheduleDetail_ { 

    public static volatile SingularAttribute<ScheduleDetail, Date> dateSchedule;
    public static volatile SingularAttribute<ScheduleDetail, Shift> shiftId;
    public static volatile SingularAttribute<ScheduleDetail, Integer> id;
    public static volatile SingularAttribute<ScheduleDetail, ScheduleClinic> scheduleId;

}