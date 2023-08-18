package com.owen.pojo;

import com.owen.pojo.Medicine;
import com.owen.pojo.Prescription;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-17T21:02:49")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-18T09:41:12")
>>>>>>> 47c459b951f00ebb0d86db3ef722d1b491dc92d5
@StaticMetamodel(PrescriptionItem.class)
public class PrescriptionItem_ { 

    public static volatile SingularAttribute<PrescriptionItem, String> instructions;
    public static volatile SingularAttribute<PrescriptionItem, Prescription> prescriptionId;
    public static volatile SingularAttribute<PrescriptionItem, Integer> quantity;
    public static volatile SingularAttribute<PrescriptionItem, Medicine> medicineId;
    public static volatile SingularAttribute<PrescriptionItem, Integer> id;

}