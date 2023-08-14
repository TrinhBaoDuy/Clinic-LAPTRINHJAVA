package com.owen.pojo;

import com.owen.pojo.ScheduleDetail;
import com.owen.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-14T11:55:37")
@StaticMetamodel(ScheduleClinic.class)
public class ScheduleClinic_ { 

    public static volatile SingularAttribute<ScheduleClinic, Integer> id;
    public static volatile SetAttribute<ScheduleClinic, ScheduleDetail> scheduleDetailSet;
    public static volatile SingularAttribute<ScheduleClinic, User> userId;
    public static volatile SingularAttribute<ScheduleClinic, Short> status;

}