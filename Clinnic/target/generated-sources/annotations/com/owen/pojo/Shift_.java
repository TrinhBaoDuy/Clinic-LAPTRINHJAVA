package com.owen.pojo;

import com.owen.pojo.ScheduleDetail;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T16:16:21")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T13:35:14")
>>>>>>> 6c6d327f7ecbcf3c2b677a47b4d6789888b7b5fc
@StaticMetamodel(Shift.class)
public class Shift_ { 

    public static volatile SingularAttribute<Shift, String> name;
    public static volatile SingularAttribute<Shift, Date> start;
    public static volatile SingularAttribute<Shift, Date> end;
    public static volatile SingularAttribute<Shift, Integer> id;
    public static volatile SetAttribute<Shift, ScheduleDetail> scheduleDetailSet;

}